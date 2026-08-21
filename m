Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BFE37A840
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283346; cv=none; b=XSEjLkEAd9of7ZJhE9DOVlB91NifkgXWpCY8nWJzr+xNK/cwa1Lzyfxd9+QifWKPGEi6WM33LmwIXN1ywd0vqSzwm8nIJOQJs4OWte/SctLtRQbcMytfPPGlhGn9Cge2PYNrny3c4STzPsBXD1RGe1NZFfYSydtrOHHdjpnfU+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283346; c=relaxed/simple;
	bh=KWUdr7QjdL/P5FemNe2dO+4gc717FuyqKfmff+EFr0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ff0G1V7JYxRERERtIu0esq9+Ni7NRQC7n7vtlyv1PfPslW/LnlEaPZj7Ci627yiUwyJjBWUMelmxuYqDG1MPBqPQsRjHhbZyxoewOpq2vIQ37JtpqSdJkuUlwG1237NNQUKylZzKKIWdfKoLP51UcExjoAUFUfxxSkvZ3k5a0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQrvk96L; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQrvk96L"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbee3777e1cso313819a12.3
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 20:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283340; x=1787888140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJkZ6RvxbNcjAoli9z1uAOHLN7PuUwcVnyV1b+h3Wd0=;
        b=gQrvk96L3tj5z1QNx+p4fywxUYn2hAaj/85YU2mLFsXObM3RgYzojF1cDlHUkxT0OU
         WEBL2f211FXknlkBYu11urOo7RbBAzYP9d+ivxKrdcalG+G5vzX8GSIHkJTGd51jyOkj
         XH3iEMaepQ7SOinhQf1yDiR9eCEue4dcDgyhWrcPOsJtuO5bcERBNRnsonP+Zx/VHvUz
         UQTR5r0Ojy9mGibDDSdDMpJzYMBuXmtGmLM98KSFvPQqaWc7QiOT3rqU9PQF/tv/qxPo
         QEBOPdmpe4xnkUNuyzzFYtXL9HFZhod3//Gz8+mIZyaAbvqrJe0cPDm3QdIsj/kINDyj
         3pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283340; x=1787888140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJkZ6RvxbNcjAoli9z1uAOHLN7PuUwcVnyV1b+h3Wd0=;
        b=InOXv0rYUHvCJe3NM/jw4sPSivnPwfvfYku1YiB9u2qpIxVUkmnQi4TFCfNs9npsv5
         OlkFhBBCW9ekOlNJfA57lIPIlvMdgGVu6vyS133IVX3EFZ1kOIcoffE9x0HEEzEgcbej
         n+ZuqfRJcdd22c9BsoooLkd0Xmj/7SEUkQO42dBgtZYfONV/8scWAEInZW1FNDijOdXz
         hB5CNW3xSqE6/WaGB+bwaCQxza9dt3Q1ELwFRAXiyirGiQuqHbpCDxh+0nWMADMfCVGw
         JR6/yNKnqBoKFVmZwDbaNcca/MamuG89qDdzLlcHGoew/ePHmzycz55tw7Pm8/CjVeyv
         B/7w==
X-Forwarded-Encrypted: i=1; AHgh+RpqDUmU+iy0dFEafv+YJdALjsEKbQCg7eBoQkIuPXDm5R67eevxzYv5y1xikjpv2oPMRHM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7bv4oS1QjkPkLR9rYiUrF0hY8jtZR+uu72YQuSsxth0siZq9R
	5FKD5I+9y/v/f89N82gxUOjRRrJBI6Px+Pdw8707ra8ZqDzbNCXNcYtbMzKgUw==
X-Gm-Gg: AR+sD10CnLi8jxExaeJw37VKCMFcp6ubr6XNw8rAjNs0HSmmxLLlsK0pmXjtque3QhY
	8MbXLlupr+txYNEZDqF2qkhMzSieWdYjoJz9jTngyBxp0KrxPx2vD/0xj/dy8LM4/9nyOvZvvvR
	60J0Dezz//g9ysClos9xu3ruRoSce1WCCGE7B+EkzqS1sXeH9Xc9u8zSc5dtbibqei9y4w0vP1u
	egCRo0IpGt8hVBVAU8pUxObGQ1MlCgIzTrWqvaSiOhr66EkM8r0y3JHwTBStocymrgxaamsCDFV
	TYKsPvqK2qtM5u76PBYfZdXVq2l+voQQx+YjoCvX/LukqtLs7Tg7p0bNQCeTNdsho5a2QA+6ffp
	hGNXvrVknuDR0zYZKEs0Gp0iNj6W9klZ1ZVCH3cUER6cp5/pzz9gvkmcUOavpwrULCx3oaFj8cC
	cjJl5AJ8BEqaC0CBmX1c0tlG1GZJriD3cLnh4md2zfxXNn114FG8R8syZk510hojxUoaD93UMq/
	OgxSiSwOLLZ2yo7IIL0UM9d5JS7cb4=
X-Received: by 2002:a05:6a20:b7aa:b0:3cb:c1f8:5722 with SMTP id adf61e73a8af0-3cd3007cfb5mr5560517637.10.1787283340537;
        Thu, 20 Aug 2026 20:35:40 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15891a04csm2204271a12.15.2026.08.20.20.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:35:40 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v7 07/10] mfd: nct6694: Validate the interrupt IN endpoint
Date: Fri, 21 Aug 2026 11:35:02 +0800
Message-Id: <20260821033505.4017901-8-a0282524688@gmail.com>
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

The probe reads endpoint[0] of the current altsetting without checking
that the interface actually describes any endpoint. A device reporting
zero endpoints makes the driver read past the endpoint array.

Locate the interrupt IN endpoint with usb_find_int_in_endpoint(), which
validates the descriptor before it is used.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v7:
- New patch. Fixes the out-of-bounds endpoint access reported on v6
  patch 6/7.

 drivers/mfd/nct6694-usb.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
index 793ce54c02aa..c8667984df5e 100644
--- a/drivers/mfd/nct6694-usb.c
+++ b/drivers/mfd/nct6694-usb.c
@@ -266,7 +266,6 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 {
 	struct usb_device *udev = interface_to_usbdev(iface);
 	struct usb_endpoint_descriptor *int_endpoint;
-	struct usb_host_interface *interface;
 	struct device *dev = &iface->dev;
 	struct nct6694_usb_data *udata;
 	struct nct6694 *nct6694;
@@ -305,13 +304,9 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	if (ret)
 		goto err_urb;
 
-	interface = iface->cur_altsetting;
-
-	int_endpoint = &interface->endpoint[0].desc;
-	if (!usb_endpoint_is_int_in(int_endpoint)) {
-		ret = -ENODEV;
+	ret = usb_find_int_in_endpoint(iface->cur_altsetting, &int_endpoint);
+	if (ret)
 		goto err_urb;
-	}
 
 	usb_fill_int_urb(udata->int_in_urb, udev, usb_rcvintpipe(udev, NCT6694_INT_IN_EP),
 			 udata->int_buffer, sizeof(*udata->int_buffer), nct6694_usb_int_callback,
-- 
2.34.1

