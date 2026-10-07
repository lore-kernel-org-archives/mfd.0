Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098545D936
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365007; cv=none; b=ehZWx+vvNFoKqff+y9g2vanQsIfL+2xoE2WDbx7+wK1YToz2fjYq3nxB12jyavYsKUlTs70FlphTTjYqTjDuGsTgD2J0JaYyWqnqXIv9uuFmowRawZMjBxQne/JSfNtPf8KXCnP7tJor85wWBLxU6C47Eims6Tr4GL1dK2CngJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365007; c=relaxed/simple;
	bh=d0YA/mOtU9gtdFlzULhJnmKciSi4FjAwPe07XrQJ3Ak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SC3vuO6y5d69IDK0meV07YWK6OmSenckn2L7sU/kMRPpNUkQTqMfk3o5G3sgdZonXGuYqEp4jx92aM+BNuKthmg5PULym6xRbSFR/NJfIQZGZTdmot07/JrtFNfrU5cWLIEUY2kyCDrvV3VGsbfLP+J5u6/wRpQBmx0kcE9Z6U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7kOgEJg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7kOgEJg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e6038cebefso4968355ad.0
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364914; x=1791969714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE0R4zsEX//GEmygpcVf0XYVSLwXzC42OSXnTiFb//w=;
        b=e7kOgEJgZqUtB4SYIjdDKl8O5Clzz+xD7PFQKr/QXtXPVWCiVZsQ6qx6wmEFKfATKL
         pqQ7kYRF7vz2fqFgq7J/F9q4ZS/K3iccW8vsiBH/E0R7pkeGft479tBXz8uL5kV+PKR4
         cme1mkTiLr4OswAAF+gDoynL62pYavTuT1e8vRXbWYweAXI090C0wpkBPkOSwn2SGrhL
         efD9JlF8kLExHkAUlW9niLGoXVF6jKyVgFEXRQwjdj4WRjPpbCuipE3zp1SvRI0hmofE
         VkBb8wynFxrhYW3I9xwaZSAIQF3CZlSdLu9MWMpvKuky8LQMypeP8RC3YgBqzKS9WwrW
         D9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364914; x=1791969714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE0R4zsEX//GEmygpcVf0XYVSLwXzC42OSXnTiFb//w=;
        b=yc6O8/TP7DbHIb8kIiV9lQnCL7Xf1lTPuME1IC+MRAklvi6d2wBubXd385fkXnpVhW
         a27f1UMnvCnPI43SZbrwss13+YzFOhlPhmnF2I+lwWl5b7bVbx7yP3v5MsJ66Vgoz6eP
         /Ujen2P0WyoeLKaH556IuNQKYBB8uL0XjVOvANGVQlEB3xlMG2IRvTgmUTDOgjRAmP9E
         rjgrHZe40QO5k9asxoQio+8U1hSh1AOHFroqXdSaT4nc04nNbKTHu17Ps8DalxuaF8QQ
         ksSOyjw0igdvPxGSXyN3KQw1XWcpJYYAH1bF22LVIVc5qNpYyXjOkOAhuLOE4FeMYSEc
         a09Q==
X-Forwarded-Encrypted: i=1; AKwUvBxStvCMPuVWO5mc4vq2FTajViAD8uBTcmBzlDWflG6M8nMieR69ojC9B0/k4YTLV4ms/64=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2JQQzPUuyRyyIS4e/ydhVpEIk9aH4gidd7hxmpraHJxH30X6t
	98A3NNnUB6XkiS53fZzhEvdIy1QSn54TtcjncPpTsXYFEOgh6nZ4fvYWIGV9hw==
X-Gm-Gg: AYBFou255QrDr+/HI7LkjH7GIoi2FWMXEyq1E/dyi9iUyk8Tn4w76160nHvbv1EduRl
	4boOvi5fmEHpEY82jSE9s1bVG9l0OzlwVkDfYbYlxwzHM9mGdh6/JnDlDgkmIp9LJFr3FyFSEIE
	oUcAqjfWfRy43AckjfGYYIqwrxupOhVluluQx4Ib9gPK2uVtadFt5Y96yNoxCRCEPdmhAp5Tu2v
	66wJjLOp4pDQIQ+kF0ZsCBoQouoodNsQ21gprEOxA7R53Jr4O+K3VXWQ+5s/hrOW1hTqezG/XSI
	kX65SVze8iG4iQ5kVQ+aiS+gosbWftYp/Dg2lqLZmS/Pd5soSN5Jamv2AryZa8yXjIjUBdXRr6G
	yP0YHuRZoVjBJavJ06CTckhS2Mm06psacCbfSWDLNF2tGaAL1Qb4gFaV0L0/LvjqdlzkgHDZO3D
	8v2ZMdqzUsqqLtYofqpPAgjUiuDS9Gb1zEjHWXzQBmH41Gaqj56/i8x2LrxgR3i+qZr7kUN32gN
	ioUdzfgO+hMMFlcGkaVz2LaQLyPg7sjCxGNKisv
X-Received: by 2002:a17:902:cece:b0:2dd:c053:9c6c with SMTP id d9443c01a7336-2e6004e89d2mr14736725ad.34.1791364914009;
        Wed, 07 Oct 2026 02:21:54 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:53 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v8 12/13] mfd: nct6694: Add a Kconfig symbol for the USB transport
Date: Wed,  7 Oct 2026 17:21:01 +0800
Message-Id: <20261007092102.3768818-13-a0282524688@gmail.com>
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

Now that the sub-device drivers only access the device through regmap,
the core no longer depends on USB.

Build the USB transport under a new MFD_NCT6694_USB symbol and keep
MFD_NCT6694 for the core. MFD_NCT6694_USB defaults to MFD_NCT6694 so
that existing configurations keep the USB transport enabled.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- New patch. Split out of v7 "Rename driver to nct6694-usb and update
  Kconfig"; MFD_NCT6694 remains the user visible core symbol and
  MFD_NCT6694_USB defaults to it to keep existing configurations
  working.

 drivers/mfd/Kconfig  | 20 ++++++++++++++++----
 drivers/mfd/Makefile |  2 +-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a0d9d6ccfb0c..de7d2171f514 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1167,18 +1167,30 @@ config MFD_NCT6694
 	tristate "Nuvoton NCT6694 support"
 	select MFD_CORE
 	select REGMAP
-	depends on USB
 	help
-	  This enables support for the Nuvoton USB device NCT6694, which shares
+	  This enables support for the Nuvoton NCT6694, which shares
 	  peripherals.
 	  The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
 	  6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
 	  PWM, and RTC.
-	  This driver provides core APIs to access the NCT6694 hardware
-	  monitoring and control features.
+	  This driver provides the core support shared by the transport
+	  interface drivers, at least one of which must be enabled.
 	  Additional drivers must be enabled to utilize the specific
 	  functionalities of the device.
 
+config MFD_NCT6694_USB
+	tristate "Nuvoton NCT6694 USB interface support"
+	depends on MFD_NCT6694 && USB
+	default MFD_NCT6694
+	help
+	  This enables support for the Nuvoton NCT6694 connected through
+	  its USB interface. The driver uses USB bulk transfers to send
+	  commands to the device firmware and an interrupt transfer to
+	  receive its interrupt status.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called nct6694-usb.
+
 config MFD_OCELOT
 	tristate "Microsemi Ocelot External Control Support"
 	depends on SPI_MASTER
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dfd81356b485..a42b99250454 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -125,7 +125,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
 obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
 
 obj-$(CONFIG_MFD_NCT6694)	+= nct6694-core.o
-obj-$(CONFIG_MFD_NCT6694)	+= nct6694-usb.o
+obj-$(CONFIG_MFD_NCT6694_USB)	+= nct6694-usb.o
 
 obj-$(CONFIG_MFD_CORE)		+= mfd-core.o
 
-- 
2.34.1

