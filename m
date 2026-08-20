Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89828440A31
	for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787228814; cv=none; b=PeefVY0BJiqP4JnM57PnDhWoGBn5hLNKbpD2EpqQhRV5E8MDqDkcTDmnmxa5IBFz5Em+inuwAeK1ZM1kUIPbkS/IIK5lVYadTw3/aSB4S/NiovW8VwnSTS9XFonHjzTJ8/5HB3lBmmySCZNtFOZz2i2RMhHiQGQRnzzvbJORMOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787228814; c=relaxed/simple;
	bh=2bZt2a2zRVSBV3MA0JWJ6SLazOmmGt1tpatOsImPFW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BX/DQ7tcnwC4jkIhP7kWLd8UJ2KJyIp0wkd4QzrSbbq8+eMnv/vpRftVcnr1IhekzNKG1i0m71L8d2ClWxJbhBu/1KbiJw3tL2NkeTAjuOMr9aKsiPp87I6kCrU+oSBnd1aakM7n79lCZ8E4aAbsu6/NjMV1ctuwr+Xi8AwG8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqNqiU4F; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqNqiU4F"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fecbbafdaso781783f8f.0
        for <mfd@lists.linux.dev>; Thu, 20 Aug 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228811; x=1787833611; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=RqNqiU4FI4HsCWKFSLuMn2c0WRCq3XcON9UqbpdeAhPp4Kr2SliCwTjL8vwY0D2KpW
         koS7/b1mH4h0zpYBU4IuG/Fer0SqXZf6BA22rxfw4IC69AhTiKEJdvFl5JynBmMv2NvJ
         fZ8eaZDAFLS8HWpPIxSzj4y+yInFFYWtx9C4GPf7ZbwfvxPKcJKaEDAe1uQQWBTSCfOL
         HrDCTyQhwpKi8hGT4lNzK3sitqoHOZetytjT4PxA2Y4/CHiX6sM3wvDa7CCiITjo/R/0
         vcu8CDn/pYp8+sN8CgOI0kpenflGp3m7O5xl11LUPqx3X6oRR42YKQUENKOsYcq5w+If
         q2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228811; x=1787833611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=MOqHTsrHwByWgYfEpSmn5k3T567eY4Cfv36ZYyIbWxjmAkXouaMTFvbTDfc4zORsHz
         zOVz1qD9dsc8Fcey1narITGlxmYaeFfwuoBqJKMOhH6UenZz0L26DZaNOpwHkdLgGYwq
         OePBJI4hnP3XM2cENTMMvhiTlEdrEWiqDWkc4dQxDKcCJbGzE+G2GPZYNmDFbss3Uxis
         TPkFmjR9Aig+v4Xfbgno3xZ3t6x9+i2HqLNBEFO3mOtRmg1YfN5Cyd4ff3x9r2VISrJ/
         wJ83o3AKy0E+uBfIA2tq17HA+wkn7hI7DMjqPOeU5iwQhkVeX6vlduNvt5k9TUMM0xr5
         e4uw==
X-Forwarded-Encrypted: i=1; AHgh+RqcIcj8vrHDFMG7k31FdZAYC4B/V0VOvviLVNJTKIWcdTSnEB+9CApTjkUncLS6Vn8X/fY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAcTfT71DjP/bt6X5WrOaP4kC2Qacyaa96kOoMqc4hctTD1Lsc
	6kmTKMLCpxQee3sR34Dnsvu6pkdtbxlaDYDsKMw91jjeAgqBgKU+Iw5v
X-Gm-Gg: AR+sD11zBTWyn8fBzEGMVKsWksOj2jw3Qme0Q/gDOteSECqy2yL8sNjMPKA0JXpZChA
	sCwLDC8vW74ZpB3G5viscDiHE84IeTzFbYFIXXmkp4SYCN/UzeUras3d9EBREvTaBvcYlKyEfjD
	3xVkjAP0r519GtGY1oLuui1epTepxTpaRzW8vo5ofSMtfcfY9kHWIhyLrL76gUE8bXCcQr/JMgR
	IAksLxY8/a3N6n1P2iDmjZfkgpscovKVyjShut/wCikb6h3nqB1C37IacfzmJqruzZs4Ng2P48u
	Ym8p8UJjkMERdjzI0+TL4CVY3oYeOATMYLfs18Hrs8r/6dqu5vb4XLt+GUDQsS7mNgVFlM1Ojeq
	cscUtziYH0QHqyA0/dtMhihn491jk3ioZXN+Z9d6I6tUGDfrnIm7osqZ5+b99LNvMSwq9ZMI//2
	OK8dOTFZHSrWRODdXH+qCWHeF/aLmQDWiVmnfziGPwU1aY1+fnoX+m4w==
X-Received: by 2002:a05:600c:3f18:b0:498:1595:be7b with SMTP id 5b1f17b1804b1-499aa194df0mr233187165e9.4.1787228810718;
        Thu, 20 Aug 2026 05:26:50 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:50 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
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
	Julien Massot <julien.massot@collabora.com>,
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
Subject: [PATCH v9 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu, 20 Aug 2026 14:20:04 +0200
Message-ID: <20260820122242.120039-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0

