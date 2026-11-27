Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797673;
	b=i5nVqHTP6oHSrMPrUx6FqkBbRPrCD3FyOxu/BXndgd7qY4cWS+PCmQ3/2cEGhnCUNMtF
	 CP8iHxQZucv826cdj0utuClBeRgdvidpMReC0colBN12Ck8fRxsVNgn7EO+fIU2pvhyTD
	 c1k62SSDawYwD85Ftg6Ba0B8U2N0u64/shWCvfV9LywhcW6cVlUd4tamtlBuLujALaTof
	 nhsgrV3l0HcJ7RPL7PDMskllomah40PYCuyl29+i/u8edJlVYpBPF8xOjun5YhpJz2Gy3
	 cUSzGYkqVMEw69Ozs+atVkm3fV423E8c+WG1aZuk+xlxc5Uh6WQvHFWqq2spF1IARBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5N0OVRWzESFMIcAIN5lBl11eGWM/IXTJun2FVNhsjY8=;
	b=tAnRWS64n+auxw2k72HdnD1aFErL8ZIudvK27RO/FKj9+lZe/hXG8Fe1tMzKAp3otznJ
	 YDtryH6JAlZVpMSvExu2r815rAizIUMx5auWvR/N+rJ6XzUjK2qJ5eUlIgWBUdNVTqoYg
	 iXDq1XhMhz7a27YdsoSrTzlAazCp5q/MQ4zI6qP93fjrPhdPe7NNY2ZRKh0PpM9HkJiSV
	 XWDdTw0tdNt6Lod/g/lyZXugZOEzVT+sBNiWfqv/t987kfCFVQtmX6Q1rwne2yO22RoXk
	 U3Wluo5y3bsvk+z91Cs2LDYSeLvw6BajLEL4CwWuHUvGVu4b7emDYbbDriwwTKA4Kyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GQGkQW/l";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A8606A6B6
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5A8606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GQGkQW/l
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c506a231b88so1105640766b.3
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 08:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797666; x=1796402466; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5N0OVRWzESFMIcAIN5lBl11eGWM/IXTJun2FVNhsjY8=;
        b=GQGkQW/l+WLXwXtTfAKkcFAlW6ZHusQHvGsi+EuQD708WBvfjYPuOlDdZUBt4O7xrZ
         rnZcHOf+COQGJfIMVkk4/t6cGLp18d3TY1v/cDijM7eKY/oiyrnoAQvMwN4bi+VY+Zpr
         V1MLzdapgO53+Rirt5Q/S0nFXxigP0KNMWZ129pw6OtQ6qPXEF39D1TytX+fn8nxr6j0
         S6Ex5QTnCB8OfZkp+gq0a36GgWFWh6QVlnWCICR1TpyHpvL+imS2vCtJYLepvrwRriLI
         jMhX6EYXGrVhTVmbI8kgK1hkjp4LPPnW8i8+lurscyZUbA5JoYnXoXSekwiF7josev7h
         h8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797666; x=1796402466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5N0OVRWzESFMIcAIN5lBl11eGWM/IXTJun2FVNhsjY8=;
        b=wrv4+5qmG+IGvJZOSSH3VGwVgyou/cImKd+u4n7qKaFXEP/+kVuWcfZNa8TE+EnKBH
         Pt5zUm+br6p6Qw1tvUnLaJ3NV7GkMc4Ehz3OT1BaTVOaHb3k9Cv4d7ZLWgdWrYD98eNV
         +5u2yag763MmOq57BIaPZk4sh5hmcimbuUJZ9oeVAO0rQObR2Cp+4wJAkXNmiWz4+1k8
         Xvf9YcrckEI4g7Zk8lGJQ7ThqxaMKcG0+xyitbsiJo+QTt0eXcfCLX1Nkl241k6+Thx4
         V4pY62h/5Yk2GzFQxppIJUwrgHkGz0PLYciSp9XktSha55xqW3otMRiuxjLjzlRcPJHs
         PKTw==
X-Forwarded-Encrypted: i=1; AL+hErHPMMbxK3xHDj0mwvgsZ9Pom8Y4XG9sLDTopgVR6lMMv07zfKRpy/PN4nMVZw6dVs5qazY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/pVCQlCStLa0ZANiLxfLKOSLImC/BRsk+UYeBNvkr7g1UZj2As
	2HV/8Ot2SqJ4I9RnD97v1ETLvJhDZVlsNyq7FHWTkgsecuxgZ3TK9h1K
X-Gm-Gg: AZFdTZe7zeFUuOFOcVldLwEZP/XpmAm3+tCF5nO8gOnAMskT/QXnHxBdooCypMamUZD
	WVeUDtzz/Kftvs26rpcbC399JKaybCYoOfOAN+pilBLTpFdjd6jF+JVufDsROo8PBFc0uMaP2OK
	a6awbxV68QttQp+EAasKOKGd30rM8S1RisTtPVWtPnxCoNcJxCP2iv/MTEGqdL5U3mfdu45gQdi
	iGj6BVUd2o60YvtUKXnWfUbBKkliMxpww7tYqcNLmB7Z1iOUWbVCU6oyOI2q1A6LkzeBjZ3TW9i
	cZer4ixLBrKdThKrTST3XEjPTwdszPxVUNQqNQuX6L79aVAPZmkDy9F11DNIN0oT/NGQQ7r+J3f
	7IzY9w8a2+pE17Rp3XpsAA9KR2YDMFyZEJJKpbelhPoWVyPvpJiIbYNcLm3HRfKJsM5wokJpD1F
	uXlhT7ZwLkL0dJhQi8VaJXZRP5M2kmPwDr5THYmzCyLNQuU8lCQWV8d5prRNVLHAcbLmGehYpK8
	Sg9VPcu6IqhP+T7KgnASnXqjQV+k2Y1RtjcgaWgDTJFfvORTMNDZMhtWl4VjtO+QTf6cFEcVOjH
	po3umMMUKUVv4rI+zkjJB6w4TJfSYGdRwp8SjfWaOHjiVhwO6sNYPQPwE4HN5lIkzSK4YShlRAV
	SGi/b0kgKlA==
X-Received: by 2002:a17:906:6057:b0:c49:df95:f0dc with SMTP id a640c23a62f3a-c513a60f3dcmr1627450166b.19.1795797666109;
        Fri, 27 Nov 2026 08:41:06 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 3/6] mfd: max8907: Convert to use device managed poweroff handler
Date: Fri, 27 Nov 2026 18:40:41 +0200
Message-ID: <20261127164044.285910-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127164044.285910-1-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
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

Replace devm_register_sys_off_handler() function with the dedicated
devm_register_power_off_handler() helper.

There are no in-kernel users of maxim,system-power-controller property and
all new users will use generic system-power-controller so check for the
legacy property can be removed.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 8091514c28aa1..f6eeefb419622 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -190,8 +190,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(dev, struct max8907);
 	if (!max8907)
@@ -242,12 +240,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off) {
-		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
-						    SYS_OFF_PRIO_DEFAULT,
-						    max8907_power_off, max8907);
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
-			return dev_err_probe(dev, ret, "failed to register sys-off handler\n");
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0

