Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572343;
	b=SAZa5V7ARNwCsEg/22iZKYf08X2i+gW0D1lyNB6pRs2xqcQ6HoNX/xdmh++QtrRa5vjZ
	 iMGnoYIvJxWeKwco6ajVG4P8ACGNaL7MH/0E1Ue2Il+HIlw7uTHJ5/OxW1DVZipmd+IsG
	 nh06TG2y7XO+3pFBbwTRVnVMuiVgpeKfNBYHLWFQi+yoRI/jg1p22p5g/7/UybTWe4K3P
	 Nk2zPDec1gzLQkUNl+IFmBtEH+vjIQPlReRw7HcOdtsT502uge0caC4IebDiX3/z/4zt5
	 hAZooL4k76J7rVii1uq1qTLErRA42gsNOSoDbMqijKNkIjrhxHUw5vnGUZMaRcZOc9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vaC1Gh4sjnOn6hOZnUu5njQ81qisZCO27sC/NoNta/4=;
	b=Hj4yh153ASIngYVqCfWvJbvKesTvd/IlqEUbLbMCBQQvGKlI/IVsSfarkCXzdP2c56Pu
	 6aPU1pfw/EYZ4cEECi7bP+lEkc8pmkxekLfcxpEh4ZHrU1839ii4OfnDkKHO9Oc+L9tVp
	 mNcS8SKFgyPDZEW1/DiiuepqX++KSc7rjltLoSZlJBlV7KiG8qsI3W/JM6cATZ8VB+CrD
	 irq+dMGtuA/SLjPA+9UE3B7p+EEqf3vtfzDGIzHMo5DXOawDcsptpfx6624ntpYKtHqZ2
	 ujvt+XtwFdg/a/QGhIrZ2JLCl5DAAgsuHFCZP4YeFVQ2PMbM/FlGtaud5ouL1t4iIoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILWjRSMQ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8E060A261B
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 22:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8E060A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ILWjRSMQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so21829945e9.1
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 14:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572340; x=1794177140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vaC1Gh4sjnOn6hOZnUu5njQ81qisZCO27sC/NoNta/4=;
        b=ILWjRSMQY7cK3odJBtv/ovvCwlkTRTqtWwsGChgw3HToRTcM1/0tVMLbvKRjo7wS95
         2iggpWjvK+UvweQczkL8rhmjpuJObeYZLXHcnn5A0or1TGtT6KY/M3u2RPpJO34e/Aum
         0Sl/A26LiAKEwPg97c8LKNeR9qse8vwZqTmxD82/jCZoVsVJ0V3Ge3L9eUl0cbf7Y2hc
         CGre/rYq4h1Bh5kuH5b4BTSKj/hS9J0NbYC+3RGAj2kw4lTXas+QDIElUrn73ckZQIHf
         vo1QQqvamkqZd2f9wp5P381VpLtl2KoBmdsK9j4EoMZms9O7HjdUeabEKmgpho6zi5Dz
         tm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572340; x=1794177140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vaC1Gh4sjnOn6hOZnUu5njQ81qisZCO27sC/NoNta/4=;
        b=hJGqOWcjW8Nf7WihVQg4WYT+c4HBdCOA5guQREBykA6Bk7H/ywLnrAbbEC06GBI4Xt
         x/NPaNvxb8OpQUo9v+2wEjbVMMka2ZHwoxBjGIjvOXxHmiLHuCxAqItE6w7T1ky8+Flg
         qP/tgSOXKQY1ElWRLMWQ6cp5OaZckT1E0whiMXOI2AvM2I3Lr0eQQH2TuHQk8vkwYQN0
         sVxU4+h9blropdzcpsLahT16PWbOJEc2TJBe2gl/RyMINLj0omktnYrHQZKm2I3KhWZD
         Ntub0V/pizpL5e3stIg3nlsD1Fk/hAALTsK6b0ytOApI6UUXLdIkqjQpejPOStf8QBzd
         grSQ==
X-Forwarded-Encrypted: i=1; AKwUvByq1TE6oCBAewGWcawnYlBSnTq8gGU43hW0IqnC3+GtAUwCRf5Wm7BlaEAQ/pPkOiBYxVk=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ679KZ9JyT76WV8Hkia1yvxXCbmysppeoIxL93M3hBvG6x7spR
	1U/0J2KKEI99BkCcW9QqBAtviWcOKrRT62FxqzGQjsG8qkLCxP1JOKP5
X-Gm-Gg: AYBFou0780Je9wPbLUVTw5bkYuno/6V8OtQZffSqeGmcOY+8Ay1HC6b3eIBPHSVaWCO
	tImyVLQT2Sofb4PHRKZShgvVAP6BUIR2XLkua774JW5Jr7MWYtHkOt6v/oQ/un0O+s6Ey4gm73e
	KoMbxYnBTJWmB4Z2u+CjKM3jLp5ZDs8M6k4VT0OWuwJmDIrnE2jMLSS02ioTMZc6h1VBZYy5l/C
	4lo8onwSoUo3c/WIqBsSrCzPXQ+RvX9mtAm7gTjiwYO+46tNfWcg8DB6vG6BvltO20wjlKOw/fr
	UnQYR7jqsdijlXfg00mqNBazdTT5gDeXBBfpdW7j7GbZadZd4Ov3tMfd6pRIUkAu/qhJbq0B5Ax
	uSIWnMibTlPGifXgtmw1kWlEGrgJNkmb4bFB8jc80nX1+O7+YwZM6RKw6+v9zN7NZLpxuK2Pi5R
	spRIeytqbFK/IM2PryAs3t4Vk8JEtrr6xf2bucwet2dZJLJqCu63kvs7ChIkwvrbXF1GASj8nys
	z6tyGVKj0PKdDgYj7HkDoYN1fxi0Hr6SIqpFjCQtBmEekYI8SG4NZkiZTA7yEGzqGAs7KfrMEGw
	scB4Zpm7nRfb4NRlfHg3os3Tvszx43e5NYzVk7KQQR/AW3FksJye35BIjaNxeRg=
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr183853655e9.32.1793572340332;
        Sun, 01 Nov 2026 14:32:20 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:19 -0800 (PST)
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
Subject: [PATCH v2 6/7] regulator: sy7636a: bind to the I2C device directly
Date: Sun,  1 Nov 2026 22:31:24 +0000
Message-ID: <20261101223125.302001-7-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
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
 7 files changed, 73 insertions(+), 107 deletions(-)
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
index 475aff997c2d..14d9516f15e7 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -8,14 +8,15 @@
  *          Alistair Francis <alistair@alistair23.me>
  */
 
+#include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/init.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include <linux/mfd/sy7636a.h>
+#define SY7636A_REG_FAULT_FLAG		0x07
+#define SY7636A_FAULT_FLAG_PG		BIT(0)
 
 static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *temp)
@@ -70,36 +71,40 @@ static const struct hwmon_chip_info sy7636a_chip_info = {
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
 
-	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
+	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
 							 "sy7636a", regmap,
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
index 88ba2770e378..6039abec0c37 100644
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
index f87144e921da..709e90517821 100644
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
@@ -133,50 +141,54 @@ static const struct regulator_desc desc = {
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
 
@@ -184,54 +196,56 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
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

