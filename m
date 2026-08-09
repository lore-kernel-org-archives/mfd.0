Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE17F374758
	for <mfd@lists.linux.dev>; Sun,  9 Aug 2026 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310954; cv=none; b=oHcdN2YpMXejN4lJe6Hb0mDRkVlvwmtEglWBmf2Xfi+YvLujZ7x6XzETt4isM+p+m+XOSvMy1A34dhFryUWOa8eFiX7eh4r1W9X1i0PqrvEIzLky5n8oGDf4LsqFrBO7UMgGHjuB3JaqaAKInbL49ilSNRqeaWHB3omRCpSyowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310954; c=relaxed/simple;
	bh=F48ZbgB2cKzAh96uUjTxHIRf1tzu97bISy6rmvv3yOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+1Bny1Ucei/cNCaNiaZsFHYMMhs7mIdjXY4x617Nx+8Xxsi1P8mR1cqQYdSGYq1auzAsCvqBDF+joB2kAtbVzI85Fm5dRJmQC9U8+tsk/UgvF6ru1PzPdKAXvw3gv91xew5iGJanXvdQX5E2lSeF/Z+uvoHujq9UQEzdrIB98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwLbmEBw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwLbmEBw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso1122735f8f.0
        for <mfd@lists.linux.dev>; Sun, 09 Aug 2026 14:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310951; x=1786915751; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SWP9jg8cNKwUNUFEJGTORk88ANCnzD7PTJF8nRu8aw=;
        b=RwLbmEBwzuQfr8N0obQbHqALC/CC0QwCI6toertLePF9S2jN0JEaFA9yHASCBmRTrh
         rA6kNpCIYSPrT/oZhhimHrbiJieZSRL9t0CUg7S02aSz/rEpu+6nXmI0qN14TxJ4O2b1
         wNL9OEWK3ZyV8v/e2PWVtSx+LphzLORksWvVDDPIWrZFKpjQe71vR/6SUOs9nx7KXcbX
         kDFkiXRJhI5kR+V8/iAvQ9zHKb1z5DJSncLHfAqrk/zeopVCnx9FeUsJ4ZQxAm/wdmu+
         BtUeYGxxS2p7Q03KlzLxLULF8oDe0QX+aDWxaZqDZzDqNOUU0i6I9GVDP+x5xa5H/LUt
         TP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310951; x=1786915751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5SWP9jg8cNKwUNUFEJGTORk88ANCnzD7PTJF8nRu8aw=;
        b=MZD1Z06ZxPlOHVSXe+2JK7Ko5nzIaRJL7yqnFXbhDiMy7tmwfgMYy75UDQA2UHYLBD
         Ojzb03SB3ztGaXhf7veu0ZdfAl7us1ixwe9u+dvXo8+ixUQZGHT0i82CNqIhw758enM9
         a+r9VMP0LmYmnTLqpgsaRrkrsYrhYttvBwZLba5i+8vrXU+rrpi2p+6GtJ3SbX4GKHmu
         ZiegzfgMOwkDzHseeKLwB4zneNy9cmDpR8UHmsN6ZKE5RTpnqurhojwxgjZfOrllEfbw
         c8vDkeX1pR7OSZCYPfh0CyP0yvUxsE+IEZg1T5H1uvQvDP3Hsq8Oj7/xWPbfTGX0klNL
         WSlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4oAkkfQesM/5a8W5HV5GOq3OPjAjluM80ItYogc5BpABXZg0lZ7l9qceDmusn7IPRVko=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz048Z71Yp4jl7hWMnkAwl5DWvWwwtiA4PiPCTAl5egYpgXbh50
	IeO7CPvGFEMeV9vHoEYg6Ic5qNSLZ1MWp6ibZV9Ln+Yj6Zi8Aks9gsyN
X-Gm-Gg: AR+sD11JsJeINNkEFQnMYKdaaX0MbBejSXKB9+yNPEF3JDJ1QwAob404E4jvBGpdE1n
	nJhmb6n5+jBPhpTxRV+Ju3w47TMMiYpEGanD+ARk7esC6pszg0rE1WAmZpu6QnncQhHQqggD0F8
	Y9lb0c/W6JrvX99sVADxC8P1j+W1E2yqIyhOLtLwYp+YjS4/XiS7zXRoUKWCTiTT2Hlb9r32hIe
	PlajEujunpZbMTgmLBCllrNzHfHxnXLvPLhJZKJGoaTbtnvMjFtG5GF1zjGl4YaQlSy5Dd0z/dr
	8Hv2M+z2rOExOLF8ZvrECCKhlU9O4O0rj/SMBwpY4B4V0EayR+UXCEbQUYjDKAbjQq/p1MyXXor
	6Cva8i8qt1iElDu8UkQoW0hK1JbqdmqrCKeI5Dy3rLxzoaEuR17oFySyqZRFrM44TKaJTwz6E5Z
	NEj5/Dkw3PkXxN9Tu6QBG9svvwvFyvBng9vKXrRzXM6oGjPvyOuLsFY4+i9RAYn2iR69RbqbY=
X-Received: by 2002:a05:6000:2dc3:b0:47f:9568:ebf0 with SMTP id ffacd0b85a97d-48130eee945mr19522868f8f.23.1786310950928;
        Sun, 09 Aug 2026 14:29:10 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:10 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 10 Aug 2026 00:28:23 +0300
Subject: [PATCH v10 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-zx29clk-v10-4-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8179;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=F48ZbgB2cKzAh96uUjTxHIRf1tzu97bISy6rmvv3yOo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEONRbId+nxoMPZNNnnFYnFQ0H8HlKQzAlwr
 hCSScFStMiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxDhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKGSg//eHe937MRV8YX/9PdzDsPMUyiFxPbF6U
 YqzDtX10u/eIdP1QpX3mxCV8ehKCWkdtXSNHPlL09aVrDERc3lUhdA4H2vgWu0Ef49cwsE0KUbM
 cC9pjjQ3YGwPE62tpuLoC/P3FOaNm52i0UVXBnmEFc8YYPRrrDnjZTBa9wny/X4WXGTxiqf6Pl9
 zVpxvovQJ0Q/tZeeh3Df4HUr100heVltNz8638gzwJCOUjeeLZFFlnvkedTQ/tpNTFyBO3P/cWB
 GdTHuRfR2Y4ZdKqCtZrSMqupewpNAzy8PiRhOYSQf7Nl3BC9N0Xyn8c1iMNZWlFDyIQL8/Ko8TD
 NMU7U/ubwpsWMWCs24csHwV6FyutpFR+kV/uYwivyFaJXthaNgEXbZNNDXXNiQSKVL2elfnRQlu
 tQEd5giNftGyQPyLJhMDaUwmHSu0jkj4RC+ai4kYoZKELFmdO9YHSkQWRTjvzQ+V2uB/froTSJM
 8xUTADjpuLWOnJpQsXUYBm9R7upvDG23yFrkQsPjADMczkHrOJ8SnS/fVDaY0YKAh5pO0M+Xrr+
 +e2ir+KnkziEddpFXP98h3irJ0HBgpiX2R/QCiESTostrYfVqSx/20s08guw6eD92ejh58L72rV
 637OBaTxbCZkT0l/fhCWYimoLxeE0aMb6dHmApO19JYVmUpZpqc8=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

What I am still unsure about: How much sense does it make to have this
module-capable and able to unbind: In practice, the board doesn't work
without this driver and its clock and reset children.

Changes v9:
Deassert the LSP reset and enable the LSP pclk here. In practice the
boot rom needs to do that because it prints to an LSP-connected UART and
reads the boot policy from the LSP connected flash chip.

In doing so, I migrated the match data to an enum as mfd.md suggests.

Changes v8:
*) Remove .of_compatible from PHY mfd child

*) Move to drivers/mfd (Sashiko)

For me either soc/zte or mfd/ is fine. Note though that this MFD parent
is very specific to the zx297520v3 SoC. I don't expect this to be reused
anywhere else. There are two more MFD-ish devices in there: soc_sys at
0x140000, which I plan to handle in the same driver, and an i2c PMIC,
which would get its own host driver.

*) Use PLATFORM_DEVID_AUTO (Sashiko). NONE was intentional as I only
ever expect one instance, but I don't see any harm in doing the standard
thing and use AUTO

*) On the suggestion not to put the link to mfd_cells[] into match data:
I see that it is spelled out in Sashiko's mfd.md, written by Lee Jones,
the MFD maintainer. I would appreciate some education on the rationale
behind it: Putting a pointer into the void *data is a common pattern in
the kernel. I don't understand in which situation this can possibly
break?

Both structs are static const in the same compilation unit. data is a
const void *, not a uintptr_t or kernel_ulong_t, so it seems passing a
pointer is the intended use. What am I missing?

Changes v7:
Add phy MFD child

Changes v6: Make the ZTE SoC driver section depend on HAS_IOMEM
(Sashiko). The entire MFD section, which contains MFD_CORE, depends on
HAS_IOMEM even with COMPILE_TEST.

Add a NULL ptr check for of_device_get_match_data (Sashiko). While not
uniform, rave-sp, rohm-bd9576, atc260x, da9052-i2c protect against
incorrect manual attachment that way.

Add lspclk here as well in an attempt to satisfy both Conor Dooley, who
asks for MFD for top and matrix, and Philipp Zabel, who prefers aux but
at least wants the reset driver limited to one driver type.

Changes v5: Use MFD instead of Aux bus for top and matrix crm because of
extra functionality: Reboot in top, hwlock in Matrix.

LSP clocks stay with the aux bus and are thus not handled in this
driver. The clk driver will bind directly to the lspcrm node.
---
 MAINTAINERS                      |   1 +
 drivers/mfd/Kconfig              |  13 +++++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/zte-zx297520v3-crm.c | 117 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61dbe959acf5..d50c03fd5a76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3909,6 +3909,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..08138713dfc0 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2578,5 +2578,18 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	depends on ARCH_ZTE || COMPILE_TEST
+	select MFD_CORE
+	select REGMAP_MMIO
+	default SOC_ZX297520V3
+	help
+	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
+	  reset manager MFD driver. This driver provides the host device for
+	  the clock and reset drivers and is required to boot the SoC. You
+	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
+	  to build the actual clock and reset child drivers.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 72d3944b0ad8..ab0cba2042a2 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_ZTE_ZX297520V3_CRM)	+= zte-zx297520v3-crm.o
diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
new file mode 100644
index 000000000000..550ce4ad7ec5
--- /dev/null
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+enum zx297520v3_parent_type {
+	ZX297520V3_INVALID = 0,
+	ZX297520V3_TOPCRM,
+	ZX297520V3_MATRIXCRM,
+	ZX297520V3_LSPCRM,
+};
+
+static const struct mfd_cell zx297520v3_topcrm_cells[] = {
+	{
+		.name = "zx297520v3-topclk",
+	},
+	{
+		.name = "zx297520v3-topreset",
+	},
+	{
+		.name = "reboot",
+		.of_compatible = "syscon-reboot",
+	},
+	{
+		.name = "zx297520v3-usb-phy",
+	},
+};
+
+static const struct mfd_cell zx297520v3_matrixcrm_cells[] = {
+	{
+		.name = "zx297520v3-matrixclk",
+	},
+	{
+		.name = "zx297520v3-matrixreset",
+	},
+	/* A set of hwlock controllers is found here as well, but no driver is implemented yet */
+};
+
+static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
+	{
+		.name = "zx297520v3-lspclk",
+	},
+	{
+		.name = "zx297520v3-lspreset",
+	},
+};
+
+static int zx297520v3_crm_probe(struct platform_device *pdev)
+{
+	enum zx297520v3_parent_type type;
+	struct device *dev = &pdev->dev;
+	const struct mfd_cell *cells;
+	struct reset_control *rst;
+	unsigned int num_cells;
+	struct clk *pclk;
+
+	type = (enum zx297520v3_parent_type)(kernel_ulong_t)of_device_get_match_data(dev);
+	switch (type) {
+	case ZX297520V3_TOPCRM:
+		cells = zx297520v3_topcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
+		break;
+
+	case ZX297520V3_MATRIXCRM:
+		cells = zx297520v3_matrixcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
+		break;
+
+	case ZX297520V3_LSPCRM:
+		cells = zx297520v3_lspcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_lspcrm_cells);
+
+		pclk = devm_clk_get_enabled(dev, "pclk");
+		if (IS_ERR(pclk))
+			return dev_err_probe(dev, PTR_ERR(pclk), "Could not get pclk\n");
+
+		rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+		if (IS_ERR(rst))
+			return dev_err_probe(dev, PTR_ERR(rst), "Could not get reset\n");
+		break;
+
+	default:
+		return -ENODEV;
+	}
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells, NULL, 0, NULL);
+}
+
+static const struct of_device_id of_match_zx297520v3_crm[] = {
+	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)ZX297520V3_TOPCRM },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)ZX297520V3_MATRIXCRM },
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)ZX297520V3_LSPCRM },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);
+
+static struct platform_driver zx297520v3_crm = {
+	.probe = zx297520v3_crm_probe,
+	.driver = {
+		.name = "zx297520v3-crm",
+		.of_match_table = of_match_zx297520v3_crm,
+	},
+};
+module_platform_driver(zx297520v3_crm);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 CRM MFD host driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0

