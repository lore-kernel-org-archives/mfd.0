Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908734CCDE5
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405090; cv=none; b=bPeERHW4BvVutjn/j6AeOfg0WAiNwdccRwWPB5h3UjvDlOxbedGY8gVNiP9e1t/gEagdB+KoZHGGyS5rS1iH0+htAYk8Tscz4X3axgQcszm25EIpRqiUTA8lQvxLqnPyqHXRh/rrkqhIThfM9IEfaKemlC0Vsv80f9OlmmWNZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405090; c=relaxed/simple;
	bh=V+0aAcFUCH1cc6EO5h875PHuWNEBDxi02UU0k+Kbco8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sC7FDb6VNJ6miqYJQTMigCxEHboxSIlUs1kXR/ROCBhb2FiNLSER8XpcYyX7wWKYzH7hVdtW0v9s5oWlYRfVGGrLMWmg26sGUcec6KcPfzEr0EPN0pPqlZK/t05LNx5VgXfNYM20kWYrYM8Nga8wXyTROhF0dpboHPpZAL1zfBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDkB6tLp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDkB6tLp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d885929so1353643f8f.3
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405087; x=1793009887; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPA0grO6lR0vtnEVLynRjMdDas+begIgQ2sOW1izRNU=;
        b=HDkB6tLpNsRtKxje0DU4ZE6pV6EHa3uV5fg1rurKjy29f7WDylK0jsYmrc8N5QbY/T
         C84qmdHxRjYokYTMc0lPiKdlVrAwXl0CM+KlI7ccCPYxEY0tXZDOfdqNHuyNBYzsUE+X
         w5jPsELN4tKux+zzQXWtovt4J8W3bbtLChmiBgle5ijbwitkW7Stol5ljBoh/fViczx/
         WPvctvBmO1OhcYtdsX4IEBY8/RAxDPsExprDrPrcyHpdNwSdNvXVL3NmI7R0RoU2J99j
         BDgif3C8+PuVRR5CLS9O3Uns6CV/RAHqFvej9okhA6ubt/C1Xic7xLmQNjrP7OoifPkc
         MkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405087; x=1793009887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPA0grO6lR0vtnEVLynRjMdDas+begIgQ2sOW1izRNU=;
        b=wBcNp97m2x1sod/wjVIQ0T8fqSPpf9Sd+ZDGv6DdErERBoKvyjMQAR0Vmj9IafCS40
         hASx+c3CJfD9Ju4EtxlThWqAek7unBpMhOFcLSiuC9Mvdy1XJ96ipm+zXAFwT0aGGLRG
         TC+Uhqzfdv5SMVj35vkxshqtySqWi19CGJ9PTJtOwqI0f9uAU2KiKNIYhz+a/8cXUTfl
         KS/M4IfFnvIA+Y4k1EoG8dlKGasZFn0Ol0m4JixOS8NAtp6ZUtc+0uOJExkiHzESlL3G
         rAXCFTeXFmHKsMUzw1BWU8HfMj8eUjkgpO6OyhLT4XkjcudBMFVPGfI1yvFeL6ffPjFD
         /5Mg==
X-Forwarded-Encrypted: i=1; AKwUvByf2FxC640H2ofCccgn2FA/o/FQD2tXUiAtvjTNjBolXgXrCtYuSwVdaMdclkM3CDx5Q+4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKJDw1GQa0bs+Lg/hQ2HzgoAK1fZmc3fXwV33HZJUqrD/T6hXe+
	3l5A0qK/o+8I1NsxhHbQGWtKzteaJ7wt3LiwCIzBcSn1ILeEBOfpCvyW
X-Gm-Gg: AYBFou3OeNQEKyMkBPTyR/xnREAIfmE9PjpDRe/si0rVzcuXBaUF1kdhOPorDHtw7os
	VxAsug65gCiLbCPBhpofM6zCZp5a+kCIr3Ai2XZdLVfEsAD0zLZG2ReSrtu8jEAhze8uCI+SXsz
	IZDN3WjTW3ScFXdDmheuwEc1LBrqPr9GI80KV0rxlp7oTnixxK5JkyPTwebsPZlE6FliLuF0TFT
	L86WhZZ9wOgT5vb94ZXifCh39LizYO+fZ/RFj7w3LsDM7x9fnoIw9VIVOm6Db+PcK0cv5yMpWP8
	CtpY+lCyduNCs4DU0oY0q+GUGMm/QxWz1C7uQv95MFjQqCodCyeEdWSjFhBf+t0ZXsnZojuYrwt
	Hcfc3qTw+gT0e/X3oPkkhrDRfMaQg4msnEnorXVIlWhHc5H6jyBDa/7rPnccXUAAhPQyp5saM0b
	ShMbVqqYGfdRqLX2LjZFkfjg8RqW30V0D4zGgdUgVAuzJsARFr+gH5ZJbxQbyVo2gEylJIqtZG3
	OEasGdAEFT/mYc348ojUal6+QEjJw==
X-Received: by 2002:a5d:4a8d:0:b0:48d:fd1f:9a9b with SMTP id ffacd0b85a97d-48e07f9e94bmr10227937f8f.34.1792405086586;
        Mon, 19 Oct 2026 03:18:06 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm23913237f8f.32.2026.10.19.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:18:05 -0700 (PDT)
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
Subject: [PATCH v3 4/4] mfd: max8907: Convert to use device managed poweroff handler
Date: Mon, 19 Oct 2026 13:17:50 +0300
Message-ID: <20261019101750.125439-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019101750.125439-1-clamor95@gmail.com>
References: <20261019101750.125439-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_power_off_handler() helper.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index fab44be7ced57..6d5e6a1556fd5 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,11 +174,17 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static int max8907_power_off(struct sys_off_data *data)
 {
-	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
-			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	struct max8907 *max8907 = data->cb_data;
+	int ret;
+
+	ret = regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
+	if (ret)
+		dev_err(max8907->dev, "failed to power off the device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
@@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(dev->of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
 	if (!max8907)
@@ -238,9 +243,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
+	if (of_device_is_system_power_controller(dev->of_node)) {
+		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
 	}
 
 	return 0;
-- 
2.53.0

