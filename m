Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31F4AF69C
	for <mfd@lists.linux.dev>; Wed,  2 Sep 2026 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377752; cv=none; b=k+r/BdNsxRmcyks4mgCNa5kaSWPCn9R2D5U9lVbLBJYzQrpaF9WMcZ0y4sdCl8MmQ40wbbmRx7CmMt9Ae/kMgnKsXSTWBshys/pZB/7riiqzFaA7cmLP70u3wmL92cotkf+wEJrXQNUls+tw+4So9h6CktK05hbRcpfwdYX6olU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377752; c=relaxed/simple;
	bh=ooP6TPJaU7E3qtlNtmtW111JJoBfcaG4ECdsHkhEnPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNktwnvFLK8r3dqCXv48Hcp2btopiAG2ydhNqzS4b8U+o9K2jgRJvmccACIsgx9rOX4EYMYmseaHQxHz1UKWfw411x+1ZRY5xQUDfuhtuil7MFUi7bFHBqeyoqkftcV7KWnPh6tl+YXyap2t118b1xYW5n+pxbJay2OcrplGCDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+EPUEZY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+EPUEZY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1039840f8f.2
        for <mfd@lists.linux.dev>; Wed, 02 Sep 2026 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377735; x=1788982535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=U+EPUEZYKylDHg1JFc4LmCHy5B+WVCM6T06xW+v7ahvKU+0L0o5xP2dZHh1Yrscaln
         dy2EB+NDw15Kp4B/Np499tOrIj3Uglh8iEiHuo8izCWOb4oP0pkz9exS8mSG8LgyiBmB
         qc0pFAGDaHdCkk5uDGph6fJz7G5ICjky0yL1A6qUugjNqrKTZD50QQARyLntknT0sh/X
         dJjv6aSuTs/g5HCIObjRihLWKno/MM04qvHbmvpa16BSrTwAxyAZ6uyWkNCyQV4So6Dk
         OQ5tCq6+nfXGpkKrpamCCk/xjGezLRpUV0ktLw5iERB31nNvQf6vEcEQOYQq53uZx1TR
         2CtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377735; x=1788982535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=iR37I+WIcdDrYAA6LxPwc3UCX4+7vUI6mO57XfNCFI/hc1tkZMnh9pcAOPund5+lF7
         9lqIdBFU4lLqmu7sG5AP5MJzNL3IgtTWBK3Qu/Q4/xSabfYtMBpPiJVZKDQN0u8sTb6W
         L9kCxQjVRhvZVQ/r4BD+QyCziscigPvtvwQnMWzsadKEeuIBLBZGlorlFaVTsQxO+lk/
         Izijv3AJaDjkqCh2v/gp6J1VTGUwvG0Yye4dxM+lGWjHn/ikoZcdEk0kQr4kOw8dJvnj
         swFAsBMr7A2n180yvuaIdNmfnqitTmMjsj3DUTpANtnqy7ZhRsw/FiRRxnsiqkVepJGg
         68jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDlemuWj/6DXXWaWrLfv4CDHOc5PqBpKxIQQdfDxK1lLP8oOj48QSXV5juKjGUJAR1oEg=@lists.linux.dev
X-Gm-Message-State: AFuF++m96PfzLYcVJXx0vIMLxp3wbC2ZT+aUHTIpREoiOlFY+TIIFV28
	OnA3K2UL2xiwl3F3zZuYlYzI6dClPe2Esvh9Ew/6qPslTlzo1FGLBLR+
X-Gm-Gg: AYBFou3vgDF4dsOMROoocciI0+e10upIz1MsPqVaZyhe6MMAQ8EhaAbG7m75QwGKydU
	SLr1Vp3XdIkM6VnIAW6BDcaFNdc+NX5+LAg+Qv6g1Ag2N+L3wGqBy2MZj9WUMDHNM/4ycRrAIAk
	9WBNt4AuUXkYxuxiMZaxoW/g0QbvumKrXYxuPsNPVgmleMSTmxvTC9GirS/hwheVqGVD7ENikiM
	Zs9WGIff8uocBmuHv0a29xdV0ESM0lowOyDZj9a1SfkD75p8f9PIHzPhmb2NQY/p4elmgj1mMCO
	cvuaknc/5YI1lY8I6dbwQmX3CtAvHIKDtDP6cO5G58d4fnnF18N0Umpt/2n6CNspn3LBJNWqnH/
	CxzBgdnoy2IfP4VjRI1+jLAwSxMWkCXcvfqTvW8W9cqP3gycDBh4UdiXVu2pSjqrieXG7qEjeTt
	/G1VpLfuhBRoeMpEnc591xJ8QpB5fV9gjJ+yTrd9zASMdzfWagExJVM5uY
X-Received: by 2002:adf:e19e:0:b0:47f:f20d:8d4f with SMTP id ffacd0b85a97d-484913b9852mr14461136f8f.18.1788377734976;
        Wed, 02 Sep 2026 12:35:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:35:34 -0700 (PDT)
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
Subject: [PATCH v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed,  2 Sep 2026 21:25:42 +0200
Message-ID: <20260902193351.185771-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
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
 drivers/input/keyboard/mtk-pmic-keys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..d758c7743f6a 100644
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
@@ -69,6 +70,20 @@ static const struct mtk_pmic_regs mt6397_regs = {
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
+	.key_release_irq = true,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +316,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
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

