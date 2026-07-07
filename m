Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF43238D27
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 19:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453006; cv=none; b=nYRD2nwRyr9oLIkHMOIwJ+dCzuBFnZLSNI+Z6nl6DWYKnH/yv9u/Qha2KLMMbNZz8XARHnwFVkU62Qw1QnS1xzgZprBqnz+zBThgIlW2QbYiP2pFvqcAgkNngmALZe/8yfMILfs+jGkUMulQ6Ys0JneSzhu7G92czEufw62ehBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453006; c=relaxed/simple;
	bh=0SY6R1WaV1tiXCXzWVF6E5ywNeo3EKExoBVvsMsTGnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QUyikc2msUTCKl+cPFkN1o122TimMAZjxnIcowk/+XG34SHHortwmYk+4MpyOmJwCNDAu39jYMy/6/c3bFJUHdozfEk+1yYtmPuEXklhd5jFSguaL8zsj5zIfl5IiSmFgSvjfZiiuwzh9vuatD2PaWgG3ZWEwJr1YZcg2AO8O5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2NyKw9q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2NyKw9q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE331F000E9;
	Tue,  7 Jul 2026 19:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783453004;
	bh=6Q6qJwLmZhJVJrMZnTs3N35LGdvlk/wZzY8Iwngq5ng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b2NyKw9qiOV2umVRkyLfpuLXtuhizc2DiWQeuwGzQ4861Wc5hSX9P9iUrH16X0qlI
	 /pZka0MuhyTxZKiZxMvEk82lR8at0SDIYkEyYWcUopDiHEZYcT/NN+AztaJK6PfoVQ
	 XiT36rWh/KUfCXY5vVLEGoxu112sh1sehuQzMdsWX+R5fXW0DObYpCNQDKlh1c+Obo
	 ToescdRkhGTuHPuzF/2FxTb9NVML2ZXZ48gD8msTIeiqAWPqXT/gVZbl1iw2630QfM
	 VRkRTn2dcs6w1tjRQYLjeclgNJDssofH1KANCXrAU1zjbGUfrvprWL42BQsrPOhmtl
	 vVZ/eXo1Dqesw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/5] mfd: ls2kbmc: able to compile as a module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260708-ls2kbmc-mod-v1-4-c344bf5defa3@gmail.com>
References: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
 <20260708-ls2kbmc-mod-v1-4-c344bf5defa3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 19:36:43 +0000
Message-Id: <20260707193644.7AE331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] A dependent boolean Kconfig symbol silently forces this driver b=
ack to built-in, defeating the patch's purpose.
- [Low] The commit message fails to follow the mandatory MFD subsystem capi=
talization rules.

Pre-existing issues:
- [High] Missing Module Cleanup / Use-After-Free
- [High] Global mfd_cells array is mutated dynamically with stack pointers
- [High] Immediate unregistering of GSI mapping breaks the GPIO interrupt.
- [High] Direct use of memcpy() on __iomem pointers instead of memcpy_fromi=
o().
--

--- Patch [4]: [PATCH RFC 4/5] mfd: ls2kbmc: able to compile as a module ---
commit 06b671aceea4e266ddc107c8d7f73d19e48b4e8a
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: able to compile as a module
   =20
Make ls2kmc able to be compiled as a module

> mfd: ls2kbmc: able to compile as a module

[Severity: Low]
The MFD subsystem rules require the description after the prefix to be
capitalized. Could the subject be updated to capitalize "able" (e.g.,
"mfd: ls2kbmc: Able to compile as a module")?

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782b..a7a9f97af248c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2494,7 +2494,7 @@ config MFD_LOONGSON_SE
>  	  which will forward them to the corresponding engine.
> =20
>  config MFD_LS2K_BMC_CORE
> -	bool "Loongson-2K Board Management Controller Support"
> +	tristate "Loongson-2K Board Management Controller Support"

[Severity: Medium]
Does this achieve the intended goal if IPMI_LS2K is enabled?

IPMI_LS2K in drivers/char/ipmi/Kconfig is a boolean config that selects
MFD_LS2K_BMC_CORE. If a user enables IPMI_LS2K=3Dy, Kconfig will silently f=
orce
MFD_LS2K_BMC_CORE to be built-in, ignoring the choice to compile as a modul=
e.

[Severity: High]
This is a pre-existing issue, but enabling module compilation exposes a mis=
sing
cleanup path. Looking at drivers/mfd/ls2k-bmc-core.c, ls2k_bmc_init()
initializes a work item:

INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);

However, the driver struct ls2k_bmc_driver lacks a .remove callback, and th=
ere
is no devm action added to cancel this work.

If the module is unloaded while the work is scheduled, will this result in a
use-after-free when the work executes and attempts to jump to unmapped modu=
le
memory?

[Severity: High]
This is a pre-existing issue, but the MFD subsystem requires cell arrays to=
 be
static const. In drivers/mfd/ls2k-bmc-core.c, the global array ls2k_bmc_cel=
ls
is mutated dynamically with stack pointers during ls2k_bmc_probe():

static struct mfd_cell ls2k_bmc_cells[] =3D {
...
ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);

Since pd is allocated on the stack, doesn't this leave a dangling pointer in
the global array once the probe function returns, potentially leading to me=
mory
corruption or data races if multiple devices are probed?

[Severity: High]
This is a pre-existing issue, but does immediate unregistering of the GSI
mapping break the GPIO interrupt? In drivers/mfd/ls2k-bmc-core.c,
ls2k_bmc_init() calls:

acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
return ret;

Since this is called immediately after requesting the IRQ, wouldn't it disp=
ose
of the IRQ mapping and cause hardware interrupts to be ignored?

[Severity: High]
This is a pre-existing issue, but is it safe to use standard memcpy() direc=
tly
on an __iomem pointer? In drivers/mfd/ls2k-bmc-core.c, ls2k_bmc_parse_mode()
does:

const void __iomem *mode_base;
...
memcpy(mode_buf, mode_base, sizeof(mode_buf) - 1);

Standard C library routines do not perform hardware-specific I/O barriers.

Should this use memcpy_fromio() instead to prevent I/O access violations?

>  	depends on PCI && ACPI_GENERIC_GSI
>  	select MFD_CORE
>  	help

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v1-0-c344bf5defa3@gmail.com?part=3D4
