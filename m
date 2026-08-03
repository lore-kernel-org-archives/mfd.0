Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5E338A717
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 17:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777284; cv=none; b=bjA2fsxwy8gfN2gQmu/BfYQ+K8GNLSeKCpiIEC4Q8hdZoedr3qwZTvWD52g9BmiSwUeSlPFKFVlNjVwTEFWKDzUUNri0ngwgNWrC5IWxFtXaeUPEXwoypD/ApHZkA6a9CzkS1sdSNmEYzNy4p8+3FijVUpb982yodEox5EzQvF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777284; c=relaxed/simple;
	bh=rEceIbCae1463KX2fxQI/uIAhrVDNlri0SUFtDxg2cw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TjIPGZVgFL7Kc9RxHg1l/bsOnNncBk1TkzMvYyWCLb/iwUMa0JCAliu4fI3m4KIAmYjF+pwAtHWNL4w+LZIY96OKZIMudVhh0/TXHa3DRB3rCcj/Z4Jf9ra9AtAB6YvUsUEkvml5qx9hNHxh44eMUHE30cnXy+NzlJfvoLBstiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVKvrijZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVKvrijZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D44F1F000E9;
	Mon,  3 Aug 2026 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777282;
	bh=/q+MMVgDX7vk7m/3eaEyOEFfA+B11SVwerrSevwgL4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BVKvrijZ1uXs2JtC/gTT0t4niS3X/F+NpWpncN9xeRbe/EXOSNpD3Ab+M7uqJcXsj
	 6St6hceHiypZwjS7tQrHOry6x6Tb2H7laqJBjSefe/VN5mu5Sy87WqXqkOBo6SvStk
	 t9gOl/aGNzLMmp36A/Mkv+S5zrrhO8iJH+9gtCLBRff712Ag8GvUHdVT+wbeamR7xi
	 KIvaYUwreme4FBO4jJLh0VXJxm8tp7g1km6ncDMkyGIATwsJp7ZCFfYNvsANG7zsel
	 RX4DPhhFm6tDViqBlYBTWG4vpwPySbrh46EtSCia/YrhsnoblwM7mKSwCZtpY//uw7
	 TcjjddF/+I+AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 3/7] mfd: ls2kbmc: Redraw using exported
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260804-ls2kbmc-mod-v5-3-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-3-e6bc5cdd9a93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 17:14:41 +0000
Message-Id: <20260803171442.8D44F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancellation of `bmc_reset_work` on driver unbind leads to=
 a use-after-free.
- [High] The global `mfd_cell` array is dynamically mutated with a pointer =
to a stack-allocated variable.
- [High] Uninitialized static variable `last_jiffies` prevents interrupt ha=
ndling for the first ~6 minutes of uptime and incorrectly shares state glob=
ally.
- [High] The driver executes an excessively long busy-wait (`mdelay(10000)`=
) and calls sleepable functions inside a `stop_machine()` context, severely=
 freezing the system.
- [High] The driver registers its interrupt handler with `IRQF_SHARED` but =
unconditionally returns `IRQ_HANDLED` without verifying device interrupt ow=
nership.
- [High] PCI-E recovery failures are ignored, leading to a potential system=
 crash when unconditionally redrawing the VT screen.
- [High] Premature disposal of the GPIO GSI mapping immediately after reque=
sting the IRQ.
--

--- Patch [3]: [PATCH RFC v5 3/7] mfd: ls2kbmc: Redraw using exported funct=
ions ---
commit 5d480fc6e39faac5ce62f0c2c72ba001afde5343
Author: Miao Wang <shankerwangmiao@gmail.com>
Subject: mfd: ls2kbmc: Redraw using exported functions

This commit modifies the ls2k-bmc driver to use update_screen() inside
console_lock() to redraw the virtual terminal after a PCI-E loss, replacing
the previous usage of set_console().

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index a9a30611dde9e..e12f2ca2fbef3 100644
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
This is a pre-existing issue, but does ignoring the return value of
stop_machine() here lead to a system crash?

ls2k_bmc_recover_pci_data() returns false (0) on error instead of a negative
error code, which makes stop_machine() return 0 on failure. The caller igno=
res
this and unconditionally calls update_screen(), which writes to the
framebuffer.

If the PCI-E link recovery failed, won't accessing the dead PCI-E memory fa=
tally
crash the system?

[Severity: High]
This is a pre-existing issue, but are we performing long busy-waits and cal=
ling
sleepable functions inside a stop_machine() atomic context?

stop_machine() executes its callback on one CPU while globally disabling lo=
cal
interrupts on all other CPUs.

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    if (!ls2k_bmc_pcie_is_connected(parent, ddata))
    ...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_pcie_is_connected() {
    ...
    base =3D pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
    ...
}

Will the 10-second mdelay() trigger NMI hardlockup detectors or RCU stall
warnings?

Additionally, won't calling pci_iomap() (which can sleep) in this atomic co=
ntext
violate core kernel rules?

[Severity: High]
This is a pre-existing issue, but does the uninitialized static variable
last_jiffies prevent interrupt handling for the first several minutes of up=
time?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    static unsigned long last_jiffies;
    ...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
    ...
}

last_jiffies is implicitly initialized to 0, and jiffies starts at -300 * H=
Z.
This makes the time_after() check remain false for the first ~6 minutes of
uptime.

If the BMC resets during this period, will the PCI-E recovery logic be skip=
ped,
causing subsequent CPU accesses to crash the system?

Also, being static, doesn't this incorrectly share rate-limiting across all
device instances?

[Severity: High]
This is a pre-existing issue, but does this shared interrupt handler
unconditionally return IRQ_HANDLED without verifying ownership?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }

    return IRQ_HANDLED;
}

Since the IRQ is registered with IRQF_SHARED, if an unrelated device sharing
this line triggers an interrupt, will ls2k_bmc_interrupt() blindly claim it?

Could this schedule bmc_reset_work and trigger the 10-second stop_machine()
freeze for completely unrelated hardware events?

[Severity: High]
This is a pre-existing issue, but does the lack of a workqueue cancellation=
 lead
to a use-after-free on driver unbind?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
    ...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_driver {
    .name =3D "ls2k-bmc",
    .id_table =3D ls2k_bmc_devices,
    .probe =3D ls2k_bmc_probe,
};

The driver has no .remove callback or devm teardown action registered to ca=
ncel
the work queue upon device unbind.

When the device is unbound, devm will free the IRQ and ddata structure. If =
any
pending work in the workqueue executes, won't it dereference the freed ddat=
a?
Does this violate the MFD subsystem guidelines requiring workqueue shutdown?

[Severity: High]
This is a pre-existing issue, but is the global mfd_cell array being dynami=
cally
mutated with a stack pointer?

drivers/mfd/ls2k-bmc-core.c:
    ...
    static struct mfd_cell ls2k_bmc_cells[] =3D {
    ...

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

The ls2k_bmc_cells array lacks the const qualifier, allowing dynamic mutati=
on.
If multiple instances probe concurrently, won't they race to write their own
stack pointers to the shared global array?

Could this result in one instance copying platform data from another's
potentially exited stack frame? Also, doesn't this explicitly violate the M=
FD
subsystem rule requiring static const cell arrays?

[Severity: High]
This is a pre-existing issue, but is the GPIO GSI mapping disposed of
prematurely?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    ...
}

This is called immediately after requesting the IRQ. Doesn't unregistering =
the
GSI tear down the interrupt mapping in the IRQ domain?

Will this cause the hardware interrupt to be disconnected and never fire,
defeating the BMC reset recovery mechanism?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-ls2kbmc-mo=
d-v5-0-e6bc5cdd9a93@gmail.com?part=3D3
