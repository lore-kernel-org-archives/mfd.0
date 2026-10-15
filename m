Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430C6547063
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 16:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082839; cv=none; b=J22pCMGORXt1kvJceESvrX4//MMrejJ+H/kXcUu1TQg3sT8s5N+8W7/MJ/f2RWWojhJNQ5CxHD+eLwVMnaNzWUyXiPLaGq4rELj8tPShczOrnsaIvBJTVUqXv4BsNAwtg1J/7gsewxmb2dUhuMyZxOoitunFTe9ZirBmOwEkWSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082839; c=relaxed/simple;
	bh=UVkLFT/iCNBYM+zZuBoiPE7e9ayV+mTZppqPDWCEcbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QH943wpQzH0LTm4cctnG+UsM3TzmLIrj4LihDrbmN/vbFv1u/srSKkf5bvmiw/1tr+uTwOfRJW1pDPfsqtoDmA6k3p7STNWNx1JkulBKZ8Hfr08WG9ARnUQTR4vCkf4bZaA6HOsujUFPSbskk4ht42LQXTtIi9RIzwsmCMeFSCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8Jcujxe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8Jcujxe"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dfb76b304so26212f8f.2
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792082822; x=1792687622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehnaBlhbeGX+36y2twAo3wrCg2vlEmltEl+fRRTFHPs=;
        b=l8JcujxepHJ8WPmBzYE7gH8IGHDPCBcPaKvxtod5lKy8SUcADIsAertdoVVt8U92iI
         x1U50Z41NEq636xV18Zm87E33y/CbbwboYXddX5fELR1ZQ1WAh/yg0RLj44qjlBpuKdc
         YGW5Mvrc98dZccRfC3ErG8DirY9rii5BsWAgattV927oDT3+ueDduDwPCGh9T1WQxzgV
         favDDmIUHnWvY33VHVFaes7RTMDCAh14EfUSVIMbDqaze3Nfu4imEvHYj4E3JVTTh8tr
         Bqx+9cN87hRi+GNSHD1OV0vu1Iir9Sw7qf/+SsgpTMmuR2BPqWy/zogZyGfTBVLSkhxL
         iIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082822; x=1792687622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehnaBlhbeGX+36y2twAo3wrCg2vlEmltEl+fRRTFHPs=;
        b=CXNpizBXpTK0fm4lniQuzxG+5Fm9h57WsmFXaxaQIZt8hZihlOrCIApL5IgxvYikvU
         N8Zywzx2VTivWA/2vhdD7+hth8f3vS8GP/dn3lIP3VGh5g7YMdHYL01hlVb5dSJKNYwG
         7xidiaHdxamWdqP3Ykuxyv2nvONW8AbSYQ3D4LPE97Bk5Z/+pXCYpCAYoI74/bU69mJm
         krmmSoogOKNCAfPQFF9bXNSj2Qhvh21dn/pyzMEVIAyRfdAsI192oI7QLfPwTIoO3qaZ
         PCT3kh2k5vuQc+BWn+otwF+5LNbID9SbwNRnLbTZ+Is8SgIQstr8UdpKHkaZWhzhR2OW
         8A0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVo0GFQO3iDAAqxiOPsIPjGiEZzGmXUlSJ1FYQqqS7IQW5BAo/NKt/duP8DnC8Tlsrec4=@lists.linux.dev
X-Gm-Message-State: AFq9FYIRU/K9a6zu/1wzGKQlq2A/5bgDXQq9UeQoFgGirhfxy2yWNSJU
	vL18Ea3gqqtjhCgdidXYBJLstzlTTxL6kWC8bP2XLbAg4fteP16H+YaL
X-Gm-Gg: AYBFou3g7x371yZsyr8wK/qxKKz1f68q1tOq5e5WsNiUJ/QXaNqUmQlUE8r7093i3P/
	4u7NjIWak0ZipukF33ldIQJoPiOETlYOxkdrImAIlHlrxJwz9h5nW0YhuUmjvmh1FQdGqN/aqIR
	X6rKBqBCe+HTaXi0WGRdEMESktG0nJq/dMbGBzCnqest0MhuS4Cbw1Y4q4chKpotaYWMpuGL4zl
	uHkwbT3Kl/9f8b8iicVz3rzv+83PxuelyQ5EoJwcGHrMjyB0vGClyFOszr34JuzgVHn+uPZudXr
	chiPcfMuobol5X7to41hkmuR6+mFVmpcqXDr6FpdkXnkpIkKKAeJc1J+YMf6VIHHkg1WcgUw6AT
	cdOdGUCDBoU5WwsB/1fP5eWdUHJgYv3qxvQNKojHgBHN+t1eFl2aCgplw6FU1gYhHfZ4dp/f6E2
	rGnL0KI6GVeRiGpWBkJbZeMPd+jH0KTDdv3y4nYZ8id6xWKqfGJobtvYP8YJvVYZbjwQF366sU5
	nRsC215yKaY7D0CAsyNssFQSpR0Cg==
X-Received: by 2002:a05:6000:46d9:b0:48c:557d:ab24 with SMTP id ffacd0b85a97d-48dba784b8dmr26077336f8f.4.1792082822068;
        Thu, 15 Oct 2026 09:47:02 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de72d2b13sm14672251f8f.55.2026.10.15.09.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:47:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2] leds: Add driver for MAX8907 LED cell
Date: Thu, 15 Oct 2026 19:46:41 +0300
Message-ID: <20261015164641.363500-1-clamor95@gmail.com>
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
---
 drivers/leds/Kconfig        |  7 ++++
 drivers/leds/Makefile       |  1 +
 drivers/leds/leds-max8907.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/mfd/max8907.c       |  1 +
 include/linux/mfd/max8907.h |  2 +-
 5 files changed, 91 insertions(+), 1 deletion(-)
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

