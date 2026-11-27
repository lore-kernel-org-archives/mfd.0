Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797666;
	b=EENZWTh3OUXI4LH1raXkWGxmWHnjiQFAwhnZAr9UahyhSjcZuQmqxB3y563cwgkd+tE+
	 Natfurj7NgUhgy7DUMR6RiahnlHWm+/8N8AzKxeuMHUFaSZmmqM+AdM/s7yv2D+qvRd7A
	 fiphfCW2P+Neo4VyovBcgvVPw7384IBDvU36LIOUWIh1fxDNHQugN9u83Tyq+/nu+9IEF
	 3zEuyiV5jwLYwARp82se/eydn75rsxlf4WVkSI01m2Z+KIYD3KFHjV+dZNYhuXk1iFLFu
	 RSZ7Qym7enQf2zy6APAV0glS5ApLRbY4DkSLw/kl2LCtS+eciz5df1UtlO8M2R0PcHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uG5JxLGrv1nNKZ+yQ+rxZ9VqDOk21eO6r4YsffFQfF4=;
	b=DjKmQD8OrEeiKezkwvDtO9E7kVlDSnUWCqdqQylxjyT4OOKoT85RLR0guhTMs6GYRMqX
	 rzu9i/0MyLbNyCMJyGYM4ymLWOAA8aObygCxLB7Ag0BGN7B+dpolUuhM9IFbZm61eAJTi
	 5ui0UDYWSgAGLV6CZN8f9FfNGOS2qhHIn8jdqVQSoXLTTpspTle+7wXfLa6Qr2sdWPxqx
	 O8Elde/LI6P83dEJTC7jcW6yjmwi8baCpSIGROftAlTq4CIJo9L8ssmoDPzRY1UHkizNo
	 Z0iO/Aco8iK9DXvkFEQInBIE/e4kFwn3dJ3kdWDOCyA6HADl0M8hl9RbLtHiYGVraIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xA/FtVoZ";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9327C606A695
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9327C606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xA/FtVoZ
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5127c7abd5so1266967966b.3
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 08:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797664; x=1796402464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uG5JxLGrv1nNKZ+yQ+rxZ9VqDOk21eO6r4YsffFQfF4=;
        b=xA/FtVoZ/cUpXyaQ4/KTiA0t14aM3POE3OBxtKxpTmrwKjntC3fnTb2HdHAlvLfCua
         VjXxjMTmlHwhTl3MazMgHUG9z+57quvfGzFtpMVGL0z6YvSeOei8c5lVF9D4oQS78Cf/
         xe1JsKIio2Cv3QPIzUsTJxUQV9tnAD0bR4TF2QFnBU5Et4piWTgwCZ68yJ0znX8CIflB
         WOONHCYmuIAuI+0P/vLwvIakhD/p358UCFA8AnsrS9pEaBMGA4rnvt3MTKfK8enlqEH1
         zhY3uP1aFbOpJM1pDrQ+Bn5pIiu7k/T0HOSD0TnaeCvqL5iW2IEgoQ0aDZkgJ8kBKGJ0
         lXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797664; x=1796402464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uG5JxLGrv1nNKZ+yQ+rxZ9VqDOk21eO6r4YsffFQfF4=;
        b=U7bcZZ7+CEDEc5kIJjf+KAmulnn0gn75GkDLNj28AUy7D0zY31OXouTA01YamvMovN
         yWN/zDOtyinbraMncRLtAeCe9GtHAMae0y4i1Wqv2tZBuc6bgm8h4p+MAMvgpwkSTjQs
         qzIlnXxUWBTxUV5R9PVtojx30F59Xxzndo6u2jTl2IJn9vj0Kp6D5ZL5ufmuDP6ZTIKC
         bYEeQ7hcFMtS7nWwpdQYRfrkG7mo0ER+nOODVkt4k/LEh0zj3xV6q2erB82stBryI2H2
         cUvOByV90wXNvNLVImiFIJBk0Hl7RI2mcltGVWAtjmXaDytiaSG+AbQCANeAaHOj3ECY
         bXMw==
X-Forwarded-Encrypted: i=1; AL+hErGQl9s9tjGYHyek7YgE2q8pCX0W9yZ2518YnGoOk7Rh15Mh0hBC1lwRoYyBN27o88ueyyg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8npv4jN+H8H6or0ndXHrQJq5vu09FeIDpqHaInt2Md0rX4PhMI
	a7K9jB6pzz9CyvDECyb7wW94i7FX8vxKjPeUi5W9TP66M9m3Ex+1cf6B60UrBw==
X-Gm-Gg: AZFdTZf3q4s1x3nqwWaLa+f+ntWW2mguuri0zeHYRdKN7OqCfXX0Y4nOmQH6xkPn+4C
	fMbpK98e9d/9/IhMGIaBAtU7fSdDKxt6MB02wqaD+qirSnyUdOrDRQ5hk5ocwiuqBimev26GxxA
	lwmqPnf5vsN2CTzkZjd2+dhtn0z4pm+LmuCHkJy+BHipsFsEHAm75Pd7MyVC0Z+bS4lPDquQ4PC
	0BvBwpv92huThnKdM7bDaCp+8kbJNOV+iAIJdM1fNGwd4/SIBxmGT/OYw2vVUYveuDWCnmmSvz1
	ko7yiWbzEYHTWyYiBb15Tr1CqK3vHqumav4kZtpy5EzsLGpmCaaPiETZa6+zlvK/Z6uLYoEwWdm
	TSEWg+3y1mQnN7DCVv7TRwmPDYCoW5TmyrrOli/qQVAyUgD3psINzwUgb94hMmRq3qIEzfWOVsY
	z9tYz8yMBaVdhDIXmEBsRetQbYMeF3hpctlX+ipHUilOkLe8bOxrOKx4ag/Z3wclqHeaemzuDep
	yzIVENSzBOn25PkmfJrfOGEqLof6gEoED+BH+O4WXTYg3+Ri5Id3hyUELY9UMEf5TANl95dCqIi
	RGab9EMDNghYQSjc+IqU3YpKBvA0KO0BKajIzBXQptT9GEKkHDPgA+Ab/YhMoyL/C/Lw0PEzcz0
	mmI9YM/5Wkw==
X-Received: by 2002:a17:907:60c8:b0:c51:de44:dcdf with SMTP id a640c23a62f3a-c51de44dddemr248191066b.43.1795797663954;
        Fri, 27 Nov 2026 08:41:03 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 1/6] mfd: max8907: Remove platform_data based probing
Date: Fri, 27 Nov 2026 18:40:39 +0200
Message-ID: <20261127164044.285910-2-clamor95@gmail.com>
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
index 88d2448ae3a31..1ecfb313757cc 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -189,13 +189,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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
index 82e195fefc6d7..35b2ede54f856 100644
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

