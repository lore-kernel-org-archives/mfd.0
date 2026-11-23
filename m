Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446167;
	b=Q9qLrY4SQE0/sRd9q2CwiKIt+udBIq8he7Ff7aaLUao22KUB6TNPXCdpUMUTAUD4KEEM
	 5eVvFWN0KtvrUb2SCLLTEnq0v27ihHaOhdYAN2nLHJf9a3VNSbLLpYOgtv5bX5TNA+GoQ
	 u6B0LUBKVqvMwuxuB897Da40xpga/zXbUww3U1y3oWdJY5lavmb3evTVgq1TvP7dpv28l
	 4sLOYFd2wAkqmsJ5002pGOkNDu+BTqQlR0A+TweKyeUWhUowurV2ZLYP/eL/agayw7YUO
	 NcBdhrHhNYPM0KfkMBNn7XIprOGhFqU95dhdOPSyuXqD9fvdq0Xa5PKyX5seRCkL13A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JjuBKnBDosONIf5dJCxa5Uu8aJ5mWHCfU8BLSyQF8eQ=;
	b=SBRLxPsk5nd2jMYiq2ID0ssTHw015ilHqpLS1wfY+VGtpLsYyC+mg7xyUOGpfFJCyBpA
	 tWfoYSOGRy/QbqkGPgC0HY7sDiXtWqwEwVM9n6ObjmMTqvwERULEt8UNvPa5SHml44BRu
	 yY16Zpi3wBowN0yRPFMvnp5yxUVnc4stoMYqdANamJWg+RHycCj0LhbwmMWsebhU9K5Xi
	 VCSJNJBZ04LJxqtmpEgFwl/QOXkWH91KncxQEEg65jhBl+i/ypr0ICb0l/nLgzgf3AG7+
	 itITqT6LyM2m23i7D0NQGS57/AnscGOmo/iWPXJiMjvJCsoR/FqJ23g8UrAJoooWv6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcz153nG;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47A606A68B
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F47A606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcz153nG
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso8244442a12.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446166; x=1796050966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjuBKnBDosONIf5dJCxa5Uu8aJ5mWHCfU8BLSyQF8eQ=;
        b=kcz153nGn31DA7+5ihJsgX6iwtgRmqxifZLSsYPPGHxP/dBgV0z+c+RSPqRrsMPNcE
         zjMKvQZzfodKR0wrdJrYhVI8HDiPAODv5m3QmsoI//iRDdALdKzlRKsxTm+I5U7ePiNN
         MHEpa20EjLrGTOxJvRdrkvPFxnzv0TF7icuLcjNTpxrOXG0IY3maAwPLgtW5RMk3qOrs
         SiJ4DIuDeidP/Y7E/tSFCKPTJc4qD8ocUwxiD50IFbt57XDAWtDYDYZFplvShq9q6/eY
         Lb2ZqF33p785ocFH2za3N9HUu6PZIOnGtEnbk8G5MDGkZ4i7cMPLHWhQcfowpjDwz7bF
         Fhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446166; x=1796050966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JjuBKnBDosONIf5dJCxa5Uu8aJ5mWHCfU8BLSyQF8eQ=;
        b=a5986vCFi9E8lu0tzDotVwq2CNwk0UJQaWSOP4vHzewewnAXV4ggkxsxWtpRyUVX7g
         DzBOc59lu87JySUmA8lUUTFSduDv3L6djKne0Lzh7UwQjznhbSJFILwknP4uh3xC27q+
         eq9LyfLOtPRhZgU0Vml0xIEt+mPIgXAOt9bjLVLG92iW3vUdwP6621JUhVJ3SA7hhId3
         ATdbjt2hHpQ3lQFJGlucftG3dymtj8YD/KPBmV/FdvrTiWVPbH6OC1G6QDcBJ8w/72uq
         6qtkYyiPg8sFCk5QLvQDfr//rCCezDG8AxJbPgxVgJdy7+l0Q+U2RvvG+G7WJgrjSq7w
         R9UQ==
X-Forwarded-Encrypted: i=1; AL+hErFPDJLtqOqedtydjZmPNONeDlp+SYAXhV8apgq0hVL5aZZE8JLGRPugZCyBqGDnoquFmD0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/zQd3a+55mz4iCrQ5mOsljrw7pdqHtR1Iia+huJ0gXL8VGsv6z
	5CrYnjLDC7v/iCX1xTig04YjZS30hH+mXQQpwj0Vo8WYWiIADQaz9o6s
X-Gm-Gg: AZFdTZc6mYWZ8xTutWDtQlqm041grPVcnIFmJhuG8OHhGJf1xeJpDsQNKvzgjlbc2t0
	/yIFFJxjcEaGPXoxjuvsSM9d0Wxggs+7DVuvj9kS7RQUHk4SYRC+KbBvg53gfRHhpyvmqJNLXTy
	Jd3KhL8EH8N2Mcuj1He5MKatrxgFCDXq2sjILkxUCWJ1ZyvRFF+rq2sBwxj3vL+0d852Hf9V07p
	jaRcNwXA38AfX9stZXwHwpBwiw6DGVyFDCAoaDFH9f/73Hw4R0wBgA5CsscnFXAbAlQTmwgKT+Y
	xvQuvkkTYyWQeTitVXWTq0KPH25KoSvdiV6fWE+ewcIlWtYaa+eT6TaLBpL/OU0RzgxWxSCQaVT
	ytHj9IOyyDjoP5f7oIttnE2VTioNWQP2Hq/3veYXSI4oP5ghgAeJbCmSCXV7oldI03USHWNcRtG
	P9zy2PHQFc2sBEXTTEedhjkDpI6aTZTk5R1ieSnWceSFkFk4VpcBva+JjMt5x2ByIblHH4dKKAz
	QnCMqmux9PRAe0Sh7MbCkDBTS0TXAGZ0fFANzteWImHdA7+v4yLT+qb5sQwSOuPXKsuVcwKgA2R
	/5KUKZG7hXgrLx5nJ1J8S2i7Wki7hAdre1U4/4XPRvpLn1kvd8zXbLXq45rYHwldt0NxgtbLArU
	TVPAwrie0Iw==
X-Received: by 2002:a17:907:1c8f:b0:c50:9412:93f0 with SMTP id a640c23a62f3a-c51317e3208mr1047945666b.8.1795446165573;
        Mon, 23 Nov 2026 07:02:45 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 2/5] mfd: max8907: Remove platform_data based probing
Date: Mon, 23 Nov 2026 17:02:21 +0200
Message-ID: <20261123150224.199601-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
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

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 | 8 +-------
 drivers/regulator/max8907-regulator.c | 8 +++-----
 include/linux/mfd/max8907.h           | 5 -----
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 2f91791410538..a0e0c480ff43e 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -188,13 +188,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	struct max8907_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	bool pm_off = false;
-
-	if (pdata)
-		pm_off = pdata->pm_off;
-	else if (i2c->dev.of_node)
-		pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(i2c->dev.of_node,
 					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index fd227fd136121..84de0c443c945 100644
--- a/drivers/regulator/max8907-regulator.c
+++ b/drivers/regulator/max8907-regulator.c
@@ -274,7 +274,6 @@ static inline struct device_node *match_of_node(int index)
 static int max8907_regulator_probe(struct platform_device *pdev)
 {
 	struct max8907 *max8907 = dev_get_drvdata(pdev->dev.parent);
-	struct max8907_platform_data *pdata = dev_get_platdata(max8907->dev);
 	int ret;
 	struct max8907_regulator *pmic;
 	unsigned int val;
@@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		struct regulator_dev *rdev;
 
 		config.dev = pdev->dev.parent;
-		if (pdata)
-			idata = pdata->init_data[i];
-		else
-			idata = match_init_data(i);
+
+		idata = match_init_data(i);
+
 		config.init_data = idata;
 		config.driver_data = pmic;
 		config.regmap = max8907->regmap_gen;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 4be3c2370e2a4..e222250f0cc1e 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -227,11 +227,6 @@ enum {
 	MAX8907_IRQ_RTC_ALARM0,
 };
 
-struct max8907_platform_data {
-	struct regulator_init_data *init_data[MAX8907_NUM_REGULATORS];
-	bool pm_off;
-};
-
 struct regmap_irq_chips_data;
 
 struct max8907 {
-- 
2.53.0

