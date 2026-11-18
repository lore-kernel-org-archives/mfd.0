Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989802;
	b=eWCnrH/UtuCqxFiDVHMmWh0PsLvJFT5zvjz/s/iyfYTmxSdxwMBLDPRg56J+tRO6Rj0l
	 vdMV+ELuyW7+E0dC/GjjCNrsSg9EPUyJ7NQgFhgDE4kY0y3113CfZLndJD5LSOMffkpqk
	 bDSY9ZHTt3118Razc9EBp7AoOlglPomKDu/MplKf6vtxJV5D1X5VD6mrg1vawEYEek9UY
	 EfHCO034XdfhlYympNcmYQSocRLmQkumPeRRXfxe8NG5W+pqSuvkcFVDjNVSbHIB2yp+0
	 MCORjPhmqbmFm8gJ47XXcPt1eSR15PbqADd9UHt1VMuj5ck64B/RBmb3hfDhleh8PHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RgyU103rwx7bIFJVpR23nR3rMx3nAWnK4SSu9SCgh+k=;
	b=reDSSO3PNsdGM5S2GAt1WOaDJp/ejuBEYKcv8vjTV3JTGZfomXery8B8pcCDwIZxRj6Q
	 CW+gDC9P3xSoSpegzBjlcvSC7AHx/YtBkBcuINz1wCYBi2CqJMv8i5wzLyXmY/UtXSeXM
	 Z26Eu4tOSMuOTHMdTFLo3wvjn8+sNGgCoj4ozHsE1d7nThVRh8rt+5xLkqv36qlcKtZU7
	 /Dq3HeA7fVqcFSX07w5e84W7n/UifixvRiEN87C1EFZ9nN9fXEt19SrVcSE8WxomXFbbx
	 UajyzoLGgajxd2/MwTA1vWN27ri2/Z1Vc7zaOsXtIxrc1gNMrf3os5Hq40kVZ9YzY+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdphqiCp;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844B606A899
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3844B606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LdphqiCp
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8c5990606b5so334236b3a.3
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989802; x=1795594602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgyU103rwx7bIFJVpR23nR3rMx3nAWnK4SSu9SCgh+k=;
        b=LdphqiCpr0fJ7HyRAOJ766oiSn5pBhdfK/2CgkaHua7BmsCq+A8vCX5q2FvHq9eNBI
         ZX33GbTnFPnKs3tMLNFUypH0TwrRu260M5ZInOtKnjLL/X/rnqT0acebEMU/tzz/7eIX
         k7/Jiefgtb1N9lOyRWAqVtpDyorIQ37XveYjcODZ8Pu0FeLyrvP+s5sADO2F5ymLSgvL
         yAVZnO7bSMkxHTmpX6+Ndb8JPnpFGPuyKJwLZnlZ9vLh1MpVir5cUTHmUd15hYe0L+H/
         q05GGaspWAKzFXfqJo1OggAJHTLf6uGcbYDxVURaJzvo1LnD+T+Jyo9Pw3+gofhA/9rM
         isMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989802; x=1795594602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgyU103rwx7bIFJVpR23nR3rMx3nAWnK4SSu9SCgh+k=;
        b=r8HTQayxhJnk4xnAxkk1rfCPcqyo7w717pgaK99njJfIWgcUgifBaairtXz7TLx6I7
         QdiLObpQClTPo/FMXWGtNS2Nh+PCQVmBK13Qt+VWnMMwu5aH+7SrxMrVt4ljMhNwOo+l
         DfYpOEjFnLLrZ3xeUqI2xYsP9Meu0uTXNTTt6YibexOBGZpxfWRqXZWKb7Z08uU9VYyg
         l4rSxyp4PposlCfobm5DY/qVHRJUqs3SCCyUbQlZ1Mg37vS9+IjvQ2bJBYIbVl2EgwaR
         fAayE5cMWampnEMTrkhJMzcBMupMrdNNoil06moZolVAQu0pzr9GQojgkB+kfJZLT0uS
         QKnw==
X-Forwarded-Encrypted: i=1; AL+hErEKItdiFG0MTyENK+Zr9ZLDmhDNFitJd+KhHhreMUNYM54uZqDDkcOPQ3bgkZEJ53X0rsg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/4g3GFRcYZO9sS34+WnBUijIhQPFnvCtz82xpD7zxsRF3ssSZ1
	XW9rQHHg5znSqxW+F8qi1yuV/glrqEUjeCa437PVq4MeM0HDscRuvtzZ
X-Gm-Gg: AYBFou04M0Xy/FE0PaYb2xsuu1tw2VG+EYVikptzyqli8ABic0JgTMN5F5xprrzLWZs
	E5dcC56euWhhnypM+hqUegwr1u6wHko4bWld8luG8laAdrAwn2UAdR5jpIF0NHd3D8OgG6arBXZ
	l26Szwg3cLViJqUEtZup2fQTl+LEbjQqj9SkFFDlCBhsaM2XRki5yBIrVVijRWToJco+AEg1bBl
	jh9PBLOmO4kp5+Lv5yab32qrRv8R79j24FuYPVjm0OzZ4sf8E8gy53FUvUjsSD8xoZCe0mJqddJ
	SrG0Y5krO2TvQ/PDD6tGSTIeuJYPWJgIbaQ2dBCtayX6AFHZoD5FoY0+4fPxdxU720bilucVzSl
	ut9tVNTwAq8G2zg7Sev76CQwkku/+ANhnyBUo7cFSt2hApsXnCgS6ew56fuk9G/RDrH2efpFde/
	zUUXNmTn4vhLwjlhWLSEL6fmorszAJGed+d2VvgdoPSzRD4glteHiivVk1cajcPgIZ+wwoLnNK2
	f3DRNQ36zY7ceOZ/FjrmGYpmieSjKH2rdyKOXf0aF1x+YL/fFEo0yH+Ac0XN4p9EL6Lhet5ItYg
	A7ACmEHeajpVneqyl33/tEFC58aZyWri4NXWVjLzbpDvDwttpltDVww9XnCob55cocnGQRgvMFO
	VEpiWIiMbmpR/nK8G
X-Received: by 2002:a05:6a00:a93:b0:89f:454d:8e6a with SMTP id d2e1a72fcca58-8c5d334435amr1683683b3a.10.1794989801542;
        Wed, 18 Nov 2026 00:16:41 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:40 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v10 02/13] mfd: nct6694: Check the length of received USB packets
Date: Wed, 18 Nov 2026 16:16:13 +0800
Message-Id: <20261118081625.2399247-3-a0282524688@gmail.com>
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

The response status and the interrupt status are parsed without
checking how many bytes were actually received. A short or zero-length
packet leaves stale data in the buffer, which is then taken as a valid
status and may repeatedly dispatch the same interrupts.

Reject short response packets and ignore short interrupt packets.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- None.

Changes in v9:
- None.

Changes in v8:
- New patch. Check the length of the response and interrupt packets
  before parsing them.

 drivers/mfd/nct6694.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index b7088b2850f7..8d5a6f6a7143 100644
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

