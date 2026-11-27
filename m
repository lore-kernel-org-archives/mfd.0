Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795806600;
	b=g2qziIHevZRqEpt2MrOtyZwKGusJfVcr/I6fMMK21VpXL6iisXPOLgTsLzIC14lDEptS
	 OOsR5/gycmToYhQ6UHuWbpWK9ZMNMGG6OeFelhN6oD1mxGM86AplaoY0W8i/PAiunzgvU
	 uyy0AEIuQpI9EhZG4ycIXPrX0GliJitKnergpF20Lw48I4uQfk/cdadY/Q9edIv4IyMnL
	 Ar8TautzEUIqh/Sz4Tb2MciJPq8xMkFGvcaZDz0/Dsx/J2SbBPKuz+ykEHNwltPG61xFQ
	 h6UMrlQ4svj0GZtahouqiEnTVseWmHIgjcCroeNMj1sb96kLt30OoHyEibgu1NsS7lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795806600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gMUEHr5+RLy5VN9K88In7HKPCt0PQK7KPkn/dGa+2MI=;
	b=wgm2EuGIEHUxPgGRpZzlhJZZzXGWgUTru+1nrvZWSW1x8tucaekiroajwZzgZ2qJCJuB
	 iYz4PalHw35jIBZv0ToWs+SSIDX/WQjpenHd8SJs/sch3nOk+moc2sLuSIox3v7rhMR7V
	 kwX1J8CFHZoxQcrxnv1Sf8pHkC3nNSmr0OMOAp4k9CYZt5Z9e8kh6oy603ZdWm/NWSySe
	 kd95oyEDuzyDg6uI1161PmjIUQazBuIHndWlzX1vrzIZHWVupeModGO2ELaeY11zxA4WT
	 qlBmTD1bUARG1LziDvSaOQiGIJ3AClFncwNvt6Q5o8V8X1hOC/QgyfPep/B7LEdIFkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aLNoXf3x;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EFA606A6B2
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1EFA606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aLNoXf3x
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5126505cb3so1105529666b.0
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795806598; x=1796411398; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gMUEHr5+RLy5VN9K88In7HKPCt0PQK7KPkn/dGa+2MI=;
        b=aLNoXf3x1EimRvyPl20bf8BVcVwwV23M1Xwj/PYSrTEcLjNo3ElWrJicz+zZz89DzZ
         SuCbVtuv8Urp0FgdVWvV23URj73NJRJagc3CnFCh8oltAILNwoWUl39WZv+u3VHAgDP2
         /b8KeaobZ1RfM4vv7m+FrpVhWDAjT9FFVwwilVhpPWvZS6rZtyqI0GbZdRbILivHPkux
         BIvyLzOW5gKPQcLODZMlcNFfQgk4dLPCpdwUMJ9fBbcFG+o5NdB4rG7Sss+oDolHt1Y7
         Yk94Uz8Bjr8EDVvk+Q5FiooD1UZwWeLhlA7c7yLX3fLlHYodidLdZQJwld5l5tOZxd6Z
         SZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795806598; x=1796411398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMUEHr5+RLy5VN9K88In7HKPCt0PQK7KPkn/dGa+2MI=;
        b=b5CikHoclk3gkiJgxmAI7J0kIRKhY6doXJHxIpP8uI8qMayW/dueZCTqLneqKKFsiH
         BQ518TOtAlmLZYLTS0t4Fxrb/Mmu00St65uKFNZkx3vfb14uFOlsFIoUP9dEuU4izFZv
         OV3RWQwktssM5wTOa9WpLs8w6SbLrJJXaeBjXqXEvbQ0JbXqcAI1PMvh31TU9IJzh+0x
         //2jPMeDxyM1hD67FFgN4X+cdnj5z4GphQbwpNo/rMztHy5Mz0E2oSVQtmzRwS5kevmU
         +pj3rDK/OqfIEbSgRGGScC38ECqUEvbScYrZPr5mk7WLzODApaxL3Z2poLxcClFd/BCL
         RYig==
X-Forwarded-Encrypted: i=1; AL+hErGFc6G7EloAHLuVsN5mEFlxVmNTAW/mMxt5yxYbEPpkoTlppuYK1jTCNq2sSQhZr4+BLd0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/6agdfqQq4S6w2JrTo4vIrJBUb/9k7vf7wTunB/vLCdvCnxcYS
	bd9dLykZeUvvqk/hH0xb+e3AJfawHcpQbTP2H/azoHpO9MgtqCSjlfkUpZ1LCrlS63c=
X-Gm-Gg: AZFdTZf28FS6B1Ekg0MnOjBHgztvCi9ug9i2EkPsEj0Hy8XUE2Khm2jvofNCDFzJZhv
	7njOpdvGDklt2xdPwz223eBthdRzpWdyQTyskPOuHE4O/7y9bGDkj9oJgaU6DwZgDBhpehjYm/j
	yL2E6S6RtjHeBMxHHBSXVKCTwBJIhszbUSQ+63/gOuFx8w2HrGUXftxbl9SoCLJNhp99Ih3oN6a
	001zeBVV4zo1TrppKh0aFhAPwaXroelKYpbRvCVn2yawJyKwF8KeVqgRodTCgTl8RnsAAolk+W3
	/UgmAKIxojBo7d3yGYyes56BW5ZR7Qru+aXH+CjTvijJ0QlKV6drkqqram9a+N/+hn4GhQaZi9g
	dP0kMS9ahvjd4orryEb+eqZESUJV4UqulSQEgBosbyALUzjGdPb1fwDFvDtfyslWhU6QPphoS04
	jcZnwiQEHrFWUMr80SUf3108bDtB7iAKmUu0Wofu1H8eYaVSqFaCRlCmWVOT2UcCMcZx5JhHEFK
	T8JI2evEjqtA3q9ib/y6cA9sYhMsHORNfs8DkYDyRCxdBWcNQ8E2PJdwy8/4hLPnbt0ExtAsjoH
	n6Cy+mA6Ej3sEX2x7ETjY4JwV51tebY/19IdBvikQrNZx1I6RmvTcGpzax8DfkrMff4n9G7kJ8N
	l2ZFmMPg9sVI7U8PmSA==
X-Received: by 2002:a17:907:7f91:b0:c50:c747:a4ce with SMTP id a640c23a62f3a-c513a4b083bmr2229259766b.4.1795806598370;
        Fri, 27 Nov 2026 11:09:58 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85fdsm909175266b.69.2026.11.27.11.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:09:58 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 19:09:56 +0000
Subject: [PATCH 5/6] power: supply: max77759: sync supplier state at probe
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
Message-Id: <20261127-max77759-charger-fixes-v1-5-b364a0862d72@linaro.org>
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

Supplier events emitted before max77759_charger finishes probing (or
before reloading the charger module) are missed, leaving charging off
until the next supplier event.

max77759_charger_probe() calls max77759_charger_init(), which forces
MODE_OFF, and then registers the power_supply notifier without reading
the supplier's current state.

Extract the supplier read and work scheduling from psy_changed() into
max77759_sync_tcpm_psy() and run it via power_supply_for_each_psy() at
the end of probe. Hold chg->retry_lock across the property reads and
state update so the initial scan cannot overwrite a concurrent notifier
event with stale values.

Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/power/supply/max77759_charger.c | 61 +++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index 7a7d9a54d888..fe71e8143954 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -663,34 +663,31 @@ static void psy_work_item(struct work_struct *work)
 	}
 }
 
-static int psy_changed(struct notifier_block *nb, unsigned long evt, void *data)
+static int max77759_sync_tcpm_psy(struct power_supply *psy, void *data)
 {
-	struct max77759_charger *chg = container_of(nb, struct max77759_charger,
-						    nb);
 	union power_supply_propval current_limit, online;
 	static const char *psy_name = "tcpm-source";
-	struct power_supply *psy = data;
+	struct max77759_charger *chg = data;
 	int ret;
 
-	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)) ||
-	    evt != PSY_EVENT_PROP_CHANGED)
-		return NOTIFY_OK;
-
-	ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_ONLINE,
-					&online);
-	if (!ret && online.intval)
-		ret = power_supply_get_property(psy,
-						POWER_SUPPLY_PROP_CURRENT_MAX,
-						&current_limit);
-	if (ret) {
-		if (ret != -ENODEV)
-			dev_err(chg->dev,
-				"Failed to get supplier psy property: %d\n",
-				ret);
-		online.intval = 0;
-	}
+	if (!strnstr(psy->desc->name, psy_name, strlen(psy_name)))
+		return 0;
 
 	scoped_guard(mutex, &chg->retry_lock) {
+		ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_ONLINE,
+						&online);
+		if (!ret && online.intval)
+			ret = power_supply_get_property(psy,
+							POWER_SUPPLY_PROP_CURRENT_MAX,
+							&current_limit);
+		if (ret) {
+			if (ret != -ENODEV)
+				dev_err(chg->dev,
+					"Failed to get supplier psy property: %d\n",
+					ret);
+			online.intval = 0;
+		}
+
 		chg->tcpm_online = online.intval;
 		chg->tcpm_current_limit = online.intval ?
 					  current_limit.intval : 0;
@@ -699,6 +696,20 @@ static int psy_changed(struct notifier_block *nb, unsigned long evt, void *data)
 
 	schedule_delayed_work(&chg->psy_work, 0);
 
+	return 1;
+}
+
+static int psy_changed(struct notifier_block *nb, unsigned long evt, void *data)
+{
+	struct max77759_charger *chg = container_of(nb, struct max77759_charger,
+						    nb);
+	struct power_supply *psy = data;
+
+	if (evt != PSY_EVENT_PROP_CHANGED)
+		return NOTIFY_OK;
+
+	max77759_sync_tcpm_psy(psy, chg);
+
 	return NOTIFY_OK;
 }
 
@@ -773,7 +784,13 @@ static int max77759_charger_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to add devm action to unregister psy notifier\n");
 
-	return max77759_init_irqhandler(chg);
+	ret = max77759_init_irqhandler(chg);
+	if (ret)
+		return ret;
+
+	power_supply_for_each_psy(chg, max77759_sync_tcpm_psy);
+
+	return 0;
 }
 
 static const struct platform_device_id max77759_charger_id[] = {

-- 
2.56.1.839.g22a8290db9-goog

