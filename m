Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989815;
	b=Em5QM8km4dcWOyeLrBB0FLZBGDLxN8+c7N0Ud6p8JLyftCGBoLQUP/H6KaU/9nWrPvNI
	 b3TeH22W4GiVJxp28biO25giCh83a0Jt006KHaukE8Lb73FlWOoQGQdaWNm2X38TlnrGB
	 rS4wPOb1kQRub+vR2P+TDYBQVhKc5mbfpahHx5jv6Ns1A8TSYnW1eqaMBYZP0ttSRtT72
	 RTOPfOh174sL2MYgGakofM/QiED4VG2puFB9BG5XNvxhq19//RDywLJaNSLWfRdpUoDLx
	 OesMTs903FBLWgxDWsYTQRBQk7PhMMM+EMGhf9jC0mROtA39dBBoBItMwveusTEXTMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DruTwIEuL419lERQzYgeQDALQqSuvj3CoTd7MhEXhE0=;
	b=w3m+GOuDdzdM8yt6JEfAhVnUfoijmPjrycXSZY7I64Q+A3RKjIdKUMbEnc7BWDc85y2G
	 xVEe7p82OTqPU9RsylfY96et/r8MBVtO4Dj1ci1miJ3EVJDGAFOtQZ+omLy7wwKNxAyZL
	 M14Jykd/KJjv907nOQAbxeGEmocs7Pqa7ueTXPpFL9ei4KXK+i6bhbQgKESbLoAeDvHzY
	 A/RNssuxFKa83xcTiG25Ds2yOXQjU2hiL2wTCu6E7UV4nD9kNbys5XkXFBZlptCFGgc/k
	 IteFOwde9lT1RI0khiPqG8e97fDShzra7FWjU74auiDSA4mmz5OJAqf32woHYODcBVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=onB5cNoE;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7F960A380A
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B7F960A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=onB5cNoE
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a058315c79so349978b3a.3
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989814; x=1795594614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DruTwIEuL419lERQzYgeQDALQqSuvj3CoTd7MhEXhE0=;
        b=onB5cNoE6hXiev4uzwOS1lyycDpUfZxDm6B/4MuuoMNH8sz/cDZ68Mmw95dMhNk3Pn
         RbAJ8jrXoHnkvjWWEWIXq+x2ASx0LCfpfDQiwVmkcalicXvqdlpYy5giIzSDdcuY2HSq
         LIf6AkavP7BecL97dGnDQJL1m5bpAy84+mskCUQZFCz5kQ4+kqSDXJUhCZXOP5NRfRGo
         mJ4htALmG8xDiIcYTpd8zEkU4GObMRc2OFrsp4nvmdSUez1692+e3nVwiVVtpKh5QqxZ
         ZUYK8+xlj21+pWGLycIWQCQrQNmgZq430ZEjJ3KWRjY9nAh7u5TI6RBwzkABgmCzEHEQ
         k3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989814; x=1795594614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DruTwIEuL419lERQzYgeQDALQqSuvj3CoTd7MhEXhE0=;
        b=dIaUxPM4zUfngqFMv6Q3Gj3FceY0i6jbt0Svtt80DIpEtWq6hReBL32jfnvC55w4M6
         Y7H0ZFknS9go8Hkus/8Q0j5O8BzgIIGsZhdpd0FXqQVfUqExyhAURvHrR4nAJwkqnwX+
         vrrabRxnycVIUzhgALp/0KB5VIBlAmWMPvfLmjYlqZ4ixBqoJL78BZMjl8S3IUIcQCW3
         xUKiLLkesLDLq3FbpjHp6XOz408oLIRlMVjP8h8kNWDUGhRhvMC0ksMb+kqUk0EdsdXU
         a22GMeQ1zUY4F+vpwHxSabZ+9d61LXQ/XVM5qBLZU0e56dnzpx5fGApxsw5Xv+lyXhfu
         QP9g==
X-Forwarded-Encrypted: i=1; AL+hErFCB+20MC0KAFZIC95KO7R8lq0GnQEKW7U/mpCpb85NRJDCUFbVrYuNj6FxnPAdJOT2ZhM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8qx6qLF+I61OH4Df1WQdWfJ4lYoBd73zHA4F652Kz1/XUzRcBk
	45z2tPU8V0DoGaM0Z5x6TqL/imTywW/CFhNWW97myf924zau9O+2rtmJ
X-Gm-Gg: AYBFou0wSnpYmEEkhlKtGDqB6lx8UZPR/azpqdqPG+JWPX83bstY/XHjyhsmhiAuiQA
	qb0E84MFbeYcdsUhbDy952bHGD29CfiL0a1PS3k35vQCwhkHiyGB5rzcHlGgunbPfRR/MOf9CST
	pVQSiMamooRoR13ivsbhdJleO+j8VtcSBCBrq+zWJ4DHk2trlGwPMH/UfzQMJLrPOQwL8/isfah
	0yn+3UmMEI0jKdHwAd6uF3695fU++XVKDEr97XEMyeOf+iYB0b8I+Rbe3FxR/OgYttgiuyU9HMX
	08Lwj2Rce9ny2QC5yPeL17MvYgJaCE0iutga6fZ9gZNfcE4+/+py4cFp47EdhdGCQbG5cUC+Mty
	pjuY0lo+14I5o9gdG35HTvLjiz7qef4a39wxQOsBtCJ5VuW3RNXz3OrpUv0fyrVVtJ2MynDiyNc
	YDgOsiGlinN5ryo3QIWv4iIjRcQL5TQqENlmyWtOMaweW8HfMG03JJN/vS92ecyxzD9e7umTyRZ
	3BzIOmueRT1LqI63WBPFwssWGP4A96hUvJltKgaWNo2uimgCsW7rn8T7kryeaN5dqfORrCkB7Zq
	WebH7QJpk0ilr4VIasZfjuyLEOgrtgVqh+GGjZ2YOKt46Dagp1c9fLqEuxLboY333KK8eWs=
X-Received: by 2002:a05:6a21:828c:b0:3f9:b55e:10bb with SMTP id adf61e73a8af0-3fe98af080bmr1592901637.87.1794989813764;
        Wed, 18 Nov 2026 00:16:53 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:16:53 -0800 (PST)
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
Subject: [PATCH v10 06/13] mfd: nct6694: Move module type macros to shared header
Date: Wed, 18 Nov 2026 16:16:17 +0800
Message-Id: <20261118081625.2399247-7-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118081625.2399247-1-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
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
Changes in v10:
- None.

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
index 9d51bf52e99a..b3eba9f344ef 100644
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
index 32f96867635f..fde32010a66c 100644
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
index 158a533dfba7..d3e2316ff53c 100644
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
index 501c364277d8..86a03f02515c 100644
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
index 57bcc1299973..94c630a9ced6 100644
--- a/drivers/watchdog/nct6694_wdt.c
+++ b/drivers/watchdog/nct6694_wdt.c
@@ -21,13 +21,6 @@
 
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
index 2022b8fcc096..d752708c2a8d 100644
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

