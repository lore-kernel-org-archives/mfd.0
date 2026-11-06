Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943583;
	b=3j+sHohb8qRZ98m+1nX8JIS0ZcbcjIHp0LTzKsPUFOtASQPzfNqRkfD/zqLAlgPz+B1c
	 TxGrZq5HfqnsKy6IsfGq4OI+7B6Dm243Mgdftc2yfJmcUMGsdDuJSvlu7dmLyLqgdN6b+
	 qnPbjVd4TfDfIJL9ser/W36iDrWe/GXvdV8Rizsl+kSWUtE9WcPh4bd2QKd8tXuK/yHtZ
	 7TlrxvZqeWLmvFolhamj6IRCO9p++VdpXXsVEFLvnfK93fY0NUWhhoutnDG1D8ZRU7oiC
	 YLtJpjnVwTmTQhYVjafcpq55DdmrJCr9hzRmuwRm/hqihSxvJyK+xubyYQzOM6zhAPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3CXsq8VgYvZgkVymR4JaK9jyQUC6b2rSS5BRoOawhtY=;
	b=JThZWv4uS1KxLPaIt9ipOU/XkdzhYiruQM/h7WskoE5wHTuCJqseWqLWgh8qB8Bd4ib9
	 AcLbZtPWADuEgKoD/2Hlei1isnbjn8e8unZsPO9MiAFYVH5RbKimhATLr6sVvYwAG/xAj
	 9wPu4q86n6ert2wAzc8KlBR/MB1GxA36dSzNWii4giIHQd2e5lVDkzJOHWXOD79Tn5sx2
	 VpfzAOfIik9C4xwUO1fA6YIFVgqVc8EIG5ZTJntDGX4545tVm7giuWkM5/nR1Cbw0D9Lf
	 XPcHf4eatQgNYtqtnoE9VeRa38B0/r6Apjhwbo/X8QJf3d1uWGJUZEKc13NWzkp/vGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S0d1SN5L;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5304606A32D
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 05:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5304606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S0d1SN5L
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a315ed211so342979eec.0
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 21:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793943582; x=1794548382; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CXsq8VgYvZgkVymR4JaK9jyQUC6b2rSS5BRoOawhtY=;
        b=S0d1SN5LjmufrRptV4laGJGYe9cDEDhJJMZGU/zEUQPm4BvZcxt6R5Q5JIJDYq3A2M
         SAyYeemkH8BlIKG50un1S4V7Ke0voySnzoaRUn+XW3xUr36BiA97tuDwzMyaxonv+dCr
         vaBomtndJzihS9GbjDIz4/1eLrOf2RCKSBDfGriptK4YvEKqt3hHGsFp90GQ0rW3x+HM
         7dchRO6U7zqx8pOeu3LFAtbRDv7eKjA2rh3PzFnrP9WVqypMdBxBPj1BiWwrvHTcpWrA
         dsCU2Dis3XxYD9YN1ffIeP9hRk6zw7O1N5ns4gnZW9oDM/jkx7yNDYUFfrYC3puzWPKR
         /rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943582; x=1794548382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CXsq8VgYvZgkVymR4JaK9jyQUC6b2rSS5BRoOawhtY=;
        b=AfUf8Km9mm4batRiHwoi8PmmVi2Bpvp/Cb9aCGQgKJY2GSeLSNHdg5hSnlmNLsq8ec
         bBC9PnIYLP+2tn40LriH93R9PRAhSg2RBm1drWZ7mlr4kdtLkytcL/9LsfUWo1+oN2sE
         e/PPQiTHrrd8h9ErxTSRMg7tSh7lLLYOfDNmyPR7UCEFX1OcZYolCy4zBF0FVWn9T8HE
         WjgKATLnuLDx1cBS5NnB4BfdpGOZRI11JIysCmImuxpbCVrOJDyM3FPzL4OiKuwfa7LZ
         bANIJbW3oseH7i8+991zey/uYR8H7nIH2FPz7KZ+ISFOHiGyEDvDTtouY3cCJJT/dR8z
         gg3w==
X-Forwarded-Encrypted: i=1; AL+hErGJ6RaSCPM+GtikBQz1/GkHIT7OXxXIIS9vK0QVoFJeVXFHV0bqiLacruPz//hn3QjNe6M=@lists.linux.dev
X-Gm-Message-State: APuU4Z+PqBpKwpBuSrT0bJilZfMno5q7vOf54qxBtSOI70q0fM4UVofG
	YcqOKI7BNFXva1FbLCFs7o+13yo2lbL91UKSalnx6ljJSm3ABDMLTDzG
X-Gm-Gg: AYBFou3iOe7aCSCUxnbySy03WAnOmv5QhbGrkQMu6CCr77/RaruD2b6nZxdAu79eLCD
	tZY3sCqqwAP5/b9BF8TVtPIowNZInfJKAWpvuANxBVAU6V21Fc8nYBS1a7yfbGhgimCC9xt/8jL
	HBrgJ2BZAeypo/iuY3nRGQpABV8N0+AAgvlFYLNOGTeXyB43T+QQ4FmMB9mSOv2xuRjBd6qRQgR
	LUeQC0yUdTAX4SY11FX0xv/jofVzosgbjjn06NaVxgqKGEogRBlME0TF6Rc+0X/JKRAaXnNCeMv
	5imWTd4C3B27Vub9fYzJn/5DlTcXJipT/64b5axneVWIyt1Pcv9kMbqWspJ27cqXnwUSOGiYgS+
	LmtuZrj9GuwlNbgzj+wuxjMIx7vuVvxhS6wevoxcbFz/AGht922dxOEijMH+Nj6SRXfAbr6MFbt
	AHGy+pUYdGk8SWdOwauFQWygvVnOMWQq/TJPXvyf/Qzjr55AmACkQXG97m7XXr1S1YNNj43Nnac
	06T491ft50l2BmyDtwRwD/oOIo7sjc3koQT4rmsxuLFrzKCcKHPfzEACkANU9hsyJncUd5e05bQ
	hoXT2WpoeTDkCdL1S0IwGwmWjUHYKlgm+HY3t6Vhse7SBMn9+ruO694943CZzJpto3qI0YoXLKR
	iubvkBUnCsX+I6zTR
X-Received: by 2002:a05:7301:90d:b0:36d:6a77:960a with SMTP id 5a478bee46e88-36f73893ca9mr2063176eec.1.1793943581818;
        Thu, 05 Nov 2026 21:39:41 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm6126445eec.3.2026.11.05.21.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:39:41 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 21:39:33 -0800
Subject: [PATCH 2/4] ASoC: arizona: always parse device properties
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
Message-Id: <20261105-arizona-asoc-v1-2-25ec7338446e@gmail.com>
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

Always parse device properties in the Arizona jack detection driver and
codec drivers even when platform data is provided, allowing DT, ACPI,
or software node properties to augment platform data configurations.

In the jack detection driver, initialize the headphone detect channel
from existing platform data before querying device properties so an
absent property does not clobber it with the default channel. Preserve
existing boolean platform data flags using bitwise OR assignments.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/codecs/arizona-jack.c | 27 ++++++++++++++-------------
 sound/soc/codecs/cs47l24.c      |  3 +--
 sound/soc/codecs/wm5102.c       |  3 +--
 sound/soc/codecs/wm5110.c       |  3 +--
 sound/soc/codecs/wm8997.c       |  3 +--
 sound/soc/codecs/wm8998.c       |  3 +--
 6 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 6587d46a1867..d5f14fc8af7f 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -1184,7 +1184,7 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 					   struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
-	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
+	unsigned int val = pdata->hpdet_channel ?: ARIZONA_ACCDET_MODE_HPL;
 	int ret;
 
 	device_property_read_u32(arizona->dev, "wlf,hpdet-channel", &val);
@@ -1213,21 +1213,23 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
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
@@ -1242,8 +1244,7 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 	struct arizona_pdata *pdata = &arizona->pdata;
 	int ret, mode;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_extcon_device_get_pdata(dev, arizona);
+	arizona_extcon_device_get_pdata(dev, arizona);
 
 	info->micvdd = devm_regulator_get(dev, "MICVDD");
 	if (IS_ERR(info->micvdd))
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index 09cef46f09fc..6965a2ec7642 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1222,8 +1222,7 @@ static int cs47l24_probe(struct platform_device *pdev)
 	if (!cs47l24)
 		return -ENOMEM;
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	platform_set_drvdata(pdev, cs47l24);
 
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index bd747171212e..f7aaf1433ad7 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2041,8 +2041,7 @@ static int wm5102_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5102);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	mutex_init(&arizona->dac_comp_lock);
 
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 73c4ffabf4ec..58bcd54aff11 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2403,8 +2403,7 @@ static int wm5110_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5110);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm5110->core.arizona = arizona;
 	wm5110->core.num_inputs = 8;
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index c126afb65928..877305a83283 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1119,8 +1119,7 @@ static int wm8997_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8997);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8997->core.arizona = arizona;
 	wm8997->core.num_inputs = 4;
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index fdb2018e9367..28af93104201 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1346,8 +1346,7 @@ static int wm8998_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8998);
 
-	if (!dev_get_platdata(arizona->dev))
-		arizona_get_audio_pdata(arizona);
+	arizona_get_audio_pdata(arizona);
 
 	wm8998->core.arizona = arizona;
 	wm8998->core.num_inputs = 3;	/* IN1L, IN1R, IN2 */

-- 
2.56.0.506.g506a7eabc5-goog

