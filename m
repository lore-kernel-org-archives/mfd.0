Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440348;
	b=eYMhsXptZuR1wtYSMn6UCiuRc/IWcOcKsomR9/PU0DCC+xeCRe2JGCLQ2FMpchbKup2a
	 uRc5m6dylq7nHveiUyjG/CqInB3K2OQFieMaGtoFBOQHHVK4TuAKb8sbEWLagKi/nQ4WM
	 dX8wrVi8+P/ubQ4MDwDsPi93c2bR3AN5Ymxo8ZWY9wGqOzzX2iYVDt9OyQ/W53YSO8h2E
	 9SMTEozea9bqXd2QDB04yCokSfCIn9feqRz+JsaPJTbLqscT8D3RILQFSH8CGKs5VctFK
	 sQkVAP1Vqc03Czoo3JJWhmYb0MlBQZb+9JffWzlTERxNqQdE/XSTQuUx2EZFc4ICjLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440348;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=61W0MRGNTSBn93j/AcrahDLmEB0Bv3FkTf0AKb1948M=;
	b=EEUvdjGMtwsnT2NzjCCIyWDba1PNZRMGU2a9A3bNdOqeJcrTXUkt+UE4q9oentfmF3a0
	 T5UZ5AfJI3VisaVmV9QLHFyZNqXBaiEyR0nELVaw7WMEa6Ih0puSblhnWSLLqVq1UdtQ5
	 0p1y3rEapbbC8pxN2V/GO4zvLB9fI7OtGxpheiGxPEjnEy3fJZdSuffwYLE0IAdoNGwEz
	 mYikEiu/NfumrtpZqgDZhvUHKSLjRuwiCFBtdwXOFPZTdxZsadnn45ZCIc52buC8bwDXs
	 5rW2o1eC+O/pShFmyIyysGepVQo2tSGUnnCABIbZjd0gIltYNBQDMXs/XP0tphAbclw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=d3VKeAfB;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9FA60A261C
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 13:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD9FA60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=d3VKeAfB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795440348; x=1826976348;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ywydy/8TYD9c0cU7rt0SBzH9taTrgSZIMYmviDDC5PA=;
  b=d3VKeAfBVtK4O1ifrVQgv1VvVax59uHELaYxiei5s/dtc5WJzcH2MhVU
   rlqzBQVLV0gyS+yrAMzUBvZEygtE49Cu+ItiyVb7HXnsGJpVG0YT9RjMc
   /Cmom9Udjd0oTMnEvCduQ9ZXwysC/Hsh0c+8UBzXo23MSW7TYjyNMbU9X
   AnMqVnGDUkXKvrGg94Jay22jDIJttga545RtXhQt0oz9eomPCR+CEtP9M
   3HezhPtp+oemqj/uJhiWgl5zv3H9RhLiR64II23JiWL4HevPySwYimi1R
   y6sIZW7VgMR0nC9Zw/96uMEnks0cpqPRojoE3zyKAd/N1Drz1rth/8NV0
   g==;
X-CSE-ConnectionGUID: M2yotBjOS2SqqslfxcSJLw==
X-CSE-MsgGUID: 1yIljh48ScOU71HjniTS+w==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="66928986"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 06:25:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 06:25:46 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 06:25:44 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Mon, 23 Nov 2026 14:25:07 +0100
Subject: [PATCH 3/4] mfd: ocelot: Add support for the LAN9645x switch
 family
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
Message-ID: <20261123-mfd-ocelot-add-lan9645x-support-v1-3-567d811fe1de@microchip.com>
References: <20261123-mfd-ocelot-add-lan9645x-support-v1-0-567d811fe1de@microchip.com>
In-Reply-To: <20261123-mfd-ocelot-add-lan9645x-support-v1-0-567d811fe1de@microchip.com>
To: Colin Foster <colin.foster@in-advantage.com>, Lee Jones <lee@kernel.org>,
	<UNGLinuxDriver@microchip.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>
CC: <mfd@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

The LAN9645x switch is controlled over SPI like the VSC7512, with the
serial interface configuration in the General Configuration Block
SI_REGS group.

The padding bytes cover the register access time. A read of a register
group that is mapped onto a RAM waits while the hardware uses that RAM,
so the access time depends on the register and on the traffic. Base the
padding bytes on a 2 us access time, as recommended by the chip
designers.

A soft reset returns IF_CFGSTAT.IF_CFG to its default of 15 padding
bytes, and a read with another number of padding bytes than the chip is
configured for returns wrong data. Configure 15 padding bytes before
the reset, so the reset status reads correctly both before and after
the reset takes effect, and configure the padding bytes for the bus
speed after the reset. The reset also returns IF_CTRL to big-endian,
which does not affect the poll as the reset register reads zero in
either byte order once the reset is complete.

The serial interface configuration and the soft reset register share a
target, use one regmap for both.

The General Configuration Block also holds groups for several
peripherals such as the GPIO, SGPIO and MIIM registers, and also the
FEAT_DISABLE register used by the switch driver. Let the core pass
regmap access tables per resource name, and make the switch gcb regmap
cover the whole target, so the switch driver keeps its offsets relative
to the target, but readable only at FEAT_DISABLE.

The chip top target holds the CuPHY configuration, the GPIO pad
configuration, the strapping and the PLL and sensor registers, while
the MIIM cell owns CUPHY_COMMON_CFG. Restrict the switch chip_top regmap
in the same way to the per port CuPHY status, configuration and LED
registers and to the strapping register.

IF_CFGSTAT.IF_CFG holds at most 15 padding bytes on both chips. Fail
the probe before the reset when the bus speed needs more.

The SPI modalias is taken from the first compatible, which is the SKU
specific one. List every SKU in the SPI device ID table, so the module
is loaded for all of them.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/mfd/Kconfig       |   2 +-
 drivers/mfd/ocelot-core.c | 217 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/mfd/ocelot-spi.c  |  85 +++++++++++++++---
 drivers/mfd/ocelot.h      |  18 ++--
 4 files changed, 300 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..74a5cffbdecb 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1208,7 +1208,7 @@ config MFD_OCELOT
 	  through different interfaces, including SPI, I2C, and PCIe.
 
 	  Say yes here to add support for Ocelot chips (VSC7511, VSC7512,
-	  VSC7513, VSC7514) controlled externally.
+	  VSC7513, VSC7514) and LAN9645x chips controlled externally.
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called ocelot-soc.
diff --git a/drivers/mfd/ocelot-core.c b/drivers/mfd/ocelot-core.c
index 2f53122fb964..e95ac56df37a 100644
--- a/drivers/mfd/ocelot-core.c
+++ b/drivers/mfd/ocelot-core.c
@@ -22,6 +22,7 @@
 #include <linux/mfd/ocelot.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/string.h>
 #include <linux/types.h>
 
 #include <soc/mscc/ocelot.h>
@@ -81,6 +82,74 @@
 #define VSC7512_PORT_10_RES_START	0x71280000
 #define VSC7512_PORT_RES_SIZE		0x00010000
 
+#define LAN9645X_GCB_SOFT_RST		0x0010
+/* Despite its name, this resets the entire LAN9645x chip */
+#define LAN9645X_SOFT_SWC_RST		BIT(1)
+#define LAN9645X_GCB_FEAT_DISABLE	0x0014
+
+#define LAN9645X_GPIO_RES_START		0x00004028
+#define LAN9645X_GPIO_RES_SIZE		0x00000068
+
+#define LAN9645X_MIIM0_RES_START	0x00004098
+#define LAN9645X_MIIM1_RES_START	0x000040bc
+#define LAN9645X_MIIM_RES_SIZE		0x00000024
+
+#define LAN9645X_PHY_RES_START		0x00010048
+#define LAN9645X_PHY_RES_SIZE		0x00000004
+
+#define LAN9645X_QS_RES_START		0x00008000
+#define LAN9645X_QS_RES_SIZE		0x0000004c
+
+#define LAN9645X_PTP_RES_START		0x0000c000
+#define LAN9645X_PTP_RES_SIZE		0x000001f0
+
+#define LAN9645X_CHIP_TOP_CUPHY_PORT_STAT	0x000c
+#define LAN9645X_CHIP_TOP_CUPHY_LED_CFG(n)	(0x0034 + 4 * (n))
+#define LAN9645X_CHIP_TOP_STRAPPING		0x0118
+
+#define LAN9645X_CHIP_TOP_RES_START	0x00010000
+#define LAN9645X_CHIP_TOP_RES_SIZE	0x00000134
+
+#define LAN9645X_TAS_RES_START		0x00014000
+#define LAN9645X_TAS_RES_SIZE		0x000002c8
+
+#define LAN9645X_REW_RES_START		0x00018000
+#define LAN9645X_REW_RES_SIZE		0x00001910
+
+#define LAN9645X_MEP_RES_START		0x00020000
+#define LAN9645X_MEP_RES_SIZE		0x00001480
+
+#define LAN9645X_SYS_RES_START		0x0002c000
+#define LAN9645X_SYS_RES_SIZE		0x000012d4
+
+#define LAN9645X_HSIO_RES_START		0x00030000
+#define LAN9645X_HSIO_RES_SIZE		0x000000e4
+
+#define LAN9645X_QSYS_RES_START		0x00100000
+#define LAN9645X_QSYS_RES_SIZE		0x0000a000
+
+#define LAN9645X_AFI_RES_START		0x00120000
+#define LAN9645X_AFI_RES_SIZE		0x00001998
+
+#define LAN9645X_ANA_RES_START		0x00140000
+#define LAN9645X_ANA_RES_SIZE		0x00007468
+
+#define LAN9645X_VCAP0_RES_START	0x0001c000
+#define LAN9645X_VCAP1_RES_START	0x00024000
+#define LAN9645X_VCAP2_RES_START	0x00028000
+#define LAN9645X_VCAP_RES_SIZE		0x00000468
+
+#define LAN9645X_DEV_0_RES_START	0x00038000
+#define LAN9645X_DEV_1_RES_START	0x0003c000
+#define LAN9645X_DEV_2_RES_START	0x00040000
+#define LAN9645X_DEV_3_RES_START	0x00044000
+#define LAN9645X_DEV_4_RES_START	0x00048000
+#define LAN9645X_DEV_5_RES_START	0x0004c000
+#define LAN9645X_DEV_6_RES_START	0x00050000
+#define LAN9645X_DEV_7_RES_START	0x00054000
+#define LAN9645X_DEV_8_RES_START	0x00058000
+#define LAN9645X_DEV_RES_SIZE		0x000000b8
+
 #define VSC7512_GCB_RST_SLEEP_US	100
 #define VSC7512_GCB_RST_TIMEOUT_US	100000
 
@@ -90,6 +159,10 @@ struct ocelot_soft_rst {
 };
 
 static const struct ocelot_soft_rst ocelot_soft_rst[] = {
+	[OCELOT_CHIP_LAN9645X] = {
+		.reg = LAN9645X_GCB_SOFT_RST,
+		.mask = LAN9645X_SOFT_SWC_RST,
+	},
 	[OCELOT_CHIP_VSC7512] = {
 		.reg = VSC7512_GCB_SOFT_RST,
 		.mask = VSC7512_SOFT_CHIP_RST,
@@ -212,12 +285,136 @@ static const struct mfd_cell vsc7512_devs[] = {
 	},
 };
 
+static const struct resource lan9645x_pinctrl_resources[] = {
+	DEFINE_RES_REG_NAMED(LAN9645X_GPIO_RES_START, LAN9645X_GPIO_RES_SIZE, "gcb_gpio"),
+};
+
+static const struct resource lan9645x_miim0_resources[] = {
+	DEFINE_RES_REG_NAMED(LAN9645X_MIIM0_RES_START, LAN9645X_MIIM_RES_SIZE, "gcb_miim0"),
+};
+
+static const struct resource lan9645x_miim1_resources[] = {
+	DEFINE_RES_REG_NAMED(LAN9645X_MIIM1_RES_START, LAN9645X_MIIM_RES_SIZE, "gcb_miim1"),
+	DEFINE_RES_REG_NAMED(LAN9645X_PHY_RES_START, LAN9645X_PHY_RES_SIZE, "gcb_phy"),
+};
+
+static const struct resource lan9645x_switch_resources[] = {
+	DEFINE_RES_REG_NAMED(LAN9645X_GCB_RES_START, LAN9645X_GCB_RES_SIZE, "gcb"),
+	DEFINE_RES_REG_NAMED(LAN9645X_QS_RES_START, LAN9645X_QS_RES_SIZE, "qs"),
+	DEFINE_RES_REG_NAMED(LAN9645X_PTP_RES_START, LAN9645X_PTP_RES_SIZE, "ptp"),
+	DEFINE_RES_REG_NAMED(LAN9645X_CHIP_TOP_RES_START, LAN9645X_CHIP_TOP_RES_SIZE, "chip_top"),
+	DEFINE_RES_REG_NAMED(LAN9645X_TAS_RES_START, LAN9645X_TAS_RES_SIZE, "tas"),
+	DEFINE_RES_REG_NAMED(LAN9645X_REW_RES_START, LAN9645X_REW_RES_SIZE, "rew"),
+	DEFINE_RES_REG_NAMED(LAN9645X_VCAP0_RES_START, LAN9645X_VCAP_RES_SIZE, "vcap0"),
+	DEFINE_RES_REG_NAMED(LAN9645X_MEP_RES_START, LAN9645X_MEP_RES_SIZE, "mep"),
+	DEFINE_RES_REG_NAMED(LAN9645X_VCAP1_RES_START, LAN9645X_VCAP_RES_SIZE, "vcap1"),
+	DEFINE_RES_REG_NAMED(LAN9645X_VCAP2_RES_START, LAN9645X_VCAP_RES_SIZE, "vcap2"),
+	DEFINE_RES_REG_NAMED(LAN9645X_SYS_RES_START, LAN9645X_SYS_RES_SIZE, "sys"),
+	DEFINE_RES_REG_NAMED(LAN9645X_HSIO_RES_START, LAN9645X_HSIO_RES_SIZE, "hsio"),
+	DEFINE_RES_REG_NAMED(LAN9645X_DEV_0_RES_START, LAN9645X_DEV_RES_SIZE, "dev0"),
+	DEFINE_RES_REG_NAMED(LAN9645X_DEV_1_RES_START, LAN9645X_DEV_RES_SIZE, "dev1"),
+	DEFINE_RES_REG_NAMED(LAN9645X_DEV_2_RES_START, LAN9645X_DEV_RES_SIZE, "dev2"),
+	DEFINE_RES_REG_NAMED(LAN9645X_DEV_3_RES_START, LAN9645X_DEV_RES_SIZE, "dev3"),
+	DEFINE_RES_REG_NAMED(LAN9645X_DEV_4_RES_START, LAN9645X_DEV_RES_SIZE, "dev4"),
+	DEFINE_RES_REG_NAMED(LAN9645X_DEV_5_RES_START, LAN9645X_DEV_RES_SIZE, "dev5"),
+	DEFINE_RES_REG_NAMED(LAN9645X_DEV_6_RES_START, LAN9645X_DEV_RES_SIZE, "dev6"),
+	DEFINE_RES_REG_NAMED(LAN9645X_DEV_7_RES_START, LAN9645X_DEV_RES_SIZE, "dev7"),
+	DEFINE_RES_REG_NAMED(LAN9645X_DEV_8_RES_START, LAN9645X_DEV_RES_SIZE, "dev8"),
+	DEFINE_RES_REG_NAMED(LAN9645X_QSYS_RES_START, LAN9645X_QSYS_RES_SIZE, "qsys"),
+	DEFINE_RES_REG_NAMED(LAN9645X_AFI_RES_START, LAN9645X_AFI_RES_SIZE, "afi"),
+	DEFINE_RES_REG_NAMED(LAN9645X_ANA_RES_START, LAN9645X_ANA_RES_SIZE, "ana"),
+};
+
+static const struct mfd_cell lan9645x_devs[] = {
+	{
+		.name = "lan9645x-pinctrl",
+		.of_compatible = "microchip,lan96455f-pinctrl",
+		.num_resources = ARRAY_SIZE(lan9645x_pinctrl_resources),
+		.resources = lan9645x_pinctrl_resources,
+	}, {
+		.name = "lan9645x-miim0",
+		.of_compatible = "microchip,lan966x-miim",
+		.of_reg = LAN9645X_MIIM0_RES_START,
+		.use_of_reg = true,
+		.num_resources = ARRAY_SIZE(lan9645x_miim0_resources),
+		.resources = lan9645x_miim0_resources,
+	}, {
+		.name = "lan9645x-miim1",
+		.of_compatible = "microchip,lan966x-miim",
+		.of_reg = LAN9645X_MIIM1_RES_START,
+		.use_of_reg = true,
+		.num_resources = ARRAY_SIZE(lan9645x_miim1_resources),
+		.resources = lan9645x_miim1_resources,
+	}, {
+		.name = "lan9645x-switch",
+		.of_compatible = "microchip,lan96455s-switch",
+		.num_resources = ARRAY_SIZE(lan9645x_switch_resources),
+		.resources = lan9645x_switch_resources,
+	},
+};
+
+static const struct regmap_range lan9645x_gcb_rd_ranges[] = {
+	regmap_reg_range(LAN9645X_GCB_FEAT_DISABLE, LAN9645X_GCB_FEAT_DISABLE),
+};
+
+static const struct regmap_access_table lan9645x_gcb_rd_table = {
+	.yes_ranges = lan9645x_gcb_rd_ranges,
+	.n_yes_ranges = ARRAY_SIZE(lan9645x_gcb_rd_ranges),
+};
+
+static const struct regmap_range lan9645x_gcb_wr_no_ranges[] = {
+	regmap_reg_range(0, LAN9645X_GCB_RES_SIZE - 1),
+};
+
+static const struct regmap_access_table lan9645x_gcb_wr_table = {
+	.no_ranges = lan9645x_gcb_wr_no_ranges,
+	.n_no_ranges = ARRAY_SIZE(lan9645x_gcb_wr_no_ranges),
+};
+
+static const struct regmap_range lan9645x_chip_top_ranges[] = {
+	regmap_reg_range(LAN9645X_CHIP_TOP_CUPHY_PORT_STAT,
+			 LAN9645X_CHIP_TOP_CUPHY_LED_CFG(4)),
+	regmap_reg_range(LAN9645X_CHIP_TOP_STRAPPING,
+			 LAN9645X_CHIP_TOP_STRAPPING),
+};
+
+static const struct regmap_access_table lan9645x_chip_top_table = {
+	.yes_ranges = lan9645x_chip_top_ranges,
+	.n_yes_ranges = ARRAY_SIZE(lan9645x_chip_top_ranges),
+};
+
+struct ocelot_regmap_access {
+	const char *name;
+	const struct regmap_access_table *rd_table;
+	const struct regmap_access_table *wr_table;
+};
+
+static const struct ocelot_regmap_access lan9645x_regmap_access[] = {
+	{
+		.name = "gcb",
+		.rd_table = &lan9645x_gcb_rd_table,
+		.wr_table = &lan9645x_gcb_wr_table,
+	}, {
+		.name = "chip_top",
+		.rd_table = &lan9645x_chip_top_table,
+		.wr_table = &lan9645x_chip_top_table,
+	},
+};
+
 struct ocelot_cells {
 	const struct mfd_cell *cells;
 	unsigned int num_cells;
+	const struct ocelot_regmap_access *access;
+	unsigned int num_access;
 };
 
 static const struct ocelot_cells ocelot_cells[] = {
+	[OCELOT_CHIP_LAN9645X] = {
+		.cells = lan9645x_devs,
+		.num_cells = ARRAY_SIZE(lan9645x_devs),
+		.access = lan9645x_regmap_access,
+		.num_access = ARRAY_SIZE(lan9645x_regmap_access),
+	},
 	[OCELOT_CHIP_VSC7512] = {
 		.cells = vsc7512_devs,
 		.num_cells = ARRAY_SIZE(vsc7512_devs),
@@ -225,21 +422,35 @@ static const struct ocelot_cells ocelot_cells[] = {
 };
 
 static void ocelot_core_try_add_regmap(struct device *dev,
+				       const struct ocelot_cells *c,
 				       const struct resource *res)
 {
+	const struct regmap_access_table *rd_table = NULL;
+	const struct regmap_access_table *wr_table = NULL;
+	int i;
+
 	if (dev_get_regmap(dev, res->name))
 		return;
 
-	ocelot_spi_init_regmap(dev, res);
+	for (i = 0; i < c->num_access; i++) {
+		if (!strcmp(c->access[i].name, res->name)) {
+			rd_table = c->access[i].rd_table;
+			wr_table = c->access[i].wr_table;
+			break;
+		}
+	}
+
+	ocelot_spi_init_regmap(dev, res, rd_table, wr_table);
 }
 
 static void ocelot_core_try_add_regmaps(struct device *dev,
+					const struct ocelot_cells *c,
 					const struct mfd_cell *cell)
 {
 	int i;
 
 	for (i = 0; i < cell->num_resources; i++)
-		ocelot_core_try_add_regmap(dev, &cell->resources[i]);
+		ocelot_core_try_add_regmap(dev, c, &cell->resources[i]);
 }
 
 int ocelot_core_init(struct device *dev)
@@ -251,7 +462,7 @@ int ocelot_core_init(struct device *dev)
 	c = &ocelot_cells[ddata->chip];
 
 	for (i = 0; i < c->num_cells; i++)
-		ocelot_core_try_add_regmaps(dev, &c->cells[i]);
+		ocelot_core_try_add_regmaps(dev, c, &c->cells[i]);
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, c->cells, c->num_cells,
 				    NULL, 0, NULL);
diff --git a/drivers/mfd/ocelot-spi.c b/drivers/mfd/ocelot-spi.c
index e803d0363e62..6d405627136d 100644
--- a/drivers/mfd/ocelot-spi.c
+++ b/drivers/mfd/ocelot-spi.c
@@ -3,10 +3,10 @@
  * SPI core driver for the Ocelot chip family.
  *
  * This driver will handle everything necessary to allow for communication over
- * SPI to the VSC7511, VSC7512, VSC7513 and VSC7514 chips. The main functions
- * are to prepare the chip's SPI interface for a specific bus speed, and a host
- * processor's endianness. This will create and distribute regmaps for any
- * children.
+ * SPI to the VSC7511, VSC7512, VSC7513 and VSC7514 chips and the LAN9645x
+ * family. The main functions are to prepare the chip's SPI interface for a
+ * specific bus speed, and a host processor's endianness. This will create and
+ * distribute regmaps for any children.
  *
  * Copyright 2021-2022 Innovative Advantage Inc.
  *
@@ -40,6 +40,13 @@
 #define VSC7512_CHIP_REGS_RES_START	0x71070000
 #define VSC7512_CHIP_REGS_RES_SIZE	0x14
 
+#define LAN9645X_IF_CTRL		0x1c
+#define LAN9645X_IF_CFGSTAT		0x20
+#define LAN9645X_RESET_PADDING_BYTES	15
+#define LAN9645X_REG_ACCESS_TIME_US	2
+
+#define OCELOT_SPI_MAX_PADDING_BYTES	15
+
 static const struct resource vsc7512_dev_cpuorg_resource =
 	DEFINE_RES_REG_NAMED(VSC7512_DEVCPU_ORG_RES_START,
 			     VSC7512_DEVCPU_ORG_RES_SIZE,
@@ -50,6 +57,10 @@ static const struct resource vsc7512_gcb_resource =
 			     VSC7512_CHIP_REGS_RES_SIZE,
 			     "devcpu_gcb_chip_regs");
 
+static const struct resource lan9645x_gcb_resource =
+	DEFINE_RES_REG_NAMED(LAN9645X_GCB_RES_START, LAN9645X_GCB_RES_SIZE,
+			     "devcpu_gcb");
+
 struct ocelot_spi_data {
 	enum ocelot_chip chip;
 	const struct resource *cpuorg_res;
@@ -57,6 +68,7 @@ struct ocelot_spi_data {
 	unsigned int if_cfgstat;
 	u32 if_cfgstat_si;
 	const struct resource *gcb_res;
+	int reset_padding_bytes;
 	int (*padding_bytes)(u32 max_speed_hz);
 };
 
@@ -74,6 +86,27 @@ static int vsc7512_spi_padding_bytes(u32 max_speed_hz)
 	return 1 + (max_speed_hz / HZ_PER_MHZ + 2) / 8;
 }
 
+static int lan9645x_spi_padding_bytes(u32 max_speed_hz)
+{
+	u32 khz = max_speed_hz / HZ_PER_KHZ;
+
+	/*
+	 * The datasheet gives the maximum SPI clock for a number of padding
+	 * bytes as (IF_CFGSTAT.IF_CFG * 8 - 1.5) / access_time.
+	 */
+	return DIV_ROUND_UP(khz * LAN9645X_REG_ACCESS_TIME_US + 1500, 8000);
+}
+
+static const struct ocelot_spi_data lan9645x_spi_data = {
+	.chip = OCELOT_CHIP_LAN9645X,
+	.cpuorg_res = &lan9645x_gcb_resource,
+	.if_ctrl = LAN9645X_IF_CTRL,
+	.if_cfgstat = LAN9645X_IF_CFGSTAT,
+	.gcb_res = &lan9645x_gcb_resource,
+	.reset_padding_bytes = LAN9645X_RESET_PADDING_BYTES,
+	.padding_bytes = lan9645x_spi_padding_bytes,
+};
+
 static const struct ocelot_spi_data vsc7512_spi_data = {
 	.chip = OCELOT_CHIP_VSC7512,
 	.cpuorg_res = &vsc7512_dev_cpuorg_resource,
@@ -142,7 +175,8 @@ static int ocelot_spi_initialize(struct device *dev,
 	 *
 	 * The last check is for bits 31:24, which define the interface by which
 	 * the registers are being accessed. Since we're accessing them via the
-	 * serial interface, it must return IF_NUM_SI.
+	 * serial interface, it must return IF_NUM_SI. LAN9645x does not have
+	 * this field.
 	 */
 	check = val | data->if_cfgstat_si;
 
@@ -215,7 +249,10 @@ static const struct regmap_bus ocelot_spi_regmap_bus = {
 	.read = ocelot_spi_regmap_bus_read,
 };
 
-struct regmap *ocelot_spi_init_regmap(struct device *dev, const struct resource *res)
+struct regmap *ocelot_spi_init_regmap(struct device *dev,
+				      const struct resource *res,
+				      const struct regmap_access_table *rd_table,
+				      const struct regmap_access_table *wr_table)
 {
 	struct regmap_config regmap_config;
 
@@ -224,6 +261,8 @@ struct regmap *ocelot_spi_init_regmap(struct device *dev, const struct resource
 	regmap_config.name = res->name;
 	regmap_config.max_register = resource_size(res) - 1;
 	regmap_config.reg_base = res->start;
+	regmap_config.rd_table = rd_table;
+	regmap_config.wr_table = wr_table;
 
 	return devm_regmap_init(dev, &ocelot_spi_regmap_bus, dev, &regmap_config);
 }
@@ -234,6 +273,7 @@ static int ocelot_spi_probe(struct spi_device *spi)
 	const struct ocelot_spi_data *data;
 	struct device *dev = &spi->dev;
 	struct ocelot_ddata *ddata;
+	int padding, dummy_len;
 	struct regmap *r;
 	int err;
 
@@ -249,9 +289,15 @@ static int ocelot_spi_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, ddata);
 
-	ddata->spi_padding_bytes = data->padding_bytes(spi->max_speed_hz);
-	if (ddata->spi_padding_bytes) {
-		ddata->dummy_buf = devm_kzalloc(dev, ddata->spi_padding_bytes, GFP_KERNEL);
+	padding = data->padding_bytes(spi->max_speed_hz);
+	if (padding > OCELOT_SPI_MAX_PADDING_BYTES)
+		return dev_err_probe(dev, -EINVAL,
+				     "SPI clock of %u Hz needs more than %d padding bytes\n",
+				     spi->max_speed_hz, OCELOT_SPI_MAX_PADDING_BYTES);
+
+	dummy_len = max(padding, data->reset_padding_bytes);
+	if (dummy_len) {
+		ddata->dummy_buf = devm_kzalloc(dev, dummy_len, GFP_KERNEL);
 		if (!ddata->dummy_buf)
 			return -ENOMEM;
 	}
@@ -262,15 +308,17 @@ static int ocelot_spi_probe(struct spi_device *spi)
 	if (err)
 		return dev_err_probe(&spi->dev, err, "Error performing SPI setup\n");
 
-	r = ocelot_spi_init_regmap(dev, data->cpuorg_res);
+	r = ocelot_spi_init_regmap(dev, data->cpuorg_res, NULL, NULL);
 	if (IS_ERR(r))
 		return PTR_ERR(r);
 
 	ddata->cpuorg_regmap = r;
 
-	r = ocelot_spi_init_regmap(dev, data->gcb_res);
-	if (IS_ERR(r))
-		return PTR_ERR(r);
+	if (data->gcb_res != data->cpuorg_res) {
+		r = ocelot_spi_init_regmap(dev, data->gcb_res, NULL, NULL);
+		if (IS_ERR(r))
+			return PTR_ERR(r);
+	}
 
 	ddata->gcb_regmap = r;
 
@@ -279,6 +327,8 @@ static int ocelot_spi_probe(struct spi_device *spi)
 	 * This must be done before calling init, and after a chip reset is
 	 * performed.
 	 */
+	ddata->spi_padding_bytes = data->reset_padding_bytes ?: padding;
+
 	err = ocelot_spi_initialize(dev, data);
 	if (err)
 		return dev_err_probe(dev, err, "Error initializing SPI bus\n");
@@ -291,6 +341,8 @@ static int ocelot_spi_probe(struct spi_device *spi)
 	 * A chip reset will clear the SPI configuration, so it needs to be done
 	 * again before we can access any registers.
 	 */
+	ddata->spi_padding_bytes = padding;
+
 	err = ocelot_spi_initialize(dev, data);
 	if (err)
 		return dev_err_probe(dev, err, "Error initializing SPI bus after reset\n");
@@ -303,12 +355,19 @@ static int ocelot_spi_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id ocelot_spi_ids[] = {
+	{ .name = "lan96455f", .driver_data = (kernel_ulong_t)&lan9645x_spi_data },
+	{ .name = "lan96455s", .driver_data = (kernel_ulong_t)&lan9645x_spi_data },
+	{ .name = "lan96457f", .driver_data = (kernel_ulong_t)&lan9645x_spi_data },
+	{ .name = "lan96457s", .driver_data = (kernel_ulong_t)&lan9645x_spi_data },
+	{ .name = "lan96459f", .driver_data = (kernel_ulong_t)&lan9645x_spi_data },
+	{ .name = "lan96459s", .driver_data = (kernel_ulong_t)&lan9645x_spi_data },
 	{ .name = "vsc7512", .driver_data = (kernel_ulong_t)&vsc7512_spi_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ocelot_spi_ids);
 
 static const struct of_device_id ocelot_spi_of_match[] = {
+	{ .compatible = "microchip,lan96455s", .data = &lan9645x_spi_data },
 	{ .compatible = "mscc,vsc7512", .data = &vsc7512_spi_data },
 	{ }
 };
diff --git a/drivers/mfd/ocelot.h b/drivers/mfd/ocelot.h
index 92b5b893ff9b..fa02590a5026 100644
--- a/drivers/mfd/ocelot.h
+++ b/drivers/mfd/ocelot.h
@@ -8,9 +8,14 @@
 
 struct device;
 struct regmap;
+struct regmap_access_table;
 struct resource;
 
+#define LAN9645X_GCB_RES_START		0x00004000
+#define LAN9645X_GCB_RES_SIZE		0x00000244
+
 enum ocelot_chip {
+	OCELOT_CHIP_LAN9645X,
 	OCELOT_CHIP_VSC7512,
 };
 
@@ -23,10 +28,11 @@ enum ocelot_chip {
  *			like SPI bus configuration.
  * @spi_padding_bytes:	Number of padding bytes that must be thrown out before
  *			read data gets returned. This is calculated during
- *			initialization based on bus speed.
- * @dummy_buf:		Zero-filled buffer of spi_padding_bytes size. The dummy
- *			bytes that will be sent out between the address and
- *			data of a SPI read operation.
+ *			initialization based on bus speed, or set to the
+ *			reset default of the chip around a chip reset.
+ * @dummy_buf:		Zero-filled buffer of at least spi_padding_bytes size.
+ *			The dummy bytes that will be sent out between the
+ *			address and data of a SPI read operation.
  */
 struct ocelot_ddata {
 	enum ocelot_chip chip;
@@ -41,7 +47,9 @@ int ocelot_core_init(struct device *dev);
 
 /* SPI-specific routines that won't be necessary for other interfaces */
 struct regmap *ocelot_spi_init_regmap(struct device *dev,
-				      const struct resource *res);
+				      const struct resource *res,
+				      const struct regmap_access_table *rd_table,
+				      const struct regmap_access_table *wr_table);
 
 #define OCELOT_SPI_BYTE_ORDER_LE 0x00000000
 #define OCELOT_SPI_BYTE_ORDER_BE 0x81818181

-- 
2.52.0

