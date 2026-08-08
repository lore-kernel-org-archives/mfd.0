Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CC33AAF42;
	Sat,  8 Aug 2026 04:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786164730; cv=none; b=uZsh7bwybt6r8itPQSB6lX0XFsNijnTBjQcvhUBcTr0KNXPh62JiovM/AoDXkGTpw4CiJa07DeWIKV6graT356WLBMPEm1K119ePa689piBFAiRNBm8x//cVroWu1IbIHxbi//+xpx7Zav9TR+BGTk9LeVCiG6xFb0aieH3TIKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786164730; c=relaxed/simple;
	bh=hVHl5I5WWMiyZALjC7e4rLUd2+Duci9djigWAI2W1qI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZMtOi8yq9GU6fOVVkcngADQShGKEMjNZ+ppUCzmCdg1tkt6+ZHdQ9022bQtDLw99lX72HRCeuFShqrtOMBTN2gzFgbl8EJ6dgTMMQYk/bTlpU75fsbQ9reVwDBSGydXZO+SwXe1C4nPl533MGrH72gtiFpJJ9Rb5BmnyquBARLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSwXydfd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSwXydfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187941F00A3D;
	Sat,  8 Aug 2026 04:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786164729;
	bh=CzeaHneX3PYemZ9QoC6rngD+Spy99XbnyjcIsApEq04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OSwXydfdePHU9Z1paFyX7Vdzw40WDxU8WaOequz/AID/H5HcNMJKDcUqqC1kS5rd2
	 tbJ4BqHUnDn4vsn4QG+4vH5b6AetCnd1gYk7B4KEdhcP8R35xOCsFmHwOeKVoOVLJO
	 Xb5lLmuIvcYJTPIcty0vXrFAiizDgnuyIFT+UO/RCL7zQ8E1xstlgXN5scO4MUPyl6
	 jugAFf/W+oWjg3bzVyn1rl4jV82w4RGEb5d0VkwKVeFaFgBHg2fHBIfxPRHa6taIIz
	 wGmNTpDVSyT0Cva5FAZP1cXUgW3FAyHS7YAqz2oiPqRR5O4kpboAVkyptaWcpS0C5/
	 sAdWHtFi8yk7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 2/4] mfd: ac200: Add X-Powers AC200 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260806-submit-acx00-of-dynamic-v1-v4-2-9bf2f7441632@gmail.com>
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
 <20260806-submit-acx00-of-dynamic-v1-v4-2-9bf2f7441632@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:52:08 +0000
Message-Id: <20260808045209.187941F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The AC200 driver resides in `drivers/mfd/` but fails to instantiate=
 any child devices, violating MFD subsystem guidelines.
--

--- Patch [2]: [PATCH net-next v4 2/4] mfd: ac200: Add X-Powers AC200 suppo=
rt ---
commit c3a5907d2032837edd51cf4fc8b2fb05a159740a
Author: James Hilliard <james.hilliard1@gmail.com>

mfd: ac200: Add X-Powers AC200 support
   =20
This patch introduces support for the X-Powers AC200 mixed-signal companion=
 IC.
It provides shared register map access over I2C to be used by individual
function drivers. The core driver handles initialization, clock configurati=
on,
and resetting of the chip.

> diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> new file mode 100644
> index 0000000000000..798bb4173b14b
> --- /dev/null
> +++ b/drivers/mfd/ac200.c
[ ... ]
> +static int ac200_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG,
> +			   AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

[Severity: Low]
Should this driver reside in drivers/mfd/ if it doesn't instantiate any chi=
ld
devices?

The MFD subsystem guidelines explicitly state that placing a driver in
drivers/mfd/ is only permitted for devices that register multiple children
via the MFD API or of_platform_populate(). Here, ac200_probe() completes
successfully without calling devm_mfd_add_devices() or
devm_of_platform_populate().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-submit-acx=
00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com?part=3D2
