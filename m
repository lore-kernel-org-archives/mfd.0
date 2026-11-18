Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989800;
	b=knV5dieaXHrftC4LOthdlN5EgoDwmyUrzAKMB64MGOKjrbWV1hRIQRRIt1F4r5cF4BaY
	 6hm720nptcze2Umw1lszmFDhQCaRqD4ooDPtoD33pcWE9gMkBVCbxCxaULBoBhZ0mKoTo
	 NKHIcAWHIsuMFxXpHOQTIQ1HCENbLZ5nczENEfLufx78DO3EW5a9HFl7tzVJhpQqT2GMr
	 lG9bmkjYXaoKijq21UkLE5TbCuel/TK1AAGTalrsH2WN2DAdt1ZRE8qug6/9onkX3M99r
	 LMqVT+oIK9hdjPBbIxAdO0I/xedfr9oPM/diWE9oEc+LYrS68Bn9ANZZrztdWvBCYZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zs+S5yUZxI5UJIwT47i1hdYSehc6gDMi64/ByZlpHWk=;
	b=ZRJYm/+vv7TKsEL2u41WNIaf2wiaAd+ynz71s7XyCjEFxnkPhLkMMbAyJtfqcm35iLC2
	 mDHQF7LggaTOjsziPQswJeisz/TVQXaRUFQFPv8eSp/iwJUdR7G9lE/bmmuINOtZIlVZB
	 qfUttp4KxcDGjKtgSP/N5D+8AV41I/KnjLORgOUOmUI0XT6NVxIw+P2ZrTZsqJfeuzNrl
	 G/NSR7Ji6+WfBfPQ6Ca1ShGnFpqb08JyqPOUfdslbfx74dYbX0sgg6D533GD4zFjcdm5j
	 UsWx8EMzB3L93ktHKoYq5zrSCryC4C36AeCc/s/N8czuJjaT4FeIlMO/d/01qy9LCDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fsi7/5kK";
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10157606A891
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10157606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fsi7/5kK
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b600fae14dso330763b3a.2
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989799; x=1795594599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zs+S5yUZxI5UJIwT47i1hdYSehc6gDMi64/ByZlpHWk=;
        b=fsi7/5kKQkHZAZRDITEZURIVLqOKIm+DP1mXGbs65g2mvmyro5zxfEli9md+4IZuKZ
         mc4hoBcBvxWUqnKhYFDOmWdl5z/9edOnEfW4UV5TOx0Xglervcvazz9y2Z95BFLgXdsT
         Elw0DTEu3xquDO2gcJuYNpbgM2AiyXmowCiIWY8jXQ3Qy00Az0K6bMld7N8lpIWLkpsV
         I03lG6rCT+8GKgoHKXshBuXkmlSuY9Ngsl6JvnlM7qE9NoboXVaZCY7FtTzo6qdD9i/B
         vy/rnrM5pTVV3fByTImJBp5R6SRH3UttaQm0MOk9QBvAJYApBvtld7pHY1FxTCP/6/T9
         Krqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989799; x=1795594599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zs+S5yUZxI5UJIwT47i1hdYSehc6gDMi64/ByZlpHWk=;
        b=wv27SIFynWTXqbj03tQ20ZrB/1ioVgdFrkb8ukOpNoLn/w18mknF/NxkC09dfxvkwx
         vKJ+sakKFTfdvkwfXYUrD5Z7Tsx4jj/wRpjepv6wSLY1gmknwjiMMSQ1KLs6KqJH9CpE
         G5GJcD5Y+gwvhk2+mjDL2ENl/rG2VNVXlK08Rb3vbZSxTj/O12hNgYnRAXiCJ5fOtfXh
         +jRiGNNkX5Yl7jgT1cnEchRI7u1GNVhTo1pojyc4chdCnFdJgy4ivN9IhTeAbbp1YFeP
         HH+1RjHcueDooXiE/d9NneW90T1rjJX3he4WJNjiLY0nMLvHW48LhynFmhMuOpGxptNc
         IlpA==
X-Forwarded-Encrypted: i=1; AL+hErEQ0hOQFHkMquJa1m9c5uWgE/qpm0lf5k9O3UUZSqHxrd7saKA8JAdh8TjIz+xo2mgHhTs=@lists.linux.dev
X-Gm-Message-State: APuU4Z9q3XlY6gCYgkFK/icqRbomqtqlZI5qhqYNDgWErTj6F0k/uryp
	e7AgUXhpd0/l4PE9W5YHHWRes1AZnhMq4zauSI0mUYnF0DUjH324pMYs
X-Gm-Gg: AYBFou3Y+hgLqhdsHUTmZ7hAyEO2PHR8wpCosQqeHuGssP4MW2enrswdHFs+4c8KV4N
	cz5kNETx0+sbsrdao/yYLTMpZgwlLWMp8YCrpgXgzsfjuR+iWO2Anr/dnCGw9d3wmAVLVhq4s8q
	YQXYfKExtCx5r2w68QxWnEusamG6mOIG55pBGsFKAR2I/HhNg+hKdG7WNM0WVDGFpPX9j0Hk/DC
	phBdAMxrQC0IlsSMXPqLOiKyz/FKcuhD5WqQOWgEsXJGUEQdWUGuI5/srTprN40z4Igu7b0HD0e
	M6vJ+ir50Cs56zD/ChNZJJASMv+UwgPlg5gWYv7thnBberm8r8w4NxvXCd53W/sJ2XSeC3Ys0Rv
	lrym8JT8wE5Qkgng+mMYAE6vy0KkzdOiFimCj6irzYZoV8gimNc6LQpNuDoaKQgpa2VxFLrXkdV
	4g7f4eCQW6vN0SZLPy3ZKbSUj0kCvLPryg9NxMXTuAt6pjbmRtyX5COX/8VQLr1EMwo09Jbten2
	mAJ2/3NBTG4AYtdotsLdt8VgASGr4bqSd6R/FJ+PdLKIDOZGhLh4hGOSY1MFUGnh/BJ/hI5qoPM
	RNScKbCx3dTYKciMlTbf06V/61edfXLFCDilr/VjMnU1HrLQRRwMk2s2ppmY/rGFjJCHbkLcrFz
	33vg5RfZthyoP8t9g
X-Received: by 2002:a05:6a20:5491:b0:3f9:3f64:9b99 with SMTP id adf61e73a8af0-3fe97ff1704mr1784713637.58.1794989799379;
        Wed, 18 Nov 2026 00:16:39 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:38 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 01/13] mfd: nct6694: Validate the USB endpoints
Date: Wed, 18 Nov 2026 16:16:12 +0800
Message-Id: <20261118081625.2399247-2-a0282524688@gmail.com>
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
Changes in v10:
- Rebased on the current mainline, which allocates with
  devm_kzalloc_obj().

Changes in v9:
- None.

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
index dabd83b9d455..b7088b2850f7 100644
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
 	nct6694 = devm_kzalloc_obj(dev, *nct6694);
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

