Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733536;
	b=1+yfit2QEbviBwjVnD4pKwFk42dfJTG70Zix8Jou30othDe8RIi4UC+rd8XkfYH1i/pr
	 OAeNU4Uzve6Qiz31ZctjByqVyp5I99JUUs8+43D4rnb5VqSAktySA464M3UhR2mLxm2IZ
	 Gjm7AfBo2mJkBvY+UyK3a7eMW7MuNQ9fTy+367dm9+Ok5CF+LHt4nPkCtDy05DpzSDoRj
	 PIwGAZhWuiagkW9frrmb4gddx+gjsV1sjz1lx8y0/bsGGCePF1myYnLku06IiYtDiDK40
	 68EtXuNGbda5PavX4jC7gadmxke1NrQOXKJ+uEah77ol6Cqp6qGlXCMuSIkwpWuADpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OXs965iTfMNugiuDlC2HCgJXfc/BaB4gTTxdzfucgUU=;
	b=niij6G6NlFydjkEJtU4/zEouxMvAbMa1lBErGVz1natGHbDjJnbO6yNxEitg2tunf7sV
	 7C/wQtfQWTe63WanquxsQ3nepayHMKDPUi4Kx7Ql9kmJpXa7mc67PjBs/RZrVKtBjcwL8
	 43yTn9GBNSmYpDKidyr3RJCyggKNuu2CYObzhLkOzpUbZSzTxFPDEpdVtoaC5ypZVY6sy
	 GHzzuRW5YiPjRA6R3qmoHFoYM77s+bgHJLrrplXuUoRc2D3RSr0PXT3zDJD/+tFDXiT4x
	 t62JYU404sGYrJGiGTCqnfnqT73iBxlxNBqnRMwsl0HknrUE1uUN1zNv16dsodFwxTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwyU8HYj;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD60606A88F
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDD60606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwyU8HYj
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4682977f9aso386449766b.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733534; x=1795338334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXs965iTfMNugiuDlC2HCgJXfc/BaB4gTTxdzfucgUU=;
        b=gwyU8HYjD0Ug9vFxF7rSNsywrBEteNfEW0vTnepHof88StMSAmIGdnXo1BGq5wtMjA
         73Or51ljoM3o5UtSwczAVfVuH8kXpS3gJzBTiEU++kv98eGfF7CZoNOvw7g/R/xKNrYa
         x3DSciIm8I222nRg6uBX+OkjQUXtbURrz/64UmEaXeTOArni+my8kLjgu+IbsR+mMzAJ
         TNxMOorOosY7avqvqd+O2lmHznrDe1uaQ9iij+5L0CM+ASqF90lDhJcHk2LH0fYN4Eij
         SRgsHhbSXZmTDHnwzWuu4CyA+UUGHORdSgr0k5keCCufoWw20t2PAGRj9sHF8iWcJpwZ
         vPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733534; x=1795338334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXs965iTfMNugiuDlC2HCgJXfc/BaB4gTTxdzfucgUU=;
        b=QcHoRnPmT3UimAnw9vNLN98t5YMEj/dHOrLZuluFjy1slhvVz6NTlcy8N8slBtNSPd
         iPDr7ijTpgQvTyeYlZEKKvHL6IvgujjYXKX78BkDD66BjiACr9eASQpkX1GwS6QWuDBe
         EfrXomOPJjka8efJwpEQo92xq548vCCtg1AykC2wmnH3fJJO4We4ulNwOUCqZxODkcdz
         lxKQY4ytLZ6S7hyXDrnsZPZIm6mpp/CulKqLHeGDq0966LA/yKaSCFrXPW5NPRma+/IJ
         uhENBngob9Ibb+H1kHKjSM2PC83Vyz1lGP6ev1HqQA8SV6Kn8hQRQxsKmdbt/NiYOohR
         B/NQ==
X-Forwarded-Encrypted: i=1; AL+hErGzRQJzvLxeSI/vpyT36qUPXehLEiggSEEmlh31Wo1uPbSthCDwlnQNOIpguFQpaqCk9SM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Y6f3Q7giVDWsgF5jZB8iGlLfnK4G9FtFf9aOx3oAgnA+zBvoJ
	NA9ESGWWnuDXP7b/BhX5WvJ+WN3MNlv7xvscmh+/vLH1C5gF5nt7s5fp
X-Gm-Gg: AYBFou3D11MBu5zqwkcy8QKXXFKOmHifX0AVgbbUVnJYRMnG9gBCdmykzluj0ol7rm2
	Gi7H/eIb1VUMAJ/FFEEP6CjtLEpxyz3iJyoQnoIcNCuW4NEW5wbRVn5niUZ75S2cyhXWbj+Fxnh
	l+zPMX1xRl0XcVWrx0Z84eHcEbQ1xmD3Mu2m2bioeMOrHeYyCzNYcvID3Q2RwLmM58qMNwEkvYe
	Wtoa0NP7esa1ktV/d/p6sqaw2Iey74Rjpphr2hy6yBDRuOCKwIiB4sDDpGNfg89k/9uyjRm3KWX
	WtwDTzQKRDsaNmcsdVZy3WXvnl2Bttye2huDS+5iAd0+5Rgw2Sl4knhbr0G1YTDGhoPxKaxE94c
	InrvQuthT69t1i+acmiGkbZixWnmGdqr0IZ5Edetw9v1jnH0R/j5b/k8qwy+iO27Q/HawFU/nnk
	wcjkLqOIlD1O6awIJSdbDQC1fYYnJncuJvlUzj/nvvZjdPK8+ctxg229s2Ei/bualuLMVQ8F0/L
	iVKKIsmcY+A2pTBv+f2GowqjhryoCJcqUYpFvHJVbdLpf1cnGzozzbx2Y/8/tFH91awo0OEGt3U
	0N0AU9qg2qc4ZB0JN7wfF14tovAQ/8kxcEH00PjTZNr6bFdOs8el5mJkwEvittf0xqtQSrYU4Dc
	YwPF/mdnsNQ==
X-Received: by 2002:a17:907:6d07:b0:c4c:b4fe:ca01 with SMTP id a640c23a62f3a-c509642cc7bmr553111866b.37.1794733534433;
        Sun, 15 Nov 2026 01:05:34 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:33 -0800 (PST)
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
Subject: [PATCH v6 2/3] leds: Add driver for MAX8907 LED cell
Date: Sun, 15 Nov 2026 11:05:19 +0200
Message-ID: <20261115090520.102216-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090520.102216-1-clamor95@gmail.com>
References: <20261115090520.102216-1-clamor95@gmail.com>
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
index 0000000000000..46c60fde4ee39
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
+	ddata = devm_kzalloc_obj(dev, struct max8907_led_data);
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
index 025874e5f8808..9865ae52877fd 100644
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

