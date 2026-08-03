Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643E840DB5B
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776949; cv=none; b=NaaU2NV7DK2g/rVoE+7jNOTgfedreYKTAyV9qYXUdObyy34n3PZpOzppdPURxIuHDKprPrph1wagxaZcbFJE9Bcer/dnY3t6k4ErrjU7tucZYj6U/hFXGIQjdT9b5ZRhCXCfAhh4MOZZtE2CInQGBTmhRZQbc+d31FEF0VzpxOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776949; c=relaxed/simple;
	bh=DKjednXGnVJgFmeuCccit11RghFTY0POtD9YPyZeoEk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JMaVrNTkPiH/YWFvxpoH8PeE/oW7SrNhmrJnAKWKDLW2Yud4l9IIQo8TIoIUDIPu4nQ0JhQuRZKbpRKc1uzz9wu/Xfs7p5fIoDfctPSoSubQzIpjbWHD7gXUFqxL456WmeDTv3rcIARPOCccbSNUItlLV21MmG7hvjgdOAapbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUEKKrkg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUEKKrkg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBE61F00A3A;
	Mon,  3 Aug 2026 17:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776948;
	bh=OaNkzvz0ViU+h1RfDZTr8V/kxBFRFGS//CIuNaSOsFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nUEKKrkgAW5ppriHqobkqxffnvtv+L+6M5EUgOLgCKbCA/OEIEzFjX9lyhagWEwN7
	 tuCZ7aZoEASu+4G6jeeqtwSbz9torZTg4o95QFQzDp33lW99Yo3pGo5AN3a3w+KWcr
	 AnMKFcvapUEJAcX7gQ2klHB5Z8MbkM81sL1+d/4MKyFtILtx2UntKzvr+Z7m1Lqwwu
	 0tIFMIgQoW9GH9gQsQYrG+wXdT05cosWCmUUqD+OGiWL74Gi3gLAzAeoPwOPQnvuK8
	 MIEE9G2tnBBIwx3BwMn86wn6AdAo/wPFk0W6C2dUi2kZEzAsoLMbUI/QaTnS4X01s3
	 5NQHw/ZDGNXaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-5-e6bc5cdd9a93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 17:09:06 +0000
Message-Id: <20260803170907.DBBE61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Blind dereference of platform device resources without checking if=
 resources exist, leading to a potential NULL pointer dereference.
--

--- Patch [5]: [PATCH RFC v5 5/7] ipmi: ls2k: Relax the dependency to its m=
fd driver ---
commit 41124ab927989929db3ae83837ad0e4e74e88d2e
Author: Miao Wang <shankerwangmiao@gmail.com>

ipmi: ls2k: Relax the dependency to its mfd driver

This commit changes the Kconfig dependency for the Loongson-2K IPMI
interface from select to imply for MFD_LS2K_BMC_CORE. This allows
the IPMI driver to be compiled independently of the MFD driver.

> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 669f760001974..f456e3e894169 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
[ ... ]
> @@ -87,7 +87,7 @@ config IPMI_IPMB
>  config IPMI_LS2K
>  	bool 'Loongson-2K IPMI interface'
>  	depends on LOONGARCH
> -	select MFD_LS2K_BMC_CORE
> +	imply MFD_LS2K_BMC_CORE

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under
review, but since this change allows the IPMI driver to probe independently
of the MFD driver, I noticed a potential regression with resource handling.

Looking at ipmi_ls2k_probe() in drivers/char/ipmi/ipmi_si_ls2k.c:

    io.addr_data =3D pdev->resource[0].start;
    io.regspacing =3D resource_size(&pdev->resource[0]);

Does this code blindly dereference the platform device resources without
checking if they exist?

If the platform device is instantiated without resources (such as manually
via sysfs, or due to a misconfigured MFD core or device tree), would
pdev->resource be NULL and cause a kernel panic?

Would it be safer to verify pdev->num_resources > 0 or use
platform_get_resource() before accessing pdev->resource[0]?

>  	help
>  	  Provides a driver for Loongson-2K IPMI interfaces.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-ls2kbmc-mo=
d-v5-0-e6bc5cdd9a93@gmail.com?part=3D5
