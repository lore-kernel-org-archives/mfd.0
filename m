Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989830;
	b=sA7XkoBzLI00CfWgB8Rh3jr5dCAmaDplv6wIa+9QJc/E2F/5scIzkMMazl8vZEKtDCnZ
	 QEz7BeqkB6xMyoeWmEQCwKS2DrsKxwR4tWX6q/HdquOCVQMQac6PUQh6kDE0AfcvQAZ/y
	 5nU58VUDQ3oJz/jU37fjT6R3nNw/HnAEjKv+5eumfIamKfLC7HAoK8ixpVRVQvL7QI1S4
	 K7LyVSAck+Yuh5tliFiFgsc7i7xEkigCshY0LeDUgedKcdik2nNuACUZ5v0R3pSSC34Ik
	 HZjgnasabeZ/HK88ldkrMbriw6e6f7w4rzwhPDHWq3pTJkUMZ8meM7+tPM/uxFig62Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XwiQSknzuG3mbRqQRgEl+28sKookmUItrsarjIqLkOU=;
	b=ewmX9raCOxFvHCdzmaQ9W1IXH4H9DeDYlo/ExzlSFck00+RpGuR9uAKbMOAH4WX3wGXL
	 0ZkPFaK2qYVTbs6DXQULtbhMSgahsp9p1A3DGvKtIgo0CKz+YvPGVxQTQNdDMxAZFVKf8
	 JIus3GKOzw8YsUH8vlwC5/YHmrC33FdHH2dh62a0PGOuCDat1ejaHqWC3cmLuDEUUBFpl
	 2H89tzNlpnRl7BApHWd0YFrviJ4TIe45F1bvEsICIf5nH0Ap0WH7GI1aBfBBElIXoA8cM
	 py0u/FZClb5bv6MyZOoBpg7Y/DYnj9Vu6fBIvJl692+gexzZvEvWoGP5X0GkVNZr14w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmXq8kG3;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A360A262E
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 752A360A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QmXq8kG3
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b2f59de176so612167b3a.2
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 00:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794989830; x=1795594630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwiQSknzuG3mbRqQRgEl+28sKookmUItrsarjIqLkOU=;
        b=QmXq8kG36CzzMCKycv/ZylI5kAMe1qhY9+5yMXUAXD/uNcnA1XIFWLpZ3IzW0ITP3A
         dkjfH8M9O6hE50j/SttJNhabCgfNyu7HKb6GJkQ7/GDxGAA2rVK8rmJ20lgBhhcGaDjZ
         ixhes4WJUHYAZi+eSfL3gcLZ0UoMbixCCnFyOgXEUAfiqkytKqixO5RhUtW0ddbqci65
         w3aHWhCxf5yEzBZrD9jdluLCUJXefBI9eUcZW8yCxhSEnUfCOPzzfcaIXEXZTjbWud2b
         pL4TqmxQEU+EZ5hV4bAHRsJfn07JccKvMMgS2bUPEsgkHmAlf5zmlWr+qkNhqt02pesT
         0zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989830; x=1795594630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XwiQSknzuG3mbRqQRgEl+28sKookmUItrsarjIqLkOU=;
        b=qddB6cPdiaADQPmTs33qrVC71BtP337jO/T9+BNHY0KEf2MWl+I0b6wlVRrCM2upeQ
         ARwaoNhcyCch2EyD+EXGEdYOjegSo1fq9ezpo6IeozqJNe0oxnpA8BY3tuEl5kXb72UZ
         nb14Qm1L2LMCGL4vCvgM42s9/Jr0gQD9jL+KIJWlWHh20lS5RwKdPuvUN3Cts3pD+9gC
         9U9OXAoOIm3H0L8OusdV02fp84Qc108C5b75Gc8OM6lKoRwtlRKZ3nv3dTvb3Wi5OK7u
         EC/IrAx2Ynb3aX09BM30IFSrdN6Jpkyqq/39MhbndopATgplwSndsUknJPbrCYcgMQ0U
         1UnQ==
X-Forwarded-Encrypted: i=1; AL+hErEBtfAE2YAM49cowWyDaHThFgdb/M6pIecVyt1qR1QiW6Nu2YHv+n8iOqorC9lBdHcgogg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/wbF4h/A7xtK9N2WFj5+Hp3UQEehrEVCnMH1cE9JA1Xfk0r2+l
	A4akRlJ3yamCiIUPlsaQ7ogZBiqZFhjIK1u+xfmAR/Ypck2mskvbWkmE
X-Gm-Gg: AYBFou2MyINm5pHK275NW07/UOFyx7c7UXmR/6P8SUp4b8NnmzLiQC9VGjx5oelNVRK
	LHEysyUHRma8VuqfqfTOASuu/+ElgxbrVuwvB72CuhpOn4NTIBTsIJOeYvFhW2L0Zr2GCs92FaR
	tyiZPOIS4CrAZ7NeRH5eJldoeSB3sCoMW5UjlR0LIs275utpsRyCNYe7xGhwJfV8Vom/RZHulXr
	A36SVhMuKdt3izIf7g2gvS5CXD5il5s+EPwyHlaE8wLtIv7LnsazrPBzwey8CiX13J2mqIKERrh
	wGchI4UQcl5Rr70+n5v8/skx/SvXV6nOtdSFrhQweWY6kWguV78obD0/k+7mUmeLnBxFTPUnRzG
	6WIgPCL6WwD5tgh8JugHyYdVycDRcmZTPF8+cpR18QvhacvgtwPrfOYQQid+UJPwDdH6fsxHfaX
	4vQYXq5Lm/LFIVPz6SWGirsmswcBrt5w0n644FzQwfgNyhtg12xXTwu85mgiC1y4myuhTMljeGH
	5p1ekDBB7EMfapeP9gVpA2hTdvQZGuFTLmNKc4WR6Ah+rRPx4b0JA9b6WxIQrGde2SBSVzVJjMW
	UYfNklK8QcyEdJer9UCHu8e71UREkvOfBKa96HELz1+sBYdLm4javaWbo3cW8fZ8pu0y8Bg=
X-Received: by 2002:a05:6a20:7f8e:b0:3e2:278c:297a with SMTP id adf61e73a8af0-3fe86fce08emr2380474637.6.1794989829834;
        Wed, 18 Nov 2026 00:17:09 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cad8cefbsm764401b3a.31.2026.11.18.00.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:17:09 -0800 (PST)
From: a0282524688@gmail.com
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v10 12/13] mfd: nct6694: Add a Kconfig symbol for the USB transport
Date: Wed, 18 Nov 2026 16:16:23 +0800
Message-Id: <20261118081625.2399247-13-a0282524688@gmail.com>
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

Now that the sub-device drivers only access the device through regmap,
the core no longer depends on USB.

Build the USB transport under a new MFD_NCT6694_USB symbol and keep
MFD_NCT6694 for the core. MFD_NCT6694_USB defaults to MFD_NCT6694 so
that existing configurations keep the USB transport enabled.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v10:
- None.

Changes in v9:
- None.

Changes in v8:
- New patch. Split out of v7 "Rename driver to nct6694-usb and update
  Kconfig"; MFD_NCT6694 remains the user visible core symbol and
  MFD_NCT6694_USB defaults to it to keep existing configurations
  working.

 drivers/mfd/Kconfig  | 20 ++++++++++++++++----
 drivers/mfd/Makefile |  2 +-
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3c59ef8768e2..8b969dc37312 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1183,18 +1183,30 @@ config MFD_NCT6694
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
index 20a5de726071..2efffab949c9 100644
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

