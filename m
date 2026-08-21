Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECAF377EC5
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283332; cv=none; b=HMhtyBRKZCD6a5uAsxClxuIMYCUht1Cj0LJHCYe1KfT08VjJMrj+Iwb8l+jLW93IIFdSkIo7OHakaxnTFWZEwJ5v2xVKbJhsiG5xB+AjBpUjISt4VbvKd2Gh2ytaM7Xi2OPuv27NUPsQEg77G1/8oSIb26pbuki+39qeysa+VZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283332; c=relaxed/simple;
	bh=lxk/Nd15jNSj9ZzA0NEja15PMDVQF4j1a7JrrOl/ifk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WiQ3TCnRukIwJFU6cTVwAh0OgmEDjqcnIQKEOMqx5RlPkJd9J2KQU2vRREjHC4JoRiWZjdbiAAuL+iZHyZvXlYraU1KFnBpZ2mqM0hTYAAqiAivgFXJ0ujAk1HbpfP1RLlNBV8whxo4lE+bxyrWMcVxDHSqOIcM+Ll6Mrb87kGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFKd+3/Z; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFKd+3/Z"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso532662a12.0
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 20:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283329; x=1787888129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcsGJ3dy0JAsH0yRQSUgpcd+dXRyC1KJ48HZWVmKibU=;
        b=RFKd+3/ZYyKEJnYhS/JHbQmU/JBg3eLhHgcL/GPGU8CDrxg3tPg4FXrs79CtbZgL6e
         FdvPDtiQiC7+v+CBBiwydlMN8AH7vvkspittxIjnCBdgEdl4P+6jpyCyPzeY1rRneKgx
         xRIjCZCvQUmvGJ0kMkModXJLe4qWWOJJapkztL3j0ZBhgSMEBrsGdIw8Jtz/wYHDyE8e
         t/kSxjCd9nSb3fi8PcJjjaK1iNWinNEekJp9hvg2crL5GR9TSnkO99beVJhx4E3zrU7B
         RGP0bywgN4WM1p3YWLZ7TDpopVNIJcT6iAsXFaEZwzjjK7oIaMGnxLdKus7sVwSzxGab
         DOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283329; x=1787888129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZcsGJ3dy0JAsH0yRQSUgpcd+dXRyC1KJ48HZWVmKibU=;
        b=QEHmwgw4Eh9M+vpKv5iQlTnfLHqE+hm+KX58+JpbameW5qXcN8FmY3MvDkm0AXVjGs
         w6LsOr04u4SYapDboLpxojaWOto2QeXWRxkeGhfUTXi385L357F9spKl5rAvjTIDkJMC
         XStQMCGBC0+K50somI7YJPV6uugUPJmn8qDLax+SjfPeP2b820ge3FbAGX+SaaMMCnhx
         R4T9UpsAzACqm6d1wxAEoDV9A4xZCOSaLBZuPKwpBOi5x4oSPE/T1xhQGAq8aOUoZlGd
         BWjTWGE70TTl/rF/JzmYkHcArESNmw7PWW2B4fTY2NwOTKg+I0/IR9xsSrACKD+R5m4M
         DzkQ==
X-Forwarded-Encrypted: i=1; AHgh+RruUEGbjJzYWylTfgsfSARboH7Sp7tbTrWuBngzXSTkv+5PsEIsbTHIYT6wf9wSJtPb3GI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/FennDJWNPRLopJ6jl6fTgfSqy47oQ6d6mYzJreb0pGqfmbyY
	hNu2lEL3wjVb3MmBUIWSES2pW1dLANbc/MGH0S9wK2gHgt9wdKf6hnh0
X-Gm-Gg: AR+sD11R6m1j1GhVjCbmf9Gye25X6nPpGdUDdFNXzbhKDq4DtzvjhA+gCheqDfCUIzG
	TRC16MI3VF39gtrmwhX0vCfKcD+3+oVaUfaDBsBv7WOg8nceESDzwqxkofYoyl1L9edS6zAEdNs
	EzhnQDCcCYxk300EOULqIFhZwUjVCyQnkMfWA3ksjxVCxMJEHJ350cZAD4LYqIYydx+Zq6e41AH
	CnRD8zZ/7NKuOGoWUnPQssU8uzTuY5Yi1csykCfLB+XbcAkEyE6NoRRWhrS/ha/I2++V31nuwED
	k03iCLEqVghz6Rk5OHqsQsuyKp28MgEbWkn0bh7Pw6oOuchOHupvregrb4cOZLT34Lj8U02UD3P
	jenHgtipkjwhKJnaZyTt5st+3E/PLCrKQuhnvufq8a9RVea7c5L20hEqlFMJAF456RltYOOmfS0
	HBBUqdDkBUahebGv8QzQnYkZJp1XaMDziNNFvxVm03srdmuWuYTgAhvemszTyaeX1yeTcA+7Vb6
	O89xbrOjATSQ2vxxljJZP18wsf7jk4lUJZ5FMos5l4=
X-Received: by 2002:a05:6a21:3511:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3cd30060d76mr7010037637.11.1787283329541;
        Thu, 20 Aug 2026 20:35:29 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15891a04csm2204271a12.15.2026.08.20.20.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:35:29 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v7 02/10] mfd: nct6694: Refactor USB-specific data into nct6694_usb_data
Date: Fri, 21 Aug 2026 11:34:57 +0800
Message-Id: <20260821033505.4017901-3-a0282524688@gmail.com>
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

Separate USB transport-specific fields from the core nct6694 structure
into a new nct6694_usb_data structure. This decouples the shared MFD
core from the USB transport layer, preparing the driver for potential
support of alternative transport backends in the future.

The following fields are moved into nct6694_usb_data:
  - access_lock
  - int_in_urb
  - udev
  - usb_msg
  - int_buffer

The core nct6694 structure now holds a void *priv pointer to reference
the transport-specific data. USB-only definitions (vendor/product IDs,
endpoint addresses, URB timeout, and the USB message union) are also
moved from the shared header into the USB driver source file.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v7:

Changes in v6:

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 drivers/mfd/nct6694.c       | 76 ++++++++++++++++++++++++++-----------
 include/linux/mfd/nct6694.h | 27 ++++---------
 2 files changed, 62 insertions(+), 41 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 308b2fda3055..58c1cbcbe3f2 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -10,8 +10,8 @@
  */
 
 #include <linux/bits.h>
-#include <linux/interrupt.h>
 #include <linux/idr.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
@@ -22,6 +22,27 @@
 #include <linux/spinlock.h>
 #include <linux/usb.h>
 
+#define NCT6694_VENDOR_ID	0x0416
+#define NCT6694_PRODUCT_ID	0x200B
+#define NCT6694_INT_IN_EP	0x81
+#define NCT6694_BULK_IN_EP	0x02
+#define NCT6694_BULK_OUT_EP	0x03
+
+#define NCT6694_URB_TIMEOUT	1000
+
+union __packed nct6694_usb_msg {
+	struct nct6694_cmd_header cmd_header;
+	struct nct6694_response_header response_header;
+};
+
+struct nct6694_usb_data {
+	struct mutex access_lock;
+	struct urb *int_in_urb;
+	struct usb_device *udev;
+	union nct6694_usb_msg *usb_msg;
+	__le32 *int_buffer;
+};
+
 static const struct mfd_cell nct6694_devs[] = {
 	MFD_CELL_NAME("nct6694-gpio"),
 	MFD_CELL_NAME("nct6694-gpio"),
@@ -96,11 +117,12 @@ static int nct6694_response_err_handling(struct nct6694 *nct6694, unsigned char
  */
 int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
 {
-	union nct6694_usb_msg *msg = nct6694->usb_msg;
-	struct usb_device *udev = nct6694->udev;
+	struct nct6694_usb_data *udata = nct6694->priv;
+	union nct6694_usb_msg *msg = udata->usb_msg;
+	struct usb_device *udev = udata->udev;
 	int tx_len, rx_len, ret;
 
-	guard(mutex)(&nct6694->access_lock);
+	guard(mutex)(&udata->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
 	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
@@ -146,11 +168,12 @@ EXPORT_SYMBOL_GPL(nct6694_read_msg);
  */
 int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
 {
-	union nct6694_usb_msg *msg = nct6694->usb_msg;
-	struct usb_device *udev = nct6694->udev;
+	struct nct6694_usb_data *udata = nct6694->priv;
+	union nct6694_usb_msg *msg = udata->usb_msg;
+	struct usb_device *udev = udata->udev;
 	int tx_len, rx_len, ret;
 
-	guard(mutex)(&nct6694->access_lock);
+	guard(mutex)(&udata->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
 	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
@@ -277,6 +300,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	struct usb_endpoint_descriptor *int_endpoint;
 	struct usb_host_interface *interface;
 	struct device *dev = &iface->dev;
+	struct nct6694_usb_data *udata;
 	struct nct6694 *nct6694;
 	int ret;
 
@@ -284,18 +308,26 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	if (!nct6694)
 		return -ENOMEM;
 
-	nct6694->usb_msg = devm_kzalloc(dev, sizeof(union nct6694_usb_msg), GFP_KERNEL);
-	if (!nct6694->usb_msg)
+	udata = devm_kzalloc(dev, sizeof(*udata), GFP_KERNEL);
+	if (!udata)
+		return -ENOMEM;
+
+	udata->usb_msg = devm_kzalloc(dev, sizeof(*udata->usb_msg), GFP_KERNEL);
+	if (!udata->usb_msg)
 		return -ENOMEM;
 
-	nct6694->int_buffer = devm_kzalloc(dev, sizeof(*nct6694->int_buffer), GFP_KERNEL);
-	if (!nct6694->int_buffer)
+	udata->int_buffer = devm_kzalloc(dev, sizeof(*udata->int_buffer), GFP_KERNEL);
+	if (!udata->int_buffer)
 		return -ENOMEM;
 
-	nct6694->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
-	if (!nct6694->int_in_urb)
+	udata->int_in_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (!udata->int_in_urb)
 		return -ENOMEM;
 
+	udata->udev = udev;
+
+	nct6694->priv = udata;
+
 	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
 						   &nct6694_irq_domain_ops,
 						   nct6694);
@@ -305,7 +337,6 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	}
 
 	nct6694->dev = dev;
-	nct6694->udev = udev;
 
 	ida_init(&nct6694->gpio_ida);
 	ida_init(&nct6694->i2c_ida);
@@ -314,7 +345,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 	spin_lock_init(&nct6694->irq_lock);
 
-	ret = devm_mutex_init(dev, &nct6694->access_lock);
+	ret = devm_mutex_init(dev, &udata->access_lock);
 	if (ret)
 		goto err_ida;
 
@@ -326,11 +357,11 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 		goto err_ida;
 	}
 
-	usb_fill_int_urb(nct6694->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
-			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
+	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
+			 udata->int_buffer, sizeof(*udata->int_buffer), usb_int_callback,
 			 nct6694, int_endpoint->bInterval);
 
-	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
+	ret = usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
 	if (ret)
 		goto err_ida;
 
@@ -343,7 +374,7 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	return 0;
 
 err_mfd:
-	usb_kill_urb(nct6694->int_in_urb);
+	usb_kill_urb(udata->int_in_urb);
 err_ida:
 	ida_destroy(&nct6694->wdt_ida);
 	ida_destroy(&nct6694->canfd_ida);
@@ -351,22 +382,23 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	ida_destroy(&nct6694->gpio_ida);
 	irq_domain_remove(nct6694->domain);
 err_urb:
-	usb_free_urb(nct6694->int_in_urb);
+	usb_free_urb(udata->int_in_urb);
 	return ret;
 }
 
 static void nct6694_usb_disconnect(struct usb_interface *iface)
 {
 	struct nct6694 *nct6694 = usb_get_intfdata(iface);
+	struct nct6694_usb_data *udata = nct6694->priv;
 
 	mfd_remove_devices(nct6694->dev);
-	usb_kill_urb(nct6694->int_in_urb);
+	usb_kill_urb(udata->int_in_urb);
 	ida_destroy(&nct6694->wdt_ida);
 	ida_destroy(&nct6694->canfd_ida);
 	ida_destroy(&nct6694->i2c_ida);
 	ida_destroy(&nct6694->gpio_ida);
 	irq_domain_remove(nct6694->domain);
-	usb_free_urb(nct6694->int_in_urb);
+	usb_free_urb(udata->int_in_urb);
 }
 
 static const struct usb_device_id nct6694_ids[] = {
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 3c683e317aa3..3f5dd53f38de 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -2,12 +2,18 @@
 /*
  * Copyright (C) 2025 Nuvoton Technology Corp.
  *
- * Nuvoton NCT6694 USB transaction and data structure.
+ * Nuvoton NCT6694 core definitions shared by all transport drivers
+ * and sub-device drivers.
  */
 
 #ifndef __MFD_NCT6694_H
 #define __MFD_NCT6694_H
 
+#include <linux/idr.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
 #define NCT6694_HWMON_MOD	0x00
 #define NCT6694_PWM_MOD		0x01
 #define NCT6694_I2C_MOD		0x03
@@ -17,17 +23,9 @@
 #define NCT6694_RPT_MOD		0xFF
 #define NCT6694_GPIO_MOD	NCT6694_RPT_MOD
 
-#define NCT6694_VENDOR_ID	0x0416
-#define NCT6694_PRODUCT_ID	0x200B
-#define NCT6694_INT_IN_EP	0x81
-#define NCT6694_BULK_IN_EP	0x02
-#define NCT6694_BULK_OUT_EP	0x03
-
 #define NCT6694_HCTRL_SET	0x40
 #define NCT6694_HCTRL_GET	0x80
 
-#define NCT6694_URB_TIMEOUT	1000
-
 enum nct6694_irq_id {
 	NCT6694_IRQ_GPIO0 = 0,
 	NCT6694_IRQ_GPIO1,
@@ -84,11 +82,6 @@ struct __packed nct6694_response_header {
 	__le16 len;
 };
 
-union __packed nct6694_usb_msg {
-	struct nct6694_cmd_header cmd_header;
-	struct nct6694_response_header response_header;
-};
-
 struct nct6694 {
 	struct device *dev;
 	struct ida gpio_ida;
@@ -96,13 +89,9 @@ struct nct6694 {
 	struct ida canfd_ida;
 	struct ida wdt_ida;
 	struct irq_domain *domain;
-	struct mutex access_lock;
 	spinlock_t irq_lock;
-	struct urb *int_in_urb;
-	struct usb_device *udev;
-	union nct6694_usb_msg *usb_msg;
-	__le32 *int_buffer;
 	unsigned int irq_enable;
+	void *priv;
 };
 
 int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf);
-- 
2.34.1

