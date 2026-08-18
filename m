Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C4F455192;
	Tue, 18 Aug 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049645; cv=none; b=uRVd4EeYzd1AOqSqTBRqgdtKswpXCKc44g59DQYztPKooyJ5Ckf0TiR/7L+WrjpsdqevDSY4GEKcbjAkCk8ScYSIQznn6raJoeNsRfuFS7+UsTxBSeZRJvAFbGUsW/hExu8nLGgi+mxuxf1ZwoMamkxf/6QA7FmJ9s3N15vUfxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049645; c=relaxed/simple;
	bh=MFMupQpp0art0Cm2bvZVYaMljbxWx9mUHrcryhiZwHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Fy9qOH31YA6AO+W6YOFKMp5ciaxKU3GRXBe+xX+jEwAc2MsJomw5AfM+c5C3V2m06nxoEoa28ZUZIOiIfIg3gftFxbLtjgDYyqI20+rvt/AO7I1gLxcty+vJygSynSOVHO+x6Vqw17dtBkYS1p6xY5dOydxbtO3c5YotxbOQMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYP8jTFx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYP8jTFx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01161F000E9;
	Tue, 18 Aug 2026 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049644;
	bh=LNn2ZbwuyW8Xs+OoMhWvXKrY0Fa2mxkL5xFG8SpxeNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kYP8jTFxbcrkABQ9dt+5fZGMPnqa5RbkyTmH4L4UO6a4AaTpZGGGAg2cHvtjft6tV
	 iokw3qPjVzV1DTByKZnhNTwZJCXjuPBqa6ZSueGudFJ5d3kqj8Wjwfqka1qXWw5GgP
	 EBN/I1JOVZR+vMCUfs2AYd0VAghRRt+7uNBhf/jQ3V2Ct+bF1VFsQu3FcHL+JMMYP1
	 bKPkPc40lE0Q56/b8KdUkPSywYQdCxkNvo/bLlyrgTj5lzswZawoqlWd2DQWtj91Gl
	 +VIH0GcNC+J+gAQ7mha48ttA+tIjm5WnUwq1bQt2FrZn7klgu3qPoaL+hA6wXFiNvc
	 gfWxb5AiMygyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] serial: 8250_aspeed_vuart: add VUART over PCI
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260818-aspeed-driver-v6-v6-3-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-3-fd7cc0b338ea@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:40:42 +0000
Message-Id: <20260818104043.A01161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Implicit dependency on <linux/bitfield.h> for the FIELD_PREP macro.
- [Low] Unconditional dev_err() logging in the PCI setup helper will cause =
log spam if the SCU syscon defers probe.
- [Low] The return values of regmap operations are ignored and incorrectly =
shadowed by a hardcoded -EIO.

Pre-existing issues:
- [Critical] Probe error paths after successful 8250 port registration fail=
 to unregister the serial port, causing a severe use-after-free memory corr=
uption and resource leak.
--

--- Patch [3]: [PATCH v6 3/6] serial: 8250_aspeed_vuart: add VUART over PCI=
 ---
commit 873385535bf5e6c8576b6766719e73dd291a9a25
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

serial: 8250_aspeed_vuart: add VUART over PCI

This patch enables VUART over PCI for the AST2600 by configuring the
SCU registers when the 'aspeed,vuart-over-pci' property is set. It sets
up the PCI device enable bits, sets the PCI class code, and configures MSI
interrupts.

> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/se=
rial/8250/8250_aspeed_vuart.c
> index 6afa2f4057e1b..2360d37139bfa 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -32,6 +32,28 @@
>  #define ASPEED_VUART_DEFAULT_SIRQ	4
>  #define ASPEED_VUART_DEFAULT_SIRQ_POLARITY	IRQ_TYPE_LEVEL_LOW
> =20
> +#define ASPEED_SCU_SILICON_REVISION_ID			0x04
> +#define AST2600A3_REVISION_ID				0x05030303
> +
> +#define ASPEED_SCU_PCIE_CONF_CTRL 0xC20
> +#define  SCU_PCIE_CONF_BMC_DEV_EN					BIT(8)
> +#define  SCU_PCIE_CONF_BMC_DEV_EN_MMIO				BIT(9)
> +#define  SCU_PCIE_CONF_BMC_DEV_EN_MSI				BIT(11)
> +#define  SCU_PCIE_CONF_BMC_DEV_EN_IRQ				BIT(13)
> +#define  SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER	BIT(14)
> +#define  SCU_PCIE_CONF_BMC_DEV_EN_E2L				BIT(15)
> +#define  SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE		BIT(21)
> +
> +#define ASPEED_SCUC24 0xC24
> +#define  ASPEED_SCUC24_MSI_ROUTING_MASK				GENMASK(11, 10)
> +#define  ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1 \
> +		FIELD_PREP(ASPEED_SCUC24_MSI_ROUTING_MASK, 2)

[Severity: Low]
Does this code rely on FIELD_PREP() without including <linux/bitfield.h>?

> +#define  ASPEED_SCUC24_RESERVED_14					BIT(14)
> +#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN	BIT(17)
> +#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN	BIT(18)
> +
> +#define ASPEED_SCU_BMC_DEV_CLASS	0xC68

[ ... ]

> @@ -412,6 +434,66 @@ static int aspeed_vuart_map_irq_polarity(u32 dt)
>  	}
>  }
> =20
> +static int aspeed_ast2600_vuart_over_pci_set_enabled(struct platform_dev=
ice *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	u32 silicon_revision_id;
> +	struct regmap *scu;
> +	int rc;
> +
> +	u32 pcie_config_ctl =3D SCU_PCIE_CONF_BMC_DEV_EN_IRQ |
> +				SCU_PCIE_CONF_BMC_DEV_EN_MMIO |
> +				SCU_PCIE_CONF_BMC_DEV_EN_MSI |
> +				SCU_PCIE_CONF_BMC_DEV_EN_PCIE_BUS_MASTER |
> +				SCU_PCIE_CONF_BMC_DEV_EN_E2L |
> +				SCU_PCIE_CONF_BMC_DEV_EN_LPC_DECODE |
> +				SCU_PCIE_CONF_BMC_DEV_EN;
> +
> +	scu =3D syscon_regmap_lookup_by_phandle(dev->of_node, "aspeed,scu-sysco=
n");
> +	if (IS_ERR(scu)) {
> +		dev_err(dev, "failed to find SCU regmap\n");
> +		return PTR_ERR(scu);
> +	}

[Severity: Low]
If syscon_regmap_lookup_by_phandle() returns -EPROBE_DEFER, will this
unconditional dev_err() cause unnecessary log spam during boot?=20

The caller properly wraps the return with dev_err_probe(), so removing the
dev_err() here might be cleaner.

> +
> +	/* update class code to be an Unassigned/device specific class device */
> +	if (regmap_write(scu, ASPEED_SCU_BMC_DEV_CLASS, 0xff000000)) {
> +		dev_err(dev, "could not set PCIe class code\n");
> +		return -EIO;
> +	}

[Severity: Low]
Is it better to propagate the actual regmap_write() error code instead
of shadowing it with a hardcoded -EIO? Returning the original error might
help with debugging upstream failures.

[ ... ]

> @@ -540,6 +622,15 @@ static int aspeed_vuart_probe(struct platform_device=
 *pdev)
>  	aspeed_vuart_set_host_tx_discard(vuart, true);
>  	platform_set_drvdata(pdev, vuart);
> =20
> +	if (of_device_is_compatible(dev->of_node, "aspeed,ast2600-vuart") &&
> +	    of_property_read_bool(dev->of_node, "aspeed,vuart-over-pci")) {
> +		rc =3D aspeed_ast2600_vuart_over_pci_set_enabled(pdev);
> +		if (rc < 0) {
> +			dev_err_probe(dev, rc, "could not enable VUART over PCI\n");
> +			goto err_sysfs_remove;
> +		}
> +	}
> +

[Severity: Critical]
This is a pre-existing issue, but does jumping to err_sysfs_remove here leak
the registered 8250 port?

If aspeed_ast2600_vuart_over_pci_set_enabled() fails, we jump to
err_sysfs_remove which currently looks like this:

err_sysfs_remove:
	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
	return rc;

Since serial8250_register_8250_port() was already called earlier in
aspeed_vuart_probe(), the port remains registered. The driver core will free
the devm-managed vuart structure when probe fails, potentially leaving a
dangling pointer in the TTY layer that could trigger a use-after-free upon
port open or interrupt.

Would it be safer to add a call to serial8250_unregister_port() in the error
cleanup path?

>  	return 0;
> =20
>  err_sysfs_remove:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-aspeed-dri=
ver-v6-v6-0-fd7cc0b338ea@9elements.com?part=3D3
