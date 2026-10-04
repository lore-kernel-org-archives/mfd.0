Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8231F34A3A5
	for <mfd@lists.linux.dev>; Sun,  4 Oct 2026 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132369; cv=none; b=Rc4IhQGhBHNyVIj7rQcllHspsKEkRtRx4q3KB+ratkq0lE8ndaToCSui2hpIWIEpKvQ5eoH8EavJ6HY/m0GL9KybIYicjgaTs3lX3q0K3BRUoVeHQmRNSMWiaRqlfrYE1JiGCYTErtyPEN4XH1tBovpQomXD9RlegQ0gPw90PmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132369; c=relaxed/simple;
	bh=KQQfKGP3gaA4IHCfke4mkG2Sh9hJChUtdoHtqWoQYAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lH2M0MGwQEblq2JwRDYdEt65LjAMINtIjhCg8zYDrXgIWM2On/reLPFAnojV/j1yC8RubU1vqaL126sosEfUE0FryfsFWitU7Q1mnn6oL5S05hHKl1eqIwkmaJFwfAecSKfPDTqNTntOf/f9OuIxhQpOq9f2FVspy0rJep4f4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ispLP9b8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ispLP9b8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11853475e9.3
        for <mfd@lists.linux.dev>; Sun, 04 Oct 2026 09:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132366; x=1791737166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=ispLP9b8iF2RKN6ifyy5zxg1UCzVP1BpeNnFkiGX+1yUTeQD1PkQYjSNxOSQ511mot
         gRv8AUCdtl67NxJ9g2JSXc+MNpVrfg7TLKIE8mzQ4sZowjPo0z4G3ihXXq2QCNivI21G
         RDsW2NmVPqCdYDAN4N2RmL+BY3fjYMwlqA8Cn6fvxGedLQE2qkzxZC8fOi89iZfyF1vE
         YTVYiMl3bQhsUzPcsNfjyLo2Gklb8v3PeH3p4bwSFuJirS8iOj5hL2Qhcl625/r0P4yz
         LnKKq+SwzKLuxSkkEuxBbk66fbQ+B7+8CNEKt9U6U05v0XuGEGLjLUYl//yeAbD7kBop
         v9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132366; x=1791737166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=eEmpU5uPp9mCttGatmRyJ4lsMRthD7Tply074c78ThbY+CLCSQISwFzEGwQwq8s+FT
         EwywjFyCIpxDBunUlI1yrsu4Ceuiel1t57cQO6HAPXom6/ABQMHf2D/361MvT/jiWc+Z
         pkXGBcHSyVpAknOaRCrNsqVurAZ9pNYmMTgDq3eUIVTeG1JiL5M8VPPaz/+4TUKd5AqL
         nBNF4bzKuUjQUvbxqBwbQy/m14Z2gx+R3auCGHoVJPXumb6yNMT3N2/2ph9ZHxC12Zd7
         /0xnTm5h98BfTrZsgsDYofSsH71ZBJoMFtnEK6/vMWRI5As9nYrDmS7jgMUchEDCEWlP
         y4jA==
X-Forwarded-Encrypted: i=1; AKwUvBy3j1YPLNo5N64A2mKfhCzyrT0o7V/KNYyZpwVl/GGnuqnXData74yhsTvO/AerP9O/Jks=@lists.linux.dev
X-Gm-Message-State: AFuF++kTFb8oyagBv7d/aLcVEf1AIHGxZBpJ4bo7F+xW6hzBiuEH+7n3
	1AKbmZrQnueF2Caz0pz04UFtbiaW5WXBXPDkkbTtMhMXunuwvfir0Ary
X-Gm-Gg: AYBFou0jOghHzK2EifD/7V8nP+Q9H0RvuHjrut6Gmh/xRM5iU7EVuKtd5oWXQl9Ju6i
	drySVdgOKq2+Ca9dWTF9HCmgUx8wo0mvMKLbdSX9oHQHDqROF//TK2ZvkNjXXc09m45xYLS/Gyp
	8r2o4iyDYvbAigOr90TXmgm08ADCqJiRwCj8yGcPRVTnDKE4ZCKG49i8F5vFOCDBjv2/e8fWlbO
	ULjtPruWDF0A2dB3SpgUq6jDVJ1SxRASPj6VzKFvMTTeMNutuuV2agBm/7EtTyRDv8AsXFVqUXT
	dvLdbSbqgS9iN69XRkcdK+uTkghLaHksns9xyUtJFH91jQiOGS0+7mMxRVCXRbgl3cvp8+fDpk+
	n4Xg72xz/0nc9Eexjuz8ZF/cKtzOTugADiMYwQWBrr+bSu6gstPUwxSYtm0aekP8jlaVkMTBfQV
	/X8LFER9CbhJN5E1nAqkWSdAEhHTi2FwF55Wq31XgK8nvTh3Ae2mZZKA7l16gtnk/S9BWZlyw19
	/tm1xQ7jW4HOqX4Joc=
X-Received: by 2002:a05:600d:82c7:b0:4a1:714d:ef9 with SMTP id 5b1f17b1804b1-4a1714d114emr26581485e9.27.1791132365517;
        Sun, 04 Oct 2026 09:46:05 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm21801435f8f.13.2026.10.04.09.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:46:04 -0700 (PDT)
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
Subject: [PATCH v2 3/3] mfd: max8907: Convert to use device managed poweroff handler
Date: Sun,  4 Oct 2026 19:45:40 +0300
Message-ID: <20261004164540.198446-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164540.198446-1-clamor95@gmail.com>
References: <20261004164540.198446-1-clamor95@gmail.com>
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
 drivers/mfd/max8907.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 363ac80c0593b..9c40f0551a8ce 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -15,6 +15,7 @@
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -173,19 +174,23 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
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
+		dev_err(max8907->dev, "failed to restart device!\n");
+
+	return NOTIFY_DONE;
 }
 
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	bool pm_off = of_property_read_bool(i2c->dev.of_node,
-					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
 	if (!max8907) {
@@ -204,6 +209,16 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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
@@ -250,11 +265,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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

