Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572302;
	b=Nd+aUueRDbcqGx8Ez7uVczUzNnoHQrVipwU9iAXyrMh06sYm0w68gmUQDvngGG9bKfdf
	 3P3gSeP//yPn4YX421GD8UGUitwR2XuS0/R5Ini7U0xBqZXN0dnT3mjrg+ih2HmKcBvwe
	 xycLvFmZA6GFHXqvx5zLRpiIcAJLYC+Vrroco40bZ4VOuTAUushyzbYPuWSAh1gfxTA8M
	 YzInX/JHWx7uPZJiCwpG95RADQzAArXH98zG4SYd1IjPf9kSLHVzZ2YM7ypkbidkX2Ba/
	 Mt0l0jhucy9DJHtl/VwiQaeVCw/IYRmk5FpzDMTKCMcKaO4UsYEISDwoit4dQUM9NZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
	b=hXfV4/pwX+sVtmFE6DjrNlJC0Br3qSK3ahYEAJRMQWw/lMjcA7wbqEK+dwC180xrk4X5
	 RjJl/dhUTrV70qdHGdBlB9WGJRI8mwy9LwK88e3YyR33a2fsak+Mv3UQEkWdTuEViK//y
	 66vJhKOzy7pInkcP07JAhIMpjTc5Tgg44ZXWfnffj1W1+WuOXz3NmhmSRis24NfL2uLNX
	 s71ZDSjg0QlOKw0t6BlNF/swCzhqqoLP/LuSeX4e6TrjBePNdNIrkKsLmX4W4rdjslu7d
	 0XT6Vgzau3b2oADXk5S3Mks9jOxS2vCuFv0sOVaGTr8nxStJnjtVdzDRX/hiFIAPh/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TRp/RIok";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28350606A326
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 22:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28350606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRp/RIok
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1637297f8f.1
        for <mfd@lists.linux.dev>; Sun, 01 Nov 2026 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572300; x=1794177100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=TRp/RIokMvoqBJwofCmuJcqtD112d8bwDhkwjZVFhQbv/bz8LW1U1t40wC5QgYl2OX
         a3pBT8pkOB/HurkSkNf+VUEgE55rg5lihvXRk5dpzrtKqY0IRDu3KcYUY0/qoXIezriT
         7ovKeXehuq8fN+8o7olEbnA3JD58excSrAwLnKDI30Gfjn3WMEAy9a7R4BjGCnxP3J+A
         S3wJHn8XmisS0AuFqvOUVQ3DIwqhJPT0GfHffPGelw+rmb8PodJxuAgfDz/pl4+fyom/
         TjiBDAbcYQilBEowEnJ++PiiACum46wERaJleUNXPaGGVSoQtF9fjn7nOMnNCm6hlD//
         1uKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572300; x=1794177100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YleZPiS3GFEE1Ucc2aPYXMZVD+vgRoqW68GLZ8Ewqjo=;
        b=Y8PxfG1WfXtua4E/YfrnKpmY183ohTncOsSprK229rYZCgo54vRIcskdTbBS/5Xb2e
         QT0JZmHaxnTVYJd9pPvagyKmprtlLKF+THZ4tqYwmD/yco+qVT8R8DiRNyqP9ylBVsqn
         /yXLZZLb/0kt1qD8DrYrlFRL/YVet3mq0OnfFMufvI9RiKhc4ukvHzKenMUbSNfCCKSK
         iQoo+iA47IaMPm01ADb+z3NlfSa2gOHGuio/Z8/JwGfUk/V/NRdCSh7XouEqzXzYoChS
         anIrOZWVXd0Mjpf52ht3YVevW2ezyX+X4I44iiAwPXZkvZBUqoNdQtGIlPO9Y5enhekN
         Azlg==
X-Forwarded-Encrypted: i=1; AKwUvBwIKv1vV+6DfaEHsbM2nxu/MhVIVJsN5sZOBnrrAA9znupqE3vOxbgs38uTrtTpMFtvy68=@lists.linux.dev
X-Gm-Message-State: APuU4Z/QbKYvSwHTJ6l0fY80Kv6p8GePUzP17RtTdwp4KWjHpI8vFhzK
	lDJq8l52C2Hm2J+bMtBei/gJPLRj4hPMnWehRTNtZISOmvW56ZrIJYQP
X-Gm-Gg: AYBFou2MBLBMHIuRUhZIfX7xuGnXz6oc4nHobXu1xAlmdfTiFZfurgUsI8pj+W8BnYM
	cFvfmw31LNSeKwKkUSH2+sM6nEkU5T0lGDI6iyilL02oYAAdRc8Rq277vR17Q6SbAFD4dH9R2Y1
	p+UUOlybSU+rDVlvoN5FZXAmg7fvRHCmr1/FBssl8UCw2R2CKmi0Bi+5odub5IyYSnxa66Gwkof
	M8IAqkF+8S6eivDCzY+6mCpIxwl3vkuyuaDsVTqGVRGAmQUNf6axyGKq4eKUBAmhpXFzbS0x7bp
	77SMY9CMjkRXkdqJzMvql/WSUMWwQXpJ8jpjjlNcwHoLFdp5YicMvhJepNXpPIWfz59X8PnxR2z
	bXMBK0gUsRuhvR/lt3dPrz/5RIkgVHN0Ulee/UOqRgWNEM1kNDNtYtGbVMG9K1xh5mH4ui10jmD
	Oa6HqgU2FaxjBg2uaOFp3dUxUB0UVzRPdWPGsS+/BbRgNzQavKn95Kj5/XaSfqqMTBHF76sB66b
	vQjkAgadU6HL+C8zpOKyn6VUxoimlHSMvrPHoR3xB4EUmLLGgA6SekGLOEf2vTqaNGv7ayBZNcy
	paDkLcgAafnYzIpt96T+g0CgKXoj3EDfxgrBie5A7p93wTseO3DTuxTQaYJHqnw=
X-Received: by 2002:adf:e001:0:20b0:48e:d88:55f4 with SMTP id ffacd0b85a97d-48e6e2bc855mr15509231f8f.2.1793572300404;
        Sun, 01 Nov 2026 14:31:40 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:31:38 -0800 (PST)
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
Subject: [PATCH v2 0/7] sy7636a: power the panel only during updates
Date: Sun,  1 Nov 2026 22:31:18 +0000
Message-ID: <20261101223125.302001-1-pmazzini@gmail.com>
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
auxiliary driver. The regulator also gains VCOM voltage control and
waits for power good on enable.

Patch 6 depends on patches 1-5 and touches the regulator, hwmon and
MFD drivers.

Tested on a PocketBook Verse (B288).

v2:
- drop the DT patch keeping VCOM always-on (Andreas)
- patch 3: only wait for power good, VCOM_EN stays as it was (Andreas)
- new patch 4: fix negative temperatures
- keep the temperature in drivers/hwmon as an auxiliary driver of the
  regulator, instead of moving it into the regulator driver (Guenter,
  Andreas)
- patch 5: no VCOM enable at probe, which also removes the probe race
- patch 5: read power good and the temperature in one transfer (Andreas)

Pablo Mazzini (7):
  regulator: sy7636a: fix the chip name
  regulator: sy7636a: add VCOM voltage control
  regulator: sy7636a: wait for power good on enable
  hwmon: sy7636a: fix negative temperatures
  hwmon: sy7636a: read the temperature only while the rails are on
  regulator: sy7636a: bind to the I2C device directly
  ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option

 arch/arm/configs/imx_v6_v7_defconfig  |   1 -
 drivers/hwmon/Kconfig                 |   2 +-
 drivers/hwmon/sy7636a-hwmon.c         |  58 +++++----
 drivers/mfd/Kconfig                   |  10 --
 drivers/mfd/simple-mfd-i2c.c          |  11 --
 drivers/regulator/Kconfig             |   6 +-
 drivers/regulator/sy7636a-regulator.c | 163 ++++++++++++++++++++------
 include/linux/mfd/sy7636a.h           |  34 ------
 8 files changed, 162 insertions(+), 123 deletions(-)
 delete mode 100644 include/linux/mfd/sy7636a.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

