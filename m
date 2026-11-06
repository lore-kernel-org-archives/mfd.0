Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943586;
	b=1q21gorjErhxlZhwiFB+iSd3CuKgaCmfnQNBuifwBH1gpxxSnxWaMKiqKkMot799d+S+
	 b31Q+oszBokr+J3RbYgfzPzKJMcj3CrUlvcil5ImAV91HbT+Me6xJyi6FpMZJ7KoSLC7K
	 9AybZ6K9LIrQ3rqh5hX09y49D6Gx3jmVVJqPgj341w7dq9qDkdXRrWyquxCmDrmD4gwX3
	 DoVzWf2EuMKXj4E4gXrfTCB4/+pG5q967zpwj3qEwC3rr1kf/icVRTRX5U1QpEAzDwpbC
	 tMxtLa8pZyZALYLx70mGtk7wDy0oEoN7ak+F8EAU8xiwQJBI7Mvb+ZdJH5yVaRqtGhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=i0xp37LpmrAlgRcxvQDad9Lq/cKsDvG5Q5zwfdyzMEU=;
	b=01Mqp20oPiXg7dAWyyTEvGAlph8Dh3CJXzzHsCUhDGp3+2m6C7fPwnCqh1jfb03yNlMz
	 6UDL3CxrvgsYVUqkWbwoxgBjXZ4r50MgaLKo/L6G+TgP1lSic7pe41WAs47cIgbbQFqtO
	 bDznVL88+ULdZwrj2/hqbmt4z4MOv7V147IAfYU82k/eqgs6WyGPpIsW3tCciGoSnQ9mt
	 tqBDDFrLA2x6mj6FXg4LMXEC+n3ZATC7uDQuVDuvWT9Z7m1mDh47e56pJcCEIunYQqQLR
	 09viCOjvNxvTPSYcntuWyyLX7XovTnbkI3JlcbEMuw49F4sWzrUqqZ5pLS9eemLhx4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=reSz868W;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02182606A32E
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 05:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02182606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=reSz868W
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso481858eec.0
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 21:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943585; x=1794548385; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i0xp37LpmrAlgRcxvQDad9Lq/cKsDvG5Q5zwfdyzMEU=;
        b=reSz868WTGr/KpNa81MnK1V40Yj9WO5b5a2q42QMRFtQ2K1x2rcim/E00Awu8BTsMj
         FQNmzVpfxxOv2nPl0LK8IA0L/tjqnWahktLQraWFyge/cWfy5fwG6x7bogl0B9UryJsp
         wktVH3ElTFUPkVlSpdGzg+G5yCyj0WXGvzFNDsxKKx9pA7gT5NpkmByT4rAwuUK96yyF
         3/Td3fOyJjt9xrRLtaB6y7oYHRoMSPFLLZnz/2CzE+y5D0/Q76kg5CvckO4n8zZvOm92
         d/aj2tp1WgzI8cRoQR/V9oi5OmPXN2deahZUd+xzRXxkOQ2l42W6B/lsVW0NmIZoLCcJ
         ZfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943585; x=1794548385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0xp37LpmrAlgRcxvQDad9Lq/cKsDvG5Q5zwfdyzMEU=;
        b=nLyT08epJ8wDDBxfuwZTWJKUL4XVSApT9naccBeEqFzCl0PMIYKKxFFN8bdWqIV3ku
         E65GVV2IK1/fM02ed9QwtO1m6VvDwgoiU/JbBh3NvoLFBrTBKATKv7vh4khe395un5/3
         qZUAW5aMImxRJjOB/F7c74J4OomjuHSOPKy7xTXbhoF+kr8I5pRorG3TQ0UzkmziBxxE
         9DqimbWSCY7O6h6d04mawD6FNZ63VA3aVpeFRJ+IDy3BXeRRPcU8hVDXvTv/4JofBI2P
         3RKdtWgEfNVpRMsts+FEC33VyT1b1TVLyqRSXg3UzenP7TeKAWAbY9O8AFQlm8Kc51Kn
         ++3Q==
X-Forwarded-Encrypted: i=1; AKwUvByY/UyfRtAGhWOKc4NqUGrLaZtiLDT14mPWzxXGSCRVfxzaz32LQTWyliDKPBDxXZY/t1I=@lists.linux.dev
X-Gm-Message-State: APuU4Z9GL80jXLfYXIgZ3iVOw8uIRnas8jkPR30LRnRVedJssgiLsO6/
	IoPWNJkBFiS4E4qTMHUGxuc3r+H9fSIVV33B4FExJUn0yxrj/W+uUGze
X-Gm-Gg: AYBFou2a73fE1oaKP0FS154Ba59SlHR7e011kIbo93U+sJC6X3NpRyFDm5xl798PVQ2
	OpgvWHIFgnnLx1rs7ADcqbHiO83zGDvDEJYnovE54tvPITOteeUI16STnxRzksuxyKLrxnzsdPK
	khNG3loCGRyFfw3T0pg+Qt868jeOgSyp4PoTDoJnWH2Ypcbm/GtVkcpP5hsC/Ag+nLEDy/wjP+G
	NAUznmRAmyAe/YAOxqRtvXOONrJ0GCAThA+6xgXgiU3R5PAsN76hnMLE1LLMvMaAZSnNhVQr/gs
	y0/DIFNaeB6uJQFKBQHGDb31oRurpNZHiQp81tCks1WteGtQMHZ6ZCIjl1pv3JnbsYV/9xdwOYM
	Otx1rigAG67SRHdTVLLsrOnh/7rvGc2d6BZLqJV3Y309qINrW6JiyLGxHSZxJv9zkHnZScouaSP
	E0kGlYW0u9I04pzUJGKXdr41wOJ7ocXAiH5ejAu2iH6fv3cmpuwy1F9wvopHN0BxO+diDGt3zvW
	dIbXBGWALJNm/BO9AHg8QnlojSP2mfCbd/Btyr9ZD3w6rZkqO9KUkxT53wXmjqBqXMAJ4qjVMyj
	fClsnFPWnLgRVX09Qmle5uA+eeASfNy/BDJvNAwkCrsYCMi5uiweRKmqQx5e9A4qOX58Ymd6bGV
	bnMS8qDRqXuBpYYcx1A==
X-Received: by 2002:a05:693c:8843:b0:36e:58f3:6f0e with SMTP id 5a478bee46e88-36f72cc191fmr2106289eec.5.1793943585023;
        Thu, 05 Nov 2026 21:39:45 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:44 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 21:39:35 -0800
Subject: [PATCH 4/4] ASoC: arizona: clean up coding style and formatting
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
Message-Id: <20261105-arizona-asoc-v1-4-25ec7338446e@gmail.com>
References: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
In-Reply-To: <20261105-arizona-asoc-v1-0-25ec7338446e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, Lee Jones <lee@kernel.org>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.17-dev-e56a4

Clean up minor coding style issues in the Arizona jack detection
driver, removing redundant parentheses and fixing argument continuation
alignment.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 737984c206a9..ba1701e79c9b 100644
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
@@ -1139,7 +1138,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 
 	if (arizona->pdata.gpsw > 0)
 		regmap_update_bits(arizona->regmap, ARIZONA_GP_SWITCH_1,
-				ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
+				   ARIZONA_SW1_MODE_MASK, arizona->pdata.gpsw);
 
 	if (info->micd_modes[0].gpio)
 		mode = GPIOD_OUT_HIGH;
@@ -1151,9 +1150,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
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
@@ -1185,13 +1182,13 @@ static int arizona_jack_enable_jack_detect(struct arizona_priv *info,
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
2.56.0.506.g506a7eabc5-goog

