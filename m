Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733323;
	b=ParEI+2Eu5RkNbl+5somtzMFluTH97fscIyHo2ANkS6bd37ywJ0jPSaskQO72lFP6pgv
	 2VZ1akYH6V5skH822UOCu3Gj2+AjQsjy38zC7tHh76Kxx4eirDZ5Lvq6RZKQ9Jhe9uste
	 orG9n9bVZE5Ix76T4WMzsMbO/4NT00VOy9caT+le4pDPtqkGP6iu7v0YtiNHzZCLxnL0n
	 cZqGNCUlaPelHrXlraQuR9RIoSzCEb5w3ejhUsZXsvDks2Rqt4srdNjJr3STqnhHR1iJo
	 oZYLGLs2ZJWV1p3p52gZgzFtWgYUxj7rHO10Qz6JkdrLCBo+LDeWo8pg9ysQdH9EFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yQmqf4Ja1Z8wMFml1jwizSQhW4WDwS/UNz1lWjL8MPQ=;
	b=HLdkQGkXNbTjjd5CamnfPo45HA9eZ9DTUeplAVoCr4zyY+iy47GE2QKcjlYhviuIQgsN
	 bK3k4NeBMEvbTf+rjc8nVKP9nQ4f8U4PlS10NkMS7Si0+nQ1xhdldvw8wRl/S0Swf2bUY
	 c8N70JOngox9SeWlz8e4hJzQharwrSFkfsJ4zY3Zh3sb9a5o+g2zWrbrbBHfKOImi1C7v
	 g1iU5L9+uk3Rik90nHrlPINRSDLBnMF1me6uZgg+JSMtwnbGsDV6zqK0kBS/F/B2cYlaE
	 l4F+f7pnyxgBOMEnAoBEv/zfGkthJnWECP9xzNEdDcxjj/ZW9tpVlK4mJvFPscPmTWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vp5GH8bU;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1F6606A33F
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1F6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vp5GH8bU
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c247f6687dcso471731666b.2
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733321; x=1795338121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQmqf4Ja1Z8wMFml1jwizSQhW4WDwS/UNz1lWjL8MPQ=;
        b=Vp5GH8bUQdpVzJqWFVYdMLffgXgCJfLgESuO2ELsfqbEPXww1lv/Ki2ZgqTpr3Mm1y
         wvZfGX0L+OyevvTqX9Z8P/b51hY+AzZUtMjx7rIDiosdWn3UwXK4Teyc7ObXt4zs5+5n
         m9HtNdf4Vw61dpp4gILrYEfc8MUAB2VVf/hE9kP0zQMEoqHAxEw6cm2Aj0x45Zsm8wTP
         cO48ZwjbWyk84gjcpnxlghfISAz5qrJsT+AM+GGiHvHZV3TYOXOQDXhvNMTdVb5DSCK0
         41STtRacdM/1zB2HB7VVeZuPFhcJrp0AfzCcFcA+VxNFroV/ze2eRjpYw+7GEjQDgqCp
         wsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733321; x=1795338121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yQmqf4Ja1Z8wMFml1jwizSQhW4WDwS/UNz1lWjL8MPQ=;
        b=16xb8RTiqUB2rI6w1xsGsqRHGFWM9Rw7vFeCM1BlY5BP36BJGf7baMIq6hXstW6oH1
         TCJaArSeNBFPR04p4k2Cfa70wtThaXyrpf60VMZJzMYIPrtU9lgjF5fTfR2hXrrlI2a7
         YRqWZ1XoYl6GN0Y6Vn4qBWp3+bqws0bni/L522OlqKVgYcqCpv3AzCL+9ZHFNnJ06q0P
         wbkhJrVcVn70ogpUFW+IcK/b/jP2xclKriq9yri/os1UT+g84HUcb7wD23vY+wtz4hkW
         W4NTczauEqhpOzxn49jg6hwE3kFhYr5tqQC8sXDi/2S5D1OV8PpXlIcng5Yq1vMyJw96
         hxHQ==
X-Forwarded-Encrypted: i=1; AL+hErEaHIQW9Ez/blOZNxeITOo988atTFSmPg5K20mPyul0GKBVnjYaRiGXPZz/Q4/xO5VYESw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8UyS/vZpOTg0n2+eXtT7Q/s+yrohazKPgr0I03Yxi5tLxOwwg3
	+UYR9/PnwBB7nLBJPJ2eA9L2TBCguevuLytG7TJAP1+FiAmedEUQq1eP6LpAJg==
X-Gm-Gg: AYBFou3tUEvQGc1xf0J5IOtf4rHKdifLpWrIi2OSBeN86SuG6vmlsyBnXF3PvwN9W0T
	yXAZ0XEJnpNQ3+DbHZoOSJOghJRjG3JzGfhPKa2kv8ci5/K/d90NpI8SbsCQe2PmLWobW14FS6B
	zaPpEXCd3b7pntDEZpiwQ2LOpkd6kDPq6Vgctc351/tX89GZTLIhmIMAxVIYsAzRVEW4b39QmNt
	joiSmEbwHiBeFm9WZuhzNTWpE9JSUmzMeG0wRkwZh+v4YJ4q29np3zgiFj9iK/xSbHWf2uP/MLh
	JZlk3C8Hk6TTX3eukoUAmsNMzvJLc2b6YucpwTmT6ymS6fEXkDetpQXZSvdBcu1dWkXiRAcAepI
	Z8xCTzbWe8boOfzdWM19bADrsuMI8FJQewGbzohZHA1fQC2AhtaNpESSIetCsmuqMJvmIiH1r1k
	25WSrfmrzhrGiXthZmZ0PQs8AkQS5Cr1OU96G4k4WNvsz/NTZLNA8COsK0jCajQDpvJHGpbx8Fz
	VVgWHX9k1AvkSaZxADgVIAa+vw2sgqlM3xHbiHHvwb3nib1NL8frZzdQ4b17kVwULnzaoWWiV2c
	FeysXDDcmbRzecuctYSxGSPGi71+mCTW3wOr6fsfXqgM2BUxLjo1WBuiDXfvEp2Op/UMdHregh8
	N4Ju9p4+SUg==
X-Received: by 2002:a17:907:3e9e:b0:c40:4848:f7fa with SMTP id a640c23a62f3a-c50965421ebmr588354466b.44.1794733320589;
        Sun, 15 Nov 2026 01:02:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:59 -0800 (PST)
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
Subject: [PATCH v5 3/5] mfd: max8907: Switch to resource-managed versions of helpers
Date: Sun, 15 Nov 2026 11:01:45 +0200
Message-ID: <20261115090147.95337-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
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
index d5d40d2c7c425..f6d7a4ce9712f 100644
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

