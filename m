Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D94A4EE6;
	Wed, 14 Oct 2026 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971350; cv=none; b=JTjOQ+Fq8ZiNR2w9R6NwSHqXvC2Ihj66QcHuuHS4xFNIvvsPEpztQ5C9+EbN6Ea1Qhe5eBQ3SymfHBS4P67QH7aKRdEkvNCVwISvMsz/dsdxh1jaNPkEYB8XVyCVHchYwnuvhvgUsGHUWilsPH5Tru5/9u8bTB94Z9A9nQ2Bj1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971350; c=relaxed/simple;
	bh=rm5Ch+ilg9lCUpGUTF5E7PiMKTL5qUPE4xzjoyDGbAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBW8ao+Mg46XXIOUFM5f+bM/sTnul899a5IMJCoS+ICD0WVP6ZKoIg9+VZ/JHuRxD6Kh5OyoZWbHZiycithWizaLW/uNUO10Z9JuRYuHqkt4wDdffs52PNqK1L/N/OxNaqZnzBQfSiMfK8EtcB3KbhRwEgz2xUH9BjsAUygfVsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFcVEvjr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFcVEvjr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899C31F00893;
	Wed, 14 Oct 2026 09:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971347;
	bh=sY5jJmUWC1sGKTkbnKKLSeUEYY8bW4QndWaEeYIyfF0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XFcVEvjr03dffNQAvIKEw2Az/3j1AZ1jEsPHj+NMZFI7UDlsmyLhmzjm2IkTeHtKI
	 sjTfA4C89bEBGSs861LdYoFKEcl5Bz3IdbCOh0tB7jpVX6sq00Iu4MgBjdpdb59eKi
	 dCUEPnd06W/eASTZ73g3EG39+z9sqVLGsZ8fjMs0deOPqlayzFCszSTb7FbTCHuAWu
	 rWO7BtM9hxpZOzgZBZ6jZL5jnMIeBXjtIXhyRLxlWcQIVQt3FxXgAK13Gpe61vyoGZ
	 Lr/pIlss7XiBIxc6ombvVnHjf74EARt7kNiQV3mJzlOSHASmgkXS1N/HCME81zgre2
	 SrsIdN6fVOLpA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 11:48:47 +0200
Subject: [PATCH RFC 5/5] reset: Add BCMBCA block resets through the PMB
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-xg6846b-bcmbca-xrdp-reset-v1-5-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Support BCM6846 XRDP, PCIe and PVTMON resets through the Processor
Monitor Bus (PMB) of the third generation Platform Management
Controller (PMC3).

Use per-SoC reset groups and sequences with transport serialization.
Reset XRDP and its Runner cores together to keep their shared SRAM
Buffer Pool Manager (SBPM) state consistent. Consumers must quiesce
all affected users, including firmware voltage monitoring for PVTMON.

Power-cycle resets for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL were
considered but left out. These belong in power-domain and platform
power-management abstractions, which can coordinate affected users.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/reset/Kconfig            |  15 +++
 drivers/reset/Makefile           |   1 +
 drivers/reset/reset-bcmbca-pmb.c | 281 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 297 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 3168ab1eea88..fb2b20deb050 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -49,6 +49,21 @@ config RESET_BCM6345
 	help
 	  This enables the reset controller driver for BCM6345 SoCs.
 
+config RESET_BCMBCA_PMB
+	tristate "Broadcom BCMBCA PMB reset controller"
+	depends on ARCH_BCMBCA || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	select BCMBCA_PMB
+	help
+	  Reset BCMBCA blocks through the Processor Monitor Bus (PMB) of
+	  the third generation Platform Management Controller (PMC3).
+	  Supports the BCM6846 XRDP packet engine and its Runner cores,
+	  PCIe, and analog acquisition in the process, voltage and temperature
+	  monitor. Blocks must be powered and all affected users quiesced
+	  before reset.
+
+	  The module will be called reset-bcmbca-pmb.
+
 config RESET_BERLIN
 	tristate "Berlin Reset Driver"
 	depends on ARCH_BERLIN || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 45ad17062462..d0d618cc6495 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_RESET_ASPEED) += reset-aspeed.o
 obj-$(CONFIG_RESET_ATH79) += reset-ath79.o
 obj-$(CONFIG_RESET_AXS10X) += reset-axs10x.o
 obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
+obj-$(CONFIG_RESET_BCMBCA_PMB) += reset-bcmbca-pmb.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
diff --git a/drivers/reset/reset-bcmbca-pmb.c b/drivers/reset/reset-bcmbca-pmb.c
new file mode 100644
index 000000000000..d3b247a48574
--- /dev/null
+++ b/drivers/reset/reset-bcmbca-pmb.c
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * BCMBCA block resets through the Processor Monitor Bus (PMB) of the
+ * third generation Platform Management Controller (PMC3).
+ *
+ * SoC match data maps reset IDs to groups of blocks and their sequences.
+ * XRDP and its Runner cores share SRAM Buffer Pool Manager (SBPM) state
+ * and must be reset together, preserving their bus interfaces.
+ * PCIe uses soft-reset pulses; PVTMON resets analog acquisition.
+ */
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/reset-controller.h>
+#include <linux/soc/bcm/bcmbca-pmb.h>
+
+#include <dt-bindings/reset/brcm,bcm6846-pmb.h>
+
+struct bcmbca_pmb_reset_block {
+	u8 bus;
+	u8 device;
+	u16 offset; /* PMB word offset of the reset register. */
+	u32 mask;
+	u32 assert_value;
+	u32 deassert_value;
+};
+
+struct bcmbca_pmb_reset;
+
+struct bcmbca_pmb_reset_group {
+	const char *name;
+	int (*reset)(struct bcmbca_pmb_reset *rst,
+		     const struct bcmbca_pmb_reset_group *group);
+	const struct bcmbca_pmb_reset_block *blocks;
+	unsigned int num_blocks;
+	unsigned int assert_us;
+};
+
+struct bcmbca_pmb_reset_variant {
+	const struct bcmbca_pmb_reset_group *groups;
+	unsigned int num_groups;
+};
+
+struct bcmbca_pmb_reset {
+	struct reset_controller_dev rcdev;
+	const struct bcmbca_pmb_reset_variant *variant;
+	struct bcmbca_pmb *pmb;
+};
+
+static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
+				     const struct bcmbca_pmb_reset_group *group);
+
+static const struct bcmbca_pmb_reset_block bcm6846_xrdp_resets[] = {
+	/* Keep the XRDP bus interfaces out of reset. */
+	{
+		.bus = 1,
+		.device = 12,
+		.offset = 5,
+		.mask = GENMASK(27, 0),
+		.assert_value = GENMASK(2, 0),
+		.deassert_value = GENMASK(27, 0),
+	},
+	{
+		.bus = 1,
+		.device = 14,
+		.offset = 5,
+		.mask = GENMASK(27, 0),
+		.deassert_value = GENMASK(27, 0),
+	},
+	{
+		.bus = 1,
+		.device = 15,
+		.offset = 5,
+		.mask = GENMASK(27, 0),
+		.deassert_value = GENMASK(27, 0),
+	},
+	{
+		.bus = 1,
+		.device = 16,
+		.offset = 5,
+		.mask = GENMASK(27, 0),
+		.deassert_value = GENMASK(27, 0),
+	},
+};
+
+/* Bits 6 and 7 select the lane configuration and must remain unchanged. */
+static const struct bcmbca_pmb_reset_block bcm6846_pcie_resets[] = {
+	{
+		.bus = 0,
+		.device = 18,
+		.offset = 5,
+		.mask = GENMASK(5, 0),
+		.assert_value = GENMASK(5, 0),
+	},
+	{
+		.bus = 0,
+		.device = 19,
+		.offset = 5,
+		.mask = GENMASK(5, 0),
+		.assert_value = GENMASK(5, 0),
+	},
+};
+
+/* Analog acquisition reset, independent of clock and power configuration. */
+static const struct bcmbca_pmb_reset_block bcm6846_pvtmon_reset = {
+	.bus = 1,
+	.device = 6,
+	.offset = 17,
+	.mask = BIT(0),
+	.deassert_value = BIT(0),
+};
+
+static const struct bcmbca_pmb_reset_group bcm6846_pmb_reset_groups[] = {
+	[BCM6846_RESET_XRDP] = {
+		.name = "XRDP",
+		.reset = bcmbca_pmb_reset_sequence,
+		.blocks = bcm6846_xrdp_resets,
+		.num_blocks = ARRAY_SIZE(bcm6846_xrdp_resets),
+		.assert_us = 10,
+	},
+	[BCM6846_RESET_PCIE0] = {
+		.name = "PCIe0",
+		.reset = bcmbca_pmb_reset_sequence,
+		.blocks = &bcm6846_pcie_resets[0],
+		.num_blocks = 1,
+		.assert_us = 10000,
+	},
+	[BCM6846_RESET_PCIE1] = {
+		.name = "PCIe1",
+		.reset = bcmbca_pmb_reset_sequence,
+		.blocks = &bcm6846_pcie_resets[1],
+		.num_blocks = 1,
+		.assert_us = 10000,
+	},
+	[BCM6846_RESET_PVTMON] = {
+		.name = "PVTMON",
+		.reset = bcmbca_pmb_reset_sequence,
+		.blocks = &bcm6846_pvtmon_reset,
+		.num_blocks = 1,
+		.assert_us = 1000,
+	},
+};
+
+static const struct bcmbca_pmb_reset_variant bcm6846_pmb_variant = {
+	.groups = bcm6846_pmb_reset_groups,
+	.num_groups = ARRAY_SIZE(bcm6846_pmb_reset_groups),
+};
+
+/* Best effort with both locks held; never restart a partially reset group. */
+static void bcmbca_pmb_reset_cleanup(struct bcmbca_pmb_reset *rst,
+				     const struct bcmbca_pmb_reset_group *group)
+{
+	const struct bcmbca_pmb_reset_block *block;
+	unsigned int i;
+	u32 value;
+	int ret;
+
+	for (i = 0; i < group->num_blocks; i++) {
+		block = &group->blocks[i];
+		ret = bcmbca_pmb_read(rst->pmb, block->bus, block->device,
+				      block->offset, &value);
+		if (!ret) {
+			value &= ~block->mask;
+			value |= block->assert_value;
+			ret = bcmbca_pmb_write(rst->pmb, block->bus, block->device,
+					       block->offset, value);
+		}
+		if (ret)
+			dev_err(rst->rcdev.dev,
+				"failed to hold PMB bus %u device %u in reset: %d\n",
+				block->bus, block->device, ret);
+	}
+}
+
+/* Called with both PMB locks held, including during error cleanup. */
+static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
+				     const struct bcmbca_pmb_reset_group *group)
+{
+	const struct bcmbca_pmb_reset_block *block;
+	unsigned int i;
+	u32 value;
+	int ret, pass;
+
+	if (!group->num_blocks)
+		return -EINVAL;
+
+	/* Assert every block before releasing any of them. */
+	for (pass = 0; pass < 2; pass++) {
+		for (i = 0; i < group->num_blocks; i++) {
+			block = &group->blocks[i];
+			ret = bcmbca_pmb_read(rst->pmb, block->bus, block->device,
+					      block->offset, &value);
+			if (ret)
+				goto release;
+			value &= ~block->mask;
+			value |= pass ? block->deassert_value : block->assert_value;
+			ret = bcmbca_pmb_write(rst->pmb, block->bus, block->device,
+					       block->offset, value);
+			if (ret)
+				goto release;
+		}
+		if (!pass && group->assert_us)
+			usleep_range(group->assert_us, group->assert_us * 2);
+	}
+release:
+	if (ret) {
+		dev_err(rst->rcdev.dev, "%s %s failed at PMB bus %u device %u: %d\n",
+			group->name, pass ? "release" : "assert",
+			block->bus, block->device, ret);
+		bcmbca_pmb_reset_cleanup(rst, group);
+	}
+	return ret;
+}
+
+static int bcmbca_pmb_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct bcmbca_pmb_reset *rst = container_of(rcdev, struct bcmbca_pmb_reset, rcdev);
+	const struct bcmbca_pmb_reset_group *group;
+	int ret;
+
+	if (id >= rst->variant->num_groups)
+		return -EINVAL;
+	group = &rst->variant->groups[id];
+	if (!group->reset)
+		return -EINVAL;
+
+	ret = bcmbca_pmb_lock(rst->pmb);
+	if (ret)
+		return ret;
+	ret = group->reset(rst, group);
+	bcmbca_pmb_unlock(rst->pmb);
+	return ret;
+}
+
+static const struct reset_control_ops bcmbca_pmb_reset_ops = {
+	.reset = bcmbca_pmb_reset,
+};
+
+static int bcmbca_pmb_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct bcmbca_pmb_reset *rst;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+	rst->variant = device_get_match_data(dev);
+	if (!rst->variant)
+		return -EINVAL;
+	rst->pmb = bcmbca_pmb_get(dev);
+	if (IS_ERR(rst->pmb))
+		return dev_err_probe(dev, PTR_ERR(rst->pmb), "cannot get PMB transport\n");
+	rst->rcdev.owner = THIS_MODULE;
+	rst->rcdev.dev = dev;
+	rst->rcdev.ops = &bcmbca_pmb_reset_ops;
+	rst->rcdev.of_node = dev->of_node;
+	rst->rcdev.of_reset_n_cells = 1;
+	rst->rcdev.nr_resets = rst->variant->num_groups;
+	return devm_reset_controller_register(dev, &rst->rcdev);
+}
+
+static const struct of_device_id bcmbca_pmb_reset_match[] = {
+	{ .compatible = "brcm,bcm6846-pmb-reset", .data = &bcm6846_pmb_variant },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, bcmbca_pmb_reset_match);
+
+static struct platform_driver bcmbca_pmb_reset_driver = {
+	.probe = bcmbca_pmb_reset_probe,
+	.driver = {
+		.name = "bcmbca-pmb-reset",
+		.of_match_table = bcmbca_pmb_reset_match,
+	},
+};
+module_platform_driver(bcmbca_pmb_reset_driver);
+
+MODULE_DESCRIPTION("Broadcom BCMBCA PMB reset controller");
+MODULE_LICENSE("GPL");

-- 
2.56.0

