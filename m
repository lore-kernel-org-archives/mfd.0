Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806599;
	b=EWZ8K3umyfwh3Rmd47t9FOl0Rs+mUelpJt2WOI+QViuzxb69y1xDsTApY/9cGV7uM2D+
	 Rj0IuprrT2YKHr6PKpByboQM3Zog7Y8dDEzckfY0O2mVdqGbMnkxg8DLkv8Jh00de3GEy
	 Tit7DKrDOBUB84DGEbYQ2A4388+4nmPcc3PW3QnPJMS3TVHQNaybKVHqujUo9XQ6uNMW2
	 +DeX4e6jJ8wyRrDNFXuxp/ASI45C1fSkj2m/NYJuaUMHLQQ+96NVMK0+wCvxwkOkm3vcQ
	 joG527DZryxvhouwMuV5iDH+QExPaH1BJ/k1odpiNZBv6t9Q6fXxgnWqsc7d41IS8FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nSwTlk+qW9HaX1IW1y5n0J0zLzYJ3qzpDghagGtO0AE=;
	b=A5+jVPsU7qAsMrEJU1CmOr3CWCO4SH1MCDvQ5sV8CECeJElK1uhcXiRsYM4l/x8I2jlj
	 fDw2VLM59LA5bA5NQWbLwd6HFGoaBHzGJQTYzgPR7XCVK1BFEao2Dx06fmIE8Q6vi3sPM
	 L0suI6E311P0u8JTV3P1qOR2UwQwdVNBy/lejt58WLeY9mqyhQ16lx3yfQ0cpEO32mrPZ
	 mBYNk3+y9waCfTWcMqA2c2o6v0Jj8EvMUFpIbei4NXgnZDkSzeQo/pwY1yE6oGrhMh5za
	 pj/vJUahQAP3a3xtTVcnJaFeHsxlkbkt4e1vlDChpE77qL01w4q4UPNgbhJvmzV92Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RKsSgAWk;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48C606A6A4
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D48C606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RKsSgAWk
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5127c7abd5so1286946466b.3
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806598; x=1796411398; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nSwTlk+qW9HaX1IW1y5n0J0zLzYJ3qzpDghagGtO0AE=;
        b=RKsSgAWkMBhTibj/3HyWK6yTEMSvMnXiHxuLHzdPNrS5UBRxz6jUjxUi7H0UzF6/2e
         wg8tKGeS45/7spd6Y0RnyLmAeuOqR7x95Y7K5YBvymNjrzDiVMGAf15aXxrhcD1LoQer
         wdr3vqynb+1w5roW/13HmscOVs3059hXJgpt+wLlLUk40lwsc/Ttm02vZTpE3XGmgAFv
         V/aN4yZUaq4Rov1PrHkrG4qgRvz0dWz/sZpQsrPsWHOYeVswQKF4i6MD2DjMjo8qFcMT
         onRQwOEtG4R4RNDnVU6C7ojHRr3cbtYuWpkWP2HsN5VOubJbNd70Z0yNwgApKKlifO8q
         OZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806598; x=1796411398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nSwTlk+qW9HaX1IW1y5n0J0zLzYJ3qzpDghagGtO0AE=;
        b=dw2QwUQ24qwH8H2CzyRPvmUS0m6wn+1g3abNnImRhrPCW6MPNSfdZplfKNuK974Tz8
         an+AB2wgv3DsTTCDrregxx5zIQgC6Fktejaqr46k/Y3L84NbOOnrYBP9lGr/QsDRU7rK
         p+dgIzRfUdSHTzw5KvPAirL9MS8ex8QlDS4r8nadsqrKpK1c0COjOiz/f/sqgxofX/c+
         r2ePJ7an4kI+2S0jDZrhTHWDdxIUBcAGap7EpzOXKOVlyaF+BZQ6cXG6S3jo0r4VM/0r
         Lnok3zfoorKao5Meio3RkVcSYoWhmNtvWek7AfU1j7a+X+FGaQhHy6+DTMuB7KjGOxnY
         j/7A==
X-Forwarded-Encrypted: i=1; AL+hErFl44EvCiJnghyEuqp9jgrqVeZa9R4HbVDToZK+57qewGV1r+2TbSr5T5ABLWNL/JKuSDo=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Iz+te6iSf7LWBUeGWrLkF/s4qtyoa9MAWxeiVm9IwRsi21laY
	U3CwR5GT/2G6dv2mv928exIhzoDMhv2LHWhnCWYAl6T8ayNy2GYqdRrov6f9C1g6RVLraKDU1vV
	4Gdxmxkg=
X-Gm-Gg: AZFdTZdcBDsYnKPV5100vU2igjPoYe7ZMIxXQ/RtJQUoSllPJF3xI1S2aY6o6OXtqPD
	O9x62bHGaUk7257AEfkCHAi9lCjXQR0HJAZag9toniJeFvOlTblDsvhKHlI9wFgRAYTdSJU6VNx
	3wLBxOFNV11GVAdwmmeBe9RbftVYGvGIVBOY59Mt1bONnYZ1z+5i7/haTPuwURkJ7462wv0wDHE
	+ujOtAllCCG1xc1XiqMtC9pgADFGq9bwW7ZwsUpDpkVpwRlI7J4D2LCNQsFxLrgbgDMuLzOIKP1
	4TdhrTs/7QE+eqJhR4J8+3UdUeBfLKLMRV0fzoIbYGaarWPCAnxMq4THZ+ScWzzYvnyyHglpCc7
	Q87lHKkfCmJHWotW+MpQau8WObi8OEuQVxON2r68cgjPvEHThuoTsmL5wojbSRhJ37rEosYK8sL
	aRVE0ZGVd4ULg2cgh/ZiBYmRfPXszmk19ytfp+ueRmywnNcT2wTF8CA7mAGDbuBCn0HGt+nypqh
	NK8iBSmVeZqW2RVivTG4ymbtLklObWskTp7JBYKCdlr4XuWHiOROOQ3fh2jDaJOV6dSOIspmFqE
	e/0uo2LKgHFhYpEz3234quiXsvP6fFu5vJR3ux/YytLcVcQwVhf98x+GQkr+iu77PfqS1xFfFOa
	4ykfroMejrYnt8LbpSA==
X-Received: by 2002:a17:907:9d81:b0:c51:3697:d0de with SMTP id a640c23a62f3a-c513a81488emr1386646666b.20.1795806597885;
        Fri, 27 Nov 2026 11:09:57 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:55 +0000
Subject: [PATCH 4/6] power: supply: max77759: notify on mode or input limit
 change
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
Message-Id: <20261127-max77759-charger-fixes-v1-4-b364a0862d72@linaro.org>
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

Event-driven userspace (such as UPower or healthd), downstream consumers
(such as the max17042 fuel gauge), and power_supply LED triggers miss
changes to the charger's ONLINE or INPUT_CURRENT_LIMIT properties when
psy_work_item() changes the charger mode or input current limit in
response to a supplier update without triggering a charger hardware
interrupt (for example, changing CHGIN_ILIM while already charging, or
toggling mode with a full battery).

Only the charger interrupt handlers call power_supply_changed().
set_input_current_limit() and charger_set_mode() do not report whether
the hardware state changed, and psy_work_item() never notifies the
power_supply core.

Add a bool *changed output parameter to set_input_current_limit() (via
regmap_update_bits_check()) and charger_set_mode(), and call
power_supply_changed(chg->psy) from psy_work_item() whenever either
changes.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 48 ++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index 49ab1766cc5d..7a7d9a54d888 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -345,21 +345,30 @@ static int get_input_current_limit(struct max77759_charger *chg)
 	return ret ? ret : val;
 }
 
-static int set_input_current_limit(struct max77759_charger *chg, int ilim_ua)
+static int set_input_current_limit(struct max77759_charger *chg, int ilim_ua,
+				   bool *changed)
 {
+	bool ilim_changed;
 	u32 regval;
+	int ret;
 
 	if (ilim_ua < 0)
 		return -EINVAL;
 
 	linear_range_get_selector_within(chgin_ilim_ranges, ilim_ua, &regval);
 
-	return regmap_update_bits(chg->regmap, MAX77759_CHGR_REG_CHG_CNFG_09,
-				  MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
-				  MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
-				  MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
-				  FIELD_PREP(MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
-					     regval));
+	ret = regmap_update_bits_check(chg->regmap,
+				       MAX77759_CHGR_REG_CHG_CNFG_09,
+				       MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
+				       MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
+				       MAX77759_CHGR_REG_CHG_CNFG_09_NO_AUTOIBUS |
+				       FIELD_PREP(MAX77759_CHGR_REG_CHG_CNFG_09_CHGIN_ILIM,
+						  regval),
+				       &ilim_changed);
+	if (!ret && changed && ilim_changed)
+		*changed = true;
+
+	return ret;
 }
 
 static const enum power_supply_property max77759_charger_props[] = {
@@ -422,7 +431,7 @@ static const struct power_supply_desc max77759_charger_desc = {
 };
 
 static int charger_set_mode(struct max77759_charger *chg,
-			    enum max77759_chgr_mode mode)
+			    enum max77759_chgr_mode mode, bool *changed)
 {
 	int ret;
 
@@ -445,6 +454,9 @@ static int charger_set_mode(struct max77759_charger *chg,
 		return ret;
 
 	chg->mode = mode;
+	if (changed)
+		*changed = true;
+
 	return 0;
 }
 
@@ -452,14 +464,14 @@ static int enable_chgin_otg(struct regulator_dev *rdev)
 {
 	struct max77759_charger *chg = rdev_get_drvdata(rdev);
 
-	return charger_set_mode(chg, MAX77759_CHGR_MODE_OTG_BOOST_ON);
+	return charger_set_mode(chg, MAX77759_CHGR_MODE_OTG_BOOST_ON, NULL);
 }
 
 static int disable_chgin_otg(struct regulator_dev *rdev)
 {
 	struct max77759_charger *chg = rdev_get_drvdata(rdev);
 
-	return charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+	return charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, NULL);
 }
 
 static int chgin_otg_status(struct regulator_dev *rdev)
@@ -553,7 +565,7 @@ static int max77759_charger_init(struct max77759_charger *chg)
 		return ret;
 
 	chg->mode = FIELD_GET(MAX77759_CHGR_REG_CHG_CNFG_00_MODE, regval);
-	ret = charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+	ret = charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, NULL);
 	if (ret)
 		return ret;
 
@@ -600,6 +612,7 @@ static void psy_work_item(struct work_struct *work)
 	struct max77759_charger *chg =
 		container_of(work, struct max77759_charger, psy_work.work);
 	int current_limit, online, ret;
+	bool changed = false;
 
 	scoped_guard(mutex, &chg->retry_lock) {
 		current_limit = chg->tcpm_current_limit;
@@ -607,18 +620,21 @@ static void psy_work_item(struct work_struct *work)
 	}
 
 	if (online && current_limit) {
-		ret = set_input_current_limit(chg, current_limit);
+		ret = set_input_current_limit(chg, current_limit, &changed);
 		if (ret) {
 			dev_err(chg->dev,
 				"Unable to set current limit, ret=%d\n", ret);
 			goto err;
 		}
 
-		charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON);
+		charger_set_mode(chg, MAX77759_CHGR_MODE_CHG_BUCK_ON, &changed);
 	} else {
-		charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+		charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, &changed);
 	}
 
+	if (changed)
+		power_supply_changed(chg->psy);
+
 	scoped_guard(mutex, &chg->retry_lock) {
 		if (chg->psy_work_retry_cnt)
 			dev_dbg(chg->dev,
@@ -630,7 +646,9 @@ static void psy_work_item(struct work_struct *work)
 	return;
 
 err:
-	charger_set_mode(chg, MAX77759_CHGR_MODE_OFF);
+	charger_set_mode(chg, MAX77759_CHGR_MODE_OFF, &changed);
+	if (changed)
+		power_supply_changed(chg->psy);
 	scoped_guard(mutex, &chg->retry_lock) {
 		if (chg->psy_work_retry_cnt >= MAX_NUM_RETRIES) {
 			dev_err(chg->dev, "chg psy work failed, giving up\n");

-- 
2.56.1.839.g22a8290db9-goog

