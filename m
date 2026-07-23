Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5C4746D6;
	Thu, 23 Jul 2026 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811486; cv=none; b=RSZfQZ+ObNEd1VTLCLxgo0sqhn+qYosr6tv3BfNQZq0FGWXHH+SwHDduOXVNKGsNbwkOguuq2i9oaRHmJ1eaENrt+scBYYdqKkBYQBkX3188TslO7qiXua9vpZHCypfvWhebVbhlf6liSN3G5kJ3gGVamf5lO/81m3r583KRegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811486; c=relaxed/simple;
	bh=rnP1kFkP5hW+SIokvHcfZLqLdB+WwLjbOTI+/3hLGOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojYZLROg58oe1A31FBHbzdPD/kiPiGioTwFwbNxnGUdU96+1fWQksgERObhXuS2GGE+uSRZfKubGBrbXU1rj9vULMQiO2jZdEFDZ2wRiBvlqthKs64ZI597SnbsOS/HzEval2KPZidKjkYRFQYK41QHyqpBBZLUukFpjAxIb3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiVfcJFE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiVfcJFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0C51F000E9;
	Thu, 23 Jul 2026 12:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784811484;
	bh=pOUzA6E4X0zy/4hDERDHxrNh/C2Y4AiK6dibktX+THA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IiVfcJFESu+UBurux65E7NhsIs1Y0PklXa71L5ryxVvQF4lhhhmR4ROeBqSleTn/N
	 wpD6fXiLGNO5bhlZ0NjtJwn2S0RvXVcYqfMi9H1R1bdbwQWAmwrOUObojtcccXa4Rq
	 wI246NcACEKPAwQAnTCmXUtuaaqVw0ywhWBG51oA6/EdsDMPrB/eBEruVorSFydpEn
	 Fck9SaLCz7ga7Dgp5Nbx+G0kHQpDQX5/bGGm+RPnumtcFpkPnZqeHx6BGu+icG1Nei
	 JenAcpZS4dHj4iw+6mMNpmMe2uVB0ovkA9Dc1ATNiNgj/SsK8ItdDQR3oEV5hi3R93
	 x0uFRcjAuyb3g==
Date: Thu, 23 Jul 2026 13:58:00 +0100
From: Lee Jones <lee@kernel.org>
To: MANNURU VENKATESWARLU <v-mannuru@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, n-francis@ti.com, s-k6@ti.com,
	bb@ti.com
Subject: Re: [RFC PATCH 05/22] mfd: ti-ddrss: Add TI K3 DDR subsystem MFD
 core driver
Message-ID: <20260723125800.GJ3363113@google.com>
References: <20260714125553.3304282-1-v-mannuru@ti.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714125553.3304282-1-v-mannuru@ti.com>

On Tue, 14 Jul 2026, MANNURU VENKATESWARLU wrote:

> Add a multi-function device core driver for the TI K3 DDR
> subsystem wrapper. The driver maps DDR controller registers, reads
> SoC-specific configuration via device match data, and instantiates
> the MR4 refresh-rate and PMU child devices.
> 
> Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
> ---
>  drivers/mfd/Kconfig          |  13 ++
>  drivers/mfd/Makefile         |   1 +
>  drivers/mfd/ti-ddrss-core.c  | 280 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/ti-ddrss.h |  53 +++++++
>  4 files changed, 347 insertions(+)
>  create mode 100644 drivers/mfd/ti-ddrss-core.c
>  create mode 100644 include/linux/mfd/ti-ddrss.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 35f6e9b76d056..a13ecc212f58e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1834,6 +1834,19 @@ config MFD_TI_LP87565
>  	  This driver can also be built as a module. If so, the module
>  	  will be called lp87565.
>  
> +config MFD_TI_DDRSS
> +	tristate "TI K3 DDR Subsystem"
> +	depends on ARCH_K3 || COMPILE_TEST
> +	select MFD_CORE
> +	select REGMAP_MMIO
> +	help
> +	  Core MFD driver for TI K3 DDR subsystem. Provides register access
> +	  management and coordinates hwmon temperature monitoring and perf
> +	  counter child drivers for DDR performance and thermal monitoring.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called ti-ddrss-core.
> +
>  config MFD_TPS65218
>  	tristate "TI TPS65218 Power Management chips"
>  	depends on I2C && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index dd4bb7e77c336..1258d09f3a40b 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_MFD_MACSMC)	+= macsmc.o
>  obj-$(CONFIG_MFD_TI_LP873X)	+= lp873x.o
>  obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
>  obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
> +obj-$(CONFIG_MFD_TI_DDRSS) += ti-ddrss-core.o
>  
>  obj-$(CONFIG_MFD_STMPE)		+= stmpe.o
>  obj-$(CONFIG_STMPE_I2C)		+= stmpe-i2c.o
> diff --git a/drivers/mfd/ti-ddrss-core.c b/drivers/mfd/ti-ddrss-core.c
> new file mode 100644
> index 0000000000000..a12a54e3461e1
> --- /dev/null
> +++ b/drivers/mfd/ti-ddrss-core.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ti-ddrss-core.c -- TI DDR Subsystem MFD core driver

No filenames please - they have a habit of bit-rotting.

No such thing as an "MFD core driver", please describe the device.

> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/ti-ddrss.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +/* J7 Register offsets */
> +#define J7_INT_STAT				0x494
> +#define J7_INT_ACK				0x49C
> +#define J7_INT_MASK				0x4A4
> +#define J7_TEMP_REG0				0x288
> +#define J7_TEMP_REG1				0x28C
> +
> +/* AM62 Register offsets */
> +#define AM62_INT_STAT_MASTER			0x538
> +#define AM62_INT_MASK_MASTER			0x53C
> +#define AM62_INT_MASK_MISC			0x594
> +#define AM62_INT_STAT_MISC			0x554
> +#define AM62_INT_ACK_MISC			0x574
> +#define AM62_TEMP_REG0				0x2F8
> +#define AM62_TEMP_REG1				0x2FC
> +
> +/* AM62A Register offsets */
> +#define AM62A_INT_STAT_MASTER			0x558
> +#define AM62A_INT_MASK_MASTER			0x55C
> +#define AM62A_INT_MASK_MISC			0x5B4
> +#define AM62A_INT_STAT_MISC			0x574
> +#define AM62A_INT_ACK_MISC			0x594
> +#define AM62A_TEMP_REG0				0x304
> +#define AM62A_TEMP_REG1				0x308
> +
> +/*
> + * tRAS_MAX / tREF register offsets  (byte offset = CTL_N * 4)
> + *
> + * J7:      TRAS_MAX F0/F1/F2 = CTL_44/46/48, 17-bit [16:0]
> + *          TREF     F0/F1/F2 = CTL_61/63/65, 20-bit [19:0]
> + * AM62/64: TRAS_MAX F0/F1/F2 = CTL_55/58/61, 20-bit [19:0]
> + *          TREF     F0/F1/F2 = CTL_73/75/77, 20-bit [19:0]
> + * AM62A/P: TRAS_MAX F0/F1/F2 = CTL_57/60/63, 20-bit [19:0]
> + *          TREF     F0/F1/F2 = CTL_75/77/79, 20-bit [19:0]
> + */
> +#define J7_TRAS_MAX_F0				0x0B0
> +#define J7_TRAS_MAX_F1				0x0B8
> +#define J7_TRAS_MAX_F2				0x0C0
> +#define J7_TREF_F0				0x0F4
> +#define J7_TREF_F1				0x0FC
> +#define J7_TREF_F2				0x104
> +
> +#define AM62_TRAS_MAX_F0			0x0DC
> +#define AM62_TRAS_MAX_F1			0x0E8
> +#define AM62_TRAS_MAX_F2			0x0F4
> +#define AM62_TREF_F0				0x124
> +#define AM62_TREF_F1				0x12C
> +#define AM62_TREF_F2				0x134
> +
> +#define AM62A_TRAS_MAX_F0			0x0E4
> +#define AM62A_TRAS_MAX_F1			0x0F0
> +#define AM62A_TRAS_MAX_F2			0x0FC
> +#define AM62A_TREF_F0				0x12C
> +#define AM62A_TREF_F1				0x134
> +#define AM62A_TREF_F2				0x13C
> +
> +static const struct reg_field j7_reg[] = {
> +	/* J7: single bit (28) covers both group and TUF - no separate masking levels */
> +	[K3_DDR_INT_STAT_MASTER]        = REG_FIELD(J7_INT_STAT, 28, 28),
> +	[K3_DDR_INT_MASK_MASTER_MISC]   = REG_FIELD(J7_INT_MASK, 28, 28),
> +	[K3_DDR_INT_MASK_MASTER_GLOBAL] = { 0 }, /* not applicable for J7 */
> +	[K3_DDR_INT_MASK_TUF]           = { 0 }, /* not applicable for J7 */
> +	[K3_DDR_INT_STAT_TUF]           = REG_FIELD(J7_INT_STAT, 28, 28),
> +	[K3_DDR_INT_ACK_TUF]            = REG_FIELD(J7_INT_ACK, 28, 28),

Why this step?  It looks odd.  Line them all up or none please.

> +	[K3_DDR_TEMP_REG0_FIELD0] = REG_FIELD(J7_TEMP_REG0, 8, 10),
> +	[K3_DDR_TEMP_REG0_FIELD1] = REG_FIELD(J7_TEMP_REG0, 16, 18),
> +	[K3_DDR_TEMP_REG1_FIELD0] = REG_FIELD(J7_TEMP_REG1, 0, 2),
> +	[K3_DDR_TEMP_REG1_FIELD1] = REG_FIELD(J7_TEMP_REG1, 8, 10),
> +	[K3_DDR_TRAS_MAX_F0]      = REG_FIELD(J7_TRAS_MAX_F0, 0, 16),
> +	[K3_DDR_TRAS_MAX_F1]      = REG_FIELD(J7_TRAS_MAX_F1, 0, 16),
> +	[K3_DDR_TRAS_MAX_F2]      = REG_FIELD(J7_TRAS_MAX_F2, 0, 16),
> +	[K3_DDR_TREF_F0]          = REG_FIELD(J7_TREF_F0, 0, 19),
> +	[K3_DDR_TREF_F1]          = REG_FIELD(J7_TREF_F1, 0, 19),
> +	[K3_DDR_TREF_F2]          = REG_FIELD(J7_TREF_F2, 0, 19),
> +};
> +
> +static const struct reg_field am62_reg[] = {
> +	[K3_DDR_INT_STAT_MASTER]        = REG_FIELD(AM62_INT_STAT_MASTER, 7, 7),
> +	[K3_DDR_INT_MASK_MASTER_MISC]   = REG_FIELD(AM62_INT_MASK_MASTER, 7, 7),
> +	[K3_DDR_INT_MASK_MASTER_GLOBAL] = REG_FIELD(AM62_INT_MASK_MASTER, 31, 31),
> +	[K3_DDR_INT_MASK_TUF]           = REG_FIELD(AM62_INT_MASK_MISC, 5, 5),
> +	[K3_DDR_INT_STAT_TUF]           = REG_FIELD(AM62_INT_STAT_MISC, 5, 5),
> +	[K3_DDR_INT_ACK_TUF]            = REG_FIELD(AM62_INT_ACK_MISC, 5, 5),
> +	[K3_DDR_TEMP_REG0_FIELD0] = REG_FIELD(AM62_TEMP_REG0, 24, 26),
> +	[K3_DDR_TEMP_REG0_FIELD1] = REG_FIELD(AM62_TEMP_REG0, 28, 30),
> +	[K3_DDR_TEMP_REG1_FIELD0] = REG_FIELD(AM62_TEMP_REG1, 0, 2),
> +	[K3_DDR_TEMP_REG1_FIELD1] = REG_FIELD(AM62_TEMP_REG1, 4, 6),
> +	[K3_DDR_TRAS_MAX_F0]      = REG_FIELD(AM62_TRAS_MAX_F0, 0, 19),
> +	[K3_DDR_TRAS_MAX_F1]      = REG_FIELD(AM62_TRAS_MAX_F1, 0, 19),
> +	[K3_DDR_TRAS_MAX_F2]      = REG_FIELD(AM62_TRAS_MAX_F2, 0, 19),
> +	[K3_DDR_TREF_F0]          = REG_FIELD(AM62_TREF_F0, 0, 19),
> +	[K3_DDR_TREF_F1]          = REG_FIELD(AM62_TREF_F1, 0, 19),
> +	[K3_DDR_TREF_F2]          = REG_FIELD(AM62_TREF_F2, 0, 19),
> +};
> +
> +static const struct reg_field am62a_reg[] = {
> +	[K3_DDR_INT_STAT_MASTER]        = REG_FIELD(AM62A_INT_STAT_MASTER, 7, 7),
> +	[K3_DDR_INT_MASK_MASTER_MISC]   = REG_FIELD(AM62A_INT_MASK_MASTER, 7, 7),
> +	[K3_DDR_INT_MASK_MASTER_GLOBAL] = REG_FIELD(AM62A_INT_MASK_MASTER, 31, 31),
> +	[K3_DDR_INT_MASK_TUF]           = REG_FIELD(AM62A_INT_MASK_MISC, 5, 5),
> +	[K3_DDR_INT_STAT_TUF]           = REG_FIELD(AM62A_INT_STAT_MISC, 5, 5),
> +	[K3_DDR_INT_ACK_TUF]            = REG_FIELD(AM62A_INT_ACK_MISC, 5, 5),
> +	[K3_DDR_TEMP_REG0_FIELD0] = REG_FIELD(AM62A_TEMP_REG0, 8, 10),
> +	[K3_DDR_TEMP_REG0_FIELD1] = REG_FIELD(AM62A_TEMP_REG0, 12, 14),
> +	[K3_DDR_TEMP_REG1_FIELD0] = REG_FIELD(AM62A_TEMP_REG1, 0, 2),
> +	[K3_DDR_TEMP_REG1_FIELD1] = REG_FIELD(AM62A_TEMP_REG1, 4, 6),
> +	[K3_DDR_TRAS_MAX_F0]      = REG_FIELD(AM62A_TRAS_MAX_F0, 0, 19),
> +	[K3_DDR_TRAS_MAX_F1]      = REG_FIELD(AM62A_TRAS_MAX_F1, 0, 19),
> +	[K3_DDR_TRAS_MAX_F2]      = REG_FIELD(AM62A_TRAS_MAX_F2, 0, 19),
> +	[K3_DDR_TREF_F0]          = REG_FIELD(AM62A_TREF_F0, 0, 19),
> +	[K3_DDR_TREF_F1]          = REG_FIELD(AM62A_TREF_F1, 0, 19),
> +	[K3_DDR_TREF_F2]          = REG_FIELD(AM62A_TREF_F2, 0, 19),
> +};
> +
> +static const struct k3_ddr_cfg j7_cfg = {
> +	.cfg_fields = j7_reg,

Make it obvious that this is an array, else it looks like a value.

j7_registers would be better.  Same below.

> +	.has_intr_group = false,
> +	.identifier = "J7",
> +};
> +
> +static const struct k3_ddr_cfg am62_cfg = {
> +	.cfg_fields = am62_reg,
> +	.has_intr_group = true,
> +	.has_mask_misc = true,
> +	.identifier = "AM62",
> +};
> +
> +static const struct k3_ddr_cfg am62a_cfg = {
> +	.cfg_fields = am62a_reg,
> +	.has_intr_group = true,
> +	.has_mask_misc = true,
> +	.identifier = "AM62A",
> +};
> +
> +static const struct k3_ddr_cfg am64_cfg = {
> +	.cfg_fields = am62_reg,
> +	.has_intr_group = true,
> +	.has_mask_misc = true,
> +	.identifier = "AM64",
> +};
> +
> +static const struct k3_ddr_cfg am62p_cfg = {
> +	.cfg_fields = am62a_reg,
> +	.has_intr_group = true,
> +	.has_mask_misc = true,
> +	.identifier = "AM62P",
> +};
> +
> +static const struct regmap_config ti_ddrss_regmap_config = {
> +	.reg_bits	= 32,
> +	.val_bits	= 32,
> +	.reg_stride	= 4,
> +	.fast_io	= true,
> +};
> +
> +static const struct mfd_cell ti_ddrss_cells[] = {
> +	MFD_CELL_NAME("ti-ddrss-mr4"),
> +	MFD_CELL_OF("ti-k3-ddr-pmu", NULL, NULL, 0, 0, "ti,k3-ddr-pmu"),
> +};
> +
> +static int ti_ddrss_probe(struct platform_device *pdev)
> +{
> +	struct device_node *child_np, *pmu_np;
> +	struct ti_ddrss_dev *ddrss;

_dev is confusing.  It should be _ddata.

Then call the variable dddata and we'll all know what this is.

> +	struct device *dev = &pdev->dev;
> +	struct resource res;
> +	void __iomem *base;
> +	int irq, ncells, ret;
> +
> +	ddrss = devm_kzalloc(dev, sizeof(*ddrss), GFP_KERNEL);
> +	if (!ddrss)
> +		return -ENOMEM;
> +
> +	ddrss->dev = dev;
> +	ddrss->cfg = device_get_match_data(dev);
> +	if (!ddrss->cfg)
> +		return dev_err_probe(dev, -ENODEV, "No match data found\n");
> +
> +	child_np = of_get_child_by_name(dev->of_node, "ddr");
> +	if (!child_np)
> +		return dev_err_probe(dev, -ENODEV, "ddr child node not found\n");

This isn't a very user-friendly error message.  What's 'ddr'?

> +	ret = of_address_to_resource(child_np, 0, &res);
> +	if (ret) {
> +		of_node_put(child_np);
> +		return dev_err_probe(dev, ret, "Failed to get register address\n");
> +	}
> +
> +	base = devm_ioremap_resource(dev, &res);
> +	of_node_put(child_np);
> +
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);

Are we assuming that this is -ENOMEM?  Nothing else possible?

> +	ddrss->base = base;

Why use the local variable at all?

> +	ddrss->sscfg = devm_platform_ioremap_resource_byname(pdev, "ss_cfg");
> +	if (IS_ERR(ddrss->sscfg))
> +		return dev_err_probe(dev, PTR_ERR(ddrss->sscfg),
> +				     "Failed to map SSCFG registers\n");

devm_platform_ioremap_resource_byname() should already spit out an error log.

> +	ddrss->regmap = devm_regmap_init_mmio(dev, base, &ti_ddrss_regmap_config);
> +	if (IS_ERR(ddrss->regmap))
> +		return dev_err_probe(dev, PTR_ERR(ddrss->regmap), "Failed to init regmap\n");
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ddrss->irq = irq;

As above.

> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_get_noresume(dev);
> +
> +	platform_set_drvdata(pdev, ddrss);
> +
> +	pmu_np = of_get_child_by_name(dev->of_node, "pmu");
> +	ncells = pmu_np ? ARRAY_SIZE(ti_ddrss_cells) : 1;

Deserves a comment.


> +	of_node_put(pmu_np);
> +
> +	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +				   ti_ddrss_cells, ncells, NULL, 0, NULL);
> +	if (ret) {
> +		pm_runtime_put_noidle(dev);
> +		return dev_err_probe(dev, ret, "Failed to register child devices\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void ti_ddrss_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_put_noidle(&pdev->dev);
> +}

devm_add_action_or_reset()?

> +static const struct of_device_id ti_ddrss_of_match[] = {
> +	{ .compatible = "ti,j721s2-ddrss", .data = &j7_cfg  },
> +	{ .compatible = "ti,j721e-ddrss",  .data = &j7_cfg  },
> +	{ .compatible = "ti,j7-ddrss",     .data = &j7_cfg  },
> +	{ .compatible = "ti,am62-ddrss", .data = &am62_cfg },
> +	{ .compatible = "ti,am62a-ddrss", .data = &am62a_cfg },
> +	{ .compatible = "ti,am64-ddrss", .data = &am64_cfg },
> +	{ .compatible = "ti,am62p-ddrss", .data = &am62p_cfg },

Tab?

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ti_ddrss_of_match);
> +
> +static struct platform_driver ti_ddrss_driver = {
> +	.driver = {
> +		.name = "ti-ddrss",
> +		.of_match_table = ti_ddrss_of_match,
> +	},
> +	.probe = ti_ddrss_probe,
> +	.remove = ti_ddrss_remove,
> +};
> +

Nit: Remove this line please.

> +module_platform_driver(ti_ddrss_driver);
> +
> +MODULE_DESCRIPTION("TI K3 DDR Subsystem core driver");
> +MODULE_AUTHOR("Texas Instruments Inc");

That's not what this is for.

> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/ti-ddrss.h b/include/linux/mfd/ti-ddrss.h
> new file mode 100644
> index 0000000000000..32ea3527978e0
> --- /dev/null
> +++ b/include/linux/mfd/ti-ddrss.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * ti-ddrss.h -- TI DDR Subsystem MFD device header

Filenames.

> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +#ifndef __LINUX_MFD_TI_DDRSS_H
> +#define __LINUX_MFD_TI_DDRSS_H
> +
> +#include <linux/regmap.h>
> +
> +enum k3_ddr_fields {
> +	K3_DDR_INT_STAT_MASTER,
> +	K3_DDR_INT_MASK_MASTER_MISC,   /* J7: combined bit; AM62/AM62A: MISC group */
> +	K3_DDR_INT_MASK_MASTER_GLOBAL, /* top-level enable - AM62/AM62A only */
> +	K3_DDR_INT_MASK_TUF,           /* TUF bit in MISC mask - AM62/AM62A only */
> +	K3_DDR_INT_STAT_TUF,
> +	K3_DDR_INT_ACK_TUF,
> +	K3_DDR_TEMP_REG0_FIELD0,
> +	K3_DDR_TEMP_REG0_FIELD1,
> +	K3_DDR_TEMP_REG1_FIELD0,
> +	K3_DDR_TEMP_REG1_FIELD1,
> +	/* tRAS_MAX and tREF for the three DDR Frequency Set Points.
> +	 * Must stay contiguous in this order: ti-ddrss-mr4.c uses
> +	 * K3_DDR_TRAS_MAX_F0+i and K3_DDR_TREF_F0+i to iterate FSPs.
> +	 */

This is not a properly formatted multi-line comment.

> +	K3_DDR_TRAS_MAX_F0,
> +	K3_DDR_TRAS_MAX_F1,
> +	K3_DDR_TRAS_MAX_F2,
> +	K3_DDR_TREF_F0,
> +	K3_DDR_TREF_F1,
> +	K3_DDR_TREF_F2,
> +	K3_DDR_MAX_FIELDS
> +};
> +
> +struct k3_ddr_cfg {
> +	const struct reg_field *cfg_fields;
> +	bool has_intr_group;  /* AM62/AM62A: separate group status register */
> +	bool has_mask_misc;   /* AM62/AM62A: three-level interrupt unmasking */
> +	const char *identifier;
> +};
> +
> +struct ti_ddrss_dev {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	int irq;
> +	const struct k3_ddr_cfg *cfg;
> +	void __iomem *base;   /* DDR controller base (regmap) */
> +	void __iomem *sscfg;  /* SSCFG base (PMU counters live here) */
> +};
> +
> +#endif
> -- 
> 2.34.1
> 

-- 
Lee Jones
