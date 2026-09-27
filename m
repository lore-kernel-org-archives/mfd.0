Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6AF3D890D
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524694; cv=none; b=J6pewGmesodypB3fYClKti3PR8dnOpheI8QJ6149AiwT9oLr0ThDzyoyIosMopw/flQsOuF5RuZWo+6nJp2OsdpHkj7cqJk59do7PZ4Tenfz28syoKCVqO8kcCweT97Lp7kmwgDhRhCTkpXFlV0FlQI3zVNb14bCJMWsaXLljLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524694; c=relaxed/simple;
	bh=rBTDTnXA47KWca5ByUBPMKJKcdvVfMOrQhxxEmNQ9lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbxXNEp06PHx1ntc4cYSGwaRcth96DqSu7ILtxaWuwJ4OvRe4ud1DbFzz1R/4Vcq2HWeiXf46ZaUdUqWb+KWgecn+yGBm13QwXCd2iLXM5H13qu7U4zOX7LURtLKGg9IoB4nWtEOiJO/KwPDEg1aCWcA0DRZgDbPY0vd3FUPTKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8JfVOjr; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8JfVOjr"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1415356f8f.3
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 08:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524691; x=1791129491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTn/cHN3s2yPPF9gEgjAzLW+xUByQWmQpTOnwkpxBoc=;
        b=N8JfVOjr0dBl85BS08oJ0ovLLN3f7q/zp+RP9KLiClySdAvyLMXG/SkxEh1oRXcgIa
         lcWASnpzuH/UZr79G1v0cNPkV1cjYC5iYJA6w7JyWJvJUhNWib7g3wh2Pu6tt4TdzAjb
         w/2Wh38jp6uHTl2tgaH5Dit2c6sl6GcVtIN0BNXqtpsYujuDhKQ1+IlyWKssyuQZSc2N
         NdhFl3hQtpDB0VlxjDWBn9uEFUay7tU5ZDLc6nhYkmiAA5i+9sK6ZWFOxIyvXAk0irR/
         TC96WgKdOTSh8itRFhySRPGaPNvBP3VUMiz21mUUlq4iUaRz2YMFV2Rjjt1V5ZMXhlFS
         1SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524691; x=1791129491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTn/cHN3s2yPPF9gEgjAzLW+xUByQWmQpTOnwkpxBoc=;
        b=Icsk73v7eFIBzOH0FLzNDnbRyBPXmJBN4B6ItCyK95ku7fLN652IJfPXfge1GJpkQY
         RrLYlKNm48lDH44iBZLnTVtqncMl15GIUZZ4cWZS2oLgTyQYKZva1tNCyKRr4cnb1Com
         pq0K8Wvkmn5cwpUqf/tafvkTVvA3mrc022KkYmA5SOOIHyUscORFZ0CX9Hqbg7RJ//hY
         IwLKUuKaAYCGq7/7ju6g9mPuCmYQurPH/H3pnEbJsBevLr0YJQsSoyXL+yK5JUWKZRAx
         GKXS2ShapmIR8KyUUSlC3dbsu1K+085TfqwmkQBKtXXFcXTL+7iOLBpPlvTXxGEI7S7r
         9EFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9E6FGpgX6AjM7OkufzOyiBenDfL9N1wcP4GS4UwOHzAGAsYn2E2CnMhPMVIqlwH344jI=@lists.linux.dev
X-Gm-Message-State: AFuF++nawgG7D/nFkvfMUWS1fu3yfx17i3Itm27Qxr/YIX4bAKpYv+p3
	4p39cy5jwyRvqj+kss2kGqhZXGc0tXxtHMo0QJ8/ji/0a2Tj4M2zVqCA
X-Gm-Gg: AYBFou3i72FUpIPDuJiGomZxJmX5x0MTUH5GqFgpP6ef1YWXHCoddoyWg/qrvsScb+N
	FUL1YHyH31ny38pgyatHhkdG5St+YnpE6uvRCR7ZxHzD6GU1AUj/ZPBbZWpGMPsknS6pWq5t5/i
	pykqJwc6492PrlHDqXf8kAZ4PDOtMpuNpZpcq3BqbsQ7Js33IF1rqrW0bWxbsADFaPwo09ZenuN
	7JtQ+lmzFMInnpuMMjpiDy+r6NQ27IURJs/u9jL27DVs86nrKVCJMdGW2u+84UFWkcgn4IOJTNH
	Q2iLkIV9NUaQ8F9IChvcRTOr7+J4miItsElfcu3ZB+X4SDvQgcZRyahRDL6T06xBgjFIVE0gf1r
	Rnv2+GLdLPF02VFnZFPdRbdh9ckKfsM1zWJWjFSJDCy947ap2tsBhgS+d0/Xv4umUjS7P6ogGlW
	PDI/LRQd5hm/nspItsK15wyvlStxzAMkHW61zQ3QxGwghv3wqMRx9qq6az1T+HwZFDTI6rgxTAV
	UGLS/gJN01B9CsGfCk=
X-Received: by 2002:a05:600c:46d4:b0:49f:ec98:f030 with SMTP id 5b1f17b1804b1-49ff06f839dmr126988445e9.33.1790524691256;
        Sun, 27 Sep 2026 08:58:11 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dd5easm66708625e9.3.2026.09.27.08.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:58:10 -0700 (PDT)
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
Subject: [PATCH v1 3/3] mfd: max8907: Convert to use device managed poweroff handler
Date: Sun, 27 Sep 2026 18:57:44 +0300
Message-ID: <20260927155745.187758-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927155745.187758-1-clamor95@gmail.com>
References: <20260927155745.187758-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_sys_off_handler() helper.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 363ac80c0593b..0cecb53b62078 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,19 +174,18 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+
+	return regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				  MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
 	if (!max8907) {
@@ -204,6 +204,16 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		goto err_regmap_gen;
 	}
 
+	if (device_property_read_bool(&i2c->dev, "system-power-controller") ||
+	    device_property_read_bool(&i2c->dev, "maxim,system-power-controller")) {
+		ret = devm_register_sys_off_handler(&i2c->dev, SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_DEFAULT,
+						    &max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "failed to register poweroff handler\n");
+	}
+
 	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
 	if (IS_ERR(max8907->i2c_rtc)) {
 		ret = PTR_ERR(max8907->i2c_rtc);
@@ -250,11 +260,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		goto err_add_devices;
 	}
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
-	}
-
 	return 0;
 
 err_add_devices:
-- 
2.53.0

