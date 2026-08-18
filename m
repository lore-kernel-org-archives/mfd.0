Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1845455199;
	Tue, 18 Aug 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049608; cv=none; b=Dyw9nwhYcEFHVvNspRU+7z4J+T22rrzR17zYlYO0se4HRXXTil+z4FXlBo+X8GMf+N2khpoe/+dQM2WdB95oSpCgK7yMhwQG0iWpswE3gg+EK8vw/K5jX8KMnGqMPLVO8vErAGdrucclc31xcZYWPFN7kPhIyayAszFmc+QQpSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049608; c=relaxed/simple;
	bh=F4SIiDMWtXLHCp9nVDDPWHXKYklq7fyhIofi7nzuZTI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XcWUmSYiT7hfyANgESV9o6Xlg9giZV7RPo0WeKa7aQU5FglS2QkBTM6J4FBjb/qZbQ1T5IKwuOsXZmnGd7VgIRTnhBhhNhwZwurtYPvdG75iOCa8owsgLy8cX2IqKfhAORymBfeWHB/SNMulqoWK0Dc/Qi+CnyzZ3bGu07YJL5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYwqkK8h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYwqkK8h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EA31F000E9;
	Tue, 18 Aug 2026 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049607;
	bh=d2TxfaxaPJr8VxTAlo/fmF1e5A/wJ2wZuGQdQuw2itk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FYwqkK8hGIXNOAAtvvnMMBmupEOdsTyBPhPnbZrk3N8uVS4LBv5DR1QRIq9xdmkLC
	 W1OraUkF5nC1Uw0GdAJcjfbI23d1NiWjHkXVxwp+b3bTleBG3C5v3E5sPxVIII1ah6
	 aAVy72REA5x/xhkpyb+o2i2o/N6+IXISMHF+g/usnHDUFS4500E9JKTfg28wO5lyBr
	 Zf/0q6wsEiyYCY4ddP/hXFpyQFJ+ebWzYSLlxjpT9dnaMVkMAnNg5m+2vIwTanWEGu
	 SAjKkYxmh/6qHppAvwh/qf0V6IaO6VJT5dlrg9kIHEw48Nly6k7Wn4EE2L3te3JO1a
	 uMhmcZx9bfXSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/6] mfd: aspeed-pci-core: add AST2600 PCIe BMC
 device driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:40:06 +0000
Message-Id: <20260818104007.09EA31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The driver mutates a static global array (`aspeed_uart_port`) duri=
ng device probe, causing data corruption and race conditions if multiple de=
vices are present.
- [Medium] Using the MFD subsystem API for a single-function device violate=
s MFD design guidelines.
- [Medium] The driver unconditionally computes memory-mapped I/O addresses =
from PCIe BAR 1 without verifying the BAR's existence, type, or size.
- [Low] The commit message subject violates MFD capitalization conventions.
- [Low] The PCI device ID table is missing the `const` qualifier.
--

--- Patch [4]: [PATCH v6 4/6] mfd: aspeed-pci-core: add AST2600 PCIe BMC de=
vice driver ---
commit 91187d47ec6898e7565aba419a47fd407dec5f6c
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

mfd: aspeed-pci-core: add AST2600 PCIe BMC device driver
   =20
Add support for UART over PCIe between ASPEED AST2600 BMC and
host. This is the host-side driver.

> mfd: aspeed-pci-core: add AST2600 PCIe BMC device driver

[Severity: Low]
This isn't a bug, but the MFD subsystem guidelines require capitalizing the
description after the prefix. Should "add" be "Add"?

> diff --git a/drivers/mfd/aspeed-pci-core.c b/drivers/mfd/aspeed-pci-core.c
> new file mode 100644
> index 0000000000000..2f299955bc1b7
> --- /dev/null
> +++ b/drivers/mfd/aspeed-pci-core.c
> @@ -0,0 +1,115 @@

[ ... ]

> +static const unsigned int vuart_msi_index[ASPEED_BMC_NR_VUART] =3D { 16,=
 17 };
> +static const u16 vuart_port_addr[ASPEED_BMC_NR_VUART] =3D { 0x3f8, 0x2f8=
 };
> +
> +static struct plat_serial8250_port aspeed_uart_port[ASPEED_BMC_NR_VUART =
+ 1] =3D {
> +	{
> +		.uartclk =3D 115200 * 16,
> +		.iotype =3D UPIO_MEM32,
> +		.type =3D PORT_16550A,
> +		.flags =3D (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE),
> +		.regshift =3D 2
> +	},
> +	{
> +		.uartclk =3D 115200 * 16,
> +		.iotype =3D UPIO_MEM32,
> +		.type =3D PORT_16550A,
> +		.flags =3D (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE),
> +		.regshift =3D 2
> +	},
> +	{ 0 }
> +};
> +
> +static const struct mfd_cell aspeed_bmc_cell =3D {
> +	.name		=3D "serial8250",
> +	.platform_data	=3D aspeed_uart_port,
> +	.pdata_size	=3D sizeof(aspeed_uart_port),
> +};
> +
> +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev)
> +{
> +	resource_size_t bar =3D pci_resource_start(pdev, 1);
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ASPEED_BMC_NR_VUART; i++) {
> +		aspeed_uart_port[i].mapbase =3D bar + (vuart_port_addr[i] << 2);
> +		aspeed_uart_port[i].irq =3D pci_irq_vector(pdev, vuart_msi_index[i]);
> +	}

[Severity: High]
Since aspeed_uart_port is a static global array, won't concurrent device pr=
obes
overwrite the hardware parameters for other ASPEED AST2600 PCI devices?

Should the mfd_cell and aspeed_uart_port structures be dynamically allocated
locally per device during probe to avoid this data corruption?

[Severity: Medium]
Does this code compute memory-mapped I/O addresses without verifying if BAR=
 1
actually has IORESOURCE_MEM set, or checking if the resource length is large
enough? Could an untrusted device presenting a smaller or disabled BAR 1 le=
ad
to an unauthorized or out-of-bounds physical memory mapping primitive?

> +
> +	return 0;
> +}

[ ... ]

> +static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev,
> +					    const struct pci_device_id *ent)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int rc =3D 0;

[ ... ]

> +	aspeed_pci_bmc_device_setup_vuart(pdev);
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +				    &aspeed_bmc_cell, 1, &pdev->resource[1],
> +				    0, NULL);
> +}

[Severity: Medium]
This isn't a bug, but MFD subsystem guidelines state that the MFD API should
only be used for devices registering multiple children.=20

Since devm_mfd_add_devices() is being called with only a single cell, would=
 it
be more appropriate to implement this as a standard PCI driver until multip=
le
features are actually implemented?

> +
> +static struct pci_device_id aspeed_bmc_dev_pci_ids[] =3D {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_ASPEED, ASPEED_BMC_PCI_DEVICE_ID),
> +		.class =3D PCI_CLASS_OTHERS << 16,
> +		.class_mask =3D 0xFFFF00
> +	},
> +	{ 0 }
> +};

[Severity: Low]
Should this PCI device ID table be declared with the const qualifier so it
compiles into the read-only data section instead of writable memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-aspeed-dri=
ver-v6-v6-0-fd7cc0b338ea@9elements.com?part=3D4
