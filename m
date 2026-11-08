Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130595;
	b=PMdWL82jKiOdDaphU3T4mIScgS1HXbV22mhNCEIgU18OoBUrq1/6v7nFllAEAwqFCKaD
	 8sVxxOnkp8TgkAHUrdVSXIwj/6WoM3YBLQQn/2+2OOglgTwdZJPe0a6ZELxvjws2Q0jRK
	 TQOYg4P1O5SEGp+Lf3OflYcjpufhTc3/3XoUxeruub7tkD+yk3GIq8EyOayFCha7h+5VP
	 USs8/CNkSz+9J7wTIfB3QnINSpBKW+nVvsKF6yiE4aagXpgIXDJWL2ogMj3LduEJm2xs2
	 efMsTRv+G8euzLWHgwrrC0oAWD+ratD/LLi7omXfLTcXdzts5dPP42/earn1YkhHMuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7bU6YCA2qIvCbd2m0wzelSqm9hNA2+KqI0I01C+OIGA=;
	b=JyVjPUcklNNIqw4rziWL9OcPAv9HzzqLj9KISDB70fnsXIP6WuughJ0AsAALuXGBm9Vu
	 7phOSW36uwpsyOqooRkg2nENfzQxRfTdCqcYuPZxeVVsN3UYIihwYKTcKZqlimQgCi3uo
	 JiUHpPxGgYe+uFrs4ACfw1jASsLPpcLKF7P48g8xBWWtj59SAyQ3cfNP3Tsj+/MWVin75
	 QdziKapPaxzPtEFSjmxqkdWqaLiDx6Jkmssg4mLESBdDLAtVGqDTTchzk8gzJJMop0MLq
	 Ybg1Qj4UEF262FekozT1Cl7OjjveKYTWWLVunhOW2iDvKJ4RtBtk3yGft1d5+h+8Kgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkgMJEGB;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2DC606A333
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 09:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A2DC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nkgMJEGB
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so1364465e9.2
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 01:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130593; x=1794735393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bU6YCA2qIvCbd2m0wzelSqm9hNA2+KqI0I01C+OIGA=;
        b=nkgMJEGBiIT2TNif6RWTUsmA9thqtikm3G957Z82mwvsEmfo++pbU2I/8YopL3q0Iw
         xsbqxB/ZW563F/hXx8ZY804x8Td2A9K4DT+Af4ionKuekWHe/Htc6SBrCQf9MTdSpwoe
         CLs0Yh4Ek1RHTtAne5UK+AvMDqeEAvH1B4DgZ1OX3E/1VwZuiBURPVJsE0zImkl3OQlf
         y6NB11JNHbC2ZnjE2oNBdg4Ff6N2mSwiR7CU1+9nDFYric86t+inJ3kJjXGjcn1HeVqA
         /uvI/swt5jPdqPjPX3sXOyZ+Djx+jOeQ3zzdFxcxF5h8JLuh6jXzsvT2c5sjMLUKGFqK
         HXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130593; x=1794735393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bU6YCA2qIvCbd2m0wzelSqm9hNA2+KqI0I01C+OIGA=;
        b=ipUhR9V3dfBQdyb2THIe5XSzOHoCBHrgq97Zd0sVB1jE7DBT0d7wPWlbxbc65Jfvp7
         Bf2k2iOWVDh4iiiq3SagBZAEdPE6b4wTrqehCxYolMEz1HMySlzM+ukF+A6F71ZkBnRF
         QC16sXSvS6ZOxkpMpPt64VIWBm+FoB4tbm8KhzgpWy9FIdglVv2boGfi5rJ6VqzwCyP6
         B3CHb6FPtiVZEYyLmsaJ9xkft5thp2ZrjVuTFd/KEInqkHjWoMvMSJDZpsbgd6C6pv9T
         jn/swuTYPesePPv19Sz0Tc8tSD8pN6CZEnM8vP1YqaQjnQV9PKzxzIRAPbFLG58j/qhp
         VyiQ==
X-Forwarded-Encrypted: i=1; AL+hErGXzk36FmrvzycfVKCA0L2cN9ewwKFuGlwBj3nFEdHBm70EHXV2+srjHXyySNGwuCfS6dI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9EVwQfBF3bkkwUNLIbtszFex+5R7W6wcjAaYyrmya5PuKd64J+
	aTUaI3+n9yXG4DALA7I/3xMhVGttwXgcYbCq1LQ7Zl3FP8/7QDaQWaJo
X-Gm-Gg: AYBFou1LJv3Owi5b8o6t1AFC8xqOk+uG5SMJBB5rijt71yU34x7uHZtc3nkuwzM7n1I
	U72fBbkZxJESSZrEIIR+zocLftDxIxIv37fKxZUXxLNWVmv1K28sQ63ExXx0jA4bA7TTEpOSny1
	bRA+HJMrhkIHV2r++ef6htsr+5Mas6VPdCznKmZSyzyIpUb4XVYgUrwNBTs47x+HN8JsDEI7+TP
	qW2lt9fMmlcafytkglcKwIXcwlsjs5WI1zRElsXEqnOIK1CQeFPz0Dz75fx5TEv1dtXQmHlYO02
	+2jPF3WHR76whyMMVaeTbzmFgXlzQsSQ4PEKzmwGu/6Vlj99z4hlYkBMhTrh3X1BhNOgQd9uxal
	OaPl7s8fUwVhVESnCmMzqRoF5v3ZnEH1JXj1DXOQWmZG+kdLaOoAXB9BMA845PmT2oOOujE/7Xe
	vfpVxSZnmEM8drup0pkBrbrsyHWHFMZg9NJPZjA0Qhy5RGFgGhRDHmM0+niqfxQysrjRpUS8VhY
	7XNRW7ruYdSyKIHlOPvde4XEliNeHpZ3uTR4CWyNcc0xO3kxKbRdaoy1X6XwA93tF9fT2UWcDBW
	vMYIT+Tw0WbyJZ0LYjc37OTfIJfupdxWEDug3ZnzSz0n93955JRBfh3DcC6yb12Dy3zD+UfAdRT
	18SLAaQM3
X-Received: by 2002:a05:600c:3d96:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4b963c8a047mr19201705e9.34.1794130593538;
        Sun, 08 Nov 2026 01:36:33 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:33 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] regulator: sy7636a: bind to the I2C device directly
Date: Sun,  8 Nov 2026 09:36:00 +0000
Message-ID: <20261108093602.329554-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
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

Bind the regulator to the chip directly, as the TPS65185 and FP9931
drivers do, and have it create an auxiliary device for the hwmon driver,
instead of simple-mfd-i2c creating a cell for each. Drop the MFD glue
and header. It now probes before the GPIOs may be ready, so report the
power good GPIO with dev_err_probe(). The hwmon driver then only
accesses the chip after vin-supply is enabled.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/Kconfig                 |  2 +-
 drivers/hwmon/sy7636a-hwmon.c         | 33 +++++-----
 drivers/mfd/Kconfig                   | 10 ----
 drivers/mfd/simple-mfd-i2c.c          | 11 ----
 drivers/regulator/Kconfig             |  4 +-
 drivers/regulator/sy7636a-regulator.c | 86 ++++++++++++++++-----------
 include/linux/mfd/sy7636a.h           | 34 -----------
 7 files changed, 72 insertions(+), 108 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..247507a4ddde 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2106,7 +2106,7 @@ config SENSORS_SIS5595
 
 config SENSORS_SY7636A
 	tristate "Silergy SY7636A"
-	depends on MFD_SY7636A
+	depends on REGULATOR_SY7636A
 	help
 	  If you say yes here you get support for the thermistor readout of
 	  the Silergy SY7636A PMIC.
diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index f01f368d68e5..a6b47452e29e 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -8,15 +8,14 @@
  *          Alistair Francis <alistair@alistair23.me>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/init.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/machine.h>
 
-#include <linux/mfd/sy7636a.h>
+#define SY7636A_REG_TERMISTOR_READOUT	0x08
 
 static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *temp)
@@ -63,40 +62,44 @@ static const struct hwmon_chip_info sy7636a_chip_info = {
 	.info = sy7636a_info,
 };
 
-static int sy7636a_sensor_probe(struct platform_device *pdev)
+static int sy7636a_sensor_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
 {
-	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	struct regmap *regmap = dev_get_regmap(adev->dev.parent, NULL);
 	struct device *hwmon_dev;
 	int err;
 
 	if (!regmap)
-		return -EPROBE_DEFER;
+		return -ENODEV;
 
-	err = devm_regulator_get_enable(&pdev->dev, "vcom");
+	err = devm_regulator_get_enable(&adev->dev, "vcom");
 	if (err)
 		return err;
 
-	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
 							 "sy7636a_temperature", regmap,
 							 &sy7636a_chip_info, NULL);
 
 	if (IS_ERR(hwmon_dev)) {
 		err = PTR_ERR(hwmon_dev);
-		dev_err(&pdev->dev, "Unable to register hwmon device, returned %d\n", err);
+		dev_err(&adev->dev, "Unable to register hwmon device, returned %d\n", err);
 		return err;
 	}
 
 	return 0;
 }
 
-static struct platform_driver sy7636a_sensor_driver = {
+static const struct auxiliary_device_id sy7636a_sensor_ids[] = {
+	{ .name = "sy7636a_regulator.hwmon" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, sy7636a_sensor_ids);
+
+static struct auxiliary_driver sy7636a_sensor_driver = {
 	.probe = sy7636a_sensor_probe,
-	.driver = {
-		.name = "sy7636a-temperature",
-	},
+	.id_table = sy7636a_sensor_ids,
 };
-module_platform_driver(sy7636a_sensor_driver);
+module_auxiliary_driver(sy7636a_sensor_driver);
 
 MODULE_DESCRIPTION("SY7636A sensor driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:sy7636a-temperature");
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 87ed55c155f0..c7ff8997beb1 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1319,16 +1319,6 @@ config MFD_SPMI_PMIC
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
index ef3ce4bdf98b..0c9162034899 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -67,16 +67,6 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static const struct mfd_cell sy7636a_cells[] = {
-	{ .name = "sy7636a-regulator", },
-	{ .name = "sy7636a-temperature", },
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
@@ -124,7 +114,6 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970 },
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970 },
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705 },
-	{ .compatible = "silergy,sy7636a", .data = &silergy_sy7636a },
 	{ .compatible = "spacemit,p1", .data = &spacemit_p1 },
 	{}
 };
diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 4a57feae3560..2ed21d57df75 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1621,7 +1621,9 @@ config REGULATOR_SUN20I
 
 config REGULATOR_SY7636A
 	tristate "Silergy SY7636A voltage regulator"
-	depends on MFD_SY7636A
+	depends on I2C
+	select AUXILIARY_BUS
+	select REGMAP_I2C
 	help
 	  This driver supports Silergy SY7636A voltage regulator.
 
diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index 6269c50348ac..7540ed79a649 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -7,18 +7,26 @@
 // Authors: Lars Ivar Miljeteig <lars.ivar.miljeteig@remarkable.com>
 //          Alistair Francis <alistair@alistair23.me>
 
+#include <linux/auxiliary_bus.h>
 #include <linux/completion.h>
 #include <linux/gpio/consumer.h>
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
+#define SY7636A_OPERATION_MODE_CRL_ONOFF	BIT(7)
+#define SY7636A_REG_VCOM_ADJUST_CTRL_L		0x01
+#define SY7636A_REG_VCOM_ADJUST_CTRL_H		0x02
+#define SY7636A_REG_POWER_ON_DELAY_TIME		0x06
+
+#define VCOM_ADJUST_CTRL_MASK	0x1ff
+#define VCOM_ADJUST_CTRL_SCAL	10000
+
 #define PGOOD_TIMEOUT_MSECS 200
 
 struct sy7636a_data {
@@ -137,50 +145,54 @@ static const struct regulator_desc desc = {
 	.of_match = of_match_ptr("vcom"),
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
+	struct auxiliary_device *adev;
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
 
 	/* Let VCOM just follow the default power on sequence */
-	data->vcom_en_gpio = devm_gpiod_get_optional(&pdev->dev,
+	data->vcom_en_gpio = devm_gpiod_get_optional(dev,
 						     "vcom-en", GPIOD_OUT_LOW);
 	if (IS_ERR(data->vcom_en_gpio))
-		return dev_err_probe(&pdev->dev,
+		return dev_err_probe(dev,
 				     PTR_ERR(data->vcom_en_gpio),
 				     "failed to get vcom-en gpio\n");
 
@@ -188,54 +200,56 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
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
 
+	adev = devm_auxiliary_device_create(dev, "hwmon", NULL);
+	if (!adev)
+		return dev_err_probe(dev, -ENODEV, "failed to create hwmon device\n");
+
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

