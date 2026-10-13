Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2A04BA1C0
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873253; cv=none; b=mRLxu7+LEpnM/W70COvTZHcY3QCFYxW/wCUYHsQuH87SeBuzJI3/3W+a8iLbqkdgtS84eCPzkIyKp9+xQOqk6U8n2ITKPkEEoRsS0YOyZOyvTe6C1SH9eOra/ojivGfOfnMJ8n0mHFU+a3jIoWOpk/FIXEKq7NtKdcqRdtkvc+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873253; c=relaxed/simple;
	bh=Qtd8muDZ583GPPiNwqXmbz1Hq3PEqQNJukN8yvtW0Ls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F+EIihdmmVZ0nA1njo7nuwAGvkUZNKbfvT9mpkWJcTvs1O8lPIdvs1b76glRBvE/budf3tabRpLihDrsPkPE6lIJmYKQPIymCjo7d/dO+tqhMhutaRxx0qclPj+HOKrlFZZYWcSf9VdZbLTKhcziFRCDR6Cw9/u/uHliFueZiU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2Im3vr4; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2Im3vr4"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1326754a12.3
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873249; x=1792478049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lgteruNmIFnnxJUKUfMJTxbBTmv9achvXjkbb9le4xw=;
        b=W2Im3vr4ODZ91rKEFsadX5gTKBsGJJ5teHPpdGrXRlsV1MmKhpoTU97EZm9sk+pNvg
         GdgWeT7LuuP8YJE9lUYNgLUGIGGd48rhSzxgJ8JXb1nKfLMwOkiSlI5KyRfF7QEvLCv0
         5itw1npz7JJW+nQp7ytDW58oNws72Y0+YunCnoggiyLl2NnOBOuv4+7yFtY6+V5q6Vjh
         0KRQaqPhUdUY8uBQAjf8EXgp9FA8w0AJimLdUk8CWFnRzrMZzrUel2h45etSy03eba4x
         zKQa9XSoFo55GPIbXrvMHn+Oaf7FKh5/HM5kzvg3Zyo+HUL99GtgJyzR6thZ3k/Qke2X
         ArqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873249; x=1792478049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lgteruNmIFnnxJUKUfMJTxbBTmv9achvXjkbb9le4xw=;
        b=iRRlAcnI7Cf2PuQuCtY2KaHSFpzkFt6ODYhGcLiXEY3s2ARqYOZ/R90yIP95p5wEh5
         colCglZNruYlqfaDCGjU/VYPft8YYLHzkTcve3sOOA3o+8p9lEyE3Tr0k0HRJCxXbeYZ
         LUiL7pe5XSetuiAAhwhXQZX4anztMF7PiN/nhFJX36Pg+6Q1gWfL5HFauRMF5c6TOLEl
         Fx/inYjf2eOvUnNE9kAXM++lHRjtWQxWr0APEqGl527ZgoZsdz5U/E+LUcRt+sFvrzLP
         GDtx1P1FQxlh2GDanii44Evr900QaZZMiIpxeCxB3kB1WabRg4v74Subft3gL5w+qdsv
         ZjYg==
X-Forwarded-Encrypted: i=1; AKwUvBwjZazy7tOQiOW72g0UDnrYWirkZjV0e85v+wxzZkDrnfd8Y/iFnfASEGnM1oKgbP5r60g=@lists.linux.dev
X-Gm-Message-State: AFq9FYLw2kb4Mp4VriZ4Er9rO43g8w6A6Lv9aEzg5XAVSTpjwNiMtGh/
	t0GUBrcwuqmoAWdg7HEm0UVBM0B64LHnfeJBo0d2vhDpIGK3LivdfZyD
X-Gm-Gg: AYBFou2zgUkCldjsAQ16VPl4gQmYuR7F6wRStKzl9FCfjLi5UQ5WhsaYozMOqd9gaBP
	TV7q23c/mBevFCOLCgtN5eODFRG52PWYuqyjFYUFGJv0A7XU+6bgVEl8F3Q9MWps0iiTjOHvGYN
	x76aeKLL52+a4MWzVe6EZELbp37pobmuKP1Pk41mTzN+0AhEoOljF8x4CmIYiHJ4ydVCy2UtfUP
	3n8OUQlCaLNNTHgTreuk4xUbAkRcAQTJvWjC5w3gvcjKpM+ovhKxPm9ut3p0IDL/j9TDdf5vxj8
	XHQBgaDGWxgDGEr2qw4KPMmNdVuCoiVC/LLzju4K1giDgfPR3kn+x9b+lFkO+ROnHjcHbVJkuD/
	0WPWrQbtXjydYM5IDIKX0SvVe180k9LmLBPyu3kQPF2sxzy3l29ZDdRmQamrhwd+keuBAFrlnE1
	7E9KOmoGitvg/dXCldvieL8NTQBqPwvWYuDF6SliPk70XY6LePziqq9e2Bp0LK+PU4Z7e9jqSVy
	nYIxH40+pSY+v97FgCiH/+s1AjwcMRqXK/ex24P
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr9259923a91.17.1791873249102;
        Mon, 12 Oct 2026 23:34:09 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23169595a91.11.2026.10.12.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:34:08 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>,
	mfd@lists.linux.dev
Subject: [PATCH v9 11/12] mfd: nct6694: Add a Kconfig symbol for the USB transport
Date: Tue, 13 Oct 2026 14:32:57 +0800
Message-Id: <20261013063259.2734757-12-a0282524688@gmail.com>
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

Now that the sub-device drivers only access the device through regmap,
the core no longer depends on USB.

Build the USB transport under a new MFD_NCT6694_USB symbol and keep
MFD_NCT6694 for the core. MFD_NCT6694_USB defaults to MFD_NCT6694 so
that existing configurations keep the USB transport enabled.

Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
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

