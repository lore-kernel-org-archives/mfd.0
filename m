Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A71834753B
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459508; cv=none; b=proTswXuhUz29TvvPVqvjspftgxvCFj+nqCbolthzno1oiZwnNXHjxQb8UpRIetee97F0/Kvg35ieOQQ/lFzqWzgCV/rWsuSvCfWIcXcylExuqWay6K3xXlEAJtu1cVIksREccSPxl0rjp1vPeJoOBjqN8cQn6ZiNPDbPveejBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459508; c=relaxed/simple;
	bh=Ym7l06WpQ/N9pZnrF5qlJwW4FhZFhm4Nivkrsr38Wgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n7uVDqVc4GIQXLMT8XpAEJehOSHXu3WEGsx7q3Dtyr1vHoX80FUUYiOuzFX/jDp/g1svo04FNFpFlJg4d5A6AuLRUmRRrwZs1CVAOiMB+4O0yWCwV2KOUJwB8HdizL0IjlMYoznBmK/Gl/tXbI2SoKMHwxum4dn+XIvF6G8fUbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/SIt9Rw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/SIt9Rw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5F61F000E9;
	Tue,  7 Jul 2026 21:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783459507;
	bh=A1/q77X7IrI5QxNTme6UQJvg0qlUXkDKeyne8QkpjhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i/SIt9RwhiLOnsy+IvE+/uEJsjbQYoCdazl3H+renRBiOj5oGSXuPY2i5G7JsWlES
	 /O0dyx5kEMWxy42/wZN7v/OmrsBUcsEObmfYbzsTLVkenl+WlnjRH+6XMrfx0GleKR
	 z/K1OkYF6NSlgjwZwT3Lo+eKOBclSzYrIRRJMIfqmkIHihWFyRD9Co7tIruK61L+a1
	 jhUvNpTKhejwTwMlL/xmdfrVWbFM4kd5EjrOvaeg/ddBAfgeUiYZb+aAX8XZJ3kmnu
	 6w/Yja+bSJBlxbmEQOaRm1GLdIEbXxJ9k6odeWgpjbs00Zyz3lKrzIDDwI1bTFstGG
	 vpirMtTUJFcbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260708-ls2kbmc-mod-v2-5-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-5-2afdd1741766@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 21:25:06 +0000
Message-Id: <20260707212506.ED5F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately claims that changing `select` to=
 `imply` allows the MFD driver to be compiled as a module, but `MFD_LS2K_BM=
C_CORE` is defined as a `bool`.
--

--- Patch [5]: [PATCH RFC v2 5/7] ipmi: ls2k: Relax the dependency to its m=
fd driver ---
commit d49c3c402e5644d151c1cade80b84a38875689e0
Author: Miao Wang <shankerwangmiao@gmail.com>

ipmi: ls2k: Relax the dependency to its mfd driver

This commit changes the IPMI_LS2K dependency on MFD_LS2K_BMC_CORE from
select to imply. This prevents forcing the MFD driver to be built-in when
it might be undesirable.

> ipmi: ls2k: Relax the dependency to its mfd driver
>
> There is no strong dependency between the IPMI driver and its mfd
> driver. Although the IPMI driver will not work without the mfd driver,
> it is not a hard dependency. The IPMI driver can actually be compiled
> without the mfd driver, and it will just fail to probe. When the mfd
> driver is loaded, the IPMI driver will probe successfully. Therefore,
> the dependency of the IPMI driver on its mfd driver should be relaxed
> to "imply" from "select". This will allow the mfd driver to be compiled
> as a module and the IPMI driver to be compiled as a part of the ipmi_si
> module.

[Severity: Medium]
Is this description accurate regarding the module compilation?

Looking at drivers/mfd/Kconfig, MFD_LS2K_BMC_CORE is defined as a bool=20
rather than a tristate:

config MFD_LS2K_BMC_CORE
	bool "Loongson-2K Board Management Controller Support"
	depends on PCI && ACPI_GENERIC_GSI

Since a boolean Kconfig symbol can only be built-in or disabled, it cannot=
=20
be compiled as a module. Does the MFD driver Kconfig need to be converted=20
to a tristate, or should the commit message be updated to clarify that this=
=20
change simply prevents forcing the MFD driver to be built-in?

> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> index 669f760001974..f456e3e894169 100644
> --- a/drivers/char/ipmi/Kconfig
> +++ b/drivers/char/ipmi/Kconfig
> @@ -87,7 +87,7 @@ config IPMI_IPMB
>  config IPMI_LS2K
>  	bool 'Loongson-2K IPMI interface'
>  	depends on LOONGARCH
> -	select MFD_LS2K_BMC_CORE
> +	imply MFD_LS2K_BMC_CORE
>  	help
>  	  Provides a driver for Loongson-2K IPMI interfaces.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v2-0-2afdd1741766@gmail.com?part=3D5
