Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2A447D458
	for <mfd@lists.linux.dev>; Thu, 27 Aug 2026 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841559; cv=none; b=YMC1hSOl/n1jqEgVBx9p52hwxOuCy2fw5HwJIGkMagzrRrpuaKTFT8DVsP1NfBVdOE6VJY515oT5N4qjYWS8wk0Mx5aeLyjiATHZsivd/Z1S5TXO/yCA8c0kCaMyvUy4Xf71Uq7DcxhL0pPf2JpgnPnHvkj6NgrM/q50fW5moic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841559; c=relaxed/simple;
	bh=dGyzb014fiPmNXSLn5A0CV5Vjfcj/Xvj1o9kLErbULA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ttASQjLugTuQmftW5XrLB5V99o7KjbfjsjhFURz2yTORo93E5QdPk1i3nFj3J3YEkGS9mkRMu5iH8Y7qdxle9ay1JAQBooRkGkndQ3mf8cn5W92fwlXMWxS/cHCEVTzgpECoitnVXorIVq06JkZanwB1dIuEFiPveMHFNKK1o20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Im9ZLPv2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Im9ZLPv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527CD1F00A3A;
	Thu, 27 Aug 2026 14:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787841550;
	bh=zjregPGyT6S8OpRAIPdDZN9AGFsYsinvkxgm859S3RI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Im9ZLPv2B9mKUyFPvp766fjAoOPS3jHWZlOfhBmPqAEm4p0O3Pi04wIitBoSONIUD
	 W3xMhCk+TqOrWyz3zzGHDKBLqneotstiVYZ8ctAtKTDRETdJo7AACqccpX6rouLwSz
	 7n83BQFcsAwkG+z/e9ru2JGxk1eOlY1sas4HIkkGunRv575GYU6FHqq6QsbojSeVtX
	 riZkh9GQ13O0s6KokM/Krk8HEWtORwMy3nbNfcoGNR/2qv55mvm/mShDWctYNDBpgr
	 djsyrBp/6j9dpn23U1vDvzPqqlVAF218vTEMbQRIM1h1zgjGV31EUjegfeOpQId+Cj
	 /+sMcKQM7wA9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: Fix MAX77705 dependency on regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260827-deps-reg-max77705-v1-1-c83a74d3d428@ixit.cz>
References: <20260827-deps-reg-max77705-v1-1-c83a74d3d428@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 14:39:09 +0000
Message-Id: <20260827143910.527CD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PMIC driver registers an MFD cell for the charger, but the cha=
rger driver is an independent I2C driver, causing dead code and IRQ conflic=
ts.
--

commit a9e038f4576add179799c718b71948bb74197bab
Author: David Heidelberg <david@ixit.cz>

mfd: Fix MAX77705 dependency on regmap

This commit adds missing dependencies for REGMAP_IRQ and REGMAP_I2C to the
MFD_MAX77705 Kconfig entry to fix a build error in the max77705 driver.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e4fd4572472f9..857ca3bb0d5bf 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1006,6 +1006,8 @@ config MFD_MAX77705
>  	depends on I2C
>  	select MFD_CORE
>  	select MFD_SIMPLE_MFD_I2C
> +	select REGMAP_I2C
> +	select REGMAP_IRQ

[Severity: High]
This is a pre-existing issue, but while reviewing this dependency fix, I
noticed an architectural conflict between the MAX77705 MFD parent and its
charger child device.

The PMIC driver registers an MFD cell for the charger in max77705_devs:

    MFD_CELL_OF("max77705-charger", NULL, NULL, 0, 0, "maxim,max77705-charg=
er"),

However, the charger driver is registered as an independent I2C driver rath=
er
than a platform driver:

    module_i2c_driver(max77705_charger_driver);

Will this cause the MFD core's instantiated platform device to become dead
code since it will never be bound?

Additionally, does this setup cause an IRQ conflict? At boot time, both the
PMIC driver and the charger I2C driver probe and attempt to request the same
physical IRQ exclusively. In max77705_charger_probe(), the charger driver
requests it directly:

    ret =3D devm_regmap_add_irq_chip(chg->dev, chg->regmap, i2c->irq,
                                   IRQF_ONESHOT, 0,
                                   chip_desc, &irq_data);

Because IRQF_SHARED is not used and the MFD parent also exclusively requests
i2c->irq, whichever driver loads second will fail with an -EBUSY error.
Could this be addressed by converting the charger driver to a standard
platform driver that consumes resources provided by the MFD parent?

>  	help
>  	  Say yes here to add support for Maxim Integrated MAX77705 PMIC.
>  	  This is a Power Management IC with Charger, safe LDOs, Flash, Haptic

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-deps-reg-m=
ax77705-v1-1-c83a74d3d428@ixit.cz?part=3D1
