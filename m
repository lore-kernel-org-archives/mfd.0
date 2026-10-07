Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715DD489FC3
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365117; cv=none; b=iNbbuha8OU1bO3UqZMEM+aJYs9JSd5SIH5aFL2co5huPTJH8pFtHoDBxQFHk47LIaKdEcikItaN6YZzB+AL2PC7Hx3l6M2WMMTiFiEEJwsMJPlyUAklo+VBmY5ws4SzCjGr+GBnG37FEnGvUFhMIp3mOgGus0nlc7K9dX6OBLEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365117; c=relaxed/simple;
	bh=EIU51X7sbCvyr9ufFBZFKlwQ5fYgl7LrFHObcFZMVcE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rY9nViE4aeHL3UEzq+f+FpIoYCXChklB8wZt/j/LC2Om9t9yQZWv9gH26yhjhrq5WLL15AoHEdXgt72N1JY0gJ/EpWGUa6Oa1oDrvPPXl6qq2L2z9rYiZhdW3S5XcsNBD9ZA7AH6HyW3j7tgpY9K5o1SUdjGmE0cm/4Xw2VJb34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qISDFtU4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qISDFtU4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e541dc9cb9so8537735ad.3
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364899; x=1791969699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5R4VZ/vcFSxE7YhW6e2jDhGR189+VipnJ+Yy7YMf3I=;
        b=qISDFtU4NwL5CI8NURl7URqr3fNVAubY63SJ4gYVbE997s3L11h/fd2YCLVjWe73um
         IhNZrk5tokWpmXB0qid4HOCn76R/MtP/0y85YES+/uK4qh2NjoWKUeS2/GY7JtN2K77l
         lnSbf1PPyLOW3Flz3UWOrvS+GD01uUbI7MhqOb7GbeD8szH1sFf4aa2KjtIrJMkF7z+8
         ru7w2yKSCXRHkmOLQTgSBcETqefAiXjcMIPKAFGpYL8KlNv+M6r6J83WVwHjjGEt/zy4
         F518yZVVMusZx4YHwd/sLp80wT401H4nf/hAi9HmBCCefDk5ZE9vWM7iLlS46KPbdHTT
         pbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364899; x=1791969699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5R4VZ/vcFSxE7YhW6e2jDhGR189+VipnJ+Yy7YMf3I=;
        b=EVfJu2e5MdPguk3nTVzc0eDjEOjkEbTaJRuFOoob0OsaWCuuBV6GEmgXvTnQHWP5eJ
         xCCnoAhro6zLKQiGwJyUrKcqHXyFBUfgAPj5T+mgl9rfPuwJ9Rsa7WAYBjcpfM4DWL45
         BkZYs1qPsbyF9Q9ckfn7jjAdMyyDTLsWgtAzMvBY0emWI2IfEc5XttaLgPc7SioN5YRT
         eC5ruRZrff6RyJyqXw6xDxJ5dPWfvfv979at3OumiPSXY9FZhymBFG1WVuv/YwdeE6r3
         8cLt0VSoe0kehQvOSip+2x2tPEXrt3EmNNvLYgdyynsu5U/NmetwDov32OE97rK57Xzd
         /vxg==
X-Forwarded-Encrypted: i=1; AKwUvByrhrEzfjiIvrnbt3LwBXvVEpomwPS5+tY8MD7volNd+66d9ahRbPSCzsup90Y98z5SWv8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJdH1vrtkUrQwdlIpZ+u2K1WXfkxE7fjiSwXneKz8uZuObPFnmA
	tJHFEECvQvh+9hW0hEfhtft0L9OaMZSMpEin0aWkY1C8SHyhpSJ9EfHn
X-Gm-Gg: AYBFou0pTjt19MECLXmQk8Y2RPklE4tx4a4yzfsFn8vOxgsfSIwDVR9QzwLbb55paAB
	gYcNftmDFfxTvJ1datE2mnDR1HloZaoXfnbnJPCZ/R9Byrj19ybemqSRK+gzvtJkynS/nbzxdGd
	MH2ye9jL6Y1qV8Cjir4bmqzPFEuu+brF0ykWaU/bc8UZFpktFuwzErOUtwK4bHUokxMTgRzElZZ
	AoKNROKZ8Eet5lGiTv5MLhVV4ltNtU0uRNdk7foOSmzC8Y8xBMuYxQFZDH2H/Emxuoq10kIujIV
	iM3/qXns8LFDQeZYg1mS1PMbjhdS/1y1ihKiK9OwRJN5P7Iyygw0om7adRd+EhtpN4xu8juYclY
	aCUo14SaaVhomKAy5zYZnu0I2F4fmOUsRUE8nUYE0i9Qm5MZexNY5eB9U0E0U38I/Ja0uxL9aHO
	/FH9e4GV6JG/BqodWSq6gMa77lzeyFC1S3D87tyw5x/EhYbym3CJcViv2Vj8QdZcm+vQqB8PMo7
	Q7lyJZxH8TDVgewwcjkqzO2XuaCkIVArgeBRE+y
X-Received: by 2002:a17:903:2cd:b0:2e5:cf8c:633d with SMTP id d9443c01a7336-2e6004e72dfmr14267475ad.34.1791364898570;
        Wed, 07 Oct 2026 02:21:38 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:37 -0700 (PDT)
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
Subject: [PATCH v8 06/13] mfd: nct6694: Move module type macros to shared header
Date: Wed,  7 Oct 2026 17:20:55 +0800
Message-Id: <20261007092102.3768818-7-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

Each sub-device driver defines the module type used by its own
commands. The upcoming HIF transport also needs to recognise
NCT6694_RPT_MOD, as report accesses are served from a separate
register space rather than through the command mailbox.

Move all module types into the shared header so that the transports
and the sub-device drivers use a single set of definitions.

No functional change.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- Reworded the commit message to explain why the transport needs the
  module types.

Changes in v7:
- None.

Changes in v6:
- None.

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
index a38add1cde29..c8cdf4520466 100644
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
index 9a9a4db434c4..bd4c106305c7 100644
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
index 69e4652cf16c..d46ae34a497e 100644
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
 #define NCT6694_INT_IN_EP	0x01
-- 
2.34.1

