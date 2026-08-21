Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BD33D6CD7
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 09:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304924; cv=none; b=Sy517wjNLRc+84OjqTOTCNA5CJrB1ORhp/k7aQMbIcddcyj265od66fDzjxgH/Rp1RrYqemqBjopbqiWozln77NTNyWB4KUdNnVWW6kpw8vK9UOsjZwrRCndrnhdGzRU6wQ4FiBrB7Z5wDIzJjgoMIkiVwVnM/ZU/BDOiwD3BxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304924; c=relaxed/simple;
	bh=vIR4ZJuDGBXabUFjAsVY7jmb3n2GHjNff9Fki/G4M2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e4Uyjz8jfq63a4mAkW8vmujRxiOtqwO1qn5tkyhK7vq68tZCtLlDhHUQI1CqVGE5xsYD+9mkJOohKpomwDW4ZJgoAh0xK8YQ/BwRNdEbmc//SBes2Xs0ELvkYRHF0gX7R1IMuoMpRHx12ehPuoeFfmIsDV/B0ZJFsw3/lmk9uqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRQmPZeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRQmPZeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2248C1F00A3A;
	Fri, 21 Aug 2026 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787304916;
	bh=gNRyzFzNanJM6QoENKJwx2v9z2O3nlBY1KtOG/9Txl4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GRQmPZeAjOEbKo2RNVwkG0xVShhj4DwRvfpEkTTN4G85d416EigdWAv8RZJ74va9g
	 VNfFXJfnf5z/zufDolMkXiGfsSbG2QGSfWavp3Dip68/3Yed0ClvZ3IG/JJIZ5uL6F
	 etNjWltcZwmJc3Ui7rHK+0yYDWiVMqk4mz34tCxW/HdTCX2n8kxmXUaClbl/M09LoF
	 3EM9draGO3RCOWstTS3zDxD9XVDTw9EvyrgZJuEX6T/sk8HTYR//iwxocUmb2viQhr
	 TahNBAvfsjaWL/N5Nisn0IPWQBDN5W+FmtA0oRsJbqsszddJ5AH38vU7puw3IEz6Pq
	 llL8IAelEB45g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drivers/mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Triet Hoang" <triet.hoang.dev@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821092508.324787-1-triet.hoang.dev@gmail.com>
References: <20260821092508.324787-1-triet.hoang.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 09:35:15 +0000
Message-Id: <20260821093516.2248C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The commit message prefix uses 'drivers/mfd:' instead of the requir=
ed 'mfd: ' format.

Pre-existing issues:
- [High] Device teardown sequence disables PM runtime and clocks before unr=
egistering MFD child devices, leading to an external abort kernel panic.
--

--- Patch [1]: [PATCH] drivers/mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS() -=
--
commit f2c525c2ee807012f8f33d16a4bcbea747e75dcf
Author: Triet Hoang <triet.hoang.dev@gmail.com>

    drivers/mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
   =20
    Convert the deprecated SIMPLE_DEV_PM_OPS
    to DEFINE_SIMPLE_DEV_PM_OPS
    and pm_sleep_ptr().

>     drivers/mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

[Severity: Low]
This isn't a bug, but does this commit title violate the MFD subsystem nami=
ng
conventions? The standard format requires using mfd: <Driver>: for the
commit message prefix instead of drivers/mfd:.

> diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscad=
c.c
> index 068c25401c6cd..81f07a1d780c5 100644
> --- a/drivers/mfd/ti_am335x_tscadc.c
> +++ b/drivers/mfd/ti_am335x_tscadc.c
[ ... ]
> @@ -373,7 +373,7 @@ MODULE_DEVICE_TABLE(of, ti_tscadc_dt_ids);
>  static struct platform_driver ti_tscadc_driver =3D {
>  	.driver =3D {
>  		.name   =3D "ti_am3359-tscadc",
> -		.pm	=3D &tscadc_pm_ops,
> +		.pm	=3D pm_sleep_ptr(&tscadc_pm_ops),
>  		.of_match_table =3D ti_tscadc_dt_ids,
>  	},
>  	.probe	=3D ti_tscadc_probe,

[Severity: High]
This is a pre-existing issue, but does ti_tscadc_remove() cause a kernel pa=
nic
by disabling PM runtime before unregistering child devices?

When the module is unloaded, ti_tscadc_remove() drops the clock reference a=
nd
disables PM runtime:

    pm_runtime_put_sync(&pdev->dev);
    pm_runtime_disable(&pdev->dev);
    mfd_remove_devices(tscadc->dev);

When mfd_remove_devices() unbinds the ti_am335x_adc child driver, the child=
's
tiadc_remove() calls am335x_tsc_se_clr(). This issues a regmap_write() to t=
he
REG_SE MMIO register while the parent device's clock is already powered dow=
n,
which triggers an L3 interconnect error and kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821092508.3247=
87-1-triet.hoang.dev@gmail.com?part=3D1
