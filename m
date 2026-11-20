Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186396;
	b=CfGDjgT0RqoQ2/Ka4igEyzbCWtjGIMZdrOWjNBwy2AoyYWoYTY1kbFAZvjDTmm4ySFSG
	 c8F8an2tGJHq3ebgeLqRnqzqDis5S59MOSwjGRGHqo/LVNJVuolMt/TBkYdID9hbVXSJk
	 cMZ+gLdu+vk5nKxBAAZUf6S0+EROlNQhXw/HB1wp24yY5fmvUWmIdpQp0/9algyV3NuM8
	 e1LnZMOQ1VoGx76ienYUhpOL3cjZrpp6WIwVljRVOiAb0yHx66ZzXjhmMSfhi3hZ0THU0
	 XpRZvRb3nRhT6mfof1TctIBdULl5xncx6zx270ud4CNyz4JoQFBsYi70KBLpaqm21iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186396;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc;
	bh=b4g0a8lp4/UdxbgNzAcYSY0j+sETBK7eldpwx0Z5Tvc=;
	b=nE8VXZch0/q5XrcSi+853sa8y7OLEVV+jWDZOukt/aTmDmzTJCtmEQTRwB+Y0pZQ00+M
	 yYwkOMuwQUulGd4vsCRxYMiTKnHgoNtRpcIbtkQun/zRwdw7qRFD7dKyl3v3owzIr7+gg
	 4lP9qmrZENbmgC6NNdwP3v8bFIi8517euxAAssQX3xiDZqbL043H3KyPkBUVAw3oinfsY
	 CntrALjAw6ZI5kJp9X5qXnh1OdfTfhdJDxTzY1R3NakRm1RLt5w3SR5UHQC0DRZ3bsrZi
	 CjnPQyc8sfZHlYjlZqjR5DLJzao11Un+q2ASLZBl4h0GfqhFW71Bj9N1MO4IQHOwVxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=B61xG12n;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dwNxPBCW;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB2606A32A
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 14:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84FB2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=B61xG12n;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dwNxPBCW
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795186394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4g0a8lp4/UdxbgNzAcYSY0j+sETBK7eldpwx0Z5Tvc=;
	b=B61xG12n/WoD9OZanG+ZWtk7hepKK8bdwfVylVA+l01CYvR9JWCemr8oZarQiaGgPmr3ih
	14XS8bvqheCMS/W8jq5XiXJsfWmwyIZ/aU96lWCZKwIfXXxCeTo/yxSGb7XHQHPCnaDYEC
	mxZcrw4/8U25c1HOOzxsdfpdW5GiPEW7H8qedbOyaZZQx7ylRx3zYBlvGsdAL9vee7p3uP
	axbr8tEqwtPlV5zK95twT8nBmiBnF2140/BMJhb69CzzpIou2nyQHTx/LmEjn0Bkcs2Cu4
	pfLXZ0oumnD2olDuauTfUWfKbU6oum+V2yz4qylVgGFVJ1XguijQtqHWD5ROKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795186394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b4g0a8lp4/UdxbgNzAcYSY0j+sETBK7eldpwx0Z5Tvc=;
	b=dwNxPBCWGM1yy7ZqPQb7yLXjSNng2MSVwg8FN5i7Z0zLsW+U/Y5gVaiwQV/KHs5bheOTk5
	OtRUOHFQAyma1fAg==
Date: Fri, 20 Nov 2026 15:52:25 +0100
Subject: [PATCH net-next v5 8/9] net: dsa: soce: Add basic support for
 SoC-e SWIP switch
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
Message-Id: <20261120-devel-vstrassheim-soce-dsa-ml-v5-8-5de9225715e6@linutronix.de>
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

Add a DSA driver for SoC-e FPGA-based SWIP Ethernet switches.

Read the licensed and implemented port counts and synthesis-time feature
registers. Require DSA support and between 3 and 31 implemented ports,
without exceeding the licensed port count. Derive each port's phylink
capabilities from its phy-mode.

Enable "All Frames" tagging and hardware DSA custom rules during setup.
This isolates user ports and directs their ingress traffic to the CPU
port, leaving bridge forwarding to the Linux bridge.

Disable all user ports during setup and control port ingress and egress
through the DSA port callbacks. Disable tagging again during teardown to
restore the hardware to its non-tagging configuration.

Disable synthesized STP support during setup because an unconfigured
hardware STP block prevents forwarding. Leave STP state handling to the
Linux bridge.

Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
---
 drivers/net/dsa/Kconfig     |  15 ++
 drivers/net/dsa/Makefile    |   1 +
 drivers/net/dsa/soce-swip.c | 367 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/dsa/soce-swip.h |  35 +++++
 4 files changed, 418 insertions(+)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index d62f0cccf13d..92415169db81 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -149,6 +149,21 @@ config NET_DSA_SMSC_LAN9303_MDIO
 	  Enable access functions if the Microchip LAN9303/LAN9354 is configured
 	  for MDIO managed mode.
 
+config NET_DSA_SOCE_SWIP
+	tristate "SoC-e SWIP switches"
+	depends on NET_DSA
+	depends on OF
+	depends on HAS_IOMEM
+	select MFD_SOCE_SWIP
+	select MDIO_SOCE_SWIP
+	select MDIO_BUS_MUX_MMIOREG
+	select NET_DSA_TAG_SDSA
+	help
+	  This enables support for switches based on SoC-e SWIP IP cores.
+	  Frames are exchanged with the CPU port using the SDSA DSA tag protocol.
+	  The driver supports switch variants whose features and number of ports
+	  are selected at synthesis time and detected at runtime.
+
 config NET_DSA_VITESSE_VSC73XX
 	tristate
 	select NET_DSA_TAG_VSC73XX_8021Q
diff --git a/drivers/net/dsa/Makefile b/drivers/net/dsa/Makefile
index 7e637d56b35c..cb00d83ed29a 100644
--- a/drivers/net/dsa/Makefile
+++ b/drivers/net/dsa/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_NET_DSA_RZN1_A5PSW) += rzn1_a5psw.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303) += lan9303-core.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303_I2C) += lan9303_i2c.o
 obj-$(CONFIG_NET_DSA_SMSC_LAN9303_MDIO) += lan9303_mdio.o
+obj-$(CONFIG_NET_DSA_SOCE_SWIP) += soce-swip.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX) += vitesse-vsc73xx-core.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM) += vitesse-vsc73xx-platform.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_SPI) += vitesse-vsc73xx-spi.o
diff --git a/drivers/net/dsa/soce-swip.c b/drivers/net/dsa/soce-swip.c
new file mode 100644
index 000000000000..11c570ec98bc
--- /dev/null
+++ b/drivers/net/dsa/soce-swip.c
@@ -0,0 +1,367 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020-2026 System on Chip engineering, S.L.
+ * Copyright (c) 2026 Linutronix GmbH
+ * Author: Vasilij Strassheim <v.strassheim@linutronix.de>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/if_vlan.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/netdevice.h>
+#include <linux/of.h>
+#include <linux/of_net.h>
+#include <linux/phy.h>
+#include <linux/phylink.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+
+#include <net/dsa.h>
+
+#include "soce-swip.h"
+
+#define SWIP_IDENT_BASE_OFFSET			0x0000
+#define SWIP_IDENT_SIZE				0x0050
+#define SWIP_LIC_FEATURES_OFFSET		0x0004
+#define SWIP_LIC_FEATURES_NUM_PORTS_MASK	GENMASK(31, 27)
+#define SWIP_IMPL_FEATURES0_OFFSET		0x000c
+#define SWIP_IMPL_FEATURES0_NUM_PORTS_MASK	GENMASK(31, 27)
+#define SWIP_IMPL_FEATURES0_STP			BIT(20)
+#define SWIP_IMPL_FEATURES0_DSA			BIT(23)
+#define SWIP_MIN_NUM_PORTS			3
+
+#define SWIP_DSA_BASE_OFFSET			0x1200
+#define SWIP_DSA_SIZE				0x0044
+#define SWIP_TAG_ALL_FRAMES_CTRL_OFFSET		0x001c
+#define SWIP_TAG_ALL_FRAMES_CTRL_ENABLE		BIT(0)
+#define SWIP_CUSTOM_RULES_TAGGING_OFFSET	0x0020
+#define SWIP_CUSTOM_RULES_TAGGING_ENABLE	BIT(0)
+
+#define SWIP_PORTS_BASE_OFFSET			0x3000
+#define SWIP_PORTS_SIZE				0x0014
+#define SWIP_PORTS_SELECTOR_OFFSET		0x0000
+#define SWIP_PORTS_SELECTOR_PORT_MASK		GENMASK(7, 0)
+#define SWIP_PORTS_CTRL_OFFSET			0x0004
+#define SWIP_PORTS_CTRL_INGR_EN			BIT(0)
+#define SWIP_PORTS_CTRL_EGR_EN			BIT(1)
+
+#define SWIP_STP_BASE_OFFSET			0x0f00
+#define SWIP_STP_SIZE				0x0040
+#define SWIP_STP_CTRL_OFFSET			0x0000
+#define SWIP_STP_CTRL_ENABLE			BIT(0)
+
+static void __iomem *swip_ioremap(struct device *dev,
+				  const struct resource *window,
+				  resource_size_t offset, resource_size_t size,
+				  const char *name)
+{
+	struct resource res = {
+		.name = name,
+		.flags = IORESOURCE_MEM,
+	};
+
+	if (!size || offset >= resource_size(window) ||
+	    size > resource_size(window) - offset) {
+		dev_err(dev, "%s registers exceed switch resource\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	res.start = window->start + offset;
+	res.end = res.start + size - 1;
+
+	return devm_ioremap_resource(dev, &res);
+}
+
+static int swip_identify(struct device *dev, void __iomem *base,
+			 struct swip_priv *priv)
+{
+	u32 implemented_ports;
+	u32 licensed_ports;
+	u32 regval;
+
+	regval = readl(base + SWIP_LIC_FEATURES_OFFSET);
+	licensed_ports = FIELD_GET(SWIP_LIC_FEATURES_NUM_PORTS_MASK, regval);
+	regval = readl(base + SWIP_IMPL_FEATURES0_OFFSET);
+	if (!(regval & SWIP_IMPL_FEATURES0_DSA))
+		return dev_err_probe(dev, -ENODEV,
+				     "core does not implement DSA\n");
+
+	implemented_ports =
+		FIELD_GET(SWIP_IMPL_FEATURES0_NUM_PORTS_MASK, regval);
+	if (!licensed_ports || licensed_ports > SWIP_MAX_NUM_PORTS ||
+	    implemented_ports < SWIP_MIN_NUM_PORTS ||
+	    implemented_ports > licensed_ports)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid port counts\n");
+
+	priv->features.num_ports = implemented_ports;
+	priv->features.stp = regval & SWIP_IMPL_FEATURES0_STP;
+
+	return 0;
+}
+
+static void swip_phylink_get_caps(struct dsa_switch *ds, int port,
+				  struct phylink_config *config)
+{
+	struct dsa_port *dp = dsa_to_port(ds, port);
+	phy_interface_t mode;
+	int ret;
+
+	ret = of_get_phy_mode(dp->dn, &mode);
+	if (ret)
+		return;
+
+	if (phy_interface_mode_is_rgmii(mode))
+		phy_interface_set_rgmii(config->supported_interfaces);
+	else
+		__set_bit(mode, config->supported_interfaces);
+
+	config->mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
+
+	switch (mode) {
+	case PHY_INTERFACE_MODE_MII:
+		config->mac_capabilities |= MAC_10 | MAC_100;
+		break;
+	case PHY_INTERFACE_MODE_GMII:
+		config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		config->mac_capabilities |= MAC_10 | MAC_100;
+		break;
+	default:
+		if (phy_interface_mode_is_rgmii(mode))
+			config->mac_capabilities |= MAC_10 | MAC_100 | MAC_1000;
+		break;
+	}
+}
+
+static void swip_enable_tagging(struct swip_dsa_local *local)
+{
+	void __iomem *base = local->dsa;
+	u32 regval;
+
+	/* Enabling "All Frames" tagging isolates user ports by forwarding
+	 * their complete ingress traffic only to the CPU port.
+	 */
+	regval = readl(base + SWIP_TAG_ALL_FRAMES_CTRL_OFFSET);
+	regval |= SWIP_TAG_ALL_FRAMES_CTRL_ENABLE;
+	writel(regval, base + SWIP_TAG_ALL_FRAMES_CTRL_OFFSET);
+
+	/* "All Frames" tagging needs the active custom tagging mechanism. */
+	regval = readl(base + SWIP_CUSTOM_RULES_TAGGING_OFFSET);
+	regval |= SWIP_CUSTOM_RULES_TAGGING_ENABLE;
+	writel(regval, base + SWIP_CUSTOM_RULES_TAGGING_OFFSET);
+}
+
+static void swip_disable_tagging(struct swip_dsa_local *local)
+{
+	void __iomem *base = local->dsa;
+	u32 regval;
+
+	regval = readl(base + SWIP_TAG_ALL_FRAMES_CTRL_OFFSET);
+	regval &= ~SWIP_TAG_ALL_FRAMES_CTRL_ENABLE;
+	writel(regval, base + SWIP_TAG_ALL_FRAMES_CTRL_OFFSET);
+
+	regval = readl(base + SWIP_CUSTOM_RULES_TAGGING_OFFSET);
+	regval &= ~SWIP_CUSTOM_RULES_TAGGING_ENABLE;
+	writel(regval, base + SWIP_CUSTOM_RULES_TAGGING_OFFSET);
+}
+
+static void swip_stp_disable(struct swip_dsa_local *local)
+{
+	void __iomem *base = local->stp;
+	u32 regval;
+
+	regval = readl(base + SWIP_STP_CTRL_OFFSET);
+	regval &= ~SWIP_STP_CTRL_ENABLE;
+	writel(regval, base + SWIP_STP_CTRL_OFFSET);
+}
+
+static void swip_port_select(struct swip_dsa_local *local, int port)
+{
+	writel(FIELD_PREP(SWIP_PORTS_SELECTOR_PORT_MASK, port),
+	       local->ports + SWIP_PORTS_SELECTOR_OFFSET);
+}
+
+static void swip_port_set_enabled(struct swip_dsa_local *local, int port,
+				  bool enabled)
+{
+	void __iomem *base = local->ports;
+	u32 regval;
+
+	swip_port_select(local, port);
+
+	regval = readl(base + SWIP_PORTS_CTRL_OFFSET);
+	if (enabled)
+		regval |= SWIP_PORTS_CTRL_INGR_EN | SWIP_PORTS_CTRL_EGR_EN;
+	else
+		regval &= ~(SWIP_PORTS_CTRL_INGR_EN | SWIP_PORTS_CTRL_EGR_EN);
+	writel(regval, base + SWIP_PORTS_CTRL_OFFSET);
+}
+
+static int swip_port_enable(struct dsa_switch *ds, int port,
+			    struct phy_device *phy)
+{
+	struct swip_priv *priv = ds->priv;
+
+	swip_port_set_enabled(&priv->local, port, true);
+
+	return 0;
+}
+
+static void swip_port_disable(struct dsa_switch *ds, int port)
+{
+	struct swip_priv *priv = ds->priv;
+
+	swip_port_set_enabled(&priv->local, port, false);
+}
+
+static int swip_setup(struct dsa_switch *ds)
+{
+	struct swip_priv *priv = ds->priv;
+	struct dsa_port *dp;
+
+	dsa_switch_for_each_user_port(dp, ds)
+		swip_port_set_enabled(&priv->local, dp->index, false);
+
+	/* Unconfigured hardware STP blocks frame forwarding. */
+	if (priv->features.stp)
+		swip_stp_disable(&priv->local);
+
+	swip_enable_tagging(&priv->local);
+
+	return 0;
+}
+
+static void swip_teardown(struct dsa_switch *ds)
+{
+	struct swip_priv *priv = ds->priv;
+	struct swip_dsa_local *local;
+
+	local = &priv->local;
+
+	swip_disable_tagging(local);
+}
+
+static enum dsa_tag_protocol swip_get_tag_protocol(struct dsa_switch *ds,
+						   int port,
+						   enum dsa_tag_protocol mprop)
+{
+	return DSA_TAG_PROTO_SDSA;
+}
+
+static const struct dsa_switch_ops swip_switch_ops = {
+	.get_tag_protocol	= swip_get_tag_protocol,
+	.setup			= swip_setup,
+	.teardown		= swip_teardown,
+	.phylink_get_caps	= swip_phylink_get_caps,
+	.port_enable		= swip_port_enable,
+	.port_disable		= swip_port_disable,
+};
+
+static int swip_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct swip_dsa_local *local;
+	struct swip_priv *priv;
+	struct dsa_switch *ds;
+	struct resource *res;
+	void __iomem *base;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ds = &priv->ds;
+	ds->dev = dev;
+	ds->priv = priv;
+
+	base = swip_ioremap(dev, res, SWIP_IDENT_BASE_OFFSET,
+			    SWIP_IDENT_SIZE, "ident");
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+	ret = swip_identify(dev, base, priv);
+	if (ret)
+		return ret;
+
+	local = &priv->local;
+	local->dsa = swip_ioremap(dev, res, SWIP_DSA_BASE_OFFSET,
+				  SWIP_DSA_SIZE, "dsa");
+	if (IS_ERR(local->dsa))
+		return PTR_ERR(local->dsa);
+	local->ports = swip_ioremap(dev, res, SWIP_PORTS_BASE_OFFSET,
+				    SWIP_PORTS_SIZE, "ports");
+	if (IS_ERR(local->ports))
+		return PTR_ERR(local->ports);
+	if (priv->features.stp) {
+		local->stp = swip_ioremap(dev, res, SWIP_STP_BASE_OFFSET,
+					  SWIP_STP_SIZE, "stp");
+		if (IS_ERR(local->stp))
+			return PTR_ERR(local->stp);
+	}
+
+	ds->ops = &swip_switch_ops;
+	ds->num_ports = priv->features.num_ports;
+
+	dev_set_drvdata(dev, priv);
+
+	ret = dsa_register_switch(ds);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register DSA switch\n");
+
+	dev_info(dev, "probed SoC-e switch with %u ports\n",
+		 priv->features.num_ports);
+
+	return 0;
+}
+
+static void swip_remove(struct platform_device *pdev)
+{
+	struct swip_priv *priv = platform_get_drvdata(pdev);
+
+	if (!priv)
+		return;
+
+	dsa_unregister_switch(&priv->ds);
+	platform_set_drvdata(pdev, NULL);
+}
+
+static void swip_shutdown(struct platform_device *pdev)
+{
+	struct swip_priv *priv = platform_get_drvdata(pdev);
+
+	if (!priv)
+		return;
+
+	dsa_switch_shutdown(&priv->ds);
+	platform_set_drvdata(pdev, NULL);
+}
+
+static const struct of_device_id swip_of_match[] = {
+	{ .compatible = "soce,swip-switch-00-04-0c-10" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver swip_driver = {
+	.probe = swip_probe,
+	.remove = swip_remove,
+	.shutdown = swip_shutdown,
+	.driver = {
+		.name = "soce-switch",
+		.of_match_table = swip_of_match,
+	},
+};
+
+module_platform_driver(swip_driver);
+MODULE_DEVICE_TABLE(of, swip_of_match);
+MODULE_AUTHOR("Vasilij Strassheim <v.strassheim@linutronix.de>");
+MODULE_DESCRIPTION("SoC-e SWIP DSA switch driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/dsa/soce-swip.h b/drivers/net/dsa/soce-swip.h
new file mode 100644
index 000000000000..d3a523ad6694
--- /dev/null
+++ b/drivers/net/dsa/soce-swip.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020-2026 System on Chip engineering, S.L.
+ * Copyright (c) 2026 Linutronix GmbH
+ * Author: Vasilij Strassheim <v.strassheim@linutronix.de>
+ */
+
+#ifndef SOCE_SWIP_H
+#define SOCE_SWIP_H
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#include <net/dsa.h>
+
+#define SWIP_MAX_NUM_PORTS 31
+
+struct swip_features {
+	u32 num_ports;
+	bool stp;
+};
+
+struct swip_dsa_local {
+	void __iomem *dsa;
+	void __iomem *ports;
+	void __iomem *stp;
+};
+
+struct swip_priv {
+	struct swip_dsa_local local;
+	struct swip_features features;
+	struct dsa_switch ds;
+};
+
+#endif /* SOCE_SWIP_H */

-- 
2.39.5

