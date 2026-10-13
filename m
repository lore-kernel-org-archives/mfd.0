Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9CC4BD785
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873243; cv=none; b=mtFpg5ck/CrM2OJveFdtfJOb9kIY5gIXMgVjCdXQKzvvsjkpu32g1OQ2mNo5RJOrWAKfR99dXK/ncNAmuCNMCuOIkeXrPNGhe+Pr+/uA+ykfZ9T9qZJA7+ZXnZZV0ZHGS9BWzA88o0Lj0isp4oQnWnB4BcyeiyDpz6A+cQNSeH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873243; c=relaxed/simple;
	bh=EbkNIH7dnT8zMMC7iQePal0trI09YciTZD7CbD0b+X4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q1BCVYTZnVAZXNLeZTpOFGkk22VY76UCDsEPTKwIjkqLW1L6tktQmcsnuI6D9hmExfQUPGGbMHwQixKrbsURlaxW+77Plua5rLkYpGia0NzrLef/eAtQnPe3MowNscdT+HW09o3wl2fQP1qZOXM9fjCwYaujVZxr6uT3/UgXWb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNyvoEWO; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNyvoEWO"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab33730821so1424266a91.3
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873239; x=1792478039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYKKpt0tc4Cu0252xNjxETgSKgylAncBihmzE916KW4=;
        b=pNyvoEWOjXoZAxb2/YobpWjUujRVdhRsGQLjYeQPc22No+eyUZi39Rp1jX0Vvcv8i3
         Nk2BolaSHvfxSEgcTpqqgEpaAZcHg2P1wTNeL8lYT/z1GGaQaHF6QsiQMbUEiD/Dt5FZ
         +s7Akq+epMVFceiN2t0l39RWwvE3GD7ymt3ILqqwhwABaaly0hUIPEkPo0+lECT6R3OW
         nLeD3Ar/MXu/e3+5pNtt8i4pw9mWlxPqJAU9YWbXIwTEXU9IK/FvkKUwIr7g667Is8Jm
         AZbJXJ+7EsKcQeKLeCTpaJUGJhLmyqjzzGrE0SVu26D6EYXmtVQ4wEPRKBeA1e7ME/Uz
         ihcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873239; x=1792478039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYKKpt0tc4Cu0252xNjxETgSKgylAncBihmzE916KW4=;
        b=k7lPZZtC6zTdI0JFx/bSv1mtemhLgH8K4wZSUqP+Kqfmr+Q/eTzRqUm69RhXec6wdE
         ozkeNcJlJ/xUEY5ujKQkXq2jAU5xCf2+mHgVaR45/oF3bD1BDFWz1F9U+Cvnl8Xef+Or
         0O/o06honVk6w9PB9GJQqFjPzQLsiBkas+soYoRVh6Dy0/kbkykEuIMoi8bta5CkOq4W
         J1mIUEmX7ONjnGsIq0V7F7mmTuKHPDghBRozkcv05TefN+KKGUhlssB9/qc7CH36/xCr
         eE9Tec/2pWesojzztbvOYL35zKc//bMzzyCOQNTo6Y6Ic9KMVlb2hpVS63BEal4iMgpE
         LRgA==
X-Forwarded-Encrypted: i=1; AKwUvBxh8GTpzPhiGjv/UiNzW+HLAzn2EgXgz1hHR+KunOwz4S4+BzmAC6XkbXNc3k3aC9jjx4Y=@lists.linux.dev
X-Gm-Message-State: AFq9FYLqFAcGveGMh6p2m0Uuwtyr8PXnakvppPJr+HxA2tL1/hXoLoUR
	1uWIcTDe2PycT0zMcpvNKRfoTdp3qm6RCNhyrXRIUzLtAB7+1hPpJb0J
X-Gm-Gg: AYBFou2OF7iW2AVIPEmVRVIedQ2q6yIV7ylesYbH8O3e3GxBX1QzmngKxnnGR0Ol4cj
	UymGa7h3eqUpsGhg91J4UKYc+d3aE7Lwo244FGbXxjjkKvVYW983yIb8bDWRDGztrM4o+whRjX6
	LpFYAcTxI5vLtkLiMzkqn48sKKKraoM1x8s6LP/O734VcybFW4QSSVe3UDi2VJePOl00U6PRTWb
	9muwBSOIZTmQhfB/h1C2/9SMsGegqspkk0ZSPm4bvhojvYe0MHMBEuFOKKcQ4J/ibm+HndxuXc1
	aasIvkIRgcV8e8ib/lwdo1i3EN3mffUXDk45O3B31Ea6hliQxx+gJTKqlfKMX5kPn/N5IuwI8nD
	dbRolwGgZgusNvMi4PBTXb7ZsOo2JHxrOwnifj037rFzGPRV7NXwVEhUezhhtlWpeB+Wg9DsLwb
	DBR4dzmhFQSgX0UVliNuHsunn8fOS4or45ryDSs6IPvfiQtRIx50Aps7ygt5ajdkCjg4mG4eodp
	tRT0RI9VytMfYBC961Fs3j6fECg5OBWN8SSVd5wNA==
X-Received: by 2002:a17:90a:c10e:b0:3a4:d476:e0e6 with SMTP id 98e67ed59e1d1-3ab3a8d4c68mr9872253a91.52.1791873238830;
        Mon, 12 Oct 2026 23:33:58 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:58 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 07/12] mfd: nct6694: Rename USB transport functions with _usb_ prefix
Date: Tue, 13 Oct 2026 14:32:53 +0800
Message-Id: <20261013063259.2734757-8-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
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
header so that the sub-device drivers remain untouched; they are
reimplemented on top of regmap later in the series.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v9:
- Reworded the commit message: the wrappers are reimplemented on top of
  regmap rather than removed.

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

