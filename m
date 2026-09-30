Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB033D1AB3
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753271; cv=none; b=FZwZmAoE2EoUL4VRDdJLXVa/LVkMXtpzqAXkv5kUQZCq2wtzrVQzFggg79wIiYiilzGrAyqL2vrDuWr3BRB2XBxS0y4FyqVko4IO9PZPNA1qz3PUan/ebUPwG1Yyc+3AWmhzNV62FKqJBTACTgEeskh7YVS3vwhLMGUyzx9JOvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753271; c=relaxed/simple;
	bh=9OsGp6MbSHvjE+muNEP4p1TUnXdoyedGt8UY6i3iUCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7oguj1c3UasqOgpQarRsSk1u0NSoi38VQnmrFLe59kLw0eKYwUTnxmvYsChOzs7sSKEmvjjLkUg+il6LzY0b2V2sYcOlhwQ6LlZd+duyWTqs2GzCfxCOYZT+XbxqH1qgDFahI2vvtee2Gm10KWCaHqE0V6FhpQNd2/uziiFbmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1wDpKrK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1wDpKrK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso28252285e9.0
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 00:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753268; x=1791358068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WruczPkazS4ZUlcOrN4t2XFu86i7R3FFqgwfWNzE8vs=;
        b=S1wDpKrKQgItJj1JVTbJZjPs5YCC/Kd5Dk+NbjM6r0dzPu03wSHVzHMnaMwGrsRR/x
         TXRmGKglimwOQj3WU1ls+P2S+D1HCJ52C+TP0EXBPn6EUMcpAmIeSU+k5nXNEtIzGNmM
         1O8Tuj7HvfzxTTbwOfYU5h39x7/Kv9EBx6WvqC+qMHXuFEE1tbSIuTsCk/bdVpoQDNPq
         QcKd3el7VR2iaW8HOop7B3hPNTfxwt40hi0UIMLApG0nQC+S6kyHhGbt2EM90Io+LEhX
         jfIj0sP5dwKHxZPHG8zO3pkzf7bDZJFJqD16o0O44pu4rinJ4EUNbADyCfMovUBJ4veL
         MuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753268; x=1791358068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WruczPkazS4ZUlcOrN4t2XFu86i7R3FFqgwfWNzE8vs=;
        b=y+kEYfr4ZxQLyvSqX8ZbAI98xj83MjV/rSQd97yzQNabTqbXEzTf0M4iROl1yGxwf1
         gvtU0v1USbjOrE5PEiyRBUAEJKvbL5mFFMsOsd6xbvNmmmoJMs4RiqlSabQBG/d/RE57
         58UI5tX8f+MGf99I/pgAocbXGu207npCIo1TIUsTgkcUBDjQQb+YIRNf+0iH3uojrckU
         WJrZNR3an+DB60WkoLstq5u9kGHoV3FlmEBDs0p5vws7O/rWw9yLXAB+Nzi7shF6346z
         PoGBayBU8qjmlm2k42SmPgoZZ0xfYZm76vHONUz62XoAb9hBo6mUIgiuD5IrMzX656lA
         DAUg==
X-Forwarded-Encrypted: i=1; AKwUvBzxWQXPTo/VVmYXuINHh6/8ToLTFE2I4Zlvn9PmkLNkjp9TR/NkA41B5ZBCsrW4c0lvkyA=@lists.linux.dev
X-Gm-Message-State: AFuF++kz4rxdJRN/j3Rk1M4EbQZxCqPaBANJUnC2HqnXui5HROUMyw/F
	4B8HkEhsPQNnGHCidEQb5p6cyJmuGhFXpT3cJE09eh1lxOssdIvKX0zV
X-Gm-Gg: AYBFou1BE8VGAbSBGJh17t72e6Rl1KtWCkLlGceQhIH6qCdm41NhyV7DNy88UJvkLUe
	8YZacs1HRZOp71DDcKGq57wjfLIigkKzzM8zHhrdHTB4Bgvv1+e4vp7G7btCpZXRuqvHs8hBUMF
	FXke91JfRKAZ/blS2dSIkHkyDwT6qBRR0XzIOSNaADhJfyuTKas8eG274POI83fhP9wWlWUmlO4
	KTAg+YvYbQAb7hhbZBhxvLnaEqDasnXzBI/QFNePRWQm+7nOZSP9UqXBaktIAl0tcgJcc23SSn+
	ORi5pJ5TdlCt8vucDQ7ylGzb6V3v7lpUcg/EPYndjHf22rvBhByuxnzTjonW5KRf57xrpaHNDUn
	8jUWcSbUe+ZOd+pgE0B9KmYb8W6TIND7EdCI6yRQriku2S8ekvoEou8eEAY7Nn/yALTEmE3IUpW
	sRvbpOXvKijvj+t+7HGFKyQRrIEqOQOsNGIpD6L0HsbaqqCw60S3/wMYerX9u5waE8DuSR6kM+A
	2oBWTumxRZ0lR529Vs=
X-Received: by 2002:a05:600c:3b1a:b0:49f:fe90:de63 with SMTP id 5b1f17b1804b1-4a01b12cbb8mr6207775e9.28.1790753267817;
        Wed, 30 Sep 2026 00:27:47 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015a84419sm27680985e9.1.2026.09.30.00.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:27:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 1/1] leds: Add driver for MAX8907 LED cell
Date: Wed, 30 Sep 2026 10:27:32 +0300
Message-ID: <20260930072732.66578-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930072732.66578-1-clamor95@gmail.com>
References: <20260930072732.66578-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/Kconfig        |  7 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 59445bbf2140a..ff00ecf5d858d 100644
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
index ed3fbf2aa2d2d..b9e815b2416d2 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_LTC3220)		+= leds-ltc3220.o
 obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
 obj-$(CONFIG_LEDS_MAX77705)		+= leds-max77705.o
+obj-$(CONFIG_LEDS_MAX8907)		+= leds-max8907.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
new file mode 100644
index 0000000000000..358505a1c799f
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
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
+				  LED_ON, brightness_lvl ? LED_ON : LED_OFF);
+}
+
+static int max8907_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct max8907_led_data *ddata;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->max8907 = max8907;
+	ddata->regmap = max8907->regmap_gen;
+
+	platform_set_drvdata(pdev, ddata);
+
+	ddata->cdev.brightness = LED_OFF;
+	ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
+	ddata->cdev.max_brightness = LED_FULL;
+	ddata->cdev.name = dev_name(dev);
+
+	ddata->cdev.brightness_get = max8907_led_get_brightness;
+	ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
+
+	return devm_led_classdev_register(dev->parent, &ddata->cdev);
+}
+
+static struct platform_driver max8907_led_driver = {
+	.driver.name = "max8907-leds",
+	.probe = max8907_led_probe,
+};
+module_platform_driver(max8907_led_driver);
+
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index a8cb2071aa7f4..b4562ec0ce18f 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -21,6 +21,7 @@
 
 static const struct mfd_cell max8907_cells[] = {
 	{ .name = "max8907-adc", },
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index d960dfdd808ba..15901a1b07424 100644
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

