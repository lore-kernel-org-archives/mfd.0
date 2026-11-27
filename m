Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797668;
	b=vbqTmlxb31vowQy0Ykp8PINiVX79orD3b1B4BcpLmNieOXQW9C6OeuSJq5oynF1lpstg
	 +oCb7+AyhhSBMb3n3tCr5B9BYZs5lbuFyKw1LfZx4PqmfG7/4yqAV6/wXNUFnIWjrpzpB
	 oxL2LiYmGk6akkzykZCpdJ+y0uAgstwOfPxUBPhNdI2xY7qs8Mexk1ndvB1QWJdLKwlth
	 uOUGtUe6gC5sMkWb3GSPrMBHg4dYe17j9MrfoFs3ClvLl47j7BJmO6LC2dTShDeP6oS7a
	 3C7M2vsvFRjMjH8SwMzsnAzyXUyr/YtySw1BZTI+qsdGQ2wzeni7lh2ZBwgeTS9bo9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tVdKswOr4QbIStLqt2YNrog3pYH25T6MktJu3RrelFs=;
	b=S1sJS6rLjoy87ziApmIZW28HBvTp2scXvsGyFr7aTVwzNgULerMR+sgS0EbZ09/7xSvN
	 dKm8IHGK4B03JaXOtuuxB2LY7uhAqpr91VlMDqTWI16Xa7RUUssrhzQGADIEIvuzKQTDd
	 J95aC2+9JfU2BAqBt2vRc3o+2GF6Q4IHmiwiDWoNcCAOEPmoSgVIguYj4nk61o8K1ozjb
	 mEB2/gPiuggoHRHyAd4LVSUh+KAa2wd4CgUzTjXrUikdUnXYjaESjB7VC4pUo7QuF83r7
	 LG3jxrmrgF5W/8DuhCJvBb4stso+oFIL3motj9LJQZqKLHt/Tw/25lqFco8F9U5UDFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RU9w4una;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE275606A6AB
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE275606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RU9w4una
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d28f75d62so1348736466b.0
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 08:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797665; x=1796402465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tVdKswOr4QbIStLqt2YNrog3pYH25T6MktJu3RrelFs=;
        b=RU9w4unaArDGN6a7TT6bsMk0RzNhQwXUe4EhMKlEno9/31nMUD0WT0H0n9gvzpIzdS
         oCsaOxM7kH2y7/BEN5fwMt0Jo+0jgcq7/+k9SA4uxwC8mIrWnHLOawzMJ6X4AcbF2QYS
         MSwAmOsDDNwJKH9tV1a15DwKScpLtfCIUpEIuSXdHrgK6qL2O6dNaInJdhghDVqNF6ZE
         4IsAaXk0zhTe0m0AtRW63ucjdDVsaKvEVHCVTpKlOsaXGka66sSMaZsQC7oZImdkiw4v
         XbtyCBcLxkPbKu4h5bFIQxFQZ9Ef5sBygaF4QZ4evpl+yKcjVW6dtoBdyPn4b1bxADMb
         DFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797665; x=1796402465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tVdKswOr4QbIStLqt2YNrog3pYH25T6MktJu3RrelFs=;
        b=S4nEax34m+PUREU4kJv9d8mYvBcL6yzmmpPmO02zd2XIX78fqPEF8elYonK1b+q6Hu
         PF8uHZqOmCD2VZ3dG17mnyEpAs+MySM25qQSWZtfaLkrE09mP+plV6bXQbz2LqjjGeEx
         kpvSAMmXmA3n1i1w5tfeR5HQXgSPnIk7xnjuWKgD+sPbJM8mEctA7O7mUv9ymqkQNwfA
         1D2VK5h7wRVK9+2PaxkyN/xb4Ywwgg+LINN89kSTScF9RDtQ9hDzNBGMpBE2rKtWIZQ6
         H3tHrxR4rZhMBitkngtfOyMcgUXCAiv9nOo5ogLNyj731SFaq0bSk4MHKNt1CHb2TLrB
         G94A==
X-Forwarded-Encrypted: i=1; AL+hErHcKWOQXgjzg5njKI/PNOwwyC7OcgCOaKp8Zjm4p+oQOosmIVca4Lw504sNeqbAmiySmy8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/OfnpNIwLyYH2Yrw3cOu7Z/742YWCMvD5FYQtHPlUrB3eBc5+P
	vdlN0vkIMLW1oYZeaSSEUtCRwR1YeaJpLOWtoJXWhuElDlL0qI1+KPoozD02BQ==
X-Gm-Gg: AZFdTZf2+1P6VXxQQA0Oz1BtxL4huFx+Fqjiq57+PiF6xl6F3lDXg5jl6edQDliufXK
	nIIDD8k+WKbQdIyDVhFsFbK0/5pd9zuvqrkO2R81Dk5Nklqc0LNVvHOpC28qRdYM3gJGig6fNCz
	U5Vu3aSSFQPekhNAIhrpJVQNB/HY8X4V//cnn1o+vEHca3GEDcvb+oxhtn42NblBU7f4/1QKMVw
	N8xtgX69XIu8Nap8YTwdDZ2T+KsK4xXkZjYdJ9NIqFN3STJj/7u3Oo9cNwy9QU2S2xcZ6T0SX4G
	SDT9y0qHdgsIRQHB5lWdbS0SLr1nlAEnTq40tuYLL7f+eTItiqq1htk1a/J5jzjkT6nF5hQ7JgJ
	h13cW+vPsmlNO5+KrLYzWS9xwPQRiipfZyNu8H+wt143f8phFKwQzz1DFmCLwofpYAbNzQjsoDW
	mvoCkAqWCUtf5W8CjGm2AK2FrxMjk8VRHLKHUs0ogUqELbJbKz7hX9e/vv7V/1P1XvJQI+QOl+m
	wVzIWAM5xauwKrCdKeLrar5cjbLuOuRlBezW5fsQdNNaGhw+VoLlTPvcX7bA1eXAzy6rLHxMdUA
	1+7TPXVjSF11wmzmbW7pkO0pVRY0gmMAsEcSeLIqkNoZOOICPL2hIa25FH5YoYRAMPr7p19k2br
	ebIjG2WgDoA==
X-Received: by 2002:a17:906:3814:b0:c41:cf68:bbcf with SMTP id a640c23a62f3a-c513ab497afmr1478444566b.32.1795797665052;
        Fri, 27 Nov 2026 08:41:05 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm885397966b.15.2026.11.27.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:41:04 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 2/6] mfd: max8907: Switch to resource-managed versions of helpers
Date: Fri, 27 Nov 2026 18:40:40 +0200
Message-ID: <20261127164044.285910-3-clamor95@gmail.com>
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

Switch to resource-managed versions of regmap_add_irq_chip() and
i2c_new_dummy_device(). This involves probe refactoring in order to
remove jumps and allows to drop the .remove callback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 140 ++++++++++++++----------------------------
 1 file changed, 46 insertions(+), 94 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 1ecfb313757cc..8091514c28aa1 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -187,117 +187,70 @@ static int max8907_power_off(struct sys_off_data *data)
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
+	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(dev->of_node,
 					"maxim,system-power-controller");
 
-	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
-	if (!max8907) {
-		ret = -ENOMEM;
-		goto err_alloc_drvdata;
-	}
+	max8907 = devm_kzalloc_obj(dev, struct max8907);
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
 
 	if (pm_off) {
-		ret = devm_register_sys_off_handler(&i2c->dev,
-						    SYS_OFF_MODE_POWER_OFF,
+		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
 						    SYS_OFF_PRIO_DEFAULT,
 						    max8907_power_off, max8907);
-		if (ret) {
-			dev_err(&i2c->dev,
-				"failed to register sys-off handler: %d\n",
-				ret);
-			goto err_sys_off;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register sys-off handler\n");
 	}
 
 	return 0;
-
-err_sys_off:
-	mfd_remove_devices(max8907->dev);
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
@@ -320,7 +273,6 @@ static struct i2c_driver max8907_i2c_driver = {
 		.of_match_table = of_match_ptr(max8907_of_match),
 	},
 	.probe = max8907_i2c_probe,
-	.remove = max8907_i2c_remove,
 	.id_table = max8907_i2c_id,
 };
 
-- 
2.53.0

