Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4473793D3
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283344; cv=none; b=kQuFw4vEngR0+I0UNJj2r94EpY4zLiQVo6VsvpM1WuR2h9Mg3fKyqv0KEK6SAH5euKoTZc2A5LjLjbfyFWCYIOmX6GIfCisVE+Rmoqi5RSR1ZmMAQHOrGt2hjNJ4pWWV2D8uUGO5WQARDHqhUz6E5cW019H++1dsBLH0umDQGFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283344; c=relaxed/simple;
	bh=dh6ypal0eP9TY0RyxbOZW37QBS/0wHMrW1fkKLXmnZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ECDIkLDnmCr1p8vX2ju6NYUxvvkywaDK02qyIaC0blb0Wf0JKzxiIT27Dw0ar1VIK47iAdnmjtMb8rAnuyudRvBZOMTrhzVabqxF2Wrn+uvzLuWIh7kk0fJim/JWaEJWT/6enOc5+C9kwpjCAKW2fCM8g0QtYfnMdl7Y06Y8O38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2oxSNcy; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2oxSNcy"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so381512b3a.0
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 20:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283339; x=1787888139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akgiGKYdVb/X1Q1qbgoX9eIBpnqoztnG/F+moLn7cbc=;
        b=k2oxSNcyBtgXjsM9egwXvKl0e/VxG9xvPK1bFCp1jF25z7Fr+ORPE6sQ3NkmjIQrfi
         Tfxy7SQigB23k0RKy8BnGtHfGgtdHTgxEOONm9kdIN1duceQrshRVx7lUmXJWc+VaUiC
         ayZmTZ8x/PLdRWn8Pkacib9trJUfHWu34LFZJmBjX1FMw3eHgGiMj2/HTL5XXBFULyOw
         s/ovmcghibgE+GPfRZ7SjfuooeKET17JmTryYKNzzeZ1QGKu88Ui1wDCqWBemqhwHcbV
         YM8I3FtkGKu6EFjOQZxRRsrh+wDoqiJp8cc6J8rdUA5ZBBwCsOcxXrFjNUXvDe8iem94
         et0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283339; x=1787888139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akgiGKYdVb/X1Q1qbgoX9eIBpnqoztnG/F+moLn7cbc=;
        b=SxPIogYAR12wbwLRhW8L77kNhjoKz1xfIopNF9GDjgOVLamaz4Xl0jvS00extgxyqw
         NBzD33RznJ5kuyHXKGUZFTvShbD93fS+YTzftQ2jbwdNQN6QVK6obxYyPDPIUQaA+fKm
         4658+QBbnQzopYE6RyxiHLmviuh5gPePk+Em95itA2gdgDOxVhX9F8gHGIqGw+7wyROx
         Gwv8QfNDjzFPwIV1o/T/e+/9zkgxiBEJGDZPsFqBnDYjJAvjY2i3u6CjN4rcTzWG4utK
         H3EH0JUiaQoo05LzWHN2DisDazLOSPumzsK3e/2gBAcTaBXNeLS0aqqaTBFGZrX73vqc
         M3IQ==
X-Forwarded-Encrypted: i=1; AHgh+RokLPMj8Cfqkp0jF9NTcCp1l0IG9Xlm9RBfyF/Jm0OUxmZuGUHzzY+IoZjKtgihlijKDB8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTW7Gt9b68fR5E3zSBF2jFJ6J+6Ci5dBu/UZUA2Zwep9VVSKT7
	fOkwFOILr/W6i7HiC2jyFu8hSEOVDgZjgvQP0C8RFQvaAW5P/3M4gPKl
X-Gm-Gg: AR+sD10HizzZviOJ8aPgK4iC3BqByf7oLtO28ql0gH9eGNB/+y/opUYjeLQVwfrhdhe
	VKsm9oT+NE5QTWVzX7y8+QT0v5RZj9se/S1sFSlkTabNxQeIYi+R0K+wlwTapOlCEHVfVCW/Nxz
	QMx+s2dQNvPhwWYuDEOqLJzlabuzS8fUroG5xZ14zcCncGQgvwTKLKE09cKQK36UwZsoZlb1PXy
	DnjFgYz6qT2URvl32CwpogD572OhgOe5rvzFex08YRYQB2y2IOJDnF8VizDRSqzz2Rbt+El1eY2
	dzDTSHKO7n1H1ThbYRnL6T95W7feVoIdFkGmSlkUigAs9KQXJMvpz+OrySBana7yTHekb1trhXG
	n3w7/3QbRgMNVOsUgfJf25xrLnWNaldLXWo1mdDf6pIZ5qIBCyKXLk2pPP5VvS0NX0TKb2BWBeK
	kJH+C41WV4GYnM5cEx3VNGRvS6pBWElWaO3WSs4qjI+GDZmKPFa5gkPO3VhDhCn9RTHebHCju2d
	KrhULMuVR1Qvwa8nCcd/HJEmu2FOEb1
X-Received: by 2002:a05:6a20:3d94:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3cd300f9e23mr6147186637.13.1787283338691;
        Thu, 20 Aug 2026 20:35:38 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15891a04csm2204271a12.15.2026.08.20.20.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:35:38 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v7 06/10] mfd: nct6694: Transfer command payloads via a dedicated DMA buffer
Date: Fri, 21 Aug 2026 11:35:01 +0800
Message-Id: <20260821033505.4017901-7-a0282524688@gmail.com>
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

The transport hands the caller's payload buffer straight to
usb_bulk_msg(). Sub-device drivers embed those buffers in their private
data structures, so they are neither cacheline aligned nor exclusively
owned by the transfer. On non-coherent architectures, mapping such a
buffer for DMA can corrupt the unrelated fields sharing its cachelines.

Transfer the payload through a buffer owned by the transport instead,
and reject commands exceeding the maximum firmware packet size.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v7:
- New patch. Fixes the DMA-unsafe use of caller-owned payload buffers
  reported on v6 patch 6/7.

 drivers/mfd/nct6694-usb.c   | 38 +++++++++++++++++++++++++++----------
 include/linux/mfd/nct6694.h |  3 +++
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/nct6694-usb.c b/drivers/mfd/nct6694-usb.c
index 2289ebfde7fa..793ce54c02aa 100644
--- a/drivers/mfd/nct6694-usb.c
+++ b/drivers/mfd/nct6694-usb.c
@@ -38,6 +38,7 @@ struct nct6694_usb_data {
 	struct urb *int_in_urb;
 	struct usb_device *udev;
 	union nct6694_usb_msg *usb_msg;
+	void *xfer_buf;
 	__le32 *int_buffer;
 };
 
@@ -120,8 +121,12 @@ int nct6694_usb_read_msg(struct nct6694 *nct6694,
 	struct nct6694_usb_data *udata = nct6694->priv;
 	union nct6694_usb_msg *msg = udata->usb_msg;
 	struct usb_device *udev = udata->udev;
+	u16 len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
+	if (len > NCT6694_MAX_PACKET_SIZE)
+		return -EINVAL;
+
 	guard(mutex)(&udata->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
@@ -140,17 +145,19 @@ int nct6694_usb_read_msg(struct nct6694 *nct6694,
 		return ret;
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), udata->xfer_buf,
+			   len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+	if (rx_len != len) {
 		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
-			le16_to_cpu(cmd_hd->len), rx_len);
+			len, rx_len);
 		return -EIO;
 	}
 
+	memcpy(buf, udata->xfer_buf, len);
+
 	return nct6694_usb_err_handling(nct6694, msg->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_usb_read_msg);
@@ -173,12 +180,17 @@ int nct6694_usb_write_msg(struct nct6694 *nct6694,
 	struct nct6694_usb_data *udata = nct6694->priv;
 	union nct6694_usb_msg *msg = udata->usb_msg;
 	struct usb_device *udev = udata->udev;
+	u16 len = le16_to_cpu(cmd_hd->len);
 	int tx_len, rx_len, ret;
 
+	if (len > NCT6694_MAX_PACKET_SIZE)
+		return -EINVAL;
+
 	guard(mutex)(&udata->access_lock);
 
 	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
 	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
+	memcpy(udata->xfer_buf, buf, len);
 
 	/* Send command packet to USB device */
 	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
@@ -187,8 +199,8 @@ int nct6694_usb_write_msg(struct nct6694 *nct6694,
 		return ret;
 
 	/* Send data packet to USB device */
-	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &tx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), udata->xfer_buf,
+			   len, &tx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -199,17 +211,19 @@ int nct6694_usb_write_msg(struct nct6694 *nct6694,
 		return ret;
 
 	/* Receive data packet from USB device */
-	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
-			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), udata->xfer_buf,
+			   len, &rx_len, NCT6694_URB_TIMEOUT);
 	if (ret)
 		return ret;
 
-	if (rx_len != le16_to_cpu(cmd_hd->len)) {
+	if (rx_len != len) {
 		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
-			le16_to_cpu(cmd_hd->len), rx_len);
+			len, rx_len);
 		return -EIO;
 	}
 
+	memcpy(buf, udata->xfer_buf, len);
+
 	return nct6694_usb_err_handling(nct6694, msg->response_header.sts);
 }
 EXPORT_SYMBOL_GPL(nct6694_usb_write_msg);
@@ -270,6 +284,10 @@ static int nct6694_usb_probe(struct usb_interface *iface,
 	if (!udata->usb_msg)
 		return -ENOMEM;
 
+	udata->xfer_buf = devm_kzalloc(dev, NCT6694_MAX_PACKET_SIZE, GFP_KERNEL);
+	if (!udata->xfer_buf)
+		return -ENOMEM;
+
 	udata->int_buffer = devm_kzalloc(dev, sizeof(*udata->int_buffer), GFP_KERNEL);
 	if (!udata->int_buffer)
 		return -ENOMEM;
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 853b1530755d..cb311e58a437 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -29,6 +29,9 @@ struct mfd_cell;
 #define NCT6694_HCTRL_SET	0x40
 #define NCT6694_HCTRL_GET	0x80
 
+/* Maximum payload length the firmware accepts in a single command */
+#define NCT6694_MAX_PACKET_SIZE	0x3F0
+
 enum nct6694_irq_id {
 	NCT6694_IRQ_GPIO0 = 0,
 	NCT6694_IRQ_GPIO1,
-- 
2.34.1

