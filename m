Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258BE4D990A
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618444; cv=none; b=mlSmeQkY2JDLQ+W6eS1YxNmIxKMZxDSywIRQQ4CK3IcZrkEQrSB4FgAZj4mAy24CzcE4s+7nDrpPwR8GaIqfQu52LsEgNRPWSEWHh/M3lpU4t1rIbCDTmTij5EIW0NPGDLiCBduKyQbWAIhy1elQUYaH5ixXFMsJKevydiXNVYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618444; c=relaxed/simple;
	bh=qYL1KeQoZYTqYDpcpLNdQCHMcS4O2rymRNHdpZsTMWg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oNXgofEKhQT4QQcTc1OXSfAXXMmAPjTK3bAKDXo8lX32Yi7wsI0LNvCX1Y6+9WhSbL6KUsIDPG/x9J5AtFoZYFiODGqNpTEYytRmxLcHcePR2bCPyszjBkG0XhSsoQCGdQuOBuvj4SksZPixsu6f+SoocS9KOZd2u0luOs0V5Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d97/ztjV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d97/ztjV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DCB1F000E9;
	Thu,  9 Jul 2026 17:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618442;
	bh=OLRlGLmpOsZGhRF1h2GxBxhMgXLDVafv0P3aZWNexgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d97/ztjVni+zR4wtk2gspJsf7KtCIzPQArMCFXHv0bzn5a6FzrRgTHfnwnBjFSDty
	 B0sxDxawfNQ7F3TBilg365iCcOtdrMWn/5Z/nWMkILk1ZUzZ7DreSx3aHi95Ommbh5
	 COKnsj8lDU+hQt2GMiQL0z4cdUmTSO+aVNyQBaRuMu5tRawEzeOcv1O44Q826Z82s0
	 l7YUBfOXjU+6HuWjraT6lQxsu2XPn3hEDurG2ySXaFliTubX0qYUo0WsHWr5hej3HJ
	 +41U94LRJ1D9b0MGwXvkP1dxlncUg71jf4y/OfPCNwJDpA+2WfxFh+2lBs6t+b9Eot
	 uZ2BQ084jriuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 4/7] mfd: ls2kbmc: Cancel the work queue on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260710-ls2kbmc-mod-v3-4-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-4-ef718636e78e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:34:01 +0000
Message-Id: <20260709173402.96DCB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The `stop_machine` callback executes operations that sleep (`p=
ci_iomap`) and performs excessive busy-waiting (over 10 seconds), which wil=
l trigger kernel panics and hardware watchdogs.
- [High] The driver dynamically modifies the globally shared `ls2k_bmc_cell=
s` array during `probe()` by assigning a stack-allocated variable to its `p=
latform_data` field, violating MFD subsystem guidelines and causing data ra=
ces.
- [High] The debouncing logic in the interrupt handler uses an uninitialize=
d static variable `last_jiffies`, causing all interrupts to be ignored for =
the first ~5 minutes of uptime and creating a data race between multiple de=
vice instances.
- [High] The driver unconditionally unregisters the ACPI GSI immediately af=
ter successfully requesting its Linux IRQ, destroying the mapping while it =
is actively in use.
- [High] The shared interrupt handler unconditionally schedules work and re=
turns `IRQ_HANDLED` without verifying if its device generated the interrupt=
, violating `IRQF_SHARED` semantics.
--

--- Patch [4]: [PATCH RFC v3 4/7] mfd: ls2kbmc: Cancel the work queue on re=
moval ---
commit c019cbf289f699805da0540d5ca947d9e1feb7fd
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Cancel the work queue on removal

When the device is being removeed, the work queue should be canceled to
avoid any pending work to be executed after the device is removed.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index a5465c42a77b8..1466b314fc4e5 100644
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

[ ... ]

> static struct mfd_cell ls2k_bmc_cells[] =3D {
[ ... ]
> ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
> ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);

[Severity: High]
This is a pre-existing issue, but could dynamically modifying the global
ls2k_bmc_cells array during probe() with a stack-allocated variable create a
data race?

The MFD subsystem mandates that mfd_cell arrays must be declared as static
const to prevent local amendments. Assigning a local stack variable to the
global array can cause a data race if multiple instances are probed
concurrently, potentially overwriting another device's platform data with a
dangling pointer.

[ ... ]

> static unsigned long last_jiffies;
> ...
> if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {

[Severity: High]
This isn't a bug introduced by this patch, but is it possible that the
uninitialized static last_jiffies variable causes all interrupts to be
ignored for the first 5 minutes of uptime?

Since last_jiffies is implicitly initialized to 0 and jiffies starts at
-300*HZ, time_after() evaluates to false until jiffies wraps past 0.

Furthermore, does using a static variable here introduce a data race between
multiple device instances?

[ ... ]

> stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
[ ... ]
> base =3D pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
[ ... ]
> mdelay(LS2K_BMC_RESET_WAIT_TIME);

[Severity: Critical]
This is a pre-existing issue, but would calling stop_machine() here trigger=
 a
regression by halting the system?

The ls2k_bmc_events_fn() invokes stop_machine(), which moves execution to an
atomic context with all CPUs halted and IRQs disabled.

Inside this callback, it calls ls2k_bmc_pcie_is_connected() which can sleep
via pci_iomap(). It then busy-waits for 10 seconds with mdelay().

Will halting the entire system with interrupts disabled for 10 seconds
reliably trigger hardware watchdogs and RCU stall panics?

[ ... ]

> acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);

[Severity: High]
This isn't a bug introduced by this patch, but does unconditionally
unregistering the ACPI GSI immediately after successfully requesting its
Linux IRQ destroy the mapping while it is actively in use?

Tearing down the hardware-to-Linux IRQ domain mapping and freeing the
underlying IRQ descriptor guarantees the interrupt will not be delivered.

Will this also trigger a warning and a use-after-free regression during
device removal when the active IRQ is later freed?

[ ... ]

> if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
> 	schedule_work(&ddata->bmc_reset_work);
> 	last_jiffies =3D jiffies;
> }
>
> return IRQ_HANDLED;

[Severity: High]
This is a pre-existing issue, but will unconditionally returning IRQ_HANDLED
without verifying the hardware source violate IRQF_SHARED semantics?

The handler is registered with IRQF_SHARED, but it unconditionally returns
IRQ_HANDLED and schedules bmc_reset_work without checking any hardware
status.

If another device on the shared line fires an interrupt, will the BMC driver
intercept it, falsely claim it was handled, and trigger the 10-second system
lockup via its workqueue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-ls2kbmc-mo=
d-v3-0-ef718636e78e@gmail.com?part=3D4
