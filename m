Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038876;
	b=orz2FCqT+1BsGdtYdV8Y0vYtVNz62eQmw+JVoE88++3tzIPTa8j2A0EypX3uFdJfwxP1
	 xm+6Eh9f3IvuemrXVxpXKloSJQClxKQBuDeVtJWEXhRIUaowRuHJCTzSr8ynlPeykWZWh
	 zf4cX3k+8RDLdoeErpCMbhyos4q90jEAAoUm1/4e7SoU5pJ8LYudPsoqGLAi9xAesABUz
	 aI0cPUFKMi63xl4y4DSL0Io7t2JT0SNZlDjEt16Yz1dXWsHaIcQzFFtM0MS2J+XsXV3Px
	 RC3CWVKkA5LrujP2SCiHGfc6oCGqDyV7tRJ2SsbfHEApky/lhCii2Z0jIYPBrlO8J+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038876;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=z/nxh5f+UJ5EtA+7pZWvxpsyR/X9s2zJnQZ4PQv8H78=;
	b=pgXc4wPB/4ZMjVMSWwkTkvQF8FhcRYxEAstHqKxWBklI7MOoAqcqF1wzu7fu159TC0iM
	 5iRDZnsF8/mFFIV7R6pLlmktEYMqnodvCecPm8oR7ldzGxRmv4lQ9q21kmm9aQBpkKp3S
	 rN1PMA36LCsUW1WlIDNc/tplP+zV/+pazOZMRCQMUEMerQGtDqZIRofORPfA0eXWuZYLX
	 SfYWAvpydvBHhdQybQ0E6z4Y7CNNJPlJ6Vx0ka9NOlQGudWy8Y03a0DtFqNKJKV5RyEjh
	 bhH9klJhJ6NtN1FbSngZEC+vlXDS61LKC84YgAcFgbtkZCUsS6Gq4b+ZXeEoIrxGmQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21509606A333
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21509606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jM7vY6hcfz8XrrZ;
	Sat, 07 Nov 2026 16:07:53 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 6A787kaa096485;
	Sat, 7 Nov 2026 16:07:46 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:07:48 +0800 (CST)
X-Zmail-TransId: 2afa6aeedc54b5e-926fd
X-Mailer: Zmail v1.0
Message-ID: <20261107160748370uUkky_wRKP7vtnKU1uRKZ@zte.com.cn>
In-Reply-To: <202611071607376342uPiYA9rHRC7ZI9Ix-8xh@zte.com.cn>
References: 202611071607376342uPiYA9rHRC7ZI9Ix-8xh@zte.com.cn
Date: Sat, 7 Nov 2026 16:07:48 +0800 (CST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tony@atomide.com>, <linux-omap@vger.kernel.org>, <tharvey@gateworks.com>,
        <support.opensource@diasemi.com>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDUvNV0gbWZkOiBnYXRld29ya3MtZ3NjOiBDaGVjayBmaXJtd2FyZSBDUkMgcmVhZHMgZm9yIGVycm9ycw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6A787kaa096485
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 07 Nov 2026 16:07:53 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDC59.000/4jM7vY6hcfz8XrrZ

From: Shao Mingyin <shao.mingyin@zte.com.cn>

gsc_probe() checks the return value of the GSC_FW_VER regmap_read() but
the two reads of GSC_FW_CRC just below it are not checked.  On an I2C
error regmap_read() leaves "reg" holding the value of the previous
successful read (the firmware version, or the CRC low byte), so
gsc->fwcrc ends up with a wrong value that is later printed as the
firmware revision, and the error is silently ignored.

Check both CRC reads and fail the probe with -EIO, matching the handling
of the version read above.

Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index a3301502ce6a..1d697e82ea29 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -219,9 +219,11 @@ static int gsc_probe(struct i2c_client *client)
 		return -EIO;
 	gsc->fwver = reg;
 
-	regmap_read(gsc->regmap, GSC_FW_CRC, &reg);
+	if (regmap_read(gsc->regmap, GSC_FW_CRC, &reg))
+		return -EIO;
 	gsc->fwcrc = reg;
-	regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg);
+	if (regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg))
+		return -EIO;
 	gsc->fwcrc |= reg << 8;
 
 	gsc->i2c_hwmon = devm_i2c_new_dummy_device(dev, client->adapter,
