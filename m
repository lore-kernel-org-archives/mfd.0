Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B95D213E89
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365064; cv=none; b=qZ0A5Lpv75I2UHvkE/zWgrTmvoVTMz8HSTrcQvbBfM9yvK0yjbCxy2a1kRzdqGEHEnEBsP1vlH4b8mGSlfQKRd40J2lfSYCWY4YdQCkLJa+iMTvL8lv2IY63UCiVuWeLey9eb3HZZJJIqryw5lKEFlh1xP0mlZhyDT2gsHWz4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365064; c=relaxed/simple;
	bh=DKZd5zj4U2TgetJHc/qNyMz8PvP5tloeU/TQpqZnxnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fgfM3yLL0oNUOjAY+qv0ER6VHI7WSfLnWNFtrrXhAntFr5XX0fkjG4hx/LcjEIu1RHp4t/+seLCxXSrzh1k8C9bM3Qqw/EVrcGiXupUUZZcLjqXqnXGCRSvDEO/ljawQiIPcv8Wb1JnK9suavGvwibh38uORFsWVyGr2AMeewhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4wWrQ0Y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4wWrQ0Y"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e2de97b4d2so13605515ad.2
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364903; x=1791969703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWEoBcTanLI/xOOEjBUzFe/ubT0LTWC3gtU2OGQUs4Q=;
        b=f4wWrQ0YEBW2475NjI+mz1TLUJzm23NpMiipoWJAdeyv/2RbCN/IdXxItdA6KnnvaS
         LefbxOH1Qn6Y78X/WDRZueNaHc7/2zR/A5npjoj0XW2hJxQdy0GFyopyZbJAj6KF+UDM
         gSq4C0ndelxSLbrEiLbEHI6bgDguWYTzUx7vjp7/+0osTHVUHofWNewsd0J6z5gHFuWG
         SR4dpppcbnXCK8dNbaxRAsg1fUI7vBaNHo1wv8whH2/GRF/v9UB4g0340M97oZhqtl22
         uxpzDNCc5z2/AhcFRQBLqceD9QICfjOG+EuwH4dRxdd1qBJY5sTgh4AQlWdgNBWqer2t
         0SzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364903; x=1791969703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JWEoBcTanLI/xOOEjBUzFe/ubT0LTWC3gtU2OGQUs4Q=;
        b=lGBltE9GMgPR7EVC92NCHmXsC0+8lXAmeh1jDMvn9/F3+10caA1OrW8JYKZ6ZEumh4
         btRNptPh81Ftz9xaYstO3TPGKy2GiJz59WJjBl/RPBeE9CSrb/+TzRe0vV4DdQAx1pQq
         YgMuhLUZC+xfSUEDnPeL0nn6H0w6e8PbIDmTe5fzyEx4yxkx0BvUMa9oskAFNzwyt/78
         YVanic31GsPUckEOQt0QY/VxFqroP4Esxmer4iWPc670YoMN86KqkNEciEoRnlB5cKwy
         IvnId8jTrb5cV3ZXCQG5hlSgVeCxkpPZwBANfIQtBVLT9X/X4P3hNY5/2vVNeJi+Hqj8
         Dmjw==
X-Forwarded-Encrypted: i=1; AKwUvBz54D5qF0YTgUCLPw8V43r6CRH4ddGgLzkzybsIAV27010c5XdJkGsqKSo5j5zg+aU4y3g=@lists.linux.dev
X-Gm-Message-State: AFq9FYJNMRmDmAIzL7BsEnOTMkR+xZcDhLW1wpdJWH2zNuvuF6uCqY5h
	8vsbi+cOkjaoheOcIglpGWfyj+XSbmcwEAaHOQE8VTmSS5xymY6si1sS
X-Gm-Gg: AYBFou0YD8ebsQLXmH/iUepgJIwyiooXjHKpfOzOizHRWfJy2RWewbedghV2TJpfMwe
	8Io/CQ50PMVESkKsT5dRZNxKbSFhQAoB/cI8F4GTH0LRqT+q+a1ui3N+S/pF6yH9b1HBWWzG/xh
	oFHxIeWwBfx3tD/D8tI4sv/oDkVAJEpLJcQJJ5a/4Sp8pcH99ncJ1x1+rC2dJMQRf8/ueDg0ezg
	Z6vXi420yImcGXGx12LDxaz47SkrFEam45ioF5uiXhoY5BKWqbIOS+m0j77HzHTWnNb8r27HG7A
	oiGZORRH4ES5dHuBG3sDHFIo/PiRquTKz1QTL/H8KvlgqnIaxnaQoYLXtnUjO0ldY6Iaui+v8cZ
	L4voJQxRLiEBDrZnPcQSsVAA6r4eesYCQydjYXoBWzt896T9fr1NteU2IwctuTkrge5Xg/kV24f
	aa2wuoxGHiRh7ctQ7K894GfL+QNjQ+HKNjCzg4b9e2gRdFXSvh8+KP2m98nUhpZA7MqSwLZ6VDp
	dC7YsZiEobqhpBySyfuLVwJfCsHkH/0dpoBWPIN
X-Received: by 2002:a17:902:e885:b0:2dd:7646:35cd with SMTP id d9443c01a7336-2e5ff85264dmr16965995ad.0.1791364903452;
        Wed, 07 Oct 2026 02:21:43 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:43 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 08/13] mfd: nct6694: Rename USB transport functions with _usb_ prefix
Date: Wed,  7 Oct 2026 17:20:57 +0800
Message-Id: <20261007092102.3768818-9-a0282524688@gmail.com>
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

Add a _usb_ prefix to the USB transport functions, tables and driver
name to mark them as USB specific, in preparation for the core and HIF
transport added in later patches.

Keep nct6694_{read,write}_msg() as static inline wrappers in the shared
header so that the sub-device drivers remain untouched; they are removed
once the regmap-based transport abstraction is in place.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- None.

Changes in v7:
- None.

Changes in v6:
- New patch replacing the v5 function-pointer transport abstraction:
  rename the exported I/O functions with an _usb_ prefix and add
  transitional inline nct6694_{read,write}_msg() wrappers in the shared
  header so sub-device drivers stay untouched in this commit.

 drivers/mfd/nct6694.c       | 40 ++++++++++++++++++++-----------------
 include/linux/mfd/nct6694.h | 22 ++++++++++++++++++--
 2 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 6d75b1485350..83e9c7ac9bee 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -50,7 +50,7 @@ static struct nct6694_usb_data *to_nct6694_usb_data(struct nct6694 *ddata)
 	return container_of(ddata, struct nct6694_usb_data, core);
 }
 
-static const struct mfd_cell nct6694_devs[] = {
+static const struct mfd_cell nct6694_usb_devs[] = {
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
@@ -86,7 +86,7 @@ static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-rtc"),
 };
 
-static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char err_status)
+static int nct6694_usb_err_handling(struct nct6694 *ddata, unsigned char err_status)
 {
 	switch (err_status) {
 	case NCT6694_NO_ERROR:
@@ -111,7 +111,7 @@ static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char er
 }
 
 /**
- * nct6694_read_msg() - Read message from NCT6694 device
+ * nct6694_usb_read_msg() - Read message from NCT6694 device
  * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer to store the response data
@@ -122,7 +122,9 @@ static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char er
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_usb_read_msg(struct nct6694 *ddata,
+			 const struct nct6694_cmd_header *cmd_hd,
+			 void *buf)
 {
 	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
 	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
@@ -170,12 +172,12 @@ int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd
 
 	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
+	return nct6694_usb_err_handling(ddata, hdr->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_read_msg);
+EXPORT_SYMBOL_GPL(nct6694_usb_read_msg);
 
 /**
- * nct6694_write_msg() - Write message to NCT6694 device
+ * nct6694_usb_write_msg() - Write message to NCT6694 device
  * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer containing the data to be sent
@@ -185,7 +187,9 @@ EXPORT_SYMBOL_GPL(nct6694_read_msg);
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_usb_write_msg(struct nct6694 *ddata,
+			  const struct nct6694_cmd_header *cmd_hd,
+			  void *buf)
 {
 	struct nct6694_usb_data *usb_data = to_nct6694_usb_data(ddata);
 	union nct6694_usb_hdr *hdr = usb_data->hdr_buf;
@@ -240,11 +244,11 @@ int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cm
 
 	memcpy(buf, usb_data->data_buf, data_len);
 
-	return nct6694_response_err_handling(ddata, hdr->response_header.sts);
+	return nct6694_usb_err_handling(ddata, hdr->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_write_msg);
+EXPORT_SYMBOL_GPL(nct6694_usb_write_msg);
 
-static void usb_int_callback(struct urb *urb)
+static void nct6694_usb_int_callback(struct urb *urb)
 {
 	struct nct6694 *ddata = urb->context;
 	__le32 *status_le = urb->transfer_buffer;
@@ -398,7 +402,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
 	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
 			 usb_data->int_buf, sizeof(*usb_data->int_buf),
-			 usb_int_callback, ddata,
+			 nct6694_usb_int_callback, ddata,
 			 usb_pipe_endpoint(usb_dev, int_pipe)->desc.bInterval);
 
 	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
@@ -407,7 +411,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 	usb_set_intfdata(iface, ddata);
 
-	ret = mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
+	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
 		goto err_mfd;
 
@@ -441,20 +445,20 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 	usb_free_urb(usb_data->int_urb);
 }
 
-static const struct usb_device_id nct6694_ids[] = {
+static const struct usb_device_id nct6694_usb_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID, NCT6694_PRODUCT_ID, 0xFF, 0x00, 0x00) },
 	{ }
 };
-MODULE_DEVICE_TABLE(usb, nct6694_ids);
+MODULE_DEVICE_TABLE(usb, nct6694_usb_ids);
 
 static struct usb_driver nct6694_usb_driver = {
-	.name		= "nct6694",
-	.id_table	= nct6694_ids,
+	.name		= "nct6694-usb",
+	.id_table	= nct6694_usb_ids,
 	.probe		= nct6694_usb_probe,
 	.disconnect	= nct6694_usb_disconnect,
 };
 module_usb_driver(nct6694_usb_driver);
 
-MODULE_DESCRIPTION("Nuvoton NCT6694 core driver");
+MODULE_DESCRIPTION("Nuvoton NCT6694 USB transport driver");
 MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 0ab2bd3bfdc1..61155f9832b0 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -91,7 +91,25 @@ struct nct6694 {
 	unsigned int irq_enable;
 };
 
-int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
-int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_usb_read_msg(struct nct6694 *ddata,
+			 const struct nct6694_cmd_header *cmd_hd,
+			 void *buf);
+int nct6694_usb_write_msg(struct nct6694 *ddata,
+			  const struct nct6694_cmd_header *cmd_hd,
+			  void *buf);
+
+static inline int nct6694_read_msg(struct nct6694 *ddata,
+				   const struct nct6694_cmd_header *cmd_hd,
+				   void *buf)
+{
+	return nct6694_usb_read_msg(ddata, cmd_hd, buf);
+}
+
+static inline int nct6694_write_msg(struct nct6694 *ddata,
+				    const struct nct6694_cmd_header *cmd_hd,
+				    void *buf)
+{
+	return nct6694_usb_write_msg(ddata, cmd_hd, buf);
+}
 
 #endif
-- 
2.34.1

