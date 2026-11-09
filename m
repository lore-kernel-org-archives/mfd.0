Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236321;
	b=fgWqKLbC9kJNVA+WxwXmqyP1b/MMRcaDoSepIq4JY1yBF1hoZCW9EZrYBtIQQ6OSe9vt
	 7pTPW8DbJk65jMCg3fKlVUMsCy6kpVhXJ0Q51s6YqdM1lWSvC4T+amdq1tZqswMQEOSzg
	 iJrMiHmNPqHc7+5W5cQsIvPaXJ94sP52WhO/biW4ubaiv0xc54xhJL/FG7eSlwLtAufR5
	 LRCyIytO7+ir1ayosD/PwQcKwzE+JOrQZU/N8JmQqumdqZsc0o16RHlIlIKRk4QLYn+Mx
	 kou5ksjJAMelJS+5GipthVTOr+23VqShU4QiIctt/CRzXeea2/W9awSeVI9jp63ppHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RWGPS5KCwq3L9cW50zOJQer3a1hvbPza6g0viy0ickQ=;
	b=PthNq6xkVFgSR20BrmpCD2bublSMWbjQ4sYVVni9Cqm9J2uBH/zxAgx3EWuhbSYWiBJN
	 gnc+rlRIUbwvC1fSu86kIvLk6JiOHYCFyi61KRUXyA5uqVa+k83/idW5grssUuQtLPksy
	 Bc9BmtFc43OCUdYIjOMnhcLdcbcBA3btlc5buaONOHo3UgrbmbGBhKZjaEcCTcHf79CuS
	 p6i5/VBDbBo7C8e5NPxhuA32Uq9Y10Q6w/lo2s6cGWT9LtfkEvQR8HZPvm5OlU5/idLbA
	 F9MoyGR9b1HrdFf0fovFw0m7n9aEMH2neB/bZ7tCYZ1ZHpxDQiS0MjYB7x/87aC1sMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Io0boFaL;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EEA606A322
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 14:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9EEA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Io0boFaL
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so585055fac.2
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 06:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236320; x=1794841120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWGPS5KCwq3L9cW50zOJQer3a1hvbPza6g0viy0ickQ=;
        b=Io0boFaLwzPnCH5jxMDot0gDfR9Jx1DyoMCel/JME99kacmIA8SLm0dGtcqPKg1WVL
         PevitbkBbI+xOuxKbzf/XZLNQPfFnGKDGym7t0KBKaDNI43vAwaV+8/d5KA2ZREUnsgS
         g8ZEjmF+DZGd3eMhVIG/CjLZAf1ym8dhL905aUTiBiyB4RvGdpYHZrfX7Ww5frcVehV1
         Nvr9hhN77O+jxzsgsnTkTiHbvt6rQDJSDtX0IkHbiDT0q949mtLbaJ3MsXhnG7Vhe94H
         LdNPAKmg9dadeuPY531uhiUFSKG6STiDP5A/ighqOZffP2Ry4QKnuKPPqjX4OBfWrEUy
         VZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236320; x=1794841120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWGPS5KCwq3L9cW50zOJQer3a1hvbPza6g0viy0ickQ=;
        b=XMjQ9JO9nFXWYf34/vYYohHzdwg2VM50cqXmFMN6wL04ILlc1uKBEkGMN/lBi0U98R
         g1fzRVWT9SgQutdyGgQklroo7m4+r5+HNkAnGM6w9hz5z7uBbEqrUKSkEw/ehQPjJmJr
         Nw/cQ9ug11zMMWUV2Z2/GziXisN25/JJLOm2Mttct7yUATYoPSYQ80jiOFnfrpZSyGZh
         k3duPtS3XJ5j/tPufICuROm+M2Hh3CTTfQuj6iUJ0X1axAQrNmMRwro1HkWqe93qTSBJ
         /Y3YublTztfxu7tIUV/k6CQgMsOcF4QhbCamPb3fY3fTc2BxjXjX75OosqvRL/N2fLBq
         hc1Q==
X-Gm-Message-State: APuU4Z9MzYcplzI97JDx4yZwfM+2b/8fvt2nTa1bEyjujRNpof7eGalO
	1wqvN7uhlKwHa2uk3gHw/uCIcIuDzIkAs3JUtpWLRj8T9oOIIP6dr5am
X-Gm-Gg: AYBFou3B73o9zE7RDLykfvthEigC5eyauBydhhyVivzuH9OoJ5cwgrIrneM+MLF4hgv
	FuCD/NzqsEg4EYrFHRjcI/iuv6hlEwMxvTkixnFF+MldH+xZJTrB6GiB2xb7KP3Y/vFhMaC2X5D
	pHIkHDRQTjDyvikBWF2U7kzm9LqVl0YdIcCgAVjdQyb45n+fdJGQ0jZohhU35gqGLozVf+76lvn
	fkVYN53FQtLxIMSj4C3cEKVXg3Np3kt69FED7XM26Nq8QMdJEG4kmMKiLsgDq0tZK533+mtMxZx
	b1xaqC30vt1n2w8BMzL4mTRnUxbM0kxOwC+l0LZqT5Rx5hWzrwc4AfuMChUqswSSVlZPUHs/tjd
	i25bszjACdlfeYVLshMI5oPTgT172yDLSyn/oJllsfHInQY0xrZj1m5bHTEEjOITJkWYP0hWY2N
	WXrYCiIZ9hUyNcv5wjHjx/cdTS/tflJaE4YZn5iriq3den42jro5PB2fLyRE1tzhnaxn98UdqZZ
	EcAsPgzJT1EbV4tr/EkXyByhWD2auBsPUvZk0dG3atDNsCVLlar4IfdSlM2ZWm3kOyN7h7SlHq0
	eSnmF4OorzwZKozu0aLw3xQWtp2nng==
X-Received: by 2002:a05:6808:6605:b0:4bc:fbd4:2a43 with SMTP id 5614622812f47-568147560d4mr2872449b6e.41.1794236319604;
        Mon, 09 Nov 2026 06:58:39 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm4667618b6e.16.2026.11.09.06.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:58:39 -0800 (PST)
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
Subject: [PATCH V3 1/7] power: supply: rk817-charger: correct spelling of coulomb
Date: Mon,  9 Nov 2026 08:58:27 -0600
Message-ID: <20261109145833.1363319-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109145833.1363319-1-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
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

