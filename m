Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908482;
	b=llvCItc/lP+fn34G6WzV97VeKaN/yJb3NNkP7aM+fJTT54+gM2Qu/ZOsjQNlJQ0lugkv
	 jaXwDNvOQAsjyxJwGCwzwozpQdzapIniORiFLowY/WdesAvWNafgFFJ6t5Elkugc3YpYd
	 9yQJ7raqyrJBC9ieQrzXO6Wst3NIc9DT5lQ9w/nYSBjyUzM547O9pe3ZINUU2A+67Zfjb
	 bwo5NFA/UPYmlVHqUcGumNrz9iY9Yf6r5cEyiP9eQTIrFevmP2jFJGjrMwDrUCPejFqjw
	 yMtb8tR9QZ92hasU4w4Xtv3qblAW0mM4/fVhYSnIzjd8tfshdrqGTGQBJzmaQVxxCZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=oZHJZJPm6WqPzAToDw/Jm5RSupNawxFnuMMkOUWy9PY2OvOCmIJ1U960/9oss3R8SopR
	 6HitF3HVUqpjNLEhKWiAhVDNCJOcKWkGgcWmcwMbQhYsBXbN3mpnWSv7BhyVDSOh5jr2Y
	 UHZFJDQ9Hptn4yY+zKvafaXP1lYW03TWt8rQsGlqzbcYzAu1rjS0xq50NCaBKuFfZsdHu
	 ZRxu05bCZ//8mchnk6u4Ssju8GTO9QHUTvmah3U4OzyzXKI9uxLyvCUooYubDk2MYa6Oe
	 qxzXWqif/CD+FZy7g+8QdkF5UN8p39tcUwqP/gfJHjVa8g//qGpbuKxHk2YwprAdwSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EOE7rCxD;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BB606D52C
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 19:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23BB606D52C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EOE7rCxD
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so15132995e9.2
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908480; x=1794513280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=EOE7rCxD2yH39KNxghA1aklQwq7XdPe2FTKWQyK7xoYDXJYwfR8+cgGEKNO7oA/ndB
         7EnxF3noUT1GNA7KBK7nsf7jQmnOBueJP1EL87xN8pqP+SZMwaWlMRf2x328CLWxiT8r
         JPHxtWBNHGjNQ3CdBatkE8E0nN58TKs8eaMS7WHdL36RCSH2AOXu2E0vJxw3VwEdI0sA
         Y0338WVbNAhH76fmELBhUxtwbG3GNNQsRPjbNh068eV4TqfzXMVFoGzdGj86/Os437AD
         dgnG3yKd7taK8C/lvRNZfbweEZBrUr3cWC4qM0VPYdCuJ6HSl8XMPoDwKf0mValzAmfk
         fmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908480; x=1794513280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=lPm7h7HicQmaC/eYAjh4Gt+zORG0ibZBSR09IsEq7HLN1cjiP2XftI+o07z+rUADZ3
         O5luRyWZLVqXxbWBKVCfum8gfw4Gt6sDE70KYusw2jQGWZLQtqVPFhQqBIFmKzt9f+oa
         Gj2m68aF4WSmMQsE3dOIdhEC7k/z71XmO/rN/P+mke0iHRRj2dmh//vGNERC9+PQv2Yj
         dZUFpn7emCPKHqOwh7EYcRoHCVmGIq6/mX6fZjwGFXFpZpSvJ8vjxy0rbCbl69z+qqC5
         1t/DpyrQ46W6eLVgci8o1lIYyzbVCe4fu+OcVAyFNGuDwFbPNM1MC9wQ3v2dYQcMCC3g
         VmBA==
X-Forwarded-Encrypted: i=1; AKwUvBy76ZLJy55xuY65L48UYXMZhzh2M8g2lBkcYFBicAvUXEel8GO0RtTx6PTxEzF2YhN+VCM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8DyuI4AobaMuMYePJrjZv0wtufcb9KV9NnxkbEuoTtAaqAEivf
	hYEq/Mtymuud2bM3MDcmT6882wp8CdP39YnpODOmZXkUzgX9+23YF4gG
X-Gm-Gg: AYBFou2Y6uA0PSIKtMcYS0+eHiUNBjIV7Z7iMw2p9Xac+ghn4gdUzbsnV5Mq8+OSsYF
	ReoztEO0dgwQL5JIyUso+fq3Z92kEoiJsJlpXKjUbYMRVvNHg8M+kf0ADUaIyYhNa+mybX9w90u
	ie85AY2phfaq7Yxju9f+wEM04qW4ERKwAQznltLtj6dimCYgD4vkprnvff/rewWCGHHOGsUtsxe
	ii3ewD5Rlag9egWKkpvoudKH2AYkaf4BgVyE3VlMH+neLxGpvVoDTH6e7GJyTenZNrKlTA64mdl
	uGT2qI4RjouDMQhhG3SpQH7f01cvBhK4aPDKniQvZeku653gVERhG8+BPs22PWL+J1/kEVtCsX6
	DuFYsQCbO2/IxV2j0k99xfH6HwtjUk0UZxjbsTxHa3kN5zglP5w/dD5gY6vqT7f2btPLNheazU9
	ThtKkP4W6UjjSpxDOTUB2yp2azZIvaF/X0f8B4Iiu5XHPWtzdeYXoN9a4v5vVjQaLCfI76gx6c5
	FxAJbIR5GwZe72oB9FD9TDOf6sbfynk4uKus3iHQRrgcecDCAg8G3X+NbbdEYxCEqbIzpvLsrNe
	SOjFHnf9FGPXA8Kd33XNzi9N
X-Received: by 2002:a05:600c:1f95:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b6e063f1e5mr3032495e9.29.1793908480210;
        Thu, 05 Nov 2026 11:54:40 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:39 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 5/8] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu,  5 Nov 2026 20:50:25 +0100
Message-ID: <20261105195206.3440-3-l.scorcia@gmail.com>
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

