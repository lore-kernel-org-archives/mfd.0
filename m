Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474878;
	b=H1WxCzL6hWJghdPd3OBe2acsIgncB/KdvGxSHGuQQN2rDZdasNI3NYcmZ4RVpPai/e90
	 scGYdSMZW5sEmya1HOWd6IaEZkfkKIPcEjHG6KXAJOObEoxFRV6yYioneIwWGfTyBxl3m
	 4xw3JOHYEijrlwnHLe/neUps/QvIz3qU0N2mE4tbFdNLldyWHFSLCCtyT21ucLRiyoVmC
	 /poLY4jRRs+6n04AVPzWDTc8sugGeNQkGJsiWc3nS8oBH33qZ/ew/aoDyCTbdA/UmUflF
	 4U+SBo2FBdbEZiySyNvBWxtQFuVVDHu6TjcG90Kjl+XHe2dcjT2onIjU+dkacDw70NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fhqNj5xrThDOL0uCWjCUGvkw8GyT0Wc2ZFXSoJZgs0s=;
	b=KneHJ35yqILnTx93CaqEqkKyXdc0+0ye4HdQ+6QP9WE4OKEq5f9VfNnIYxUP2pE8eT8S
	 wj4x72Vek3YfJ1WEJM616Mf8eEX7wTZxYwGGbSq3BqrAq5x5ly+Q3pAvGQYJvc+o9VFYL
	 00RPHZb03bprKHv9YPjcD2SnuuTr7DjFKVzc2L92LQnZEOy+OjYYFNSxvxlWwXz1mauvF
	 2VnnJnvIWHhhV2wDXoZ7MN49e0iKvsEUPz7aq/cs/7gsw6copHcQo28I2fTGkwvM2/WJa
	 BEXYTXA434M87eP/5ycvYLLczJLYm0Vqv9ry0I94KQq5Ig/h8H5rM+Ptq4DhRl0XS/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XaG2RkQL;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867B3606A68C
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 23:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867B3606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XaG2RkQL
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38190551625so7939631eec.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474878; x=1796079678; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhqNj5xrThDOL0uCWjCUGvkw8GyT0Wc2ZFXSoJZgs0s=;
        b=XaG2RkQLjjl6hBpi+CW9P3cMuSgD2V3mA799tFl1BPk7gEEAXED7hBQ2bXwW2cmz0V
         NU5M86Y6jntl8Q9Cl/qoi9+6IJ8NQ5NOisBEMCwWkZPAH52Zx1lc06dWv2mmYTaT9Z/K
         +UaiqlkpBI/2aEYiDThZv57QsxKpOgjBRcX/4B3l+8lWUwGdjFx7d0jldFbY6gP9hAsO
         h2qtFRP/tWZBXAOmcfClDwTQZVHA9ux4142KgXhOGqXVo5m662lFCB8YrsQBSfGe+OM7
         VZK800M0hLKG3gxg+/KjhDChxu6xqTWB/d4+926Un5ctTCLNZo8P9TDx9m1XKj76MgDI
         d0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474878; x=1796079678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhqNj5xrThDOL0uCWjCUGvkw8GyT0Wc2ZFXSoJZgs0s=;
        b=YqxgWcDlve/h+t3eqdG0Sh5STjMVXFvhjjiKrz2lxtvErOeLPfMNzGvsnTrkMRdQno
         ErLi8Drtlnj9UR9wEJLGuoPJQ3SkS/4eGA+nQTHJ7E9e/aKu1yQfNhMXcTSin1IAjBok
         etPnN55Cr2gDMHJBDaQUxd9RNjBbUv9w769C8M0kxpCoNoq2XIbiN87FNuhu9VJVWcDk
         uvK/W9Tw2UGAn0IrVd+rz6XraIPokIwPHZ4hm79iKLPUHUMWZM1VJCmbUfid6F2nSp2u
         dl4jtuD89tq4NbOcpfyNPZwtwZubXW0gx4bR9qElDw0sM0JXPQSUS79itm3ExlDUPGc7
         4IuA==
X-Forwarded-Encrypted: i=1; AL+hErEZZOznBDBtNkwp9bJVx80cUHUY9UwKwpXXySJbMG9ImQy6ABmzhYm3oVntt75kNsL1hys=@lists.linux.dev
X-Gm-Message-State: APuU4Z/tvI1KOFiiE2KGMDFVPxUKRy3tw8mKyTqlBhbs8oqchPi1YKgq
	xuM2+UletnYMsVAuOXH0k5bdXrOl9vYCQhYDeeopdaIfe32WprnbxuYr
X-Gm-Gg: AZFdTZcEYdXaBkH93VzYlX/IrGveVSL/r2il2l8iJQITZ/2hyzgxlhVSBr5kJB7GKmw
	PvpUpWTSyw4Vh1VT9Z+cQkc999s/dQeJa5o9C8SRGuboNTtY1T0JbeXpYXVNH8bwOOf+HvbeCzb
	BQAYwENxBJQfWGPnFcEhLmy9getfzn18Fj2Bag21/axjmyftFLjYQYkBJ63CUdFlTKnM+QtuSBi
	lRYQcK/47sE/dTj9pTXWcYHYUs0+fVad5m9V/ACUB35d18dSlH3YRRhI6HzX0FZGUcwgWfTS9U1
	mSeaLF5B9DrB1to4Ve8BL2OtN6JCAAc74nN3DaGh67SoSYaa7WcbCRUKQ5QqZq42as7/a0QIQ0d
	xIH51nODw9pYCg1YQTJOmo9OhaQp90KQJ56iyjz86BwGmNIuTGjbilw8X7yjEiJEvokh3QS6Lcn
	bHEUINuHBy9BNeGQcBI0zOSaLk/3d02DnxX75P9/AhvU5kBJN+58xE+rpWDYk46oKXfjx1mLpfY
	a/+fZm2eOQt6QiT360S38/FP34dfXofPynB3Kw5fft5jQAFeUakb01K9UB6Q9gLbkktHmtzNHAK
	j7wfoMRnry9J5qiBD++Co21CGa16GToDEwUE/PUus78qo7wJSjY0t8awsFjnfDZqxcLFsNIq5yW
	NvRE9jf488/HudhXxYQ==
X-Received: by 2002:a05:693c:808b:b0:386:3535:1dd with SMTP id 5a478bee46e88-3863535052amr11576876eec.12.1795474876743;
        Mon, 23 Nov 2026 15:01:16 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:15 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Nov 2026 15:00:57 -0800
Subject: [PATCH v2 4/4] ASoC: arizona: clean up coding style and formatting
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-arizona-asoc-v2-4-6323d3c0961a@gmail.com>
References: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
In-Reply-To: <20261123-arizona-asoc-v2-0-6323d3c0961a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-dd645

Clean up minor coding style issues in the Arizona jack detection
driver, removing redundant parentheses and fixing argument continuation
alignment.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 5650a7f47ede..6f2286eb7cbe 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -423,7 +423,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 
 		/* Skip up a range, or report? */
 		if (range < ARRAY_SIZE(arizona_hpdet_c_ranges) - 1 &&
-		    (val >= arizona_hpdet_c_ranges[range].max)) {
+		    val >= arizona_hpdet_c_ranges[range].max) {
 			range++;
 			dev_dbg(arizona->dev, "Moving to HPDET range %d-%d\n",
 				arizona_hpdet_c_ranges[range].min,
@@ -436,7 +436,7 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 			return -EAGAIN;
 		}
 
-		if (range && (val < arizona_hpdet_c_ranges[range].min)) {
+		if (range && val < arizona_hpdet_c_ranges[range].min) {
 			dev_dbg(arizona->dev, "Reporting range boundary %d\n",
 				arizona_hpdet_c_ranges[range].min);
 			val = arizona_hpdet_c_ranges[range].min;
@@ -833,8 +833,7 @@ static int arizona_hpdet_wait(struct arizona_priv *info)
 	int i, ret;
 
 	for (i = 0; i < ARIZONA_HPDET_WAIT_COUNT; i++) {
-		ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2,
-				&val);
+		ret = regmap_read(arizona->regmap, ARIZONA_HEADPHONE_DETECT_2, &val);
 		if (ret) {
 			dev_err(arizona->dev, "Failed to read HPDET state: %d\n", ret);
 			return ret;
@@ -1143,7 +1142,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 
 	if (arizona->pdata.gpsw > 0)
 		regmap_update_bits(arizona->regmap, ARIZONA_GP_SWITCH_1,
-				ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
+				   ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
 
 	if (info->micd_modes[0].gpio)
 		mode = GPIOD_OUT_HIGH;
@@ -1155,9 +1154,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	 * will reside, but if we devm against that the GPIO
 	 * will not be freed if the extcon driver is unloaded.
 	 */
-	info->micd_pol_gpio = gpiod_get_optional(arizona->dev,
-						 "wlf,micd-pol",
-						 mode);
+	info->micd_pol_gpio = gpiod_get_optional(arizona->dev, "wlf,micd-pol", mode);
 	if (IS_ERR(info->micd_pol_gpio)) {
 		ret = PTR_ERR(info->micd_pol_gpio);
 		dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
@@ -1189,13 +1186,13 @@ static int arizona_jack_enable_jack_detect(struct arizona_priv *info,
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_BIAS_STARTTIME_MASK,
 				   arizona->pdata.micd_bias_start_time
-				   << ARIZONA_MICD_BIAS_STARTTIME_SHIFT);
+					<< ARIZONA_MICD_BIAS_STARTTIME_SHIFT);
 
 	if (arizona->pdata.micd_rate)
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_RATE_MASK,
 				   arizona->pdata.micd_rate
-				   << ARIZONA_MICD_RATE_SHIFT);
+					<< ARIZONA_MICD_RATE_SHIFT);
 
 	switch (arizona->pdata.micd_dbtime) {
 	case MICD_DBTIME_FOUR_READINGS:

-- 
2.56.1.809.ga0b61035b5-goog

