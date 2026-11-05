Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875737;
	b=zlvXR1buM7gZ59JCfbGmOOsPVVD6w02/9s59E6GxaJfRu9RQYEySHMfh6Z0rOmbHJLvC
	 AkON1nBddJO9KNo5lRygMTE0Pr6oARBo3Mh6PeZHi9synm8hSsi/WB/zOCYOB9ELZ5jvm
	 APylguuaV8nLdRZmQ6ZKdUefjc51r1TlNa02vp1yKm9Gm1bmkr1sj5GdVJ6aNtRsXLwmF
	 nvlqZi+RvmYGcFaLylaq9dj4pqz2hAUFzOk401s2bal29UIOG5KBRVdI5mqaDZLm+s7vr
	 tdWc/Bjwn2aM5CWfB90d9g4Og4iGvFtYV6L2zNzBOBGkj15IxX1ZIRxSdfUuqyT8VBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iWGSJscDaLHZIUihJSVeO44X9gc9sEn/J385HtptoN0=;
	b=KfPjXrcMrIXW7L654FuiK8TCMoKjg1TwKdctXDDsmB77MIM2edKYE7TcxxRz4smDLaOF
	 JSVaEqQUsgjpX1/NTjghrN8iD0Xd37cjuRDsR6JU5xQkHlZoutkQ07xkNGl7cHBBnz3nQ
	 qJY5vA0oT7AMFa6O9XYSrcTUwReNnmrZ5ZXNDUVVSWYvmQaDplDk9G9JI/6lqu+8LBRJe
	 hp28LCNkGHbM6ZCMACroppuyq1ORGkSoLV1dHwrTYuvr6URkHd+UrwESN2Q0gBpf+ZRIT
	 /CsRDFIbzPv2wR5/IIGqKDu+zvRSB3UMPaT6Osld+Axx5kauhCfrw//11kiydhEAaZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvB4ZF29;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E91E606A331
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 10:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E91E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvB4ZF29
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1380430f8f.0
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 02:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875735; x=1794480535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWGSJscDaLHZIUihJSVeO44X9gc9sEn/J385HtptoN0=;
        b=KvB4ZF294dkP+JiXMPtO2y2Max3I0010wSEDewhJmsc08Czp/OXHVSqyp8kQ9/1y5G
         pf4WXuXlPuDYO4Yil5NFoWxNmYoJ3eLY8IVEQ05p//uGErdydRW8Eo5rbo23z+mVwn4D
         Bwo2VarcqGwzDPsR7OjEay10uyV4MUBgMJaFbLMIbfOAfmwr7/fWIQ8De/FSxBDJg5HQ
         6Yuy93jMdWXofsmrADWsAOvj5myJ+elyZSs893V7p2aSO5Pl3X4qWktI6C9J2Ddd2pJR
         o8XxF5LU+dtSgqLzMEhdR72dhjDBPH5ZmSZrhJsEOPrN08l29MfYWcWuzjXouZVU+dLK
         B04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875735; x=1794480535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWGSJscDaLHZIUihJSVeO44X9gc9sEn/J385HtptoN0=;
        b=FfcsEy7NZin/azqKtJS+7SlyCnFu+RIAPoQvJKEIp7jQGKnuac1njrhKp47h7Xk9Ew
         UaG9k4f4TaaaiehLWz8dk0G8RDzjdqXQnjd1bai+3Sb/lrqr+qecb3NLdMGkhDGekNzJ
         JxqufH8IZh7syiHdXjV7Cyv7cUen7dAktEQ8ho451dHTa18rzLsvmJDncmAzTmJD00Ak
         0NMgmLStqUhfL4f8uSOGPRNGygcvtRMWgIHzMobyhhXhXgtiDRfQP/wZ1eV6fR8d00CM
         2iLbJYRo3o6eImdyyCsG87y+Qu1nmH9JWGV5qyMuyRthAVy+IMyo1k4r6L47oALzXrka
         oGCg==
X-Forwarded-Encrypted: i=1; AKwUvBzXX+kW7rwZyAqiHao7C6MXnHVdxH0J9DpTVNhWqaAgs8B5rdXRwKGKsHAPPprtA9ftWEI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8szoZUQwa9XZAqE62BJhl0HVWR7qOj6uTfjLWJZoQFp9cpf/er
	1xe/Wwi/QI2MpBA4Myu5EgtysbZrFdmAXXAoEzW6uVlmDBQspj1Zpfper3KXc60cFDA=
X-Gm-Gg: AYBFou2ch0ZDVZMxPRbnz6lo5APJJoYvHGW1eImAulVnzFCx7FZ1X5oXIU1cxOSvSbW
	inmxk9681H5wc8Nn9dsBHB5CUeFlaEx4PaUagBwjobtOKACjSwT+D3R8/fE/runB2r3sLCOW/Mf
	h5CONE3J3IuCm5t0ssTChmMGaWHwYiw1by1OLC0YuQZuG/uzuI9q3LLT14Ltntc4uPdn3AQ/B7m
	/r/rszA2tDXrqoLpEUco7smWyXnmSLwZVYJf/DfiV5mNdr3NCIrNG8PTAN2KgvfcUVuSJzGxXtF
	o0kH63Do3huRKgTk5Ren66bTZLy/gpHDAZZ2YNZsyNGzbOyPwTR921Bccqe+/XDdgJVJ4ZvIfYo
	vv9+0eWrzBBjA+oZ2SIpMyOrTd1pVbKXYeIIf/hxi+rh9EMwX8yITMyKGdLeUp7EuhYz4lkbsRA
	3T9E+tkED6RUcJKVlqSY7h8b3CwrElQZCqB+bVP3XOeJpcWmXuM1eK/Edf0r9E8IoYEOsCxitDp
	FkzfBCI/dVdEZFpNgNioHj8iSU3F2kE9V1rARmiQDQaoh04sOZFNDyHVPTgNnHO5yp6XILSOOCT
	6Sc8h+Opj7wcBrRnGR0nqD/d
X-Received: by 2002:a5d:5d05:0:b0:48e:38e:3102 with SMTP id ffacd0b85a97d-48e6e4f692cmr41112254f8f.29.1793875734675;
        Thu, 05 Nov 2026 02:48:54 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm10384627f8f.45.2026.11.05.02.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:48:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
Date: Thu,  5 Nov 2026 11:31:05 +0100
Message-ID: <20261105104837.1105227-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Use the MFD_CELL_* macros to describe sub-devices. No functional changes.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch was previously submitted as part of the mt6392 series [1], but
it can be merged independently and does not introduce any other change.
The mt6392 series will be rebased and sent out again without this change.

This patch has been rebased on v7.4-rc1 and line width has been adjusted
for 100-char limit to keep items on a single line where possible.

[1] https://lore.kernel.org/linux-mediatek/20261021105109.199886-1-l.scorcia@gmail.com/

 drivers/mfd/mt6397-core.c | 180 ++++++++------------------------------
 1 file changed, 37 insertions(+), 143 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 5d5f816492aa..6fbc2445dc3b 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -124,168 +124,62 @@ static const struct resource mt6323_pwrc_resources[] = {
 };
 
 static const struct mfd_cell mt6323_devs[] = {
-	{
-		.name = "mt6323-auxadc",
-		.of_compatible = "mediatek,mt6323-auxadc",
-	}, {
-		.name = "mt6323-efuse",
-		.of_compatible = "mediatek,mt6323-efuse",
-	}, {
-		.name = "mt6323-rtc",
-		.num_resources = ARRAY_SIZE(mt6323_rtc_resources),
-		.resources = mt6323_rtc_resources,
-		.of_compatible = "mediatek,mt6323-rtc",
-	}, {
-		.name = "mt6323-regulator",
-		.of_compatible = "mediatek,mt6323-regulator"
-	}, {
-		.name = "mt6323-led",
-		.of_compatible = "mediatek,mt6323-led"
-	}, {
-		.name = "mt6323-keys",
-		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
-		.resources = mt6323_keys_resources,
-		.of_compatible = "mediatek,mt6323-keys"
-	}, {
-		.name = "mt6323-pwrc",
-		.num_resources = ARRAY_SIZE(mt6323_pwrc_resources),
-		.resources = mt6323_pwrc_resources,
-		.of_compatible = "mediatek,mt6323-pwrc"
-	},
+	MFD_CELL_OF("mt6323-auxadc", NULL, NULL, 0, 0, "mediatek,mt6323-auxadc"),
+	MFD_CELL_OF("mt6323-efuse", NULL, NULL, 0, 0, "mediatek,mt6323-efuse"),
+	MFD_CELL_OF("mt6323-rtc", mt6323_rtc_resources, NULL, 0, 0, "mediatek,mt6323-rtc"),
+	MFD_CELL_OF("mt6323-regulator", NULL, NULL, 0, 0, "mediatek,mt6323-regulator"),
+	MFD_CELL_OF("mt6323-led", NULL, NULL, 0, 0, "mediatek,mt6323-led"),
+	MFD_CELL_OF("mt6323-keys", mt6323_keys_resources, NULL, 0, 0, "mediatek,mt6323-keys"),
+	MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0, "mediatek,mt6323-pwrc"),
 };
 
 static const struct mfd_cell mt6328_devs[] = {
-	{
-		.name = "mt6328-regulator",
-		.of_compatible = "mediatek,mt6328-regulator"
-	}, {
-		.name = "mt6328-keys",
-		.num_resources = ARRAY_SIZE(mt6328_keys_resources),
-		.resources = mt6328_keys_resources,
-		.of_compatible = "mediatek,mt6328-keys"
-	},
+	MFD_CELL_OF("mt6328-regulator", NULL, NULL, 0, 0, "mediatek,mt6328-regulator"),
+	MFD_CELL_OF("mt6328-keys", mt6328_keys_resources, NULL, 0, 0, "mediatek,mt6328-keys"),
 };
 
 static const struct mfd_cell mt6357_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6357-auxadc"
-	}, {
-		.name = "mt6357-regulator",
-	}, {
-		.name = "mt6357-rtc",
-		.num_resources = ARRAY_SIZE(mt6357_rtc_resources),
-		.resources = mt6357_rtc_resources,
-		.of_compatible = "mediatek,mt6357-rtc",
-	}, {
-		.name = "mt6357-sound",
-		.of_compatible = "mediatek,mt6357-sound"
-	}, {
-		.name = "mt6357-keys",
-		.num_resources = ARRAY_SIZE(mt6357_keys_resources),
-		.resources = mt6357_keys_resources,
-		.of_compatible = "mediatek,mt6357-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0, "mediatek,mt6357-auxadc"),
+	MFD_CELL_NAME("mt6357-regulator"),
+	MFD_CELL_OF("mt6357-rtc", mt6357_rtc_resources, NULL, 0, 0, "mediatek,mt6357-rtc"),
+	MFD_CELL_OF("mt6357-sound", NULL, NULL, 0, 0, "mediatek,mt6357-sound"),
+	MFD_CELL_OF("mt6357-keys", mt6357_keys_resources, NULL, 0, 0, "mediatek,mt6357-keys"),
 };
 
 /* MT6331 is always used in combination with MT6332 */
 static const struct mfd_cell mt6331_mt6332_devs[] = {
-	{
-		.name = "mt6331-rtc",
-		.num_resources = ARRAY_SIZE(mt6331_rtc_resources),
-		.resources = mt6331_rtc_resources,
-		.of_compatible = "mediatek,mt6331-rtc",
-	}, {
-		.name = "mt6331-regulator",
-		.of_compatible = "mediatek,mt6331-regulator"
-	}, {
-		.name = "mt6332-regulator",
-		.of_compatible = "mediatek,mt6332-regulator"
-	}, {
-		.name = "mt6331-keys",
-		.num_resources = ARRAY_SIZE(mt6331_keys_resources),
-		.resources = mt6331_keys_resources,
-		.of_compatible = "mediatek,mt6331-keys"
-	},
+	MFD_CELL_OF("mt6331-rtc", mt6331_rtc_resources, NULL, 0, 0, "mediatek,mt6331-rtc"),
+	MFD_CELL_OF("mt6331-regulator", NULL, NULL, 0, 0, "mediatek,mt6331-regulator"),
+	MFD_CELL_OF("mt6332-regulator", NULL, NULL, 0, 0, "mediatek,mt6332-regulator"),
+	MFD_CELL_OF("mt6331-keys", mt6331_keys_resources, NULL, 0, 0, "mediatek,mt6331-keys"),
 };
 
 static const struct mfd_cell mt6358_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6358-auxadc"
-	}, {
-		.name = "mt6358-regulator",
-		.of_compatible = "mediatek,mt6358-regulator"
-	}, {
-		.name = "mt6358-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	}, {
-		.name = "mt6358-sound",
-		.of_compatible = "mediatek,mt6358-sound"
-	}, {
-		.name = "mt6358-keys",
-		.num_resources = ARRAY_SIZE(mt6358_keys_resources),
-		.resources = mt6358_keys_resources,
-		.of_compatible = "mediatek,mt6358-keys"
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0, "mediatek,mt6358-auxadc"),
+	MFD_CELL_OF("mt6358-regulator", NULL, NULL, 0, 0, "mediatek,mt6358-regulator"),
+	MFD_CELL_OF("mt6358-rtc", mt6358_rtc_resources, NULL, 0, 0, "mediatek,mt6358-rtc"),
+	MFD_CELL_OF("mt6358-sound", NULL, NULL, 0, 0, "mediatek,mt6358-sound"),
+	MFD_CELL_OF("mt6358-keys", mt6358_keys_resources, NULL, 0, 0, "mediatek,mt6358-keys"),
 };
 
 static const struct mfd_cell mt6359_devs[] = {
-	{
-		.name = "mt6359-auxadc",
-		.of_compatible = "mediatek,mt6359-auxadc"
-	},
-	{ .name = "mt6359-regulator", },
-	{
-		.name = "mt6359-rtc",
-		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
-		.resources = mt6358_rtc_resources,
-		.of_compatible = "mediatek,mt6358-rtc",
-	},
-	{ .name = "mt6359-sound", },
-	{
-		.name = "mt6359-keys",
-		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
-		.resources = mt6359_keys_resources,
-		.of_compatible = "mediatek,mt6359-keys"
-	},
-	{
-		.name = "mt6359-accdet",
-		.of_compatible = "mediatek,mt6359-accdet",
-		.num_resources = ARRAY_SIZE(mt6359_accdet_resources),
-		.resources = mt6359_accdet_resources,
-	},
+	MFD_CELL_OF("mt6359-auxadc", NULL, NULL, 0, 0, "mediatek,mt6359-auxadc"),
+	MFD_CELL_NAME("mt6359-regulator"),
+	MFD_CELL_OF("mt6359-rtc", mt6358_rtc_resources, NULL, 0, 0, "mediatek,mt6358-rtc"),
+	MFD_CELL_NAME("mt6359-sound"),
+	MFD_CELL_OF("mt6359-keys", mt6359_keys_resources, NULL, 0, 0, "mediatek,mt6359-keys"),
+	MFD_CELL_OF("mt6359-accdet", mt6359_accdet_resources, NULL, 0, 0,
+		    "mediatek,mt6359-accdet"),
 };
 
 static const struct mfd_cell mt6397_devs[] = {
-	{
-		.name = "mt6397-auxadc",
-		.of_compatible = "mediatek,mt6397-auxadc",
-	}, {
-		.name = "mt6397-rtc",
-		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
-		.resources = mt6397_rtc_resources,
-		.of_compatible = "mediatek,mt6397-rtc",
-	}, {
-		.name = "mt6397-regulator",
-		.of_compatible = "mediatek,mt6397-regulator",
-	}, {
-		.name = "mt6397-codec",
-		.of_compatible = "mediatek,mt6397-codec",
-	}, {
-		.name = "mt6397-clk",
-		.of_compatible = "mediatek,mt6397-clk",
-	}, {
-		.name = "mt6397-pinctrl",
-		.of_compatible = "mediatek,mt6397-pinctrl",
-	}, {
-		.name = "mt6397-keys",
-		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
-		.resources = mt6397_keys_resources,
-		.of_compatible = "mediatek,mt6397-keys"
-	}
+	MFD_CELL_OF("mt6397-auxadc", NULL, NULL, 0, 0, "mediatek,mt6397-auxadc"),
+	MFD_CELL_OF("mt6397-rtc", mt6397_rtc_resources, NULL, 0, 0, "mediatek,mt6397-rtc"),
+	MFD_CELL_OF("mt6397-regulator", NULL, NULL, 0, 0, "mediatek,mt6397-regulator"),
+	MFD_CELL_OF("mt6397-codec", NULL, NULL, 0, 0, "mediatek,mt6397-codec"),
+	MFD_CELL_OF("mt6397-clk", NULL, NULL, 0, 0, "mediatek,mt6397-clk"),
+	MFD_CELL_OF("mt6397-pinctrl", NULL, NULL, 0, 0, "mediatek,mt6397-pinctrl"),
+	MFD_CELL_OF("mt6397-keys", mt6397_keys_resources, NULL, 0, 0, "mediatek,mt6397-keys"),
 };
 
 struct chip_data {
-- 
2.43.0

