Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E97430FF1D
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 21:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459655; cv=none; b=JWXkXm5QjzexUOdNTTgdeGQiVwHxh+E2SYprI8DVpUP/apy/rOA9VtiXXjfZmEWdY2Yu7rNADVfzLivXgJ6KGvsE857ukVAqATmI/a5uVL+6KJzX0sYUHKAJee0NL6K187/kKTc1djNUn5QTU6Lmj+VkmLy75ZFx2t/9rXWXxso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459655; c=relaxed/simple;
	bh=lcxMpex3/76GsMC05gSy6Sj5pulUagJGxridp0qbK3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m/W+O7XYrDYXzQzUkXTYibMH75qE69YRSZTbVnB6fJsyu9MOyzAb8p6ELXaNasHuwWhrlIh95Dd58xoEH9Y2r8UIlaSrhrLrosU9X7MFujlVt+V+JKuozSdc9X6Zqwj+SIbzllKrZNUoo6ADPr+9j5+lZS8uzIdCf70Ns2VJE5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hk9Zz9IG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hk9Zz9IG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E591F000E9;
	Tue,  7 Jul 2026 21:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783459653;
	bh=2yNBTpm+AdgjQ6moec0yd/FHzkaTbFC/sNd5DqjWsn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hk9Zz9IGKyMG4cds4U5X9UasSDVS+n5eOoXK91EnJAS7eep0cHrqs8NyIOBS4iQHN
	 PR75PVSEHhVnDIS6wnak+AcenJmeK+Ia4a5bfaQKnYOAaOdOcw79FSlTklTgyxrJWB
	 vxGYyOgFMg5lBciZ5sCFAJIHfonPWFNKrE6+5zRVlrpFZbiLe5M0BMiGHHHh+hGh2A
	 nQC58MOyrE/ZhsDCrRgvMhtyTg5x74bDQIzhZEFblemOjbVRKrUkzkcI+zyl31gh6V
	 I4wbWneRuxKf0tkEnOTQfBvq6oB4dloeMF50AxcGFXXFphwIXMHmtEcxvfw7xYUSCn
	 jymqdeL/BiHDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 3/7] mfd: ls2kbmc: Redraw using exported
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260708-ls2kbmc-mod-v2-3-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-3-2afdd1741766@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 21:27:33 +0000
Message-Id: <20260707212733.86E591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The driver executes a massive 10-second busy-wait loop (`mdela=
y(10000)`) inside a `stop_machine` execution, causing a hard lockup.
- [High] The driver initializes and schedules a work item but does not prov=
ide a `.remove` callback or devres action to cancel it on unbind, leading t=
o a potential use-after-free.
- [High] The probe function dynamically mutates the global static `ls2k_bmc=
_cells` array using a stack-allocated pointer, violating MFD rules and risk=
ing a data race condition.
- [High] The driver unconditionally unregisters an ACPI GSI immediately aft=
er successfully requesting its IRQ, breaking the interrupt routing.
- [High] The shared interrupt handler lacks source verification, causing an=
y shared IRQ to spuriously trigger a 10-second system stall.
--

--- Patch [3]: [PATCH RFC v2 3/7] mfd: ls2kbmc: Redraw using exported funct=
ions ---
commit 262b4b899dbe26d6f3d0f812e42256a7beea8a22
Author: Miao Wang <shankerwangmiao@gmail.com>
Subject: mfd: ls2kbmc: Redraw using exported functions

This commit modifies the redraw trigger for the current VT. It switches
from using set_console(vt_move_to_console(...)) to using console_lock()
and update_screen() directly.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index b02e4955e9b04..a5465c42a77b8 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -310,7 +311,9 @@ static void ls2k_bmc_events_fn(struct work_struct *wo=
rk)
> =20
>  	if (IS_ENABLED(CONFIG_VT)) {
>  		/* Re-push the display due to previous PCI-E loss. */
> -		set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
> +		console_lock();
> +		update_screen(vc_cons[fg_console].d);
> +		console_unlock();
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but does this missing remove callback cause a
use-after-free?

The work structure is initialized inside devres-managed memory:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
    ...
}

But there is no remove callback to cancel it:

drivers/mfd/ls2k-bmc-core.c:
static struct pci_driver ls2k_bmc_driver =3D {
    .name =3D "ls2k-bmc",
    .id_table =3D ls2k_bmc_devices,
    .probe =3D ls2k_bmc_probe,
};

If the driver is unbound via sysfs while bmc_reset_work is queued or runnin=
g,
the devres framework will unregister the IRQ and free the ddata structure.
Without a remove function executing cancel_work_sync(), will the workqueue
execute ls2k_bmc_events_fn() and access the freed memory?

[Severity: High]
This isn't a bug introduced by this patch, but does the probe function muta=
te a
shared global array?

The global array is defined as non-const:

drivers/mfd/ls2k-bmc-core.c:
static struct mfd_cell ls2k_bmc_cells[] =3D {

And the probe function dynamically assigns a stack-allocated pointer to it:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

Although devm_mfd_add_devices() creates a copy of the data, the global array
retains the dangling stack pointer after probe() returns. If multiple insta=
nces
of this driver probe concurrently, could this cause a data race by overwrit=
ing
this shared global pointer?

[Severity: Critical]
This is a pre-existing issue, but does this stop_machine() call lock up the
system?

The recovery function executes a massive 10-second busy-wait loop:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    /* Waiting for U-Boot and DDR ready */
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

And this function is executed via stop_machine():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

The stop_machine() mechanism disables local interrupts and halts all CPUs in
the system to safely execute the callback. Does halting all CPUs with inter=
rupts
globally disabled for 10-12 seconds fatally hang the system and trigger NMI
watchdogs?

[Severity: High]
This isn't a bug introduced by this patch, but is the GSI mapping destroyed
while the IRQ is actively requested?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    ...
}

In ls2k_bmc_init(), the driver allocates an IRQ from a GSI using
acpi_register_gsi() and then claims it via devm_request_irq(). Does
unconditionally calling acpi_unregister_gsi() immediately after requesting =
it
dispose of the IRQ domain mapping and break the interrupt routing?

[Severity: High]
This is a pre-existing issue, but does the shared interrupt handler properly
verify its source?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    /* Skip interrupt in LS2K_BMC_INT_INTERVAL */
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }
    ...
}

The handler schedules hardware reset work unconditionally without reading a=
ny
hardware status register to verify if the BMC actually asserted the interru=
pt.
Since the PCIe and GPIO interrupts are registered with IRQF_SHARED, if any
other device shares this IRQ line, will its interrupts spuriously trigger t=
he
BMC reset sequence and repeatedly stall the system in stop_machine()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v2-0-2afdd1741766@gmail.com?part=3D3
