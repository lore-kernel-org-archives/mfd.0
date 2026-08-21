Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15B2377A87
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283335; cv=none; b=PsKJX/d5VfDzoYjaMV6MEKJcIBiE9uTuHoV70uyCeCOdOgJS+w9vuUKm8rUGzDmFPDBcXzFguhtkm+orR/dskaS1oNlL4/6KzAJ1k5AzdFXN8288C139Cxedisvj0Wra8ackxqqQtEJ708rL9HzAhoONcREkDlSyWTUsNv8FZv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283335; c=relaxed/simple;
	bh=1qfPCAkHK6+3oGtSjpJ1THEbi1nrjMBdzidqeLK4VPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P5Lco+QOv+5Y953REUbqrIxkNgVDTbWxZeuAmFjyVSO2mc+K/N4C4S69ZsxoJVTrwWwbSt1Fm73VfUWJ/0xUaOTXxyBW4INnzFbBb/8YVxw0FITcwptFZHNA8ls+QsZzjPZJy6VO8zNC0Kgk0CC1ZbPZk2/CnrFvZrptVDqQD6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+6i2ya/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+6i2ya/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso347246b3a.1
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 20:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283331; x=1787888131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq2eh2UzCGmILxON+JYPWrNPEZ+By7fX4zFgbdbH1rY=;
        b=M+6i2ya/nRlGNUMTGVUwBXE0uo9/HA8nuVyZzKjPqCS2qAhu7vxJsis/LgEHH8pP8d
         M/nt6tNmvhQn2J9lh9fA06q+6e+oByzu2RrYBLBx0TPxcsXfQ5WTPv0efzBLN+xb9PTF
         JWPAZ909z8ApCD063/cdkuquPlCmOH3pUArSFBWExSzhU79pcBACuUA4nw42z/aILENW
         rGGTgFGvQC4OhWr/v2t6UhabCpKkGc5gICVNyCk7o4WHvxpbihmI4fjX1TWXfvXckMlI
         FLNcyAOXGi6K2DyT9LHTKCZMvrAWi0dQ+QlhJQS5mGUBzJg07lQhYhH1OmBXO0bOpIae
         wNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283331; x=1787888131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wq2eh2UzCGmILxON+JYPWrNPEZ+By7fX4zFgbdbH1rY=;
        b=FkbH13A2fwqbWjyy6YYDqjxrotbQiuPRMFFwvZ1LRRNZG4H+A8O6xhusfB5M/RAbgL
         pOXtEzuCzyc/0u1TjhXwaYZy8boj51gyxVlnZIbcciGDj3C0yYmdF0tlUh4ydT5AcI5Z
         I8zSJW+a79i2rZJrcKDvGHsnwdp7k7qfDzC9FevurD02202QQkrUW+8A18BnP7Tk5Byr
         Re15k938ryXUYVLLoWO+lldI2gekMSEu3omM9Inv+8ckw3PVbe5nFpRhPRUzXsbkZ3RD
         Uox3GHLlLjTQjexBxEqtcoisE5afGApQOP2KE8eZVv6+53teCom4lycPyYjr98cAnhme
         Tt4w==
X-Forwarded-Encrypted: i=1; AHgh+Rqch0uBT2rKOcYAVpVQidiOPqoyyqzPiN/DP8Qc4XmzinPR216EXCqklAjFiHR336kdx44=@lists.linux.dev
X-Gm-Message-State: AFuF++lWGESICA9jp6j23rINKORdtF8Agwdx2N82hYzzl6kLnGCSjG8Y
	QBZiAokIGQEASWGt6kKxBP9BDbjM3n2C5kEi0Rd2RSWKmvY3+NSk9ljd/Nf4RQ==
X-Gm-Gg: AR+sD12zxBBl3/jHvWK2MbElsD+uNPZZlvhAVi/CNcmE5xfVSGtX9NpbXdQ98fTPHAz
	9gr7VkruOuZsFQq71sxCW6rcbCUf3VXzepYFVgIHGCQsOcvK2mwtVMGpWwhYMhritCjs3hjCUp/
	vtxvPgy6B8Ojxe59sRfU6MxZOuko8orsUOs/9te+kexw2dR4YvrYT3WUzQsVEhILOHTnt1KCl92
	FYRprY6F1LVoyiKLgJ75WT8kZJd96dtR/y1uK1fESe4ZHhMh5UoyM58fOVuW/1ntFYHYJTSGxZY
	u+NkwRWmDMnwaw0njlj3rSzEe6P8OzM4y/lhWz5vUshepKX9c5iLHQHG8giU89+cTf6/C21viEO
	DAv4CID9G64VKEAPOGxQ+zTHIf6uhdYllv9x9dcXgZQwSE8wLtZExZ5/NubPCuotVToR463LKqh
	u2OYP8YtOiTrz0bQsjpWxfMETETeDTAH446ajC2mxXZFIPr62REghmuCLzOaqKKX113PNCBN72H
	daFN4YtPVg0JCAtJAa8GYqcEFW9ECXxoFc0y+XGmA==
X-Received: by 2002:a05:6a00:448e:b0:84d:ff47:fa53 with SMTP id d2e1a72fcca58-851f972a7ebmr5130503b3a.2.1787283331556;
        Thu, 20 Aug 2026 20:35:31 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15891a04csm2204271a12.15.2026.08.20.20.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:35:31 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v7 03/10] mfd: nct6694: Rename USB transport functions with _usb_ prefix
Date: Fri, 21 Aug 2026 11:34:58 +0800
Message-Id: <20260821033505.4017901-4-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821033505.4017901-1-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Rename nct6694_{read,write,err_handling}_msg() to carry an `_usb_`
prefix, marking them as USB transport-specific. This prepares for
the core layer and HIF (eSPI) transport added in later patches.

Add transitional static inline wrappers nct6694_{read,write}_msg()
in the shared header so sub-device drivers remain untouched in
this commit; they will be replaced by the transport dispatch layer
in a subsequent patch.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v7:

Changes in v6:
- New patch replacing the v5 function-pointer transport abstraction:
  rename the exported I/O functions with an _usb_ prefix and add
  transitional inline nct6694_{read,write}_msg() wrappers in the shared
  header so sub-device drivers stay untouched in this commit.

 drivers/mfd/nct6694.c       | 40 ++++++++++++++++++++-----------------
 include/linux/mfd/nct6694.h | 22 ++++++++++++++++++--
 2 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 58c1cbcbe3f2..7c6b986db7f7 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -43,7 +43,7 @@ struct nct6694_usb_data {
 	__le32 *int_buffer;
 };
 
-static const struct mfd_cell nct6694_devs[] = {
+static const struct mfd_cell nct6694_usb_devs[] = {
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
@@ -79,7 +79,7 @@ static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-rtc"),
 };
 
-static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char err_status)
+static int nct6694_usb_err_handling(struct nct6694 *nct6694, unsigned char err_status)
 {
 	switch (err_status) {
 	case NCT6694_NO_ERROR:
@@ -104,7 +104,7 @@ static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char
 }
 
 /**
- * nct6694_read_msg() - Read message from NCT6694 device
+ * nct6694_usb_read_msg() - Read message from NCT6694 device
  * @nct6694: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer to store the response data
@@ -115,7 +115,9 @@ static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_usb_read_msg(struct nct6694 *nct6694,
+			 const struct nct6694_cmd_header *cmd_hd,
+			 void *buf)
 {
 	struct nct6694_usb_data *udata = nct6694->priv;
 	union nct6694_usb_msg *msg = udata->usb_msg;
@@ -151,12 +153,12 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 		return -EIO;
 	}
 
-	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+	return nct6694_usb_err_handling(nct6694, msg->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_read_msg);
+EXPORT_SYMBOL_GPL(nct6694_usb_read_msg);
 
 /**
- * nct6694_write_msg() - Write message to NCT6694 device
+ * nct6694_usb_write_msg() - Write message to NCT6694 device
  * @nct6694: NCT6694 device pointer
  * @cmd_hd: command header structure
  * @buf: buffer containing the data to be sent
@@ -166,7 +168,9 @@ EXPORT_SYMBOL_GPL(nct6694_read_msg);
  *
  * Return: Negative value on error or 0 on success.
  */
-int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
+int nct6694_usb_write_msg(struct nct6694 *nct6694,
+			  const struct nct6694_cmd_header *cmd_hd,
+			  void *buf)
 {
 	struct nct6694_usb_data *udata = nct6694->priv;
 	union nct6694_usb_msg *msg = udata->usb_msg;
@@ -208,11 +212,11 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 		return -EIO;
 	}
 
-	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
+	return nct6694_usb_err_handling(nct6694, msg->response_header.sts);
 }
-EXPORT_SYMBOL_GPL(nct6694_write_msg);
+EXPORT_SYMBOL_GPL(nct6694_usb_write_msg);
 
-static void usb_int_callback(struct urb *urb)
+static void nct6694_usb_int_callback(struct urb *urb)
 {
 	struct nct6694 *nct6694 = urb->context;
 	__le32 *status_le = urb->transfer_buffer;
@@ -358,7 +362,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	}
 
 	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
-			 udata->int_buffer, sizeof(*udata->int_buffer), usb_int_callback,
+			 udata->int_buffer, sizeof(*udata->int_buffer), nct6694_usb_int_callback,
 			 nct6694, int_endpoint->bInterval);
 
 	ret = usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
@@ -367,7 +371,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 	usb_set_intfdata(iface, nct6694);
 
-	ret = mfd_add_hotplug_devices(dev, nct6694_devs, ARRAY_SIZE(nct6694_devs));
+	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
 		goto err_mfd;
 
@@ -401,20 +405,20 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 	usb_free_urb(udata->int_in_urb);
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
index 3f5dd53f38de..43b51f243e8e 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -94,7 +94,25 @@ struct nct6694 {
 	void *priv;
 };
 
-int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
-int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
+int nct6694_usb_read_msg(struct nct6694 *nct6694,
+			 const struct nct6694_cmd_header *cmd_hd,
+			 void *buf);
+int nct6694_usb_write_msg(struct nct6694 *nct6694,
+			  const struct nct6694_cmd_header *cmd_hd,
+			  void *buf);
+
+static inline int nct6694_read_msg(struct nct6694 *nct6694,
+				   const struct nct6694_cmd_header *cmd_hd,
+				   void *buf)
+{
+	return nct6694_usb_read_msg(nct6694, cmd_hd, buf);
+}
+
+static inline int nct6694_write_msg(struct nct6694 *nct6694,
+				    const struct nct6694_cmd_header *cmd_hd,
+				    void *buf)
+{
+	return nct6694_usb_write_msg(nct6694, cmd_hd, buf);
+}
 
 #endif
-- 
2.34.1

