Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186394;
	b=QVazOuwjAgY+wF5yiQ878cgBenwwGYzTaO7wFpWBtaKJtC05TQsDNttQmEMRL2havRq0
	 mSmNnjNJpvng18lWt0qCzH6lapyS01ci53Luy/cAdxq41moJqTH9YrmKkzCaPBsrWMXTI
	 /5y8EhjfIJXpt58B5eRsSh7KG/sZI6aToP32SdhyijE8A1SldyFZ7fGvdQ1aq9SF5VU6d
	 XrFwG80dxfKEl5ntR+A52xg/WpBWWrtxw15a2TJ4/sckLFhWpO/ZsVpPUYIZbLhQqaNK9
	 DfSs0RKzVU0bzCbQLLkefHxdXiI/EualMEOxhbhx9WPqF+e8XeArE0wYdn0pK9uio9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186394;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc;
	bh=CS9uQUMvMyVT3/LeUGjKiRtImGjmcO++YEsMXDoi954=;
	b=oweIp4E1CqfOLSiari3ULa10tyqPsRk6860K5k53EoCsLzw3X37UFCzedOHwLZ3SUrMN
	 WcGiQa0Q1QOcFTI/uAv1kj2kXSIVjTBRCrASa8w9NToN/OKXKcSJzPW1prAugUf6Giql0
	 j/mBgYWR1pLRGz8RmTa9nPJMd3mb0XCvNhXWgWJSf436Jiy0/GlxqpncB/6UPR3memtMu
	 kYIO/AGrhpWrWT4MAsE5ovHfDyV5Gw+DsFYqe+krYZc5C0IH0RPgdSxHr61Vhxj9TMdOj
	 3YQb9OdylSnncYoiBpywtEmW2wPgAo+3KqTz/rUcdDcFnLj/DoKwXo9IviH7WAiOdMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MUYRwHkH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XcEr9DXu;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05479606A332
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 14:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05479606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MUYRwHkH;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XcEr9DXu
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795186392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CS9uQUMvMyVT3/LeUGjKiRtImGjmcO++YEsMXDoi954=;
	b=MUYRwHkHnrXpW5TxvRnnAROu67irnnDlrharIh7fnTkkEa4KWzZwd8cN5GUpKh8jsbn7WH
	MX1LLgPXt+mBaZy/6g/Nm6BW33hcygLd/jELh3WkLD6077xcYp66tz4N56JagNUpZiHDsL
	U9ZjCvJfLUm3YlWxFtyHNKw00Af8W2EQE2iOVMP29u2RVM8U20SjyIMc8+VYxkYmDuv1E7
	/n4zl0EK31jkNPWG+gU2ixRGA5+yZcKlTvw+wRlCIXPyxThdXlfmGanj48lXsvPzBPRMC1
	6FLSYI8ws1IwcZ7nOubKsglVpWxP5xUVq6GfcyR+Z+lWCgsZwVpxM/aY75xHjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795186392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CS9uQUMvMyVT3/LeUGjKiRtImGjmcO++YEsMXDoi954=;
	b=XcEr9DXuo2QD9UoaYAQJJ7yUOZtK5/IDgJh1o1ls2QIR0gKvLgI3Lssd1VwR1ZKMhyX8FB
	ATFSFU9J0AuI+eAA==
Date: Fri, 20 Nov 2026 15:52:23 +0100
Subject: [PATCH net-next v5 6/9] net: mdio: Add SoC-e SWIP MDIO controller
 driver
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-devel-vstrassheim-soce-dsa-ml-v5-6-5de9225715e6@linutronix.de>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
 Lee Jones <lee@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Vasilij Strassheim <v.strassheim@linutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, mfd@lists.linux.dev, 
 Martin Kaistra <martin.kaistra@linutronix.de>, 
 Benedikt Spranger <b.spranger@linutronix.de>

Add a driver for the MDIO controller integrated into SoC-e Ethernet
switch IP cores. Support Clause 22 transactions and the separate address
and data cycles required for Clause 45 accesses.

The transaction control register is shared with the external MDIO bus
selector. The selector occupies bits 26:16 and is managed by a generic
MMIO MDIO mux through the upper 16-bit halfword. Access transaction
control through the lower halfword to preserve the selector bits.

Check that the controller is idle before programming transaction
registers and poll for completion after each transaction cycle. Return
-ETIMEDOUT if the controller remains busy. No abort or reset recovery is
implemented.

The idle check does not cover selector writes: the generic mux changes
the selector before invoking the controller callback. After a timeout, a
subsequent access to a different child bus may therefore change the
selector while the previous transaction is still active. Whether the
hardware latches the selector at transaction start is not documented, so
such a bus change is not guaranteed to be safe. This limitation is
accepted when using the generic MMIO MDIO mux.

Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
---
 drivers/net/mdio/Kconfig     |  10 ++
 drivers/net/mdio/Makefile    |   1 +
 drivers/net/mdio/mdio-soce.c | 213 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 224 insertions(+)

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index 6f272fae4bb5..b1ffeb439c36 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -182,6 +182,16 @@ config MDIO_REGMAP
 	  regmap. Users willing to use this driver must explicitly select
 	  REGMAP.
 
+config MDIO_SOCE_SWIP
+	tristate
+	depends on OF_MDIO && HAS_IOMEM
+	depends on MFD_SOCE_SWIP
+	help
+	  This driver provides support for the MDIO controller
+	  integrated into SoC-e SWIP Ethernet switch IP cores.  This option
+	  will be selected if the configuration for the main switch
+	  functionality of the FPGA IP core is selected.
+
 config MDIO_THUNDER
 	tristate "ThunderX SOCs MDIO buses"
 	depends on 64BIT
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index e02c66a02545..cb0a268cee59 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_MDIO_OCTEON)		+= mdio-octeon.o
 obj-$(CONFIG_MDIO_PIC64HPSC)		+= mdio-pic64hpsc.o
 obj-$(CONFIG_MDIO_REALTEK_RTL9300)	+= mdio-realtek-rtl9300.o
 obj-$(CONFIG_MDIO_REGMAP)		+= mdio-regmap.o
+obj-$(CONFIG_MDIO_SOCE_SWIP)		+= mdio-soce.o
 obj-$(CONFIG_MDIO_SUN4I)		+= mdio-sun4i.o
 obj-$(CONFIG_MDIO_THUNDER)		+= mdio-thunder.o
 obj-$(CONFIG_MDIO_XGENE)		+= mdio-xgene.o
diff --git a/drivers/net/mdio/mdio-soce.c b/drivers/net/mdio/mdio-soce.c
new file mode 100644
index 000000000000..5350feb92d55
--- /dev/null
+++ b/drivers/net/mdio/mdio-soce.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020-2026 System on Chip engineering, S.L.
+ * Copyright (c) 2026 Linutronix GmbH
+ * Author: Vasilij Strassheim <v.strassheim@linutronix.de>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of_mdio.h>
+#include <linux/platform_device.h>
+
+#define SWIP_MDIO_TIMEOUT_US		1000
+
+#define SWIP_MDIO_PARAMS_OFFSET		0x0000
+#define SWIP_MDIO_WRITE_OFFSET		0x0004
+#define SWIP_MDIO_READ_OFFSET		0x0008
+
+#define SWIP_MDIO_CTRL_TRANSTYPE_MASK	GENMASK(4, 3)
+#define SWIP_MDIO_CTRL_TRANSTYPE_WRITE	0x1
+#define SWIP_MDIO_CTRL_TRANSTYPE_READ	0x3
+#define SWIP_MDIO_CTRL_CLAUSE		BIT(1)
+#define SWIP_MDIO_CTRL_OPSTATUS		BIT(0)
+#define SWIP_MDIO_PARAMS_REGDEV_MASK	GENMASK(12, 8)
+#define SWIP_MDIO_PARAMS_PHYADDR_MASK	GENMASK(4, 0)
+#define SWIP_MDIO_READ_DATA_MASK	GENMASK(15, 0)
+
+struct swip_mdio {
+	void __iomem *ctrl;
+	void __iomem *data;
+};
+
+static int swip_mdio_wait_for_idle(struct swip_mdio *priv)
+{
+	void __iomem *ctrl = priv->ctrl;
+	u16 val;
+
+	return readw_poll_timeout(ctrl, val, !(val & SWIP_MDIO_CTRL_OPSTATUS),
+				  10, SWIP_MDIO_TIMEOUT_US);
+}
+
+static int swip_mdio_read(struct mii_bus *bus, int phy_addr, int regnum)
+{
+	struct swip_mdio *priv = bus->priv;
+	void __iomem *data = priv->data;
+	u32 command;
+	int ret;
+
+	ret = swip_mdio_wait_for_idle(priv);
+	if (ret)
+		return ret;
+
+	writel(FIELD_PREP(SWIP_MDIO_PARAMS_REGDEV_MASK, regnum) |
+	       FIELD_PREP(SWIP_MDIO_PARAMS_PHYADDR_MASK, phy_addr),
+	       data + SWIP_MDIO_PARAMS_OFFSET);
+
+	command = FIELD_PREP(SWIP_MDIO_CTRL_TRANSTYPE_MASK,
+			     SWIP_MDIO_CTRL_TRANSTYPE_READ) |
+		  SWIP_MDIO_CTRL_OPSTATUS;
+	writew(command, priv->ctrl);
+
+	ret = swip_mdio_wait_for_idle(priv);
+	if (ret)
+		return ret;
+
+	return readl(data + SWIP_MDIO_READ_OFFSET) & SWIP_MDIO_READ_DATA_MASK;
+}
+
+static int swip_mdio_read_c45(struct mii_bus *bus, int phy_addr, int devad,
+			      int regnum)
+{
+	struct swip_mdio *priv = bus->priv;
+	void __iomem *data = priv->data;
+	u32 command;
+	int ret;
+
+	ret = swip_mdio_wait_for_idle(priv);
+	if (ret)
+		return ret;
+
+	writel(FIELD_PREP(SWIP_MDIO_PARAMS_REGDEV_MASK, devad) |
+	       FIELD_PREP(SWIP_MDIO_PARAMS_PHYADDR_MASK, phy_addr),
+	       data + SWIP_MDIO_PARAMS_OFFSET);
+	writel(regnum, data + SWIP_MDIO_WRITE_OFFSET);
+
+	command = SWIP_MDIO_CTRL_CLAUSE | SWIP_MDIO_CTRL_OPSTATUS;
+	writew(command, priv->ctrl);
+
+	ret = swip_mdio_wait_for_idle(priv);
+	if (ret)
+		return ret;
+
+	command = FIELD_PREP(SWIP_MDIO_CTRL_TRANSTYPE_MASK,
+			     SWIP_MDIO_CTRL_TRANSTYPE_READ) |
+		  SWIP_MDIO_CTRL_CLAUSE | SWIP_MDIO_CTRL_OPSTATUS;
+	writew(command, priv->ctrl);
+
+	ret = swip_mdio_wait_for_idle(priv);
+	if (ret)
+		return ret;
+
+	return readl(data + SWIP_MDIO_READ_OFFSET) & SWIP_MDIO_READ_DATA_MASK;
+}
+
+static int swip_mdio_write(struct mii_bus *bus, int phy_addr, int regnum,
+			   u16 val)
+{
+	struct swip_mdio *priv = bus->priv;
+	void __iomem *data = priv->data;
+	u32 command;
+	int ret;
+
+	ret = swip_mdio_wait_for_idle(priv);
+	if (ret)
+		return ret;
+
+	writel(FIELD_PREP(SWIP_MDIO_PARAMS_REGDEV_MASK, regnum) |
+	       FIELD_PREP(SWIP_MDIO_PARAMS_PHYADDR_MASK, phy_addr),
+	       data + SWIP_MDIO_PARAMS_OFFSET);
+	writel(val, data + SWIP_MDIO_WRITE_OFFSET);
+
+	command = FIELD_PREP(SWIP_MDIO_CTRL_TRANSTYPE_MASK,
+			     SWIP_MDIO_CTRL_TRANSTYPE_WRITE) |
+		  SWIP_MDIO_CTRL_OPSTATUS;
+	writew(command, priv->ctrl);
+
+	return swip_mdio_wait_for_idle(priv);
+}
+
+static int swip_mdio_write_c45(struct mii_bus *bus, int phy_addr, int devad,
+			       int regnum, u16 val)
+{
+	struct swip_mdio *priv = bus->priv;
+	void __iomem *data = priv->data;
+	u32 command;
+	int ret;
+
+	ret = swip_mdio_wait_for_idle(priv);
+	if (ret)
+		return ret;
+
+	writel(FIELD_PREP(SWIP_MDIO_PARAMS_REGDEV_MASK, devad) |
+	       FIELD_PREP(SWIP_MDIO_PARAMS_PHYADDR_MASK, phy_addr),
+	       data + SWIP_MDIO_PARAMS_OFFSET);
+	writel(regnum, data + SWIP_MDIO_WRITE_OFFSET);
+
+	command = SWIP_MDIO_CTRL_CLAUSE | SWIP_MDIO_CTRL_OPSTATUS;
+	writew(command, priv->ctrl);
+
+	ret = swip_mdio_wait_for_idle(priv);
+	if (ret)
+		return ret;
+
+	writel(val, data + SWIP_MDIO_WRITE_OFFSET);
+
+	command = FIELD_PREP(SWIP_MDIO_CTRL_TRANSTYPE_MASK,
+			     SWIP_MDIO_CTRL_TRANSTYPE_WRITE) |
+		  SWIP_MDIO_CTRL_CLAUSE | SWIP_MDIO_CTRL_OPSTATUS;
+	writew(command, priv->ctrl);
+
+	return swip_mdio_wait_for_idle(priv);
+}
+
+static int swip_mdio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct swip_mdio *priv;
+	struct mii_bus *bus;
+
+	bus = devm_mdiobus_alloc_size(dev, sizeof(*priv));
+	if (!bus)
+		return -ENOMEM;
+
+	priv = bus->priv;
+	priv->data = devm_platform_ioremap_resource_byname(pdev, "data");
+	if (IS_ERR(priv->data))
+		return PTR_ERR(priv->data);
+
+	priv->ctrl = devm_platform_ioremap_resource_byname(pdev, "control");
+	if (IS_ERR(priv->ctrl))
+		return PTR_ERR(priv->ctrl);
+
+	bus->name = "soce mdio";
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
+	bus->parent = dev;
+	bus->read = swip_mdio_read;
+	bus->write = swip_mdio_write;
+	bus->read_c45 = swip_mdio_read_c45;
+	bus->write_c45 = swip_mdio_write_c45;
+
+	return devm_of_mdiobus_register(dev, bus, dev->of_node);
+}
+
+static const struct of_device_id swip_mdio_of_match[] = {
+	{ .compatible = "soce,swip-mdio" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, swip_mdio_of_match);
+
+static struct platform_driver swip_mdio_driver = {
+	.probe = swip_mdio_probe,
+	.driver = {
+		.name = "soce-mdio",
+		.of_match_table = swip_mdio_of_match,
+	},
+};
+module_platform_driver(swip_mdio_driver);
+
+MODULE_AUTHOR("Vasilij Strassheim <v.strassheim@linutronix.de>");
+MODULE_DESCRIPTION("SoC-e MDIO controller driver");
+MODULE_LICENSE("GPL");

-- 
2.39.5

