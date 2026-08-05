Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305644322F9;
	Wed,  5 Aug 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933008; cv=none; b=od1Rp/1UKG7kmpBiUVWhl8oBvrkaWlPFajXmFVuE9DAfDAe/lbFFQWKPhcHfS7e+KwkNpfmKcsmfBCx8mJINC/uaexikAmTzzHsxP3rbuL1eTTDoSkXQB4Gm6zHEB+xqlS7PAtLvogMfIDJLbGFOZz9kGUKmhXzBG2JlApRSwKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933008; c=relaxed/simple;
	bh=RekKhfDqB/D9DoOWl82/JlDMM9BLUjjagES816DJnUk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=leLuwKADfHpaT0uP6HWSyYz7xTFHSZDeOGA/t15sCsOwf/4Qafj40C6/TDz8FbGBP2IBhEc5Ajry9UGxStml+sZeLbTFu1xGWSNXs51aLQ2k/9Y+aVaKODQl14XMc3rOOi1NpwUgS7tuF1PBrvpjBqx35Gn0XDZbK05ingd7tco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5pXDIv+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5pXDIv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B98F1F00A3A;
	Wed,  5 Aug 2026 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785933006;
	bh=6lFOhiepGCaOGrevwMhsBSxN7qNtm+M7LUpVrUOsjNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R5pXDIv+mzFdrqmoPjeod5vV6guxqGwLlzhjyrM+DXLuaw79BUeHNN9FDWDaWxYML
	 dRcOb7RzRQa3izRqYEd8zWLz901CL5p9rn4rqSDuPH6wV3mwdETXuMK+KRttt/WM7z
	 EPEi3TDYktDxff4w//Cb5hUgp6O/SV77SR4jkrcuEelhO7nEBo4RdXFLUEm31otURN
	 tgq0ZezRnFIaoI7UGDeYcQMR0xk9qT/5PtnstjrECf/SNSRHShtiD1syPe0/sgdqgt
	 q9ta+h1CrARztCsd1kPihgp+PvzHmW3+H3DXKqRb0Y/wa0zhtVhuzvG+Jz+CC49TM6
	 1cHLEzi9zwc0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:30:06 +0000
Message-Id: <20260805123006.7B98F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The driver violates MFD subsystem guidelines by using the MFD AP=
I for a single-function device and dynamically generating its `mfd_cell` ar=
rays.
- [Low] The commit message prefix and driver structure naming do not adhere=
 to MFD subsystem standards.
--

--- Patch [4]: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device =
driver ---
commit 7554e65cc1603a70fab3089c5b74e52105ba9e5b
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

soc: mfd: add ASPEED AST2600 PCIe BMC device driver

Add support for UART over PCIe between ASPEED AST2600 BMC and host.
This is the host-side driver.

> soc: mfd: add ASPEED AST2600 PCIe BMC device driver

[Severity: Low]
This isn't a bug, but does the commit message prefix and capitalization fol=
low
the MFD subsystem guidelines? The standard format expects
mfd: <Driver>: <Capitalized description>.

> diff --git a/drivers/mfd/aspeed-pci-core.c b/drivers/mfd/aspeed-pci-core.c
> new file mode 100644
> index 0000000000000..ad6732133ec57
> --- /dev/null
> +++ b/drivers/mfd/aspeed-pci-core.c
> @@ -0,0 +1,120 @@

[ ... ]

> +static const unsigned int vuart_msi_index[ASPEED_BMC_VUART] =3D { 16, 17=
 };
> +static const u16 vuart_port_addr[ASPEED_BMC_VUART] =3D { 0x3f8, 0x2f8 };
> +
> +struct aspeed_pci_bmc_dev {
> +	struct plat_serial8250_port uart[ASPEED_BMC_VUART + 1];
> +	struct mfd_cell cell;
> +};

[Severity: Low]
This isn't a bug, but does this structure name follow the MFD naming
conventions? The guidelines recommend avoiding generic suffixes like "dev" =
and
instead preferring just the device name.

[ ... ]

> +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev,
> +					     struct aspeed_pci_bmc_dev *pci_bmc_dev)
> +{

[ ... ]

> +	for (i =3D 0; i < ASPEED_BMC_VUART; i++) {
> +		port =3D &pci_bmc_dev->uart[i];
> +
> +		/* ASPEED BMC device shift addresses by 2 to the left */
> +		vuart_ioport =3D vuart_port_addr[i] << 2;
> +
> +		port->mapbase =3D bar + vuart_ioport;
> +		port->uartclk =3D 115200 * 16;
> +		port->irq =3D pci_irq_vector(pdev, vuart_msi_index[i]);
> +		port->iotype =3D UPIO_MEM32;
> +		port->type =3D PORT_16550A;
> +		port->flags |=3D (UPF_IOREMAP | UPF_FIXED_PORT | UPF_FIXED_TYPE);
> +		port->regshift =3D 2;
> +	}
> +
> +	pci_bmc_dev->cell =3D (struct mfd_cell) {
> +		.name		=3D "serial8250",
> +		.platform_data	=3D pci_bmc_dev->uart,
> +		.pdata_size	=3D sizeof(pci_bmc_dev->uart),
> +	};
> +
> +	return 0;
> +}

[Severity: Medium]
Is it safe to generate the mfd_cell dynamically here? The MFD subsystem
guidelines explicitly forbid creating local dynamic copies of mfd_cell arra=
ys,
requiring them to be static const instead to avoid memory safety hazards.

[ ... ]

> +static int aspeed_pci_host_bmc_device_probe(struct pci_dev *pdev,
> +					    const struct pci_device_id *ent)
> +{

[ ... ]

> +	aspeed_pci_bmc_device_setup_vuart(pdev, pci_bmc_dev);
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +				    &pci_bmc_dev->cell, 1, &pdev->resource[1],
> +				    0, NULL);
> +}

[Severity: Medium]
Should the MFD API be used here for a device with only a single function? T=
he
code registers only one child (serial8250), which violates the MFD subsystem
rules that prohibit using the MFD API for single-function devices.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785932211.gi=
t.gregoire.layet@9elements.com?part=3D4
