Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BA937F8DD
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 13:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369910; cv=none; b=fGR5ZC1cBr31XzznsAOTdU/6W2Viyo1gnotLF/C+iuWxuI+4wStIc/X04Oj97vPPA2p7bQHOIQla3UPw7N4wTxjxGlcGHQqX4tcie9ypeX2E06LCx4mxyRJ+CAzoFGQVz4dRXhCNh7JlxB73Kvpx3rwEKaip0NC7huHmJpK9nnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369910; c=relaxed/simple;
	bh=Ho3K5FJ7TIG7DQqWRwdk47l4m90MKloIQRZJRo3LNwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eMkpr9DSFmhwVogkapngzyNMEHzHG11EVtUrI2G/Sy+a04zQMwxu3QT1tu6CDYv7ND2SPMLmot8Y57UOPtXsaox8W3fekTBXy6vd9kUkzrHF4lxvV8zKthG7Jl8mAMONU5/XZmMz0tBniZtaOpFwYUS7HLri9JaiI1sq7S3pMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ec+7Qsc9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec+7Qsc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890E21F000E9;
	Mon, 10 Aug 2026 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786369908;
	bh=b+uhUlhYr6mOy+h1HX1dhaE9QBGQG0HAl/6t8d5WFRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ec+7Qsc9+vE8V26ZWR+J1Yn/9pLJ8tuuCZWkOh7TmgrWJmgiVVS/M6Do4B1eOznB8
	 YIQA+w1m324anMA3M1Hifk7CORXCILYjAC4qxYn5rhK/zp8WueRZeendD69/3YMOUI
	 DJsaB1+5dcJNxfvd+Mel3KgqTlsl9XzfAo56JwteQ/jHUIHYEAKp8lZMgQD/0NGBEd
	 Doj6YF+ibsQE8AfhmAreTgB06KzJFiWkQWbBsQ12LOxr98dwzb8LVXwO4S5dbQjIKj
	 zWTWtn1czqSuUgLETkV3NMzty6PUz3e+e/XPW3HYY9XhSeOLlshqxCxPHUQpb0uMUW
	 2XnONzarKSKHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v8 3/8] mfd: ls2kbmc: Redraw using exported
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810-ls2kbmc-mod-v8-3-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <20260810-ls2kbmc-mod-v8-3-16e44f7322f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 13:51:48 +0000
Message-Id: <20260810135148.890E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] System lockup due to 10-second busy-wait inside stop_machine() con=
text.
- [High] MFD subsystem API violation leading to a data race and dangling po=
inter on a global cell array.
- [High] Use-After-Free of device data due to missing workqueue cleanup on =
device removal or probe failure.
- [High] Unbalanced resource lifecycle completely breaks the GPIO interrupt=
 delivery.
--

--- Patch [3]: [PATCH RFC v8 3/8] mfd: ls2kbmc: Redraw using exported funct=
ions ---
commit 1bc6218749af861d9fbbf175e51a2eba62372b2b
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Redraw using exported functions

This commit updates the ls2kbmc driver to trigger the redraw of the current
vt using update_screen() inside console_lock() instead of set_console().

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 434db99ee501b..06ec8143d8cdb 100644
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

[Severity: High]
This is a pre-existing issue, but can this function trigger a system lockup?

The BMC reset event schedules bmc_reset_work, which executes this
ls2k_bmc_events_fn() function. Right above this diff context, the function
calls stop_machine() to suspend all CPUs with local interrupts disabled:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
        ...
        stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
        ...
}

Inside ls2k_bmc_recover_pci_data(), the code busy-waits for 10 seconds:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
        ...
        /* Waiting for U-Boot and DDR ready */
        mdelay(LS2K_BMC_RESET_WAIT_TIME);
        ...
}

Since stop_machine() runs with interrupts disabled across all CPUs, does
spinning for 10,000 milliseconds here inevitably cause the hard and soft
lockup watchdogs to fire and crash the system?

[Severity: High]
This is a pre-existing issue, but does this driver leave a dangling pointer
in the global cell array during probe?

In ls2k_bmc_probe(), the code assigns the address of a local stack variable
to the global ls2k_bmc_cells array:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
        ...
        ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
        ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
        ...
}

While devm_mfd_add_devices() clones the data during registration, the
global array itself is improperly defined as mutable state rather than
static const:

drivers/mfd/ls2k-bmc-core.c {
        ...
        static struct mfd_cell ls2k_bmc_cells[] =3D {
        ...
}

Since the global array retains the pointer to the destroyed stack frame
after the probe returns, could this result in a data race on the global
array and potential use of stack memory if multiple instances probe
concurrently or if the device is re-probed?

[Severity: High]
This is a pre-existing issue, but is there a use-after-free vulnerability
if the device is removed or if probe fails?

In ls2k_bmc_init(), the driver initializes a workqueue on a devm-managed
structure and registers an interrupt:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
        ...
        INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
        ...
}

However, the driver lacks a .remove callback and does not register a devm
action to cancel the work:

drivers/mfd/ls2k-bmc-core.c {
        ...
        static struct pci_driver ls2k_bmc_driver =3D {
                .name =3D "ls2k-bmc",
                .id_table =3D ls2k_bmc_devices,
                .probe =3D ls2k_bmc_probe,
        };
        ...
}

If the driver is unbound, the devm framework will automatically free ddata.
If the shared interrupt fired and scheduled the work before teardown, could
it execute and dereference the freed ddata inside ls2k_bmc_events_fn()?

[Severity: High]
This is a pre-existing issue, but does the initialization logic break the
GPIO interrupt delivery?

In ls2k_bmc_init(), immediately following a successful IRQ registration,
the code unconditionally tears down the GSI mapping:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
        ...
        acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
        return ret;
}

Because acpi_unregister_gsi() invokes irq_dispose_mapping() and destroys
the hardware-to-Linux IRQ mapping while the IRQ is still registered,
doesn't this prevent the interrupt from ever firing?

>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v8-0-16e44f7322f4@gmail.com?part=3D3
