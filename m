Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580037;
	b=YGiOhv273Ta7aYk4u85aftTpuNQ/+pZlYdBbuK0/P2zV34FVSXhEdds6CdyE//IBj2cW
	 d2QFuL7bA0kIwPhu6ceMsL5R1nXZQLCVaGMy0MDqayOcuxVLiv01ABq2CqQonvPTxutw/
	 goMpSIaILJWfIj8QulEBb76kj1sFD0ao+5rf8ZkS95LSuJ82fgyak/w26A9HXmmz2FYT/
	 DzbreyUfr5ujb09KbB65SPsdqT3EVigcwKfB+YDhi0A8o8y0tghniO6i5pPx9/rmd8tcK
	 lOGWAHiD0U+PjbZjapKNPLpPrpKB9Mt/U0yxWcHl+2FCl7ghYKxB7HktkIIFAnW6PNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
	b=Jtj7DFIPI2Hp6Bpyn38YC+dK0MYIs5Q0L87sZYbmdXTWNjNdYfey9ehunaSG7kKjDDyN
	 TqWbBIp5dDVwCg2M5snwx7SVMqPhA2BedR0tyuOgRYml/A4/ZEN+V14szXwQnR8gL2pCa
	 JOTjRS8kVnD3KG0b/epGt+LPjHEvV/2YSHtT6Fqu3r48ZGqKRheZBgd4jtb7+DGeQAZz5
	 PTy1QZk6YttGOcZqRVzTvfM0Pl2Q5w9lLWO9hQU4ElD4UzvA6XzdTeyixAD12qjEkTu/p
	 u5sCv2jWb0Cp0XzsdwvZWnVOx+imBnfxLrjIztYrhv9NJCXREKCYXNKZWp4HMWmHwXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AhbCsH6b;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02F0606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F02F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AhbCsH6b
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso7300665e9.2
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 03:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580035; x=1793184835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
        b=AhbCsH6b17PgUZBV6vxvZYmW4Io4EjJk3GEOLbjd2I0zDgt1aLNkwlk5/3/RvugR/u
         QSUuJC9MAlhiZWQ6Ldw7u4vhLnY/DBC0p1JnkHtTdFXm8T3QfvycEcb9tXOn0p5NB4Iz
         8OrIkyhTm4KRIHa3vRjKcu7SyIz6nr7RuAlVkZNvyDu4pK/ytLEkzDsbJBmaYtNqLWd+
         Rw/xCVasb+xLZD35XBcZES9hR+LUOdArpyjvXueuVCyi6KokHTjHGN2veqifZOOk0mo2
         8jrL3ltjbTvB1kWJO/Wl1+HIKTqM13685buAPXximi35y4p15Fn9ZPk7SOg14qe13JBI
         uTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580035; x=1793184835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
        b=1ut0iiuATyC7nijYx+M2cJB8n9qiP7qb6wBqWkupiRCO3yPCLIfZwnOrJyCagiU1yt
         y2vsb87cxDlCdLbUHD61nzVwnMpE8zfh1gtAMQk4I9nSNZeluU+TSAxUgdczxWOoJz3J
         CRug9FQWpRWC1B0ND0yD2GXC5rC8EaUxlKIJi9pk8cPXlWy3TAR+bsmnq6Xft0xOUo9q
         rcn38oMP+GhpJzUAN4OjgQ5JLdAmJI4Sf2KPuXzngHHJ8HfZJZVbKo8xT/vx5ctENFkS
         kveJTl4rvgOD66NmxRFz0PsOP8mmDKdQiUAQ/TG6c2BKiFBNZFXNW17ROEYKGTj5Z0Od
         hVRw==
X-Forwarded-Encrypted: i=1; AKwUvBy2P6ULmDZblMRsJVux3Jo4QeQV6Yv0FNqLgo2Bd3phagK8g4mVqU0DNscsYXEKbbxCN8M=@lists.linux.dev
X-Gm-Message-State: AFq9FYJnMQu8J3f2ERk2HEN0d6AutC3WBb8AJ/T6sRh6LEhwARCsbbh3
	ogEflrzXQuM23UkCLsW2BJQDfuCIskt0PrWPtySwN80kKA9iRihBAxe4
X-Gm-Gg: AYBFou1zQ8obMUgLyqjW3FF/NQ0RjxBgSFv9aNfU6MlrpEBvqRc5en68xIdw0mZrCLU
	LKklWtd3G4es9mfIlKcX4JB7lYSl2pGRchhwDQ8uS6J1YriPautmSk42zICw3ymbrQO8T98CiFv
	LqPiB3Cc5P3lqcLXHM9ONBt66jY+4hFj7gtTCaoMzYzc+ZOE/GhpGTP4uWmSoXisKRL0C9X6KnG
	5t8XV0cCF675nszKmZM7RYv79Ad3ji88s+vivqzJjRGnjM3fprlx0KCSpBoajkx61Cb1KrZPVVq
	eVrfXPstm6x8uJL7MhbV4qbkbM0dGMF9E+aN2yFxS6hh2EOEC0jiwzM8LcxBTtOtd6XIWVwRwS9
	mS+R5pWVU+r/yp6xyInEn+Nop1MCuaWPVoIRk0EAOWygC2kc6OJOz96KazkYMkavV8T64pzGYDE
	RHe9lCy6yPeSD6eLBpOWDgmaJqoK7aQAJ0SoCE5jtp2A/V7fFAuDAksOWUVjo7k0EJgf8mhgqrk
	9NfxBbegmVpDj4NOgLWnjGVl7mBofo4nZHpJ1iN/o4QV7UWclI=
X-Received: by 2002:a05:600c:4fd4:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a1fdd4d220mr31805745e9.25.1792580035343;
        Wed, 21 Oct 2026 03:53:55 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:53:54 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 7/9] pinctrl: mediatek: mt6397: Add MediaTek MT6392
Date: Wed, 21 Oct 2026 12:47:25 +0200
Message-ID: <20261021105109.199886-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

Add support for the MT6392 pinctrl device, which is very similar to
MT6397 with a handful of different property values and its own pins
definition.

Update the MT6397 driver to retrieve device data from the match table and
use it for driver init.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     | 37 ++++++++++-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h | 64 +++++++++++++++++++
 2 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index 13cee2a209c2..3944e39db7e6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -12,10 +12,32 @@
 #include <linux/mfd/mt6397/core.h>
 
 #include "pinctrl-mtk-common.h"
+#include "pinctrl-mtk-mt6392.h"
 #include "pinctrl-mtk-mt6397.h"
 
 #define MT6397_PIN_REG_BASE  0xc000
 
+static const struct mtk_pinctrl_devdata mt6392_pinctrl_data = {
+	.pins = mtk_pins_mt6392,
+	.npins = ARRAY_SIZE(mtk_pins_mt6392),
+	.dir_offset = (MT6397_PIN_REG_BASE + 0x000),
+	.ies_offset = MTK_PINCTRL_NOT_SUPPORT,
+	.smt_offset = MTK_PINCTRL_NOT_SUPPORT,
+	.pullen_offset = (MT6397_PIN_REG_BASE + 0x020),
+	.pullsel_offset = (MT6397_PIN_REG_BASE + 0x040),
+	.dout_offset = (MT6397_PIN_REG_BASE + 0x080),
+	.din_offset = (MT6397_PIN_REG_BASE + 0x0a0),
+	.pinmux_offset = (MT6397_PIN_REG_BASE + 0x0c0),
+	.type1_start = 7,
+	.type1_end = 7,
+	.port_shf = 3,
+	.port_mask = 0x3,
+	.port_align = 2,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
+};
+
 static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 	.pins = mtk_pins_mt6397,
 	.npins = ARRAY_SIZE(mtk_pins_mt6397),
@@ -40,13 +62,24 @@ static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 static int mt6397_pinctrl_probe(struct platform_device *pdev)
 {
 	struct mt6397_chip *mt6397;
+	const struct mtk_pinctrl_devdata *data;
+
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENOENT;
 
 	mt6397 = dev_get_drvdata(pdev->dev.parent);
-	return mtk_pctrl_init(pdev, &mt6397_pinctrl_data, mt6397->regmap);
+	return mtk_pctrl_init(pdev, data, mt6397->regmap);
 }
 
 static const struct of_device_id mt6397_pctrl_match[] = {
-	{ .compatible = "mediatek,mt6397-pinctrl", },
+	{
+		.compatible = "mediatek,mt6392-pinctrl",
+		.data = &mt6392_pinctrl_data
+	}, {
+		.compatible = "mediatek,mt6397-pinctrl",
+		.data = &mt6397_pinctrl_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mt6397_pctrl_match);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
new file mode 100644
index 000000000000..e7241af28fdb
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PINCTRL_MTK_MT6392_H
+#define __PINCTRL_MTK_MT6392_H
+
+#include <linux/pinctrl/pinctrl.h>
+#include "pinctrl-mtk-common.h"
+
+static const struct mtk_desc_pin mtk_pins_mt6392[] = {
+	MTK_PIN(PINCTRL_PIN(0, "INT"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "INT"),
+		MTK_FUNCTION(5, "TEST_CK2"),
+		MTK_FUNCTION(6, "TEST_IN1"),
+		MTK_FUNCTION(7, "TEST_OUT1")
+	),
+	MTK_PIN(PINCTRL_PIN(1, "SRCLKEN"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "SRCLKEN"),
+		MTK_FUNCTION(5, "TEST_CK0"),
+		MTK_FUNCTION(6, "TEST_IN2"),
+		MTK_FUNCTION(7, "TEST_OUT2")
+	),
+	MTK_PIN(PINCTRL_PIN(2, "RTC_32K1V8"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "RTC_32K1V8"),
+		MTK_FUNCTION(5, "TEST_CK1"),
+		MTK_FUNCTION(6, "TEST_IN3"),
+		MTK_FUNCTION(7, "TEST_OUT3")
+	),
+	MTK_PIN(PINCTRL_PIN(3, "SPI_CLK"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "SPI_CLK")
+	),
+	MTK_PIN(PINCTRL_PIN(4, "SPI_CSN"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "SPI_CSN")
+	),
+	MTK_PIN(PINCTRL_PIN(5, "SPI_MOSI"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "SPI_MOSI")
+	),
+	MTK_PIN(PINCTRL_PIN(6, "SPI_MISO"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "SPI_MISO"),
+		MTK_FUNCTION(6, "TEST_IN4"),
+		MTK_FUNCTION(7, "TEST_OUT4")
+	),
+};
+
+#endif /* __PINCTRL_MTK_MT6392_H */
-- 
2.43.0

