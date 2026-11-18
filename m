Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989807;
	b=QzWGs8hJ4Ke9RwaBcRK2jvrdO5ZHjn4eb2bX8L7N2VQal08CKwYifGJqiDaHbkqFNHRx
	 xX80esjWjtOxp3epyuYQguXPZZmcW1wXcBhrpJVK//aqMeSwYpep7PdW077U/JZtvguIe
	 hqC+Bq6fOxvSzCR2Za9gkX9Y1clCLvZuC3c8a5Lvtawx+OoJtT4YQLKNI5XZmY1iu7IGM
	 pJmHmUL9oMy3y+NsacTUI/d5oM/6nS4LFbpvg5uJN2whnQ/AM9pBDgyiFF1ZrpmO8D5Dz
	 lbUJf9sB7yUSBdApma1uinzVY3pKiGenBZHFmDa0W4pZMq3EF447JBxQkmeRGl+MNpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XZS0HWcmO8vSHHGVlkrKX1W6ZW4DC/abk2188dcCpzE=;
	b=FAcCziaUjC4xMvk+wMEsJn8y21hPhUvJBBd1aGHlBYx1GxnwHzd8EMZQrhxa6+LVEjX7
	 9jETSK1S+GSdJmDKhIRraRbFHKqLjALWhQXZpPuk3nCMT6KYV4o445Wd7artkmGGJMpCm
	 FlngROoNFYgtxTrgzwUcLyQa0DgZV85npM0mD4+7/1AGkOe1DIeIr2s5ZaAsEi+lWzR+L
	 dWvjranYKg/1UPpfIpCQYSHVIlwJ5bAr9e5jFGYoN7vnWNER2ZVNuebwUgC3HipaEDL2c
	 Tz/j3lVnqoE6W2NJce5Abzno9mcckwxMl++jU11Y19A+bjm4qKKOP3PVtn4/K94ws3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwMbwd55;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1CC606A895
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1CC606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwMbwd55
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so352060b3a.3
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989806; x=1795594606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZS0HWcmO8vSHHGVlkrKX1W6ZW4DC/abk2188dcCpzE=;
        b=YwMbwd55WRJ5sfxlB59kjNY1ivGlWmqZhpCY1d43eYXI6pYfRtIDtEctTUha5jOW/l
         3uUYlcQqYyD1SWloizWxc8sImAYkRikuCLryrHzrfND7c+a0LY4hCCptISzw+P+2/VEh
         oPJlgZFEqertELnJpZjDWPk3k6yUuyhdXFxkg0d6HUT8aEg/aNOO28j/GU8hVcZFjZT2
         bSF/SIH/EcjCKCDPrVPdUhSuKxQcGNLNyN5LI6uQDODlp1zdooqD0Nce9ncaXaL1NIku
         zIgbWv+W2dViZFs42v8IRiVvjocrpL2K7CbT8LNPAP+Jr+TDQlJtobnzJ/uIHv8xs3iK
         qw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989806; x=1795594606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZS0HWcmO8vSHHGVlkrKX1W6ZW4DC/abk2188dcCpzE=;
        b=1uXUATqCzk5od7qQn8/pBzYIWa3kvn6goA3S7sH7GutP3fbYWModbJbTu+HpkXUbDo
         17EQ6dRtkoYxebN/vakEIGV9wJ5I4vElk7ZZnYJ1lW2/hxdEm0+Epm/R/ZwtHQGh/cxV
         B2t4A/OppmOJZh38PovSZQmlDGp6N7OX2+mfqx7BezYi/4pgAP0C5sMQSqRDzPwrJq7O
         xembfZVPhHpWgN2P+ket6NUesf/aeL9u+ueM3sRPzrNBi2IepYBrRKoAaxqLaggvDfkz
         CEC28Alob7zSm6s2YzXUxnPrj/rGCth6pVTm0lyjY1nnSSjtAnWlHqnx5sIQwzJ7Hsd0
         yzdA==
X-Forwarded-Encrypted: i=1; AL+hErEcfXdvsXeqQgzYjCnXoJQXZYpnQ+04VHoykMn+9klW4pTxB3BAmDhbWGD3BzReax8g+Gg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8np+crCaR9dt6cnArolLZUu29oUE8OhubqeXw5JMxRnJP4yDl8
	FUjHfnMkD6zpA/CV7sT+GyiUbCzouNntEN0kOUfBw+DDVwUmjYQzUPgw1ywa+g==
X-Gm-Gg: AYBFou1+3+lTvbOabCx8217E/yE/N23/tb8Q+7Tz0pNK/sNxyffG24sxEeG13aMMhvT
	iEbpEpp6ACVY85igtXj7KWihKSzLb1zwbeS9Mr2t0OxPq6ohFOz6M+I8C2FnaHpejOC5+Yb2oAH
	OZYWpx1m02gmOBUtOTJIppt1zHKMhyApoVRzejcv1md1y2oFOQQvxt8Vg8v4oy3QdETw/5YJRw0
	Fku9P9e5rtM9B0j7TLmBCGupCWWa0hztesv5y8WJC1Tc26bzYD1I7MjBqDXHAXQD7fo0GiX1fnJ
	YbvuDbK+78VOVs9vBE010Ejt8w6RoVSChDYZJ1rw9G67I3Po7W0hjKsmdZZuDhGX7sGH8CDHbDI
	d46nMwO574QHeAprgCf+twBBm8x7aXRCXMvmarhkUdodA7DDaGCuDfrnZXVY9yfVIag43d187d2
	riTvhwW6KKb7bSXEQ48vV5zDdZHary13Oi8d/mUyXoFpieyet5Wtmx/DqsvkpmgproQCFAwJR89
	+tEzfQMgDo2BUAz+1dCJGxMV3ssKq1cdB01gK2Lts/4VfrYue3cKwgbBOu+vwa4d8p581hjwnO/
	tVfilywhwcsW9/jTJ27J6+Lh5C6krzkMZc6+e9xi6YnV5zZ5pjFH6m4DTDmcBqXYlIEKHG0=
X-Received: by 2002:a05:6a21:3a94:b0:3fb:a69:8480 with SMTP id adf61e73a8af0-3fe8c4db153mr1750034637.87.1794989805939;
        Wed, 18 Nov 2026 00:16:45 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:45 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 04/13] mfd: nct6694: Transfer data packets via a dedicated buffer
Date: Wed, 18 Nov 2026 16:16:15 +0800
Message-Id: <20261118081625.2399247-5-a0282524688@gmail.com>
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

The caller's buffer is passed straight to usb_bulk_msg(). Sub-device
drivers embed those buffers in their private data, so they are neither
cacheline aligned nor exclusively owned by the transfer, and mapping
them for DMA can corrupt adjacent fields on non-coherent architectures.

Transfer the data packets through a buffer owned by the transport, and
reject commands exceeding the maximum data length.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- Rebased on the current mainline, which allocates with
  devm_kzalloc_obj().

Changes in v9:
- None.

Changes in v8:
- Moved before the refactoring so it applies to the original driver.
- Renamed xfer_buf to data_buf, len to data_len and
  NCT6694_MAX_PACKET_SIZE to NCT6694_MAX_DATA_LEN.

Changes in v7:
- New patch.

 drivers/mfd/nct6694.c       | 37 +++++++++++++++++++++++++++----------
 include/linux/mfd/nct6694.h |  4 ++++
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index 048de767e543..6b8b951f0166 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -98,8 +98,12 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 {
 	union nct6694_usb_msg *msg = nct6694->usb_msg;
 	struct usb_device *udev = nct6694->udev;
+	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
+	if (data_len > NCT6694_MAX_DATA_LEN)
+		return -EINVAL;
+
 	guard(mutex)(&nct6694->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
@@ -124,17 +128,19 @@ int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *c
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
+			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+	if (rx_len != data_len) {
 		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
-			le16_to_cpu(cmd_hd->len), rx_len);
+			data_len, rx_len);
 		return -EIO;
 	}
 
+	memcpy(buf, nct6694->data_buf, data_len);
+
 	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_read_msg);
@@ -154,12 +160,17 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 {
 	union nct6694_usb_msg *msg = nct6694->usb_msg;
 	struct usb_device *udev = nct6694->udev;
+	u16 data_len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
+	if (data_len > NCT6694_MAX_DATA_LEN)
+		return -EINVAL;
+
 	guard(mutex)(&nct6694->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
 	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
+	memcpy(nct6694->data_buf, buf, data_len);
 
 	/* Send command packet to USB device */
 	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
@@ -168,8 +179,8 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 		return ret;
 
 	/* Send data packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), nct6694->data_buf,
+			   data_len, &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -186,17 +197,19 @@ int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *
 	}
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), nct6694->data_buf,
+			   data_len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+	if (rx_len != data_len) {
 		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
-			le16_to_cpu(cmd_hd->len), rx_len);
+			data_len, rx_len);
 		return -EIO;
 	}
 
+	memcpy(buf, nct6694->data_buf, data_len);
+
 	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_write_msg);
@@ -315,6 +328,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	if (!nct6694->usb_msg)
 		return -ENOMEM;
 
+	nct6694->data_buf = devm_kzalloc(dev, NCT6694_MAX_DATA_LEN, GFP_KERNEL);
+	if (!nct6694->data_buf)
+		return -ENOMEM;
+
 	nct6694->int_buffer = devm_kzalloc_obj(dev, *nct6694->int_buffer);
 	if (!nct6694->int_buffer)
 		return -ENOMEM;
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index a5ad7be47bf9..69e4652cf16c 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -19,6 +19,9 @@
 
 #define NCT6694_URB_TIMEOUT	1000
 
+/* Maximum data packet length the firmware accepts in a single command */
+#define NCT6694_MAX_DATA_LEN	0x3F0
+
 enum nct6694_irq_id {
 	NCT6694_IRQ_GPIO0 = 0,
 	NCT6694_IRQ_GPIO1,
@@ -92,6 +95,7 @@ struct nct6694 {
 	struct urb *int_in_urb;
 	struct usb_device *udev;
 	union nct6694_usb_msg *usb_msg;
+	void *data_buf;
 	__le32 *int_buffer;
 	unsigned int irq_enable;
 };
-- 
2.34.1

