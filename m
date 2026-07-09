Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846054D9915
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618666; cv=none; b=vAatmKOr1XCcoAhWYBuJQTGiUtLE4GUmz8r1fKaZLo3amv0ipKWyUdELQGGMWqCtTvD6Ii2kQFP8sL8T9guikIwtfxAdbTDGVCY4AuJu6yM3zuAnrOZfjL/pfYzU6x44PXvkBJkiDOKbv0oWrXObh5S+jg4DPZHEHGNQ9HwFlcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618666; c=relaxed/simple;
	bh=x5Oa2695GZB1ZXLlaaZEwEGWKhZwosNiajRfap4Pw1g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=COM5fVINWkvy7Cja+yLb/ybt2ClRKTXVAiUGK7sPgvySc0/MQaTgnzro4jj+YbbyBycscD6/ZVtXJmbVFAvKyHeurZeHJRLgZL7+pM6uppmxPBx2Ohq8HAuvR3KJAenAyRHFVbYxOO7zE1s9hHy8XajqAooCmaI1cL9cYtvO+hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkQNj0hR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkQNj0hR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FF61F000E9;
	Thu,  9 Jul 2026 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618665;
	bh=1bHR40rnEJLPmBSyIjzM3C57ws+PIQo7glSkhTtwPmE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YkQNj0hR0EDmt8OQC0GQfi6Cov9nTI9+Bvq26e+vPxdW0UzueSQj9+/YGkThQD/BD
	 BCpa7Iypgo4UiK/V56/3/KqXH6kqD6GECpLRJ/mqJjQ6sg2dOB4IxL/r7vb/soGrJ0
	 ujEq8VbRDEB1hA6Ons2ri/s4ns6THMsGFBwO8Gif5j7nR77Qmgy5Ros4wmo4uJPl25
	 p9Sm21VUvVVcVVXx+h7/a01fB26+qHGjlh8oAljeIBefjMMuny+ahDhk6TWkHD8OJX
	 TsQKPeKwsjZd8Rggt9liRzH7O9AaHdJSYI5uoePcvsg4sSht+4B8Jl91V/Nm88yS5e
	 cFTqynM9E26RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 5/7] ipmi: ls2k: Relax the dependency to its mfd
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260710-ls2kbmc-mod-v3-5-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-5-ef718636e78e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:37:44 +0000
Message-Id: <20260709173745.01FF61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message incorrectly claims the change allows the MFD =
core driver to be compiled as a module, but the target config is a boolean.

Pre-existing issues:
- [High] ipmi_si_ls2k_init() ignores the return value of platform_driver_re=
gister() and unconditionally sets ls2k_registered =3D true.
- [High] The MFD driver dynamically mutates a shared static global `mfd_cel=
l` array using a stack pointer, violating MFD subsystem rules and causing a=
 data race.
- [High] The driver executes a massive busy-wait of up to 13 seconds inside=
 `stop_machine()`, triggering hard lockups.
--

--- Patch [5]: [PATCH RFC v3 5/7] ipmi: ls2k: Relax the dependency to its m=
fd driver ---
commit 8c0e83d6cff2cc10a75154a2292052f88af85328
Author: Miao Wang <shankerwangmiao@gmail.com>

ipmi: ls2k: Relax the dependency to its mfd driver

This commit changes the dependency of the IPMI driver on its MFD core
driver from select to imply. This is intended to allow the MFD driver to
be built as a module while the IPMI driver remains built-in or part of
ipmi_si.

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
Is this description accurate regarding compiling the MFD driver as a module?
Looking at drivers/mfd/Kconfig, MFD_LS2K_BMC_CORE is defined as a bool,
meaning it can only be built-in (=3Dy) or disabled (=3Dn). Since a bool
cannot be compiled as a module, will this change actually allow modular
builds of the MFD driver?

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

[Severity: High]
This is a pre-existing issue, but does ipmi_si_ls2k_init() properly
handle registration failures?

drivers/char/ipmi/ipmi_si_ls2k.c:ipmi_si_ls2k_init() {
    platform_driver_register(&ipmi_ls2k_platform_driver);
    ls2k_registered =3D true;
}

If resource constraints like OOM cause platform_driver_register() to fail,
ls2k_registered is still set to true. During module unload or driver
shutdown, ipmi_si_ls2k_shutdown() checks this flag and calls
platform_driver_unregister() on an unregistered driver, which can trigger
a driver core WARNING.

[Severity: High]
This is a pre-existing issue, but does the MFD driver dynamically mutate a
shared global cell array using a stack pointer?

drivers/mfd/ls2k-bmc-core.c:
static struct mfd_cell ls2k_bmc_cells[] =3D {
...

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

MFD subsystem rules mandate that cell arrays must be static const. Because
this array is not const and is mutated at runtime with a local stack
variable pointer (pd), concurrent PCI probes of the BMC device could
overwrite each other's pointers in the global array. This could cause
mfd_add_devices() to clone garbage or freed stack memory from another
thread.

[Severity: High]
This is a pre-existing issue, but does the driver execute a massive
busy-wait inside stop_machine()?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
}

Inside the callback:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    for (i =3D LS7A_BAR0_CHECK_MAX_TIMES; i > 0 ; i--) {
        if (!ls2k_bmc_bar0_addr_is_set(parent))
            break;
        mdelay(1);
    }
    ...
    /* Waiting for U-Boot and DDR ready */
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
}

stop_machine() disables interrupts on all CPUs. When an interrupt schedules
the BMC reset work, ls2k_bmc_recover_pci_data() is called in atomic context
with IRQs disabled system-wide. The callback executes a 2-second polling
loop and then an unconditional 10-second wait. Halting all CPUs with
interrupts disabled for up to 13 seconds can trigger NMI hard lockup panics
or RCU stalls.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-ls2kbmc-mo=
d-v3-0-ef718636e78e@gmail.com?part=3D5
