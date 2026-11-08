Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130589;
	b=icnhg3LZCeWQ4NLvAmn7QVvD69imrj6/QtIS4RinG/y7wBZudU1flo9UydatGiqSO6Ao
	 C5bn3U20pBmIsBoiZTH5bVmhLk2/Mo/Uf6nzUom9o77IV0WvmGzyb/TQVkDiOFxH9v04j
	 GxSh+wNTKiXYllLaurVJMp4bc1eDPJkRQd1CSjDBHfVTAHCS+Jr2xDX9389pzQuLPi/q6
	 0qfuxtibwT1IMk69p/f5xXs1oUoXVgHd7RRp38mIVMQ1LSGvFQIG8wVtJipOHYXsWejJt
	 JfA/5dEumuR1tOmypvAAQ5fVG32YaL09oOnnpLzDWzSjztyUndzpV4JYuGuXNFDsqng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
	b=yI6W5FwCVMdbEqIfKo6i/GzZC3rUGb5Fe++RQmeacov+/h7ERj3SgY8U3tt4Ikf9rc+j
	 45v0ZyKBhX6cJU63ksAWDty8gc93Qf/96OHTdOTi0HoUNTzN+F6riYMJegUtET3QVktfs
	 eMUS0nQlcG9+QCb7BV9Xrk/3qprW/ZFHlbokq+/VbsSIU0yhjYPfzfeZ1kYe+HAKBECm9
	 xNbEeHxp9KQ1ArM4CJA4iibmWapUGqO2ezRTii1Dz6zRJAEL57QeRl6EDbtfaHegAI4bB
	 rT2/BkmByhyVJYcYaTCR4VzHaMekcempScV/qkZSRcWJrWPv/PaAl4y23ht0A69CeGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7sEaTI6;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB504606A321
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB504606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7sEaTI6
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso2400525e9.1
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130587; x=1794735387; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=r7sEaTI6nj1WpZw37FyHT2fHiR4Rem2J8RiR3rU8JYx16JNSPgUKuOTvnxMJhAK18E
         8qQYwewcp81rSFD+iMGO7EB0rfXJlqPO/wXQiVeOzOu1O5hqs97EAbn1iZPCLBtFwXip
         mQ/g7EWb6ti8J7cORn0GsbU+Mv6QOqGBo4R/nEaWt8kaf1YnKIZxUjKL88AXiWfRCRpO
         Nz1BOPsR05Va+L/GEtHOTLlucdeiS9KeNCh+RasKydl2bZt0HgUPMd0yyWOBvTqG2WR1
         sQ2utiB3cMQGf5gvkE8qYatCG189uhA6RBvMjypb3HfGN2eL0tu+YUUztVTMFZ2GU6qs
         4jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130587; x=1794735387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gFuR1bxc5xsOK5qncGI4pXWKli3a5dtxlSmm79GBRM=;
        b=s96/j71HPWdRkWakDQxSRi1sla5IwHSavSXwxgxWoqWV/IglpCCc2JA8bgckFdOdZb
         cJPhaKIfS/l37nfVxHgv7mEccU0+Y9Zbh1A81jxYrJsXs3V+GSOtU6ZvSJmofRfMfdbn
         56rSakDsSkgrJIEAI2LDZ6OMUFxyzzobpc3UGlXfAZUwvrC77L08xYXXm4JvcuM9ThCq
         bq4wG+AHhNBmX9Q+TxGYxjoFMLZ3AATIp+svi24FzRKMezMg0rXJUpuxHb3d8yjd6FeP
         aSk4983Z3tUh4iJ44pxngouwb8EEsSC3t5W+gzrpxDylNRpFjQGWrhTqdqM8ahvtfaRN
         WwcQ==
X-Forwarded-Encrypted: i=1; AL+hErFxEIvIgI1z8h3xtWG0SvlVpB2/qtFTO4aD1hbLiF1m0gQu6TIfqA/xRJonSw0lVZdYh8c=@lists.linux.dev
X-Gm-Message-State: APuU4Z9w6W6UhKh/sdmNyUVtJsTXt3QPwQqVVeoOQryPSIzQzTmnAuWd
	aqqdLjDlTw1WS28gxdelNQNhf41oyIKAhS0wmV2EG5Eegh6jIuJAiB8o
X-Gm-Gg: AYBFou3E35TrV8+/xoFKO99RcdwT+AAys1KW0H/vtI4NiwF/dnBmMj7T546dDI+WDuC
	jsKXUMlLXtvdbUwvv/7KobLSv8p9P1BzgH6vEpshUTuVvO7F4kgZ8lByCnwJ98fsfUDg301AtkD
	gf1RCQEZjYyP/8VI0i57kezTL9WUCj25XJX3n1ldRq97PHMwuhxA2HKTChHpHWt7zUwiQhFB13V
	dyqyVMy/DQ/c0M32ag0D4DWbvDXuAxG+rhXOP9K79jVpyuYdSv3vLVS9x1tCG7F0J5NHajlNpYn
	vxCbOM1W68pYtnxIIeyCLpKugsoNiGPCZ5xbUMpOD7ry8Loxo/X1JFBPYm2J3A7ylAsOo+zo3an
	owMYaVfLfaIkEo7mi6aU8x5kn9T6mRK9itopeWulhcH4Rgb/96/SsMlZo+QdW5DZqLT3F6hYW/k
	L2CQrwDTBZ6zgJfV5hYOP1Lz/r+68oBGug47baTPCYTil1EMykgQTLOCcccAUF9Xuz73fEskxsG
	IqDsUWc8Xqgkc4IT5uImOJw1k7UlnMpDe3360wzCf5WnCayOxo/9UWh3Z3rISMVxLFPeBzkJqnH
	bdDnzMK50qmRgmrlRiIJHP7B5MjsK9vRAGzN1EsdIWGPV0h4VdrHm+HJjut0nuM=
X-Received: by 2002:a05:600c:1c0c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4b963c69d23mr19923505e9.19.1794130587155;
        Sun, 08 Nov 2026 01:36:27 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:26 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] sy7636a: power the panel only during updates
Date: Sun,  8 Nov 2026 09:35:57 +0000
Message-ID: <20261108093602.329554-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
can not power the panel only during updates.

Read the temperature only while the rails are on instead, and bind the
regulator to the I2C device directly, with the hwmon driver as its
auxiliary driver.

v2 patches 1-3 are in regulator for-7.5, so this is based on it.
Patch 3 touches the regulator, hwmon and MFD drivers and removes the
MFD header, so the series should go through the regulator tree, with
acks from Guenter and Lee.

Tested on a PocketBook Verse (B288).

v3:
- drop the applied patches 1-3
- new patch 1: no wait when power good is already high (Mark)
- move the I2C binding before the hwmon read change, so the hwmon driver
  only probes once vin is on (Andreas)
- patch 4: explain in a comment why power good gates the read, and its
  limitation (Guenter, Andreas)

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- no VCOM enable at probe, which also removes the probe race
- read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (5):

  regulator: sy7636a: don't wait for power good if already on
  hwmon: sy7636a: fix negative temperatures
  regulator: sy7636a: bind to the I2C device directly
  hwmon: sy7636a: read the temperature only while the rails are on
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |  1 -
 drivers/hwmon/Kconfig                 |  2 +-
 drivers/hwmon/sy7636a-hwmon.c         | 66 ++++++++++++--------
 drivers/mfd/Kconfig                   | 10 ---
 drivers/mfd/simple-mfd-i2c.c          | 11 ----
 drivers/regulator/Kconfig             |  4 +-
 drivers/regulator/sy7636a-regulator.c | 90 ++++++++++++++++-----------
 include/linux/mfd/sy7636a.h           | 34 ----------
 8 files changed, 99 insertions(+), 119 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 2a1984b30e9cfcb306a076cb4b9e68d71daeb45c
-- 
2.52.0

