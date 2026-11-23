Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474869;
	b=gF8UnZG98AoGda11gXkfnIvaQ2OSXnQ0ATNVGvuqL/xLHmqzomRGWiPssAu3q3yIcCNW
	 +phVGvJ5xtaPRaf3G6y7yhCFHyjKmqJDAldMg8DfByQPQXi16KGs+jqjdxCreZxz6T0xN
	 OmSelu/UFogmlDX4jBIXp3f5T1+Ok5kItOgort2cXrnP8tnd9xFWeoXOLGeg/P2cXv1D2
	 btEGsGBKmXPG4KEKRvrk+5vwbs4rNg4p2WkRXPUb2PTNTO02AsT34p/Lmcgh8iCRW1Zk9
	 ZRb3G7D7lbR33Tpwa7kdFMwYW0ZjckGUFoqp0d/WXf6PJtq/wm/0vk7ixS9CwHXySug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GNl5OQSsBr2T4ULhkBC7jgjCRs6CpsVbXafS/oZDDFw=;
	b=fhi05nAg42PscRGZ+taueCHE553XLancCjlihee17MXe9hL9NX8M51rrImDEl6oQoEkQ
	 PvTUNG7beJlEItTSmBpOrcKpMqrGL8K+S5XTGDdApUfU2azJwT3hp12Y/eggAc2H4CN/6
	 lbDhjM7NuB/cuOXtuaSBaq5RBDxsaThGYrmCPHckyzZm/6O4n/LBfDvsSJ52DGv3RmBQg
	 KbWGBsOvjdDf9Tck5cFH4cy8ko+C4LTpmNnNND24pfVdpABRtupEoElpnFyjZ/g6Tadxq
	 T0ln+YfTOtSCkqVEteNcND0V1nJ+ph7rXKA0qqufEXe5vEl9VAQw0dK8Q18zkCHy1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMI1yWFO;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D4F606A33B
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 23:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16D4F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zMI1yWFO
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38699cf08dfso3985898eec.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474868; x=1796079668; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNl5OQSsBr2T4ULhkBC7jgjCRs6CpsVbXafS/oZDDFw=;
        b=zMI1yWFOAuZkrwDEzXFFyAYPhCsvCZH8nUy13wwzQOMpYse5j/2hWQSI5OfPoI6oir
         Vf/IUyJOWQPyIUEcUfx3pw269b6PZxeq3lK0R6rijKioiFFBTOapefZMFEj9HuZ5ATfi
         ISS/cLj+lXZ0/7p44RpLmxHhlKButKik8aZh6SaCL7TIEF23CjXeau6GZOTihuElxSio
         9Tsrpygtly8pd3EXNlcemBfE6UXLSd8v/bOu16p288n50wJSZDzSnTIS5jKttzdaGvYU
         j7hROMvksfPytui9NDSWX5d/AqpITNjYAhs0pb7k36zve5RUrm77tEvU6pu83/HHvd5h
         zGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474868; x=1796079668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNl5OQSsBr2T4ULhkBC7jgjCRs6CpsVbXafS/oZDDFw=;
        b=zYWQi0jHs4LgxHEgd35hxylfVwYcHDQrNcw6WS6HaLaFLcvL7xBjpPpHjdb9wl9F6E
         18Y9mX+GA7ZaGh5mOFd2x/vjGAvO3PFHGJg9/G8cz7IUVQcbXNQicwPsRsxNvYwJEfa3
         0vHooMK1PQgcYs3YwpfBzhEr4VG/pRK/vYDb41btC34UPq06iHdkxoroJUcI/7TMKOpu
         IuN9CKQkrx0E18dTyib1zqqq1zvj7EOHCFjSMiW2QpTciozyf7zHsUNp+bLYKgm7Q5Fz
         sJyJPPymg7buJs2s8qNg3tL/e4BafyBXfZgwCAXgaHcV7B1ypmducvj4eVEdNRR2vdWF
         XJxQ==
X-Forwarded-Encrypted: i=1; AL+hErFDthE12BdIcKg/x/RXS2cZ7niNpk2n7R+gBLIsWdIV+/gwyID6owGQp25mqyOOesD3YL4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8yeVksE+4wmXvqhXIzx4rh58EDyd1ocPsAgH/go5r2knO9lLFZ
	M0DGdPu9BJ9wct4BDoONm/Q3IuBiZx8CijGrInYuaLF8xET9VLyIXwtk
X-Gm-Gg: AZFdTZeCA/MurJ5+SoSG9EOI+HaDo1aGSqJrdUCP7hyLlRlLR+VbeOUPYwOhzP4r6pG
	TRYqcz0Ox02t8i/9CVF3qWfggg6DQwjudMSg8JMM7SDgPPJL5MtdG2U17bg9oflM+M/4l16XGqE
	4gorpFawPA3eX/O6axQGyDzgFmGBwiIbVuC120wJr6kXZWtRT9DBbt/0Cd16UKpndQTSQxAZyIx
	qoEKhfrZV930oGUTp/B7QWt37VHvP69zHiY8KeY1/e6Q4zYu06/6dLIxMfQmbN0dkBMc43DH6UE
	HsCIuo1WpVgjByyjkQCS9iCAMVaw2iQuLiIneVZzRHvZzctp2d3v7bUa49W5HtLaw/pxkFC2LHG
	K8q7LIjfo6ZNvYUXMA+8cqTmSJd3qnTKJWwwl/dSGOKhn/A/6V2Efz8AfURcD7hl3gEKQe18HEf
	cX/czbamz9QB+YkWAQCRaww3twV5nkaYBejEP0nXd28u6eWojHfZnTuTPoFAs7H2i/KyWOJsS3u
	e4VHpN9iH0Wdt6N/ti1qvnOXLyJlZjRbOrOpoi3dFvNuf0OvzMrhAgTPTpN/6qU9/POsUZA+Zxz
	00L21/M1QqLVMlEjfXJeYmxzsIbkGSV8fv0cOcuVmf4J8qn0k1TRGEqT2DytLSfuk8CsTE6Tu/8
	5UIkils3gZl0M4G4/8A==
X-Received: by 2002:a05:7301:d183:b0:386:a728:6c11 with SMTP id 5a478bee46e88-386a72872d3mr6899216eec.17.1795474867633;
        Mon, 23 Nov 2026 15:01:07 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:06 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Nov 2026 15:00:54 -0800
Subject: [PATCH v2 1/4] ASoC: arizona: convert audio pdata parsing to
 generic device properties
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
Message-Id: <20261123-arizona-asoc-v2-1-6323d3c0961a@gmail.com>
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

Switch audio platform data parsing in the shared Arizona ASoC helper
from OF-only property APIs to generic device property APIs so audio
parameters can be provided via software nodes or ACPI in addition to
Device Tree.

Align the audio configuration array types in struct arizona_pdata with
generic property types so properties can be read directly into platform
data, using boolean storage for out-mono flags and bounded array reads
that preserve unspecified trailing elements. Drop the CONFIG_OF guards
and obsolete error checks around the audio property parsing calls in all
Arizona codec drivers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/mfd/arizona/pdata.h |  15 ++---
 sound/soc/codecs/arizona.c        | 121 +++++++++++++++++++-------------------
 sound/soc/codecs/arizona.h        |   2 +-
 sound/soc/codecs/cs47l24.c        |   9 +--
 sound/soc/codecs/wm5102.c         |   9 +--
 sound/soc/codecs/wm5110.c         |   9 +--
 sound/soc/codecs/wm8997.c         |   9 +--
 sound/soc/codecs/wm8998.c         |   9 +--
 8 files changed, 79 insertions(+), 104 deletions(-)

diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index d465dcd8c90a..984b2edfec07 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -11,6 +11,7 @@
 #include <dt-bindings/mfd/arizona.h>
 #include <linux/regulator/arizona-ldo1.h>
 #include <linux/regulator/arizona-micsupp.h>
+#include <linux/types.h>
 
 #define ARIZONA_GPN_DIR_MASK                     0x8000  /* GPN_DIR */
 #define ARIZONA_GPN_DIR_SHIFT                        15  /* GPN_DIR */
@@ -100,7 +101,7 @@ struct arizona_pdata {
 	 * useful for systems where and I2S bus with multiple data
 	 * lines is mastered.
 	 */
-	unsigned int max_channels_clocked[ARIZONA_MAX_AIF];
+	u32 max_channels_clocked[ARIZONA_MAX_AIF];
 
 	/** GPIO5 is used for jack detection */
 	bool jd_gpio5;
@@ -150,7 +151,7 @@ struct arizona_pdata {
 	int num_micd_configs;
 
 	/** Reference voltage for DMIC inputs */
-	int dmic_ref[ARIZONA_MAX_INPUT];
+	u32 dmic_ref[ARIZONA_MAX_INPUT];
 
 	/** MICBIAS configurations */
 	struct arizona_micbias micbias[ARIZONA_MAX_MICBIAS];
@@ -161,19 +162,19 @@ struct arizona_pdata {
 	 * wm5102/wm5110/wm8280/wm8997: [0]=IN1 [1]=IN2 [2]=IN3 [3]=IN4
 	 * wm8998: [0]=IN1A [1]=IN2A [2]=IN1B [3]=IN2B
 	 */
-	int inmode[ARIZONA_MAX_INPUT];
+	u32 inmode[ARIZONA_MAX_INPUT];
 
 	/** Mode for outputs */
-	int out_mono[ARIZONA_MAX_OUTPUT];
+	bool out_mono[ARIZONA_MAX_OUTPUT];
 
 	/** Limit output volumes */
-	unsigned int out_vol_limit[2 * ARIZONA_MAX_OUTPUT];
+	u32 out_vol_limit[2 * ARIZONA_MAX_OUTPUT];
 
 	/** PDM speaker mute setting */
-	unsigned int spk_mute[ARIZONA_MAX_PDM_SPK];
+	u32 spk_mute[ARIZONA_MAX_PDM_SPK];
 
 	/** PDM speaker format */
-	unsigned int spk_fmt[ARIZONA_MAX_PDM_SPK];
+	u32 spk_fmt[ARIZONA_MAX_PDM_SPK];
 
 	/** Haptic actuator type */
 	unsigned int hap_act;
diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 7c296c5b24f7..46e2ca48e70f 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -11,8 +11,8 @@
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/tlv.h>
@@ -2799,77 +2799,76 @@ int arizona_lhpf_coeff_put(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(arizona_lhpf_coeff_put);
 
-int arizona_of_get_audio_pdata(struct arizona *arizona)
+static int arizona_get_variable_u32_array(struct device *dev,
+					  const char *propname,
+					  u32 *dest, size_t n_max)
 {
-	struct arizona_pdata *pdata = &arizona->pdata;
-	struct device_node *np = arizona->dev->of_node;
-	u32 val;
-	u32 pdm_val[ARIZONA_MAX_PDM_SPK];
-	int ret;
-	int count = 0;
-
-	count = 0;
-	of_property_for_each_u32(np, "wlf,inmode", val) {
-		if (count == ARRAY_SIZE(pdata->inmode))
-			break;
-
-		pdata->inmode[count] = val;
-		count++;
-	}
+	int n, ret;
 
-	count = 0;
-	of_property_for_each_u32(np, "wlf,dmic-ref", val) {
-		if (count == ARRAY_SIZE(pdata->dmic_ref))
-			break;
-
-		pdata->dmic_ref[count] = val;
-		count++;
-	}
+	n = device_property_count_u32(dev, propname);
+	if (n < 0) {
+		if (n == -EINVAL)
+			return 0;	/* missing, ignore */
 
-	count = 0;
-	of_property_for_each_u32(np, "wlf,out-mono", val) {
-		if (count == ARRAY_SIZE(pdata->out_mono))
-			break;
-
-		pdata->out_mono[count] = !!val;
-		count++;
+		dev_warn(dev, "%s malformed (%d)\n", propname, n);
+		return n;
 	}
 
-	count = 0;
-	of_property_for_each_u32(np, "wlf,max-channels-clocked", val) {
-		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
-			break;
-
-		pdata->max_channels_clocked[count] = val;
-		count++;
-	}
+	if (!n)
+		return 0;
 
-	count = 0;
-	of_property_for_each_u32(np, "wlf,out-volume-limit", val) {
-		if (count == ARRAY_SIZE(pdata->out_vol_limit))
-			break;
+	if (n > n_max)
+		n = n_max;
 
-		pdata->out_vol_limit[count] = val;
-		count++;
+	ret = device_property_read_u32_array(dev, propname, dest, n);
+	if (ret < 0) {
+		dev_warn(dev, "Failed to read %s (%d)\n", propname, ret);
+		return ret;
 	}
 
-	ret = of_property_read_u32_array(np, "wlf,spk-fmt",
-					 pdm_val, ARRAY_SIZE(pdm_val));
-
-	if (ret >= 0)
-		for (count = 0; count < ARRAY_SIZE(pdata->spk_fmt); ++count)
-			pdata->spk_fmt[count] = pdm_val[count];
-
-	ret = of_property_read_u32_array(np, "wlf,spk-mute",
-					 pdm_val, ARRAY_SIZE(pdm_val));
-
-	if (ret >= 0)
-		for (count = 0; count < ARRAY_SIZE(pdata->spk_mute); ++count)
-			pdata->spk_mute[count] = pdm_val[count];
+	return n;
+}
 
-	return 0;
+void arizona_get_audio_pdata(struct arizona *arizona)
+{
+	struct arizona_pdata *pdata = &arizona->pdata;
+	u32 out_mono[ARRAY_SIZE(pdata->out_mono)];
+	int i, n, ret;
+
+	arizona_get_variable_u32_array(arizona->dev, "wlf,inmode",
+				       pdata->inmode,
+				       ARRAY_SIZE(pdata->inmode));
+
+	arizona_get_variable_u32_array(arizona->dev, "wlf,dmic-ref",
+				       pdata->dmic_ref,
+				       ARRAY_SIZE(pdata->dmic_ref));
+
+	n = arizona_get_variable_u32_array(arizona->dev, "wlf,out-mono",
+					   out_mono, ARRAY_SIZE(out_mono));
+	for (i = 0; i < n; i++)
+		pdata->out_mono[i] = !!out_mono[i];
+
+	arizona_get_variable_u32_array(arizona->dev, "wlf,max-channels-clocked",
+				       pdata->max_channels_clocked,
+				       ARRAY_SIZE(pdata->max_channels_clocked));
+
+	arizona_get_variable_u32_array(arizona->dev, "wlf,out-volume-limit",
+				       pdata->out_vol_limit,
+				       ARRAY_SIZE(pdata->out_vol_limit));
+
+	ret = device_property_read_u32_array(arizona->dev, "wlf,spk-fmt",
+					     pdata->spk_fmt,
+					     ARRAY_SIZE(pdata->spk_fmt));
+	if (ret && ret != -EINVAL)
+		dev_warn(arizona->dev, "Failed to read wlf,spk-fmt (%d)\n", ret);
+
+	ret = device_property_read_u32_array(arizona->dev, "wlf,spk-mute",
+					     pdata->spk_mute,
+					     ARRAY_SIZE(pdata->spk_mute));
+	if (ret && ret != -EINVAL)
+		dev_warn(arizona->dev, "Failed to read wlf,spk-mute (%d)\n", ret);
 }
-EXPORT_SYMBOL_GPL(arizona_of_get_audio_pdata);
+EXPORT_SYMBOL_GPL(arizona_get_audio_pdata);
 
 MODULE_DESCRIPTION("ASoC Wolfson Arizona class device support");
 MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index 0703182d87b3..499891e62183 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -388,7 +388,7 @@ static inline int arizona_unregister_notifier(struct snd_soc_component *componen
 	return blocking_notifier_chain_unregister(&arizona->notifier, nb);
 }
 
-int arizona_of_get_audio_pdata(struct arizona *arizona);
+void arizona_get_audio_pdata(struct arizona *arizona);
 
 int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev);
 int arizona_jack_codec_dev_remove(struct arizona_priv *info);
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index fa2d01ead30b..4c09b476b77a 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1221,13 +1221,8 @@ static int cs47l24_probe(struct platform_device *pdev)
 	if (!cs47l24)
 		return -ENOMEM;
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	platform_set_drvdata(pdev, cs47l24);
 
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 762e81979cb8..35b7c034b517 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2040,13 +2040,8 @@ static int wm5102_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5102);
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	mutex_init(&arizona->dac_comp_lock);
 
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index faa85d88a489..312c55ab7cd5 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2402,13 +2402,8 @@ static int wm5110_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm5110);
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	wm5110->core.arizona = arizona;
 	wm5110->core.num_inputs = 8;
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index f041dfc905a4..4d0c3a54bd16 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1118,13 +1118,8 @@ static int wm8997_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8997);
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	wm8997->core.arizona = arizona;
 	wm8997->core.num_inputs = 4;
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 1158e9ca40a1..3ae19f03f29a 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1345,13 +1345,8 @@ static int wm8998_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, wm8998);
 
-	if (IS_ENABLED(CONFIG_OF)) {
-		if (!dev_get_platdata(arizona->dev)) {
-			ret = arizona_of_get_audio_pdata(arizona);
-			if (ret < 0)
-				return ret;
-		}
-	}
+	if (!dev_get_platdata(arizona->dev))
+		arizona_get_audio_pdata(arizona);
 
 	wm8998->core.arizona = arizona;
 	wm8998->core.num_inputs = 3;	/* IN1L, IN1R, IN2 */

-- 
2.56.1.809.ga0b61035b5-goog

