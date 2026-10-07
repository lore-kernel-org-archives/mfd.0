Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A8E3F39D8
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364951; cv=none; b=R48D+MHotEScKUZML3gApXgZ3hkUIJY8pmN1HH8VemeY79zwwVopn3X4hISyHIhx3Ijzzm2tUGCWFj2XWSrMDHry1eQEiQEu5aUb6kdVRh0MsKw27sSOAL+P8k6+lEfDxjZmNvMCCppkM3eVmaBBvUB7roBO0gjvG9G7VbhYFqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364951; c=relaxed/simple;
	bh=RWd0CWGVolWgNflT2TfbDNl1hJPYoD5qLghZYbWezPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OQs7fqs4V8gt8ZjMF7uSFc+zGz0+ADfEfbQSzF1YfWK19EUkn45M7s801c0Hk1xvAihIfqrd6AbnIMvGpO7ClqSUyqjGR9KOKWvezhPScJ6mmEKn5dP6bMerqorR+5+LKVSF5DlCk6XVTX7Aua4kAxAnZhwFbRxItZgAY00H9Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIweYluI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIweYluI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2dd76b1361dso25504125ad.1
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364888; x=1791969688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kt77OAyXpC7f7bzDw4WTjQlmEMJKd9flF9dr7sAWONA=;
        b=oIweYluIdUfRU0mblo8wiBt5kDFLYdHQ0loxRHJjHvYB/tnezE7tYk8kCDFuCCkAse
         5pPM3NYuCKdpEqFZ9qyrD83BIt3b35afwxJF2Djxy5NE8eyYTE7SMtj6aaxMW2JNC4Hq
         m/GHTe2PwWNB0VuJoZACnz8HER9JBiAdecWLttcEPU6WNAdZ01U1YYJFNzN1G9lBDCXf
         9+SDDDXLMABrwjUTd48QC0acO1g4bQkdAC3o0vhP63f8pmaaJMUb9E2ejm7d9L8Tf924
         3UglHHgghMSb7TV4eM1NTmi5xwadEiaemsS/Dolengm+/IbY5+v2LkiB2v1MGXAtxHw6
         vg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364888; x=1791969688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kt77OAyXpC7f7bzDw4WTjQlmEMJKd9flF9dr7sAWONA=;
        b=ysDmdh757DithYUszxva+8Ks8WYAg4jgOnfB/1dICriZZ1BagRhwY1Jfk/7cNer8Gw
         /4uUM2jQHLmJAcyzc/VpHUvL74q8razDJnIU4aPW7+wLFTVYXIJtcAH0njTjbyisvs+k
         Owf3spFywUfsLtkDKN34qOqw3Fxbme6ZHLA2Oxr3JKBaU+0XU/1oeGtip2lv+O+XrKXG
         Sc2QTbOdS5iU5xWkXbct6EenTrQFUsOMqQt8681Ng5Stht3/gr5Gem0POCKFRA10hjBx
         sgTiEfzTv6h39stFxhLu+Ihm0/XkMlAOmfJSzkvIJJ+wmeas5LIN7LvyxAQWwD+8Vh4e
         zukw==
X-Forwarded-Encrypted: i=1; AKwUvBz3J5w2zaU/VkMq0/+Vxfzf1eVW8oLwfFWkusfaCNDR3CMcOYigRwfxLAV9GcEj8QjibSQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYIRLk+p6X5y0e2yIAZYEAAdAVecjOAEhWJrWPVMjtuHw3cyS91Q
	GeZLw7e22Mxgw86474TkmH/ASmXqXzsQayx70mBDiA/e/0kyhs+uRfX1
X-Gm-Gg: AYBFou2Ztx41lqV002nnwWltx58ZBTSFVHuHnnxcAa0nSVuk2iZ6ROQKVwyben6fcxH
	5mUwVwHGMWu9tUFZTSLwen0pSIeiswYeeJ79OA7OQDhI9raYr7HPJF6hbcpwWC6PCUgFxfeYoWP
	zbLUor2O+5AjJ1w7ItA2WfWPvusRqSdR+VeZayTsF9Ejj28mIwBHpoSzDVlOCISF8NkFEmFwCvK
	enShlIxWpEahmG6h5wraiYvYSfr3ab1RonWSdQhmuUoEfAFK0l/qBtKm8CgKTukrcnV93/gLH3k
	mnwC9DffgIJqH28Z9kRIEl0aqJMDUog5EPIDGT99pigFWHNe5nr1HetQb4q+dAoMNoEhLZtn2fF
	bzpPX7LJLg3Ibvarf6WVaGd/P68GMybxKXY//I4lJLcQU/jLQxKOA26xDtHkwTLy4whjBy6slgB
	6vV+zWheZwh002H9fgHliZYZHq5dKz7iOumdcHFAYWXvciS7yumvAqqbwRATLfBABIwbqVRgU0E
	kXX5S4W2ohWAmYQndFd1h4Gge3w40deNVfGhpnr
X-Received: by 2002:a17:903:1210:b0:2e5:ee16:2f8c with SMTP id d9443c01a7336-2e6003914b8mr16683325ad.16.1791364887907;
        Wed, 07 Oct 2026 02:21:27 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:27 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v8 03/13] mfd: nct6694: Check the length of received USB packets
Date: Wed,  7 Oct 2026 17:20:52 +0800
Message-Id: <20261007092102.3768818-4-a0282524688@gmail.com>
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

The response status and the interrupt status are parsed without
checking how many bytes were actually received. A short or zero-length
packet leaves stale data in the buffer, which is then taken as a valid
status and may repeatedly dispatch the same interrupts.

Reject short response packets and ignore short interrupt packets.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- New patch. Check the length of the response and interrupt packets
  before parsing them.

 drivers/mfd/nct6694.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index b9526b22754c..de0027c98726 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -117,6 +117,12 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 	if (ret)
 		return ret;
 
+	if (rx_len != sizeof(msg->response_header)) {
+		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
+			sizeof(msg->response_header), rx_len);
+		return -EIO;
+	}
+
 	/* Receive data packet from USB device */
 	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
 			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
@@ -173,6 +179,12 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 	if (ret)
 		return ret;
 
+	if (rx_len != sizeof(msg->response_header)) {
+		dev_err(nct6694->dev, "Expected response length %zu, but got %d\n",
+			sizeof(msg->response_header), rx_len);
+		return -EIO;
+	}
+
 	/* Receive data packet from USB device */
 	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
 			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
@@ -207,6 +219,9 @@ static void usb_int_callback(struct urb *urb)
 		goto resubmit;
 	}
 
+	if (urb->actual_length < sizeof(*status_le))
+		goto resubmit;
+
 	int_status = le32_to_cpu(*status_le);
 
 	while (int_status) {
-- 
2.34.1

