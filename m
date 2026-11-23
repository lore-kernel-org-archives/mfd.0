Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474876;
	b=yi5sCTXW9ZAdXhjcwbL+DJZIxuHpAYCsbxOVf4yIpmflBkCzo79zBfyKVbAJD7MSxd0Y
	 XU2E7+cnLGWL1lI6c/Si5ojPfFhuJ8WIzV+Bd1yeO0nVUG7mNwptsf8y3TIRcOVQ42TaT
	 kqZSj7XpB9zpHVK0lDSQ5Or5ejTSmdPIkDb+mB3kNAIHecHD4AaDof3jRIeOsXfvsGbHq
	 HcByqvRqqsaPHzDuDhT7W8TxAgzFlR5KNxYwiHoIM2nzHPtirhG0THy5SZGK6cn2w4ak8
	 Y5+0DCz4/1Qd745dpLzaLnZSB17iiZEoB76B5uMBvsMVV3+p450foDrDmkPH/JgSUxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LVj/2IPCO/rsyUxwejJA/YKSv8ccPTCCNt+bis0ReOA=;
	b=GYkDDY0kBuUgC1bj+JiOhiWmk2H3izBCRwgzLH1iA7XNVXOhk64ZI51C4FzDj332Lp+A
	 ZkW55NvnvRaVJ17FEEgU4WHFQjALJ3+Xhc3qDTNpxYKEH7puXgZIqNpRWDC/U9adsHJ32
	 j2FLnFRKS8w5UqXthHLOQUlADyaQ35uROYNxDjCU2uYALm416ZRbstiZI9fssSu8UhllQ
	 vWhmO5k6WBl1kQyWZcRS1ogzLmwj1wjEpYfXrEA4MPKYhBFSV+Lxrk/8+SzVs9cDQY+gc
	 Q//VsFjIXoWq8dPn/Xa7ibdaGbccaPHZAbBwNpWzOkmir7FwK2/vJ1o63EeO21pa5cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xidRuOpl;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2003606A334
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 23:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2003606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xidRuOpl
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3ada81853so4446701c88.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474875; x=1796079675; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVj/2IPCO/rsyUxwejJA/YKSv8ccPTCCNt+bis0ReOA=;
        b=xidRuOplW6a/EH00Sa7u9q9hunpz6cCVt4xdX/8FMBcEelGqYsnMxc6XqrTUc2Agvf
         dhjEssK2avgdaEaG4TWa40++ZfTxX78uaRukgkicBfMnJv6kcK5Ugn1ojrDAcq7gsAvS
         hu8cuHiT06TNaBVrZRufd3vzqnr5Nwma68dJH4SFGWIF7URRxVL+PIsX7bw9RdT2bxXo
         lJ6aj8ZoYFNVE9diuBzQV9ZtgZVSGZCktdd43vZ4ntWtt0jAiEQAWcMHm47W1Q1lUOB4
         gLcuJh+qHL8jjpVxAMM9YofloXgld8N3aGv0U4rQRaLM6gXZKBJuuhn1Bktg2S6+2U/a
         pgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474875; x=1796079675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVj/2IPCO/rsyUxwejJA/YKSv8ccPTCCNt+bis0ReOA=;
        b=X/aaH90p3yONQ0h8zW78AvP9N8KZKRhuJxspB5a3r5QscgbavenAsUfft2qgW/Wkzg
         ladm/eXdqjEX5eQjaD2C7qPeXxaR35emUvXf9EgpYuiygfZvzbSIR+yUUj1GXbPS6nvA
         IDfsQPRTbjy6sKwCrtr1+5gKyt80PlAdtdzzCGkOtSs0de38QbXu9g5DvkJLeWaEyYhw
         S73+wd/9P4mQy88F6fmL6xQN+E5PMYEJi+Ngx6+b7RmPZOVUzjwZHKEixKp0FDjcJNS0
         ioC0FIDSdMQlUo9wixFv+7kKIGwurBBAtK21DXGEAXxo7ANHGVKl2Olxl0LXSEYnIn04
         vrVA==
X-Forwarded-Encrypted: i=1; AL+hErETKM+ePEGc02vmsbaomIwmnoKVEJFjVzpUXWEp9QNKAV+1foxjoOCEWnIRdqMQ5Mc88hw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8vtsB3QKMtU4iWqDieNyiwx47OpDN90sr7fMK2TTb7RXYB+6S5
	0stHpMz+yKLUoSy5H/NZ5y0H6w15dTLHpdNTWopqtJ7GXIxni5VZY4rq
X-Gm-Gg: AZFdTZeXv9/KTdJ6JwGizLHYk0Ws6QwkFNyQyRJ17s7JyUBtMCc3/6B0pubw0M0q9CI
	MbUE5trd5uTnbNFoUWX97x70fbqZroni6FX7nHnE2PwL2akRzBSiutOGlB/jYPFmHrOPCsPCJhT
	yuJGEhpTmnCdQ9HYPIEUfEp/cSvm7rw5G9A03mMmHH2+H1jkQI1u9QOd5k0yMfMC3rHEzRoeved
	hs8MHYc8KorJgYNCu+5CfWWYOekEHxOWkgVcysU8oMSV2ViByHknDKqz200OwgHjhNflXV6XGge
	Zh0aXVl93EMw7syPY9UKUd9bVYRGxldUgw4T2IgLIC07/lfq6pjGU9t4YjlBG93r1WaS19RpxT8
	G6L2cbgKdsELjbdW3+TOCeUCLbFHFFwYjnV0Dg+h41TPOQCTR4ymNVH0e7L+2v0kE93PH+0flPj
	KTzfsQ85k1qRfs3fNRm9qONQ362z1q8RXGI+lprYLS63hGaCpUZpWGrWreOKcv4/RBmdIb5dmF9
	rAu2puKjSSi0wivosLU4q5JO0vvbTcQtHjNy5cQXcrV07IKtUo4jx5Mk4XrK2FQaI+txHCll0ae
	9JooHjc5+6541hpc+U1aNvNqrC+Fs/4ZybK2d25Hf6h65te8r31XOOAPmNjlZZM9qJEaI6oZSQe
	edfyvotXKKhw2BuDpAg==
X-Received: by 2002:a05:693c:88d4:20b0:386:a8de:2bfc with SMTP id 5a478bee46e88-386a8de2f67mr5900155eec.6.1795474874471;
        Mon, 23 Nov 2026 15:01:14 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41359262eec.22.2026.11.23.15.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:01:11 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Nov 2026 15:00:56 -0800
Subject: [PATCH v2 3/4] ASoC: arizona: drop unused HPDET accessory ID
 support
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
Message-Id: <20261123-arizona-asoc-v2-3-6323d3c0961a@gmail.com>
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

Nothing in the kernel sets hpdet_acc_id or hpdet_acc_id_line in
struct arizona_pdata, and neither has any Device Tree or ACPI bindings.

Remove both platform data fields and all exclusively connected HPDET
accessory identification logic, work items, GPIO lookup, and state from
the Arizona jack detection driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/mfd/arizona/pdata.h |   6 --
 sound/soc/codecs/arizona-jack.c   | 181 +-------------------------------------
 sound/soc/codecs/arizona.h        |   6 --
 3 files changed, 4 insertions(+), 189 deletions(-)

diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index 984b2edfec07..96ef9c97d4cc 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -112,12 +112,6 @@ struct arizona_pdata {
 	/** set to true if jackdet contact opens on insert */
 	bool jd_invert;
 
-	/** Use the headphone detect circuit to identify the accessory */
-	bool hpdet_acc_id;
-
-	/** Check for line output with HPDET method */
-	bool hpdet_acc_id_line;
-
 	/** Channel to use for headphone detection */
 	unsigned int hpdet_channel;
 
diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index f36d314a6a54..5650a7f47ede 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -45,7 +45,6 @@
 
 #define ARIZONA_HPDET_MAX 10000
 
-#define HPDET_DEBOUNCE 500
 #define DEFAULT_MICD_TIMEOUT 2000
 
 #define ARIZONA_HPDET_WAIT_COUNT 15
@@ -92,8 +91,6 @@ static const int arizona_micd_levels[] = {
 	1257, 30000,
 };
 
-static void arizona_start_hpdet_acc_id(struct arizona_priv *info);
-
 static void arizona_extcon_hp_clamp(struct arizona_priv *info,
 				    bool clamp)
 {
@@ -455,79 +452,11 @@ static int arizona_hpdet_read(struct arizona_priv *info)
 	return val;
 }
 
-static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
-			       bool *mic)
-{
-	struct arizona *arizona = info->arizona;
-
-	if (!arizona->pdata.hpdet_acc_id)
-		return 0;
-
-	/*
-	 * If we're using HPDET for accessory identification we need
-	 * to take multiple measurements, step through them in sequence.
-	 */
-	info->hpdet_res[info->num_hpdet_res++] = *reading;
-
-	/* Only check the mic directly if we didn't already ID it */
-	if (info->hpdet_id_gpio && info->num_hpdet_res == 1) {
-		dev_dbg(arizona->dev, "Measuring mic\n");
-
-		regmap_update_bits(arizona->regmap,
-				   ARIZONA_ACCESSORY_DETECT_MODE_1,
-				   ARIZONA_ACCDET_MODE_MASK |
-				   ARIZONA_ACCDET_SRC,
-				   ARIZONA_ACCDET_MODE_HPR |
-				   info->micd_modes[0].src);
-
-		gpiod_set_value_cansleep(info->hpdet_id_gpio, 1);
-
-		regmap_update_bits(arizona->regmap, ARIZONA_HEADPHONE_DETECT_1,
-				   ARIZONA_HP_POLL, ARIZONA_HP_POLL);
-		return -EAGAIN;
-	}
-
-	/* OK, got both.  Now, compare... */
-	dev_dbg(arizona->dev, "HPDET measured %d %d\n",
-		info->hpdet_res[0], info->hpdet_res[1]);
-
-	/* Take the headphone impedance for the main report */
-	*reading = info->hpdet_res[0];
-
-	/* Sometimes we get false readings due to slow insert */
-	if (*reading >= ARIZONA_HPDET_MAX && !info->hpdet_retried) {
-		dev_dbg(arizona->dev, "Retrying high impedance\n");
-		info->num_hpdet_res = 0;
-		info->hpdet_retried = true;
-		arizona_start_hpdet_acc_id(info);
-		pm_runtime_put(arizona->dev);
-		return -EAGAIN;
-	}
-
-	/*
-	 * If we measure the mic as high impedance
-	 */
-	if (!info->hpdet_id_gpio || info->hpdet_res[1] > 50) {
-		dev_dbg(arizona->dev, "Detected mic\n");
-		*mic = true;
-		info->detecting = true;
-	} else {
-		dev_dbg(arizona->dev, "Detected headphone\n");
-	}
-
-	/* Make sure everything is reset back to the real polarity */
-	regmap_update_bits(arizona->regmap, ARIZONA_ACCESSORY_DETECT_MODE_1,
-			   ARIZONA_ACCDET_SRC, info->micd_modes[0].src);
-
-	return 0;
-}
-
 static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 {
 	struct arizona_priv *info = data;
 	struct arizona *arizona = info->arizona;
 	int ret, reading, state, report;
-	bool mic = false;
 
 	mutex_lock(&info->lock);
 
@@ -552,18 +481,6 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 		goto done;
 	reading = ret;
 
-	/* Reset back to starting range */
-	regmap_update_bits(arizona->regmap,
-			   ARIZONA_HEADPHONE_DETECT_1,
-			   ARIZONA_HP_IMPEDANCE_RANGE_MASK | ARIZONA_HP_POLL,
-			   0);
-
-	ret = arizona_hpdet_do_id(info, &reading, &mic);
-	if (ret == -EAGAIN)
-		goto out;
-	else if (ret < 0)
-		goto done;
-
 	/* Report high impedence cables as line outputs */
 	if (reading >= 5000)
 		report = SND_JACK_LINEOUT;
@@ -581,11 +498,8 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	arizona_extcon_hp_clamp(info, false);
 
-	if (info->hpdet_id_gpio)
-		gpiod_set_value_cansleep(info->hpdet_id_gpio, 0);
-
 	/* If we have a mic then reenable MICDET */
-	if (state && (mic || info->mic))
+	if (state && info->mic)
 		arizona_start_mic(info);
 
 	if (info->hpdet_active) {
@@ -654,55 +568,6 @@ static void arizona_identify_headphone(struct arizona_priv *info)
 	info->hpdet_active = false;
 }
 
-static void arizona_start_hpdet_acc_id(struct arizona_priv *info)
-{
-	struct arizona *arizona = info->arizona;
-	int hp_reading = 32;
-	bool mic;
-	int ret;
-
-	dev_dbg(arizona->dev, "Starting identification via HPDET\n");
-
-	/* Make sure we keep the device enabled during the measurement */
-	pm_runtime_get_sync(arizona->dev);
-
-	info->hpdet_active = true;
-
-	arizona_extcon_hp_clamp(info, true);
-
-	ret = regmap_update_bits(arizona->regmap,
-				 ARIZONA_ACCESSORY_DETECT_MODE_1,
-				 ARIZONA_ACCDET_SRC | ARIZONA_ACCDET_MODE_MASK,
-				 info->micd_modes[0].src |
-				 arizona->pdata.hpdet_channel);
-	if (ret != 0) {
-		dev_err(arizona->dev, "Failed to set HPDET mode: %d\n", ret);
-		goto err;
-	}
-
-	if (arizona->pdata.hpdet_acc_id_line) {
-		ret = regmap_update_bits(arizona->regmap,
-					 ARIZONA_HEADPHONE_DETECT_1,
-					 ARIZONA_HP_POLL, ARIZONA_HP_POLL);
-		if (ret) {
-			dev_err(arizona->dev, "Can't start HPDETL measurement: %d\n", ret);
-			goto err;
-		}
-	} else {
-		arizona_hpdet_do_id(info, &hp_reading, &mic);
-	}
-
-	return;
-
-err:
-	/* Just report headphone */
-	snd_soc_jack_report(info->jack, SND_JACK_HEADPHONE,
-			    SND_JACK_LINEOUT | SND_JACK_HEADPHONE);
-
-	pm_runtime_put_autosuspend(arizona->dev);
-	info->hpdet_active = false;
-}
-
 static void arizona_micd_timeout_work(struct work_struct *work)
 {
 	struct arizona_priv *info = container_of(work,
@@ -961,16 +826,6 @@ static irqreturn_t arizona_micdet(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void arizona_hpdet_work(struct work_struct *work)
-{
-	struct arizona_priv *info = container_of(work,
-						struct arizona_priv,
-						hpdet_work.work);
-
-	guard(mutex)(&info->lock);
-	arizona_start_hpdet_acc_id(info);
-}
-
 static int arizona_hpdet_wait(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
@@ -1009,10 +864,9 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	struct arizona_priv *info = data;
 	struct arizona *arizona = info->arizona;
 	unsigned int val, present, mask;
-	bool cancelled_hp, cancelled_mic;
-	int ret, i;
+	bool cancelled_mic;
+	int ret;
 
-	cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
 	cancelled_mic = cancel_delayed_work_sync(&info->micd_timeout_work);
 
 	guard(pm_runtime_active_auto)(arizona->dev);
@@ -1039,11 +893,6 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	val &= mask;
 	if (val == info->last_jackdet) {
 		dev_dbg(arizona->dev, "Suppressing duplicate JACKDET\n");
-		if (cancelled_hp)
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->hpdet_work,
-					   msecs_to_jiffies(HPDET_DEBOUNCE));
-
 		if (cancelled_mic) {
 			int micd_timeout = arizona->pdata.micd_timeout;
 
@@ -1062,13 +911,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 			info->mic = false;
 			info->jack_flips = 0;
 
-			if (!arizona->pdata.hpdet_acc_id) {
-				arizona_start_mic(info);
-			} else {
-				queue_delayed_work(system_power_efficient_wq,
-						   &info->hpdet_work,
-						   msecs_to_jiffies(HPDET_DEBOUNCE));
-			}
+			arizona_start_mic(info);
 
 			if (info->micd_clamp || !arizona->pdata.jd_invert)
 				regmap_update_bits(arizona->regmap,
@@ -1080,12 +923,8 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 
 			arizona_stop_mic(info);
 
-			info->num_hpdet_res = 0;
-			for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
-				info->hpdet_res[i] = 0;
 			info->mic = false;
 			info->hpdet_done = false;
-			info->hpdet_retried = false;
 
 			snd_soc_jack_report(info->jack, 0,
 					    ARIZONA_JACK_MASK | info->micd_button_mask);
@@ -1253,7 +1092,6 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 
 	mutex_init(&info->lock);
 	info->last_jackdet = ~(ARIZONA_MICD_CLAMP_STS | ARIZONA_JD1_STS);
-	INIT_DELAYED_WORK(&info->hpdet_work, arizona_hpdet_work);
 	INIT_DELAYED_WORK(&info->micd_detect_work, arizona_micd_detect);
 	INIT_DELAYED_WORK(&info->micd_timeout_work, arizona_micd_timeout_work);
 
@@ -1326,15 +1164,6 @@ int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 		return ret;
 	}
 
-	info->hpdet_id_gpio = gpiod_get_optional(arizona->dev,
-						 "wlf,hpdet-id-gpio",
-						 mode);
-	if (IS_ERR(info->hpdet_id_gpio)) {
-		ret = PTR_ERR(info->hpdet_id_gpio);
-		dev_err_probe(arizona->dev, ret, "getting headphone detect ID GPIO\n");
-		return ret;
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_probe);
@@ -1342,7 +1171,6 @@ EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_probe);
 int arizona_jack_codec_dev_remove(struct arizona_priv *info)
 {
 	gpiod_put(info->micd_pol_gpio);
-	gpiod_put(info->hpdet_id_gpio);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_remove);
@@ -1588,7 +1416,6 @@ static int arizona_jack_disable_jack_detect(struct arizona_priv *info)
 	arizona_free_irq(arizona, ARIZONA_IRQ_MICDET, info);
 	arizona_free_irq(arizona, jack_irq_rise, info);
 	arizona_free_irq(arizona, jack_irq_fall, info);
-	cancel_delayed_work_sync(&info->hpdet_work);
 	cancel_delayed_work_sync(&info->micd_detect_work);
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index 499891e62183..766a29a23893 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -94,13 +94,11 @@ struct arizona_priv {
 
 	/* Variables used by arizona-jack.c code */
 	struct mutex lock;
-	struct delayed_work hpdet_work;
 	struct delayed_work micd_detect_work;
 	struct delayed_work micd_timeout_work;
 	struct snd_soc_jack *jack;
 	struct regulator *micvdd;
 	struct gpio_desc *micd_pol_gpio;
-	struct gpio_desc *hpdet_id_gpio;
 
 	u16 last_jackdet;
 
@@ -117,14 +115,10 @@ struct arizona_priv {
 
 	bool hpdet_active;
 	bool hpdet_done;
-	bool hpdet_retried;
 
 	bool mic;
 	bool detecting;
 
-	int num_hpdet_res;
-	unsigned int hpdet_res[3];
-
 	int jack_flips;
 	int hpdet_ip_version;
 };

-- 
2.56.1.809.ga0b61035b5-goog

