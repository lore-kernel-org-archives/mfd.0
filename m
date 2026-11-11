Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415061;
	b=TdjX3kOtgYVl3lTP9ZFndtpe1E9+vrYodl+g1y4rPJZVirGmqiu8W1XwkxN+g71Psgnq
	 7fh3F9h6lEHkTyZHElqCGH8P+A0lQJ7ZGRtv8XUvFluPdYFwJ/qjtkvJELc6kQDmrqnCc
	 OX9J1rI9I/Ppt/Q1CmOQ6R90HQSqptZT4o1X5A65yj49LpZqUycXynJ7N0N2Z6j7XEfHJ
	 I7ErrlznhWldjPMrObB5TIEBZzAEGqNDfvmCazBvHjT1ZOvhKO7X0zsiwVNumAYeZa0mq
	 5Cq67BpO9JOdlKz7TYgMEOltKe8UGrbZcQDpv4jpGl2a58Nvvn8ou4ML4jQZugJiSvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KXjsm9ORz3HR//q2A0kstQ3Pi4RAW90rgXKjKRzFtHY=;
	b=ItxF5rON16uE6R3hIqDgfXA+ZPLTD8DOJMoXsPlw3TOo5lXUy59uQXTRrmuCzmz+UEXp
	 8lgDawB8l10ElNq9c4HntMqreZKwq4f+qad6X3GelpBMWfFsOMGqygH9OeiVjRzReam8u
	 UOX1iUPUrxSfE3+fA0iyzSIblDhqHVgBOZJZkin69aeU+slH9lOlIBJaL/mgbFBRbhoQm
	 cn+J3oAoQz+NHBJcB0BhNWUvhrhjykgHKHXWr8iZ9NyUaFFKE9mv+hpspTq6s677T1gQI
	 3hs4oHMLYxXimx2tzDyDd3RJYtvSgpGZFuvQoIJuXG+c6kO4QALBqK8QxxmLYR77GFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SY24ns07;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21390606A887
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 16:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21390606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SY24ns07
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2242916f8f.3
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 08:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415059; x=1795019859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXjsm9ORz3HR//q2A0kstQ3Pi4RAW90rgXKjKRzFtHY=;
        b=SY24ns07qYbPas+KohXiWTbASdy9hnTzxRQjH7biECqa4BJpAgYotE9J1MyCF6FL8O
         i9r6L4zxrU1FlTQtPQtTlTdr3kqu/wDMDBu0liO5wxD9Z/vlt701HwesfTjzvRDffqBO
         pxOepUGao6OtSexieAebMvEMKD7QnmCQZ83e3p3i+kljLbqIprjd6ZOh7Y5rnB4ptb5X
         SCmk2UJl0H3YoP2yDk2bdHXGUTtihs6t5EMUd40LEhDdD0sv2d9oxMD2LrJI6WWemWti
         0YNUDIHW3PJNInLAWcyY4cyOz3rnjUdEhLjn2YefgABNGPOXtdg5PH+SpkQC7CCqAlKp
         JeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415059; x=1795019859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXjsm9ORz3HR//q2A0kstQ3Pi4RAW90rgXKjKRzFtHY=;
        b=0O46fLq0Um58r45IF6A/ZHMMsFWdCIpmrDZl9dXrLZRy9KpAZ3d7H3z+NrWRNgcPDS
         79DGvLAyo+uh8peg7BBRrmDuH13n2QPemLK6sFneUMEuPth/k8HSRR/Kzpr/Rfi6fuFO
         B7B3uw/B0ftVAcyn0tGJO/0Zbm5MjOur7lZ0X4kwKAlTLqRUtTtR0Q5FR94lKUyioQh7
         VgOWzuBlV97dkEJVFM21gL/xa5TwhVEfJ9MRYS5L7z2qHA0pav3My/QpSS2lxgC4Vqjf
         soJfkA9qPO4UhqyEVp44ZArwptbdOuqTgDrdnJOQ2m98DuCi6U/NdUlT/5GfMvQHxjj+
         RJSQ==
X-Forwarded-Encrypted: i=1; AL+hErHsRAB16DjnKOCmVIiaf5e1FH+kgZL7gTv4IHyD0werQzZx5qNW7WO+9pxrl1rMn/ODGlo=@lists.linux.dev
X-Gm-Message-State: APuU4Z8hc37f/h4A8DsPaHJw9YnAFhpK839zWqXzHm7KZEnHeS6WxhCp
	z0MDVRmmbKQYhGNuKibIVu+SP7sBxvdWgTstt3nYAL5Toqhv7jIVX6Zk
X-Gm-Gg: AYBFou2SrC0UsdAgh2+xngAOMOYcpjTuVmF3KUszqRAdgruuop4KJyQQZZ2ywS3DIUW
	EyEjpyV/KRHNUaXvHEUJ+ar5098Ypd69nTHjWBwKH0VBDPzKu3Rr2FTlM857GGGsIGCbjFHpQbj
	plcztR+XNwqIHitHIPwgKivuItyyEiT99IeyrF3JxesEx2c3Yi51aVln4TrZL1Izbw8RJB6KuRu
	Rdi7dyLK67a8VqZn9Eg0OVogkktu8EHewfHrhpUSbL/qbUcdW9pfO/FOV0fuEMr8lpp6AcHm0Rw
	MNHPOAoCDgapIjyGfKR1X0zU+0mXBUHmd/93HPmgrPFbBGqjXq3gTu6I6RlpHLoR5227VPgfBLf
	bVHKUDMt0q7iMlbNvcJqM4mwVbOTgWvLWe6yCDgxFq/moCaXPJ6eJCLsKEMOLcURTmU41wmZ/u1
	tY/3xvEO2pylnkb4fjV/oeqQc2twK6Z46dAdujLndOZO6lH9CgaF582J1avy9jIxHzWb8gU5puQ
	owDNrvW1zgJ9v2ypP3WBn2QAu9gW2B9LJUzvxnjXsVVqdlneu1T71sjbRHxBSvvxlNiOpI/a6e0
	CFtZ3iKsZIfgENDNl9aYqRJVUjeqs/eJs9teDxbgvtxNwWgrEtBzfKISFs70DC+uGz5zgXQkvtd
	SG6fx+5fuQ/Ea
X-Received: by 2002:a05:6000:18a9:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-499c6f8db6cmr5151187f8f.24.1794415059075;
        Wed, 11 Nov 2026 08:37:39 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:6e81:13fe:ca06:8db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm11895837f8f.22.2026.11.11.08.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:37:38 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev
Subject: [PATCH v1 2/7] ata: pata_cswarp: bind to the Warp mfd cell instead of the Zorro device
Date: Wed, 11 Nov 2026 17:37:29 +0100
Message-ID: <20261111163735.227286-3-p.pisati@gmail.com>
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

Now that warp-mfd owns the device and hands the window out as the
"warp-pata" cell, take it from there.

PATA_CSWARP depends on WARP_MFD from here on.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/ata/Kconfig       |  2 +-
 drivers/ata/pata_cswarp.c | 48 ++++++++++++++-------------------------
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 9704ed688775..407b79bf9405 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -1035,7 +1035,7 @@ config PATA_GAYLE
 
 config PATA_CSWARP
 	tristate "Amiga CS Warp PATA support"
-	depends on M68K && AMIGA && ZORRO
+	depends on WARP_MFD
 	help
 	  This option enables support for the on-board IDE interface on
 	  CS-Lab Warp Expansion Card (NOTE that idemode=native has to be
diff --git a/drivers/ata/pata_cswarp.c b/drivers/ata/pata_cswarp.c
index 58fe6d0012dc..41b4c93052cf 100644
--- a/drivers/ata/pata_cswarp.c
+++ b/drivers/ata/pata_cswarp.c
@@ -14,14 +14,12 @@
 #include <linux/ata.h>
 #include <linux/blkdev.h>
 #include <linux/delay.h>
-#include <linux/device-id/zorro.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/libata.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/zorro.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_host.h>
 
@@ -32,8 +30,6 @@
 
 #define DRV_NAME "pata_cswarp"
 
-#define WARP_OFFSET_ATA         0x6000
-
 static const struct scsi_host_template pata_cswarp_sht = {
 	ATA_PIO_SHT(DRV_NAME),
 };
@@ -92,33 +88,27 @@ static struct ata_port_operations pata_cswarp_ops = {
 	.set_mode	= pata_cswarp_set_mode,
 };
 
-static int pata_cswarp_probe(struct zorro_dev *z,
-			     const struct zorro_device_id *ent)
+static int pata_cswarp_probe(struct platform_device *pdev)
 {
 	static const char board_name[] = "csWarp";
 	struct ata_host *host;
 	struct ata_port *ap;
 	struct resource *res;
 	void __iomem *base;
-	unsigned long board = z->resource.start;
 
-	dev_info(&z->dev, "%s IDE controller (board: 0x%lx)\n", board_name,
-		 board);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pata");
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	res = devm_request_mem_region(&z->dev, board + WARP_OFFSET_ATA, 0x1800,
-				      DRV_NAME);
-	if (!res)
-		return -ENXIO;
+	dev_info(&pdev->dev, "%s IDE controller (board: %pR)\n", board_name,
+		 res);
 
-	host = ata_host_alloc(&z->dev, 1);
+	host = ata_host_alloc(&pdev->dev, 1);
 	if (!host)
 		return -ENXIO;
 
 	ap = host->ports[0];
-	base = devm_ioremap(&z->dev, board + WARP_OFFSET_ATA, 0x1800);
-	if (!base)
-		return -ENOMEM;
-
 	ap->ops = &pata_cswarp_ops;
 
 	ap->pio_mask = ATA_PIO4;
@@ -145,34 +135,29 @@ static int pata_cswarp_probe(struct zorro_dev *z,
 			  IRQF_SHARED, &pata_cswarp_sht);
 }
 
-static void pata_cswarp_remove(struct zorro_dev *z)
+static void pata_cswarp_remove(struct platform_device *pdev)
 {
-	struct ata_host *host = dev_get_drvdata(&z->dev);
+	struct ata_host *host = dev_get_drvdata(&pdev->dev);
 
 	ata_host_detach(host);
 }
 
-static const struct zorro_device_id pata_cswarp_zorro_tbl[] = {
-	{ .id = ZORRO_PROD_CSLAB_WARP_1260 },
-	{ }
-};
-MODULE_DEVICE_TABLE(zorro, pata_cswarp_zorro_tbl);
-
-static struct zorro_driver pata_cswarp_driver = {
-	.name           = "pata_cswarp",
-	.id_table       = pata_cswarp_zorro_tbl,
+static struct platform_driver pata_cswarp_driver = {
+	.driver = {
+		.name	= "warp-pata",
+	},
 	.probe          = pata_cswarp_probe,
 	.remove         = pata_cswarp_remove,
 };
 
 static int __init pata_cswarp_init(void)
 {
-	return zorro_register_driver(&pata_cswarp_driver);
+	return platform_driver_register(&pata_cswarp_driver);
 }
 
 static void __exit pata_cswarp_unregister(void)
 {
-	zorro_unregister_driver(&pata_cswarp_driver);
+	platform_driver_unregister(&pata_cswarp_driver);
 }
 
 module_init(pata_cswarp_init);
@@ -181,3 +166,4 @@ module_exit(pata_cswarp_unregister);
 MODULE_AUTHOR("Andrzej Rogozynski");
 MODULE_DESCRIPTION("low-level driver for CSWarp PATA");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:warp-pata");
-- 
2.43.0

