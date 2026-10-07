Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9248094F
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364948; cv=none; b=t/1ETFS5/doUfF8iFZTpPQMZEY/4eRXjbzHFlbg+Bz3+B2poOYDaWjBoZcvBG7pKJLLY/Sqb1h2SgYZIdlcDI+aRf4/P/NF5EaYqYJRER1pGJGTf4fFUf8Qm/9194MUREgEmKTPGOz+aUjVDzfIh6KsX9TgSmvwSldXPz71yUHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364948; c=relaxed/simple;
	bh=MN/tosXe50qK6zGgu7QPwgEYVWhq4bEWWWzocRskHjo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pdv8N6Y2OTxyKgwbub31cmeP1XKL4rG2ZVl3Vv9mQSd5rKCJeWLEIhC9eBzBjVcaqD6IGm1fJV35fm3ijrYeZEkkpvxbz5h7JWS8SmI9UAZ/stsAeHulYS6zGNPgD1QDYY3i44ZHpKbOK0QRNahLwPwm5bqdCFEQPHj/4DIcAEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qm5dyAZK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qm5dyAZK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e60f9af6e6so2950405ad.3
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364912; x=1791969712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2iJyL0v0upUooQaIydRy/LssiS2GOYokP8Qha8qI0ps=;
        b=qm5dyAZKnm+g5776tbe3x828Uy3RATFM6Gm184GEKVpPD0PBNeJprJ4BjJ8ZEM2B7Z
         G1KRBQeMUUmQ6tpijlupiHXJhme/JFMfp+0Y71ZESYDxTsTXYsV3FvyeZLWPC11WgmMs
         eTgXIxayhnINorkXRXS98A4aQ45Sw0IwUR4K+LBDgK0Vf3w0pCPZ5Tdv98PlzPkY/6XZ
         IMFD4r7SIM8+yOrJMCSLjGkNAg7FOKd8TyUU8JFGEXcv1uJhJGcLZrN9jRyVbMo/t0M2
         +reS4G1HX4cdX09/CLAMtcCvLT9PPAyZ1dAAwfBWgKwNnyA3oLSOZcI+6ISjGd/Lh2gz
         2t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364912; x=1791969712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2iJyL0v0upUooQaIydRy/LssiS2GOYokP8Qha8qI0ps=;
        b=kWePxe9Tk1mJWc3G2tar4LLKU0BWrxUqCpI0O3Q8tmJmitWmR3uUQu3YgV2MgDaXuf
         lENuXxemoZ/SRHHgEjXLKkoiOaOI73W9mrL4k1cb/PRuOka1cFemgYUkwg0zAEN4Fkoy
         JlGfP4Swv/7NWeOgtGdyzHzRHUWfRGKLTcleB9UnhQSC912AMajDJZqRZEtnxVZtL/sS
         wJ77izxKipACRLiaQs7nJyR39wHalWPuyPh6Rk2S8NmMzUuOd6rThVUnOGpuH4wzzUO5
         SwYNLq0YfLxIQdO0LL6R+xKwWR8lR57zAoOPcjB/U3p9divEk/fxqSxujVRnnpGbkHoM
         dYLA==
X-Forwarded-Encrypted: i=1; AKwUvBzBB7xxcOuwnItXTGdvV04q/uMfjXoNerykfGvUUPasRxzRdbnzpn/IsMknij9v/UnPrPE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIM8wQ3iI964BHcK2SSNdumnidktKIkHK+xzptdfNutSni4ezVR
	78nnXIV6yi5bMpIdmkQgSZNrk1o/q72dxsRmOrlkLa6AsovELQiGK/4i
X-Gm-Gg: AYBFou3vfhbq87vVlmTfrEfgvFPEc/Y0tZiQOPt+woqnuYn1wKAq1804iNVxmXYWcJ+
	TpebVjGHO3B+1gcgnX2S+zjn4yMRr5SGdwK/QEa8NOk8g0zzUET3ZVSMstXRtg7eHtQztTdStkR
	AGViF+EwrIMC3hPHkY3W0l4fpb6yZliLQOxRmERbQOG0x6dNJ3ZQkFAqetqVx6u2wnIeDngjKvG
	YtQXKEwPtVAEY4bGgUjbVYXiRkdxOF8bPRal9bW5hJk7jl+KmhPjwTv/ngABnPfmOstvdwuwU3I
	I8wRU4ow0R2RA5WQtGLTH+qWWddB1mPx6vIXxMht09gNYMft1xSFrFfE1Di0ZQtsB/9na9tp3QS
	3wzf55VEKk6tPTniotdqPEQA5oZf6CZoNthLZEI9GjqkAAYVmVDbo8aSAz2GNb8SsDdbe5vIEix
	ulL4hso1Awg0IMLhYuEyvvI2+SVM6Mrpr7ScgdekkMsy0W25e7PK+xhO35nzvRpvr+gx7fT3aS5
	6LE2ujLFsbUYlTTzc0HMW3jwQuTPpyL6tHPXGZj
X-Received: by 2002:a17:903:2c8:b0:2e5:a355:56d8 with SMTP id d9443c01a7336-2e60039784amr15470645ad.42.1791364911602;
        Wed, 07 Oct 2026 02:21:51 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:51 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	linux-i2c@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v8 11/13] mfd: nct6694: Introduce regmap-based transport abstraction
Date: Wed,  7 Oct 2026 17:21:00 +0800
Message-Id: <20261007092102.3768818-12-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Sub-device drivers call into the USB transport directly, so a second
transport cannot be added without touching all of them.

Wrap the transport behind a regmap bus. The command header is mapped
onto a single 32-bit register by packing the host control byte, the
module id and the 16-bit offset, so that the sub-device drivers can use
the regmap bulk accessors. The access_lock is dropped as regmap already
serialises the bus accesses.

Add nct6694_write_read_msg() for the commands that send a request and
read the reply back in the same firmware message, and use it for the
I2C deliver command.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- Renamed the transport buffer arguments to tx_buf/rx_buf.
- Dropped max_raw_read/max_raw_write from the regmap_config, as they
  are ignored when a regmap_bus is provided.

Changes in v7:
- Made the USB transport helpers static and gave nct6694_usb_write_msg()
  separate @tx/@rx buffers, so a SET command only copies the firmware
  reply back when the caller asks for it.
- Documented in the shared header why nct6694_write_read_msg() is
  expressed as a read of a SET register.

Changes in v6:
- New patch. Replaces the v5 function-pointer abstraction with a
  regmap_bus based transport: the firmware command header is packed into
  a single 32-bit regmap register and sub-device drivers use the regmap
  bulk accessors. Adds nct6694_write_read_msg() for request/response
  commands and drops the per-transport access_lock (regmap already
  serialises bus accesses).

 drivers/i2c/busses/i2c-nct6694.c |   2 +-
 drivers/mfd/Kconfig              |   1 +
 drivers/mfd/nct6694-usb.c        | 102 ++++++++++++++++++-------------
 include/linux/mfd/nct6694.h      |  53 +++++++++++++---
 4 files changed, 108 insertions(+), 50 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nct6694.c b/drivers/i2c/busses/i2c-nct6694.c
index ef3329f34246..7e32dab6e759 100644
--- a/drivers/i2c/busses/i2c-nct6694.c
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -77,7 +77,7 @@ static int nct6694_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int
 		deliver->addr = i2c_8bit_addr_from_msg(msg_temp);
 		if (msg_temp->flags & I2C_M_RD) {
 			deliver->r_cnt = msg_temp->len;
-			ret = nct6694_write_msg(data->nct6694, &cmd_hd, deliver);
+			ret = nct6694_write_read_msg(data->nct6694, &cmd_hd, deliver);
 			if (ret < 0)
 				return ret;
 
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..a0d9d6ccfb0c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1166,6 +1166,7 @@ config MFD_MENF21BMC
 config MFD_NCT6694
 	tristate "Nuvoton NCT6694 support"
 	select MFD_CORE
+	select REGMAP
 	depends on USB
 	help
 	  This enables support for the Nuvoton USB device NCT6694, which shares
diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
index 455eeed62dce..636721f277a0 100644
--- a/drivers/mfd/nct6694-usb.c
+++ b/drivers/mfd/nct6694-usb.c
@@ -9,6 +9,7 @@
  * CAN, WDT, HWMON and RTC management.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -17,7 +18,9 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/nct6694.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/unaligned.h>
 #include <linux/usb.h>
 
 #define NCT6694_VENDOR_ID	0x0416
@@ -35,7 +38,6 @@ union __packed nct6694_usb_hdr {
 
 struct nct6694_usb_data {
 	struct nct6694 core;
-	struct mutex access_lock;
 	struct usb_device *usb_dev;
 	struct urb *int_urb;
 	union nct6694_usb_hdr *hdr_buf;
@@ -108,21 +110,9 @@ static int nct6694_usb_err_handling(struct nct6694 *ddata, unsigned char err_sta
 	return -EIO;
 }
 
-/**
- * nct6694_usb_read_msg() - Read message from NCT6694 device
- * @ddata: NCT6694 device pointer
- * @cmd_hd: command header structure
- * @buf: buffer to store the response data
- *
- * Sends a command to the NCT6694 device and reads the response.
- * The command header is specified in @cmd_hd, and the response
- * data is stored in @buf.
- *
- * Return: Negative value on error or 0 on success.
- */
-int nct6694_usb_read_msg(struct nct6694 *ddata,
-			 const struct nct6694_cmd_header *cmd_hd,
-			 void *buf)
+static int nct6694_usb_read_msg(struct nct6694 *ddata,
+				const struct nct6694_cmd_header *cmd_hd,
+				void *rx_buf)
 {
 	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
 	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
@@ -133,8 +123,6 @@ int nct6694_usb_read_msg(struct nct6694 *ddata,
 	if (data_len > NCT6694_MAX_DATA_LEN)
 		return -EINVAL;
 
-	guard(mutex)(&usb_data->access_lock);
-
 	memcpy(&hdr->cmd_header, cmd_hd, sizeof(*cmd_hd));
 	hdr->cmd_header.hctrl = NCT6694_HCTRL_GET;
 
@@ -168,26 +156,15 @@ int nct6694_usb_read_msg(struct nct6694 *ddata,
 		return -EIO;
 	}
 
-	memcpy(buf, usb_data->data_buf, data_len);
+	memcpy(rx_buf, usb_data->data_buf, data_len);
 
 	return nct6694_usb_err_handling(ddata, hdr->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_usb_read_msg);
 
-/**
- * nct6694_usb_write_msg() - Write message to NCT6694 device
- * @ddata: NCT6694 device pointer
- * @cmd_hd: command header structure
- * @buf: buffer containing the data to be sent
- *
- * Sends a command to the NCT6694 device and writes the data
- * from @buf. The command header is specified in @cmd_hd.
- *
- * Return: Negative value on error or 0 on success.
- */
-int nct6694_usb_write_msg(struct nct6694 *ddata,
-			  const struct nct6694_cmd_header *cmd_hd,
-			  void *buf)
+/* @rx_buf may be NULL when the reply to the SET command is not needed */
+static int nct6694_usb_write_msg(struct nct6694 *ddata,
+				 const struct nct6694_cmd_header *cmd_hd,
+				 const void *tx_buf, void *rx_buf)
 {
 	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
 	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
@@ -198,11 +175,9 @@ int nct6694_usb_write_msg(struct nct6694 *ddata,
 	if (data_len > NCT6694_MAX_DATA_LEN)
 		return -EINVAL;
 
-	guard(mutex)(&usb_data->access_lock);
-
 	memcpy(&hdr->cmd_header, cmd_hd, sizeof(*cmd_hd));
 	hdr->cmd_header.hctrl = NCT6694_HCTRL_SET;
-	memcpy(usb_data->data_buf, buf, data_len);
+	memcpy(usb_data->data_buf, tx_buf, data_len);
 
 	/* Send command packet to USB device */
 	ret = usb_bulk_msg(usb_dev, usb_sndbulkpipe(usb_dev, NCT6694_BULK_OUT_EP),
@@ -240,11 +215,53 @@ int nct6694_usb_write_msg(struct nct6694 *ddata,
 		return -EIO;
 	}
 
-	memcpy(buf, usb_data->data_buf, data_len);
+	if (rx_buf)
+		memcpy(rx_buf, usb_data->data_buf, data_len);
 
 	return nct6694_usb_err_handling(ddata, hdr->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_usb_write_msg);
+
+static int nct6694_usb_regmap_read(void *context, const void *reg_buf,
+				   size_t reg_size, void *val_buf,
+				   size_t val_size)
+{
+	struct nct6694 *ddata = context;
+	u32 reg = get_unaligned_be32(reg_buf);
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = FIELD_GET(NCT6694_REG_MOD, reg),
+		.offset = cpu_to_le16(FIELD_GET(NCT6694_REG_OFFSET, reg)),
+		.len = cpu_to_le16(val_size),
+	};
+
+	if (FIELD_GET(NCT6694_REG_HCTRL, reg) == NCT6694_HCTRL_SET)
+		return nct6694_usb_write_msg(ddata, &cmd_hd, val_buf, val_buf);
+
+	return nct6694_usb_read_msg(ddata, &cmd_hd, val_buf);
+}
+
+static int nct6694_usb_regmap_write(void *context, const void *data,
+				    size_t count)
+{
+	struct nct6694 *ddata = context;
+	u32 reg = get_unaligned_be32(data);
+	const struct nct6694_cmd_header cmd_hd = {
+		.mod = FIELD_GET(NCT6694_REG_MOD, reg),
+		.offset = cpu_to_le16(FIELD_GET(NCT6694_REG_OFFSET, reg)),
+		.len = cpu_to_le16(count - sizeof(reg)),
+	};
+
+	return nct6694_usb_write_msg(ddata, &cmd_hd, data + sizeof(reg), NULL);
+}
+
+static const struct regmap_bus nct6694_usb_regmap_bus = {
+	.read = nct6694_usb_regmap_read,
+	.write = nct6694_usb_regmap_write,
+};
+
+static const struct regmap_config nct6694_usb_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 8,
+};
 
 static void nct6694_usb_int_callback(struct urb *urb)
 {
@@ -329,9 +346,12 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	ddata->dev = dev;
 	usb_data->usb_dev = usb_dev;
 
-	ret = devm_mutex_init(dev, &usb_data->access_lock);
-	if (ret)
+	ddata->regmap = devm_regmap_init(dev, &nct6694_usb_regmap_bus, ddata,
+					 &nct6694_usb_regmap_config);
+	if (IS_ERR(ddata->regmap)) {
+		ret = PTR_ERR(ddata->regmap);
 		goto err_free_urb;
+	}
 
 	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
 	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 03296132ad34..1593806d34fd 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -9,6 +9,9 @@
 #ifndef __MFD_NCT6694_H
 #define __MFD_NCT6694_H
 
+#include <linux/bitfield.h>
+#include <linux/regmap.h>
+
 #define NCT6694_HWMON_MOD	0x00
 #define NCT6694_PWM_MOD		0x01
 #define NCT6694_I2C_MOD		0x03
@@ -82,6 +85,7 @@ struct __packed nct6694_response_header {
 
 struct nct6694 {
 	struct device *dev;
+	struct regmap *regmap;
 	struct ida gpio_ida;
 	struct ida i2c_ida;
 	struct ida canfd_ida;
@@ -94,25 +98,58 @@ struct nct6694 {
 int nct6694_device_init(struct device *dev);
 void nct6694_device_exit(struct device *dev);
 
-int nct6694_usb_read_msg(struct nct6694 *ddata,
-			 const struct nct6694_cmd_header *cmd_hd,
-			 void *buf);
-int nct6694_usb_write_msg(struct nct6694 *ddata,
-			  const struct nct6694_cmd_header *cmd_hd,
-			  void *buf);
+/*
+ * Each firmware command is mapped to a single 32-bit regmap register, so that
+ * the sub-device drivers use the regmap bulk accessors and each transport only
+ * implements a regmap bus:
+ *
+ *   bits [31:24]  host control (NCT6694_HCTRL_GET / NCT6694_HCTRL_SET)
+ *   bits [23:16]  module id
+ *   bits [15:0]   offset (low byte = command, high byte = selector)
+ */
+#define NCT6694_REG_HCTRL	GENMASK(31, 24)
+#define NCT6694_REG_MOD		GENMASK(23, 16)
+#define NCT6694_REG_OFFSET	GENMASK(15, 0)
+
+static inline u32 nct6694_cmd_to_reg(const struct nct6694_cmd_header *cmd_hd,
+				     u8 hctrl)
+{
+	return FIELD_PREP(NCT6694_REG_HCTRL, hctrl) |
+	       FIELD_PREP(NCT6694_REG_MOD, cmd_hd->mod) |
+	       FIELD_PREP(NCT6694_REG_OFFSET, le16_to_cpu(cmd_hd->offset));
+}
 
 static inline int nct6694_read_msg(struct nct6694 *ddata,
 				   const struct nct6694_cmd_header *cmd_hd,
 				   void *buf)
 {
-	return nct6694_usb_read_msg(ddata, cmd_hd, buf);
+	return regmap_bulk_read(ddata->regmap,
+				nct6694_cmd_to_reg(cmd_hd, NCT6694_HCTRL_GET),
+				buf, le16_to_cpu(cmd_hd->len));
 }
 
 static inline int nct6694_write_msg(struct nct6694 *ddata,
 				    const struct nct6694_cmd_header *cmd_hd,
 				    void *buf)
 {
-	return nct6694_usb_write_msg(ddata, cmd_hd, buf);
+	return regmap_bulk_write(ddata->regmap,
+				 nct6694_cmd_to_reg(cmd_hd, NCT6694_HCTRL_SET),
+				 buf, le16_to_cpu(cmd_hd->len));
+}
+
+/*
+ * Some commands, such as the I2C deliver, send a request and read the reply
+ * back in the same firmware message. Express this as a read of a SET register:
+ * @buf holds the request on entry and the reply on return. This relies on the
+ * regmap being uncached and byte sized, so that @buf reaches the bus as is.
+ */
+static inline int nct6694_write_read_msg(struct nct6694 *ddata,
+					 const struct nct6694_cmd_header *cmd_hd,
+					 void *buf)
+{
+	return regmap_bulk_read(ddata->regmap,
+				nct6694_cmd_to_reg(cmd_hd, NCT6694_HCTRL_SET),
+				buf, le16_to_cpu(cmd_hd->len));
 }
 
 #endif
-- 
2.34.1

