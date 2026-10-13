Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0814B4872
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873224; cv=none; b=dZ0Jto20rZ8QOt3kEGTEI8Qqn7AuUHvqHTdNHI9L18PPaQR1CT0ir7N+47nWwzn3yUp/HaVg2JOm272cA+vDJckS4FlU9k5zd/puhQneH1t5NONSi1E4+eVmAkFSP2VHjkoBdxlbH3HbjguWFqcWXMrjRbWmubrIpBKsc4olH6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873224; c=relaxed/simple;
	bh=VIsUhK5OkSROG5eFSvmZnb/wTuPuytrUiH5wxuWr8Wc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wu1lZLeajLBjrJBlLuGvAnjC8SZU6T/Q/xBhzwkLhy7CueCac2ifvy52zdLlzrZur5hwQ662OB7bGXCDeGQxiIjYTq+tkTDlTn1Lt5XpULR6f5b/wutyhWTfdgzzvm/o9OUrydAPJtUYWgoFh2P5wW1ChJdRDklObDGWYMv0QzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRd/CPRs; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRd/CPRs"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab33730821so1424125a91.3
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873222; x=1792478022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhwyrLo3nugAHu+/mjnfuhNK77ERkWaoh4yz+8v/dy0=;
        b=JRd/CPRshMSVnbBjZin1rsL1ihZbo433q4rgEry9Yj9vOgQjfNz3Ucl1dtzv1gf8rE
         S+51CPBJT8sVOJr2SgXBzCmtFraOOw+9S9DL0xgcpshrAbAhKZHegF8R4+B9tv+tRvOi
         54AvT7w2ZXyXfB30AVg0kqcuM9vf/0i1oREcqBq/gjbnW7dotMwNHQqrg7ZKBK/CApM4
         Odv8pgcP7Q/0vnk+pqSTbuHH00ce8EA/Hs13pRl8butkqw5ot8nbYar8mdebRaJuvsWc
         djHKlfiVuOHd+Yr0hIl4zy/cCdqFfiOKm2Q6CK8ww+7sPHqcfK+j+gAzwa8Avs3uGXTn
         4hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873222; x=1792478022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vhwyrLo3nugAHu+/mjnfuhNK77ERkWaoh4yz+8v/dy0=;
        b=MezCmF2xxnZAcWQnlkLJqAwRXPOV1ZGzIFpFIhS8leuIZjJwYBMOMaIuk50hh3Wos1
         Qu2p20JoxyAAtfCyZ8canbpXGjODrtOmjO/iKHlZXlQFjgRuUBsxCB1jpL3rSktHYTEt
         MDrcv1F9YPkqEEfu4K6ce9cTuEExnVk4ruGHHWNP/6b1gBAZaQEHaqp/Zsh+X/xHDaze
         akMt3paZ+HB2j/7HOhEy1p8+KRM98A879cXs09JEI7749p027nNtB5RWA3Jbws7ROGpA
         +YuwCzNfmLkM7rkE0PluQ8egoxBoAMPuVW34UybRXJLjPtQlfQlsgaMISYclHKbIh7Wu
         lLYw==
X-Forwarded-Encrypted: i=1; AKwUvBwWVqnhWvLnaRWz+IK2A8x8hCUjFp80L94IeU1syUKr1BvlzWjMt0asfR9us5ybjquOxwk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLY8aG+q2Wmuwvi/YEStJKZxEH8suaSRCvm4ynhV5usbzoO/L/4
	a5kKtXrEKaYzBwf/oR6zlDetzLIFUZuaQgDZeyGYre2CYAD0j9K2GqlV
X-Gm-Gg: AYBFou0n/90gsXQtJ9py6YLfDQJ+za5/hEymH6U9XRGqex4yESqwDEbrU5HrJn+r2ge
	FdkMmtwlwr73wDKG6kE/zRDEwSi8ycPQcF7A0lWQpjXN5F/E6scIWkb7HlnduZZpzCS2mWCweMZ
	8CujGLT3TMUkM8YXWBpv9q0bI7EN9v1pP8WL1ryhdEFtp8NSPZBScOLKzODFSL2BkS29whYGW4N
	/nrFBnAkYYUJ0o+xsegUylM6ckArOC9I+kvY1ejoB05EZgZ2JIG9xKaOvllDtpmxpgXXvUUvh+w
	7Eq0B03Mw+eSZ1tm09HA7HE1W+0+JmNg0scmmvopwa3MondV9eNlhI434XsbDjYmVg0o4V7r/Vh
	URSHZOwGvj+CADyPbkxYrZ5q2fYfdH0zkJkB3dPrfbOcyYYj+bIJ9ZCIWel+y0vPVofwwwJfGSi
	4TGR+QS96xBGLr/x5pRJR0GxYv4iiOHiLyJovLjrtn2dIvPSCYl/xjX/rTdGqkPWkQPuLrO8v9f
	z9jfTxFbJGFZ2lnQYIyjeVCI7G+5tdBYf4du1hJ
X-Received: by 2002:a17:90b:2e8c:b0:3ab:1e1c:837b with SMTP id 98e67ed59e1d1-3ab3a9183b3mr10030590a91.63.1791873221997;
        Mon, 12 Oct 2026 23:33:41 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:41 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 01/12] mfd: nct6694: Validate the USB endpoints
Date: Tue, 13 Oct 2026 14:32:47 +0800
Message-Id: <20261013063259.2734757-2-a0282524688@gmail.com>
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

