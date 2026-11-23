Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474871;
	b=CQ9QRLXERFoc740m+dGUU/MTbrLSlA5uXPOfMBzuZ5VobebG6kwr2pxU4VP2RNUXOG4+
	 ZoosenMes3QpXBj9X+V5y6Lb/8a33n5g/D32BR+yHwVJY5dBzVpeR3ro8hxj0aIDCi3pD
	 F0OShFCymEryeo9bcFvgVPl3pCnWxfVss83+qgHtXszfCl1U8EWfXmC1bsiU6rdw6yFR0
	 LAE+Gxn3vhCBgRZHcRGzxdYqF1KnIiKezd2FtxM24drH2mgTmc92G3knWF82de/0L2vyt
	 0bqMaKMTH/bmHkEb1aMOIyrM7kgol/MVRYPCxaIZEnegKeohzdupQK+DfNyoN7KPaEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dgtdwwb3WutHlhNR2d7t/1yGsgE+Dr/udMHlhEjkers=;
	b=KcpU33UrOzwIQY85JBHmVUrRUGBlppGhvESkxt6RwZuQTO+BVDEbISP9LagLI+Kd7wp7
	 JxNB0Wq2coyy8eNWhZgNQ5Jyf2Ye6lHjJhHWtZTmbjGYaEOVMkGVVETHRpzM1J4g1oisw
	 /PtSA090+eM0+0yokfJhwx0UDVKtgfA3AYb3rfqDWnW4shqcRg5gBxmzWYQeWI36yZG3Z
	 cnDbU563CGIUUS+tx2OhwjO2gdIfDGUvQ2IEFUzaAqfUV7p85rJWOux9ofdY/QJV6gh3c
	 Vs4yV8yp8N5QAl03I7CCaRxBaGnAGTwgi7DWV08Q0qwmcSXaHpUyW+2IzMakjxut7AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/hjFQ8+";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05190606A686
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 23:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05190606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/hjFQ8+
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3863db981d4so5193165eec.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474870; x=1796079670; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgtdwwb3WutHlhNR2d7t/1yGsgE+Dr/udMHlhEjkers=;
        b=m/hjFQ8+P7TbLk1EVQPm7tpuZcaLAb5rG8J2fZbFElSmNr0Zfg9g7EcbC8lrbc4AJd
         JVx22/YCwVASCHhbKnj1uainHnupwzeuss3WwQPbmt5YQ8hl4+aCK4k6DiArTn/LuTZ8
         xgzd98CYcvQTdUjeObLwjOIzb8207nj5ZnEYSfdOsaNHM9oTf8k3EZnXAGeFXVogOwPD
         3+m3MfU1onxgqnDm/40zD80UUU0J2Mw+bFpIho4DVw4FYHE2BBU8cjpbR+uOuZ7xIRlc
         ksJfpRSvVwtFGqpK6tr9Js8Vrk70JvDwM2C96e7f5dcO0UuvrQiImA5ZyUzy+AsKI092
         jbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474870; x=1796079670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgtdwwb3WutHlhNR2d7t/1yGsgE+Dr/udMHlhEjkers=;
        b=WANNWpMvIsbgNF485krBYPMWkwfiErybD9J0C9v+mo7KEd/LX3G34XTeBWHBiVAuO2
         x+f2GE23/hwYOjDSVYE0xkcfUjV+KT9FRcNTXtZCIK7W0Lozl2gQyqhuoD9eph3Jy0kn
         qkB+wLavMyKYBUO5POn89oOwRHQrT4kQP9lMz+EM8NoEPRRvZnqKnfAusINwBGjTH5UL
         7P1N0j3SpB416R+q9WpjYkWuaWPxVe5ErJ9gpRAI6GA/f9aLRFdcA6s0zR2vHP00/RKI
         NjjRa1mPrCxp66gda2j6YfOBVZ/yvFsQjegLhTizRor4/ka9Kr72a0zt574pj4GinTdM
         2b2g==
X-Forwarded-Encrypted: i=1; AL+hErEEFUtQYR7t3OeIEDJ45uwy/wlMJnpeu4kX6GxgoCMb95o1Un5YpqJzuKWGY3ee+GdD4K8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/M/c2IEz5AS/cu2eH+Qk8PilZ+pHmjlmHYNyiCCRx1Md7ZAO+Q
	4eqWIbcwfvJgVbVPKmCwL++mVD685aS6pYvkMmY+x8ryMtkdceDuvJtR
X-Gm-Gg: AZFdTZfoCJFoJ7Q5aODoUYJ5wzcS9gedQlNB6qGjGfZLnL7V5A9JYrkaCy6zYxU0XCx
	ucY30rmyhg1ZPEE4r9P5jRSha43w9gTyDw4+jVi0zJXa/kqnfOF6MZnTF8Yz+++VNFRadv3ZeDw
	0MSpVG7ueUZ39N7MLdEuzFkdM2Gkb+cU427fYVcNBKIOnB5sMlG6hbKWNPHFVldFI7gHpLx4Ryz
	sOJIvLHNHqon9Seo1CB0x3RsqVvpFch1swCYJ5zZ7MA6x/GHKIkQ8fNHEzuApMEgwNLFMG2DrxE
	79dyKbwTIVDUuIN82sl/7St1FOn6mczpTBZjmGeZK5pZXc30ahokb3ZnXw2TiY55uSecPPBblk8
	GpyYCnbeYOoSDYou5XpqH2qu8lRiQEAFn3DFY4ZK1LNmXKNDLarfvgGAmN6X47BbQvpq250eG7t
	nSAXwIzFyDHmuqW/tfV9jsCoWslxkk3fzYLcugGyskV3Ggtsph7wlFODVacmL8BCthqlP++vimq
	vVCydj9VQSuTy2W0CoQySo/e603PLzeV9Fo83BdqKQqw566Wl4Wj1WOCwkeX7YRipnlIAVLa2lD
	7rMqSaPOB855ntgl/J3aPusQK/8fTa3lptIpc/ZFyRuRNWpLMpC56NjU6o/T9cEhqi4EoZHxb01
	+OHO3EGy7m8c/WS9COg==
X-Received: by 2002:a05:7300:2202:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-3857170afa1mr19311351eec.38.1795474869816;
        Mon, 23 Nov 2026 15:01:09 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:08 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Nov 2026 15:00:55 -0800
Subject: [PATCH v2 2/4] ASoC: arizona: always parse device properties
 regardless of platform data
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
Message-Id: <20261123-arizona-asoc-v2-2-6323d3c0961a@gmail.com>
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

Always parse device properties in the Arizona jack detection driver and
codec drivers even when platform data is provided, allowing DT, ACPI,
or software node properties to augment platform data configurations.

In the jack detection driver, only validate and apply the
wlf,hpdet-channel property when it is present, leaving any existing
platform data value untouched when the property is absent or invalid,
and preserve existing boolean flags using bitwise OR assignments.

Default an unset headphone detection channel (0, corresponding to
ARIZONA_ACCDET_MODE_MIC and invalid for headphone impedance polling) to
ARIZONA_ACCDET_MODE_HPL during jack probe.
Commit 9e86b2ad4c11 ("extcon: arizona: Add support for select
accessory detect mode when headphone detection") originally placed this
default only in the OF property parser, inadvertently leaving
platform-data boards that omit the channel setting at 0.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 50 +++++++++++++++++++++++------------------
 sound/soc/codecs/cs47l24.c      |  3 +--
 sound/soc/codecs/wm5102.c       |  3 +--
 sound/soc/codecs/wm5110.c       |  3 +--
 sound/soc/codecs/wm8997.c       |  3 +--
 sound/soc/codecs/wm8998.c       |  3 +--
 6 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index db60ea1aaec8..f36d314a6a54 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -1183,18 +1183,20 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 					   struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
-	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
+	unsigned int val;
 	int ret;
 
-	device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
-	switch (val) {
-	case ARIZONA_ACCDET_MODE_HPL:
-	case ARIZONA_ACCDET_MODE_HPR:
-		pdata->hpdet_channel = val;
-		break;
-	default:
-		dev_err(arizona->dev, "Wrong wlf,hpdet-channel DT value %d\n", val);
-		pdata->hpdet_channel = ARIZONA_ACCDET_MODE_HPL;
+	if (!device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val)) {
+		switch (val) {
+		case ARIZONA_ACCDET_MODE_HPL:
+		case ARIZONA_ACCDET_MODE_HPR:
+			pdata->hpdet_channel = val;
+			break;
+		default:
+			dev_err(arizona->dev,
+				"Wrong wlf,hpdet-channel DT value %d\n", val);
+			break;
+		}
 	}
 
 	device_property_read_u32(arizona->dev, "wlf,micd-detect-debounce",
@@ -1212,21 +1214,23 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 	device_property_read_u32(arizona->dev, "wlf,micd-timeout-ms",
 				 &pdata->micd_timeout);
 
-	pdata->micd_force_micbias = device_property_read_bool(arizona->dev,
-						"wlf,micd-force-micbias");
+	pdata->micd_force_micbias |=
+		device_property_read_bool(arizona->dev,
+					  "wlf,micd-force-micbias");
 
-	pdata->micd_software_compare = device_property_read_bool(arizona->dev,
-						"wlf,micd-software-compare");
+	pdata->micd_software_compare |=
+		device_property_read_bool(arizona->dev,
+					  "wlf,micd-software-compare");
 
-	pdata->jd_invert = device_property_read_bool(arizona->dev,
-						     "wlf,jd-invert");
+	pdata->jd_invert |= device_property_read_bool(arizona->dev,
+						      "wlf,jd-invert");
 
 	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
 
-	pdata->jd_gpio5 = device_property_read_bool(arizona->dev,
-						    "wlf,use-jd2");
-	pdata->jd_gpio5_nopull = device_property_read_bool(arizona->dev,
-						"wlf,use-jd2-nopull");
+	pdata->jd_gpio5 |= device_property_read_bool(arizona->dev,
+						     "wlf,use-jd2");
+	pdata->jd_gpio5_nopull |=
+		device_property_read_bool(arizona->dev, "wlf,use-jd2-nopull");
 
 	ret = arizona_extcon_get_micd_configs(dev, arizona);
 	if (ret < 0)
@@ -1241,8 +1245,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	struct arizona_pdata *pdata = &arizona->pdata;
 	int ret, mode;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_extcon_device_get_pdata(dev, arizona);
+	arizona_extcon_device_get_pdata(dev, arizona);
 
 	info->micvdd = devm_regulator_get(dev, "MICVDD");
 	if (IS_ERR(info->micvdd))
@@ -1286,6 +1289,9 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 		break;
 	}
 
+	if (!pdata->hpdet_channel)
+		pdata->hpdet_channel = ARIZONA_ACCDET_MODE_HPL;
+
 	if (!pdata->micd_timeout)
 		pdata->micd_timeout = DEFAULT_MICD_TIMEOUT;
 
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index 4c09b476b77a..744a610cd1af 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1221,8 +1221,7 @@ static int cs47l24_probe(struct platform_device *pdev)
 	if (!cs47l24)
 		return -ENOMEM;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	platform_set_drvdata(pdev, cs47l24);
 
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 35b7c034b517..b52f1d30c3c0 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2040,8 +2040,7 @@ static int wm5102_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5102);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	mutex_init(&arizona->dac_comp_lock);
 
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 312c55ab7cd5..34a6ef555530 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2402,8 +2402,7 @@ static int wm5110_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5110);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm5110->core.arizona = arizona;
 	wm5110->core.num_inputs = 8;
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index 4d0c3a54bd16..f4608c1f16bb 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1118,8 +1118,7 @@ static int wm8997_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8997);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8997->core.arizona = arizona;
 	wm8997->core.num_inputs = 4;
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 3ae19f03f29a..9eb82d46346c 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1345,8 +1345,7 @@ static int wm8998_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8998);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8998->core.arizona = arizona;
 	wm8998->core.num_inputs = 3;	/* IN1L, IN1R, IN2 */

-- 
2.56.1.809.ga0b61035b5-goog

