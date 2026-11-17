Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908875;
	b=HN7qw74iGhHERaEHDF50mbS0nUhDEWRM5BY59a+HpWbo64ZT2bbxl7u4z4LgCCo4KkZP
	 EsKYE8GagJwIeoi4I7xcfXLhg/9nnNmzg8mPiYVt9HhpUddkHuAp/7kmWk8jAWPd2Ng4M
	 42QsYuhmWBMKwLQ9y0rdNGI8bEaH5JRV88U06ujnUH0EShyOw1OtT4uiJgMYyCyNVz0Kf
	 xaDLCtI6v2ly0X2NciZm8plFPcQv0GoPlY686lFqYKZ06vjm8vOSaZq8RA6IvYMEEkzy/
	 fdunEP89oQqD5+ZyFgc2FdipclAgGhOXmK/O2AXXmQTtD9UL2PQe86OGcVqS2pOGezA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908875;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=IiYxbhfaOx0Q++iKRYbtpp1SJX5K+HM2T6/FfN15lU8=;
	b=mt3SsXf0Ugq8cypxQWuzuGiM492+FXF8iu5aeTqyYxK8mK31xsSn5Pch4vXVjfBpQdQH
	 SPyeL6e8VedMCWWwlcmoBNf5HfeOXkaqMND6KIz60lGwZms7B3OcrpwTlPIMwILjKGQNp
	 VsdGkpBw1uaRAdql9gmssc2ZTd/83boh6rT65UQMrtLyd9nEjq7w9G2lAjSMyb4N7Mnkw
	 athORBuO49/9BWi3rol4667wpkp+djMCzanJy8F5hw9n7pqwp0JkKCqcVlZrIN+QOIqlw
	 ph/cKer48XZChhzE/8difTvkoLTXNkM4VHKCvxECkwJMEpnnpEZJdtUpB9tQSEnkaBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jaCQXuFY;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585D6606A331
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 09:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 585D6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jaCQXuFY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C3331A159D;
	Tue, 17 Nov 2026 09:47:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 098865FC81;
	Tue, 17 Nov 2026 09:47:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 78EDF11BC09A1;
	Tue, 17 Nov 2026 10:47:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908873; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IiYxbhfaOx0Q++iKRYbtpp1SJX5K+HM2T6/FfN15lU8=;
	b=jaCQXuFYopsxdgNuAbehnFMlonzetW/7f7ttToMaSIEcV0/malKmu+E27q6WkNprxBxV0S
	5ilmcaIpXqE6UoLdAQb/JguVbgNv77Wsie/p+RhE03A07wLb8AMU5nm9lj5wGNGKhBFcsW
	uXXqMgYwxz83vTyEpkav7RfMQjHai2F/Fs7qif06HGuiZ1O40Zg65NOMrHjv/GbzELLjtT
	8KNAeUKJgLvDk2t/Qa2lC34s4uXKM+7Oy+DhR0vE4pYK/zsSdDm/s9lkSduwMBuZxvmn6L
	tquQolcyJYSfEbvIvRQXoiRTLsnOT7d9OdAtcDv/eLFzf79Anm8yYqk11Jechw==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 17 Nov 2026 10:47:41 +0100
Subject: [PATCH v6 01/10] mfd: cgbc: Fix use of negative error code as
 valid session handle
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-cgbc-i2c-storage-devices-support-v6-1-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The cgbc_session_command() return value was directly cast to u8 and used
as session handle without error checking. Casting a negative error to u8
produces a valid-looking session handle. So check if return value is
positive before to cast and use it.

Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260713-cgbc-core-fix-cgbc-remove-v1-1-79274ad62b3a%40bootlin.com?part=1
Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 8a63923d1912..1d5c99a38e85 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -103,7 +103,12 @@ static int cgbc_session_request(struct cgbc_device_data *cgbc)
 	if (ret)
 		return dev_err_probe(cgbc->dev, ret, "device not found or not ready\n");
 
-	cgbc->session = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
+	ret = cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);
+	if (ret < 0)
+		return dev_err_probe(cgbc->dev, ret,
+				     "failed to start a session with the Board Controller\n");
+
+	cgbc->session = ret;
 
 	/* The Board Controller sent us a wrong session handle, we cannot communicate with it */
 	if (cgbc->session < CGBC_SESSION_VALID_MIN || cgbc->session > CGBC_SESSION_VALID_MAX)

-- 
2.53.0

