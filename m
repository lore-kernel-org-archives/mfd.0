Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989825;
	b=zhwwsibrqJBep6IHVxzKMe1/FOXnbIqjHwuCJ52LZ3Ik4j8yUIPueW38RMEkFfo1pQIO
	 lx5k96so7DHr7Dkh8FwB8yzHec0qT7P5undt2EjkSU+5Qn5CmWJLugOeOgawIKshAGB26
	 WQOksJ8woU8qTzSH+WwztZqGWJ9XLwKZRV7fBiXoRCLhEz2aSlOue5ZMNwCsiRKdSZ0dV
	 /Zt1WxBNQIqW021/hmgXFk/jZ9t0s25HFkE/IjBnxtVxzl6BpZEPzUAjFi1VYSlpEFpi9
	 ImTsp6vEzExnB1t1mdoq2OAFq47KO0l24z+xOm0nofUmzUfLzu0LO/0OUJP6NFlw9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O7b5TvKaL5k5uS1R+qO89yuvUB8Ybxk8ZIDy/935QDw=;
	b=B+1MaFztZInDn1ug+2yv2yyV8/aj/rLhCTOJG/eAyVQqIdffxjj/2eyVIzR1Mvx5akaO
	 YGWT8qCITChuc2xQt8hXDhdRhpcvM0RCHlNQFzKVnxyDgbjt9vE3dx7QnFSfWEKtKKhaD
	 QRHrskGuMbLPLAxiEWfR5QVxeHKZKQvvBsKDi292v8g8FNDm/tD2IanEBW8C8DV+r43Vs
	 9E6eKu6M69vX1khQvdDdegehdXVME3hGjBeRnvCowuolBho1M1gj5f40Sq7czCwNVz6f/
	 VO4EKlE9W8T9Gilnbpip4tXjgsAc1775z5Ch4Rlcpj9jO9cvhsf8Z3OKO7cr+JReFyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Z/xaW8Jg";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098960A382F
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6098960A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z/xaW8Jg
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so384801b3a.2
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989825; x=1795594625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7b5TvKaL5k5uS1R+qO89yuvUB8Ybxk8ZIDy/935QDw=;
        b=Z/xaW8JgVILcd4mRckfioFPDct6DRY1WXSJcom6GeREBY8AtNh8T1VE9p8wFlZdUx9
         DFzhEi1783//vFn8+ItvRSDpGoZVMx5utU5AhPcGkbzroPcqDawYWEkxK0jpc4/v3fj0
         XnCIB/ERQLAZHh1eXV+HqIP6E4encjnFn9hksS2UfvMVCegj19rBQgtVcW2gItho8q7H
         Ie4qcFgh0j3Do7TyWbfhodcVAHBDmKqVjNXIAx5HPD8GEB6oSR7WsCk5LV7g0D0fwTKP
         q+ShpQXYQIGAL65B4dR+pouGuGmzbqMJQR0AfIyB/uKxsRC1NGZ1ejgvlHXMYKMrTrFA
         Q5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989825; x=1795594625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7b5TvKaL5k5uS1R+qO89yuvUB8Ybxk8ZIDy/935QDw=;
        b=Q4fr/yT6lZ1Ey0FfmJVvxVm0ZwqSR+chYk9TQzloBQPPYT3BncVKlu81aYbvUKK0Ni
         zGKy7puB7C6BaWXwHQJjwRNH9G8YQwayu+iq+0SmGJC5O8mpCGVb26+zNuv0KuR71eGw
         0xjm0uKeNEa1t1c/GZ5bGsCSkJZK/WN6i8TzJ+lmMGxYj2b/D/bD2StmS7dVB868izoA
         wm02UXJrm9JE8pUCIUD27hv32aJqgj68XFDVb/GuM+qR3zIunqToGkyY0C2l1Cw5FxM9
         Kd5n+gwkcuGfRQSGzRX6D7U4nq1cwmdqNSMOqA5p3Q2KkMdTViCBMxMODG/M8DQQCYuS
         zy0g==
X-Forwarded-Encrypted: i=1; AL+hErFR0AVmVQ1nWofIVcRFG8XP2GyO1Yoo7cofkzTqMMi+5oG6zlpMcUs3Dw6UYgRgXlrlIXI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ORq8uM3d2r7IjHCIwc0U9yn9CQlZh2SQSIYyvmmD75F4Ngkx5
	lNj7xlkT+7uL8r3L7hBc9CjxnDHAah/G4hNTEkK4aQ9xLTGOKqFVo1uw
X-Gm-Gg: AYBFou2HJmcy87KZVeO+jdc97p1TPIZerfaaMFa70sYDmf4zxa02Nk+KBMx+tlLeMTb
	lweHWWuXI1vfd2sStRbdszvqbkgYxb3BCfpCTvg5HqO7KgaWXW2ChyjecUNWWaLtIp1MpYBQngy
	MpTDo9AmLjSlFqeTydYsMrdfF8dhc0cxPdXtU3huyIVj8uH7kbaBn8nm9qQ+jb+9nf8I4Jda8Yt
	6yNc/J52DlCoU3TFMLU2R43q8iP4t+aSb8wU8QefsmmD16rSKV+6P5vewMKMVdQ8etNxsDXlPE8
	YqPyzWK0zATyVX7smv20p8BHJocsupT711OLG+qHCZOHi7Zb0uMsmDQV/yTSos8iZDAIxanEyYg
	Yn1BF4OKVhdKlYzWnShGih8iuWbmP4ynj935usv+7CN69XxHAoBt2ocWw3EJeox+6WL+OuD6QMe
	ocNQOB1EbKBVHCwDt+Df8evs8Kmfa7HXDsVxIuc6P1nolxybre9rEtV/1iQrS4Y6aMkY/5RuYMY
	5zVJwlZRlwo9OUWpei+xTCP006HTC13uhtb9bgiOM91HYdDwiQvz6FTKyPJeoSkTrCfQ6+QAS5O
	l/nEVLaTE6/P5FjCZ+0wz+oyznb6ufmgHp8bYkptB3NDMN93YMGLJvT8Fc1M8oBHPMJPeHDGI/S
	2Js5NDobfP0bLucsl
X-Received: by 2002:a05:6a20:e613:b0:3fe:4bff:1a40 with SMTP id adf61e73a8af0-3fe988f6b48mr1808014637.58.1794989824648;
        Wed, 18 Nov 2026 00:17:04 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:17:03 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 10/13] mfd: nct6694: Extract core device management into a separate module
Date: Wed, 18 Nov 2026 16:16:21 +0800
Message-Id: <20261118081625.2399247-11-a0282524688@gmail.com>
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

Move the IRQ domain and IDA handling, which do not depend on the
transport, from the USB driver into a new nct6694-core module. The
core retrieves struct nct6694 from the driver data of the transport
device, and the transport keeps registering its own MFD cells.

The USB driver now creates the IRQ domain before submitting the
interrupt URB, and kills the URB before the domain is removed.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- Rebased on top of "mfd: nct6694: Drop the unused IRQ enable mask";
  the irq_chip moved to nct6694-core.c no longer has
  .irq_enable/.irq_disable.

Changes in v9:
- None.

Changes in v8:
- Pass only the transport device to the core and retrieve struct nct6694
  from its driver data.
- Let the transport register its own MFD cells.
- Rename nct6694_core_{probe,remove}() to nct6694_device_{init,exit}().
- Return -ENOMEM when the IRQ domain cannot be created.
- Folded in the v7 patch "Submit the interrupt URB after the core is
  registered", whose issue no longer arises.
- Moved the Kconfig split to a later patch.

Changes in v7:
- None.

Changes in v6:
- Reordered to sit before the transport-abstraction patch; no functional
  change.

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 MAINTAINERS                 |  2 +-
 drivers/mfd/Makefile        |  1 +
 drivers/mfd/nct6694-core.c  | 85 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/nct6694-usb.c   | 73 ++++++-------------------------
 include/linux/mfd/nct6694.h |  3 ++
 5 files changed, 104 insertions(+), 60 deletions(-)
 create mode 100644 drivers/mfd/nct6694-core.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 62517279b5f8..69c31fe71f81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20081,7 +20081,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
-F:	drivers/mfd/nct6694-usb.c
+F:	drivers/mfd/nct6694-*.c
 F:	drivers/net/can/usb/nct6694_canfd.c
 F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index af81e00b3573..20a5de726071 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
+obj-$(CONFIG_MFD_NCT6694)	+= nct6694-core.o
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
diff --git a/drivers/mfd/nct6694-core.c b/drivers/mfd/nct6694-core.c
new file mode 100644
index 000000000000..438f391a7bcd
--- /dev/null
+++ b/drivers/mfd/nct6694-core.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ *
+ * Nuvoton NCT6694 core driver providing the IRQ domain and IDA pools
+ * shared by all transport drivers.
+ */
+
+#include <linux/device.h>
+#include <linux/idr.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/nct6694.h>
+#include <linux/module.h>
+
+static const struct irq_chip nct6694_irq_chip = {
+	.name = "nct6694-irq",
+	.flags = IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
+{
+	struct nct6694 *ddata = d->host_data;
+
+	irq_set_chip_data(irq, ddata);
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
+ * nct6694_device_init() - Set up the resources shared by all transports
+ * @dev: transport device whose driver data points to the struct nct6694
+ *
+ * Return: 0 on success or negative errno on failure.
+ */
+int nct6694_device_init(struct device *dev)
+{
+	struct nct6694 *ddata = dev_get_drvdata(dev);
+
+	ida_init(&ddata->gpio_ida);
+	ida_init(&ddata->i2c_ida);
+	ida_init(&ddata->canfd_ida);
+	ida_init(&ddata->wdt_ida);
+
+	ddata->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
+						 &nct6694_irq_domain_ops,
+						 ddata);
+	if (!ddata->domain)
+		return -ENOMEM;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nct6694_device_init);
+
+/**
+ * nct6694_device_exit() - Release the resources set up by nct6694_device_init()
+ * @dev: transport device passed to nct6694_device_init()
+ */
+void nct6694_device_exit(struct device *dev)
+{
+	struct nct6694 *ddata = dev_get_drvdata(dev);
+
+	ida_destroy(&ddata->wdt_ida);
+	ida_destroy(&ddata->canfd_ida);
+	ida_destroy(&ddata->i2c_ida);
+	ida_destroy(&ddata->gpio_ida);
+	irq_domain_remove(ddata->domain);
+}
+EXPORT_SYMBOL_GPL(nct6694_device_exit);
+
+MODULE_DESCRIPTION("Nuvoton NCT6694 core driver");
+MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
index 10d08ab50e16..8f9c7b7d9471 100644
--- a/drivers/mfd/nct6694-usb.c
+++ b/drivers/mfd/nct6694-usb.c
@@ -11,7 +11,6 @@
 
 #include <linux/bits.h>
 #include <linux/interrupt.h>
-#include <linux/idr.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
@@ -283,32 +282,6 @@ static void nct6694_usb_int_callback(struct urb *urb)
 		dev_warn(ddata->dev, "Failed to resubmit urb, status %pe",  ERR_PTR(ret));
 }
 
-static const struct irq_chip nct6694_irq_chip = {
-	.name = "nct6694-irq",
-	.flags = IRQCHIP_SKIP_SET_WAKE,
-};
-
-static int nct6694_irq_domain_map(struct irq_domain *d, unsigned int irq, irq_hw_number_t hw)
-{
-	struct nct6694 *ddata = d->host_data;
-
-	irq_set_chip_data(irq, ddata);
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
@@ -353,26 +326,12 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 		return -ENOMEM;
 
 	ddata = &usb_data->core;
-
-	ddata->domain = irq_domain_create_simple(NULL, NCT6694_NR_IRQS, 0,
-						 &nct6694_irq_domain_ops,
-						 ddata);
-	if (!ddata->domain) {
-		ret = -ENODEV;
-		goto err_urb;
-	}
-
 	ddata->dev = dev;
 	usb_data->usb_dev = usb_dev;
 
-	ida_init(&ddata->gpio_ida);
-	ida_init(&ddata->i2c_ida);
-	ida_init(&ddata->canfd_ida);
-	ida_init(&ddata->wdt_ida);
-
 	ret = devm_mutex_init(dev, &usb_data->access_lock);
 	if (ret)
-		goto err_ida;
+		goto err_free_urb;
 
 	int_pipe = usb_rcvintpipe(usb_dev, NCT6694_INT_IN_EP);
 	usb_fill_int_urb(usb_data->int_urb, usb_dev, int_pipe,
@@ -380,27 +339,27 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 			 nct6694_usb_int_callback, ddata,
 			 usb_pipe_endpoint(usb_dev, int_pipe)->desc.bInterval);
 
-	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
+	usb_set_intfdata(iface, ddata);
+
+	ret = nct6694_device_init(dev);
 	if (ret)
-		goto err_ida;
+		goto err_free_urb;
 
-	usb_set_intfdata(iface, ddata);
+	ret = usb_submit_urb(usb_data->int_urb, GFP_KERNEL);
+	if (ret)
+		goto err_device_exit;
 
 	ret = mfd_add_hotplug_devices(dev, nct6694_usb_devs, ARRAY_SIZE(nct6694_usb_devs));
 	if (ret)
-		goto err_mfd;
+		goto err_kill_urb;
 
 	return 0;
 
-err_mfd:
+err_kill_urb:
 	usb_kill_urb(usb_data->int_urb);
-err_ida:
-	ida_destroy(&ddata->wdt_ida);
-	ida_destroy(&ddata->canfd_ida);
-	ida_destroy(&ddata->i2c_ida);
-	ida_destroy(&ddata->gpio_ida);
-	irq_domain_remove(ddata->domain);
-err_urb:
+err_device_exit:
+	nct6694_device_exit(dev);
+err_free_urb:
 	usb_free_urb(usb_data->int_urb);
 	return ret;
 }
@@ -412,11 +371,7 @@ static void nct6694_usb_disconnect(struct usb_interface *iface)
 
 	mfd_remove_devices(ddata->dev);
 	usb_kill_urb(usb_data->int_urb);
-	ida_destroy(&ddata->wdt_ida);
-	ida_destroy(&ddata->canfd_ida);
-	ida_destroy(&ddata->i2c_ida);
-	ida_destroy(&ddata->gpio_ida);
-	irq_domain_remove(ddata->domain);
+	nct6694_device_exit(ddata->dev);
 	usb_free_urb(usb_data->int_urb);
 }
 
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 24cfe6a03ef0..26e9034daa53 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -89,6 +89,9 @@ struct nct6694 {
 	struct irq_domain *domain;
 };
 
+int nct6694_device_init(struct device *dev);
+void nct6694_device_exit(struct device *dev);
+
 int nct6694_usb_read_msg(struct nct6694 *ddata,
 			 const struct nct6694_cmd_header *cmd_hd,
 			 void *buf);
-- 
2.34.1

