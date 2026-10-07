Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3E4756DD
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791364989; cv=none; b=poQCjbgUNJk5uYbjdGhjVGlvNki0ixu6W+Cuw7P0j+RBnb1axKeZGMm4+OQVJaWPY+VEbK3DqX5T4tcEoP/HJQzA+tCjLyxH6d+pTjZqukK8oA+b5iLMtVxH6qoxfcf1ch+auWx+cq1CV+qAMRg0RhtGMC/1oB57/jlFgHWoDVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791364989; c=relaxed/simple;
	bh=lwl219Eul8sd2YUowkYzF2XehSm9alrV9NAQ4ulqNg0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G9RnmZ8ADhAW5VO8GTZy+n9pIhA/OnQ5fmMXgVqvNYRpWmd44kDZtZWV9yQeiVzfoKzIxIpen25fo6GKS8c9y4mIlXitYg78Hq2xA3hprLkjAnLXfdTbrqYWwWgSkSnJ+2pNs3WgliJMsiTMiDEg0x8fl5/dW/xCk9hpzptxzm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WL0IJ0Gs; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WL0IJ0Gs"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e618db81c0so1814585ad.2
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364893; x=1791969693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlKsVhXXEnTprcKi3X5NkMsv3N8/DBr+v1s53F8QycE=;
        b=WL0IJ0GsAElDwCf0pMLWbBQBCTG/O5A9K78gytQfUx2Cp0NwcFuavkE0ZsNzld2Lub
         nZ2gykikCqgFl2mrOEEMC5dBCYmpbCiAw246yPL3fu46vLglObd0PiLiM/rzfGutfipU
         1rg5cjY5KpoCzQX7OtnZBYlLz432fp2NoKmZUiM/6iftAj02eZ7ExKrz1xARV6Hf8P2Y
         7ZbI9bHntOXVBfJizbpv+Nb6/Y084oBSs8IKOlwviLH5orwD858b2NHNKtTAvnMysXSP
         T2o+YR5AXXGCyiykNK7SUJlt7oaBmp2O7F84kefiVOKjl3ZUmmILoG9oSc7+VQ7D0Y9Q
         KQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364893; x=1791969693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlKsVhXXEnTprcKi3X5NkMsv3N8/DBr+v1s53F8QycE=;
        b=tX6g5mjK6/IZnOR+y3ng7Uf3YHSPlANX2TeARd9TM1Qji7bhk/d35wFNe/w2bopoth
         anM8bLRrT5Lw7k6r9ZE4Z7VOjab6JniD0oLa3aZ7yVtSk5XmWtmHmoCiQSqKJWfPVP1j
         3AXGFj7dt8HCaE+G72JwHIfOMh4uXQ5b/9YS8SxdpKj68YUXDt0qa2XtB/FmJ+PgzrHI
         lcoMwMIXir4//4OQOw4qKvdPshp9guh4BWlgy0pNVC8ApLOpCzH5z9sZ3ctx508CswuE
         b/Ex1AVBaUfTktWXiboXpNn9qCZEhQdMtjjnuDNqQ23Eox5kVfMDoWB06ZzQ8HtaM7Ec
         U5RA==
X-Forwarded-Encrypted: i=1; AKwUvBxVw9GyCh0z2+kJdWsThR1+/ui7Zc73i+ednFtjbUlvXe9b0mWcAv/66jrRFypO4NdeDX4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLZAdueOlRVuj+w0Cj5wG3ctV/x5Puvqd4Rgrg172sqRC0PCC7s
	CbVSkFjfi6baUaGlHXeYK6WlUVqsv/9Zn1exWTeFl/JrHK6pEBnI8sMu
X-Gm-Gg: AYBFou1Mr4v5rUbA3xGL1SODIVfs3T8HYG+Rzr5KXkzU8rMJESWgwKYzXllmeb5a2yk
	EY8zMhWOXu6Qj5AJDcA45MPWuxR0LJGpK5e9GFajzb3U69CUQKJZeVMvZuj+ot9pCwznOO5ajVe
	g9CTGUlJ6qJZ1SCIVxgmzsC0WCpQeHXLlgFlCL5pEFoyt9X2qDOEMubOGxxy5X8w4lVcDfLnBoZ
	ed60QN3nZsjdZbgD/43tS3mKj2UF93rsVazSKwE3cUYxIB8lOj9hsEAGM4KyUb7zS1NuTqHk36F
	Ma5d8ZeHz6Ji+28LiKswdGqp2InD57YWw4ZU9MkT8KN/4XTjsHoqB+H9LoEDZ1c2mAqb7XWyKA8
	8f+5pqE+x6JrWKnDJHxOo/RBkKIlehSLMkRFdm67I/rWFFJrgXVv8/9oRRF7fQLdfvmac4R5eCw
	xMbuIjZ77ELJZwQKSGk8YqrbGMVcIjBF74eUy2cj8s8NZ25Ns670/ZRYRE8EEjjNWDMyMHm8djl
	qx7VplaACG3BrKnNPbUxtW4WnMJBnbV1NU4F4a+0Sg+MIV7rKk=
X-Received: by 2002:a17:902:f688:b0:2dd:ad74:ac22 with SMTP id d9443c01a7336-2e60024aedcmr17569995ad.29.1791364892870;
        Wed, 07 Oct 2026 02:21:32 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:32 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 05/13] mfd: nct6694: Transfer data packets via a dedicated buffer
Date: Wed,  7 Oct 2026 17:20:54 +0800
Message-Id: <20261007092102.3768818-6-a0282524688@gmail.com>
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

The caller's buffer is passed straight to usb_bulk_msg(). Sub-device
drivers embed those buffers in their private data, so they are neither
cacheline aligned nor exclusively owned by the transfer, and mapping
them for DMA can corrupt adjacent fields on non-coherent architectures.

Transfer the data packets through a buffer owned by the transport, and
reject commands exceeding the maximum data length.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
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
index 4f5a5b855de2..f9ae8476fcae 100644
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
 	nct6694->int_buffer = devm_kzalloc(dev, sizeof(*nct6694->int_buffer), GFP_KERNEL);
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

