Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975398;
	b=j81NNjpPtCFtV0pdCjFOCPSdcrAV/If+9+G1TFJ5RhZdK3eg1+ZYTnKKEh2PECqbcA1V
	 TnUA3093q+5dXfkYqg+5VJV28SBoKRG2O47WobDbft9O4uG0mY7J81uym2ZGy6Dc03RIQ
	 opwQxon1zcbOJEC5Rgs8M+9HCO2A+hLpl7DZOq0oSjo75l6363ABh4qEfpqnQHDs8y90n
	 YKMhk2DtFYGERlw46ZLjFFMf9uN/6/i+cXSMcwpfkx5rVuz+FSWDm2NLFSfyW0vb5XUbM
	 DR+BZiWk/UYc4TJLYbs1160+Wf2RO+jzDp6DsmPKRA12c7iybmtRRVgsnLyNckZUzlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jg0rxb4i0zuX7MOwDvfayzYPg4XcPP8VQ/0tVg/T24w=;
	b=RSYAZehIGnGfZXX8AoeoOok1pcSSPVXzibS2nFFuUGg+mupmHjeAfP5js4EnOZVgf7eO
	 ORZdUexd+1zCX4BhvDDbKkdZ/QLiZgBzc4u9pfvBYcwqAqb5SqcMdiYeUb2cT4f9FAMU8
	 UmssG/MGmues30GbMhalbYVRJCGw/QeKkiN3wceHFATk4NN5olkKZGQo6+FKlCa52afzy
	 +6LSe2tzVdq/1oeLWZhD6y4JI0uCPdi6O/zcmiHuDFNM+Zx4Oy6tAs3RKvov/NMG2d1gy
	 75rFcZwxDOeToxDdAu4SHCRKsADdSJWg99WyYJfYleMUjPoz4Y52thnD0PcTyJfEXiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="PS+pJ/Sh";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BE2606A326
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 00:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BE2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PS+pJ/Sh
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so13883965e9.3
        for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 17:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975396; x=1793580196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg0rxb4i0zuX7MOwDvfayzYPg4XcPP8VQ/0tVg/T24w=;
        b=PS+pJ/ShOZ7nMES5rvgAHh+Ej+xeOq0cieAaOvt6vMWrSyz6zLAlnJQvi2F9Zfqz/k
         nE/CamCXWzOpMp/WOG7vsPf2OU8DxCL+kMlZoAIm7m5lms3kmBEkR25pGxAKtNf3rtj3
         2gkgdz0M045UmSZJZYw77dtjJHHtZ1MNJasTqDPoAjcyZeMvHyh2uaLnBrfLi1/NuGul
         1AT04HZ5LUxhyFnnr0H35Szzl32fG8wW8fEByy8DvusV4bloX4LYoZqOfeoTjHvwsOhz
         TMA55hNAiHe1iVRTT5jhmEjmd8MvxWavJrvNeGYlKM+SOS38QX6Hrs5iuT/ximt3zqzC
         Ggeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975396; x=1793580196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg0rxb4i0zuX7MOwDvfayzYPg4XcPP8VQ/0tVg/T24w=;
        b=t8QAgmpUcm8Qetchd423vPznBJmnKFvv+rygZuNApp17jggBYMxi/A9+tHtJRY/7ja
         uAic1Fi0iJejRN4Y5iITjafBMKbwoivDnW9r3n2xAtgO3kgbEo1mMi+gzW/eDR6eRRSF
         xbaNrLr92XK4VRwlfPK89rgXT/iTkly58wjPVzy+5pKKe4ir1lhQByxhwOeO42z4k6XU
         ijpLg277205wT1E9W3Jo/DFgrtOSe7t2Fumk6rNmmH6uSHdg5FBAZByhV6YSDAvECgpA
         LcKB6wVnlZB+k03sRdeC6AQI7JLoomtlPY8+5M9xQDxQQxHUTMaabmdIR8NCWEGgRu41
         yftA==
X-Forwarded-Encrypted: i=1; AKwUvBy86Ov2P5gO0Njsiab7V/o5wYoxQGNeYsexj9o9WhUg6FhSi9asHLhkKJtcjS7YzPmgBwk=@lists.linux.dev
X-Gm-Message-State: AFq9FYI22fl2415s/iY46TJoe2GW5L+vArwoZ7n+zK3eoxYdMumkHS9G
	tEs2ifCKITSNDwta97Oy7lyTkb+Y24AQGP4RJwpCIVFOr5Jlnf3RHzaa
X-Gm-Gg: AYBFou2lkm8yBfxprI++3m31AG4YnKFwS7Zy1Uwr351y8ac37vGj+RZD5MY2nSHnOCr
	HXaGhQHe5YGBPOyTLfpPtGrB1BHd+RT7hUbkNSpXCBWcLBE3jMeMXD5F5Rt/EdI9Rftv6mdAyst
	nLeGoHLBENut1KmspPieFBxkC4/VPQV8p/mBjNmYJJNICDbSXW8j6KKZ/ZKTiv2rNIEg4xBXx0D
	1P01zXVcydRbpUCo8o9Ck5Xj1+88bzJUrWUSJZ/Ty3KFyJErhwpGxopSxCi3Ik/6249NmSjOBPV
	xHOUilFVDMdeAzH4IFQW+SPEOGShevwxGSlz7WXCgiTAqC7y8v9Pm6Rm/+O/sp9JBOyo6I43GJG
	buNDUHzi/wCDFFHXw6jUfgp3zUMFZ91PJkUIpv1/iFU3rHc/s+gKw+qzVlhsKSwnK4ORdXwsqRf
	l7AbXkHZDU5O3C+6gxHTQ7nVAXp0N2JwTAFiFqBDfmpG3zpzSctzy2IQYMiIbNTU4yP9EhC8OFs
	JTa4NX7+LSjuJo9qFd1EcAsub4SfVnuRHRFl9/ix0oCkfj9TqXjfT6P+F/5eHdgFGbHamthBNnF
	y2jBFnDf8RJaTdo=
X-Received: by 2002:a05:600c:1388:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4a35aca74f6mr115897345e9.18.1792975396086;
        Sun, 25 Oct 2026 17:43:16 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:43:14 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	mfd@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] regulator: sy7636a: bind to the I2C device directly
Date: Mon, 26 Oct 2026 00:39:17 +0000
Message-ID: <20261026003918.155321-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
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

With the temperature reported here, the regulator is all that is left
behind simple-mfd-i2c. Bind to the chip directly, as the TPS65185 and
FP9931 drivers do, and drop the MFD glue and header. It now probes before
the GPIOs may be ready, so report the power good GPIO with
dev_err_probe().

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/mfd/Kconfig                   | 10 ----
 drivers/mfd/simple-mfd-i2c.c          | 10 ----
 drivers/regulator/Kconfig             |  3 +-
 drivers/regulator/sy7636a-regulator.c | 86 +++++++++++++++------------
 include/linux/mfd/sy7636a.h           | 34 -----------
 5 files changed, 50 insertions(+), 93 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 0a2778052519..9130dac7a7ff 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1305,16 +1305,6 @@ config MFD_SPMI_PMIC
 	  Say M here if you want to include support for the SPMI PMIC
 	  series as a module.  The module will be called "qcom-spmi-pmic".
 
-config MFD_SY7636A
-	tristate "Silergy SY7636A voltage regulator"
-	depends on I2C
-	select MFD_SIMPLE_MFD_I2C
-	help
-	  Enable support for Silergy SY7636A voltage regulator.
-
-	  To enable support for building sub-devices as modules,
-	  choose M here.
-
 config MFD_RDC321X
 	tristate "RDC R-321x southbridge"
 	select MFD_CORE
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 168b4cf49b8c..0c9162034899 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -67,15 +67,6 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static const struct mfd_cell sy7636a_cells[] = {
-	{ .name = "sy7636a-regulator", },
-};
-
-static const struct simple_mfd_data silergy_sy7636a = {
-	.mfd_cell = sy7636a_cells,
-	.mfd_cell_size = ARRAY_SIZE(sy7636a_cells),
-};
-
 static const struct mfd_cell max5970_cells[] = {
 	{ .name = "max5970-regulator", },
 	{ .name = "max5970-iio", },
@@ -123,7 +114,6 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970 },
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970 },
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705 },
-	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a },
 	{ .compatible = "spacemit,p1", .data = &spacemit_p1 },
 	{}
 };
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index f0d8d1319a1b..49b7c6dc541f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1621,7 +1621,8 @@ config REGULATOR_SUN20I
 
 config REGULATOR_SY7636A
 	tristate "Silergy SY7636A voltage regulator"
-	depends on MFD_SY7636A
+	depends on I2C
+	select REGMAP_I2C
 	help
 	  This driver supports Silergy SY7636A voltage regulator.
 	  If HWMON is enabled, it also provides temperature measurement.
diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 816df7716c0e..e170461a15ad 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -12,14 +12,23 @@
 #include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
-#include <linux/mfd/sy7636a.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regmap.h>
 
+#define SY7636A_REG_OPERATION_MODE_CRL		0x00
+#define SY7636A_OPERATION_MODE_CRL_VCOMCTL	BIT(6)
+#define SY7636A_OPERATION_MODE_CRL_ONOFF	BIT(7)
+#define SY7636A_REG_VCOM_ADJUST_CTRL_L		0x01
+#define SY7636A_REG_VCOM_ADJUST_CTRL_H		0x02
+#define SY7636A_REG_POWER_ON_DELAY_TIME		0x06
+#define SY7636A_REG_TERMISTOR_READOUT		0x08
+
+#define VCOM_ADJUST_CTRL_MASK	0x1ff
+#define VCOM_ADJUST_CTRL_SCAL	10000
+
 #define PGOOD_TIMEOUT_MSECS 200
 
 struct sy7636a_data {
@@ -194,49 +203,52 @@ static const struct hwmon_chip_info sy7636a_hwmon_chip_info = {
 	.info = sy7636a_hwmon_info,
 };
 
-static int sy7636a_regulator_probe(struct platform_device *pdev)
+static const struct regmap_config sy7636a_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int sy7636a_regulator_probe(struct i2c_client *client)
 {
-	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	struct device *dev = &client->dev;
 	struct regulator_config config = { };
 	struct regulator_dev *rdev;
 	struct gpio_desc *gdp;
 	struct sy7636a_data *data;
+	struct regmap *regmap;
 	int irq, ret;
 
-	if (!regmap)
-		return -EPROBE_DEFER;
-
-	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
+	regmap = devm_regmap_init_i2c(client, &sy7636a_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "failed to allocate regmap\n");
 
-	gdp = devm_gpiod_get(&pdev->dev, "epd-pwr-good", GPIOD_IN);
-	if (IS_ERR(gdp)) {
-		dev_err(&pdev->dev, "Power good GPIO fault %ld\n", PTR_ERR(gdp));
-		return PTR_ERR(gdp);
-	}
+	gdp = devm_gpiod_get(dev, "epd-pwr-good", GPIOD_IN);
+	if (IS_ERR(gdp))
+		return dev_err_probe(dev, PTR_ERR(gdp), "Power good GPIO fault\n");
 
-	data = devm_kzalloc(&pdev->dev, sizeof(struct sy7636a_data), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(struct sy7636a_data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->regmap = regmap;
 	data->pgood_gpio = gdp;
 
-	ret = devm_regulator_get_enable_optional(&pdev->dev, "vin");
+	ret = devm_regulator_get_enable_optional(dev, "vin");
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
+		return dev_err_probe(dev, ret,
 				     "failed to get vin regulator\n");
 
-	data->en_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+	data->en_gpio = devm_gpiod_get_optional(dev, "enable",
 						GPIOD_OUT_HIGH);
 	if (IS_ERR(data->en_gpio))
-		return dev_err_probe(&pdev->dev,
+		return dev_err_probe(dev,
 				     PTR_ERR(data->en_gpio),
 				     "failed to get en gpio\n");
 
-	data->vcom_en_gpio = devm_gpiod_get_optional(&pdev->dev,
+	data->vcom_en_gpio = devm_gpiod_get_optional(dev,
 						     "vcom-en", GPIOD_OUT_LOW);
 	if (IS_ERR(data->vcom_en_gpio))
-		return dev_err_probe(&pdev->dev,
+		return dev_err_probe(dev,
 				     PTR_ERR(data->vcom_en_gpio),
 				     "failed to get vcom-en gpio\n");
 
@@ -244,25 +256,24 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 	if (data->en_gpio)
 		usleep_range(2500, 4000);
 
-	platform_set_drvdata(pdev, data);
+	i2c_set_clientdata(client, data);
 
 	ret = regmap_write(regmap, SY7636A_REG_POWER_ON_DELAY_TIME, 0x0);
 	if (ret) {
-		dev_err(pdev->dev.parent, "Failed to initialize regulator: %d\n", ret);
+		dev_err(dev, "Failed to initialize regulator: %d\n", ret);
 		return ret;
 	}
 
 	irq = gpiod_to_irq(data->pgood_gpio);
 	if (irq < 0)
-		return dev_err_probe(&pdev->dev, irq, "no power good interrupt\n");
+		return dev_err_probe(dev, irq, "no power good interrupt\n");
 
 	init_completion(&data->pgood_completion);
-	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, sy7636a_pgood_handler,
+	ret = devm_request_threaded_irq(dev, irq, NULL, sy7636a_pgood_handler,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"sy7636a-pgood", data);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to request power good interrupt\n");
+		return dev_err_probe(dev, ret, "failed to request power good interrupt\n");
 
 	/* VCOM switched by the VCOM_EN line; otherwise it follows the power on sequence */
 	if (data->vcom_en_gpio) {
@@ -272,43 +283,42 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	config.dev = &pdev->dev;
+	config.dev = dev;
 	config.regmap = regmap;
 
-	rdev = devm_regulator_register(&pdev->dev, &desc, &config);
+	rdev = devm_regulator_register(dev, &desc, &config);
 	if (IS_ERR(rdev)) {
-		dev_err(pdev->dev.parent, "Failed to register %s regulator\n",
-			pdev->name);
+		dev_err(dev, "Failed to register %s regulator\n", desc.name);
 		return PTR_ERR(rdev);
 	}
 
 	if (IS_REACHABLE(CONFIG_HWMON)) {
 		struct device *hwmon_dev;
 
-		hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "sy7636a", data,
+		hwmon_dev = devm_hwmon_device_register_with_info(dev, "sy7636a", data,
 								 &sy7636a_hwmon_chip_info, NULL);
 		if (IS_ERR(hwmon_dev))
-			dev_notice(&pdev->dev, "failed to register hwmon\n");
+			dev_notice(dev, "failed to register hwmon\n");
 	}
 
 	return 0;
 }
 
-static const struct platform_device_id sy7636a_regulator_id_table[] = {
-	{ .name = "sy7636a-regulator" },
+static const struct of_device_id sy7636a_of_match[] = {
+	{ .compatible = "silergy,sy7636a" },
 	{ }
 };
-MODULE_DEVICE_TABLE(platform, sy7636a_regulator_id_table);
+MODULE_DEVICE_TABLE(of, sy7636a_of_match);
 
-static struct platform_driver sy7636a_regulator_driver = {
+static struct i2c_driver sy7636a_regulator_driver = {
 	.driver = {
 		.name = "sy7636a-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = sy7636a_of_match,
 	},
 	.probe = sy7636a_regulator_probe,
-	.id_table = sy7636a_regulator_id_table,
 };
-module_platform_driver(sy7636a_regulator_driver);
+module_i2c_driver(sy7636a_regulator_driver);
 
 MODULE_AUTHOR("Lars Ivar Miljeteig <lars.ivar.miljeteig@remarkable.com>");
 MODULE_DESCRIPTION("SY7636A voltage regulator driver");
diff --git a/include/linux/mfd/sy7636a.h b/include/linux/mfd/sy7636a.h
deleted file mode 100644
index 22f03b2f851e..000000000000
--- a/include/linux/mfd/sy7636a.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Functions to access SY3686A power management chip.
- *
- * Copyright (C) 2021 reMarkable AS - http://www.remarkable.com/
- */
-
-#ifndef __MFD_SY7636A_H
-#define __MFD_SY7636A_H
-
-#define SY7636A_REG_OPERATION_MODE_CRL		0x00
-/* It is set if a gpio is used to control the regulator */
-#define SY7636A_OPERATION_MODE_CRL_VCOMCTL	BIT(6)
-#define SY7636A_OPERATION_MODE_CRL_ONOFF	BIT(7)
-#define SY7636A_REG_VCOM_ADJUST_CTRL_L		0x01
-#define SY7636A_REG_VCOM_ADJUST_CTRL_H		0x02
-#define SY7636A_REG_VCOM_ADJUST_CTRL_MASK	0x01ff
-#define SY7636A_REG_VLDO_VOLTAGE_ADJULST_CTRL	0x03
-#define SY7636A_REG_POWER_ON_DELAY_TIME		0x06
-#define SY7636A_REG_FAULT_FLAG			0x07
-#define SY7636A_FAULT_FLAG_PG			BIT(0)
-#define SY7636A_REG_TERMISTOR_READOUT		0x08
-
-#define SY7636A_REG_MAX				0x08
-
-#define VCOM_ADJUST_CTRL_MASK	0x1ff
-// Used to shift the high byte
-#define VCOM_ADJUST_CTRL_SHIFT	8
-// Used to scale from VCOM_ADJUST_CTRL to mv
-#define VCOM_ADJUST_CTRL_SCAL	10000
-
-#define FAULT_FLAG_SHIFT	1
-
-#endif /* __LINUX_MFD_SY7636A_H */
-- 
2.52.0

