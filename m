Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5813D4DA552
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618718; cv=none; b=l0qp6GkSk+lNfy2l5/at7boZWDa1PHMEZj/o7VbF/Oxke7bdg9xvwxXb4WSCcYRP7NZV9Ah9XQV4DGEJZAwTd9//j/26DhmcZ+9Emu0iuAHGBaX5XbLVbDaYS+qmmw/hnr3Vtzrkm7bgd8u+h1shlgwtFKrhU3waIIBP4gyrmx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618718; c=relaxed/simple;
	bh=8WavffCMP79IwUq0MRotKRWJhzNj4OnaSxGsShq1OqY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sYi3hQf4VaZ/E5OT+hMaoup7S/PwqVXKg5/BPUoPYuFMup9RYoYaztvXyCojnnzo4dgFC+1uHpT5dRw+VVUY1dhz1lrLFH/bACwfRCdgeISVpOQZAPNqUXw7FFdkhuajIszro3wBbUHsKKERLSANXIJKyMJW1poXVyHEdBXRWj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUH1lzP7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUH1lzP7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB291F00A3A;
	Thu,  9 Jul 2026 17:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618717;
	bh=LiG6FSxfpP90zmnEi42sTwows5J7BEOAjOBrldO/vKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUH1lzP74QNJeocnyLqxfEX7GWdq2CYUEoMpRIBKe5qdKMG2H9kOooD5CV6Sxz0u/
	 p5y4W/vig/vgMejWS7aKUMTNgy9/bQGOyO35mj3MfZN+4ROwlQ4L9WnrUXZQB9hELi
	 3cYpztU514PsZOF7CpqDX6JrBiZ1IFJ+wL9BOnpGMypkh7vyiyJaqEFsRxEFDu11RM
	 R9FcJ1Xs9GnUQABXFkYqBQktEwUCOQodSQxHrJdplcUFTm82UFYt7NsadhFpSChdDD
	 XP0A3Wt9wofzbWkDPIhNHmlYdaTQr81VBj1PLA4OvvBxK2U4vbplmw1iBCPh+oNt5p
	 KjHnEfqC63AUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 3/7] mfd: ls2kbmc: Redraw using exported
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260710-ls2kbmc-mod-v3-3-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-3-ef718636e78e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:38:36 +0000
Message-Id: <20260709173836.EDB291F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] Replacing the VT switch with update_screen() breaks display reco=
very under X/Wayland graphics modes.

Pre-existing issues:
- [Critical] Execution of 10+ second delays and sleeping functions inside s=
top_machine() guarantees an NMI watchdog panic.
- [High] Dynamic modification of a global static mfd_cell array during prob=
e creates a data race and dangling pointer.
- [High] Missing cleanup for bmc_reset_work leads to a use-after-free on de=
vice removal.
- [High] Unconditional IRQ_HANDLED return breaks spurious IRQ detection and=
 maliciously reacts to shared interrupts.
- [High] The GSI mapping is unconditionally destroyed on the success path v=
ia acpi_unregister_gsi().
--

--- Patch [3]: [PATCH RFC v3 3/7] mfd: ls2kbmc: Redraw using exported funct=
ions ---
commit ca5ab809b3bf65d3ee783662ac1c114bc62806f2
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Redraw using exported functions

This commit modifies the VT redraw mechanism in the ls2k-bmc-core driver to
use update_screen() within a console_lock() instead of switching virtual
terminals. It aims to trigger the redraw of the current vt using exported
functions.

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

[Severity: Medium]
Will this regression break display recovery under X/Wayland graphics modes?

In text mode, this repaints the framebuffer memory. However, in graphics mo=
de
(KD_GRAPHICS), update_screen() explicitly skips do_update_region() and
notify_update(vc).

As a result, user-space display servers like Xorg or Wayland are never
notified of the hardware reset, meaning they will not be prompted to
re-acquire DRM master and modeset the restored display controller.

> +		console_unlock();
>  	}
>  }

[Severity: Critical]
This isn't a bug introduced by this patch, but does the recovery process
trigger an NMI watchdog panic by sleeping inside stop_machine()?

The work item calls stop_machine(), which disables interrupts on all CPUs:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

Inside this callback, the driver executes a 10-second busy wait:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    /* Waiting for U-Boot and DDR ready */
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

Halting all CPUs with interrupts disabled for over 10 seconds will
unconditionally trigger the kernel's hard lockup detector. Additionally, is=
 it
safe to sleep by calling pci_iomap() while in this atomic context?

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing cleanup f=
or
bmc_reset_work that leads to a use-after-free on device removal?

The driver initializes and schedules the work, but structurally lacks a
.remove callback to invoke cancel_work_sync():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
    ...
}

Since the PCI driver relies purely on devres APIs for cleanup and does not
provide a .remove callback or a devm_add_action handler, the work item will
remain in the workqueue after the ddata structure is freed during module
unload.

[Severity: High]
This isn't a bug introduced by this patch, but how does the driver handle t=
he
data race and dangling pointer created by modifying the global static mfd_c=
ell
array during probe?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

Modifying a global struct in a probe function introduces a data race if
multiple device instances probe concurrently. The pointer saved into the
global struct (&pd) points to a local stack variable, leaving a dangling
pointer in global state after the probe function returns. This also violates
the MFD subsystem guidelines which require mfd_cell arrays to be static con=
st.

[Severity: High]
This isn't a bug introduced by this patch, but wouldn't the unconditional
IRQ_HANDLED return break spurious IRQ detection?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    return IRQ_HANDLED;
}

The handler is registered as a shared interrupt:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    devm_request_irq(dev, ddata->bmc_pci_data.irq, ls2k_bmc_interrupt,
                   IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddat=
a);
    ...
}

Because it does not check any device-specific registers to verify the sourc=
e,
every interrupt from another device sharing the line will cause this driver
to falsely schedule a BMC reset recovery and freeze the system via
stop_machine().

[Severity: High]
This isn't a bug introduced by this patch, but is it intended to destroy the
GSI mapping unconditionally on the success path?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    ...
}

The hardware interrupt becomes unreachable because its Linux IRQ mapping is
destroyed via acpi_unregister_gsi() immediately after being requested
successfully. This severs the interrupt mapping and prevents the GPIO
interrupt from ever firing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-ls2kbmc-mo=
d-v3-0-ef718636e78e@gmail.com?part=3D3
