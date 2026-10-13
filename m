Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3B4B7A59
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873226; cv=none; b=ReZLN+wRXIGpYJsKLLM2my29Kb45bJmQ7ayWfryrk/sR2pAR4kDHL196oLSh8OPlTMklXpBCAhTUJ0zRASqQvHk5YxCcdByNOUbb9kESyiYGi1fSEI57ibCIdRPa36CCN6/WuvtHcPbUU2qm/7dErtGUiOz7CitfsWS2LYplTsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873226; c=relaxed/simple;
	bh=BnICTOirhKw3nfpXzrb69X/m6lphJO6tTNr5tzRTrRI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPKRg3W/MDGOvgp/tkO5d5ojA4pMHDR36tAjxZ7iIKQ3OYaK6XSEkrSklj7G5jM5RNoLA59nKPDSUQawV6EorlkmnUkq7UtzWgWiHBOOl/X3RQKy0GD4Ym9FTW13cZbuz84tH4uXMDK28hhYs27THXQ3JZ9H3bOsFKGTw2T+ejs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYjQFoP5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYjQFoP5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab8309dcbaso1757507a91.1
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873224; x=1792478024; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WApmH6KSOyvplNUAO8ZIsi5ChpYHEUPqlrpAEqDzH6o=;
        b=FYjQFoP5y60YLqBSUHFxFelwLHmlgbjJnxevo/KXbzBB3EwFiiYjyEW7ZTRfNhu15i
         Q54aqkz8JrQoqFcYgUSLhHZL7aUYPHC6T2IiHYtrGqwxVqGpy1s5PhFSUgcHoCYUadWS
         dFbP5lzyUrQJohJtpHSOeVu060XYOsKzYi5cSc7uXKkb9VE5+yneymEEniPi6MNJOHI+
         +B9z225Cg5slZ7QRsacAI6v4QqMpnZMSwknbj2ppmrLFp2P1CcAKC2x0V565QwtnXWlX
         9agoG8/Dq+wLWhpXcr+ve3q9fqFJttFXNPsMsvQZ4XpQg1EKmtAeqwWRW1amt4yZ9OFj
         La9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873224; x=1792478024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WApmH6KSOyvplNUAO8ZIsi5ChpYHEUPqlrpAEqDzH6o=;
        b=Ye++UG4wjccho5K4R/R1gfq+cFGIN4/IaWgZQCa3aTK2tR/CzELRx59LGatuh1426V
         MhEMkeY+tzXQs/XA14uaySmOfcn6H3xj4z7OvMmdmfmKUQgceodu2ZK6DnS8w3VOYupE
         MpF8h1sN0c6LybOcdHmIacgENM4j3zMt81EEpDswiO+SuzpFxc+P+lwWlHDfUYsXA2v0
         mXbwTQaKLZnnGBDFPavL6I4CtjvjjL2vkzpmv+MUdssBsrjm4LoQsSJll7EqxSOBKNO+
         hiJUg59SY5CKorAK2cktCnuMMTgMcnBLayZZBl04aC/2oULRZan8D3gSK7MHSBy6b7Gy
         4Isw==
X-Forwarded-Encrypted: i=1; AKwUvBxWjDPcumtbDORwNsm8EuVoBi9PLeUIIk91orPEdeOUGmZvNTgzW0eBXICxBjAqO8wORXE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLBLcFIjXsALfU0q9TL33YpFWBOjdGQW2ARClyZcrJVedN1HU4L
	q9ja6m0oo+eEDgBxR9UD69fA0tt+l7y94aInlkmfg3MAAuUUgcGN+STY
X-Gm-Gg: AYBFou2kbqoBJ51khPTc507xqoBSx6zYUSt6n03k/z+05aAG6tgTn17MNAAr36NhlUU
	1D2bBQ88QaSmgXLIL/nchDEiXHTOKWR0HOaBpgn692E9CJah+uW8oMz+WT1+XrGrSS0+9/LJmCu
	Pi0QKfXbSnGIViXAIhUf2+Wb9SpWYTJPMWGt0kHodsoLks5Z3kUswtqk+VtesODEX0MLr3PsH1N
	CxQ61+Osmu3WpQG8blaCeWnMnjgBd9suhgBil4cZKCzqyLLjlOHIQKOiU2jYI/RE2QHQUZLYMJz
	+kIP2RFp7TySpF2QHqwf+QAGd0Nm0RJG8HoQqV3GCdh5APORHb742fQG8+tHvZismlylxGYeK8s
	ju5wahKTynOgfV6MDcbIRlL1ZgJvYgP38u1gr6tBpLPm8ot3XjARcRPK7WWVFPs8fIUqjfW4cBg
	0D8cmenyq9qhs2eNWK0w6BP1gyOz07Gwj13szse73xZNIAjOZ3UeJt7CHwGaBJ/y77InAeuicKQ
	5MPE1PAWwXk1aQcXoYq3+OE5BKot4BT66NU4EUU
X-Received: by 2002:a17:90b:1d50:b0:3ab:4e4:e97a with SMTP id 98e67ed59e1d1-3ab3ab227d9mr6479494a91.26.1791873223941;
        Mon, 12 Oct 2026 23:33:43 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:43 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v9 02/12] mfd: nct6694: Check the length of received USB packets
Date: Tue, 13 Oct 2026 14:32:48 +0800
Message-Id: <20261013063259.2734757-3-a0282524688@gmail.com>
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

The response status and the interrupt status are parsed without
checking how many bytes were actually received. A short or zero-length
packet leaves stale data in the buffer, which is then taken as a valid
status and may repeatedly dispatch the same interrupts.

Reject short response packets and ignore short interrupt packets.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v9:
- None.

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

