Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415059;
	b=hfV/cTazHXIPCtonjFKyWNbfSVUlq9WnLtx8bU8y7y/uwUcl8fIAVRFg1L5vyaOHtO6v
	 oWjyyVhUonM8sjHCzzghVUXsfPPLNUiLu26uSNTcc82V0UL+K/CjW0uku81dYLPkm7/+Q
	 bZPiGGuifmnfwGan2pAxEVhagR7K+jTRjeMKH3XEhNY2cieBC73weM320Zr4s63p6I8BE
	 ZCAs7TsXQLfmlNkxYj5rW4lCEWKcsZyMQLmMeHg1bv0KePbTOTGXVJSHz9WaS+1+wkF2A
	 m60jLfdooxGu9vfHZMZHMyuToqYarcmv4lHVv/LIGePHzOmfFORh1lqIW7XjCMRbqOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wuyvace6ciytd5jUR1xreUhLnUkhsuMz/ZH/NBTGYXo=;
	b=uQ2enNz4FG5E//uJlmb3o6OGprjQO2ARrudr+DEppslkJXvjnON/1XnAA4v2b7iPKHX/
	 I4VbcGFys16dQj1bP5NSwoYepgcEnUFKDdMB7RJ53iyfh2T3cvgSabbgBWNLFPwZB2zpW
	 g8fPcRQ7y8haHMyTknmy3Z7diYbK8XlDvXXRbluuU9y1TW/gVBY+HiUBqjgtkfj1QXHZo
	 mQ3Das9eA4cY3HNuxLCSzQvf9UZ1QoKO8FuZtLyKjYZuJeoXVmVJjfrC60MAAxBJmeOLy
	 CcOGgV5R+NvO7Viu/4x3I+BN3IMUa8d8ph9Axz4wuMT9OfKf+Na83IKkeBi39w6OrEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="q/xkxKaH";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597EE606A331
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 16:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597EE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q/xkxKaH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so34268135e9.3
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 08:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415058; x=1795019858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wuyvace6ciytd5jUR1xreUhLnUkhsuMz/ZH/NBTGYXo=;
        b=q/xkxKaHYenx1EFNDBOfTSzB3pRzB3841FGz5YvjC+ak8rwUENOjF5utBa0sKRdFjF
         7QUvuzBISZ46svN99hPrVPMD1f51kYNpLkwZyCB+ePHbsTFVuf2GTGntz6aFkl85y5Od
         07yEYQwkR+MRt66YOzDDOLZNL7NDHHzJ/SNcGoimV5rDsX9zMnILohacj5szDCKctQAU
         nYnUxTP7DdwCw6Pqsr5CAiwTXWZTPe4gsRJurhsgg+o0qX0RXRYsolxpQYbz70tVavjs
         CgPRRr7T54INR2DeBtN+Lnt02DpCElmAIBfjrkxCeAOlR0Dah8rhcnw6HjAZYrOwwUwf
         i7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415058; x=1795019858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wuyvace6ciytd5jUR1xreUhLnUkhsuMz/ZH/NBTGYXo=;
        b=xn8AwzU3TQ6nz/O5TcTb9iZmjrVKwHBllFnBpqhm27Rx3P6+Sammv4TlIYYvD24B2Z
         J7d4lj0pNvJvCrapufNTsSX+I+Ty4nqK0to6MgoyT/N0z8USgfWPh2qDQcMXhrtIJKuk
         7lpvORQ7t/Las8J6bjwKrVADCxLS8vZAM0NwIwM+MaZFE23XCR1jdMVjUFQe4zagdxQN
         DD7QFAaTQDdsZNUUAISi/7LX7/8yHplsK+DIGGNZP+weexa+d3UV1rUyipAtkZdvvgp8
         Lnvl1HHy23H/+Bhi4UQINdPalC1XPJs8qLsDGoklgUHoHFZLJXDpqtK0JWcRuGvOqHCE
         Pbzw==
X-Forwarded-Encrypted: i=1; AL+hErGvV2B0758mxwz/06VWrwBo06L0Bj+63LEMBXPFESvZi34ZAhpR/JGp16fr4aIDV9q83Nc=@lists.linux.dev
X-Gm-Message-State: APuU4Z8S5djPCeEuHBuB+HAXC0owbUZViR8urkFgqJC8aaSNFeJTmSWR
	++jefhjXQ2Jko4BhLKoQVPOQww23QH0UBXaO6sHWqU1s0Uhb7LUsPFcl
X-Gm-Gg: AYBFou1QiBRZCYTljuehxLC8qJWUfuK3rvdwf5xfNhFfUfVHY3E9qCT62UYwl8Q5M5q
	HCqOsH5if+iGNZqQQ5IYTtZkomfxVCETtLw4gmhrnmR/trBer31tZm2R4pyiQp6a8cWxLAxmbSs
	+FgU0qEQ2yf2IyTOdi9f1FVOgEoRHRYRF2RAHqrx/aSxP+kOwHZNgBRTToe4JbbtfYTfDo4Jg6l
	Sjn8eY7028jk5wWzrnH7hFr00vkeBzKV5sqX5JRL0/xF85i10IY8kJbDA9QlRUWX80hjEs7vGG2
	cJaGPncrbl1WMiHTSO/Fk7D8UO/OMEnAaLxblbfEF4eK0k+U/45NXF/ngmxLO7i41quPGVpf7q7
	vKbAehos1D8tw51jR+wWsvJvkHmYWs706685iuoJE2bKNoyEc8ZlWgpJOjQTWRT7rPI3gxxyATj
	M2pjeJayMIM5p3OTbKorE4OOOcHB4L5NWSprefb8PAwwTgH2DHQX9N0Qbpgy3yEtDlLMn27rYOg
	rbzVVtMysnUsF6DedR+WSuoKUFI2tHC5Mwe9Mw6QGEc3OlYKumECX7R7iMyAl7pvzsc2/pyuqA1
	kVknQ7D50gUV6ms2QOS1EPA8h80fkqNpuDdRhPpfz9gXzK2CBdDn0kdTLValwRAXh1iq/y+a5AE
	kOGmQqLaB3+e2qg==
X-Received: by 2002:a05:600c:310b:b0:4ba:a5:b920 with SMTP id 5b1f17b1804b1-4ba0936d8dcmr54021965e9.16.1794415057486;
        Wed, 11 Nov 2026 08:37:37 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e258e8dsm825955e9.4.2026.11.11.08.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:37 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 1/7] zorro: warp mfd: add the CS-Lab Warp multifunction parent
Date: Wed, 11 Nov 2026 17:37:28 +0100
Message-ID: <20261111163735.227286-2-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111163735.227286-1-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
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

The Warp 1260 is an A1200 trapdoor accelerator whose single Zorro device
fronts several functions: an ARM co-processor reached through a
dual-port RAM window, and an IDE interface and an RTG display controller
that the 68k drives directly.
pata_cswarp claims the whole device for the IDE window alone, which
leaves no way for anything else on the board to get a driver.

Add a parent that owns the Zorro device and describes the functions as
mfd cells, starting with the IDE window as a "warp-pata" cell.

Only the window layout is described here; the dual-port RAM protocol
arrives with its first user.
pata_cswarp is converted in the next patch.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 MAINTAINERS              |  7 ++++
 drivers/zorro/Kconfig    | 30 ++++++++++++++
 drivers/zorro/Makefile   |  2 +
 drivers/zorro/warp-mfd.c | 89 ++++++++++++++++++++++++++++++++++++++++
 drivers/zorro/warp-mfd.h | 19 +++++++++
 5 files changed, 147 insertions(+)
 create mode 100644 drivers/zorro/warp-mfd.c
 create mode 100644 drivers/zorro/warp-mfd.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..cfabc4609c9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7173,6 +7173,13 @@ L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	tools/crypto/tcrypt/tcrypt_speed_compare.py
 
+CS-LAB WARP MULTIFUNCTION DRIVER
+M:	Paolo Pisati <p.pisati@gmail.com>
+L:	linux-m68k@lists.linux-m68k.org
+S:	Maintained
+F:	drivers/zorro/warp-mfd.c
+F:	drivers/zorro/warp-mfd.h
+
 CS3308 MEDIA DRIVER
 M:	Hans Verkuil <hverkuil@kernel.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/zorro/Kconfig b/drivers/zorro/Kconfig
index 41475ad46e45..c9ab9fb4b9ee 100644
--- a/drivers/zorro/Kconfig
+++ b/drivers/zorro/Kconfig
@@ -17,3 +17,33 @@ config ZORRO_NAMES
 
 	  When in doubt, say Y.
 
+# Zorro multifunction drivers
+
+config WARP_MFD
+	tristate "CS-Lab Warp multifunction driver"
+	depends on ZORRO
+	select MFD_CORE
+	help
+	  The CS-Lab Warp 1260 is an A1200 trapdoor accelerator. Besides the
+	  68060 it carries an FPGA and an ARM co-processor; its control
+	  registers, the dual-port RAM and the IDE interface share one Zorro
+	  device, which this driver binds to.
+
+	  The 68k drives these through the FPGA: the on-board IDE interface and
+	  an RTG display controller.
+
+	  The co-processor owns the rest, reached over the dual-port RAM: two
+	  USB host ports, an SD card slot, an ESP32 WiFi bridge,
+	  an audio mixer, the Kickstart slot selection, the CPU clock and turbo
+	  levels, thermal regulation of the fan, and the board telemetry.
+
+	  This driver hands the IDE window to pata_cswarp - which needs
+	  idemode=native set in Warp Configuration to be of any use - and
+	  exposes the configuration and telemetry reachable over the dual-port
+	  RAM in sysfs: voltages, temperatures, fan, firmware version and
+	  Kickstart slot. Nothing else on the list has a driver yet.
+
+	  If you have a CS-Lab Warp 1260 board, say Y. Otherwise, say N.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called warp-mfd.
diff --git a/drivers/zorro/Makefile b/drivers/zorro/Makefile
index 91ba82e633e7..6fe7cc1822dc 100644
--- a/drivers/zorro/Makefile
+++ b/drivers/zorro/Makefile
@@ -7,6 +7,8 @@ obj-$(CONFIG_ZORRO)	+= zorro.o zorro-driver.o zorro-sysfs.o
 obj-$(CONFIG_PROC_FS)	+= proc.o
 obj-$(CONFIG_ZORRO_NAMES) +=  names.o
 
+obj-$(CONFIG_WARP_MFD) += warp-mfd.o
+
 hostprogs		:= gen-devlist
 
 # Files generated that shall be removed upon make clean
diff --git a/drivers/zorro/warp-mfd.c b/drivers/zorro/warp-mfd.c
new file mode 100644
index 000000000000..94af7c9d0ea5
--- /dev/null
+++ b/drivers/zorro/warp-mfd.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CS-Lab Warp multifunction driver
+ *
+ * Copyright 2026 Paolo Pisati <p.pisati@gmail.com>
+ *
+ * The Warp 1260 is an A1200 trapdoor accelerator made by CS-Lab. Besides the
+ * 68060 it carries an ARM co-processor which owns most of the peripherals,
+ * and the IDE interface and RTG display controller, which the 68k drives
+ * directly.
+ *
+ * This driver claims the Zorro device and hands the IDE window to pata_cswarp
+ * as an mfd cell.
+ */
+
+#include <linux/array_size.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+
+#include <linux/zorro.h>
+
+#include <linux/mfd/core.h>
+
+#include "warp-mfd.h"
+
+static const struct mfd_cell warp_mfd_cells[] = {
+	{
+		.name		= "warp-pata",
+		.num_resources  = 1,
+		.resources	= (const struct resource []) {
+			DEFINE_RES_MEM_NAMED(WARP_OFFSET_ATA, WARP_ATA_SIZE,
+					     "pata"),
+		}
+	}
+};
+
+static int warp_mfd_probe(struct zorro_dev *z,
+			  const struct zorro_device_id *ent)
+{
+	int error;
+
+	dev_info(&z->dev, "Warp at %pR\n", &z->resource);
+
+	error = mfd_add_devices(&z->dev, z->dev.id, warp_mfd_cells,
+				ARRAY_SIZE(warp_mfd_cells), &z->resource,
+				0, NULL);
+	if (error) {
+		dev_err(&z->dev, "mfd_add_devices() failed %d\n", error);
+		return error;
+	}
+	return 0;
+}
+
+static void warp_mfd_remove(struct zorro_dev *z)
+{
+	mfd_remove_devices(&z->dev);
+}
+
+static const struct zorro_device_id warp_mfd_ids[] = {
+	{ .id = ZORRO_PROD_CSLAB_WARP_1260 },
+	{ }
+};
+MODULE_DEVICE_TABLE(zorro, warp_mfd_ids);
+
+static struct zorro_driver warp_mfd_driver = {
+	.name		= "warp-mfd",
+	.id_table	= warp_mfd_ids,
+	.probe		= warp_mfd_probe,
+	.remove		= warp_mfd_remove
+};
+
+static int __init warp_mfd_init(void)
+{
+	return zorro_register_driver(&warp_mfd_driver);
+}
+
+static void __exit warp_mfd_exit(void)
+{
+	zorro_unregister_driver(&warp_mfd_driver);
+}
+
+module_init(warp_mfd_init);
+module_exit(warp_mfd_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Paolo Pisati <p.pisati@gmail.com>");
+MODULE_DESCRIPTION("CS-Lab Warp multifunction driver");
diff --git a/drivers/zorro/warp-mfd.h b/drivers/zorro/warp-mfd.h
new file mode 100644
index 000000000000..3f44f2b57c76
--- /dev/null
+++ b/drivers/zorro/warp-mfd.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * CS-Lab Warp - board window layout
+ *
+ * Copyright 2026 Paolo Pisati <p.pisati@gmail.com>
+ */
+
+#ifndef _WARP_MFD_H
+#define _WARP_MFD_H
+
+/* Offsets from the start of the board's Zorro window. */
+#define WARP_OFFSET_DPREG_CR	0x1000	/* dual-port interrupt control reg */
+#define WARP_OFFSET_DPRAM	0x2000	/* dual-port RAM */
+#define WARP_OFFSET_ATA		0x6000	/* on-board IDE interface */
+
+#define WARP_DPRAM_SIZE		0x2000
+#define WARP_ATA_SIZE		0x1800
+
+#endif /* _WARP_MFD_H */
-- 
2.43.0

