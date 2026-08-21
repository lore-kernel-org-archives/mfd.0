Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF683783BB
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283330; cv=none; b=uWF5DtvSkfRoSxZQyLdCzqsIMEKlKEecb2WPD+5x8bsIMNKYwKhJYVee7jiJjCceSf1NivlNM78CqvLU7F413xLimVkyRv1cHhLkofodxQOYSAfN4s4Zpuwr9YhLNBY5jKsr/hPTVUStcLS/sjABTV5Uiaj14hPmLT3k43IlWDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283330; c=relaxed/simple;
	bh=B1ouq7zNk3OffF9x05iRPTwxZeo6B5tYmbwVJug955A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mZII340wXzhWPmnX7gl+PspM88G1xCIE0C1ZcJvC5opcrpokeALikxBNYT/ZNLv1cCcfy5gKleKaiYawaaweUU2XZLVSzn+/OtaiTTnseAMWHmXed4JDskH82Pf6fEdnpBhXSLyuGsU6wCAM+WxqHgaFJS1+FY5lThCO6f1eNqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6fToW6v; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6fToW6v"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so373326a12.2
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 20:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283327; x=1787888127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlQ97Apv2CPkVoHg6S8Gou0Qv9jKg/Qt6XZBOTaFmHE=;
        b=o6fToW6vyDYmzYzzwUmWeksBOppHRwW8bVw9kA3rOU8DNiATipkpmGjybPFv+L5Ge8
         fkjOhYo1qH4TBmzddQ4T+ewUbCffS23C5KjArLxeNsvy1gFJfh5QT2FmdBIAxEPVBaOf
         oHNlJEV29QTgHgXIjFbhQB6k4gCC4p96Zzh0Aow7vZO9Iplgfd9jCx6Q/Fp1JQ3Z9k4w
         Cmuaaz4AzHUV9Jhor0lS2kZDXGtlk7Z/AGvM9jSxvDzljNOVeeEMfZe5jYgtVe0Q5zK+
         e11ZsRDanPHIA4mFegOU7J+IDPl4x2PILLkY25xpJIk6JWoH+BjbqCrfKV7MrjfbunG7
         oMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283327; x=1787888127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlQ97Apv2CPkVoHg6S8Gou0Qv9jKg/Qt6XZBOTaFmHE=;
        b=jD/XxfDscBjzjnA7U9R/djPS/RnCx0wBHYG5k329rWUfvQfktlVwrIL4X4iD5qhRNq
         GEO+HSJwrdYSeRZYVOcfZA4Ied3+qx3+RLl9oONbWcsnYE+CzCwsb86AYsHoz05tWfix
         XIHGhuOQM7kvdVKgbQtPLQKf11exGfvaGQTaeHhUEK0JA9zxIcc7347ZfzqVvZrTTzOO
         KHouU6eGgVMrK8YCwhuGagqka8fZhweFAhju1fH/Zq0AsCUCNQOyCttH7a/OIqVUlWSk
         00/5c+emnamVmgMJM8cfiJ/6c+4uyweax+wtsvtAbKCdUEVisLTs7sL3qZmn7/wQSeC6
         xcgw==
X-Forwarded-Encrypted: i=1; AHgh+RpbB/CaHE+S/g/r/VBzZNP8NgOtuh3iGQgFVrnePjp61gI8+psHCzYsuzs2pejERooWF2A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwG+tuNpWoSUINa93NfQYKWWSWNVwsDyqjh/vraPY5RXbgsACYt
	kjI1LTNeGANbCB5q21yLl37Q+wWZ7xKE6PT+evobyLnG3NhoSr0P0czJ
X-Gm-Gg: AR+sD12j0Pcwdo4uxL+ze0S3DlgutPLwgkQqWzuJ05/MnEcKzbh41hQbgQrf6E9lENN
	iPHJJn3FJCPv0EPDvd4jVppEeUuNnenw5z0ffMiRbND9v5+wSmBzgRxc2HDkryaYIVnOZ+pl24X
	UdDMPhE7ApljPCS5MEb4jkccKgfUxGvbx3HZNtUWLWXHFAImOlth6H5hJ4ZgtBjO3F/05XTABQt
	F+YUsXdoWAplCWkxtd9cozY8iuF0GAvNoOJEeOmAE0nwYhfha330sIPolWmmbBGzIDwcwVb6Guy
	bqxpcNHRZ0IvI31sMKoV4mMX0NYKVEbFF/Xn6KHSMUzGPd5Y7sIo5n+uOQSG/AWmCzX3O1lpPLX
	4JnxRUXZDefg0Omb5kBhZ67JB9FNbJ6hdRsx0rnbrCBHQ9jGcbrocpFtnjxEH4YoH6M2ZaOJlu+
	j7IcYbesSum3ht16EhTfXzZcloWgj+3S/BIuVjkHURbO1wP/QdIjEOyR8S/WWFNh/Xi322MN2QD
	78Hy1pfz1VtiVjcqy0ERK+w3r5kSDicm4ZuJw3Thg==
X-Received: by 2002:a05:6a21:3a46:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3cd2fddf03emr6085839637.1.1787283327385;
        Thu, 20 Aug 2026 20:35:27 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15891a04csm2204271a12.15.2026.08.20.20.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:35:27 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v7 01/10] mfd: nct6694: Move module type macros to shared header
Date: Fri, 21 Aug 2026 11:34:56 +0800
Message-Id: <20260821033505.4017901-2-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821033505.4017901-1-a0282524688@gmail.com>
References: <20260821033505.4017901-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Move NCT6694_XXX_MOD macro definitions from individual sub-device
drivers into the shared header include/linux/mfd/nct6694.h.

This is a prerequisite for supporting multiple transport interfaces
(USB, HIF) without duplicating these definitions.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v7:

Changes in v6:

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 drivers/gpio/gpio-nct6694.c         |  7 -------
 drivers/hwmon/nct6694-hwmon.c       | 21 ---------------------
 drivers/i2c/busses/i2c-nct6694.c    |  7 -------
 drivers/net/can/usb/nct6694_canfd.c |  6 ------
 drivers/rtc/rtc-nct6694.c           |  7 -------
 drivers/watchdog/nct6694_wdt.c      |  7 -------
 include/linux/mfd/nct6694.h         |  9 +++++++++
 7 files changed, 9 insertions(+), 55 deletions(-)

diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
index a8607f0d9915..53bfc5983648 100644
--- a/drivers/gpio/gpio-nct6694.c
+++ b/drivers/gpio/gpio-nct6694.c
@@ -13,13 +13,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-/*
- * USB command module type for NCT6694 GPIO controller.
- * This defines the module type used for communication with the NCT6694
- * GPIO controller over the USB interface.
- */
-#define NCT6694_GPIO_MOD	0xFF
-
 #define NCT6694_GPIO_VER	0x90
 #define NCT6694_GPIO_VALID	0x110
 #define NCT6694_GPI_DATA	0x120
diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
index 6dcf22ca5018..581451875f2c 100644
--- a/drivers/hwmon/nct6694-hwmon.c
+++ b/drivers/hwmon/nct6694-hwmon.c
@@ -15,13 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-/*
- * USB command module type for NCT6694 report channel
- * This defines the module type used for communication with the NCT6694
- * report channel over the USB interface.
- */
-#define NCT6694_RPT_MOD			0xFF
-
 /* Report channel */
 /*
  * The report channel is used to report the status of the hardware monitor
@@ -38,13 +31,6 @@
 #define NCT6694_TIN_STS(x)		(0x6A + (x))
 #define NCT6694_FIN_STS(x)		(0x6E + (x))
 
-/*
- * USB command module type for NCT6694 HWMON controller.
- * This defines the module type used for communication with the NCT6694
- * HWMON controller over the USB interface.
- */
-#define NCT6694_HWMON_MOD		0x00
-
 /* Command 00h - Hardware Monitor Control */
 #define NCT6694_HWMON_CONTROL		0x00
 #define NCT6694_HWMON_CONTROL_SEL	0x00
@@ -53,13 +39,6 @@
 #define NCT6694_HWMON_ALARM		0x02
 #define NCT6694_HWMON_ALARM_SEL		0x00
 
-/*
- * USB command module type for NCT6694 PWM controller.
- * This defines the module type used for communication with the NCT6694
- * PWM controller over the USB interface.
- */
-#define NCT6694_PWM_MOD			0x01
-
 /* PWM Command - Manual Control */
 #define NCT6694_PWM_CONTROL		0x01
 #define NCT6694_PWM_CONTROL_SEL		0x00
diff --git a/drivers/i2c/busses/i2c-nct6694.c b/drivers/i2c/busses/i2c-nct6694.c
index 1413ab6f9462..ef3329f34246 100644
--- a/drivers/i2c/busses/i2c-nct6694.c
+++ b/drivers/i2c/busses/i2c-nct6694.c
@@ -12,13 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-/*
- * USB command module type for NCT6694 I2C controller.
- * This defines the module type used for communication with the NCT6694
- * I2C controller over the USB interface.
- */
-#define NCT6694_I2C_MOD			0x03
-
 /* Command 00h - I2C Deliver */
 #define NCT6694_I2C_DELIVER		0x00
 #define NCT6694_I2C_DELIVER_SEL		0x00
diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/nct6694_canfd.c
index e5f7f8849a73..262b4c26c9d4 100644
--- a/drivers/net/can/usb/nct6694_canfd.c
+++ b/drivers/net/can/usb/nct6694_canfd.c
@@ -18,12 +18,6 @@
 
 #define DEVICE_NAME "nct6694-canfd"
 
-/* USB command module type for NCT6694 CANfd controller.
- * This defines the module type used for communication with the NCT6694
- * CANfd controller over the USB interface.
- */
-#define NCT6694_CANFD_MOD			0x05
-
 /* Command 00h - CAN Setting and Initialization */
 #define NCT6694_CANFD_SETTING			0x00
 #define NCT6694_CANFD_SETTING_ACTIVE_CTRL1	BIT(0)
diff --git a/drivers/rtc/rtc-nct6694.c b/drivers/rtc/rtc-nct6694.c
index 35401a0d9cf5..c06902f150c9 100644
--- a/drivers/rtc/rtc-nct6694.c
+++ b/drivers/rtc/rtc-nct6694.c
@@ -14,13 +14,6 @@
 #include <linux/rtc.h>
 #include <linux/slab.h>
 
-/*
- * USB command module type for NCT6694 RTC controller.
- * This defines the module type used for communication with the NCT6694
- * RTC controller over the USB interface.
- */
-#define NCT6694_RTC_MOD		0x08
-
 /* Command 00h - RTC Time */
 #define NCT6694_RTC_TIME	0x0000
 #define NCT6694_RTC_TIME_SEL	0x00
diff --git a/drivers/watchdog/nct6694_wdt.c b/drivers/watchdog/nct6694_wdt.c
index bc3689bd4b6b..4c06ac105562 100644
--- a/drivers/watchdog/nct6694_wdt.c
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -20,13 +20,6 @@
 
 #define NCT6694_WDT_MAX_DEVS		2
 
-/*
- * USB command module type for NCT6694 WDT controller.
- * This defines the module type used for communication with the NCT6694
- * WDT controller over the USB interface.
- */
-#define NCT6694_WDT_MOD			0x07
-
 /* Command 00h - WDT Setup */
 #define NCT6694_WDT_SETUP		0x00
 #define NCT6694_WDT_SETUP_SEL(idx)	(idx ? 0x01 : 0x00)
diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
index 6eb9be2cd4a0..3c683e317aa3 100644
--- a/include/linux/mfd/nct6694.h
+++ b/include/linux/mfd/nct6694.h
@@ -8,6 +8,15 @@
 #ifndef __MFD_NCT6694_H
 #define __MFD_NCT6694_H
 
+#define NCT6694_HWMON_MOD	0x00
+#define NCT6694_PWM_MOD		0x01
+#define NCT6694_I2C_MOD		0x03
+#define NCT6694_CANFD_MOD	0x05
+#define NCT6694_WDT_MOD		0x07
+#define NCT6694_RTC_MOD		0x08
+#define NCT6694_RPT_MOD		0xFF
+#define NCT6694_GPIO_MOD	NCT6694_RPT_MOD
+
 #define NCT6694_VENDOR_ID	0x0416
 #define NCT6694_PRODUCT_ID	0x200B
 #define NCT6694_INT_IN_EP	0x81
-- 
2.34.1

