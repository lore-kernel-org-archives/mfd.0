Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082109;
	b=LoBNKPJPw3NA563ECIJcPAnWBD1V8PBIJJKRYy/x8P2RIAPskVmrqNrLhrNqi33xXkRw
	 LZAXM2NZu3W9wp87OtSiyjtZzhLsYS21TfCNpN5MdBqp4bT8fWptrwMXkK68vtUdp/UGF
	 akZth8nQbtGcmegQVaqKwV0rrCvnVeg7MD7ZMaZWRK+Iw7Ww6mf0LynyCNGvYit9N56Ul
	 v7bZjuUyul89zyPwgtlTTBTEEWTv5iWx7R0LFptD0+JKYVKtWZ3wdGVjiRzFeIACOzhGC
	 qF8SEBfBSLmVVQ62fQhhZFF6NpJTivyiwXoTk2GS4YCw8AArlVvPYZEMjGv+VRZekgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082109;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Virus-Scanned;
	bh=ZDWLulMTplfUa/KAT6D0cYv73oy4tTA+wIevksD7oMU=;
	b=v8Py90rUwK3R5qNlY/bgFIerObx8Wzq0BYOQ8Ua5+ql1pjmVkBwIObv2oG5BZseSY4DT
	 ChZ1dxgpQajda0NedjA29oRlQC+fGVJxJpwLuSB3UUG5O1EFn2rDubYzglSOvO8HIXLPs
	 dwlfOExORELRhg+1ARiqpN/zYx2Vl1P+BW6l79BOrMmwMprZrXQxSz+L0KdI9YiznYZ3p
	 0kzhpMMqgIOkhG9lWf5zVGtWlMzv72UUYRUZ9AvoDkA4MqVIf4cOkX482GUycWukL0iZM
	 TU2+2VH2H3oOvJqqxpJ+/o+CZh23sRxrFbiDJzxShyvAFjHgk31Eme7jJ/LFLjdlXEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	arc=none smtp.remote-ip=92.121.34.21
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A0606A339
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 09:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF8A0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1FA0F200028;
	Thu, 19 Nov 2026 10:55:07 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B3C4A200003;
	Thu, 19 Nov 2026 10:55:06 +0100 (CET)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0BDF11800068;
	Thu, 19 Nov 2026 17:55:03 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v22 2/5] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator
Date: Thu, 19 Nov 2026 15:24:46 +0530
Message-Id: <20261119095449.555593-3-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119095449.555593-1-lakshay.piplani@nxp.com>
References: <20261119095449.555593-1-lakshay.piplani@nxp.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
family of multiport I3C hub devices. These devices connect to a host via
I3C/I2C/SMBus and expose multiple downstream target ports.

All variants share the same register interface. Read the implemented
target-port count from DEV_CAPAB, so no per-compatible driver data is
required.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---
Changes in v22:
 - Factor common I2C and I3C MFD probe initialization into
   p3h2x4x_probe(), removing duplicated initialization logic.
 - Keep transport-specific device validation and regmap initialization in
   the respective probe functions.
 - Use dev_set_drvdata() in the shared probe path to publish the common
   MFD device state.
 - Rename the I2C device ID from "nxp-i3c-hub" to "p3h2x4x" for
   device-specific naming.

Changes in v21:
 - Rebased onto v7.4-rc2; no functional changes

Changes in v20:
 - No change

Changes in v19:
 - Retain only nxp,p3h2840 in the OF match table because the other
   variants use it as their fallback compatible

Changes in v18:
 - Rebased onto v7.3-rc1; no intended driver behaviour changes

Changes in v17:
 - No change

Changes in v16:
 - Use a named initializer for struct i2c_device_id
  ({ .name = "nxp-i3c-hub" })
 - Keep the shared header in include/linux/mfd/ (struct p3h2x4x is shared by
   the mfd parent and its regulator/i3c-hub children). The i3c_hub_priv
   back-pointer is retained for IBI routing, with documented publish/clear
   ordering

Changes in v15:
 - Read the device capability register to determine whether the device has
   four or eight target ports
 - Store the detected target-port count in the shared MFD data
 - Add OF match entries for all P3H2440, P3H2441, P3H2840 and P3H2841
   variants
 - Add a shared hub-context pointer for use by the IBI handler without
   overwriting the MFD parent's driver data

Changes in v14:
 - Clean up MFD driver comments, formatting, variable names and author
   information
 - Define and document the I3C hub DCR value in hexadecimal form
 - Use direct regmap bit-width values instead of local macros
 - Add a shared protected_reg_lock for protected register accesses across
   P3H2X4X child drivers

Changes in v13:
 - Use i3c_device helpers (i3cdev_to_dev()) instead of direct struct access
   to maintain API abstraction
 - Avoid including internal I3C headers and use public device headers instead
 - Ensure proper device matching by relying on manufacturer ID checks in probe

Changes in v12:
 - No change, added Reviewed-By tag

Changes in v11:
 - Use MFD_CELL_NAME() for child device registration
 - Rename local variables for consistency
 - Rename driver names to follow subsystem conventions:
   - Use '-' instead of '_' in driver names
   - Drop the "_drv" suffix from driver names

Changes in v10:
 - Drop redundant is_p3h2x4x_in_i3c flag

Changes in v9:
 - Renamed macros to follow consistent uppercase naming conventions
 - Made REGMAP selects in the P3H2X4X MFD Kconfig conditional,
   to avoid I3C/I2C dependency issues

Changes in v8:
 - No change

Changes in v7:
 - Use new config I3C_OR_I2C

Changes in v6:
 - No change

Changes in v5:
 - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
 - Updated dev_err_probe() for regmap_init failure.
 - Updated module description

Changes in v4:
 - Split the driver into three separate patches(mfd, regulator and I3C hub)
 - Added support for NXP P3H2x4x MFD functionality
---
---
 MAINTAINERS                 |   2 +
 drivers/mfd/Kconfig         |  13 +++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/p3h2840.c       | 156 ++++++++++++++++++++++++++++++++++++
 include/linux/i3c/device.h  |   2 +
 include/linux/mfd/p3h2840.h |  41 ++++++++++
 6 files changed, 215 insertions(+)
 create mode 100644 drivers/mfd/p3h2840.c
 create mode 100644 include/linux/mfd/p3h2840.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..15f339ff3854 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20332,6 +20332,8 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-i3c@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+F:	drivers/mfd/p3h2840.c
+F:	include/linux/mfd/p3h2840.h
 
 NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
 M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..680d81a0e572 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -631,6 +631,19 @@ config MFD_MX25_TSADC
 	  i.MX25 processors. They consist of a conversion queue for general
 	  purpose ADC and a queue for Touchscreens.
 
+config MFD_P3H2X4X
+	tristate "NXP P3H2X4X I3C Hub Device"
+	depends on I3C_OR_I2C
+	select MFD_CORE
+	select REGMAP_I3C if I3C
+	select REGMAP_I2C if I2C
+	help
+	  Enable Support for NXP P3H244x/P3H284x I3C HUB device using I3C/I2C
+	  communication interface.
+
+	  This driver provides support for I3C hub and regulator, each subdriver
+	  can be enabled independently depending on the required functionality.
+
 config MFD_PF1550
 	tristate "NXP PF1550 PMIC Support"
 	depends on I2C=y && OF
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index f8101d2a9ce9..f3780584e97e 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -122,6 +122,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
 obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
 obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
+obj-$(CONFIG_MFD_P3H2X4X)	+= p3h2840.o
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
new file mode 100644
index 000000000000..54eb078a3906
--- /dev/null
+++ b/drivers/mfd/p3h2840.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025-2026 NXP
+ *
+ * Authors:
+ *	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
+ *	Vikash Bansal <vikash.bansal@nxp.com>
+ *	Lakshay Piplani <lakshay.piplani@nxp.com>
+ *
+ * NXP P3H2x4x multi-port I3C hub.
+ */
+#include <linux/i2c.h>
+#include <linux/i3c/device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/p3h2840.h>
+#include <linux/regmap.h>
+
+static const struct mfd_cell p3h2x4x_devs[] = {
+	MFD_CELL_NAME("p3h2x4x-regulator"),
+	MFD_CELL_NAME("p3h2x4x-i3c-hub"),
+};
+
+static const struct regmap_config p3h2x4x_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0xFF,
+};
+
+/* Read port count from the device capability register (4- or 8-port variant). */
+static int p3h2x4x_read_num_target_ports(struct device *dev,
+					 struct p3h2x4x *ddata)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(ddata->regmap, P3H2X4X_DEV_CAPAB, &val);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to read device capability\n");
+
+	ddata->num_target_ports = (val & P3H2X4X_TARGET_PORT_COUNT) ?
+		P3H2X4X_TARGET_PORTS_8 : P3H2X4X_TARGET_PORTS_4;
+
+	return 0;
+}
+
+/*
+ * Shared probe path for both transports. The bus-specific probe functions
+ * validate the device and initialize the regmap, then hand over here.
+ */
+static int p3h2x4x_probe(struct device *dev, struct regmap *regmap,
+			 struct i3c_device *i3cdev)
+{
+	struct p3h2x4x *ddata;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &ddata->protected_reg_lock);
+	if (ret)
+		return ret;
+
+	ddata->regmap = regmap;
+	/* The hub child driver retrieves information from i3cdev. */
+	ddata->i3cdev = i3cdev;
+
+	ret = p3h2x4x_read_num_target_ports(dev, ddata);
+	if (ret)
+		return ret;
+
+	/* Child drivers fetch the shared state from their parent. */
+	dev_set_drvdata(dev, ddata);
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add sub devices\n");
+
+	return 0;
+}
+
+static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct i3c_device_info devinfo;
+	struct regmap *regmap;
+
+	i3c_device_get_info(i3cdev, &devinfo);
+	if (I3C_PID_MANUF_ID(devinfo.pid) != I3C_MANUF_ID_NXP)
+		return -ENODEV;
+
+	regmap = devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to register HUB regmap\n");
+
+	return p3h2x4x_probe(dev, regmap, i3cdev);
+}
+
+static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+
+	regmap = devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to register HUB regmap\n");
+
+	return p3h2x4x_probe(dev, regmap, NULL);
+}
+
+static const struct i3c_device_id p3h2x4x_i3c_ids[] = {
+	I3C_CLASS(I3C_DCR_HUB, NULL),
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
+
+static const struct i2c_device_id p3h2x4x_i2c_id_table[] = {
+	{ .name = "p3h2x4x" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, p3h2x4x_i2c_id_table);
+
+static const struct of_device_id p3h2x4x_i2c_of_match[] = {
+	{ .compatible = "nxp,p3h2840", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, p3h2x4x_i2c_of_match);
+
+static struct i3c_driver p3h2x4x_i3c = {
+	.driver = {
+		.name = "p3h2x4x-i3c",
+	},
+	.probe = p3h2x4x_device_probe_i3c,
+	.id_table = p3h2x4x_i3c_ids,
+};
+
+static struct i2c_driver p3h2x4x_i2c = {
+	.driver = {
+		.name = "p3h2x4x-i2c",
+		.of_match_table = p3h2x4x_i2c_of_match,
+	},
+	.probe = p3h2x4x_device_probe_i2c,
+	.id_table = p3h2x4x_i2c_id_table,
+};
+module_i3c_i2c_driver(p3h2x4x_i3c, &p3h2x4x_i2c);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
+MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB multi function driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index e30ea2cb13cb..24b8819db6ef 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -86,9 +86,11 @@ struct i3c_xfer {
 /**
  * enum i3c_dcr - I3C DCR values
  * @I3C_DCR_GENERIC_DEVICE: generic I3C device
+ * @I3C_DCR_HUB: I3C hub device
  */
 enum i3c_dcr {
 	I3C_DCR_GENERIC_DEVICE = 0,
+	I3C_DCR_HUB = 0xC2,
 };
 
 #define I3C_PID_MANUF_ID(pid)		(((pid) & GENMASK_ULL(47, 33)) >> 33)
diff --git a/include/linux/mfd/p3h2840.h b/include/linux/mfd/p3h2840.h
new file mode 100644
index 000000000000..eb4792de5440
--- /dev/null
+++ b/include/linux/mfd/p3h2840.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025-2026 NXP
+ */
+
+#ifndef _LINUX_MFD_P3H2840_H
+#define _LINUX_MFD_P3H2840_H
+
+#include <linux/bits.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+/* Device Information Registers */
+#define P3H2X4X_DEV_CAPAB					0x0a
+#define P3H2X4X_TARGET_PORT_COUNT				BIT(3)
+
+/* Downstream target port counts per variant. */
+#define P3H2X4X_TARGET_PORTS_4					4
+#define P3H2X4X_TARGET_PORTS_8					8
+
+/* Device Configuration Registers */
+#define P3H2X4X_DEV_REG_PROTECTION_CODE				0x10
+#define P3H2X4X_REGISTERS_LOCK_CODE				0x00
+#define P3H2X4X_REGISTERS_UNLOCK_CODE				0x69
+#define P3H2X4X_CP1_REGISTERS_UNLOCK_CODE			0x6a
+
+#define I3C_MANUF_ID_NXP					0x011b
+
+struct p3h2x4x_i3c_hub_dev;
+
+struct p3h2x4x {
+	struct i3c_device *i3cdev;
+	struct regmap *regmap;
+	/* Number of downstream target ports (4 or 8). */
+	u8 num_target_ports;
+	/* Serializes protected register unlock/lock sequences across MFD children. */
+	struct mutex protected_reg_lock;
+	/* Hub context for the IBI handler to reach hub state via the parent i3cdev. */
+	struct p3h2x4x_i3c_hub_dev *i3c_hub_priv;
+};
+#endif /* _LINUX_MFD_P3H2840_H */
-- 
2.25.1

