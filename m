Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989820;
	b=xGayZGIXSKG5teBiFGQGSGKumnpFtYCT5MBhcoELX4+695bpJufw9By58TdA4zNGReYE
	 BnTyO0c5DkmE3x2I4Fe0dFK2BFE6xres5+x/L69pgh3KUfPmOk2o96uAiOIZEqglj/u8O
	 Ya1laBa5C8GLeYhtmJndwV0bJplr1A3nDXm2QPqFyqIYGMDrYkJfRgRMvyln9Tq+Ez06a
	 V/7stwCvY5cbGvIAMPV65J9cgAbWSTD06SfiIy9rKEUvv80MIFNF2GEDY6wqRdvhNsm+b
	 iR/kUkrL4ZLtbYG9thFuSJhUgVs95n0aAeoMcIltBlATAuPu2sp/ZKxmg3HsDborA6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8UkdvQ/elutxVmTWxE/PrRsX/cImSZ9Y8LDw/ueXcgs=;
	b=B+JwW5t5HYuQ36s8NwW6V5J7f7s3O1Qwzn87z4ChHv5swlB2CvZM9+TzerRdFFqGd+EJ
	 CLuGS8E6vokOkYb0QBvmYRlAdvlkOQi+fbTYFD7wWrtdZ+TX/FuxT2ltdetn1R8xL9Mj6
	 EWRXdTfIzJkzLEc74lMyI5VOqnvjcJO/j/CHCivLHjy2by9QJleYYCgAF9cfIE9sbj1/y
	 roZMbSc1rG4tGiGk7ejj7Sfyn4cPVS96s/AJY09sQMIVc5ycfg50LKPfcS5H3QZAsVHrs
	 b5sEF3b0vfsUTty/vahGJprUH3akK0pg/aodwZeuyKd4vt85IbhtRNXyt0EalcICB2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tz9VBi5o;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E85606A897
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E85606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tz9VBi5o
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so391265b3a.1
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989819; x=1795594619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UkdvQ/elutxVmTWxE/PrRsX/cImSZ9Y8LDw/ueXcgs=;
        b=tz9VBi5oS8OL7yn9J5KNe7V91SXeZyPp+3Chiv0Et9nNbi0+pepF06lztV7WRb6ZI+
         pRr6zduoWqn1F99Kk/UaefIsImF3EdLnq/BPut4cDyqrmlSAH0m4yUWtwfcRXb22/hxA
         x/o+E25Hoj9K1wEhXnAJnFHC16JLh/NPtEawj8wPkoH0ULRapKBZABvSSFt4Gk5P6KYw
         7iJ+GgnSDm39sXzzHFVTyQdXhHj9EoqQL6NCRnr/Z7wn4Y6F2xTND2uHnV8Uvhl/ACBK
         WiDX/L1LFqoSudGShoyObTODPpPQSVG+GzDquCiCp2CgW+XbKDWbOe09w6kfWX49yYxa
         K6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989819; x=1795594619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8UkdvQ/elutxVmTWxE/PrRsX/cImSZ9Y8LDw/ueXcgs=;
        b=f4+V3uLj4NOELHp4SBvDl7PpBf5WVxNEqsZcWRjgBB3cMJxVhtMN+xq/Bs5+IqxUQn
         7R+EZfjRdnA0qGpa2oxEtrcvc+4ilCf5ZXMvIdSQe6EvXqT7dkRGCicVa8sGfwbFojZr
         YkniGrnVVq4LD3Bh/HfGUfd2NQ81kCoYvGUT/VfIRBL2NGH7rYhJbgA2phRPPwSRN8ZI
         o/iflDS3WgDacc953n+DBpeUt6oMUnZ5UIA1XXGY13nvDFqLZU6vnrRz/BXS78uo/G9Y
         9WrOqEHDRCPMruJ1PyygZSOmRHWk0Wq5Bid7xCcATxPi90azFUqrLQiY8IbzAip/jijv
         SqYQ==
X-Forwarded-Encrypted: i=1; AL+hErE290dhIBTMbFbCUT2uc0XVvEhBLY/7IJCB5ZnZXi7IUVLzjpgJXuI0PVNjN3BoZKBaAqs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+zxAgPCQwkM+4fgvvY7KdXfbggM0AGaQuZt5CQVc2k6cn5+/kx
	Q5gLve+WciepoEAO+VVq+M6UgyiCie/kW9V1XyfjNMPsaMKcMB86VevMpJp+hQ==
X-Gm-Gg: AYBFou0WXteYbNBkpXKeBz4pys5rasPshhFknY/pO5OkVsnfXEbSyb0qDnTCTJd6N1z
	ARgI8WREJVDNiZ7q+7cAHuCc02zAs0q+36IYu415zIaV/hi1DSFVZiToD8b/M9N4O8Z/ixCMEwU
	IyRWnj06DlPTAC9moSFXjzBaDOnG2R16YVW5aYkPMaEtbI6wNpm1iX7AMf280UgTMoFTDEQ4xY+
	DOw+YGJZlFVRcv4SjImVTIJeAD4OCv7t6ypo0bPfE4cxvGMzpojnImJM0iXIwQwbDEfAg/AMOJ3
	E9HQRjdPjF2agCJNWsaHQlYkCseDGjFTSJppvBd1l4coRs7nPIYAH5bw0cld3l5SO/kzD3eSoZI
	Vb5R1hl/VlsSj2Az8zspL0PkHjJKakoPnNbhF2gVdL4AoaQG9NiKtCas1kFn9JviJS4l9GKjn53
	YRCxgCQecSDAUNZGi4QircCzi+g5/tM96/GJ4ncHFHQkT2n/truO/aClrXSHfQMbeJ4HlglKrKt
	HAfdx3DYYUIa4gn3gPCjQvLCdxpt+PrMHfxr3EA2R87n09fJQuhbFmdjy+ZxfBKOUOEWt7ikR49
	tn+rVPzh2+fcQEMHNsr3OpaLoyCzLcbWzTOMF/uWnePmlzERh64vnY47JvwzNh0s8YDR9tfNyQp
	wOOjYzShxMziuYVq2
X-Received: by 2002:a05:6a00:2e9f:b0:89e:db6c:f199 with SMTP id d2e1a72fcca58-8c5d305331fmr1252703b3a.14.1794989818963;
        Wed, 18 Nov 2026 00:16:58 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:58 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 08/13] mfd: nct6694: Rename USB transport functions with _usb_ prefix
Date: Wed, 18 Nov 2026 16:16:19 +0800
Message-Id: <20261118081625.2399247-9-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
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
Changes in v10:
- None.

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
index e2109deb001d..10d08ab50e16 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -49,7 +49,7 @@ static struct nct6694_usb_data *to_nct6694_usb_data(struct nct6694 *ddata)
 	return container_of(ddata, struct nct6694_usb_data, core);
 }
 
-static const struct mfd_cell nct6694_devs[] = {
+static const struct mfd_cell nct6694_usb_devs[] = {
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
@@ -85,7 +85,7 @@ static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-rtc"),
 };
 
-static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char err_status)
+static int nct6694_usb_err_handling(struct nct6694 *ddata, unsigned char err_status)
 {
 	switch (err_status) {
 	case NCT6694_NO_ERROR:
@@ -110,7 +110,7 @@ static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char er
 }
 
 /**
- * nct6694_read_msg() - Read message from NCT6694 device
+ * nct6694_usb_read_msg() - Read message from NCT6694 device
  * @ddata: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer to store the response data
@@ -121,7 +121,9 @@ static int nct6694_response_err_handling(struct nct6694 *ddata, unsigned char er
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
@@ -169,12 +171,12 @@ int nct6694_read_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cmd
 
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
@@ -184,7 +186,9 @@ EXPORT_SYMBOL_GPL(nct6694_read_msg);
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
@@ -239,11 +243,11 @@ int nct6694_write_msg(struct nct6694 *ddata, const struct nct6694_cmd_header *cm
 
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
@@ -373,7 +377,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
 	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
 			 usb_data->int_buf, sizeof(*usb_data->int_buf),
-			 usb_int_callback, ddata,
+			 nct6694_usb_int_callback, ddata,
 			 usb_pipe_endpoint(usb_dev, int_pipe)->desc.bInterval);
 
 	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
@@ -382,7 +386,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 	usb_set_intfdata(iface, ddata);
 
-	ret = mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
+	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
 		goto err_mfd;
 
@@ -416,20 +420,20 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
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
index b0c42341185a..24cfe6a03ef0 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -89,7 +89,25 @@ struct nct6694 {
 	struct irq_domain *domain;
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

