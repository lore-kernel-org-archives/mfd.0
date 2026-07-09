Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17F64DA54B
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618634; cv=none; b=OVbRlaUb2ZvUdp2smt6XXQ9eXDIgbngU9vGafu912RFX0UZbPzDz4wUftQdrQUwH0lDhDntXxjY+xrWq71qLomWVZeNmPf3iEpj8KJihMZPaNMl5j1V7D0fuFtctajLoR6Xvm+Ly1hMYfpEx2yS8KKeqypM3LeNupo1kNBi2NQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618634; c=relaxed/simple;
	bh=qFW+IAaifZcuIJ8r948BAUjTJekICWkb+vyUms59YDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rVFnoQYzTNP5jTnstRHs0D3Wa8zhGfl7UiTrNCBsRryVllX7pIq5tMKYJntueWtp15Sv51QvyIepRSNNwwLWQBLFS5yJa/kTIVrIaDK4/thmm97+bF8bEUdArpY9BNThEX+b+V5d2X6XMizsQiH6fG9I3/NuqEDWOUJ4ea1fCrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQj58G0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQj58G0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EA71F000E9;
	Thu,  9 Jul 2026 17:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618633;
	bh=jMfd0NZlxk5n+0M0PTNvMTUMXgAhJ1vXHTmKGqAr90Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQj58G0eeylFiVJVdSncnI1WQ+Ec6QJSarP5h6PIhn9j/Wawr/rDwHeFN8OQBwBPo
	 +jcuSKe9P0/LfG3+QsS4BpXcasc+BA/CezeFto1c/E2ZZZSw+5nyZmnhGRgNwWvPrj
	 oyNbXy6YR8hBiivCJtUcKDdfRoW1X2lZxAtvhxUaN2JVXf/FjswJYkqWTXmw3PJby5
	 dU8yFODQXaP0qQZX2vnuJqEZ1LX5NfKFxM6CR7+SmqyDOCqwWFsWLXIxu2jBxNuUX7
	 mU76Zn5OQ9IiuG4aQpxBB7jyTqxlFqd4GDFTCqFVDUHIGUrCSZg/tF+vVuR9uY7gqc
	 E5p7g4iqX+VBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260710-ls2kbmc-mod-v3-2-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-2-ef718636e78e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:37:12 +0000
Message-Id: <20260709173713.46EA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The BMC reset recovery procedure executes inside `stop_machine=
()` with an unconditional 10-second delay, which will trigger a system hard=
 lockup.
- [High] The `ls2k_bmc_cells` array is declared as a non-const global varia=
ble and is dynamically modified during probe to pass stack-allocated `platf=
orm_data`, violating MFD subsystem guidelines and causing a data race.
- [High] The `bmc_reset_work` workqueue is not cancelled on device unbind o=
r probe failure, leading to a potential use-after-free.
- [High] The driver unregisters the GPIO ACPI GSI immediately after request=
ing the IRQ, rendering the IRQ mapping invalid and breaking reset detection.
--

--- Patch [2]: [PATCH RFC v3 2/7] mfd: ls2kbmc: Sanity check for the connec=
ted pci port ---
commit a57e58240c51cbe6832a32a400a0d6d415c3c375
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Sanity check for the connected pci port

When the bmc resets, the recovery procedure require to reconfigure the
parent device. The driver assumes that the parent device should be LS7A.
Add a sanity check on initialization to ensure this and prevent from
accidentally operating on non-LS7A ports.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 27f6e096404d6..b02e4955e9b04 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> @@ -488,6 +515,11 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const=
 struct pci_device_id *id)
>  	if (ret)
>  		return ret;
> =20
> +	if (!ls2k_check_parent(dev)) {
> +		dev_err(&dev->dev, "Expected to be connected to LS7A PCI-E port\n");
> +		return -ENODEV;
> +	}
> +
>  	ddata =3D devm_kzalloc(&dev->dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return -ENOMEM;

[Severity: High]
This isn't a bug introduced by this patch, but later in ls2k_bmc_probe() the
driver dynamically modifies a global array:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

Does this violate the MFD subsystem guidelines which require mfd_cell arrays
to be static const? Since this mutates a global array with a pointer to a
stack-allocated variable, could this cause a data race or data corruption if
multiple instances of the driver probe concurrently?

[Severity: High]
This is a pre-existing issue, but I noticed the driver doesn't seem to clean
up the workqueue in error paths or on teardown:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
    ...
}

Since devm_add_action_or_reset() isn't used to register a teardown action f=
or
cancel_work_sync(), and there is no .remove callback, will this workqueue
remain active or queued after devres frees ddata on device unbind, leading =
to
a use-after-free?

[Severity: Critical]
This is a pre-existing issue, but is it safe to use mdelay() for 10 seconds
inside a stop_machine() callback?

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

Since stop_machine() halts all CPUs and disables interrupts, will spending =
10
seconds here inevitably trigger the NMI watchdog (hard lockup detector) and
cause a kernel panic?

[Severity: High]
This is a pre-existing issue, but the driver unregisters the GPIO ACPI GSI
immediately after requesting the IRQ:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    ...
}

Does calling acpi_unregister_gsi() here invoke irq_dispose_mapping() and
destroy the interrupt mapping before it can be used, breaking the reset
detection?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-ls2kbmc-mo=
d-v3-0-ef718636e78e@gmail.com?part=3D2
