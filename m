Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101823;
	b=jOk9U9lE49rxjTYfSY66LxDqWH+wT3cnShPOjY6H8bxi+zvfh39zMKKkeiP2O0T2rDBB
	 +4XV1x05+tA2KRIc7Hsku+CI/MhlwfpuardIir6rkBmiLl1dV/UWRLlW1pxI6ouIhMR2Z
	 Xq/eR8MoEq37nxZ0E5TTpvVjeZtvetWPG+rWG4TcxoJZFcwLDXEYyuCw1OI5U5/SmQXjS
	 okt+tt1acKRxQMa1jfaq3/1HLfERX4fBZzhxSTsQbOsEbNUAVt0ymT246IJmCbaW1iWVH
	 3AGH3gofq2rrOpbUx4GJljsv2URC6iUgmIKrbgSqbsRTU0FNMXZlSHPox46RohYBVHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nVL/bzTOsO9DqM0NOIv1wT+M6pfZyj9VzLOqb3L0iUc=;
	b=exbVSjeI4CmqgPdB77h7XZVd2MVZDAaLVyWXteN06Atp4PUhf165lQnIOfAqYPsO9IqB
	 urKAvyIZzXz0AxDH8EL1+pG/rSrZXz82JZaA1z/7B7fR/KobODnsoCHBpa4j+18S7HI5P
	 /mfgIRj0DHzxNB9q3eJqOOofspVsMtUrHVILeKawJSR84W+6ad2M2s89jFZBKliCRR6rv
	 ywDHcui53BiT40a3d2QeFMCX7G1U+3dNtTxDsHMcFbaqHAWvKEiJdScmxQuDjDiCmRkut
	 somoRhyRawSBhfLkCzSGU38iveLJgKDjDPDvSAZMODxmY02EvEY0nzaxFxeWulkCsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X98+agaZ;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7160A2636
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDF7160A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X98+agaZ
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so6310875a12.0
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101821; x=1793706621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nVL/bzTOsO9DqM0NOIv1wT+M6pfZyj9VzLOqb3L0iUc=;
        b=X98+agaZuVJpIhipmuFKxEok+fZa2YXOQ3teEUQv2YtwIDFe/ffLtDzjy5i8y9SkuJ
         fC0xP/SrI4YVpTC8BfVWW8SQFjTyazp3+pTGtXxoWVeaXoIUSdyA9S/Q3/e5f5IG8V45
         Io/Vk0uk8Tjz0si8kHkpe3KEYLswFJBZxbYVmk4qAKVKZY5QTTgChCrFedlO7zli9RM8
         IK25/oX1o6nQtrpAf5TpXuB5MpkZl0JHOwAKqHLDDZlN6OJYpjTDLw/Eg1xrFg1xArvM
         +YTfsldjCcujwaKW9Kyf6OdxtEwdptCFl/h1QqG7TvUhn5tGBk412gV75gcahf+ebhu+
         k5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101821; x=1793706621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVL/bzTOsO9DqM0NOIv1wT+M6pfZyj9VzLOqb3L0iUc=;
        b=s2jbRpfsUEhxwRARGlRRKb0uscg0rlfKOPppxPQLoI5rbABGWDDW4RfHwTn8u/xktv
         w7SizgqLpScVMVz4SQRydLVbG2xjtVPW70erLaEYR4nROzuwoJnQAjX1FHTBCF3FwI9+
         Bno7R7zypfYOHvGFAx9HS4fUAgKT4kfm43TcABB3O7pbzyJyA9/oAhY3gmhysfGFO/uH
         8FfeA7uxXU8lW4dcBLb0NnQcbLRN4ycGuMVVQwmtzHIHYDzxBqD2J/NKvQz//tsb40WI
         qkf6NPIUSGJh7f7yL8RC75oTmqEyNE41t7cbhhqDLyMDLlXEjgFsVXJH/fd7euE9f76b
         ocMg==
X-Forwarded-Encrypted: i=1; AKwUvBwiSM/gEyFa19j2xPooxeSPDU4IW38DKZFKUvWq6Bvh1AddejcD1nUjAhikmawrS1NG4Dw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKRzn7kIfB7DtUzmEXYeq608HHnQYXY85/mmx6lcl1oFZ6TWnUs
	pHf9zh/aN7v7niAMmv95r+vCRUrtcSpNAzxIL4gms8I6IsEH6pK0YsqrwFeokw==
X-Gm-Gg: AYBFou2fVJKJtJf5CAg0TJvpW4T85cDU3s3uQjEga2NcoOAeKnm5sFH/BH8UPulYXwB
	aW/GyK4gT0CQciSl064FDpDiHqOl9aSLoWmu4j6Hqk2HSGCXx0Fv6c0EwIxcIqpNYSdCZAfM7Z4
	r2f0hYlHQnJC2avfIXJMgx2EJiLqUj1b4vO4Jo9OQSs/AEHuojKellHxkG+RjZ5M3/HnjfM/Yvk
	iGJRDtISwH1l+EjVXHKDiOutgR3qBPfuryeb3OWRwHrF5AYxGzjKy9ZaSbCc2DzzOE9+2qQJ2w/
	6DUr26fHq3EN6r4v0ulSQzjLWceDis1rPVfD5XqEtuhg7J0MirmEfNeZo0D5cabGnpdLREb9YDT
	GbNv2cz95N5lWPETFvBms28ebgQkbOhxnU3ZLguog2ZNhuTWFD4YPU9/ogy5nwkGRwoQk68iDBE
	KeXZMWVlv+Pr0IR7C4Hhfe84LZDm+Mb4112+FsHj59uIwQGTr7hKLnYyHAHSwkJ5Xc0eHByxKE9
	/m1bqLI1HAu3zxLtFK3Km2LzFIZN50IFLFNAxb4hNWV1wqBdGAUEwnJBKRIyQ2gJ+WlfHRxh5lD
X-Received: by 2002:a05:6402:1945:b0:6b3:f7f6:649e with SMTP id 4fb4d7f45d1cf-6b44311a75emr9097597a12.7.1793101821159;
        Tue, 27 Oct 2026 04:50:21 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm4958652a12.19.2026.10.27.04.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v4] leds: Add driver for MAX8907 LED cell
Date: Tue, 27 Oct 2026 13:50:06 +0200
Message-ID: <20261027115006.86032-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS
---
 drivers/leds/Kconfig        |  7 +++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 788e689fe875c..3796c562919fe 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -813,6 +813,13 @@ config LEDS_MAX77705
 	help
 	  LED driver for MAX77705 PMIC from Maxim Integrated.
 
+config LEDS_MAX8907
+	tristate "LED support for MAX8907 PMIC"
+	depends on LEDS_CLASS && MFD_MAX8907
+	help
+	  This option enables support for on-chip LED drivers on
+	  MAXIM MAX8907 PMIC.
+
 config LEDS_MAX8997
 	tristate "LED support for MAX8997 PMIC"
 	depends on LEDS_CLASS && MFD_MAX8997
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 3da746279bb81..24efda3fbaa44 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
+obj-$(CONFIG_LEDS_MAX8907)		+= leds-max8907.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
new file mode 100644
index 0000000000000..a5c445f75d1b1
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_REG_WLED_MODE_ON	BIT(0)
+
+struct max8907_led_data {
+	struct max8907 *max8907;
+	struct regmap *regmap;
+	struct led_classdev cdev;
+};
+
+static enum led_brightness max8907_led_get_brightness(struct led_classdev *cdev)
+{
+	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
+	unsigned int brightness_lvl;
+	int ret;
+
+	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL, &brightness_lvl);
+	if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
+		return LED_OFF;
+
+	ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &brightness_lvl);
+	if (ret)
+		return LED_OFF;
+
+	return brightness_lvl;
+}
+
+static int max8907_led_set_brightness(struct led_classdev *cdev,
+				      enum led_brightness brightness)
+{
+	struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
+	int brightness_lvl, ret;
+
+	brightness_lvl = clamp(brightness, LED_OFF, LED_FULL);
+
+	if (brightness_lvl) {
+		ret = regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL, brightness_lvl);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL,
+				  MAX8907_REG_WLED_MODE_ON,
+				  brightness_lvl ? MAX8907_REG_WLED_MODE_ON : 0);
+}
+
+static int max8907_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct led_init_data init_data = { };
+	struct max8907_led_data *ddata;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->max8907 = max8907;
+	ddata->regmap = max8907->regmap_gen;
+
+	init_data.fwnode = dev_fwnode(dev->parent);
+
+	ddata->cdev.brightness = LED_OFF;
+	ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
+	ddata->cdev.max_brightness = LED_FULL;
+
+	ddata->cdev.brightness_get = max8907_led_get_brightness;
+	ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
+
+	return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_data);
+}
+
+static struct platform_driver max8907_led_driver = {
+	.driver.name = "max8907-leds",
+	.probe = max8907_led_probe,
+};
+module_platform_driver(max8907_led_driver);
+
+MODULE_ALIAS("platform:max8907-leds");
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index e282dd82ece69..826d7768fd8d0 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index e222250f0cc1e..35b2ede54f856 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -112,7 +112,7 @@
 #define MAX8907_REG_CHG_IRQ2_MASK	0x81
 #define MAX8907_REG_CHG_STAT		0x82
 #define MAX8907_REG_WLED_MODE_CNTL	0x84
-#define MAX8907_REG_ILED_CNTL		0x84
+#define MAX8907_REG_WLED_CNTL		0x85
 #define MAX8907_REG_II1RR		0x8E
 #define MAX8907_REG_II2RR		0x8F
 #define MAX8907_REG_LDOCTL20		0x9C
-- 
2.53.0

