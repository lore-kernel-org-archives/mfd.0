Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440351;
	b=sJc50+jDZ4DbZ8d9GABqJnNrd2tDzZOROJyzCY2z2tMkUalZytHQpfQVFKRC+kBE8Hdq
	 3SPfU55MgszbJLRyBKhK8IounyC8nv7lSXMXNxh+XJ/zkbRmLsblzjrLNRUDTGhI9ljeJ
	 esTgvPaVuvOtfDzRWe4JxkPElmbPJK6fAA6ZMfA4XMQ+U3JHsJXkNNGQ/UX4ff/KnAYa6
	 KiaJxgxRAfyOFweBVeF9XIbPW8smQcbf6uXdXZz5bzQxJOw3RocXtbp2aTkX//nzg/sW3
	 IBSuGQDaaGpz5mR2i9gVGW+aOcG+pswZYpzq5CeSwGyqNl+xnV2qdWAO+0ny0IfG7MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440351;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=DBCFU9vOrJdstCRij3rT/Hl2Y7D7MQX+Hld/OsjMT7U=;
	b=DR9jwMQ260hhQwm2YM/LhjRZKe3CQh/fos/QGi1vItch4ttraLOkbGjTvfE3SAfuFnub
	 phVapRwA1IhXBsoqMvL+v3uEd8vM3GqhytVmY//HnD2m4A7qIQAGIcfO33ORKGRso9zXa
	 2vpzdH5P8ASaC6XGJBJm8zigTKTaQwZ/dn46TKMFJRdYpQBzO4/QETKqFDyqs+r88sT7Y
	 rPTLG5TJ8Fw44dusbtK+xMm3/sdBfykj8HCsYzpK0xxxywZ09yxb62aEq3F7FWEx7Ogkx
	 ooft5QPZLKWa4SJMAAC6MF8ey2kS+Z0aoKPdVc9FiPyE2wSZ1gKS5wHrz4vYU7DigrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b="rxywaiJ/";
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FB160A382E
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 13:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FB160A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=rxywaiJ/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795440350; x=1826976350;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=bBo0I05VdlQLgenPhmy0GmOEtXQJWt5VHRNZsb0qbBg=;
  b=rxywaiJ/39syUj/eB3FAWCkthnE5JixUS8toA+l7qkYsj1BuTJKlGCPY
   CNMpcOI9WJuXyxqhWV6XeLWcw4STdO+/i2iKyQx7Js+9EHsfgR4Qr9dgi
   FiWt8bQwJg81A3r0z/PAZ+T6LgyDsP/TDyr1i6vba2Bzc0TfjfvEnc6ke
   aVtDnvock/oAmrWNwRoHzq4he3/P13pGzDspiLI5vNEQ3Nvte66a5Uko+
   qv1fdmsklnOuw0/kM14+smMaVvrWSBQhW9iF/DjEQ85BByxvnZ6vARTDZ
   DTIIDNC5iKgjt6p5sEd0H10KTPjaxLIytyg9u1UeuXdbbOcJNiyYxhv0a
   g==;
X-CSE-ConnectionGUID: NDR+tIaTRs+D6MAlDHcSbg==
X-CSE-MsgGUID: C0Yj1zaZTvqvnj4ZU5YucQ==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="67154024"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 06:25:49 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 06:25:49 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 06:25:47 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Mon, 23 Nov 2026 14:25:08 +0100
Subject: [PATCH 4/4] mfd: ocelot: Read LAN9645x registers in a single SPI
 transfer
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
Message-ID: <20261123-mfd-ocelot-add-lan9645x-support-v1-4-567d811fe1de@microchip.com>
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

A register read is three SPI transfers: the address, the padding bytes
and the value. The SPI controller handles each transfer separately, with
its own setup and interrupt.

Read the address, the padding bytes and the value of a LAN9645x register
in one full duplex transfer instead, which removes the handling of two
transfers from every read. The three transfer read works on the
LAN9645x as well, this only reduces the cost of a read. The transfer
buffer is allocated per regmap, so the regmap lock serializes its use.

With the interrupt driven Atmel SPI controller of a LAN966x host at
25 MHz and a GPIO chip select, a register read takes 35.8 us instead of
62.2 us, with a standard deviation below 0.1 us over seven runs of
13800 reads.

Half duplex controllers and devices in 3-wire mode cannot transmit and
receive in one transfer, so fall back to the three transfer read for
them.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/mfd/ocelot-spi.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/mfd/ocelot.h     |  3 +-
 2 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/ocelot-spi.c b/drivers/mfd/ocelot-spi.c
index 6d405627136d..4f2ef847c909 100644
--- a/drivers/mfd/ocelot-spi.c
+++ b/drivers/mfd/ocelot-spi.c
@@ -13,6 +13,7 @@
  * Author: Colin Foster <colin.foster@in-advantage.com>
  */
 
+#include <linux/cache.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -45,7 +46,12 @@
 #define LAN9645X_RESET_PADDING_BYTES	15
 #define LAN9645X_REG_ACCESS_TIME_US	2
 
+#define OCELOT_SPI_ADDR_SIZE		3
 #define OCELOT_SPI_MAX_PADDING_BYTES	15
+#define OCELOT_SPI_VAL_SIZE		4
+#define OCELOT_SPI_XFER_BUF_SIZE	(OCELOT_SPI_ADDR_SIZE + \
+					 OCELOT_SPI_MAX_PADDING_BYTES + \
+					 OCELOT_SPI_VAL_SIZE)
 
 static const struct resource vsc7512_dev_cpuorg_resource =
 	DEFINE_RES_REG_NAMED(VSC7512_DEVCPU_ORG_RES_START,
@@ -70,6 +76,12 @@ struct ocelot_spi_data {
 	const struct resource *gcb_res;
 	int reset_padding_bytes;
 	int (*padding_bytes)(u32 max_speed_hz);
+	bool single_xfer_read;
+};
+
+struct ocelot_spi_regmap_ctx {
+	struct device *dev;
+	u8 buf[OCELOT_SPI_XFER_BUF_SIZE] __aligned(ARCH_DMA_MINALIGN);
 };
 
 static int vsc7512_spi_padding_bytes(u32 max_speed_hz)
@@ -105,6 +117,7 @@ static const struct ocelot_spi_data lan9645x_spi_data = {
 	.gcb_res = &lan9645x_gcb_resource,
 	.reset_padding_bytes = LAN9645X_RESET_PADDING_BYTES,
 	.padding_bytes = lan9645x_spi_padding_bytes,
+	.single_xfer_read = true,
 };
 
 static const struct ocelot_spi_data vsc7512_spi_data = {
@@ -249,12 +262,78 @@ static const struct regmap_bus ocelot_spi_regmap_bus = {
 	.read = ocelot_spi_regmap_bus_read,
 };
 
+static int ocelot_spi_regmap_xfer_read(void *context, const void *reg,
+				       size_t reg_size, void *val,
+				       size_t val_size)
+{
+	struct ocelot_spi_regmap_ctx *ctx = context;
+	struct spi_transfer xfer = {};
+	struct ocelot_ddata *ddata;
+	const u8 *regu8 = reg;
+	u8 *buf = ctx->buf;
+	u8 *valu8 = val;
+	size_t off;
+	int err;
+
+	ddata = dev_get_drvdata(ctx->dev);
+
+	if (reg_size != OCELOT_SPI_ADDR_SIZE || val_size != OCELOT_SPI_VAL_SIZE ||
+	    ddata->spi_padding_bytes > OCELOT_SPI_MAX_PADDING_BYTES)
+		return -EINVAL;
+
+	off = OCELOT_SPI_ADDR_SIZE + ddata->spi_padding_bytes;
+
+	buf[0] = regu8[0];
+	buf[1] = regu8[1];
+	buf[2] = regu8[2];
+	memset(&buf[OCELOT_SPI_ADDR_SIZE], 0,
+	       ddata->spi_padding_bytes + OCELOT_SPI_VAL_SIZE);
+
+	xfer.tx_buf = buf;
+	xfer.rx_buf = buf;
+	xfer.len = off + OCELOT_SPI_VAL_SIZE;
+
+	err = spi_sync_transfer(to_spi_device(ctx->dev), &xfer, 1);
+	if (err)
+		return err;
+
+	valu8[0] = buf[off + 0];
+	valu8[1] = buf[off + 1];
+	valu8[2] = buf[off + 2];
+	valu8[3] = buf[off + 3];
+
+	return 0;
+}
+
+static int ocelot_spi_regmap_xfer_write(void *context, const void *data,
+					size_t count)
+{
+	struct ocelot_spi_regmap_ctx *ctx = context;
+
+	return spi_write(to_spi_device(ctx->dev), data, count);
+}
+
+static const struct regmap_bus ocelot_spi_regmap_xfer_bus = {
+	.write = ocelot_spi_regmap_xfer_write,
+	.read = ocelot_spi_regmap_xfer_read,
+};
+
+static bool ocelot_spi_single_xfer_read(struct spi_device *spi,
+					const struct ocelot_spi_data *data)
+{
+	return data->single_xfer_read &&
+	       !(spi->controller->flags & SPI_CONTROLLER_HALF_DUPLEX) &&
+	       !(spi->mode & SPI_3WIRE);
+}
+
 struct regmap *ocelot_spi_init_regmap(struct device *dev,
 				      const struct resource *res,
 				      const struct regmap_access_table *rd_table,
 				      const struct regmap_access_table *wr_table)
 {
+	struct spi_device *spi = to_spi_device(dev);
 	struct regmap_config regmap_config;
+	struct ocelot_spi_regmap_ctx *ctx;
 
 	memcpy(&regmap_config, &ocelot_spi_regmap_config, sizeof(regmap_config));
 
@@ -264,7 +343,16 @@ struct regmap *ocelot_spi_init_regmap(struct device *dev,
 	regmap_config.rd_table = rd_table;
 	regmap_config.wr_table = wr_table;
 
-	return devm_regmap_init(dev, &ocelot_spi_regmap_bus, dev, &regmap_config);
+	if (!ocelot_spi_single_xfer_read(spi, spi_get_device_match_data(spi)))
+		return devm_regmap_init(dev, &ocelot_spi_regmap_bus, dev, &regmap_config);
+
+	ctx = devm_kzalloc_obj(dev, *ctx);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->dev = dev;
+
+	return devm_regmap_init(dev, &ocelot_spi_regmap_xfer_bus, ctx, &regmap_config);
 }
 EXPORT_SYMBOL_NS(ocelot_spi_init_regmap, "MFD_OCELOT_SPI");
 
@@ -296,7 +384,7 @@ static int ocelot_spi_probe(struct spi_device *spi)
 				     spi->max_speed_hz, OCELOT_SPI_MAX_PADDING_BYTES);
 
 	dummy_len = max(padding, data->reset_padding_bytes);
-	if (dummy_len) {
+	if (!ocelot_spi_single_xfer_read(spi, data) && dummy_len) {
 		ddata->dummy_buf = devm_kzalloc(dev, dummy_len, GFP_KERNEL);
 		if (!ddata->dummy_buf)
 			return -ENOMEM;
diff --git a/drivers/mfd/ocelot.h b/drivers/mfd/ocelot.h
index fa02590a5026..5d0301f0b194 100644
--- a/drivers/mfd/ocelot.h
+++ b/drivers/mfd/ocelot.h
@@ -32,7 +32,8 @@ enum ocelot_chip {
  *			reset default of the chip around a chip reset.
  * @dummy_buf:		Zero-filled buffer of at least spi_padding_bytes size.
  *			The dummy bytes that will be sent out between the
- *			address and data of a SPI read operation.
+ *			address and data of a SPI read operation. Not
+ *			allocated when reads are done in a single transfer.
  */
 struct ocelot_ddata {
 	enum ocelot_chip chip;

-- 
2.52.0

