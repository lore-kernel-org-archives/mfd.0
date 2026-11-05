Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908495;
	b=Z1uA7UXCbWHFWys7V1RIttaVXt0pvm7YC4sanw2GHao8XCf2TzeOnEJhzfiq+JKaZbEk
	 yPDVBucsEaWLc5TI/J5QZBsFAfAzo5yFlT4FPtRQPst3ubprB5Ol8CRjjIGk/Y+WiH452
	 Fu8++BRdLhRPWRE1ydJfPVudJt/AUAow7ibBDafnTXkf3pk96mwITu+4rT2tG3Km9oWeR
	 ru4gYxaiJ3kk/83DQ83SLt89c7iFSV301UbbcKR467Jq7rhR/6Nfs3yIBNRfavQuvntYX
	 JoAF/6z5ajJ54jlrONXuPh7RijYbVhUzyYc91nwF45Flvnam24DciHb01eFkFxfpu5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
	b=DTvLXsQPwuVf8qCIEGOUiY4vZuN7XhZsXb8AEQgvjpuPm035y9RFYplUVuJMI89ve2Zy
	 oXdHO4UZM/n10A+uNw6yJvxKZUF9uC4efxY1R/Z2u3n+qOFUuIOtLMuE3j8xEn99FZCzT
	 GxBeOpjAOX5MK957MX4vHUGknZ0MMknorFJOoZTV2n3H0o9yGsCC5SIJqgImVo9MX5UbQ
	 k8DIPnfe7+SHrKtfS2WzjnAsG3YKo1n+mfl2VCOPXarUabQmFwSuThvwWe3mA86vgbhbH
	 f5cHyp3tRhUWYZ6MdzxJPfhxsSIk/UeM1EIpnwLK0qjYi6sbW/kYrWHUuHVkxJZd4hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byENnGHK;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3475606D81B
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 19:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3475606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=byENnGHK
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so21200175e9.3
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908493; x=1794513293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
        b=byENnGHKBVurvQktl280qBwuH0PNODatqg46PS2w+M2D1aQkMVppqFlDfyJW4HDWub
         CJgGj078AokJdMdASi5qEpRHL2gk4RFZKmzO6gqDvP9zEKgqPM4i6P6uJoC2CGLMzAdD
         W2oBO3y1zJZyC1q8u2K9L0REfl9fGFbYVAy+xVkXLXpavulJVNPFGdYv4V3EEz4+pXrj
         P7farO/s1IGULw+DLltFYtTqHXhGPFVqDFq6ZSKhsFZU+m/C2J0JBvYyX8sLOP4WV08S
         VnIs2tM4pzdEoThm5+ho6Z8gf8/iwlPDg5iNdYMKYE17tIuCrzVA1udzh2pFeuz2/jlr
         x5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908493; x=1794513293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
        b=zt9fD6Ut6jxiKBRjWibV+rIvjr/JMJwxBWqaYbTf3JiQGdp2dNcNspWknvOy+BbGFr
         OcRuapU1zX06567GeDMIt+vnElFbvIQa/OiENJObNOcKChNT9rrZn0qyaPp0NRDUsnbi
         vljg6klFkEUmnxxFEnKUVSBrAeaWEWIeE0rzVtkIpRlDNXGgEthw3xad45d4WzY5Vbqi
         5kIDoRSyia83dVu+fXA0psvdPQtT4X5n6cqa6BujCs2tPlD0/Lsc6meoiwqy7RxNKrkb
         Ys0O11PM5BEYXSHSWBfFy84iVvAiKGqfKxyLwPUUlShnaTawBXkfa2yWL2J9264QnYWD
         016w==
X-Forwarded-Encrypted: i=1; AKwUvBwX6Dk5IqXTKbbh8FksGqBhK4y0hnfBqNGX4Byjv5UeRrjW1CIB81GwmrmJY0P+06f+JVg=@lists.linux.dev
X-Gm-Message-State: APuU4Z+jKlGyUj6VQZmBWmWGvdG7tsRUWyMLm/3ann9f6XKmzw/hbZ/X
	Hxyk9pSr90B7C7zfV/Jp18Hj4KT06lh1xDilsbkZbnedO2h3R2wbwMTY
X-Gm-Gg: AYBFou2C/KFcccID9HOUU8dPfFpeuzuxsgqRTGg5kx7XP0dZBZayfeOK2h6On0sXyTM
	LS8zc3joN1TG/swUXiGWpp96KtfOEC5F5uoTRwV3WqN6wUVsfAIEbNSdHiVwS+CX3G8QOejwrv2
	tJPrJz03HHKXtVGFylPaPX3L74RBoSG8YDbpCHyNAhv/QgMVUt9dd2ownhsMF0GmA5ERAZYY6Tk
	T33NMp0HbV13xPkJ31lQbqbYq/QWkzuJnhiFcoJsm3MyvF3Ko7cH2M+tYahjJUvieRJZOwXmVWr
	jDvC4eyTCTBIW7JLNY2NOZ0Azm1+4MDeUZAQX3y9Q4NKn2NQKg1jBre/ujMp8eUNIC0N7gsizJG
	GK2tgk4eRk66G/GVdmCDeuBvzl4MJfK6JxR536Cv8HWB6LD7mtFPmtcYX4L+4tERAxHPof2dQxJ
	Ja1vDKwMbBm4DVH45wXUgM4lCCTy8RcHCFjRUxilO9uGV12Dpp2nTcHUXQVJb360C6HIAVpIXWT
	o80Itw3rVqDjtAk7IQmTWG/R08fis42Kv/n8elO82GDa4d0dFvIo+CU0etTR39jXn2B6JAVAapD
	tpuDHWVPyaRHI101+RWpZ4B6VlA/t7tgnu74+k8ALeC0i7U=
X-Received: by 2002:a05:600c:4e56:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4b6e0b0906bmr2631915e9.32.1793908493207;
        Thu, 05 Nov 2026 11:54:53 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 6/8] pinctrl: mediatek: mt6397: Add MediaTek MT6392
Date: Thu,  5 Nov 2026 20:50:26 +0100
Message-ID: <20261105195206.3440-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
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

