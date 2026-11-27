Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806598;
	b=KcGN6FK8yq/8U3x0G99g3MRX3KKiEoMapT1dszhht8++mVfvqkP9/TG6k54i+wuHUiyQ
	 rDtke7XyyQ67FXfSe0k/Bnm9rLQjQu6pnrdvvjTxPtiwAeVK3VXAbP3gFNiY6STVqi267
	 o1TnQnkVzxMrMelMKPoxeFKkhCtZVS3hKfD4XOuTpTLIM7o9A2S7z8vbkp3c3ndztBfHh
	 cGYr1pk+Z5INYGwfyqa1ljZWJABZFhJc+j3XqyUX0td2fCyRVoA2GqFMAq+CgQgLr9WZv
	 O58WnzoiKmenWlHVDkosvi35cJAF60TNhSuaFD8+i5iu40p/S6Wo8nGNULenUm+4eZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jnEBKmIjlMDJzz7/vlO75PN6QRpLxAhezHtALAyCDMU=;
	b=LjcQko0moSYh+AITyyoCro6syb89sBYrNatttsvfh/co/NM12j3FEP3h7KVGPoLxAAi/
	 fPoUkAwiIqcwbv4QvbKsg/6JvFSnnlfsJ1aGMm23G3BbWq4cxHVj6ZUilJ95I6yI6Jjl6
	 f4v+560pA5eD6nfYB8evYX0jG1feEM1q8Kg3NxEuEmDIHIHk6PRnXRVpGdoh76ksaj9ui
	 NmUKEHPZihsSCALYCu8vYrqqmew8gTO8BNbSt6grl6w5b6TIkrBj5WvXKCbN3P0dyNSgS
	 166JBHmSNMSBC4jntDQK2h6HpMBnXpEPyz3DFdAQ2mnnExUmW74jfaHAWo0yQeRUWGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PlSsPs44;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7478606A338
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7478606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PlSsPs44
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d21051042so445810366b.0
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 11:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806596; x=1796411396; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jnEBKmIjlMDJzz7/vlO75PN6QRpLxAhezHtALAyCDMU=;
        b=PlSsPs44HwRrOMkm26AKtaT0XsLXMT7fOjaa4f3i1xebIwSA/YDtgvWYkbz/QqdQ2s
         iaQOvNxOdUD0xFR2RTi1rIlXxsOJ08aOK2xvC1lkvrDpZQjC+Sp4zao46eqWsDXSSLD5
         L+E2zOkJIzZkq2wEF8Q7ueNAf4wHIDsv4KwnwaZoPbVD9ApyT+KTXmqaoTuUpzlEo8EA
         OU5XFa9I+FW/d4iOa7Le5FyclNrEQlbmlcmX+cx8HUftLuhMGztwljvNCWBoKni5takR
         d1/3MTLNDahVk/1ZzSJBG5uOoSTC18ZxVT5SnKcdR+n6DwWlRypNP7h4L6AgYddBZWOD
         piZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806596; x=1796411396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jnEBKmIjlMDJzz7/vlO75PN6QRpLxAhezHtALAyCDMU=;
        b=E/K6eeZ9SbTIc1cN5NQp3PeKnV6Ocn2mnRIxL5sENTXNrRBxFH29MsGsSYg6B1FgSq
         O9cUsMACJGH0rVTEbBZEgc9zTjYdS6O1hyQwlCEvYx3dOx30OF4hoW4Tskutfos3myAj
         8+UXy3y+2PryJuMYBZD1CXAb4fFeIDM4b9j0H5up2gaGj0lhcbh7gJLbMP1fE/LOhC5j
         0qGq7TegB5H6AXljFeqFEs+lUHjjCraup+KaGBjI8F8TUopvajmwoYXzxwLfWVpcC4sm
         b9CYo0ErJ8ogy3g7YRLr9px3ye1qzvAhX1zE9vihQGIgevwXy35OpKnVsEGfCZPC+LTZ
         Bh+Q==
X-Forwarded-Encrypted: i=1; AL+hErENFam+RrTnrxupy3LN4CU3Tb5US4/AKxduRD4JAaqU4CzrJ0T1o/StWvYxov//Y5UBVhA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+nMVyF/C+wRPszCLQe34M6ukJkEwqYFHdgMVimoj/zpdhSGTzT
	vCds5xr1FJv74FpordtLU3j6iH/Y/tbDtzJHVS5AMoQYfo+VFPyUziDCfUxSRx4f6+Y=
X-Gm-Gg: AZFdTZd3uS+ywX4m9soVD1ifv54jta8Oy9i6oLe2KAACu9hgRrE1NfSMNL0LvrGSrJO
	xHRvI4Szxo1bX8qN42DOWzEUJqp3ZmHRZyZHXefFvKoKBQdufywkMWQLzcSkfskqzEDvq9vm/AU
	6qdWIVwyEHPREqEN17KxokhCk2g2S0X+4TqVAqI5DtMG7bIzv/xqNvfr4u1L/JbL9fsFug6LaCp
	fqYK5CQDzXgulV602RZXSH09P7ZICmMUqAmnyX0lbt44j2AYC5gCD2dNuQaEkZk5skl/fo51ph4
	oFIFFkQkRl6fKXTnx6JcsM89hjvBYr93NUB8M64TrwBU1wTZu5TQrlzuFujRDf7l6rhRMe3P9GS
	sqtMWfZAvcpmjnJMq+1TegcfBEFDakU7Jt+ygauGRPapWcIl0ggHljjOHkbPbeVRpGqjmVpsgmM
	VN9HWuJlCECB9ebciXF24tG5+EtYI2GVU24+42cX/S4AnOn2qLFZueObpYTdlOqVvzAmHvx5Q4r
	V5rJAk/4jLEtH0S/aZ+QBYRBFmhIybReHYK1jgKC+B3XINiPx/NT+305cAXY772XMrfQKeu+Y8Q
	yp4S7aqLNJGrTPM9EHjhO15zAV2VMk/Rk5M/brf4hegJ7Mkq7PzDJQ3/q9HPQXN3r1G4FoB2oIT
	L/KYUCtEsLIgbPtP/zg==
X-Received: by 2002:a17:907:1187:b0:c49:903e:1e19 with SMTP id a640c23a62f3a-c513a8595d0mr1656720366b.26.1795806596148;
        Fri, 27 Nov 2026 11:09:56 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:55 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:53 +0000
Subject: [PATCH 2/6] power: supply: max77759: report charge voltage in uV
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
Message-Id: <20261127-max77759-charger-fixes-v1-2-b364a0862d72@linaro.org>
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

The max77759 charger power supply reports constant_charge_voltage_max
in millivolts instead of microvolts (for example
POWER_SUPPLY_CONSTANT_CHARGE_VOLTAGE_MAX=4300 instead of 4300000 in
sysfs), violating the power_supply ABI.

POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX is defined in microvolts,
but chg_cv_prm_ranges, CHG_FV_DEFAULT_MV, get_float_voltage(), and
set_float_voltage_limit() operate in millivolts, and
max77759_charger_init() divides constant_charge_voltage_max_uv by 1000.

Convert chg_cv_prm_ranges and the float-voltage helpers to microvolts
so the driver reports and programs CONSTANT_CHARGE_VOLTAGE_MAX in uV.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index a75005c0b582..6876ae0a8188 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -25,7 +25,7 @@
 
 /* Default values for Fast Charge Current & Float Voltage */
 #define CHG_CC_DEFAULT_UA			2266770
-#define CHG_FV_DEFAULT_MV			4300
+#define CHG_FV_DEFAULT_UV			4300000
 
 #define MAX_NUM_RETRIES				3
 #define PSY_WORK_RETRY_DELAY_MS			10
@@ -60,10 +60,10 @@ static const struct linear_range chgcc_limit_ranges[] = {
 	LINEAR_RANGE(200000, 0x3, 0x3C, 66670),
 };
 
-/* Charge Termination Voltage Limits (in mV) */
+/* Charge Termination Voltage Limits (in uV) */
 static const struct linear_range chg_cv_prm_ranges[] = {
-	LINEAR_RANGE(3800, 0x38, 0x39, 100),
-	LINEAR_RANGE(4000, 0x0, 0x32, 10),
+	LINEAR_RANGE(3800000, 0x38, 0x39, 100000),
+	LINEAR_RANGE(4000000, 0x0, 0x32, 10000),
 };
 
 /* USB input current limits (in uA) */
@@ -310,14 +310,14 @@ static int get_float_voltage(struct max77759_charger *chg)
 	return ret ? ret : val;
 }
 
-static int set_float_voltage_limit(struct max77759_charger *chg, u32 fv_mv)
+static int set_float_voltage_limit(struct max77759_charger *chg, u32 fv_uv)
 {
 	u32 regval;
 	bool found;
 
 	linear_range_get_selector_high_array(chg_cv_prm_ranges,
 					     ARRAY_SIZE(chg_cv_prm_ranges),
-					     fv_mv, &regval, &found);
+					     fv_uv, &regval, &found);
 	if (!found)
 		return -EINVAL;
 
@@ -555,10 +555,10 @@ static int max77759_charger_init(struct max77759_charger *chg)
 		return ret;
 
 	if (power_supply_get_battery_info(chg->psy, &info)) {
-		fv = CHG_FV_DEFAULT_MV;
+		fv = CHG_FV_DEFAULT_UV;
 		fast_chg_curr = CHG_CC_DEFAULT_UA;
 	} else {
-		fv = info->constant_charge_voltage_max_uv / 1000;
+		fv = info->constant_charge_voltage_max_uv;
 		fast_chg_curr = info->constant_charge_current_max_ua;
 	}
 

-- 
2.56.1.839.g22a8290db9-goog

