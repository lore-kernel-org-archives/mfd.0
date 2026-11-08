Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170560;
	b=4yexkZ5Um2X89gKC7XEJMsq7vo4MNSTK7dAMdYyWNgENA3428PWMuIj2euWK5xhygyAa
	 OTr1ZPkC43zOco8jhswGiIOrZQJgRC5kMPo/ZVykYMmzQxHU2CVLGkC4REXJNCimg9hvu
	 D8WlZJwLtCCGVVjjxdZXi17+YDRG6NmXBF7tvAxTE5RkKNu30HRsM/WhY183oTpNQuMIG
	 pqQMmcYA0CDVVxAidLPo+rBvasIY2XraCTD5Zr4vQksnS35L5QIW6G19CslOd/R5zW3lP
	 FhhhkP7RnsEWlNwS4ptHhXfugXpYSMIt0EdtkE589YJBQCAsNRvTMRDewpTNRk7SdAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+r/5TJaydvCVS9bMQGNHRRQWxJ1iL8YMIg0lKVket3I=;
	b=38laCEKp6hR808Dac2ysdl4hp9XKTPlBXwy4vWlJdyBaa08IyIOnhvvF9Cngs7gbrngy
	 QVdIOmGYlAoyzl2kQwnhHg4huKhBROevpVVfq23aDqsLGOL5U9PhXf0kKqo2ECRSp7FZJ
	 8lPDgjR8iFwIyse5bnJMbww5AlnMrvlPqQpiUVPdLXvtfrMNSL0XtbzkFkH7Q45FHkgU9
	 9WfUDdXN+ENkzp6wNkOk1to3WVHjokQJUT8eJP5zbGd/dUKDSCg/pdnJ3xycnVWJds74q
	 lZdym89J5BM5tuDuf7Jw806TrB4md4bfUHioAl/xktyxi6QceJx8Tu6OB1EA8t8j87A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KyI/nbcI";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B56606A320
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 20:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B56606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyI/nbcI
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so1508345e9.2
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 12:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794170558; x=1794775358; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+r/5TJaydvCVS9bMQGNHRRQWxJ1iL8YMIg0lKVket3I=;
        b=KyI/nbcIZKjtfjJrUBxcgf4OzCcpnZDtpFAwKRN795cfnjMttORVIemEXi8q5KN1f4
         hGA62e11FkqZr4aHfIWJ6No6H6grEBCrWMgXoMpXhsAaxMGlXKjFJRMT51od0Zi2rpPN
         DJQjeresWePJsXh/xzIm3yF3xZ57VwTF9ivYef/vXVyPNk7Egyhj7kIw9PiA7TeZjwlm
         oiQp9fwbcIyg2Ld9MrLYR4+Q52F/KwJfOf5WUykHaO5irpJHX4IrtCBocGdfxsxCgAzy
         mRXc1AxOhi9nIUweaei23AU95inVmLmB/WA30Ma0YwJOmykc5iDGRC0mZekg1p10BeWb
         IyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170558; x=1794775358;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+r/5TJaydvCVS9bMQGNHRRQWxJ1iL8YMIg0lKVket3I=;
        b=EOYTAgBI39RuZ5qMD2Rc6T5g56ZYjR8GlKO9rnHsSUwgT0p2JeOlRuZ91cSZpINL6z
         GkZo5Pq312ZF0G1bPp+qPZbj0L64aY4GS1NV6wFSKTGx3VPkTXZkprq0u9W+/GQQR1T9
         Bxgaur4FOyrQTWQwFtiUfPN4TSWHCk9X6pomlBjjPlRsdRR/De4ZIlE/ZfXfwLM+0Xy0
         zg9rNqBeIP7sirwJ6U+81JZJpMJseELb2fqN8IpQGwAPum/rgPw+Icbl+sDxCegVk58d
         ynVR5c/U08aNG8M+19Gx7MScR3tk8BmP71fdrunWYQE12/wQCrJoD3p6wERnu3erlgVM
         nXWA==
X-Forwarded-Encrypted: i=1; AL+hErE6Ph8zH42YfeDXEGcWN9KvPlil5/+0vCE9Iq4bXMe/6/bvU44UsK/AlDJ1S98O0DqtEoM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/yS6iLOxaNLM9qRJ2M4y0Wqsw35mda2iD42o57LivIA5x9LdJE
	/acbln0garvtQ0IRMk5N/zgGRqYPl1ppe7JsRR7A9Sewr0w+zDK3FJSn
X-Gm-Gg: AYBFou0dbBp9UDf18ze+lczAP+m82APnsR2MtpNw+Yw0+lWeGVmqGR7AmHGp//wLyuy
	FokyfMhohqLmy1VesPvv7ugGiJ5flXVX4M6nZR2miik6bTLh+uBq6jYP9oH4Tpsf/eDlfScpr6G
	WhXXfRAu6EMyoGd9uBGDrQIh55TuJi+XTzPVsZgNGplSF0yEy9y5gGiaceHg8VAwAF2iKzISUt3
	tdMvO9ZKC+3eA80SvlXxyKERSnJeVVc3I6heilBWVWpxT3GcLYMNDTLCJGT+zrexRRmnDVI0FYl
	zVS2VfJgOOTf0YzVNczkL3V98N2cIqgvEtEZwbez2EV+vScoHvX9LvxEvum96zbT1Ec3yB4L533
	ZOD+27oQe7S5vsVosHMNj3F0XfD4nuwTYsDb905aCA8DEKj1Ot0+NQAjVgyrRGiesmGn/dutm5v
	XS4EDdkZj11nggUsvtZU1Sjhb9JWEnADpKVrPrvCOdVjcFJhRqhmQAl1/D5j6liUQ/ru1DJtA7D
	J8Tttsn6VJj+k1fym7kz3+ZR1xG6Uo7DNKwxu43kVMrpaD6RCYXcdMx0BuzjXcLsApycUtRIyFa
	F+tmtGuvWtF6DR+VHBg5aHduDY8cwM0OVywI5JpnlTFXROLdz4whE5FP80CmRg==
X-Received: by 2002:a05:600c:3f12:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4b963c6c56emr43762005e9.8.1794170558149;
        Sun, 08 Nov 2026 12:42:38 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e55sm6105532f8f.4.2026.11.08.12.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:42:37 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 08 Nov 2026 23:42:28 +0300
Subject: [PATCH v14] mfd: zx297520v3: Add a clock and reset MFD driver
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261108-zx29clk-v14-1-48694e5a9d10@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDE10FJSSM
 xLz0lN1M1OAAkpGBkZmhoYGFrpVFUaWyTnZusZJBubGSZYpRkYpZkpA1QVFqWmZFWCjomMh/OL
 SpKzU5BKQdqXaWgC28Y4ibAAAAA==
X-Change-ID: 20261108-zx29clk-3b073b9d22d6
To: Lee Jones <lee@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9555;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=FBBK+RiV6zGGBiX6mgds9dkqH/GmsNXnUpzR+KrqbXw=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBq8N64TtNpWJrauSNBd7Gk/210cVnrulk9o6Nx0
 aneEg4eKiyJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCavDeuBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKYwRAAp9CZh0hzFMORyx82IEbKfXr59xVIzdc
 /LnelLBGqqgpN454oiZ1/bGiZYbGyODT4eHHJaF+iHni+BxypkQI7G49/Kp7T+JT76v3xv0+PpL
 6dSzsaiZQBfFSpqH35XQdJXIRt5KbG/CG+7ykfsQfnVTTzPEhavF42KYcOWer+NiX7nltS2heKM
 MMJcowSxO1IG0OnJRbkKKyJQXClnjtOFbwqAbhGeCrrNcEm/fCE9KKt5KrGA7mJ2BZ/64WVLgmZ
 3dy5NU0WmgZNioQI1+4bzaCWC1X/2SjVRimGjkOZcgRrtk1vFZrLmTcnTeIw17clhCllJmhj/HS
 f69J+kfQZjhQFwhvQo+V+4tGVbfA1gMVtN7RLlTQ2kPeKAt5dtQ8WSAIoBPbgZg2CY/Lks1zayn
 8fjSZFbwksbrpBzeEUpxejjzEwlhmui/xg89JyuTZk5P52gsSPYBigIaGecd1p89KFJfBmC6tiG
 NTKaPeooCC1606YlvD5XmVBUV0huixxoJWTprJRHCmv9ao5zFWn1dg2/hlgsX4f07G9oqoRQiB4
 wgx5vWT9ZujM94z5WX/HwrJhXT07OCIvf/fWv+mHqZ/LlS44o7own+LZYEd0SF1MW9Ib5cLWsE6
 v7uhworEs8g4KTSXQnwHEnFop9lBJNSGCH4ZcuJPmGH20+gLPf6k=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clock child will be driven by the already committed
clk/zte/clk-zx297520v3 driver and the reset part by a separate reset
driver.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
v14: Trimmed the header comment to give a quick description of the
hardware and driver, but remove references to ZTE's downstream kernel
(Lee Jones).

Re-add MAINTAINERS addition. The DT and clock parts are upstream
already, so it should apply without conflicts now. This way the
MAINTAINERS entry is introduced in the same commit as the file it refers
to.

v13: Break out the MAINTAINERS change so Lee can selectively apply this
patch. I made sure it compiles without the DT binding headers.

Changes v12:
Added comments elaborating on the role of the driver and the hardware.

Regarding the names: zx297520v3 is the SoC's name (chip marking, boot
messages). TOPCRM, MATRIXCRM, LSPCRM are ZTE's names for the MMIO blocks
in their downstream sources. Sadly no datasheet is available. "clk",
"reset" names for the child nodes are mine.

Regarding personal copyright: I am not affiliated with ZTE nor paid by
them. This is my personal hobby project. I am using knowledge extracted
from ZTE's kernel dumps, but not code.

Changes v10 (All Lee Jones):
*) drop "select REGMAP_MMIO"
*) Drop comment about unimplemented hwlocks
*) Use MFD_CELL_[NAME|OF]
*) Renamed the device type enum and its values
*) Use device_get_match_data instead of the of_ variant
*) Improved debug messages

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
 drivers/mfd/Kconfig              |  12 +++++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/zte-zx297520v3-crm.c | 106 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 121 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..6c38600ad2f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3987,6 +3987,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 F:	drivers/clk/zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..06292949accd 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2597,5 +2597,17 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	depends on ARCH_ZTE || COMPILE_TEST
+	select MFD_CORE
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
index f8101d2a9ce9..7a19ddedb13b 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -305,3 +305,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_ZTE_ZX297520V3_CRM)	+= zte-zx297520v3-crm.o
diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
new file mode 100644
index 000000000000..7c29a860be3f
--- /dev/null
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ *
+ * The zx297520v3 CRM controllers are primarily clock controllers, but they all have reset controls
+ * as well. Top and Matrix controllers have further auxiliary functions: Reboot and USB PHY in Top,
+ * hardware mutex in Matrix. This driver breaks the functionality apart to handle them in drivers in
+ * individual subsystems.
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+
+enum zx_device_type {
+	TYPE_INVALID = 0,
+	TYPE_TOPCRM,
+	TYPE_MATRIXCRM,
+	TYPE_LSPCRM,
+};
+
+static const struct mfd_cell zx297520v3_topcrm_cells[] = {
+	MFD_CELL_NAME("zx297520v3-topclk"),
+	MFD_CELL_NAME("zx297520v3-topreset"),
+	MFD_CELL_OF("reboot", NULL, NULL, 0, 0, "syscon-reboot"),
+	MFD_CELL_NAME("zx297520v3-usb-phy"),
+};
+
+static const struct mfd_cell zx297520v3_matrixcrm_cells[] = {
+	MFD_CELL_NAME("zx297520v3-matrixclk"),
+	MFD_CELL_NAME("zx297520v3-matrixreset"),
+};
+
+static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
+	MFD_CELL_NAME("zx297520v3-lspclk"),
+	MFD_CELL_NAME("zx297520v3-lspreset"),
+};
+
+static int zx297520v3_crm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct mfd_cell *cells;
+	struct reset_control *reset;
+	enum zx_device_type type;
+	unsigned int num_cells;
+	struct clk *pclk;
+
+	type = (enum zx_device_type)(kernel_ulong_t)device_get_match_data(dev);
+	switch (type) {
+	case TYPE_TOPCRM:
+		cells = zx297520v3_topcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
+		break;
+
+	case TYPE_MATRIXCRM:
+		cells = zx297520v3_matrixcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
+		break;
+
+	case TYPE_LSPCRM:
+		cells = zx297520v3_lspcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_lspcrm_cells);
+
+		pclk = devm_clk_get_enabled(dev, "pclk");
+		if (IS_ERR(pclk))
+			return dev_err_probe(dev, PTR_ERR(pclk), "Could not get 'pclk'\n");
+
+		reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+		if (IS_ERR(reset))
+			return dev_err_probe(dev, PTR_ERR(reset),
+					     "Failed to deassert reset control\n");
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
+	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)TYPE_TOPCRM },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)TYPE_MATRIXCRM },
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)TYPE_LSPCRM },
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
+MODULE_DESCRIPTION("ZTE zx297520v3 CRM driver");
+MODULE_LICENSE("GPL");

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-zx29clk-3b073b9d22d6

Best regards,
--  
Stefan Dösinger <stefandoesinger@gmail.com>

