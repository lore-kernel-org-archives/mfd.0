Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B526023394D
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786370630; cv=none; b=bIBXHbs8YAiqcVK7oJQd4+9OiWsBTFvf+RkRHS43dUxVgo+PJusAQ/xzecbciE4ZSR1a+DvP0n11Lz0HVAyDhSp9QuOBhv8BY1VY4wN6XOJzG9SwMbLYllLBFb7+riSYiRb7JpEiAJBlef2bpWjfcqzA+I0Z1oeBFhqFaPO0f0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786370630; c=relaxed/simple;
	bh=A1cgGBzws433sLcX3kd9WvOLgZx4MZb1ANd0AVl2EO0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TIprZJ6GHgXsteIHda3LR75Dg813Cu+bgYdrDV7VAATTJFLSoeQT4g8FAYvnTMPIIboyd7/FmN7bd0vlAu99I6M9EMFCrfS44lWOsCwtmrOM2TvrsIwaV8PQOC76WOd6f2i1a4RXOQAoOuS+OkNpq8Vvsg6gYnkWJlBTsWUw3xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIjiJ2rL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIjiJ2rL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489931F00A3A;
	Mon, 10 Aug 2026 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786370628;
	bh=bPK89KKb3QCPdTKiOEIAY5ouNGI3G/IQq0t3YpMGzqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JIjiJ2rLI0uaytYoe8Ibq+x+FPpIFAfZWOyJ1OEag+65zEpaRtA4UHQR2l3cI8NxL
	 qDHyvZA8BefwPec0B48P3dBhEC9J2xIPhPg6uKJ8oMJEcC3BF/xwgw1yx5kNHoO//y
	 kZvcGPiClh16r+UtY4XvVthD4HdpwCg+OCflZjIzzGKWtKNDTJI5G17lzxXmNjO3cQ
	 e104egmuB2Tftk7xP9FxXXWCL3IcRNlU7c+VPuO4pZjZ0zrsGZjU8bcuOAfWX13jPK
	 nGodhwFLnzzLJtOZf0rJn8+BjbkC47/GGfbErOG6u8rMXvuIeLpzxSdufcPNUh0BNA
	 OLpwiKpXb3UPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v8 4/8] mfd: ls2kbmc: Cancel the work queue on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810-ls2kbmc-mod-v8-4-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <20260810-ls2kbmc-mod-v8-4-16e44f7322f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:03:47 +0000
Message-Id: <20260810140348.489931F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] A 10-second busy-wait delay and sleepable PCI mapping function=
s are executed within a `stop_machine()` context, causing system lockups.
- [Critical] The shared PCI interrupt handler blindly schedules the BMC res=
et recovery work without verifying the interrupt source, causing spurious 1=
0-second system stalls on any shared IRQ.
- [High] The global `ls2k_bmc_cells` MFD array is dynamically mutated with =
a stack pointer, violating subsystem rules and causing memory safety hazard=
s.
- [High] The GSI mapping for the GPIO watchdog interrupt is unconditionally=
 destroyed immediately after being requested, breaking the interrupt.
- [High] A static zero-initialized variable for rate limiting causes legiti=
mate interrupts to be permanently ignored during the first 6 minutes of upt=
ime.
--

--- Patch [4]: [PATCH RFC v8 4/8] mfd: ls2kbmc: Cancel the work queue on re=
moval ---
commit ac625d16d31c097a08a5eeba96a345ec9e2f3716
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Cancel the work queue on removal

This commit adds a devm action to cancel the bmc_reset_work when the
device is removed. This prevents pending work from executing after the
device has been unbound.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 06ec8143d8cdb..5eea53f134215 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -375,6 +375,12 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *p=
dev, struct ls2k_bmc_ddata *
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &ddata->bmc_pci_data.in=
terrupt_line);
>  }
> =20
> +static void ls2k_bmc_cancel_wq(void *data)
> +{
> +	struct ls2k_bmc_ddata *ddata =3D data;
> +	(void) cancel_work_sync(&ddata->bmc_reset_work);
> +}
> +
>  static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(ddata->dev);
> @@ -385,6 +391,10 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddat=
a)
> =20
>  	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
> =20
> +	ret =3D devm_add_action_or_reset(ddata->dev, ls2k_bmc_cancel_wq, ddata);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
>  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
>  	if (ret) {

[Severity: High]
This is a pre-existing issue, but the GSI mapping for the GPIO watchdog
interrupt is unconditionally destroyed immediately after being requested:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    gpio_irq =3D acpi_register_gsi(NULL, LS2K_BMC_RESET_GPIO_GSI, ACPI_EDGE=
_SENSITIVE,
                                 ACPI_ACTIVE_LOW);
    ...
    ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
                           IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpi=
o", ddata);
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    return ret;
}

Since this executes irq_dispose_mapping(), won't this cause the registered
handler to never trigger and potentially lead to a use-after-free or corrup=
ted
interrupts on removal?

[Severity: Critical]
This is a pre-existing issue, but does the shared PCI interrupt handler
blindly schedule the BMC reset recovery work without verifying the interrupt
source?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }

    return IRQ_HANDLED;
}

Since the PCI IRQ is requested with IRQF_SHARED, could any interrupt from
another device sharing the PCI IRQ line spuriously trigger the BMC recovery
work?

Since this work executes stop_machine() with a 10-second busy loop,
won't normal activity on shared devices freeze the entire system for 10
seconds?

[Severity: High]
This is a pre-existing issue, but does a static zero-initialized variable
for rate limiting cause legitimate interrupts to be permanently ignored
during early boot?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    static unsigned long last_jiffies;
    ...
    /* Skip interrupt in LS2K_BMC_INT_INTERVAL */
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
    ...
}

Because the Linux jiffies variable starts at 5 minutes before wrap-around,
time_after(jiffies, 0 + 60*HZ) evaluates to false for the first 6 minutes
of system uptime.=20

Will this cause hardware recovery interrupts to be completely ignored durin=
g=20
this time, and multiple device instances to interfere with each other's=20
rate-limiting state?

[Severity: Critical]
This is a pre-existing issue, but are a 10-second busy-wait delay and
sleepable PCI mapping functions executed within a stop_machine() context?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

Will executing a 10-second busy-wait with hard interrupts disabled across
all CPUs trigger the NMI watchdog and crash the system?=20

Additionally, since ls2k_bmc_recover_pci_data() calls pci_iomap() via=20
ls2k_bmc_pcie_is_connected(), won't invoking sleepable memory allocations=20
and locks in an atomic context cause a kernel panic?

[Severity: High]
This is a pre-existing issue, but is the global ls2k_bmc_cells MFD array
dynamically mutated with a stack pointer?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    struct simplefb_platform_data pd;
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

According to MFD subsystem guidelines, mfd_cell arrays must be static const.

Does modifying a global array with a stack pointer create a use-after-free
risk and a concurrency race if multiple instances are probed, since it leav=
es
the global array permanently holding a dangling stack pointer after probe()
returns?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v8-0-16e44f7322f4@gmail.com?part=3D4
