Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6484E4E36D8
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980169; cv=none; b=BrVajfIZImRhxSZRtyYdov4P9ET5GFZ1uGQIo+ItszXX8M1YKPWTwXsn36KA3jyJteZI4DAEZmpQpJtJt74r+ftqXB4C5LlDkdhkYmfk9lg2bnIvzQiyjlcS/q2jl+uKrTKWM3a0ZDHKPy/obAKorYj0CQNTDKpZRYBNhtuU2Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980169; c=relaxed/simple;
	bh=KQQfKGP3gaA4IHCfke4mkG2Sh9hJChUtdoHtqWoQYAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBjbbJWjh2J/NHGZffd87LWi3BpDTBrS8TB3ZZUlmP0xDedxJTxoctdnVSEV21mI5uny1O2C/pD3+mzOjRKMJIRvz1az7Sy/JNEvOfuTJcdvUUfLeX+mQ2tdX6p/5SnqLSfSqL0bu404uc5EZ0YkxA5wCIvic9GKsK56fF5DXOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T59QD9Zq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T59QD9Zq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-486e70f2457so202086f8f.2
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980167; x=1792584967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=T59QD9Zq5nyz10O63VVxeOtQrGZSG6tzRqrkD54+zDETq9+zfwULOL0uCFACssV/Wm
         TCb3O1RccvM97mpeOrUk/Bd0v9lFicp6nItzFhDWmzkyvoZDCzO7zQ0wBsEeeDc8dfFL
         Flzod+bRzI0yhBKJ3rNpgL8SK/FyAmZLrVGZ07bI9LyZkpdzgdoBLwWKJe7panH9COwE
         2gbi4xWs1GYT2o8EO10cPEufSuiPU5s2uuAG3O8UOxJp0sOLkPXa0aDNJkBkS5QnuWve
         4VnRG78KAzbEsCR23hS/KQz4ffDm3qWQKGLnRz4+aSbvRgCsnvbem/GvTwK1RrITdQ7m
         B+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980167; x=1792584967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcXAqkrX5GplF7FfZE4ZaylSycLQ0FQ8MQuX8DWBiwI=;
        b=gxnThc0dm31TJQ9D4SaCEkVBB/syL4lgak2xAm5SQdRHkfemmCLCX1f1isuLhiqBl0
         Nvo1JUj7wefSQnYzZnja/2vz4E/LXGoyzc+C+r1fpkKsleraJNC1BXG03p7N6qSFvk4E
         OZk5cwDVSzPJcdf0wcsQoVs2REfmNvqww41I3pXRMC9WbwQiY8PbA7e6rSOZfOYPDlfY
         VsKIEa7P7IzpTnhY8UXcA25golAeku/zSlPUJMat8tEVasLuzt55keIGWjaALnuXxO5X
         tZlsvUYg0ndYTUkTgbfO+IxQV2L1aSVQcJjBUI9HipRwq9Ux7hmG33dE7+31fpgqG1xh
         Q9tg==
X-Forwarded-Encrypted: i=1; AKwUvBw8UomCiN+2WtEQl7ZhpkXkzWBmZz1FQFoJs4jyWfmUmNZ0I4KCVDdP5iFdslP+tr3caGI=@lists.linux.dev
X-Gm-Message-State: AFq9FYJjv9HaOK57ll4k03vzf1SA/kLhHbHhcZdbZPgv8iSukUq2BgQu
	/3MX/B+Z1yX8tbcyJWh8MahmpRPQFtnVqUAgUqlpx9mJf/iejoEf95Y9
X-Gm-Gg: AYBFou3cJs4hvgzSWOaHzUDeb1KeByjvdbb7xMAlCBbO0QafsTlJHpb976BW4g1zsNU
	xClB6tzlKxkJ87KCNXCymDQXOdkW+c6mW6dWhMNRKodklTFhxnQ0onwpHjEeMWpDbJdQS4sLWCl
	ng6pRDBuUw6tA7ciFdACy2tKmfp+lvIhnIbVrXuHCJtuhFe4GvIDwvu56EP0RqC6YSCvjt804wl
	pwffKrcCPu2qkO0dnsvMC7xNVJMvpdACdl7eXAt3BBk/dCJZEKNsEk114fhbouTcObWH7Xk2iu9
	4yVmSq14qmk11Ff9zi+qersFXExL8dunyt3UlwmtcbvfVcSLWvY9pvRZaVUC1s5810ZUDMdMWDn
	dE7V8LDYMClSP2GMIKdiCkAVZaT/pfBvnikeH+aJDerNiKscWha9tjQ7b69UbHYtxWfinmTuREU
	vjVfSWRD3UT3v3+5SKmhBxbycYXsv1Y8FRUnHaXGjDK7fBfDIACiJhN8AWqG9LPzb0ymJsXQQg3
	TrwdxvULMZpRnUzjp4=
X-Received: by 2002:a05:6000:11c3:b0:48a:f404:695e with SMTP id ffacd0b85a97d-48dbaaed106mr22506007f8f.50.1791980166578;
        Wed, 14 Oct 2026 05:16:06 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm11006660f8f.36.2026.10.14.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:16:05 -0700 (PDT)
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
Subject: [PATCH v2 3/3 RESEND] mfd: max8907: Convert to use device managed poweroff handler
Date: Wed, 14 Oct 2026 15:15:44 +0300
Message-ID: <20261014121544.138958-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014121544.138958-1-clamor95@gmail.com>
References: <20261014121544.138958-1-clamor95@gmail.com>
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

