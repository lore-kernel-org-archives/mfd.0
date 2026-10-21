Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580017;
	b=fbB6vECdvGehiQjT8GDy38tutyb/WAFdtH/ehh8++BeygzV04hF0rPHt8kNJgk4A5v4k
	 lCy9vLU2S7rpNkNrRQ2wxfHm4AFmzsXvTUrnSxu5hE5hQVbs1dTE3bR+m+hEJT9BPTEux
	 1EYq9uYIQXwmMPRl6w7XnCIaM3n60EHVACQl9kVDg0ML9lcU2KxBFGtQ/kAyotGiJG6GF
	 tzv0J+Kr9PUsDEzl8sdv7gtYzobdJcBlBf392q0hlfzoCbHJTJj0VcoEjuytSs2QqYcpB
	 7iygqZYnjz85bfOh3SS4xeLszAUrIWZbm8YdDgO+nStkMe2D9UwJ5nKKa/hpmqv7mtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
	b=M3q5HvD1Nu85OfxuZjN3dwq4aP9GTy7BdqczuTH0WMEGdB4h71FWsNnBFFIWBShiwpIn
	 7pUZFoZTXQ5vDCvvWJQ9dpeKNqPBl4fv5j9w5l8HtjSeFj01IBxEUnC7d/4enAu7/sB/K
	 3t27ep9Xgdhhp5kUWOAQC7veFgIER1motwBccfj23nu0gz/7NJJfeIfkx3wDuhHkpaUzG
	 qXZ0f/Yh7cj9lcRtMadOGX9S8RRJ8P845dkpg8LN5tGw4gGvNTBCZJIftnYuVsV2ljzsU
	 +RJMZAvuVbx8XZpruuKdEenh922JI0TUs2MEBMjcDORU2dahyPa+CRX+hq5/MCeL8YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D578ocfE;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C87606A323
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C87606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D578ocfE
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1129777f8f.0
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 03:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580015; x=1793184815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=D578ocfEb8jBkZlunVMESUSxhGD3Kkw+1QIk2U0Ef/KMO92L9GU9BRGOnwVwqP4FCe
         qr6R5pET6wYkEQzcEFhg6DsjqOIJ4s6nbIaWjCbUK5me8IgGdVjX61UoCRcEpgYjbeJY
         IfGseZlyYL4WTjJkGGib+58DIIpq1abHXa6VmjOlPY3uxNVTB9IdxhpRlPr6tCfGjSp3
         1tsmBSSVvr4AAx5PJIshfz0oKPOnazUCai9LE9WgrMebEcTiVsxbaS8WH+rR4tp4j41B
         trI8846Nbdcwk4fft6SmQwzXelsAPoHufO3jB+doe3RaLSnuURc1VJ9A73I6dygYhGZ4
         SGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580015; x=1793184815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=iiv8Fjj6p8XqlZkDMTEd3HFnwDhI/T8QrNgcSB3XITJb/9p0vqb1D7p5e8dgAGWvsM
         a/Rxx2h0lag20pKAQQyN7aPyfItJLSrRuKQ/whtUywJWKJ9y/zoAV+9drSKYEelMjpRs
         LRmUxXu4NyrijTPDNJVcIPdLVhfrKfSUiSLdBqdqH+kyS2Livydy9J2wFAXSoYAfTMNL
         gI863TXXarwRJoXTrH27QijXzU3FThGWvb9AjVmvSnfzDeSiZy9rqUBzqsDL/yBrTE/K
         asH03/NplxZNa2tMyen2Ufaq0ZKUFSaaTs/UnL0pSwj8M1JcWUBND1eGXtKtsfMMCChS
         P9Tw==
X-Forwarded-Encrypted: i=1; AKwUvBzia2bMWqLJ9wqsiERVl54CnEy5IMDxFnJfVWYICQa02AIMBlZ1pe91Eh8+RtUd8RsaWXE=@lists.linux.dev
X-Gm-Message-State: AFq9FYI24vkw6ChCiZnKxR/Na/VqtdkfJmsEUb6qORhodSxDoD2O8p8V
	JKMasqIZhibqZb0cLPtnNQ6Ckqpz0S5kDS9zpVJ4wH0Zy7jXIhhhGL8NxCt2688S
X-Gm-Gg: AYBFou2Sk+mgfq+Un0c+M5RQrwxNNBLxrGtS5r2QJHbmY9IxsNR5+VzPrch2Hq/gsFZ
	+icV0eMFaHJgK3gkIee6pQ4UseeXWSE+UsH2Iea0hbWJL4SUJ3K7qfP6opuItYAE+M0UGyIEjcq
	DK7SP3kEXe/Ox7aaOzjnibSNj6CLPNMwHlVxNoEK200pe5abKpQikGx2h26suqH0vnUPavfZviU
	CIseGX2P6xMf2ioQCKeyigXZ/o9ug61RSbqrE55oCvG9nUpjWEq0M9ISInIQm0K7I+Gm8OXAsu9
	QVk0oNfrnq7g2qYXdxBy2UTlqCpIDBRl5xS8Md7ykxC122a1Hxx96o/vnBEFVx+N4c/KjRG/n0v
	U9W8IT1styFkGFn/tr2zyN/sPkp3e3Fsvs2DA4HkqH7TGOjAk4aHDEG54ScIkAov6DgxM8SwZSp
	mT6B0QmJzSaI1UUuqIO6Eivb+WinLnFQNrGudd6Jhfno9AHMVy/7q7hjJIp7Ipm3A84ELz4+ogp
	v9Yx6At2o3qonwGt1wTGEvv+f69J1UFbKR1QxQiVioCv3HmvpT1
X-Received: by 2002:a05:600c:3f0d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1fdd29c19mr35588045e9.14.1792580015036;
        Wed, 21 Oct 2026 03:53:35 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:53:34 -0700 (PDT)
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
Subject: [PATCH v11 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed, 21 Oct 2026 12:47:24 +0200
Message-ID: <20261021105109.199886-7-l.scorcia@gmail.com>
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

