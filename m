Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446171;
	b=v4+mAoBGVEGyATuJ86ucSGGEuoVzj1QlqHjudQLucsQxwaAlxgDdCyYnPRhnGj8nwJig
	 8brwPhJdPdGFVYp8v94UhfyW/fH/+7WZ2Yd5F3ZyZLGg1X+oPoncTPvtkxu29CKIHk+9g
	 0cklUCJhbhkmrE2OrMLF0D0c+EZjNOE+VplNOR/6KjNznvYQ6DewiWEOJ5LCR2AwPuTqI
	 NNuXtx12he74HBml7g907458+vTkCIsdjri2bmD2S12fwC1UYdEgbfZHj5q5Mv2O7h+AU
	 xn/NXSb1yUsgPrPL6+EKzSng7qs3IPma1xjxJOCKQXdpUzK2FXDb09pOOVQdDiKEPxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d1ZJTOlPpkmyEezbE4KbgiuX0pNhZ8GISGXxCw031pI=;
	b=qRgt/bKaBKscu4Lgxf9x9GEUO+CvHI0JaJVk2iKlOWJ17EBv7kJpGzHSNeccvZPan95f
	 b3NnUfQ3DL4cqklteDgO2qKk0ZCs00yED6PQbymDEeA956SETyVPoBbU1NErvblooL8t7
	 S0yZVyvVBCkm0e0Y/VcOeeCRam1C/3QOq6PHrQR++f3vOofkPTlXFcowSWMdOqxECrJsq
	 GtXP7lhtTuLh8SzDJnSPPSiG33QzuUKqJuMHktb11uieqVvtCp9JvJq6i2zkyrgUaB9rM
	 IJo1aDkpXCLFqD/q736Vk9USaLWJTe/H1WVFaA9It/4n0DaD3vipQd1/CIUXyvT24Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V/RfTlnC";
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC4C606A6A3
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EC4C606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V/RfTlnC
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b87a1a2babso8244541a12.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 07:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446168; x=1796050968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1ZJTOlPpkmyEezbE4KbgiuX0pNhZ8GISGXxCw031pI=;
        b=V/RfTlnCYkfnvl2xc34B/A8PTdhmzFyIdXqGoX/SNJZI/2nOoHlyRsrjYB6LFenFHq
         cE2PP/Ia4gtP7GawXOUe65wLHsmiusYdY01fRqWqd69mPMuKFoNpMOJKc2g3KMVaJofg
         a0qeI6wqE0+IaQc7mfkcQUh/hcL9T6rd1TJCdGSFdzp1e3NnMIO/yYdhy1xBqsIZzcfa
         R2XVQFgfdnlt2IJFhG8RB1WkdxnsouhyHCp63zjd6SU1lAkGNuSjb++9p0uzYqLgEDLz
         8pWEgwJJUaw353w0DzA3VcYFdXBaI7lb62vxEObUpWup0jDf+QxsstjLd3LNExQzH1Vj
         jtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446168; x=1796050968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1ZJTOlPpkmyEezbE4KbgiuX0pNhZ8GISGXxCw031pI=;
        b=0gLxtgCG5jBkaWVQ1n1f4R2epF1s7Hk97S24OJKrhVMS+hBQwLqwmIerTTkm0KRwd4
         LpPlyKb7NecuspNrfCqA0qI4s5eL/CFk/R8ICdR+mX6ZniwdE/p/M8lUazyJR7VNVr9p
         WAwN2Ai8qCUruz8eAcHDQr6/mQd1CVu0Gc4vTBDkV2m8YBZYc8myCMcO567yQezN9/QQ
         VtgXbxPo9XW5eyjO/HAgwhN64TZbDSWnPV/KB6aUejNAL2vL8KQ9WErTWvxJOqDue8Ha
         +3jcEInI3wWvqThc5NfuwSAC5XJ5bjX7/CIznLaabBoQ149QjH/d1gLPouPk0heZdGZA
         /xwg==
X-Forwarded-Encrypted: i=1; AL+hErGnRllujYJOPE46G45WiN2p6eInhF8oQ7bS43pRPqO+P8bAjTZ3M/Pd2CY0Ss7eNoKjKSw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/p2He5W4XK2q6+An9BNyD9eIXY15oFlhmGq3lNk1NdbanvMR99
	Br7w0G2Hu7/6tXmQJMnUB5keVNpI+v7q3+0zngpgvNclMbxtiRbtzfQn
X-Gm-Gg: AZFdTZcNrRVAoJQDTIxjJx1C3nEMvS6GwIcWbCJ+9HAPLljb9zSqnfYgBTKSyERtchk
	zK2AxpmJ0RQidFqAvxYppq9NqTEMmMynr6YAqFIUppvEOLrIbTDCfiqqUo0YS48hbct3hnYSLCW
	CMFvZFyweEWgVapzNBE4Bo4fV9US8J1P7d6Yx6C0BTwyBAyExoIQVB+Fhsb06uXOLIR7RDZlWGo
	7qNtDLQpUWQDm27Rckfj5axBss5u6CQiBSzB/KlBPn1xjeL+GmxYnmtCII+lqFgUCXMcut7xur6
	+ML2pkenlYupDHYlVJyz/T8xb543bR2fgpk4lFS33roU+A9lXUlAOa85ieZzodomkORn0sGpuJ5
	B/jy39sBgVWWDJWlL7xqF+nwXD3nrLi7lYVvgyqrOnzkO6mx+E92qrSpBhzTrAI136b1OTEIvtj
	AV1JK8FKCoSnydhp45yrECeeGR9CFPbgfmFKe1GFdPD04CGKw9UchvX8UaBpY4BY+oqys8LeRqM
	W//vXYK4hCgM97igI1c3m1jc+IuNc6QdlhiE8NWEGiAILIIfPh71Nvfr3SO5nza1LvpjsY7DJ0r
	4SCu7WuVtriqfRl3x5Zuf/FDwNibI6DFP6MoJwcfU7O6KHJsWHEiD5Z4XOPD76ZHmCUV44I9Jb/
	goxuYNudw2g==
X-Received: by 2002:a17:906:9fca:b0:c51:8690:8265 with SMTP id a640c23a62f3a-c5186908490mr137322066b.24.1795446166955;
        Mon, 23 Nov 2026 07:02:46 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:46 -0800 (PST)
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
Subject: [PATCH v6 3/5] mfd: max8907: Switch to resource-managed versions of helpers
Date: Mon, 23 Nov 2026 17:02:22 +0200
Message-ID: <20261123150224.199601-4-clamor95@gmail.com>
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

Switch to resource-managed versions of regmap_add_irq_chip() and
i2c_new_dummy_device(). This involves probe refactoring in order to
remove jumps and allows to drop the .remove callback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 140 ++++++++++++++----------------------------
 1 file changed, 46 insertions(+), 94 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index a0e0c480ff43e..f1cabb666d8ed 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -186,117 +186,70 @@ static int max8907_power_off(struct sys_off_data *data)
 
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
@@ -319,7 +272,6 @@ static struct i2c_driver max8907_i2c_driver = {
 		.of_match_table = of_match_ptr(max8907_of_match),
 	},
 	.probe = max8907_i2c_probe,
-	.remove = max8907_i2c_remove,
 	.id_table = max8907_i2c_id,
 };
 
-- 
2.53.0

