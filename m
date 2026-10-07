Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C274772B9
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364919; cv=none; b=cKt2EDbNZrNMf4A1uiijdAFIsNgXWZoO4TXfgy2S4s6n1XL4jWVDK1AsHCUlq28A5PxuOxRZRQQksn20NYnXVgWIOJ1Y05vOXmc6iUh1JQFtevCuhpxsjytdxh/PoI8M6JJd069rofJ+cvIq7ElFOLsE7b+tWIBwgAyZnjWmNAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364919; c=relaxed/simple;
	bh=+Ju91HUYCrAJkLFhcR6F8nncRnW05DqCyv+NaE3hbFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GOQSTHSp1OAcm6I444Gnf9gI6fwSgt+E0q07R+AL2iaPrrrJhq99tI5BskwPJtJebZ7ni9ktOqgIqBQEXy5lkoWt0zXLqvK9zZvVuVJgTtWZmXN26ECbAMpvgm9t9DoF62j/ih32IispkUOe0rwry0Kxt0D24QJ3QThlJ7IBBTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHE1RE+n; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHE1RE+n"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so9822455ad.1
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364885; x=1791969685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuYCd8BtK0Pu5eXwDtQHw6mxURWuNtr5LMlu4gmWNag=;
        b=sHE1RE+neysB2brTsnnjialYAB5+BmHW3RRmkmSSdn7KJOkS/Ky4negkh+fyHnA+Pc
         Ma6cKoFX6B/vXGXDQrgeHOg71veXq+njGR5n7/9+RcW8VSwW27mQom7MCeYvAhQk/IYt
         9rixWuM4NNsM6X8M+nf6YL2ydho4gz9FbBYpgV2j9S4RcM0ysMc4SZDmS+hA0xkcfcFG
         +fJpTl3+Nbc5ohQvoGRbTz1JyBYtqBhke40BGk6+5eRemitaodYPZOl16fe/7GpHP1sC
         uKqFx33jq+OBdvnuAOi/5e49mNNTm8dELNDwQKMktgeKC1el/PBq2oN10icZ0adSF4d2
         p50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364885; x=1791969685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TuYCd8BtK0Pu5eXwDtQHw6mxURWuNtr5LMlu4gmWNag=;
        b=2hqcUgCH8RXmYaad51SORqMi6N0i488i4XiUmRhxA/YX0VMJjxccpo0ugyLtr6bIQd
         ZQDBXlzerSj4KGNbISi8TKZaQhTEp4aBerZm25pBQJn2h6BLm4Z/8a4J4j50GsHeSUxb
         XkxJosS2PPomQ05AgNODsa/yiYMoKDd7+yoIoUhiAK4Af/cyZyVz47uySL5gKnWgqFqV
         GBF6dKPsu8kk3p/KVWAvumnvuxGiB3P9+C/S+75Xsl9wj5XddsDU9v27kUl6g0PFSSUn
         wDNG7qIYRJ/DDyvst+bgNHLHKR5daCf9/pOREn9uqP58Jugp7JCAi1nUFsz0qh1XSOll
         I1mQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzrF2NGs6me9jbVE48qmhHppUAcgYlZVluPbw9I40axUp1IeILyzKjMRAYd80jFcaWnSU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLhiVCVDQdjUjlRfxPC1yWtoawUs4zzzv/I+iKdQmJkL4646vn+
	2i4Xqq2F+k4WdbcbkywSYvuCB7U7qYPcR4hlmo87qmN/D0rN5Su8lCHA
X-Gm-Gg: AYBFou2Dtm20m331+5QvfU65b9xzWoc69EQe0kv7NaGE804Y2aATG1LpPjgGrpf/HB4
	vtC1Fa7uvXxmhiZW2oQ4yGhifl5G0THsdA+nFfJy07L7QV1w27465hk848R19pw4/0FOxthkbWg
	x+b1dD2oAONXi0KqFNa1ETf7LbEFCkzgnEAk846VbT31uoem8QA+YP3wEAeVn2MXvY8+zce53bW
	RQBGoyc0CLdttdfH+0ozVGz5lYqHZbtl6HbTs9W+Sf0CWlYzXDsAI1h0vtll++rj62wsokysas/
	EPff2kUjraIWOs0wZ5IrB7rVkxfa5SI4m/xFeEbJLfRJxLOuhWSM8TCTV29qhK15r368Fv1g8G0
	smBeQ7ICLJPRe742MROZVV9DFusA9AH1JBHaD5ohiSUZOPEheGzR+B/HrAF7AMdcCzVSqKhrBsL
	4uq8Xz8R6Yce8QE5cfpVTgFE9LPhuUEEvw8vUolHpykn92/BrTwLJFSExqdwRTNPUkWH+oKw3ZS
	Ne2uAjyC7Dci5+rYxMg2nC88XND94COQ2SRorqd
X-Received: by 2002:a17:902:ea0b:b0:2df:8ff9:5160 with SMTP id d9443c01a7336-2e6005633d5mr12205635ad.34.1791364885451;
        Wed, 07 Oct 2026 02:21:25 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:24 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 02/13] mfd: nct6694: Validate the USB endpoints
Date: Wed,  7 Oct 2026 17:20:51 +0800
Message-Id: <20261007092102.3768818-3-a0282524688@gmail.com>
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

The probe reads endpoint[0] of the current altsetting without checking
that the interface describes any endpoint, and the bulk endpoints used
for the command transfers are never validated. A malformed device can
make the driver read past the endpoint array or submit URBs to
endpoints of the wrong type.

The interface exposes several interrupt and bulk endpoints, of which
only EP1 IN, EP2 IN and EP3 OUT carry the command interface, so the
endpoints cannot be looked up by type. Check that the expected
endpoints are present with usb_check_{bulk,int}_endpoints(), and take
the polling interval from the interrupt endpoint actually used.

Define the interrupt endpoint by its number, like the bulk endpoints,
as the pipe macros expect an endpoint number rather than an address.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- Also validate the bulk endpoints. Keep the fixed endpoint numbers and
  check them with usb_check_{bulk,int}_endpoints() instead of looking
  up the first endpoint of each type, as the interface exposes several
  interrupt and bulk endpoints.
- Take the polling interval from the interrupt endpoint actually used,
  and define it by its number like the bulk endpoints.

Changes in v7:
- New patch.

 drivers/mfd/nct6694.c       | 29 +++++++++++++++++------------
 include/linux/mfd/nct6694.h |  2 +-
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 308b2fda3055..b9526b22754c 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -273,13 +273,25 @@ static const struct irq_domain_ops nct6694_irq_domain_ops = {
 static int nct6694_usb_probe(struct usb_interface *iface,
 			     const struct usb_device_id *id)
 {
+	static const u8 bulk_ep_addr[] = {
+		USB_DIR_IN | NCT6694_BULK_IN_EP,
+		USB_DIR_OUT | NCT6694_BULK_OUT_EP,
+		0
+	};
+	static const u8 int_ep_addr[] = {
+		USB_DIR_IN | NCT6694_INT_IN_EP,
+		0
+	};
 	struct usb_device *udev = interface_to_usbdev(iface);
-	struct usb_endpoint_descriptor *int_endpoint;
-	struct usb_host_interface *interface;
 	struct device *dev = &iface->dev;
 	struct nct6694 *nct6694;
+	unsigned int int_pipe;
 	int ret;
 
+	if (!usb_check_bulk_endpoints(iface, bulk_ep_addr) ||
+	    !usb_check_int_endpoints(iface, int_ep_addr))
+		return -ENODEV;
+
 	nct6694 = devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
 	if (!nct6694)
 		return -ENOMEM;
@@ -318,17 +330,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	if (ret)
 		goto err_ida;
 
-	interface = iface->cur_altsetting;
-
-	int_endpoint = &interface->endpoint[0].desc;
-	if (!usb_endpoint_is_int_in(int_endpoint)) {
-		ret = -ENODEV;
-		goto err_ida;
-	}
-
-	usb_fill_int_urb(nct6694->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
+	int_pipe = usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
+	usb_fill_int_urb(nct6694->int_in_urb, udev, int_pipe,
 			 nct6694->int_buffer, sizeof(*nct6694->int_buffer), usb_int_callback,
-			 nct6694, int_endpoint->bInterval);
+			 nct6694, usb_pipe_endpoint(udev, int_pipe)->desc.bInterval);
 
 	ret = usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
 	if (ret)
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 6eb9be2cd4a0..a5ad7be47bf9 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -10,7 +10,7 @@
 
 #define NCT6694_VENDOR_ID	0x0416
 #define NCT6694_PRODUCT_ID	0x200B
-#define NCT6694_INT_IN_EP	0x81
+#define NCT6694_INT_IN_EP	0x01
 #define NCT6694_BULK_IN_EP	0x02
 #define NCT6694_BULK_OUT_EP	0x03
 
-- 
2.34.1

