Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430594;
	b=GumOfq7o7L/9cqpvYyFkVd0+fKIHDH6cg4oqC9CwxwiCwTL44WMN6sKsTnvexsAhfclL
	 l91qIEh8BmaTFXpvQhiBFEBk3SFK7vGXy4mZQ5rv9JcWGYlkHIvoadnDZnAMWV1JJsZqk
	 8WatVwkXcQNjWQjgOv7+27WXAMQLP2sv0WcXvUgcuEZ0toD1BY/OZh6GugmmtftcQAcxZ
	 d7MFEX8lqZZAJ5LRgJkw5usyij69XNd3BXm/4IG5WPBKlyh4ANaBMSMCqWYwIvgs6Syjz
	 Z1yEm0pqSdBjg7ezkGvKXUUbVi2/BFij84+/imX7pgESgLnP9Th5zWShy/zMeURxM3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RWGPS5KCwq3L9cW50zOJQer3a1hvbPza6g0viy0ickQ=;
	b=Tp61VquKz1hmwgO+qOdBahqn9oHUlTwLcQoFCDYL4gtSz4/vuWYC1gUZYls+UM5fLomb
	 ChSfskZCl6ddwTCZ42QVCGyBy/i4Syo4fVcfA8w5PCobiC5koHwu1Od4EBkl83yAg1zDh
	 CF/Ntw7iv3jdTZMfsbagCuHlUonWdRENIJCyPFVvfk0SJETTUUULyMTLRhdCQBcwgDiAp
	 g8Gkyt6kuhInPaImXqv3pzU5YqrlE1J6mWxYjU+j28/JAPDAS1B1ybKth8Crs38pnoZ/Y
	 HuXwNO/D9cOHfgCeBiU/IwL25oUwiuIGA3XTtGTfNH9rYC4+kFxOqyvgpyYHV3wb59Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2Bixvrd;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE912606A334
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE912606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G2Bixvrd
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4f66bb2ab57so1087640b6e.3
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 12:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430593; x=1795035393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWGPS5KCwq3L9cW50zOJQer3a1hvbPza6g0viy0ickQ=;
        b=G2BixvrdU7DXSpKKH7+8KatC/gDqXR9nUaeuezxN2D2dVgMolFFQ+R/6zLYeesvw0Q
         0z6fQsDr82c6WLBPn+nIzoYYMmlaobPabHgZXml64CBRQelusRyBCgBZuKbmvNC9n+M8
         Naze2DqyihILsiiefbRFgEeYs3l40HltH1UxHXZBVPOPYhmUFP1G9Ls/7f97WlRhMQo1
         i3aXgDGm0aKHXMisu08xwBj6lo1VHmwt0iFEEKE8zfZ870I34Yw3bNmNgcgKZ0pLl3K+
         BWlbbjspxP/5+sooTGDmCoE7k12+XxKtjT+VN/iV3Mwa7PchC4Upo5vtwaiqOsSoIsht
         JpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430593; x=1795035393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWGPS5KCwq3L9cW50zOJQer3a1hvbPza6g0viy0ickQ=;
        b=0yx3vK+zj6icJpQuHsGpTIdufVGJkS1yB03/ugQCC1IGAZr8VElsWY+e3lrYvKEvXb
         x69CyeT8kdDuUGGc7x67ojO73mvCPJ8YJkc83DX/+JWAT+EXDavX5klI39HF2Lvmizz9
         E7bv1idhHU+w8qdpMeCco9SUvfq4ev2t3aIgGPvLcJAf/zIsR5EIh6yLnTHbzWDH2qNF
         gJ6F0ABnyWek13YaLuhqf2PaeMMLiavjwMy46HTT1GYSvEnrqWXrw+ag2gk3V2FVefWf
         9CnDb2X8HGzfVhAioPWAWS7wkCd2NPKixWkNIHbTsnlB0vuPrB8PiaT5jK24eItZ+cY6
         cXKg==
X-Gm-Message-State: APuU4Z/2uWCTpwKj8u4rCu2qWqRuf3danQW6pGHmN79IzGOYFY6GrwW9
	2ONqbwokPx4HY21IBmEpTaaUyxFOj0EpsF1952ttMkxYm6hSLqW8zlkp
X-Gm-Gg: AYBFou2ljl/7pnBbp+y04FhQwsD056SXRP8RVJ1WqHtIqcCuiOIN2vi338pD0c0SzB6
	FttQ2aD3Uen9tAwjttNqitkO5+F5YVlH4Njg+VXWbjez2rKzBd7RTmgJG4+mVwFSfrWTuaXPZpT
	1W6fuFbuC3Zi0Ahm7vyP8/38rKHv1o6qyEi6uGDzgqgOWi6irvNZhdKwNp63OGKtYThGSLXM4hl
	H4YopXz+8ISx+Wt6Xid/6VB4z2bKQXp5hm9+HK7nlloEIEZaobeQX8FLhFNc2XFavkrGpe2myF5
	izeR9QqiDIf8hBWV8dTOol53INN1UdPH03xTz7T+mDgtxqmIT1kguR/sKWFPxLCS/BZqjGweX1P
	SpF/f1xw3kAeXVaAK66AZpX+laqWIqx81hcSKMAWC+uowCXIlHAxXla3lIv6D/Jn6mnYVwnwPHV
	y5987STD1/r2/NjlaZSeJ2OPNcfw6c53j1wB1AIH3R+LHAF9Gaq+em20ShXiNMvsOK67QfSxAkU
	cFzYBE1FkwDUexicd5TszLWThJEVlSPL8+NN6hPfVHm+zap7Pr8PQBpg3WfwE4b9/zjIFOrdodm
	HMmKFCtrRqGyYyTYnua4O4xd4C497g==
X-Received: by 2002:a05:6808:2507:b0:4f6:6041:f0a2 with SMTP id 5614622812f47-56b96def35emr3452223b6e.27.1794430592642;
        Wed, 11 Nov 2026 12:56:32 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm6564231b6e.11.2026.11.11.12.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:56:32 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Jacob Cook <jacobmcook1984@gmail.com>
Subject: [PATCH V4 1/7] power: supply: rk817-charger: correct spelling of coulomb
Date: Wed, 11 Nov 2026 14:56:21 -0600
Message-ID: <20261111205627.56652-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111205627.56652-1-macroalpha82@gmail.com>
References: <20261111205627.56652-1-macroalpha82@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Correct the spelling of the word "coulomb" throughout the driver.

Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK817")
Suggested-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/power/supply/rk817_charger.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 5558b182a1a6..674622398efa 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -83,7 +83,7 @@ struct rk817_charger {
 
 	/*
 	 * Calibrate the SOC on a fully charged battery, this way we can use
-	 * the calibrated SOC value to correct for columb counter drift.
+	 * the calibrated SOC value to correct for coulomb counter drift.
 	 */
 	bool soc_cal;
 
@@ -270,9 +270,9 @@ static int rk817_bat_calib_cap(struct rk817_charger *charger)
 
 	if (charger->charge_status == CHARGE_FINISH && (!charger->soc_cal)) {
 		/*
-		 * soc should be 100000 and columb counter should show the full
+		 * soc should be 100000 and coulomb counter should show the full
 		 * charge capacity. Note that if the device is unplugged for a
-		 * period of several days the columb counter will have a large
+		 * period of several days the coulomb counter will have a large
 		 * margin of error, so setting it back to the full charge on
 		 * a completed charge cycle should correct this (my device was
 		 * showing 33% battery after 3 days unplugged when it should
@@ -294,7 +294,7 @@ static int rk817_bat_calib_cap(struct rk817_charger *charger)
 	}
 
 	/*
-	 * The columb counter can drift up slightly, so we should correct for
+	 * The coulomb counter can drift up slightly, so we should correct for
 	 * it. But don't correct it until we're at 100% soc.
 	 */
 	if (charger->charge_status == CHARGE_FINISH && charger->soc_cal) {
@@ -307,16 +307,16 @@ static int rk817_bat_calib_cap(struct rk817_charger *charger)
 					       charger->res_div);
 
 		/*
-		 * Re-init columb counter with updated values to correct drift.
+		 * Re-init coulomb counter with updated values to correct drift.
 		 */
 		if (charge_now / 1000 > charger->fcc_mah) {
 			dev_dbg(charger->dev,
-				"Recalibrating columb counter to %d uah\n",
+				"Recalibrating coulomb counter to %d uah\n",
 				charge_now);
 			/*
 			 * Order of operations matters here to ensure we keep
 			 * enough precision until the last step to keep from
-			 * making needless updates to columb counter.
+			 * making needless updates to coulomb counter.
 			 */
 			charge_now_adc = CHARGE_TO_ADC(charger->fcc_mah,
 					 charger->res_div);
@@ -757,7 +757,7 @@ rk817_read_or_set_full_charge_on_boot(struct rk817_charger *charger,
 	bool first_boot;
 
 	/*
-	 * Check if the battery is uninitalized. If it is, the columb counter
+	 * Check if the battery is uninitalized. If it is, the coulomb counter
 	 * needs to be set up.
 	 */
 	ret = regmap_read(rk808->regmap, RK817_GAS_GAUGE_GG_STS, &reg);
@@ -811,7 +811,7 @@ rk817_read_or_set_full_charge_on_boot(struct rk817_charger *charger,
 		boot_charge_mah = ADC_TO_CHARGE_UAH(tmp,
 						    charger->res_div) / 1000;
 		/*
-		 * Check if the columb counter has been off for more than 30
+		 * Check if the coulomb counter has been off for more than 30
 		 * minutes as it tends to drift downward. If so, re-init soc
 		 * with the boot voltage instead. Note the unit values for the
 		 * OFF_CNT register appear to be in decaminutes and stops
@@ -840,7 +840,7 @@ rk817_read_or_set_full_charge_on_boot(struct rk817_charger *charger,
 	}
 
 	/*
-	 * Now we have our full charge capacity and soc, init the columb
+	 * Now we have our full charge capacity and soc, init the coulomb
 	 * counter.
 	 */
 	boot_charge_mah = charger->soc * charger->fcc_mah / 100 / 1000;
-- 
2.53.0

