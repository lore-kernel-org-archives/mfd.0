Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB437472F
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 21:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459578; cv=none; b=BOVXoIj7cYlD3dYjejSrzuAHT3dMoQM3IRKMzAAuWxHNQGcQfQZEpNK22g0JHl+bxjw1bzeIKRV8UfBrg/r7YjNxMnHC5WURme7fYg0NO9+czK1Axnh3wkuz7lVsrznAfinF25h2Pm8bIIsCe5lQ5ZujQLfzWlNTBxnWQ8tJP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459578; c=relaxed/simple;
	bh=udVg06eCI4PPBMtc/PonDKQ7kKCUkqUeCJuiTK+c8S4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a9MBndNTQRLvBGI8oy0L/M1mjr3oKbyTgWUSKNZ5nN0xX3+0alD1hQjmfeLrv7VGWAGaLK2NqNcxYu8P4nuQCL/6iXNqICI6JS1R+HI6Q2FMQ+kTx2n2Ni2Ic/hRb96766dKolD+9KNo/riep02X/YucoEo//sKdkA6bG/8B1FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=noyA73iy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="noyA73iy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14EAF1F000E9;
	Tue,  7 Jul 2026 21:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783459576;
	bh=c3RuO5oI7RiO2wC1wIY3RbUJ0SNPwZ0cvzP/rrBdeUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=noyA73iyiG5vZvgK3yUkwpeea2g+YmbZEigtfeqW27S0cldrGviDAQHTQBXB5pHKB
	 nHSsHnjNSbQEgoz6XMv4KaO6lKP5pT7JrNjin942s3ld1DO5pzoLdMzGSfNpoL+r7Y
	 +6J1kjzqU3Vh5T1oBIqD4lB+tHUpOUZu5+Qtj+AL26fXnuoUU/pTiWceL8Sdd7bIQq
	 vtWVXbK18QpUEAhP1zSYW8KuBp//NlM2FzBAR27EUHswcwkKaVG7eoWBUvaqC8Y9w7
	 qVRtMUHtRdQuzbeiuMYcy3Hg+ohqI/Bb9//bFGq3ecTbwM2ujzedEVwN5Ysvw8zRMs
	 c1Vwkwv/ca3sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260708-ls2kbmc-mod-v2-2-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-2-2afdd1741766@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 21:26:15 +0000
Message-Id: <20260707212616.14EAF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but the driver e=
xecutes a 10-second `mdelay()` inside a `stop_machine()` context, severely =
freezing the system and risking NMI watchdog panics.
- [High] This problem wasn't introduced by this patch, but the driver dynam=
ically modifies a global, non-const `mfd_cell` array during `probe()`, viol=
ating MFD subsystem guidelines and creating a concurrency data race.
- [High] This problem wasn't introduced by this patch, but the shared inter=
rupt handler unconditionally returns `IRQ_HANDLED` without checking hardwar=
e registers, breaking shared IRQ lines.
- [High] This problem wasn't introduced by this patch, but the driver uncon=
ditionally unregisters the ACPI GSI immediately after successfully requesti=
ng the GPIO IRQ.
--

--- Patch [2]: [PATCH RFC v2 2/7] mfd: ls2kbmc: Sanity check for the connec=
ted pci port ---
commit 196295bb9b62c28a067b90bc276ab4463c9f9b51
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Sanity check for the connected pci port

This commit adds a sanity check to the ls2k_bmc_probe() function to ensure
the device is connected to a supported LS7A PCI-E port. This prevents the
driver from accidentally operating on non-LS7A ports when the BMC resets
and requires parent device reconfiguration.

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
This isn't a bug introduced by this patch, but I noticed a potential data
race when assigning a stack address to a global array later in the probe
function:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

Does this create a race condition if multiple instances of this device are
probed simultaneously?

Since ls2k_bmc_cells is not marked as const:

drivers/mfd/ls2k-bmc-core.c:
static struct mfd_cell ls2k_bmc_cells[] =3D {

Could multiple probes overwrite this shared pointer with their own stack
addresses, violating the MFD subsystem guidelines that require mfd_cell arr=
ays
to be static const?

After probe() completes, does this leave a dangling pointer to popped stack
memory in the global array?


[Severity: Critical]
This is a pre-existing issue, but I noticed a potentially severe problem wi=
th
how delays are handled during the reset work:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

Inside the callback:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

Since stop_machine() pauses execution on all other CPUs with interrupts
disabled, does delaying for 10,000 milliseconds inside
ls2k_bmc_recover_pci_data() completely freeze the system?

Could this trigger hardware or software NMI watchdogs and lead to a panic?


[Severity: High]
This isn't a bug introduced by this patch, but there seems to be an issue
with how the shared interrupt is handled:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
                           IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pci=
e", ddata);
    ...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    return IRQ_HANDLED;
}

Since the interrupt is requested with IRQF_SHARED, is it safe for
ls2k_bmc_interrupt() to unconditionally return IRQ_HANDLED without checking
hardware registers?

If another device sharing the IRQ line fires an interrupt, does this falsely
claim the interrupt and break the IRQ core's spurious interrupt detection?


[Severity: High]
This is a pre-existing issue, but the GPIO IRQ cleanup path looks problemat=
ic
on successful initialization:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    return ret;
}

Does this code unconditionally unregister the ACPI GSI immediately after
successfully requesting the GPIO IRQ?

Could destroying the mapping while the requested interrupt handler is still
active break the interrupt routing and prevent it from firing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v2-0-2afdd1741766@gmail.com?part=3D2
