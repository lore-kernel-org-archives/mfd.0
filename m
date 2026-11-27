Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806597;
	b=1gBogu1fqk+ZEbCdz3CiNkkP2IFeZDjp0Rf1Fr4rQgbRSG3KC1jAQ79sr20cD8LrHr5p
	 1mh2YTGbe2DbsZ736CtOkDWguDfuYp0ke4czSdFkeTXXmFxBU8H1Ld0bGUycckdeOT6bY
	 /6g1sE/oUwO93i0LF+xN25o/Vcku27vH/WxD2PRIMT9LJpKBnrU+nvdgvcjkuh9IONIhd
	 IASiCYoxG2UwL4WdrE2/cZMxgms0X5fDsfgeWYHP0BLSZytpO4/aoWuqWVHZ9sIzLes6C
	 1kL5L3hDmt1mJjUE7E7p++x+7LQ+gwaUEBi/mqOrjYvPgLcY95xCa2GoIdw5WTIAe7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tu6aU5M+2skw7CfMYibCOfN2VIrKMUr0DGrXBqKQg/o=;
	b=eGNY1M1wOZ8gZ95jVtJpa7nCntKh1EEYMznrP1WZTYortZLIAGa+69wrcsy7Dofu7KxR
	 bUKmiw7wlLf3B9uUXtCOiE+v/6HL5BTtYPO+uh0NJLg3yDzD0i4UToMUUiQfMnhg5q7Eo
	 ACMrqm3q/XN/X6pubeYb6rXFAGu59prTKkry9ccw1fciS0Sn2fra6Jk6lfKRKVpMPURsm
	 A5lVT+owCKpKHWbbmYMXd1BlpJdi8j+60sW1/9oMxIY9EcmkNg0XHvB6Yyxog5dtOnkcG
	 ESX39KHrorXuIGMi02TBAzixOQfglQVvNpB9imedptIzsWNis2TxUctYpWq6lVn6TWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I6IV8+5J;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4E6606A32C
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B4E6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I6IV8+5J
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5126505cb3so1105523566b.0
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 11:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806595; x=1796411395; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu6aU5M+2skw7CfMYibCOfN2VIrKMUr0DGrXBqKQg/o=;
        b=I6IV8+5JdpLwHPEmJql8wS5HUHKTxq8PGj39TMhOzCt7HBH2vxgr1wH2mMzOKxGuzZ
         hsXcP2DX01ZbjXEBv4Jf3NobXN8ZtHzB6Brl5FECfeEJUZqog9c2RtxD6Z7en4aM3+lZ
         Q+FuQKSoxe4eUpU0WqSPOV5pMGNb1WrP/oVQEzNRx0H6jEU2gj+R6b0EwY+ifzmOsCi2
         gVpcbXvBz7Sxeqn98ejeuHk8Ec0eEPoQ1nsEI6njFpewUECiK7zh+NbFZuJCaa7Phclt
         2VhAk+X2va2cuzTyG0l1XsdW0oIVQSxuWkym3d4S82vlFJtvxKrX2DSZMwO/56O+68ft
         oEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806595; x=1796411395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tu6aU5M+2skw7CfMYibCOfN2VIrKMUr0DGrXBqKQg/o=;
        b=hYXIy+BXmqIUjlSIwy405kcVygaVYGa0ZalWuW0l9Wb/tPIw1rfI5XNrA83UOdE8uA
         G242Wfz670KiQM3zbdSxZe9KdP/62W676cj27+qEq3vFtSNJrPGIT+urS2mwnQA6RYbd
         8371mSUP3B5jaYhYNLuQNiATM6kLudpPOxRoEcPwD/I0/IcR40SN9TRPu4Anjpvm9hK6
         2+dYJZBsiRvYKULvMy7kWZm1RPPM/JsijyfjEASYTynAeeF/+/wYEQmKcWST4IlnP3eo
         XFRfB3RALZ4jDhhw3MYPifKHbD/au2hstInh9M4OyAzzuB5wn7+CNI9obgVKZj5WT46Z
         yfUA==
X-Forwarded-Encrypted: i=1; AL+hErE53ziXY/ty6leBub6nbIy6BFhKeeW1EF/5OKP+5T3sIJ4Nb2aa0q411ruCsAI1ibnpWVY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/mK+yHod22otCG/Jjv8RkAgXJzwyWrsM21uRrvt/bq0OSNa27m
	HlAC4zIYKghNA6EQAv3gpUZrc/LzoXJfKmDsnkczbO4nM8R7T5ZiELyDYJIJv34Jm6c=
X-Gm-Gg: AZFdTZck5dHTmcrVBV3B/Zi4dYLlNqF59/itrzjJa50+8WJTMUdYHEdrMxfDZmsn37g
	jTnaTNdO/jn1P7qeuJnpo6mrdqXVTY9e8kmBd31wqbvpsDFn0txylBpHFUVyGPe1BIriqe/6T0g
	DwtfOa0Hb9fbDctNXFpy525Ga9ynPiCJRwJJ4Biwb28t8D7PhGYG5OnQfrvn+am2FvCehw1fH3W
	2GJSgsQljz+Q1MXK5a4DsaEhaNO+IsOxPiVfo0GmZecrrw8j3GZvgnaRSDLG+OAKrqxMRTbbP8g
	gHR5VbV2PpUdrHkzrENEgUWEE5GTjyh1L8iqA+YuPMbV8J/Ti/4MwAR9BtmmQ9DuGBm0f8kjNnC
	z5QwwWYWUXLxXVQrHFWu+zt1DkHfjqUIMb1+OPO6W8lId6btyFLz4r2HYEpU0RV6E3zZrjNGdrD
	Z2FqucU8Kpc7Ow7ButJR2MyHU7tHxRSGlNbMrMpL/cdRK0DEm64CeuEBjJ+dKYdnfLKlC/Aa74F
	EkNFQ7qcIQBXHM/WTfeVyb3zac74UTxwflNRztTviG6g1creem6rKBXFQlE1S3LiiLwI9xIiJuh
	+qbAr4srU0JeKB/h6vpwhJCrP3EUyXfailtZjJ669vJ1XKJM//E9xncV2z/priU2zVuWqvAIbXA
	gR4Ggf4cvgF8w0DqptA==
X-Received: by 2002:a17:907:c612:20b0:c51:2583:78b9 with SMTP id a640c23a62f3a-c513ab477e2mr1558459766b.34.1795806594992;
        Fri, 27 Nov 2026 11:09:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:52 +0000
Subject: [PATCH 1/6] power: supply: max77759: fix use-after-free of
 tcpm_psy
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-max77759-charger-fixes-v1-1-b364a0862d72@linaro.org>
References: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
In-Reply-To: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Unbinding the TCPM supplier triggers a use-after-free oops in
psy_work_item():

    max77759-charger max77759-charger.1.auto: Failed to get
     CURRENT_MAX psy property, ret=-19
    Internal error: Oops - BRK: 00000000f20003e8 [#1]  SMP
    CPU: 6 UID: 0 PID: 96 Comm: kworker/6:2 Tainted: G     U
    Hardware name: Oriole (DT)
    Workqueue: events psy_work_item [max77759_charger]
    pc : queued_spin_lock_slowpath+0x388/0x3c0
    lr : queued_spin_lock_slowpath+0x120/0x3c0

psy_changed() caches the raw struct power_supply * in chg->tcpm_psy
without holding a reference. When the TCPM supply unbinds,
psy_work_item() gets -ENODEV, schedules a 10 ms retry, and dereferences
the freed chg->tcpm_psy pointer.

Read ONLINE and CURRENT_MAX directly inside psy_changed() where that's
safe and store the plain integer values for psy_work_item() while
dropping max77759_charger::tcpm_psy.

On read error, fall back to offline (0) so psy_work_item() disables
charging without retrying against a disappearing supply. This is fine,
because the only in-tree provider matching "tcpm-source" is tcpm, which
returns cached fields from memory. Charger I2C retries on write error
remain unchanged.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 55 ++++++++++++++++++---------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index e792327ff14f..a75005c0b582 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -77,9 +77,10 @@ struct max77759_charger {
 	struct power_supply *psy;
 	struct regulator_dev *chgin_otg_rdev;
 	struct notifier_block nb;
-	struct power_supply *tcpm_psy;
 	struct delayed_work psy_work;
-	struct mutex retry_lock; /* Protects psy_work_retry_cnt */
+	struct mutex retry_lock; /* Protects psy_work state below */
+	int tcpm_current_limit;
+	int tcpm_online;
 	u32 psy_work_retry_cnt;
 	int irqs[NUM_IRQS];
 	struct mutex lock; /* protects the state below */
@@ -595,30 +596,15 @@ static void psy_work_item(struct work_struct *work)
 {
 	struct max77759_charger *chg =
 		container_of(work, struct max77759_charger, psy_work.work);
-	union power_supply_propval current_limit, online;
-	int ret;
-
-	ret = power_supply_get_property(chg->tcpm_psy,
-					POWER_SUPPLY_PROP_CURRENT_MAX,
-					&current_limit);
-	if (ret) {
-		dev_err(chg->dev,
-			"Failed to get CURRENT_MAX psy property, ret=%d\n",
-			ret);
-		goto err;
-	}
+	int current_limit, online, ret;
 
-	ret = power_supply_get_property(chg->tcpm_psy, POWER_SUPPLY_PROP_ONLINE,
-					&online);
-	if (ret) {
-		dev_err(chg->dev,
-			"Failed to get ONLINE psy property, ret=%d\n",
-			ret);
-		goto err;
+	scoped_guard(mutex, &chg->retry_lock) {
+		current_limit = chg->tcpm_current_limit;
+		online = chg->tcpm_online;
 	}
 
-	if (online.intval && current_limit.intval) {
-		ret = set_input_current_limit(chg, current_limit.intval);
+	if (online && current_limit) {
+		ret = set_input_current_limit(chg, current_limit);
 		if (ret) {
 			dev_err(chg->dev,
 				"Unable to set current limit, ret=%d\n", ret);
@@ -660,16 +646,35 @@ static int psy_changed(struct notifier_block *nb, unsigned long evt, void *data)
 {
 	struct max77759_charger *chg = container_of(nb, struct max77759_charger,
 						    nb);
+	union power_supply_propval current_limit, online;
 	static const char *psy_name = "tcpm-source";
 	struct power_supply *psy = data;
+	int ret;
 
 	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)) ||
 	    evt != PSY_EVENT_PROP_CHANGED)
 		return NOTIFY_OK;
 
-	chg->tcpm_psy = psy;
-	scoped_guard(mutex, &chg->retry_lock)
+	ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_ONLINE,
+					&online);
+	if (!ret && online.intval)
+		ret = power_supply_get_property(psy,
+						POWER_SUPPLY_PROP_CURRENT_MAX,
+						&current_limit);
+	if (ret) {
+		if (ret != -ENODEV)
+			dev_err(chg->dev,
+				"Failed to get supplier psy property: %d\n",
+				ret);
+		online.intval = 0;
+	}
+
+	scoped_guard(mutex, &chg->retry_lock) {
+		chg->tcpm_online = online.intval;
+		chg->tcpm_current_limit = online.intval ?
+					  current_limit.intval : 0;
 		chg->psy_work_retry_cnt = 0;
+	}
 
 	schedule_delayed_work(&chg->psy_work, 0);
 

-- 
2.56.1.839.g22a8290db9-goog

