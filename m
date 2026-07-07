Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC95238D27
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 19:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452963; cv=none; b=AfvAHuQLfHPbp6+6vUs5KIW/5P5xsFosabNd+VVvB45A9azVbOLa2ZI9X3/KfB+aD6pPd4XhB2ATa3nfB9J6IM7giEjrFPG0m3Xfs0oyCbQpC4WTLeK8keBQ6DGQmaTqKX6qrtR0w908raTNUIeQwpLVrmZusL+AltSQQyQo9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452963; c=relaxed/simple;
	bh=UHUhWTdWdzcATAzhubq2f8LxS4jB44PEnVWhtRUF1/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fd06jWX/vkgJou2DPFsGQC5SBq9+ZSecfaCRARmQQdnsE+JPJY82NL4AUSH+s6mZQAu8i90vowogdFsQmM3Lx3Hpd1UDvcT+Jf1w3JGngvT5zGPaTg2V6o9sIqu89rasZ7HWGRdgQijbws0ui67Zgiw4h9ny9GydC0wFXtdZKI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV88bjCj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV88bjCj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EB51F000E9;
	Tue,  7 Jul 2026 19:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783452961;
	bh=T7RycLEC9n9oeDO09vRBlajOlfy+6juv8YqXZ8DmRxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nV88bjCjFe1GqsrfZ2bxOjpaRJcj5S5E1H4eI38FafXVaWVNYoP3mnewCEODaAySh
	 sRHqXkaFcr5DEM4S0Zb6vMuUvyGHqofnx/u2ujFDs+j5WPpJctURdylUfi6XD2tuvl
	 BooCm6KRxzYxjobeILLT8qZmLPw12oiRcJ4zLbuyO9+4RM0U0MGN0A89KXWqZ7AKAZ
	 QXiIiCzo9mh1ea1IfvVJ+DAIyBtzhkF6wrojR/Sxp3/ES6hQ56k1IJ99WFftq3a9pQ
	 DieFONxGiSmdFAxaA6RaWZvYGqTPC9E06uCI9oVZJsctoR3cwof2Sc3S9+YWZ5xMqd
	 5odTkQiLITmqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/5] mfd: ls2kbmc: redraw using exported functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260708-ls2kbmc-mod-v1-3-c344bf5defa3@gmail.com>
References: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
 <20260708-ls2kbmc-mod-v1-3-c344bf5defa3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 19:36:00 +0000
Message-Id: <20260707193600.A9EB51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A 10-second busy-wait is executed inside a `stop_machine` callback=
, causing an uninterruptible system freeze that will trigger hardware locku=
p watchdogs.
- [High] The scheduled work item is never canceled upon device unbind, lead=
ing to a use-after-free vulnerability.
- [High] The probe function assigns a stack variable pointer to a globally =
shared, dynamically mutated `mfd_cell` array.
- [High] The recovery callback returns 0 (false) on failure, and the caller=
 ignores the return value, leading to unchecked PCIe errors and system pani=
cs.
- [High] Unconditional `IRQ_HANDLED` return in a shared interrupt handler w=
ithout source validation.
--

--- Patch [3]: [PATCH RFC 3/5] mfd: ls2kbmc: redraw using exported function=
s ---
commit 2d719e1f4433582637922b9095dc176ee03b5768
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: redraw using exported functions

This commit modifies ls2k_bmc_events_fn to use update_screen to trigger
a redraw of the current vt, replacing set_console. This aims to safely
restore the display state after a PCIe loss.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -310,7 +311,9 @@ static void ls2k_bmc_events_fn(struct work_struct *wo=
rk)
> =20
>  	if (IS_ENABLED(CONFIG_VT)) {
>  		/* Re-push the display due to previous PCI-E loss. */
> +		console_lock();
> +		update_screen(vc_cons[fg_console].d);

[Severity: High]
This isn't a bug introduced by this patch, but earlier in this function
stop_machine is called to execute ls2k_bmc_recover_pci_data:

stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);

Inside ls2k_bmc_recover_pci_data, the code calls
mdelay(LS2K_BMC_RESET_WAIT_TIME) which delays for 10 seconds.

Because stop_machine executes its callback with local interrupts disabled
on the executing CPU while all other CPUs spin with interrupts disabled, a
10-second delay is executed in this state.

Could this uninterruptible freeze trigger the kernel's NMI hard lockup
watchdog or RCU stall detectors, leading to a panic?


[Severity: High]
This isn't a bug introduced by this patch, but the return value of
stop_machine is ignored here before unconditionally calling
update_screen.

In ls2k_bmc_recover_pci_data, failure paths return false, which evaluates
to 0 (success). If the PCIe link fails to retrain and the failure is ignore=
d,
update_screen will still attempt to perform PCIe MMIO reads/writes.

Can accessing MMIO on a down PCIe link cause severe hardware exceptions like
an asynchronous external abort or AER panic?=20

Should we verify the PCIe link is actually recovered before updating the
screen?

> +		console_unlock();
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but I noticed the bmc_reset_work work item
(which executes ls2k_bmc_events_fn) is never canceled on driver unbind.

In ls2k_bmc_probe, the driver dynamically allocates ddata via devm_kzalloc
and initializes the work:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
    ...
}

The driver lacks a .remove callback or a devm action to call
cancel_work_sync.

When the device is unbound via sysfs, devres automatically frees the ddata
structure.=20

If the work was scheduled right before unbind, will the workqueue
dereference the freed ddata pointer when it executes ls2k_bmc_events_fn,
causing a use-after-free?


[Severity: High]
This is a pre-existing issue, but looking at how the device is initialized
in ls2k_bmc_probe, a stack variable pointer is assigned to the globally
shared ls2k_bmc_cells array:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    struct simplefb_platform_data pd;
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

Because ls2k_bmc_cells is not declared as static const (which violates MFD
subsystem rules), the global array permanently retains a dangling pointer
to the pd stack frame after probe returns.

If another instance of the device probes, or if the driver unbinds and
rebounds, won't this read unmapped or corrupted stack memory?


[Severity: High]
This is a pre-existing issue, but the shared interrupt handler for the BMC
unconditionally returns IRQ_HANDLED:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }

    return IRQ_HANDLED;
}

Without checking hardware status registers to verify if this specific device
generated the interrupt, any other device sharing the IRQ line will cause
this handler to falsely claim the interrupt.

Does this behavior starve unrelated devices on the same line and incorrectly
schedule the 10-second BMC reset sequence?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v1-0-c344bf5defa3@gmail.com?part=3D3
