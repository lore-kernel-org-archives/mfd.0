Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517871;
	b=ldSLqoNktObqoQjxBjo5yfdw6ZoTDmIkO/z6+keOS8+Lvo2/0OHaq1+2Hlthb0UNLkBr
	 97oqnJs4q9mI7VwoLAoUIMA0tuomSS3Z+6753F5T1MPXNmmjzu6l/4gTSxca9SprZ4uXU
	 SjJreyWtKyYwd1380T9i3xSIx5Tql/f2JAXcsstiUNBcazikxhM7gG+89y+gQjeQbhcE4
	 N2ZMT74Sbp85WbHzF/Fc8QVYL69FmO260AFq6KxW32UvD5Bg3jtaACOoOJ4pPp2kZ6a9j
	 +DwuW89exlMODlqmC2TmrXcoxE609l2cczhQm33nL0LIqLk/AgiiQ+rzQeAoBkHVGOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=GnKUpRvKSMtUsTRT2zAe/AAaqMQH3UHEQkO99fzcmca6vi/nn0jf/cIXyY9RXcgtay8e
	 Tn4JsjIKLnEbdApOU/rs3cAMgrb7f7Sib64X1csVb8AemuLHsWkuNDcx9L1G3lgR7M1Zm
	 FhIqKuKi6Q0WbtWmWwZC46p95w32a4O3A2GnsClY/EnF4+b96aqhZfVIqcb0G48lrS8/c
	 iGGFcLSaj+WM6fsUICZHMjlt1G9JwciaDih+fz63W+62Gd8VinjtnrRU9vlzQxIlRm79E
	 9wdcRDghsDdIi7MtPSx624s7lLpbqh7hA60JzxhyvSnCIvgJ1qYds6JVku0grjZlCng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="aC/+9K2I";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E160A4ACD
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0E160A4ACD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aC/+9K2I
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a01933b584so25058605e9.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517870; x=1793122670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=aC/+9K2IEPsj97B37TrwlCcyxjDVqMDOHgn9Wq9u7Uwy/TTZbQBKZW58mJFr07JKMR
         WhRza5DJhpdWIxeyR/y+bkAUjV3AFmOGQOSb6Blg/4c/Do3xtXKufnFDYYQtV8w3f8r5
         Hn0A9eTN3PeCVo0cISKv1K3YKFIgeZmLu/OTIXq7kcVLpEocObOyI7WQ/xfOfrSZcckH
         XuTr3wZp2h3H76L/kMEo7AOXLrLaOCF0bJbTGrZwQffkeOmGtvhFGfqpvdGql3XrR5ur
         x3nEI8VY/vwlfpxrgpJD9yjNPfAZVINX1pNYMoI+pG+Yk5JuYEC6E/UCEmDFlIYpgm7q
         Hvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517870; x=1793122670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=OhKao1d3Ak6e6h4qXrf0YxwNAFvXRwaRzAiGHmYb4lfW6meia6D0Hd0bnj1Qdjq3Oh
         zbw2hs41LvknKzHD+cpGIRcbcC5Mm44H+UqNjuWdB5wHAiRZHa3Wiv9sfFjFZKuBbcLy
         aEa+gLn8IkzvESe4zBNprtptCiIPIOATduAJYcJoswwDlXCi3OvOD76tIsExkOxHXRaF
         1VHpVEWjZNWQQcrCpizohpyhkMVDDSPNwatwlQhe4hY9ileFB+/TaVZ56HlFxfvlVPpo
         YCO3ezWgyRlsjRVQjzC3Ta7HtG/OooLALM0sUx0+/L+0yGgIgMHiEwohLSZw51JUjiPL
         JzBw==
X-Forwarded-Encrypted: i=1; AKwUvByojPdkbGZQnznq9sIg2x4dcK0YLqNyo2Tl0lC2oz1J23Ep8MOnmcTC22iuWWUKN0vSRsk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIA9gGQ4WpSq+YrIhRfvzaFp/FQI4fed3HagfnATl6xmB1G2WR2
	bIRa781HJhM2vOQlF9135mrgQUlfwKccXxMVUijmbNlsV8kyguNOxx0s
X-Gm-Gg: AYBFou3kkNkTbbUSL6OdppgmTf16JXhi5tZZBSuSjV83XJoTFGAqJDyySGNPP+ajpet
	e3wrWapeoqJB+dDWWou2YtwW08XueLq/neHrWbzRBOJ/7wSWvCEckGELO0g/SVwkvXWSfLtAhWI
	sW6foz04TQtAfD5shCZAb7OQR5aNRr4ipE1u5l9WldY8K9a9EwBjdAmFUZOsXndc2LcQh3Wg1iK
	CEcuvfGQTUGW0ZP8iBRbKM/6+Eh9oemNj60LIQCFeEx2T8pORkNhOthUoyHIa5Qs2ffpxcdzpYc
	eDxJbZKwwjCioxyf4E1kDCkRN908auwaTDSBVOPoUki9ceDEXWpwMkGzvCx0fTnRUXklmUWH0Ej
	DACV+fFpqaGTQA8ElVez/wrQHfNjEidpS8fO0GZ2z5+ep1L3KNy2HKaftzoRUMc1hrfoxvbgQly
	X/uRvzFp+rsveUlhLEicdS7MtRTHWGlwjghq9z/9rdaeibHaXdMLDsqlxgr5QelDMleX613s9u0
	fPt
X-Received: by 2002:a05:600c:8706:b0:4a1:946c:953f with SMTP id 5b1f17b1804b1-4a1d7601873mr254696305e9.20.1792517869433;
        Tue, 20 Oct 2026 10:37:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:37:48 -0700 (PDT)
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
Subject: [PATCH RESEND v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Tue, 20 Oct 2026 19:33:27 +0200
Message-ID: <20261020173556.632798-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

