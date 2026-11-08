Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150864;
	b=IgT3NNewBOQUUH+ir1n0hX0GYS247pfmX0+U+O0Fkx+NWHXsTow359G7+rOAQNUrDc1q
	 oG2WhwGF6sCEVUhq0bkU7Q+PdPpflC2gEemqPuA052iZq/S51fZe91Gsb7w47dy+6vBeW
	 mysoDL0wVphS71CK5MFCAi8+LeuD7rilLRrqiSR/dZ21gp/s9SsKBw0MzHz6Pxm25SP2x
	 IBrsefPRiJ5eAM3wryi8NkPuKVYaEJEQVYho9tYRNS0MIRKshenEbFfWQYzF57dr55uqD
	 PihlEIxCHGPMVopsmGw5yQL7GvDw84U7fjsNiFVKQpE8mbgERvxTaslJgjyvjrcD6kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
	b=DBPsZOQBSJAp0MaNUosXnjb1bO1qgdKL/m85cYcQ7JaCiwP4ETOPXFsAhaNw1o60qYEy
	 T+K5IdbN/wZYGfJejKuOvQ7xs3uLgOsttakJRoK8gDVPVv3NyW/ZcwAdwJXUASj37pl6I
	 AKqDyXcZksr0zR78aj+anCVFJj2rmezjVcTfmvA91HeDnU6em/njdCI0yW9qpS2TPIV/U
	 ppmPwbSM9xs/If+j8BqKzc90DAsSLtkIuvi6XbAiWiuo5tDlx1/XbWepRJxr52M8vWhZ1
	 zr7I3EcowE7NkMmd6CMBPhYXUzpWalN1l1j1irAnR/WcZ0VX6bC+CDZGLsljivM5kvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJ3qeg0C;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E89F606D802
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 15:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E89F606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJ3qeg0C
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4ceaee6770so17809766b.0
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 07:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150854; x=1794755654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
        b=TJ3qeg0C9a7khw7rB05gS70x/JQsETwfX9YC8ieS4cn+f3cKNCgO0pYuSvkdZZmNLO
         UPgkOPGd92jwyXZPwPYEok4v43Q3xHYTEofgaML+bMgYVbjiuTu33218vThPYi+46zwe
         Oqa87L0YP5uyi6e9Wx0/p+Ur2AukthsUIkp6W+Lb14YXGnomLCpSoxsW9UNdkqIVRMU7
         u1/s2KBRjbtOAy10e03cGAwrWpQ4l3Frk0dsZ08BL3U9b8pXGZsIviX3A+Nu56K9Lksd
         gWiGeNwTtYU/a6wGlBPJ0L3Nf2pe0aU9YO4wnOszxeR+mE7wB9tF6AoGxPifYPUG42ph
         y5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150854; x=1794755654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wFXAvIZ05DT+EP0uTpO9RYgrxMPjXWtvmA5EWq5rw0g=;
        b=Sh1qitoJrwFqOgLXK3dRlUHteIltKT6RhVR7VqexIwQBTRNkcbXrltoa/m0tKQW/9f
         WAni6vVqxPn1QLZwrI6d5XJX2UmyqNyNYAV6/7FMvIV3kRm+KslPVOfGY8xd289BBt5n
         GtldIkp6A5zZTZ8/L5L+vaZ3iXhktKLxW5Y67ytUxD16nImorakiWWuwyrxtPBg9B+ce
         V+rwRSIGfNmsl/JUMvnLLoC8V4KWGQfvn7D0dtC55ZzOTtZHplnfLnQrB4VVw0uvcARC
         vkHf5gYU+5EqK17RZzOIS0fD5Sj6hA1aZ9RgG7jDxpLxWCvX9AgizO3WRzcHDFzu5BAU
         3qsw==
X-Forwarded-Encrypted: i=1; AL+hErHkHdyU2AB55wIB7VgTGYD8Eqwi6dv+fnmmw/KwfRHwimiFQrz3A3kS+4o+2SsoN63RVKo=@lists.linux.dev
X-Gm-Message-State: APuU4Z/kaF1whOmVFsnNMTqIK5pFMv3e+OJgD2KgEcvdGOSz8cjQdMgL
	fThXIlwIlk+dGrg6DRsmzFa+Rh4QT6wgWEL+yP7psjn2dBl2DskNw8i7
X-Gm-Gg: AYBFou3WhpaUZ3bxs5zuJFIYGeyCJ3yLMST+Xh1NJOXfbszjwOdbB4qRdi4LGCMhRFv
	aNqKNgYljUW1A4aLQkXam/B5EPVn2nOk3TL5uvVZWltZQ2i9GkBMLHwcvy55jWr8W+Hi5PHwDkP
	S7LsNpTtDqT4/pNLfTBTUkjKOtisSYB/nH5ZLEzW7xXWmuyVx9MnvwEac3o8+3HPwObqj1YGJAO
	K/BdLPgpwuKslER7tEvymTPzqM5zujWgAmroC70+N5LwO5O7CBNqNkmyjrIXQsz5lrUTR6CEiJe
	wlZ4/+UlBuzti1wXK7LZmmwN06rWmBvSHLOFWjc+ws4oryuW7dP0U7qXgCHNEfbhmpRDM2QANi1
	BLgHwTktGtf+lAcLvESWKDZuHBLawoKWdtN2ogobD1zXGiQ2Y57eMb/kqizosLVtMIa5PKJYgxa
	yn0ynpdLmRjTzVK1UGXBlHjRTzPSg5rZXOR3Iy0x4QpFflxBPq30Rs5Hp1hqmF6VOHL/yHmWy3J
	kMkrYM0PRBXQ/ZICOUOxD8rnGKkPcuAksz53HsZG4Do7AEuCtoogGvUrXtmfmDa1ADZTWM9XNYc
	PfvcvJfkGYdR5yI26lpmrDrXMXVFcwPbRDfXiG1EdZTJNo7ZofEUP6PgnLMOYJNyKdpi9uz8UMk
	fmTqvLhJWIQ==
X-Received: by 2002:a17:907:5ce:b0:c4d:4d5b:849b with SMTP id a640c23a62f3a-c4d6db1f141mr151964566b.19.1794150854401;
        Sun, 08 Nov 2026 07:14:14 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 2/3] leds: Add driver for MAX8907 LED cell
Date: Sun,  8 Nov 2026 17:13:47 +0200
Message-ID: <20261108151348.204182-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
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
The LED node is a child of the PMIC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/leds/Kconfig        | 10 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 99 +++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max8907.h |  2 +-
 4 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 788e689fe875c..d4e0f514bd667 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -813,6 +813,16 @@ config LEDS_MAX77705
 	help
 	  LED driver for MAX77705 PMIC from Maxim Integrated.
 
+config LEDS_MAX8907
+	tristate "LED support for MAX8907 PMIC"
+	depends on LEDS_CLASS && MFD_MAX8907
+	help
+	  This option enables support for on-chip LED drivers on
+	  MAXIM MAX8907 PMIC.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-max8907.
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
index 0000000000000..795b35390b039
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/max8907.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define MAX8907_REG_WLED_MODE_ON	BIT(0)
+
+struct max8907_led_data {
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
+	struct device_node *led_np __free(device_node) =
+		of_get_available_child_by_name(dev_of_node(dev->parent), "led");
+	struct max8907 *max8907 = dev_get_drvdata(dev->parent);
+	struct led_init_data init_data = { };
+	struct max8907_led_data *ddata;
+
+	if (!led_np)
+		return -ENODEV;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
+
+	ddata->regmap = max8907->regmap_gen;
+
+	init_data.fwnode = of_fwnode_handle(led_np);
+	init_data.devicename = "max8907";
+	init_data.default_label = ":wled";
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
+	.driver = {
+		.name = "max8907-leds",
+	},
+	.probe = max8907_led_probe,
+};
+module_platform_driver(max8907_led_driver);
+
+MODULE_ALIAS("platform:max8907-leds");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
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

