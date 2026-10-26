Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975273;
	b=pbi8nXVsyAwEWR2++zq46ukm6pGlfntRUvscxApsfsPDgBvf/vrHnWcWT5p3cmjEBdfj
	 DtrgoyHCptjMWbxnfoeBsHDvLslnVUmEeFE5wo79RtjPEYyMWDr6aAwmElWZSV/eWFnKG
	 HZBg0eysHeXIzK9/5F6B5YHsbaFOl/uWjIweQQ1gnbMTiTHX6tH/Pk1HofCR7gbaFnzb0
	 +KsxZaW8NYKqF3fS6s78uRKGUUwF7nM9856+s1BehPjoV5JQzD6SGTlgnY25H4d+lyC2p
	 Dl665kg2tR6mwn9hvTHm28GYhXHYo8LF//czt+Iw2XfhkV2RU77S8L7V+YKUoicL38A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
	b=TkpJ4GBmlUJt1kmxmLQBUGTXlon8uoEYlYQ5nChgaGfAGUcLO+fo2O/CJTpxV+3+Lctg
	 vxil5wPqMnEx8Rf8eSITOja82UYZiUTksf/n4zMuLlUkf3GP+7Le59Aul2c5WZjBQCG5X
	 2uf3ja1cCqqCrpD219AF8q6vU+CDMHbEQXyIGbMBWxcbbvuNi88CNKVDBat1m/Mg2SCtH
	 PINqOVjwh/oJ8zMai0TZfzOcT/qnDzmErBIeUrrLUbjGvxV5z2CJyTYa0PLS11P9XREMd
	 /vpXSIhSWsDc6Vhfp7ChdhXrJkrNZHO0mSHrvUJ3P7ePc38fbgr5EYFNGAN3aQ8Infw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=egzVC3pM;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D8A606A31E
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 00:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D8A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=egzVC3pM
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so7445745e9.2
        for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 17:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975270; x=1793580070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=egzVC3pMMbFx6L+PEcoVrWM/wO/0loR73eL1egF61Nnp6AMZwWmpLgsnqP88H3iKn2
         1YdmvLHj9fmbDEuwI5vKU9gYNYOYIG8IymxCXTG/XzJiDWJ8qxcb+34ItYCgYn5dDK0w
         uqdVkvQK/v8FxHlYQ9uQH7kVlKcaj7T4PE9fpDovTaRz9ZBjULz5hcpRmuB1rM1Sbi3v
         G7+qTUQxJ5YER637wKGEA1nOzFOqTZ5I8bCvxHJral3nX6IscIkJg3tICEQB6hT/l8gK
         TgRqgbRuROr30O60XnQxVK0WBj3yFXt58JCFx1NdNnYENKbgs7bSyxVHeFmRSgSQx4eA
         vPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975270; x=1793580070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFobPJXVsXDz19LQO+RLD3R/7cNmq2aYjbNBSXJLmQE=;
        b=pHjpWB9JD7TKd0UKSVqJfXv2T2smj63AcQfzbTsRwq4bycyoKU17P3ZksaDQ/mSaGs
         nYWwnZobYIfHveBKb+iuyJwBC2znGTz7Vn6ha7Qvc514jm0i3MbcYaiTHlMFtSMuy0Pg
         hQY3wmdQlEWXqHzTQXGHYgJDUmyWQh7hS0/4Uv4v2Q6UPX+8LseSLwY7ldZnGxRmvadK
         wcK8TjAOVYE4lANVQqFWBnIO1QqZ/J9beBubl3b2Gg0k3RkXkyLD8OiFCC6qaJDxaqhi
         BeElO3Nwu3WUd7t24Efk9MsAOGjh1LrvPsHDSE6e6NPvxPR4jxSjSr7KWokdmq2GRfMg
         emyA==
X-Forwarded-Encrypted: i=1; AKwUvByQOYdQ4raE2CO1snkmKKJ3JZQFTW+mGhI9r88bFXi90hmV5poYpKPUmxwSLitPWZ2QzdU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKbhk725bwBaFBzbTczyfySTFkDxoavVewBHdFC/iwFhWhIJDYT
	uN3TMeoA2jHH4XdbO8Jn/0dchpDrTdaYZ/tZ/iGvPamjSDE7c5IAnOeK
X-Gm-Gg: AYBFou3qjXsJjRHNAlEcUbfeVdgziR64YvUg7cTNXBVkEFgFxysJf49PklLEcaubm2D
	mBwp2vwxwtuOEVrdYFQiqXpsf+RgUaPUsDat21vdegnx79S7C2vyRlSp3+NOhuD9CrIwN7/0+0z
	HtG8cuHtcy9QbHC5trVMMUWGqr8HPspw/Gm/a7nz3nRnupZuX6//SOQkk6jV4XohX5S4c3B7o9T
	5o2goki0sY1vRLz61CJv3qppVA92nWsMD3KwSMEpg+dFUT27X2wiuSctbRzMv+ivepZVxo9ZNHu
	L4tV61RWteBVK4FifoEanBGLI2CFyyvD6y/jwcl/1nWFcWlTDWITWces2ivs/yzmM2y2NGLu4O6
	xH305lfmBqSi4kbF5LROpzt92qYkQ8w3ycKMI97rR3IhFVgYrC8x+cRHKFMWj4eyE/h8YTXgp8o
	rai3ThEi13GeHThyuEg2fegcOeI3HH+BsKoUbNfu+yHkEzs1yrYTTPfLW8kUYUsymLmwgQ3Vy+k
	fNXhGkXW5k9gxryOS9oABJqIwzlxL5kbrHUHZXv2d+lZ5vwOoh4E+SyYW1bCiYMobG9+J04fptz
	BW9MW3lwxC1khA==
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4a35aae5c48mr101973045e9.0.1792975270272;
        Sun, 25 Oct 2026 17:41:10 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:09 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] sy7636a: power the panel only during updates
Date: Mon, 26 Oct 2026 00:39:11 +0000
Message-ID: <20261026003918.155321-1-pmazzini@gmail.com>
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

Read the temperature in the regulator driver instead, as the TPS65185
and FP9931 drivers do, and remove the hwmon driver. Boards that relied
on VCOM staying on mark it always-on. The regulator also switches VCOM
with VCOM_EN, gains VCOM voltage control and binds to the I2C device
directly.

Tested on a PocketBook Verse (B288).

Pablo Mazzini (7):
  ARM: dts: imx: keep the SY7636A VCOM on
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good, then switch VCOM_EN
  regulator: sy7636a: report the temperature
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD and hwmon options

 Documentation/hwmon/index.rst                 |   1 -
 Documentation/hwmon/sy7636a-hwmon.rst         |  26 --
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi         |   1 +
 .../boot/dts/nxp/imx/imx7d-remarkable2.dts    |   1 +
 arch/arm/configs/imx_v6_v7_defconfig          |   2 -
 drivers/hwmon/Kconfig                         |  10 -
 drivers/hwmon/Makefile                        |   1 -
 drivers/hwmon/sy7636a-hwmon.c                 | 102 --------
 drivers/mfd/Kconfig                           |  10 -
 drivers/mfd/simple-mfd-i2c.c                  |  11 -
 drivers/regulator/Kconfig                     |   6 +-
 drivers/regulator/sy7636a-regulator.c         | 240 +++++++++++++++---
 include/linux/mfd/sy7636a.h                   |  34 ---
 13 files changed, 205 insertions(+), 240 deletions(-)
 delete mode 100644 Documentation/hwmon/sy7636a-hwmon.rst
 delete mode 100644 drivers/hwmon/sy7636a-hwmon.c
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.52.0

