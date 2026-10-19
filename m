Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205884AA033
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405220; cv=none; b=El1DE9m/P2H5XqKqdMEDKG4qRRPdhS5ETkqzOiY0wD+663P60Cb3YgWm5uEBEXCuZxy1amRxO1AEExOghHIDajzbluYAGjsVWrC+qpXgFnysUiaaqOxuIBOagU4A2V39ho7JFCgZg8Vl8iFFo93U4z3+Fn8Tw8ynG3ObEl4Pchk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405220; c=relaxed/simple;
	bh=iFTelZR/fM6F4ON/hFI0VUi+K/9N9/4nqgaalnqwzdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j509tgJWnaJmPLNXawyLQfOaafj7cjCESGpBaFDEe32NCf1lbPcVwh980Od5yR0QeUORBqL0lbcBhY4xH6OUy00sL4H5VFBszgzp3zMxnV+VdLT6LtKygGng8Glmgb+JPcgpk9vj6vTuUa6dIdQ1jnTZqWonL6kzvgNUCh+3Unw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YxkdGLE/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YxkdGLE/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1081232f8f.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405217; x=1793010017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+VtaEFlyrBkdNO0nsT9Fm1xsP8BTwSkFBjYFN2kHRI=;
        b=YxkdGLE/z81qehmyfte2dpO6KxP74UeNpsFkErIJRrD3CnlSi0SWk7kcb8qPHSIczI
         CHFGMqWzf2tNUhp7w6hPHeJNGXJEpTLX9Hlv2WqONEnN1IAvLeOiI1k4wcntfZmqMh57
         8Jo7OehsTZyTJ/bQEtOycKXojoqneuMhDb/wFkk4gpd0j8jMWnUcP5rOv9kdHlQByDfm
         iwVupWk4c4tnpKMrOMMPBJUhtYYbu0oNjFzTcZ8x+5Fv7VR3XDkmvHnshiu++4mhRMZ9
         B2qvHbBxL25siAwQ/7vEi4tp4WQGIk4orucCn9NuYO+o4HEZ1MIMM5fh2VG4y0Ht6ljr
         nBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405217; x=1793010017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+VtaEFlyrBkdNO0nsT9Fm1xsP8BTwSkFBjYFN2kHRI=;
        b=NeqIWX8R77e6/dpT+SuU2n+RDxcleSkOPQ7ojVovKdQJ5c8MpVt4Fi2rcKCT+kBi+F
         dHhJvTSHWxTy2UzKVYztlYjTUNsv51W4O4LQDywuADi0NbtLICtyLymdTggjlClRcaSc
         nExVhOBgXFhuCvJKwPaLj69cj/IZGspxSo10eEXkW+Kf61Y+4izMB5VIQUO4QXqBUgbR
         PrzAkxR4osRipy4WkBHUV+BEjudrmCwbavMLn3IGr7L0mrgrJBSURoiMC++Q1mQKk0OI
         1x02SsRFQh5TqTq9r3ZcweXGcZfAm989vq/WTJDdF1oh5xQxHkgB9yRUaI8svNkqt4jf
         RHLw==
X-Forwarded-Encrypted: i=1; AKwUvBymphMPBbkAycQRWlBOwko+6LEZKFSDNOyvNgJENuLQDMx0tYv8wpwAx/4v1CG+bMmKaTM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLROhffhE55PxcOnuYhrJxsYaNkw+Pji1BpyW5bL9CJce1s47hX
	NvoLJpBUBrj6jp7/rPI7+4LmcFdMsTF0v5zyXBWK6VqoU3c6136fRZfL
X-Gm-Gg: AYBFou1yDeeGYXxZNNP2x1+8AsrxKznem0olxK1+E4u49GlDZUgpNI5j5cI1ip/4rdj
	btzktqeAt2Bge40KHiKi6lQcWdbCkPz0bGJdoNI9ettbdeEK/TVLuI70hMXmcAP2n2iPTZ5DQk4
	bpLCXd+XGiT1aDqmWm2E74KLrEvDEM6FxDEarUURSGqfYQsvS3LTE/uJhurYVRVjCxAmCDZNlai
	sJWe0krWta8aW5DDYNbzJtD7oUaK100+ZP0VipW+y0YkSmbXUVhyCin7c+B8PZpkFT258JzU4bg
	asuzV4Cqcd3QWge5fR+Tb/OOMVbxZHCYSqsAOQGVc5TOu+6R5WvZqBC3JYcZgRNhjFZx3J3+ftV
	94pWKcgcxq4jf7Grj1OZrzw3kkI6Wv0HqWfwRkwhWG/SjNwQ5Di8tBZ6Enl2S8KweYY+YQZC9bc
	QG4r2f/jcf2ZrtkWtALLxaI+uGEFUjY3zRSaqovXcDwQH/Y2Z3LH4oTqbjkNL70vxoM+9SxjRwZ
	ahxGOlgxDumBgn5OGU=
X-Received: by 2002:a05:6000:4552:b0:48a:fd58:a7dc with SMTP id ffacd0b85a97d-48e07baf68amr9685152f8f.12.1792405215817;
        Mon, 19 Oct 2026 03:20:15 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4feb6bsm23931792f8f.41.2026.10.19.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:15 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3] leds: Add driver for MAX8907 LED cell
Date: Mon, 19 Oct 2026 13:20:07 +0300
Message-ID: <20261019102007.131375-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext
---
 drivers/leds/Kconfig        |  7 +++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 92 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 102 insertions(+), 1 deletion(-)
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
index 0000000000000..c3bd131800a8c
--- /dev/null
+++ b/drivers/leds/leds-max8907.c
@@ -0,0 +1,92 @@
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
+	platform_set_drvdata(pdev, ddata);
+
+	init_data.fwnode = dev_fwnode(dev->parent);
+	init_data.devicename = dev_name(dev);
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
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("MAX8907 LED driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 6d5e6a1556fd5..9f737ad7eb398 100644
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

