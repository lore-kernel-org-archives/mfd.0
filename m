Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B618B379C3C
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 03:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283337; cv=none; b=KQkGcku15Pb7Xpy2zWeAYGmcaI8vbqXJ2KypikGi2jpK2FeC8jTa42khtpv9Y7aZIDaOIAbo840byMNSRghTKLhtLyTFWqOs4W+GPIRnycUeyiD6OjhFZALyXmz/ruPpW7eRq5Yj3Tbu4piJMcdo7H1SS6RPjCxMv3EwIkW7T1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283337; c=relaxed/simple;
	bh=nUnyQrDd5jdSYXKPWzUznh6SFwnlW5VeFcWQi8BwH8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pp+/AlYYUIJfScnkzMm9NEO6sNGaN2dEqulILZtOyVRuEkhJOGz7uggZiaC8+ZvVLdrBFIeQHVzteIezFwYTkPm0k1cpAs680unH3YPbGJKZv/Hizm5hB9SAyqgEr2MK9IFJ20mmd5ozyg4f2pAYOmUz3TyPfEgLnmndqofL+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYQpFP4h; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYQpFP4h"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedf6a6fe8so436617a12.3
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 20:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787283334; x=1787888134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8z8jtMwqCWMdyAG7GnrJyVQOSLL3vRy/5P+Lo2373Zg=;
        b=TYQpFP4hgD/hz3k/D/7x7EJOR46xPjAQGR5Cjk95M2iTZ4fQ6wbPQEkRCSmncYLek3
         TzzIFvJ0rtyV90YAa+rRuyC6KUlYFuk9Cwc6tVnzbeyDXG97HGn2ADp8dMWwQ2KrPrHW
         XAxOcjlpb4NaFx3CHCCzhy/fGf4xmtnY8TN8eoZBfROckGmVsLN4Dz/p5BKYo8ijYLkU
         bI8G/awrxokduzlskzTwmzE0zrb+7J22E4NurlSsMoTq+3RV/oWRkx+AzfkEetkSIKvv
         fqJAYfcm1A+gBNOcLTpqgL+/Dl2Ep8UD7Ac/90a71QHjgZe0N29VQkLTBdzWDI7MVQD0
         QSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283334; x=1787888134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8z8jtMwqCWMdyAG7GnrJyVQOSLL3vRy/5P+Lo2373Zg=;
        b=LpKU+gaiMDsvchdnC45M06VI9oq2xNprn3q8uQV8Fylr5N5/5CPp0uI87TTSqa+3FI
         ukdQdLtP8up9LJTDHbjhORBAP/nu623ykb3n4L7RYAEUrw45LTw1uRZSIEa/f8a5u3TL
         66hpWYSOSyuLaQU+a0hFxmi8oDm1e5hhClPadsuggNfYV8svuC4BPsvMlqFBdxsm5ak1
         drd9F+ySea42X9mqRjGNbQcw3W7OZZvRQirqMT+9CRTJQ/tk2lnaTOZO7gLtQZ2sYpIQ
         qLIcrAlmCwZxhCSX/pUldxSR1gVUdN3m84YfFPuYWzL+hx6zvmEyo0EpOoU5zFqurGu6
         Jc7A==
X-Forwarded-Encrypted: i=1; AHgh+RoGTM7nPvm9p7FZODBJJXhzNkgG1nPvczNWwIZ3nlb7gJHM0rHxUJMIRdfPValqbJ8Km6U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvDYN9wK0hbY26QJJoidD0vn/RZy5HYGATyWa04CeDFIxmmBNr
	lajOHlUtGj+Au5aq3keXxrONOppvOKiKKfKl63/H76vEQ5qwF7SpvvnM
X-Gm-Gg: AR+sD10HSIPbSNRtMG5R5kztFeeeExvFYWs61ns4EvGC6LyzkFuJ0B1wXB5U4iThBjX
	vZ+EBy49UMRiEfPQjfvd4kV58KIL0h4VYurimIRSonWHzEx7q7h8M9Ui7jy27CJvejjVdRpyZLR
	0dVF3bTOjlQJ184Y1IrxxOzvk7dx4yWHGGoupV4+ryE2lebxDxh5tQwjuIqA5CjkqEXDWAjDUIr
	7odhuBXKtXs2m+C0Pcjbeb9gzdAtfJDq1vxyJA/sK/nbauxWwkTkXM7L5VrudqXz5o9FQaZcoO4
	+eTyYvLzVyDYorIdKO3/yN6j8lw0tk6c7626CdBhlgIlFaLCQsS5an/INO7R8FXVXS/NAzUo2nL
	lZoRUbb0bJznNdWAAcUx0WqHYZo+TQDh8yx+DkrX0fdT7CcdbLScc8WD5ap1qc62MCfmeTd0j8V
	ztj6SzzzBUifPmZpRNAWY9OwJVfEEmZbATAKJHDnicj2Qx9x1/1epVdhB1AiMLemkkd/ty1hcUN
	5VRBcUxQB+z90VVFaaHwsmC+HAD4Wo=
X-Received: by 2002:a05:6a20:9145:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3cd3076a57amr4722368637.9.1787283333906;
        Thu, 20 Aug 2026 20:35:33 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15891a04csm2204271a12.15.2026.08.20.20.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:35:33 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v7 04/10] mfd: nct6694: Rename driver to nct6694-usb and update Kconfig
Date: Fri, 21 Aug 2026 11:34:59 +0800
Message-Id: <20260821033505.4017901-5-a0282524688@gmail.com>
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

Rename nct6694.c to nct6694-usb.c to accurately reflect that it
implements the USB transport backend.

Additionally, introduce a new MFD_NCT6694_USB Kconfig option and convert
the existing MFD_NCT6694 into a hidden core symbol. The core symbol is
now automatically selected by the transport drivers.

This Kconfig and naming restructure aligns with standard MFD transport
abstraction practices, paving the way for future interfaces (e.g., HIF)
to be seamlessly integrated.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v7:

Changes in v6:

Changes in v5:
- Split from the monolithic v4 patch to follow the single logical change
  principle.

 MAINTAINERS                              |  2 +-
 drivers/mfd/Kconfig                      | 31 ++++++++++++++++--------
 drivers/mfd/Makefile                     |  2 +-
 drivers/mfd/{nct6694.c => nct6694-usb.c} |  0
 4 files changed, 23 insertions(+), 12 deletions(-)
 rename drivers/mfd/{nct6694.c => nct6694-usb.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 040df7bfb24f..89d7339f3613 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19356,7 +19356,7 @@ S:	Supported
 F:	drivers/gpio/gpio-nct6694.c
 F:	drivers/hwmon/nct6694-hwmon.c
 F:	drivers/i2c/busses/i2c-nct6694.c
-F:	drivers/mfd/nct6694.c
+F:	drivers/mfd/nct6694-usb.c
 F:	drivers/net/can/usb/nct6694_canfd.c
 F:	drivers/rtc/rtc-nct6694.c
 F:	drivers/watchdog/nct6694_wdt.c
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 763ce6a34782..5506a0adf3ec 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1164,19 +1164,30 @@ config MFD_MENF21BMC
 	  will be called menf21bmc.
 
 config MFD_NCT6694
-	tristate "Nuvoton NCT6694 support"
+	tristate
 	select MFD_CORE
+	help
+	  Core MFD support for the Nuvoton NCT6694 peripheral expander.
+	  This provides the common APIs and shared structures used by all
+	  interfaces (USB, HIF) to access the NCT6694 hardware features
+	  such as GPIO, I2C, CAN-FD, Watchdog, ADC, PWM, and RTC.
+
+	  It is selected automatically by the transport interface drivers.
+
+config MFD_NCT6694_USB
+	tristate "Nuvoton NCT6694 USB interface support"
+	select MFD_NCT6694
 	depends on USB
 	help
-	  This enables support for the Nuvoton USB device NCT6694, which shares
-	  peripherals.
-	  The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
-	  6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
-	  PWM, and RTC.
-	  This driver provides core APIs to access the NCT6694 hardware
-	  monitoring and control features.
-	  Additional drivers must be enabled to utilize the specific
-	  functionalities of the device.
+	  This enables support for the Nuvoton NCT6694 peripheral expander
+	  connected via the USB interface.
+
+	  The transport driver uses USB bulk and interrupt transfers to
+	  communicate with the NCT6694 firmware. Enable this option if you
+	  are using the NCT6694 via a USB connection.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called nct6694-usb.
 
 config MFD_OCELOT
 	tristate "Microsemi Ocelot External Control Support"
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..48caac64f3d8 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -124,7 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
-obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
+obj-$(CONFIG_MFD_NCT6694_USB)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 
diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694-usb.c
similarity index 100%
rename from drivers/mfd/nct6694.c
rename to drivers/mfd/nct6694-usb.c
-- 
2.34.1

