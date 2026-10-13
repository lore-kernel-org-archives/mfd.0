Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4BC4BA9F8
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873231; cv=none; b=IY5LkHJ0NEmvbdX0GPlcBfTlaq0AgF11Ye/fneZWaSuY/DXaArKPPpTgNRQoDZU4y11nqiSJU+fHp2fF947HyjI5/xwdwHKrqbPrUgP7KqTqfvzQc3vqyHaFSIN/iaibUFyCunComUEGv2iudrxoEC+P1Odpq5B1cj3xbZ2A6VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873231; c=relaxed/simple;
	bh=gL2uXimjW+ctN5CVpAlBDjhvmt8ZTYS/skb+o/gYgB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k8VEe8P280rRFIE5oj1ylfZJNG++LiijHGkBiqupLVTKsDwQ53oUpjOkRTxwPeF/jjqbVpb0NKbiDJknPfeBD0nsgPFqcBjkiqZRK6zA3E6jd0J2YqzjdwFyf8MZryRV2oiDnJi6JQgLRIjypnhILH8gW/5uge9hz+gao+gVvdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDii+RpY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDii+RpY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso1110924a91.3
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873229; x=1792478029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VA4Kb9cF79nLL0HozCFLR3qs0FajCpT1qffuu3vcWEU=;
        b=XDii+RpYAWkRpRfzkNpUhMYTLNpHcirjj5nisGofb9+go/rQM3Sn2dut/MjuG/m74E
         g/nto+z7eojdO5KXBDpD8TO/x0eGJ4oUTnHg1DmO548e+OiXIXoquyfAaievAc1N/xGv
         engZkwozYTcmjg8tWsmZd/hmX5m6bHUvCNv6VH4bFyjZvYKpy1c78HaMlEIkKVgQ+KKy
         xgebVe1/LCfEnwy2H762oSQUaIIy35zj6vzZBDKm14qfYzOwo2+D099wud1H3zAyPM8G
         HI7Wu2QfIMvCLvf4hzhpujOQ5cChJYjnsiy0k5DdDh9zpLAu8lnrqRc+uk+/6g996+3O
         MlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873229; x=1792478029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VA4Kb9cF79nLL0HozCFLR3qs0FajCpT1qffuu3vcWEU=;
        b=pSSaX31zTAx+vIaiyCg1LcGnGICF83ROh/L7pEYCG3kNxuuuM2jaSwqYCUzzbCKLE9
         LO8mpUNerxu2OTVAUX289wg6R8AB79if8Aer9GD/Zo6tMvDcdChoWdHnFwWhel/3TXGb
         U47LF0N4IsAKJG6SiENiRm2h0uWBg2JzSGfo0Zx4DlEhN5rFSd5NWuQDyCZTx1J2w6mf
         kWKsbhgwPbTKH0FeTU6jUFyesQyhzYKTb0Q8CP+ojvKAZzrrXim/5u4eV09UWKYt/6BD
         oRNJrDykwtUvv7W3wEG5Y9rB9bwnIdMYZd6bhB+7DuZdR47+K8q9w/4NKnERJAfaxMHG
         yCnw==
X-Forwarded-Encrypted: i=1; AKwUvByG9IMuqxRrNUjUO7hHXXPQxaRRtLMZNS5NTkbsfRByiDkkGbYBPT2eyJa0HCK2iqs/6rQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYLgWJmow89npP7gfLXn6yhJxilyMhs+gMvhAh1BvEFaVbgVvzSO
	dVoJILLTVR6dJexKjx1iqDPmOah3iEceiV4OoB6DIJFPuqY/RmHP9TseaGsYUg==
X-Gm-Gg: AYBFou2dojmelicsU79+vcsb2M5kmizlqR4UgKv3N5wabAWI1W22UsSf8YehQWZHZER
	GwHkVx1z3Pdu8qtXdXkRMIoiyrJvBydkplF5Y7RaW2gy5r3O/ZJ79PHsQ/UsBFx4+pCsZXwkx7O
	ShouhOVJPd5AkTQbjSRSwakuTQnFi2IatrPfAUbIjyvjOQuhYh8CevDmjOsJluNiBMsDMBfkK/2
	IkBBZKC8L3Kjq/Lxox25h4zyUtdsTtcBhE0ubGodMM9sZD7wzEBfW4T18gJOnmnJQIaYsPDWWoH
	lGBvlfesGOsXJtLooQ1w8kPmr6M9R8q/NVEwKBjTxV8zapDLqUzOm6h9JJEifTVB+z0R9vAZzwG
	gDi4prQ9SIppDVPLOsXdPFBYlf6vCLDcl1SsG26fpuJPch6FWptUtMajgEfqhzyVMRhpBEgF55l
	LrlzMOZ44O43PDjffBgOFcEOsLvNDsQUOmWfRRLPnUwp3dWhNN92O/L1jbitPrjgXdniWoyND/x
	Y+jmh1pko5+SKQ5XgIZ9q71+Tep8evH17GmKZikQ25vdR5oxd8=
X-Received: by 2002:a17:90a:d44d:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3ab3aafb452mr9592963a91.25.1791873228563;
        Mon, 12 Oct 2026 23:33:48 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:47 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 04/12] mfd: nct6694: Transfer data packets via a dedicated buffer
Date: Tue, 13 Oct 2026 14:32:50 +0800
Message-Id: <20261013063259.2734757-5-a0282524688@gmail.com>
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

The caller's buffer is passed straight to usb_bulk_msg(). Sub-device
drivers embed those buffers in their private data, so they are neither
cacheline aligned nor exclusively owned by the transfer, and mapping
them for DMA can corrupt adjacent fields on non-coherent architectures.

Transfer the data packets through a buffer owned by the transport, and
reject commands exceeding the maximum data length.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
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

