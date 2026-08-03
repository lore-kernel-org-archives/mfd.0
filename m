Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539D33C3C0E
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776992; cv=none; b=SIl71DhW/KsvJiK4RY9hYuPKjH8LLlxaLjmsV5r9Edsw2Kz5xO4yySjBpDo9E/hGnrWcgW0hIMIzMi6eYXrMyubL8dYttkGAPIpvks3RFSKZOKivXHT9pqTaHw0Gwrk3fTobsRcljmc5caxLmHYwvtztyqrGtPVqmntXr7HtHrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776992; c=relaxed/simple;
	bh=0mEtsu/OAUBP8ghG5+4XX/VHzhdKneRUF8oUnbswvfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T8HwSa42mNCvKdk2Evgn2XC7OdXcn6h8NL8bRepzdtwr37KWbPI1xGoLChcZT1n4pelf5iqRHzB0NQFfSx2pSrMXpOCVCtKJ/ykUV3N3rzbJUBuGW9D/WZ9qlUTsy53Nk0o5mVZuH//N1+9TGOjMg/oR/NUxrDD8IOObmVAzkj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkAAh3YS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkAAh3YS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C271C1F000E9;
	Mon,  3 Aug 2026 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776990;
	bh=DUYi39JOC1BLKX9AYsuCeW7/lw5RGKPqk0fyww5BM1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TkAAh3YSstFF8MJR8xSS3mqUKyZLneoy6JcHMe+5hjUoKJDxm6Ks+53kh4DwXNiuz
	 2gyBQt34rRtIQhkSt6GAlzsV0k7ix85435WOunkWQmTyKH4aTm7rmETTD1ewtCHZuJ
	 Ix/4VKEHd86uCld9jeVvK2Ia8rtVomYDoaL1340IhLUzkVwHa31cuZKOfNEQ6LC41z
	 KBH7E4mEZRpxd5JPQeqfRWH55OvzlbgSlqEb9DgDqDgpewWD3Z3GOBbrG7+IZzlNvv
	 kEQ4LFo7jJdu0fI6mbLYebqcG+Qbw9RSPr1hVvuMhtqfdcg73Sr3MoIOobAhhPCp0L
	 MUHe7jkFJXfBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 2/7] mfd: ls2kbmc: Sanity check for the connected
 pci port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260804-ls2kbmc-mod-v5-2-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-2-e6bc5cdd9a93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 17:09:50 +0000
Message-Id: <20260803170950.C271C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver dynamically modifies the shared static `ls2k_bmc_cells`=
 global `mfd_cell` array during probe, passing a pointer to a stack-allocat=
ed variable as platform data.
- [High] The driver schedules a work item (`bmc_reset_work`) but never canc=
els it during device removal or probe failure, leading to a use-after-free.
- [High] Unconditional destruction of the GPIO IRQ mapping immediately afte=
r successful registration.
- [High] A 10-second busy-wait delay inside a `stop_machine` callback will =
cause system lockups.
- [High] Calling `pci_iomap` inside a `stop_machine` callback will cause a =
scheduling while atomic panic.
--

--- Patch [2]: [PATCH RFC v5 2/7] mfd: ls2kbmc: Sanity check for the connec=
ted pci port ---
commit 0c7508c9325b7e4f23816a0998da4d8f6069eb25
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Sanity check for the connected pci port

This commit adds a sanity check to ensure the parent device of the BMC
is an LS7A PCIe port. It prevents accidental operations on non-LS7A ports
during the BMC recovery procedure by checking the parent device ID against
a list of supported LS7A port IDs.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index fc9695eedd366..a9a30611dde9e 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -477,6 +486,24 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev,=
 struct simplefb_platform_da
>  	return ret;
>  }
> =20
> +static const struct pci_device_id ls7a_ports[] =3D {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT0) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT1) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT2) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT0) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT1) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT2) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT3) },
> +	{ }
> +};
> +
> +static bool ls2k_check_parent(struct pci_dev *dev)
> +{
> +	struct pci_dev *parent =3D dev->bus->self;
> +
> +	return parent && pci_match_id(ls7a_ports, parent) !=3D NULL;
> +}
> +
>  static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_i=
d *id)
>  {
>  	struct simplefb_platform_data pd;
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
This is a pre-existing issue, but does this driver dynamically modify the
shared static global mfd_cell array during probe?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
...
}

The mfd_cell array is declared globally and lacks the const qualifier.
Can this cause a data race during concurrent probing that corrupts global
state? Also, passing a pointer to a stack-allocated variable as platform
data could leave a dangling pointer once probe completes.

[Severity: High]
This is a pre-existing issue, but does the driver schedule a work item that
is never canceled during device removal or probe failure?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
...
    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
...
    struct ls2k_bmc_ddata *ddata =3D container_of(work, struct ls2k_bmc_dda=
ta, bmc_reset_work);
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
...
}

If the device is unbound, devres will automatically free ddata. If the
workqueue is initialized and the IRQ is requested without adding a teardown
action (e.g., via devm_add_action_or_reset) to cancel the work, could the
asynchronous work still run and access freed memory?

[Severity: High]
This is a pre-existing issue, but does the initialization path unconditiona=
lly
destroy the GPIO IRQ mapping immediately after successful registration?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
...
}

Could this prevent the GPIO reset interrupt from ever being delivered becau=
se
its underlying GSI mapping is destroyed, permanently breaking the BMC reset
watchdog functionality?

[Severity: High]
This is a pre-existing issue, but does the recovery path execute a 10-second
busy-wait delay while the system is in a fully atomic, stopped state?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
...
}

The BMC reset event triggers ls2k_bmc_events_fn, which calls stop_machine().
This runs ls2k_bmc_recover_pci_data with all other CPUs halted and interrup=
ts
disabled. Could this 10-second busy-wait loop cause system lockups, NMI
watchdog panics, or RCU stall warnings?

[Severity: High]
This is a pre-existing issue, but does the PCIe connection check initiate a
sleeping operation while the system is in an atomic context?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_pcie_is_connected() {
...
    base =3D pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
...
}

Since stop_machine() runs ls2k_bmc_recover_pci_data atomically, which then
invokes ls2k_bmc_pcie_is_connected(), calling pci_iomap() here allocates
virtual memory and acquires sleeping locks. Could this result in a
scheduling while atomic or sleeping in atomic context kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-ls2kbmc-mo=
d-v5-0-e6bc5cdd9a93@gmail.com?part=3D2
