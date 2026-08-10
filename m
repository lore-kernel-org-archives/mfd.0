Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1077C3DAAC7
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366099; cv=none; b=HBcpt6KBt9IsP8QJJjAnElorbECzwOs3e3eFG+p+DyNjGdmjGA2L3KFfzAAzgZdSU3sBAgs3Ry3XI8E7uvngL+LJnf+JuiOBFucWLfqQt2b+D6u6hGBEXE9QKlt4jzUomiP6JwJAXK9PpvR5mQaEDWAuq/kRzyFEWxBvHJWGfls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366099; c=relaxed/simple;
	bh=jhtiVqAkhpCDpZ4nGQv1VqoBcerFJ8cWuOyMLW2Jz6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WK24wJVXOf/nOcCMvYlPPn9eW2TcjHfvpoH8NitcOfdubai6Qzhnd3jnBIKB3tRKU8lK4o9FeZlSy1213ffIy9CgdreKLd1UrgwmLAsign5ajbaBfUSD7fJjq2bFxXSs27JXzH9IBi8p4vLCSzgf7r/mbXy8vknVc4f8mO0izRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv7S3N6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv7S3N6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79EA61F000E9;
	Mon, 10 Aug 2026 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786366097;
	bh=YzwqXATUy6G2f8ZDQFdYSqQE2TI11prYjV4OYkXnXTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nv7S3N6yGwANrRDpffCpRQ3ao94ggIPtr6hvc3RU/4Jcr4H+LNF9IPK2mMb2KaVZN
	 CKBUZMLkLBLK9zp6QZ6YyaHFcPLVhjopPaGkw5co3kevLdv6VMPU8wnIosVXYTOev8
	 VtWhwQ9/SVXuJs5qLBuL59XHXD27jZi9SCGzQSUaTUPS8OWmXc3YdfUC2WPaITl5aO
	 bfb81yuBIBydsOUyQ/aHMPClBczwHDHMS/ei/DYwAinGDhIsYlLwCBJIvyC0xUhkwY
	 ETKAhxzHPG3llGW7Ws0evaD4oVyhxtT9qN0EyCsQ5a3StOT1+O9qcO2Xsf8zuiYT83
	 sauus1dHKLU9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 2/8] mfd: ls2kbmc: Sanity check for the connected
 pci port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260810-ls2kbmc-mod-v7-2-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
 <20260810-ls2kbmc-mod-v7-2-8aa0fb5a5462@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:48:16 +0000
Message-Id: <20260810124817.79EA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver dynamically modifies a shared static `mfd_cell` array w=
ith a stack-allocated platform data pointer during probe.
- [High] The driver completely freezes the system for over 10 seconds durin=
g BMC reset recovery by busy-waiting inside a stop_machine() callback.
- [High] Missing cancellation of workqueue leads to use-after-free on devic=
e unbind.
- [High] The driver dynamically maps and unmaps device memory inside a stop=
_machine() callback, which executes in atomic context with interrupts disab=
led.
- [High] The driver bypasses GPIO APIs to perform lockless read-modify-writ=
e operations on shared SoC-level GPIO controller registers.
- [High] The interrupt handler unconditionally returns IRQ_HANDLED on a sha=
red interrupt line and locklessly accesses a static rate-limiting variable.
--

--- Patch [2]: [PATCH RFC v7 2/8] mfd: ls2kbmc: Sanity check for the connec=
ted pci port ---
commit 0143b961f7353bf1b0c1d9d60cca1be9f0e57e23
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Sanity check for the connected pci port

When the bmc resets, the recovery procedure require to reconfigure the
parent device. The driver assumes that the parent device should be LS7A.
Add a sanity check on initialization to ensure this and prevent from
accidentally operating on non-LS7A ports.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 335590392240b..434db99ee501b 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -35,6 +35,15 @@
>  #define LS2K_IPMI3_RES_START		(LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZE)
>  #define LS2K_IPMI4_RES_START		(LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZE)
> =20
> +/* LS7A port Device IDs */
> +#define DEV_LS7A1K_PCIE_PORT0	0x7a09
> +#define DEV_LS7A1K_PCIE_PORT1	0x7a19
> +#define DEV_LS7A1K_PCIE_PORT2	0x7a29
> +#define DEV_LS7A2K_PCIE_PORT0	0x7a39
> +#define DEV_LS7A2K_PCIE_PORT1	0x7a49
> +#define DEV_LS7A2K_PCIE_PORT2	0x7a59
> +#define DEV_LS7A2K_PCIE_PORT3	0x7a69
> +
>  #define LS7A_PCI_CFG_SIZE		0x100
> =20
>  /* LS7A bridge registers */
[ ... ]
> @@ -490,6 +499,24 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev,=
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
> @@ -501,6 +528,11 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const=
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

I also noticed some pre-existing issues in this file:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
	ret =3D ls2k_bmc_parse_mode(dev, &pd);
	if (ret)
		return ret;

	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this dynamically modify=
 a
shared static mfd_cell array with a local stack pointer?

The MFD subsystem API requires mfd_cell arrays to be static const.

Modifying the global array with a pointer to the local stack-allocated "pd"
variable could cause a stack use-after-free during asynchronous or parallel
probing.


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
	stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
	/* Waiting for U-Boot and DDR ready */
	mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but is this a 10-second busy loo=
p?

Since ls2k_bmc_recover_pci_data() runs under stop_machine() via
ls2k_bmc_events_fn(), won't stalling all CPUs with interrupts disabled for
10 seconds trigger the NMI hard lockup watchdog and freeze the system?


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but should this asynchronous wor=
kqueue
be canceled on driver removal?

There is no cancel_work_sync() in the device removal path or a managed devm
action.

This means an interrupt could schedule this work right as the device is
unbound, leading to a use-after-free when the work executes after ddata is
freed.


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_pcie_is_connected() {
    ...
	base =3D pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but can pci_iomap() dynamically =
map
device memory using sleeping functions here?

This function is called from ls2k_bmc_recover_pci_data() which executes und=
er
stop_machine() with interrupts disabled.

Could this lead to a panic due to scheduling while atomic?


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
	/* Disable GPIO output */
	val =3D readl(gpio_base + LOONGSON_GPIO_OEN);
	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_OEN);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but is this code performing an
unprotected read-modify-write on shared SoC-level GPIO controller registers?

Bypassing GPIO APIs to directly modify global registers could race with the
primary GPIO driver and corrupt configurations for other pins.


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
	ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
    ...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
	/* Skip interrupt in LS2K_BMC_INT_INTERVAL */
	if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
		schedule_work(&ddata->bmc_reset_work);
		last_jiffies =3D jiffies;
	}

	return IRQ_HANDLED;
}

[Severity: High]
This isn't a bug introduced by this patch, but does this interrupt handler
unconditionally claim shared interrupts without checking the hardware statu=
s?

Because this interrupt is requested with IRQF_SHARED, unconditionally
returning IRQ_HANDLED could cause every interrupt from other shared devices=
 to
trigger a 10-second system freeze, and it defeats spurious interrupt detect=
ion.

Additionally, the static last_jiffies is modified locklessly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v7-0-8aa0fb5a5462@gmail.com?part=3D2
