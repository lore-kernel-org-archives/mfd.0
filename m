Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CCA4B487A
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873236; cv=none; b=UHtSKo05lM9l2B++/MUVKJhRTuK9P2na7pfpZidcaIQbAgS7pKb31d2RYosFSc1Wvxm23WisOmEHKxIV4xB3ATkNCK7Lo9tj1psZQelliiaTu8TW2Q/uM1/vWC1naW0aHUZjKJSYfOrF8z6Ghdh+NG9TQtYRBe9OaKn7Of9iS0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873236; c=relaxed/simple;
	bh=PKDt9a17x5JwDBBG2cr351fvRdaGcmqb74KmAxG/+jI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DOgvOb7IOzhmaogLQZvjnfA+312A80t73v4mDwWcSZrewoli+mPXvVDL2xHzZKwUhHK5sdTZJSaqdcYlzE+kNVYDHFOO58tVItDoW+b7dk09b+I43Ky9Gt0tTS2xK+hbZsRCMNhxqxwUV+0HKVkqXiqiB8UprOs6+uhn7oJxCgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltZMTNIw; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltZMTNIw"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1513399a91.2
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873234; x=1792478034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTNsy5m2fl3FNNHCS2M1Dkdj9lpqET4GIobo7b5ehNE=;
        b=ltZMTNIw6hIGGKvLgVQzImw2qdZf9kCi4+LiooXY9UonfUOmwz3/tggOLyVB3s6bNo
         +0Ke1zhC8k70xBq7xr62AEfW+8DvPNeuWTLUEZKGl/DDuY/Jf7wimxAATyotUSZivbKs
         Q8i+CKpklQdfVs23hvbFjRgA/1uXykRdB9qu4qzmaWoiM0/ot9sGeZARUOQ4W5yLcdqz
         oM+qzQdZEKU8TX2gfnf66bEo8Sb8/6eFghWoX9JNG3P9EsUtVGb/t/tIjR1rBPKY4FNx
         GAqp2d6ECYUlQI0JxiZViz7yQd3PS8QKmTNVUdogUa2T6dnAGR8Dbw47gS04k35qOS9M
         NgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873234; x=1792478034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oTNsy5m2fl3FNNHCS2M1Dkdj9lpqET4GIobo7b5ehNE=;
        b=e7aIsTK6Em6K7jqKZkg7GX3GscEgHfYS5Ti3tyorAaeyZX8HNoRUP/6bE2mBD+9Ki3
         lc0NxXvcvMHJ3HM9iAGpQ5S5PbdZCDV2GiLMwJFSue794pjqgemymZq868IBLJ+cQD1W
         We5fTNtxAAbL1BZgXFk/V59Jot0AQ/B5hBibVDb7xMZ2ErMkcv1ifOg65HVYDnZHvUtS
         Cj9Mb9wsUHOwUUU5WH58mVkxNIvY7ycKm47JiN93ggf/6aJ175l6OlTzg1O+n7iT1ZBe
         A0hMozEW2H3s1jfLHe5h07jPtWqMl1tD7Yiw1Paz2XcnxbNjND2WuTK8ocFT6CCJTRQ1
         q0TQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0U35AQrve+u+H6rymOfm3NuY17avZMlmQiJm/MdLrAFLMGZMZvhVNOt71gwYZFPDcAOc=@lists.linux.dev
X-Gm-Message-State: AFq9FYKK9hNrSZ5mHLyehOXnGrnh0YE8PHKopzZcfbCq1HDtT3Jlxwf4
	PqS852hyo/+TVdWSKM6kGZ3IarEMT4ZvQRSq7683/cpichTaeDW2PLFi
X-Gm-Gg: AYBFou3fymnk5mVx0VYxorCqrR06eN391BGxv5EmEVy+2Tqv3ElcHzIR6KypwAMJKfx
	ampFreVk8TOAOiJStMOM8AeAEufwTcFv0k4BKM5Z9Ir1NWwsu8QnxsnVwMlz/QZor3xDZ/MDxXf
	Nk/lg0hKZSEW+UUOuKhfDGekZXXCF9KAwPEwhSR5ASIZBdWSlT+tR2bad5+K35WrNcV5aCATMbo
	S8ZUEeHicyyrLHGBzSMCAG00t3Kdh8kATW7tunI10dh+0K+PqeiHVagbpXUpT6okYAXxDehmFcj
	YcLYTtUqkmf5g1loWHqrNpJZl/8sV5ulqYgj1Vp791Ryht9UmCJ+Vj8lqypOyB4BiBhOr3Tsr2e
	cRxkS/V2j9nA/NTY/gRbBTgZR0nDmn34qYwAfjaAyVdLELTgExsP1i3gvrKLIs1ih6IRNSaFjgb
	rAaBXzi82Nep1XILuKHA7brDRIBF9ZIxMjWnNp/Fai/XoI7guD9wAquJz1Vq3snBGKjlPZ5cWQy
	tXbiKXiVsa9g5OMNrXGgqJ0xesVFnTniH/fuPBorwsBbjmYhrc=
X-Received: by 2002:a17:90b:1dc1:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3ab3ac9f622mr8108214a91.27.1791873233720;
        Mon, 12 Oct 2026 23:33:53 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:33:53 -0700 (PDT)
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
Subject: [PATCH v9 05/12] mfd: nct6694: Move module type macros to shared header
Date: Tue, 13 Oct 2026 14:32:51 +0800
Message-Id: <20261013063259.2734757-6-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013063259.2734757-1-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
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

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v9:
- Added Andi's Reviewed-by.

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

