Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A97303A0D
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283341; cv=none; b=k2NnbkNOyaHLFSSeVR1yqTksDYg2MR9bTjHOUhxvIVdJ8x4Lk4YbWI9lsrTNjIvBoLNbT/h1s+mHuRkSOlSeJXBAipZAisCAzp5uRoYPgXB0o7/uKG4ekvdjb4yK5wkFtFHyTqA3449JDkDYlFtwc364HE+K5nNoDUMkmreW0y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283341; c=relaxed/simple;
	bh=nSz6wcwgyRgc1iEzhbH88AYggGVwlQeE0IR33X9sbN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cBoaFAFqjd7004O3nUm3gHBZ8sLO/XVfNtDtWMt4Btg8lr7Vb6xh4WUYiT256WBYLPttPKZgYcfY7FLbzY/3kFloUH+2Pw8NZ/V3oXAXB1dNY4F88mGqYNNPEW/SSwQrE8DqwSsXzxGy7CAPRT7By+KamOfOAF+9fjnVsp/qkvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZj2nie3; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZj2nie3"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e04df8c46so554500b3a.2
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 20:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283337; x=1787888137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HV8tF5lTWFg/1+hCOdvfUfHSp/0aVR5guSwhRB7pK4=;
        b=IZj2nie3ZOPCgbYgviOmX6nRVGMujTFp8U8y3YDfEB5HDxyAh2SYFJzE/XHjJDG0j2
         +iyFlBb+pkGRgSUcuGrGa1ap8F1dfyvKLfc68N+B4JdVAH/tLSZEiHUgKKMbA23au2dP
         SU4k5HiL9TTsC8AL13vw3smiUZ8zDw8CQh8GlsIN687OSTuXHQ2GjAOvDF22ZSRc3T0M
         9jxeENA3Nj5X+bA/RZ5gvZ0iwJFJKgUWXcRURGdOTR4U5GDRUhmIxUqNeJ3GUrx1RABW
         ncfiJe7Ii0GsG8xFevxWV0OcTAyxPdsqOMnUCv0BXvTrx7VrPfO6o5gUDkS5M6q+ccCc
         TLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283337; x=1787888137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HV8tF5lTWFg/1+hCOdvfUfHSp/0aVR5guSwhRB7pK4=;
        b=CeRHdWvhgV7VmahsHFj8PHoXbJ9tooVmIX76GKNkez4V3TqtDHYKwaj4JGxkDCCpiN
         HUMoxBrVqIEIIgExlrD4K8raf5bcD5KGMD0cuU2Zu1GNTTi39iAK6JuDkevrXwAPaAXp
         yh5wgTZOO1loCndW/CjKdjapzAmNa6+WSNfLNL2fcIIKlCqz2PtBeKpJWGIA+gypHImC
         gM4AEzHgV4s1RUxwtXuKdEv43w79B6osHw3KTljI/m2DmzkevxFtUjjBk4oqcwJKfoWJ
         t6PTxGGFRs5//oC6glDCB16y36g4pCkP3IseESFZodU6Ut0RJaqh88WAymNxp4qiWdhI
         0wNQ==
X-Forwarded-Encrypted: i=1; AHgh+RozWaoGWJoHXZApEnjCZ8XNKy1UePU82fyDa2e99+gc3jXscuS5SdshUOHbWxkXXAoX+q4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWyJpd6c4UMCXnDZMQCL660ugjzjhDdIxXISmliThr3fJT6blq
	uJ31TScqF2Kh4V1JwlEGPplqpiTDO8YpiZYf+CRZI5Hvqrkd2oNGvEPt
X-Gm-Gg: AR+sD11JEqVO4nQ3h/dIwwtzlisW2lOGL5IOsqQczHwKI9ljpcAyOfD6O6Sv5DbvcTl
	QZsf9PuSRWmcigMQdFYRTVd/dTdVpt3TXe2Akgl3qDObBWsJEJpML9ge5rM/4zUD7p9zclaCiS/
	AGyo7cICLGW1T4WxYhI1uS6lt7RSYG7y4WnntUKQlRidEj2oGhQayGJIARAnaFSHVfaQ020Tt7v
	wICe6T8fMFZjLR/LycpR+bW3gxtT8nJJoclY+yMoD9+LJmMk/bfKC5btxDKxu7RDWGdI5jKNUDx
	67Y3r5nXeGNAg5EQUWO/Ip21OgsoZTxTQmsutDjaDf9b0ojGz8Tem4qclT6XKzMaAJUNlv2MAt5
	wYNBrWKPIJpEaGrXHz95kRbQ44pV9ZIYGqTmrHujuMXCpjPevGWTeX91Annul694VpqS11CXZhG
	3+PCfGbyzWWw1haRcAPNLtZXZ7ohf3Kcc3/CAkWC7V0pWq2iq3/le199JUJrxDJ3aTLisdp66+C
	WUL+OcEWXbGR7fdk8BhEaU4yXM0l/s7fyyrYTA+xT0=
X-Received: by 2002:a05:6a20:ac43:b0:3c3:935a:af2c with SMTP id adf61e73a8af0-3cd2fd03751mr6890208637.3.1787283336565;
        Thu, 20 Aug 2026 20:35:36 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15891a04csm2204271a12.15.2026.08.20.20.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:35:36 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v7 05/10] mfd: nct6694: Extract core device management into a separate module
Date: Fri, 21 Aug 2026 11:35:00 +0800
Message-Id: <20260821033505.4017901-6-a0282524688@gmail.com>
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

Extract the transport-agnostic core logic, including IRQ domain setup,
IDA initialization, and MFD sub-device registration, from the USB driver
into a new nct6694-core.c module.

The core routines are exported as nct6694_core_probe() and
nct6694_core_remove() to be consumed by the transport drivers. The USB
driver is updated to pass its specific MFD cells to the core probe
routine.

This completes the transport abstraction, ensuring that the shared
device management logic is cleanly separated from the underlying I/O
implementation, and is fully ready for new transport backends
(e.g., HIF).

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v7:

Changes in v6:
- Reordered to sit before the transport-abstraction patch; no functional
  change.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 MAINTAINERS                 |   2 +-
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/nct6694-core.c  | 136 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/nct6694-usb.c   |  91 ++----------------------
 include/linux/mfd/nct6694.h |   9 ++-
 5 files changed, 153 insertions(+), 86 deletions(-)
 create mode 100644 drivers/mfd/nct6694-core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 89d7339f3613..f1894e88ba62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19356,7 +19356,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
-F:	drivers/mfd/nct6694-usb.c
+F:	drivers/mfd/nct6694-*.c
 F:	drivers/net/can/usb/nct6694_canfd.c
 F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 48caac64f3d8..10c19a19541e 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694-core.o
 obj-$(CONFIG_MFD_NCT6694_USB)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
diff --git a/drivers/mfd/nct6694-core.c b/drivers/mfd/nct6694-core.c
new file mode 100644
index 000000000000..36dfaa2e327f
--- /dev/null
+++ b/drivers/mfd/nct6694-core.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Nuvoton NCT6694 MFD core driver.
+ *
+ * This provides common registration for IRQ domain, IDA pools,
+ * and MFD sub-devices shared by all transport drivers.
+ */
+
+#include <linux/idr.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+
+static void nct6694_irq_enable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	guard(spinlock_irqsave)(&nct6694->irq_lock);
+
+	nct6694->irq_enable |= BIT(hwirq);
+}
+
+static void nct6694_irq_disable(struct irq_data *data)
+{
+	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	guard(spinlock_irqsave)(&nct6694->irq_lock);
+
+	nct6694->irq_enable &= ~BIT(hwirq);
+}
+
+static const struct irq_chip nct6694_irq_chip = {
+	.name = "nct6694-irq",
+	.flags = IRQCHIP_SKIP_SET_WAKE,
+	.irq_enable = nct6694_irq_enable,
+	.irq_disable = nct6694_irq_disable,
+};
+
+static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq,
+				  irq_hw_number_t hw)
+{
+	struct nct6694 *nct6694 = d->host_data;
+
+	irq_set_chip_data(irq, nct6694);
+	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
+
+	return 0;
+}
+
+static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
+{
+	irq_set_chip_and_handler(irq, NULL, NULL);
+	irq_set_chip_data(irq, NULL);
+}
+
+static const struct irq_domain_ops nct6694_irq_domain_ops = {
+	.map	= nct6694_irq_domain_map,
+	.unmap	= nct6694_irq_domain_unmap,
+};
+
+/**
+ * nct6694_core_probe() - Register IRQ domain, IDAs, and MFD sub-devices
+ * @dev: parent device (USB interface or platform device)
+ * @nct6694: initialized nct6694 structure with its transport regmap set
+ *
+ * This function completes the common probe steps shared by all transport
+ * drivers: IRQ domain creation, IDA initialization, and MFD cell registration.
+ *
+ * The caller must have already set nct6694->dev, nct6694->priv, and
+ * nct6694->regmap before calling this.
+ *
+ * Return: 0 on success or negative errno on failure.
+ */
+int nct6694_core_probe(struct device *dev, struct nct6694 *nct6694,
+		       const struct mfd_cell *cells, int n_cells)
+{
+	int ret;
+
+	spin_lock_init(&nct6694->irq_lock);
+
+	ida_init(&nct6694->gpio_ida);
+	ida_init(&nct6694->i2c_ida);
+	ida_init(&nct6694->canfd_ida);
+	ida_init(&nct6694->wdt_ida);
+
+	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
+						   &nct6694_irq_domain_ops,
+						   nct6694);
+	if (!nct6694->domain) {
+		ret = -ENODEV;
+		goto err_ida;
+	}
+
+	ret = mfd_add_hotplug_devices(dev, cells, n_cells);
+	if (ret)
+		goto err_domain;
+
+	return 0;
+
+err_domain:
+	irq_domain_remove(nct6694->domain);
+err_ida:
+	ida_destroy(&nct6694->wdt_ida);
+	ida_destroy(&nct6694->canfd_ida);
+	ida_destroy(&nct6694->i2c_ida);
+	ida_destroy(&nct6694->gpio_ida);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(nct6694_core_probe);
+
+/**
+ * nct6694_core_remove() - Unregister MFD sub-devices and free core resources
+ * @nct6694: nct6694 structure previously passed to nct6694_core_probe()
+ */
+void nct6694_core_remove(struct nct6694 *nct6694)
+{
+	mfd_remove_devices(nct6694->dev);
+	irq_domain_remove(nct6694->domain);
+	ida_destroy(&nct6694->wdt_ida);
+	ida_destroy(&nct6694->canfd_ida);
+	ida_destroy(&nct6694->i2c_ida);
+	ida_destroy(&nct6694->gpio_ida);
+}
+EXPORT_SYMBOL_GPL(nct6694_core_remove);
+
+MODULE_DESCRIPTION("Nuvoton NCT6694 MFD core driver");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
index 7c6b986db7f7..2289ebfde7fa 100644
--- a/drivers/mfd/nct6694-usb.c
+++ b/drivers/mfd/nct6694-usb.c
@@ -10,7 +10,6 @@
  */
 
 #include <linux/bits.h>
-#include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
@@ -19,7 +18,6 @@
 #include <linux/mfd/nct6694.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <linux/usb.h>
 
 #define NCT6694_VENDOR_ID	0x0416
@@ -246,57 +244,9 @@ static void nct6694_usb_int_callback(struct urb *urb)
 resubmit:
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
 	if (ret)
-		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
+		dev_warn(nct6694->dev, "Failed to resubmit urb, status %pe", ERR_PTR(ret));
 }
 
-static void nct6694_irq_enable(struct irq_data *data)
-{
-	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
-	irq_hw_number_t hwirq = irqd_to_hwirq(data);
-
-	guard(spinlock_irqsave)(&nct6694->irq_lock);
-
-	nct6694->irq_enable |= BIT(hwirq);
-}
-
-static void nct6694_irq_disable(struct irq_data *data)
-{
-	struct nct6694 *nct6694 = irq_data_get_irq_chip_data(data);
-	irq_hw_number_t hwirq = irqd_to_hwirq(data);
-
-	guard(spinlock_irqsave)(&nct6694->irq_lock);
-
-	nct6694->irq_enable &= ~BIT(hwirq);
-}
-
-static const struct irq_chip nct6694_irq_chip = {
-	.name = "nct6694-irq",
-	.flags = IRQCHIP_SKIP_SET_WAKE,
-	.irq_enable = nct6694_irq_enable,
-	.irq_disable = nct6694_irq_disable,
-};
-
-static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
-{
-	struct nct6694 *nct6694 = d->host_data;
-
-	irq_set_chip_data(irq, nct6694);
-	irq_set_chip_and_handler(irq, &nct6694_irq_chip, handle_simple_irq);
-
-	return 0;
-}
-
-static void nct6694_irq_domain_unmap(struct irq_domain *d, unsigned int irq)
-{
-	irq_set_chip_and_handler(irq, NULL, NULL);
-	irq_set_chip_data(irq, NULL);
-}
-
-static const struct irq_domain_ops nct6694_irq_domain_ops = {
-	.map	= nct6694_irq_domain_map,
-	.unmap	= nct6694_irq_domain_unmap,
-};
-
 static int nct6694_usb_probe(struct usb_interface *iface,
 			     const struct usb_device_id *id)
 {
@@ -330,35 +280,19 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 	udata->udev = udev;
 
-	nct6694->priv = udata;
-
-	nct6694->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
-						   &nct6694_irq_domain_ops,
-						   nct6694);
-	if (!nct6694->domain) {
-		ret = -ENODEV;
-		goto err_urb;
-	}
-
 	nct6694->dev = dev;
-
-	ida_init(&nct6694->gpio_ida);
-	ida_init(&nct6694->i2c_ida);
-	ida_init(&nct6694->canfd_ida);
-	ida_init(&nct6694->wdt_ida);
-
-	spin_lock_init(&nct6694->irq_lock);
+	nct6694->priv = udata;
 
 	ret = devm_mutex_init(dev, &udata->access_lock);
 	if (ret)
-		goto err_ida;
+		goto err_urb;
 
 	interface = iface->cur_altsetting;
 
 	int_endpoint = &interface->endpoint[0].desc;
 	if (!usb_endpoint_is_int_in(int_endpoint)) {
 		ret = -ENODEV;
-		goto err_ida;
+		goto err_urb;
 	}
 
 	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
@@ -367,11 +301,11 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 	ret = usb_submit_urb(udata->int_in_urb, GFP_KERNEL);
 	if (ret)
-		goto err_ida;
+		goto err_urb;
 
 	usb_set_intfdata(iface, nct6694);
 
-	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
+	ret = nct6694_core_probe(dev, nct6694, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
 		goto err_mfd;
 
@@ -379,12 +313,6 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 
 err_mfd:
 	usb_kill_urb(udata->int_in_urb);
-err_ida:
-	ida_destroy(&nct6694->wdt_ida);
-	ida_destroy(&nct6694->canfd_ida);
-	ida_destroy(&nct6694->i2c_ida);
-	ida_destroy(&nct6694->gpio_ida);
-	irq_domain_remove(nct6694->domain);
 err_urb:
 	usb_free_urb(udata->int_in_urb);
 	return ret;
@@ -395,13 +323,8 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 	struct nct6694 *nct6694 = usb_get_intfdata(iface);
 	struct nct6694_usb_data *udata = nct6694->priv;
 
-	mfd_remove_devices(nct6694->dev);
+	nct6694_core_remove(nct6694);
 	usb_kill_urb(udata->int_in_urb);
-	ida_destroy(&nct6694->wdt_ida);
-	ida_destroy(&nct6694->canfd_ida);
-	ida_destroy(&nct6694->i2c_ida);
-	ida_destroy(&nct6694->gpio_ida);
-	irq_domain_remove(nct6694->domain);
 	usb_free_urb(udata->int_in_urb);
 }
 
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 43b51f243e8e..853b1530755d 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -10,10 +10,13 @@
 #define __MFD_NCT6694_H
 
 #include <linux/idr.h>
-#include <linux/mutex.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+struct device;
+struct irq_domain;
+struct mfd_cell;
+
 #define NCT6694_HWMON_MOD	0x00
 #define NCT6694_PWM_MOD		0x01
 #define NCT6694_I2C_MOD		0x03
@@ -94,6 +97,10 @@ struct nct6694 {
 	void *priv;
 };
 
+int nct6694_core_probe(struct device *dev, struct nct6694 *nct6694,
+		       const struct mfd_cell *cells, int n_cells);
+void nct6694_core_remove(struct nct6694 *nct6694);
+
 int nct6694_usb_read_msg(struct nct6694 *nct6694,
 			 const struct nct6694_cmd_header *cmd_hd,
 			 void *buf);
-- 
2.34.1

