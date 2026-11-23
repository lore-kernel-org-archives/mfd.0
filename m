Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440343;
	b=tsCMkNFQXxE1CgDyIX5hEN0lwCtwPulpY720hB+HVQrb18Dd0P232d776w3jwOEs1T4P
	 eeiJ6AS6llN45Fjol88WKWq9gOTEO9QhyZgmGR8sXPCLqxve0GgFVzTpH1SPOsFpUA4m5
	 nqphl9fnoWEhrYr/lgZqG1uH+KqyL7aRjejtRrBsrWAaHjnZYtOLc8jBkJe9nhgeXDX/C
	 VffZq2FJirU0f3X0A5XrQHXk8Te9fJUbpNH5aeQdPd/uaqNiMUdzCMrbSXcqcpcbRw0bv
	 nfIdspjvzARspvLnzmZPi5eRpRDiRAlGfYD9pwm6w3HAsOjHJiux7Yc6qSufREZ36/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440343;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=g1I/14I95gydn2dsr7fK8aodqhToZt2zSccNpHE68WI=;
	b=Rqfhkissq8LY86Mqkg9eaW9mPPl36hZiEdpsQyzcPIHtaGqSc3ss5ctlTAZ/RsmjlFkt
	 RKvD6ZGAUP/9OAiPr3o/qItwf7ArS5ib0ybshsK0xYUYMWI9vqrin9x2Skx6CaXa3K5C0
	 IYqjprfEG5ZTKG2zYAHIknyHKdkkoRgXQBGYEfzCAMh3obQq326zzhRpNzukCx6Uo8lBi
	 yvco//FASQ0JcoZnfrDzqV1RPxa6fB4c2JOZZvFPnXVgn0XqeCo5HQF71+0bsUcPSqrI/
	 k+HrAdS/LkxbkVA077G+9BvPwWUlWUNLlMiE4FpuLIgeycoWESzo2N3fas+BGs9Z9PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=0Ten48jQ;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE0606A6AC
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 13:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DFE0606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=0Ten48jQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795440343; x=1826976343;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=e+8Xhx4BQbDDQ9GDqlEHqdz/O/IgLi3PflDvtChL4jM=;
  b=0Ten48jQaGNr//W2J1pFTwTD+YyTQe8YjQxOfStZ0WiBG4SbcrgfwfN3
   t1MKVwonm1BVSXt76dopT2IS8bG9npFSVo5NZn6vWrWfiiP9DHLb2iGns
   PZ4k8MHMoy5IWJRu/70eLD8pdC3YAbVc3TxxuiZqUG05ahmBHufi8dRiv
   cEPrfdYt/Ort6tXKyBn+QQ8P08cltE9ZTd2XICs+sZu9tMT9uHkq/2eUB
   r/vpAm8V9khxwGD3FYrrCmqf+bmwDgIjyyYrhGjrt7lGOLCqgLm5dj8pN
   kUGopt6QCxP/k5tbu8VtIs/lA8f+yEuFRIDDOLSMqExM35ETvIinYdELp
   Q==;
X-CSE-ConnectionGUID: EbIM8jCTQWia35G3SwVEmQ==
X-CSE-MsgGUID: wikBMBMFRyCsuNeXIcE4nA==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="67154003"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 06:25:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.57; Mon, 23 Nov 2026 06:25:42 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 06:25:39 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Mon, 23 Nov 2026 14:25:05 +0100
Subject: [PATCH 1/4] mfd: ocelot: Select the chip through match data
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
Message-ID: <20261123-mfd-ocelot-add-lan9645x-support-v1-1-567d811fe1de@microchip.com>
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

The SPI interface bootstrap, the chip reset and the child devices are
hardcoded for the VSC7512. Describe the serial interface configuration
target, its registers, the IF_CFGSTAT readback check and the padding
byte calculation in SPI match data, and select the soft reset register
and the child devices in the core by the chip it names. This prepares
for adding the LAN9645x switch family.

The VSC7512 soft reset defines get a VSC7512 prefix.

The probe now fails for a device bound without match data, otherwise
there is no functional change.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/mfd/ocelot-core.c | 48 +++++++++++++++++++++++------
 drivers/mfd/ocelot-spi.c  | 77 +++++++++++++++++++++++++++++++++--------------
 drivers/mfd/ocelot.h      |  6 ++++
 3 files changed, 100 insertions(+), 31 deletions(-)

diff --git a/drivers/mfd/ocelot-core.c b/drivers/mfd/ocelot-core.c
index 41aff2708854..2f53122fb964 100644
--- a/drivers/mfd/ocelot-core.c
+++ b/drivers/mfd/ocelot-core.c
@@ -28,9 +28,9 @@
 
 #include "ocelot.h"
 
-#define REG_GCB_SOFT_RST		0x0008
+#define VSC7512_GCB_SOFT_RST		0x0008
 
-#define BIT_SOFT_CHIP_RST		BIT(0)
+#define VSC7512_SOFT_CHIP_RST		BIT(0)
 
 #define VSC7512_MIIM0_RES_START		0x7107009c
 #define VSC7512_MIIM1_RES_START		0x710700c0
@@ -84,11 +84,23 @@
 #define VSC7512_GCB_RST_SLEEP_US	100
 #define VSC7512_GCB_RST_TIMEOUT_US	100000
 
+struct ocelot_soft_rst {
+	unsigned int reg;
+	u32 mask;
+};
+
+static const struct ocelot_soft_rst ocelot_soft_rst[] = {
+	[OCELOT_CHIP_VSC7512] = {
+		.reg = VSC7512_GCB_SOFT_RST,
+		.mask = VSC7512_SOFT_CHIP_RST,
+	},
+};
+
 static int ocelot_gcb_chip_rst_status(struct ocelot_ddata *ddata)
 {
 	int val, err;
 
-	err = regmap_read(ddata->gcb_regmap, REG_GCB_SOFT_RST, &val);
+	err = regmap_read(ddata->gcb_regmap, ocelot_soft_rst[ddata->chip].reg, &val);
 	if (err)
 		return err;
 
@@ -98,15 +110,18 @@ static int ocelot_gcb_chip_rst_status(struct ocelot_ddata *ddata)
 int ocelot_chip_reset(struct device *dev)
 {
 	struct ocelot_ddata *ddata = dev_get_drvdata(dev);
+	const struct ocelot_soft_rst *rst;
 	int ret, val;
 
+	rst = &ocelot_soft_rst[ddata->chip];
+
 	/*
 	 * Reset the entire chip here to put it into a completely known state.
 	 * Other drivers may want to reset their own subsystems. The register
 	 * self-clears, so one write is all that is needed and wait for it to
 	 * clear.
 	 */
-	ret = regmap_write(ddata->gcb_regmap, REG_GCB_SOFT_RST, BIT_SOFT_CHIP_RST);
+	ret = regmap_write(ddata->gcb_regmap, rst->reg, rst->mask);
 	if (ret)
 		return ret;
 
@@ -197,6 +212,18 @@ static const struct mfd_cell vsc7512_devs[] = {
 	},
 };
 
+struct ocelot_cells {
+	const struct mfd_cell *cells;
+	unsigned int num_cells;
+};
+
+static const struct ocelot_cells ocelot_cells[] = {
+	[OCELOT_CHIP_VSC7512] = {
+		.cells = vsc7512_devs,
+		.num_cells = ARRAY_SIZE(vsc7512_devs),
+	},
+};
+
 static void ocelot_core_try_add_regmap(struct device *dev,
 				       const struct resource *res)
 {
@@ -217,14 +244,17 @@ static void ocelot_core_try_add_regmaps(struct device *dev,
 
 int ocelot_core_init(struct device *dev)
 {
-	int i, ndevs;
+	struct ocelot_ddata *ddata = dev_get_drvdata(dev);
+	const struct ocelot_cells *c;
+	int i;
 
-	ndevs = ARRAY_SIZE(vsc7512_devs);
+	c = &ocelot_cells[ddata->chip];
 
-	for (i = 0; i < ndevs; i++)
-		ocelot_core_try_add_regmaps(dev, &vsc7512_devs[i]);
+	for (i = 0; i < c->num_cells; i++)
+		ocelot_core_try_add_regmaps(dev, &c->cells[i]);
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, vsc7512_devs, ndevs, NULL, 0, NULL);
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, c->cells, c->num_cells,
+				    NULL, 0, NULL);
 }
 EXPORT_SYMBOL_NS(ocelot_core_init, "MFD_OCELOT");
 
diff --git a/drivers/mfd/ocelot-spi.c b/drivers/mfd/ocelot-spi.c
index 52bde8d4daf3..e803d0363e62 100644
--- a/drivers/mfd/ocelot-spi.c
+++ b/drivers/mfd/ocelot-spi.c
@@ -50,7 +50,42 @@ static const struct resource vsc7512_gcb_resource =
 			     VSC7512_CHIP_REGS_RES_SIZE,
 			     "devcpu_gcb_chip_regs");
 
-static int ocelot_spi_initialize(struct device *dev)
+struct ocelot_spi_data {
+	enum ocelot_chip chip;
+	const struct resource *cpuorg_res;
+	unsigned int if_ctrl;
+	unsigned int if_cfgstat;
+	u32 if_cfgstat_si;
+	const struct resource *gcb_res;
+	int (*padding_bytes)(u32 max_speed_hz);
+};
+
+static int vsc7512_spi_padding_bytes(u32 max_speed_hz)
+{
+	if (max_speed_hz <= 500000)
+		return 0;
+
+	/*
+	 * Calculation taken from the manual for IF_CFGSTAT:IF_CFG. Register
+	 * access time is 1us, so we need to configure and send out enough
+	 * padding bytes between the read request and data transmission that
+	 * lasts at least 1 microsecond.
+	 */
+	return 1 + (max_speed_hz / HZ_PER_MHZ + 2) / 8;
+}
+
+static const struct ocelot_spi_data vsc7512_spi_data = {
+	.chip = OCELOT_CHIP_VSC7512,
+	.cpuorg_res = &vsc7512_dev_cpuorg_resource,
+	.if_ctrl = REG_DEV_CPUORG_IF_CTRL,
+	.if_cfgstat = REG_DEV_CPUORG_IF_CFGSTAT,
+	.if_cfgstat_si = CFGSTAT_IF_NUM_SI,
+	.gcb_res = &vsc7512_gcb_resource,
+	.padding_bytes = vsc7512_spi_padding_bytes,
+};
+
+static int ocelot_spi_initialize(struct device *dev,
+				 const struct ocelot_spi_data *data)
 {
 	struct ocelot_ddata *ddata = dev_get_drvdata(dev);
 	u32 val, check;
@@ -80,7 +115,7 @@ static int ocelot_spi_initialize(struct device *dev)
 	 * | 22222233 | 11112222 |   111111 |          |
 	 * | 45678901 | 67890123 | 89012345 | 01234567 |
 	 */
-	err = regmap_write(ddata->cpuorg_regmap, REG_DEV_CPUORG_IF_CTRL, val);
+	err = regmap_write(ddata->cpuorg_regmap, data->if_ctrl, val);
 	if (err)
 		return err;
 
@@ -90,7 +125,7 @@ static int ocelot_spi_initialize(struct device *dev)
 	 * first payload bit is shifted out too quickly, the read will fail.
 	 */
 	val = ddata->spi_padding_bytes;
-	err = regmap_write(ddata->cpuorg_regmap, REG_DEV_CPUORG_IF_CFGSTAT, val);
+	err = regmap_write(ddata->cpuorg_regmap, data->if_cfgstat, val);
 	if (err)
 		return err;
 
@@ -109,9 +144,9 @@ static int ocelot_spi_initialize(struct device *dev)
 	 * the registers are being accessed. Since we're accessing them via the
 	 * serial interface, it must return IF_NUM_SI.
 	 */
-	check = val | CFGSTAT_IF_NUM_SI;
+	check = val | data->if_cfgstat_si;
 
-	err = regmap_read(ddata->cpuorg_regmap, REG_DEV_CPUORG_IF_CFGSTAT, &val);
+	err = regmap_read(ddata->cpuorg_regmap, data->if_cfgstat, &val);
 	if (err)
 		return err;
 
@@ -196,28 +231,26 @@ EXPORT_SYMBOL_NS(ocelot_spi_init_regmap, "MFD_OCELOT_SPI");
 
 static int ocelot_spi_probe(struct spi_device *spi)
 {
+	const struct ocelot_spi_data *data;
 	struct device *dev = &spi->dev;
 	struct ocelot_ddata *ddata;
 	struct regmap *r;
 	int err;
 
+	data = spi_get_device_match_data(spi);
+	if (!data)
+		return -ENODEV;
+
 	ddata = devm_kzalloc_obj(dev, *ddata);
 	if (!ddata)
 		return -ENOMEM;
 
+	ddata->chip = data->chip;
+
 	spi_set_drvdata(spi, ddata);
 
-	if (spi->max_speed_hz <= 500000) {
-		ddata->spi_padding_bytes = 0;
-	} else {
-		/*
-		 * Calculation taken from the manual for IF_CFGSTAT:IF_CFG.
-		 * Register access time is 1us, so we need to configure and send
-		 * out enough padding bytes between the read request and data
-		 * transmission that lasts at least 1 microsecond.
-		 */
-		ddata->spi_padding_bytes = 1 + (spi->max_speed_hz / HZ_PER_MHZ + 2) / 8;
-
+	ddata->spi_padding_bytes = data->padding_bytes(spi->max_speed_hz);
+	if (ddata->spi_padding_bytes) {
 		ddata->dummy_buf = devm_kzalloc(dev, ddata->spi_padding_bytes, GFP_KERNEL);
 		if (!ddata->dummy_buf)
 			return -ENOMEM;
@@ -229,13 +262,13 @@ static int ocelot_spi_probe(struct spi_device *spi)
 	if (err)
 		return dev_err_probe(&spi->dev, err, "Error performing SPI setup\n");
 
-	r = ocelot_spi_init_regmap(dev, &vsc7512_dev_cpuorg_resource);
+	r = ocelot_spi_init_regmap(dev, data->cpuorg_res);
 	if (IS_ERR(r))
 		return PTR_ERR(r);
 
 	ddata->cpuorg_regmap = r;
 
-	r = ocelot_spi_init_regmap(dev, &vsc7512_gcb_resource);
+	r = ocelot_spi_init_regmap(dev, data->gcb_res);
 	if (IS_ERR(r))
 		return PTR_ERR(r);
 
@@ -246,7 +279,7 @@ static int ocelot_spi_probe(struct spi_device *spi)
 	 * This must be done before calling init, and after a chip reset is
 	 * performed.
 	 */
-	err = ocelot_spi_initialize(dev);
+	err = ocelot_spi_initialize(dev, data);
 	if (err)
 		return dev_err_probe(dev, err, "Error initializing SPI bus\n");
 
@@ -258,7 +291,7 @@ static int ocelot_spi_probe(struct spi_device *spi)
 	 * A chip reset will clear the SPI configuration, so it needs to be done
 	 * again before we can access any registers.
 	 */
-	err = ocelot_spi_initialize(dev);
+	err = ocelot_spi_initialize(dev, data);
 	if (err)
 		return dev_err_probe(dev, err, "Error initializing SPI bus after reset\n");
 
@@ -270,13 +303,13 @@ static int ocelot_spi_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id ocelot_spi_ids[] = {
-	{ .name = "vsc7512" },
+	{ .name = "vsc7512", .driver_data = (kernel_ulong_t)&vsc7512_spi_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ocelot_spi_ids);
 
 static const struct of_device_id ocelot_spi_of_match[] = {
-	{ .compatible = "mscc,vsc7512" },
+	{ .compatible = "mscc,vsc7512", .data = &vsc7512_spi_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ocelot_spi_of_match);
diff --git a/drivers/mfd/ocelot.h b/drivers/mfd/ocelot.h
index b8bc2f1486e2..92b5b893ff9b 100644
--- a/drivers/mfd/ocelot.h
+++ b/drivers/mfd/ocelot.h
@@ -10,8 +10,13 @@ struct device;
 struct regmap;
 struct resource;
 
+enum ocelot_chip {
+	OCELOT_CHIP_VSC7512,
+};
+
 /**
  * struct ocelot_ddata - Private data for an external Ocelot chip
+ * @chip:		Chip family member.
  * @gcb_regmap:		General Configuration Block regmap. Used for
  *			operations like chip reset.
  * @cpuorg_regmap:	CPU Device Origin Block regmap. Used for operations
@@ -24,6 +29,7 @@ struct resource;
  *			data of a SPI read operation.
  */
 struct ocelot_ddata {
+	enum ocelot_chip chip;
 	struct regmap *gcb_regmap;
 	struct regmap *cpuorg_regmap;
 	int spi_padding_bytes;

-- 
2.52.0

