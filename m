Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101615;
	b=MnoN18dP8BqoCZhfCl5q2ZdIV8hRR/Egiygihfwxll5//2usYQklOtkOd1d5+I3jJnvt
	 aoo7FKhi/b9gew+Ks6FoSRq7eZ38SGbqe1QqcEIeaeKyxHeIbIRHKFYbakJppxGh5fpj9
	 8G1k4T2OskdrSj266kkOlrzpXU355NUwmQCglBJqQlFYzfsjMOaccggtnJp7h/v9mTlpk
	 tJm1iKdGnBvMQ8RS3PgeWrXpo5Q8K67gP0U/dbvEhVJBIwqoYhkEUgPG/OPSutyHdoWxm
	 pab7+FKcqWEGLozkQzVK6l66kruquuO9gU1djJ15FOjMPUIsFFARfsH8VGdEg4227EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PrGVcr7lTIwJczC3an0BTfgU2CbCkLrUmq4RV7ahjvk=;
	b=yEGrRRdaLWEXF1Q3YEK5ALm+rjQGJlmJbfNDHc7a4CVbV3bukyVTVf372zcJQxTwla6i
	 FvLsN0u7tG9SFMVlV+hnA8uYui3Blmi3c4O3lTjDkcuRGsfTZswKMLmbORZ6d8s3rlLsm
	 z7hVbkJyWH22MFkbcWrAOK2eq3ZeWdig4i8bQJSj/nNsixFgc6GJBtJgv8WhGHZNuWi81
	 Muux/RKBx368ZnjY+aexGf/50Iec1bGb85WTDvcohosTeIYstxluQPxvYcQhkreIXUWHP
	 3dTnsdim1Pzr+5SxTH9xhFgb3SkkiD3vDvz7SNqnbheVaUP+GY4qCBkaKfVWt/pzVZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RwvGXRBs;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04C7606A875
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04C7606A875
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RwvGXRBs
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4677aad67bso422372566b.0
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101613; x=1793706413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrGVcr7lTIwJczC3an0BTfgU2CbCkLrUmq4RV7ahjvk=;
        b=RwvGXRBsvu6gZ5Hjmr2P/V1qPvJRYCNkvgbqEkEAXiH0uCVKXuJdh1CogGnkLAarjY
         6VMyFnfK74UcXRZqNXrCxODnWuPZD6svX+s8jR2EIrFgusVJfotuKoWhDGaVFQp7m1Lg
         jEkcSGM7yyEiu3vlVxc+L0zCA1oSPTG67nCxfWX/Tdln1Z8vUBgq1oHjTTuiUcbhsLhH
         rCQxnGZGzJC9NBKSzv3E7E5np0h+fQ/lhRYE5l9vB0TExiQue/xDa+yr2ki+y4ae9FU3
         aYcQ9BI2ZV2XIOlVhhfa+IMIUtF3ZCc/gYxNPIJ/tPch1GCZ4Mn6BnxW4J1PsXk9ZCLq
         WoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101613; x=1793706413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrGVcr7lTIwJczC3an0BTfgU2CbCkLrUmq4RV7ahjvk=;
        b=nXh3vhU5Oy9dIYHeiuyLkT3bbIr2UIRHzdKtKN+XG9RVeo0vbclTkj/8lfY3pXX1mC
         eyltoGLBKjBBns2eVQBGp9rANCjef8PwDa5A5k9EIsw/DiMn5LrQbFD/2rGrzGGb6EjN
         LSBCE8D2YJsCS5nD8g8ALC5HMj5/fmSbfj5xO0HcHzB2XiES8g6aPfu03KssJvwmVchs
         sL/oNGZheDDjDY09yJZnCK9ngEtALmjUoZJ6pSQAQrAYlaRy81EA5CJbNGc8BC1J2KrJ
         8zIkLUtuVknRrQxfHhtOZBoOp4zeqluOvHjwn5D848Ddv8KmKF48QNXraVfYrdpabmMI
         8HSw==
X-Forwarded-Encrypted: i=1; AKwUvBx5vX+oLCkEt0QVm91cCIgQ6SVy6BW55apsaRJnJpxV3mdjQACg9zoaq0BRciK1a74Q/AU=@lists.linux.dev
X-Gm-Message-State: AFq9FYI54OLMS1uAEmuw2OMzhaMIGpHX8DvtJ+IIXN3BTX2R0obEPwDO
	b2tf2CTRwK3Cm/7q6uK+qInCGlcQNnijUr96HT5TJQIL0/iVGzJH88KL
X-Gm-Gg: AYBFou3Ir+xYqLIJHSWUcfDa81Y90PeqnJpOdJMospW2olYH2GJMRLkwBRbZb8m85zG
	P4V2vPpIp8/iARr/idI9fv5Pv6kDn/t7gakFxtGki0FmyaAD8sv0+HSRVz0/deUTAZc2ukWPgTg
	dmFb7SxhCAvUmz49Cf5gJRNG6gy1o4TMZ+8VjQME1Dn0YD43/cQMe966UvTrRIiJLtkSZ/nijJJ
	pdGaTf0b6SaGDSu3D1gwViX/Pk34g1FgxKcNDNeMaU5enKI4V/A3VhAX9Qzd/dtRS/X0WUqsgUz
	xVYUCwZakv1PNJ3sP4EGAB8v3DXne+9QTznV29yfkLY+3DjnrHpeNf16YIareI64J2M5DBr1B+n
	7IeW8WovlfjdBNJ76uPa8AkaW3+rP5QgjanwpBUQ7iMDsjxeKDq021emhxbse6T85TG455IIfhs
	ryzJ+IKzxM4Q26ZKl24Z2Pkl6vUfeC352I6VdbTKqMLmbKoBy15MV+E7lQft+MjfrVF3HIzCcUr
	rg8Yh1Rb58+a0U9c6vQBchPErsKF8yFVAgumNWjjgxKzegJEVodeKxZi89nYQv+2kVpx7mMYpw3
X-Received: by 2002:a17:907:3ccc:b0:c29:f5d8:9c75 with SMTP id a640c23a62f3a-c46bde7eabemr1005881666b.36.1793101612946;
        Tue, 27 Oct 2026 04:46:52 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:52 -0700 (PDT)
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
Subject: [PATCH v4 3/4] mfd: max8907: Switch to resource-managed versions of helpers
Date: Tue, 27 Oct 2026 13:46:33 +0200
Message-ID: <20261027114634.79706-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027114634.79706-1-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
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

Switch to resource-managed versions of regmap_add_irq_chip() and
i2c_new_dummy_device(). This involves probe refactoring in order to
remove jumps and allows to drop the .remove callback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 127 ++++++++++++++----------------------------
 1 file changed, 43 insertions(+), 84 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 363ac80c0593b..2a38e00a10c3b 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -182,73 +182,60 @@ static void max8907_power_off(void)
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
+	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(dev->of_node,
 					"maxim,system-power-controller");
 
-	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
-	if (!max8907) {
-		ret = -ENOMEM;
-		goto err_alloc_drvdata;
-	}
+	max8907 = devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
+	if (!max8907)
+		return -ENOMEM;
 
-	max8907->dev = &i2c->dev;
+	max8907->dev = dev;
 	max8907->i2c_gen = i2c;
 	i2c_set_clientdata(i2c, max8907);
+
 	max8907->regmap_gen = devm_regmap_init_i2c(i2c,
-						&max8907_regmap_gen_config);
-	if (IS_ERR(max8907->regmap_gen)) {
-		ret = PTR_ERR(max8907->regmap_gen);
-		dev_err(&i2c->dev, "gen regmap init failed: %d\n", ret);
-		goto err_regmap_gen;
-	}
+						   &max8907_regmap_gen_config);
+	if (IS_ERR(max8907->regmap_gen))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_gen),
+				     "GEN regmap init failed\n");
 
-	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
-	if (IS_ERR(max8907->i2c_rtc)) {
-		ret = PTR_ERR(max8907->i2c_rtc);
-		goto err_dummy_rtc;
-	}
-	i2c_set_clientdata(max8907->i2c_rtc, max8907);
-	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
-						&max8907_regmap_rtc_config);
-	if (IS_ERR(max8907->regmap_rtc)) {
-		ret = PTR_ERR(max8907->regmap_rtc);
-		dev_err(&i2c->dev, "rtc regmap init failed: %d\n", ret);
-		goto err_regmap_rtc;
-	}
+	max8907->i2c_rtc = devm_i2c_new_dummy_device(dev, i2c->adapter, MAX8907_RTC_I2C_ADDR);
+	if (IS_ERR(max8907->i2c_rtc))
+		return PTR_ERR(max8907->i2c_rtc);
 
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED,
-				  -1, &max8907_chg_irq_chip,
-				  &max8907->irqc_chg);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add chg irq chip: %d\n", ret);
-		goto err_irqc_chg;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_gen, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_on_off_irq_chip,
-				  &max8907->irqc_on_off);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add on off irq chip: %d\n", ret);
-		goto err_irqc_on_off;
-	}
-	ret = regmap_add_irq_chip(max8907->regmap_rtc, max8907->i2c_gen->irq,
-				  IRQF_ONESHOT | IRQF_SHARED, -1,
-				  &max8907_rtc_irq_chip,
-				  &max8907->irqc_rtc);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add rtc irq chip: %d\n", ret);
-		goto err_irqc_rtc;
-	}
+	i2c_set_clientdata(max8907->i2c_rtc, max8907);
 
-	ret = mfd_add_devices(max8907->dev, -1, max8907_cells,
-			      ARRAY_SIZE(max8907_cells), NULL, 0, NULL);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "failed to add MFD devices %d\n", ret);
-		goto err_add_devices;
-	}
+	max8907->regmap_rtc = devm_regmap_init_i2c(max8907->i2c_rtc,
+						   &max8907_regmap_rtc_config);
+	if (IS_ERR(max8907->regmap_rtc))
+		return dev_err_probe(dev, PTR_ERR(max8907->regmap_rtc),
+				     "RTC regmap init failed\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_chg_irq_chip,
+				       &max8907->irqc_chg);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add chg irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_gen, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_on_off_irq_chip,
+				       &max8907->irqc_on_off);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add on off irq chip\n");
+
+	ret = devm_regmap_add_irq_chip(dev, max8907->regmap_rtc, max8907->i2c_gen->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, -1, &max8907_rtc_irq_chip,
+				       &max8907->irqc_rtc);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add rtc irq chip\n");
+
+	ret = devm_mfd_add_devices(dev, -1, max8907_cells, ARRAY_SIZE(max8907_cells),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
 	if (pm_off && !pm_power_off) {
 		max8907_pm_off = max8907;
@@ -256,33 +243,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	}
 
 	return 0;
-
-err_add_devices:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-err_irqc_rtc:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-err_irqc_on_off:
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-err_irqc_chg:
-err_regmap_rtc:
-	i2c_unregister_device(max8907->i2c_rtc);
-err_dummy_rtc:
-err_regmap_gen:
-err_alloc_drvdata:
-	return ret;
-}
-
-static void max8907_i2c_remove(struct i2c_client *i2c)
-{
-	struct max8907 *max8907 = i2c_get_clientdata(i2c);
-
-	mfd_remove_devices(max8907->dev);
-
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_rtc);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_on_off);
-	regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
-
-	i2c_unregister_device(max8907->i2c_rtc);
 }
 
 #ifdef CONFIG_OF
@@ -305,7 +265,6 @@ static struct i2c_driver max8907_i2c_driver = {
 		.of_match_table = of_match_ptr(max8907_of_match),
 	},
 	.probe = max8907_i2c_probe,
-	.remove = max8907_i2c_remove,
 	.id_table = max8907_i2c_id,
 };
 
-- 
2.53.0

