Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430595;
	b=eT87Omo13pgZeeUY8ZuC6w/AwfkFbIeEDsjObPj9nacK+VVjIDuEpyMAKl45u0Xcn92w
	 MFGWWCqDWmfj2tLndoz3nwF+nPP2L5c5AjC8sWPgRAli1cXnCwX4Ks8oyI1vLmIi5utWj
	 YM5CK98BtehW9oTTyi7WrBt3gGVAjNVvrNTR7vDlnsYlK/BErFZoryvrkIw8zRCMYi6qQ
	 aHoBAyUqYcmVhIH76vM5FGV5nx1SeG4X/TMZopsDWIan60ylvMcXlRDtjrFgFvSK8aYlg
	 SQmaxcKI1T9TQUUpiLpE6C2BQBpNfax4jrAKk50DwelyPI1vC7+jw2hDL5bBMDm27Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Dfuuvi8PqCWBIxnlWDIfk4bUIBmycxlNRhh1kkQb58s=;
	b=ChTFjngM4TgUeLyi5Gv114mzTpsNe/aYy1gQ1Y/v/7cCFlsqmepERfUnVJu8rod/T3UI
	 JF12koy2y+TU7VDlQg8ob0CX54COTazcmvKSFbWJYfKF/AGVYGFkyaT55Kzn+4KKhpB4F
	 X+485mdhtjEsfjKo0s4kAj0Bm7Fw64B39EPNcb8T5xLIYSU83Ak6dWEybhWIkibK3U1ba
	 ZzBwbxMV4kO5n/bWyHaHtav76N/EIJkCvJHE5MCOlC7zfJ8WPwHR5jdhsFLNR3YDKNPKD
	 enqIE73Gohx39bipvYHGW7Ho7BBPWyoiKqVP6RDtssuFTRuZjBV4fuokv+aY8VB3QZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6MmWg8m;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FEB606A33B
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53FEB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6MmWg8m
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-451a49abd8aso3408146fac.3
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 12:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430594; x=1795035394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dfuuvi8PqCWBIxnlWDIfk4bUIBmycxlNRhh1kkQb58s=;
        b=t6MmWg8mSDUdZsZ8W9A8ymvUvPFzgkFEvdxfJF6NAARSWG2jAtWpPMc53HVhnuzmeH
         ODmyuOGeezlDo+6RLq6c6jOlhD5IztluyPNj+jBWZ+KIOmrP8qlwTCxZeMnWMh1iukoR
         TE5MJ+/lIJQGZncpAE9hlET/1OI5HEernLrhgu2pZCvEVmIDIks5NYYvUEjlnGR5TiEx
         WRjsWXEsGVlOra0ivKk0sJ2J+TaV2LzDmue+ekUPqhhyKcYV1UHciVLFdpjPV3Vdgr/n
         EOQG6SVYmuydBOHWVS/LB9iaXX5aMifTLbzTPvHB48ArzJ772BNAGRg1viMOEPDWvC50
         /u+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430594; x=1795035394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dfuuvi8PqCWBIxnlWDIfk4bUIBmycxlNRhh1kkQb58s=;
        b=pZQhH8v8uy6q/Vm8+z8oEBoeiLj6zgZ0T2u9syoDWiE77GTAQZxhjtEVu+aGLFoNl3
         6uqtv/9k/afweFy/3U8C3uOTEl7Z9ySyVXIPO3qRtIxjoOhrcepFnIvCBrZo+76ZzNIJ
         b8qjnQusFtCFUmefEmeyU6NzvCMe+szpeNOaYM6iIxTiak6fH4ffJsLSaLQfvfoDyQ6m
         eyAZiATeh0DzBd7t1kB/kyWTkBqhyBngPaOzdX60gws2AkaeJP2JXopbbNSCadQHOR3J
         FCZEbqRSnWJvBhwZPg3R02pwlGl1b2dVg+Jh2zjZ1oYz829uN3YXvTlZoyE1ckj4WoRH
         Gtdw==
X-Gm-Message-State: APuU4Z/fqNRmQks0Fe1MFtBpOHRTsl8iYetnaQT4kJjx6n8B3qS20u5i
	Dzg5GuPwCHI6rQIQT+9SMdQVmBMRcj/SMrmll1X9KS2vu8b9Gx7YoW48
X-Gm-Gg: AYBFou239ZKylDPCLkWtuK4AmddJgWhImUrGlX2/GwxUrbbDj9Cd+ERXQj6SKzcLdN0
	0j9JZiPZTohMutYB8ZB8LMb64D8aw5Pfc0S/zatYg8wDuRsKvBcPuvu8IwvQ4PYXstxVw/ntCRO
	SxmVxNyMTXVAn2DMEzV036pJSfc/3qUzCjVSStC5sUZbA8nWxXa8duPIIvNiu0wM0GEsazbZuT0
	GL6ZiJ1s+NaMmilamLV8V52Tcw1dYBoh7Uwglkukx6k3/FOOsTIzIpOytpY3GY0MN+lQ71HThcn
	PRZ0gXGSTEl5obi6r1ADsGI4P9RLBYTW9v++rWn743DLr0maCfeK7fKnOTL3FWxOXY/TRgvWMgw
	Z9il8VWNcBxqAFo19uiB5sR/lQH2PGakaju2etmItFvcVBoZPFjTUnNpinAvpxm9rZKUElQ8jqc
	hiCgBu7hWT4PNW7HO3InLstEUwSwsvHbSei0tKFw6KsAoKKq6Kxui9rYc4U0bhirb3faaBouAm3
	aYRyY6TfjXWK8v+aDdR/OkesXdh59/aBr6A9vIt3w9Yo7FZsU+s2TTtXcoUkXEgQ25TGn46I9II
	6DkE0eCyAv2xu6ablfz93t8GONEz8FQ=
X-Received: by 2002:a05:6808:c12a:b0:4f4:4eef:52cc with SMTP id 5614622812f47-56b97717f4emr3116599b6e.43.1794430594226;
        Wed, 11 Nov 2026 12:56:34 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm6564231b6e.11.2026.11.11.12.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:56:33 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 3/7] power: supply: rk817-charger: simplify re-initializing coulomb counter
Date: Wed, 11 Nov 2026 14:56:23 -0600
Message-ID: <20261111205627.56652-4-macroalpha82@gmail.com>
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

There are multiple places we re-initialize the coulomb counter. Create
a function to do this to make the code easier to read.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/power/supply/rk817_charger.c | 44 +++++++++++++++-------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 39c945622c4d..939d4fefff14 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -167,6 +167,20 @@ static int rk817_chg_cur_from_reg(u8 reg)
 	}
 }
 
+static int rk817_initialize_coulomb_counter(struct rk817_charger *charger,
+					    u32 charge_mah)
+{
+	int tmp = CHARGE_TO_ADC(charge_mah, charger->res_div);
+	u8 bulk_reg[4];
+	int ret;
+
+	put_unaligned_be32(tmp, bulk_reg);
+	ret = regmap_bulk_write(charger->rk808->regmap, RK817_GAS_GAUGE_Q_INIT_H3,
+				bulk_reg, 4);
+
+	return ret;
+}
+
 static void rk817_bat_calib_vol(struct rk817_charger *charger)
 {
 	uint32_t vcalib0 = 0;
@@ -242,6 +256,7 @@ static int rk817_bat_calib_cap(struct rk817_charger *charger)
 	struct rk808 *rk808 = charger->rk808;
 	int charge_now, charge_now_adc;
 	u8 bulk_reg[4];
+	int ret;
 
 	/* Don't do anything if there's no battery. */
 	if (!charger->battery_present)
@@ -281,11 +296,9 @@ static int rk817_bat_calib_cap(struct rk817_charger *charger)
 		 */
 
 		charger->soc = 100000;
-		charge_now_adc = CHARGE_TO_ADC(charger->fcc_mah,
-					       charger->res_div);
-		put_unaligned_be32(charge_now_adc, bulk_reg);
-		regmap_bulk_write(rk808->regmap, RK817_GAS_GAUGE_Q_INIT_H3,
-				  bulk_reg, 4);
+		ret = rk817_initialize_coulomb_counter(charger, charger->fcc_mah);
+		if (ret)
+			return ret;
 
 		charger->soc_cal = 1;
 		dev_dbg(charger->dev,
@@ -313,17 +326,9 @@ static int rk817_bat_calib_cap(struct rk817_charger *charger)
 			dev_dbg(charger->dev,
 				"Recalibrating coulomb counter to %d uah\n",
 				charge_now);
-			/*
-			 * Order of operations matters here to ensure we keep
-			 * enough precision until the last step to keep from
-			 * making needless updates to coulomb counter.
-			 */
-			charge_now_adc = CHARGE_TO_ADC(charger->fcc_mah,
-					 charger->res_div);
-			put_unaligned_be32(charge_now_adc, bulk_reg);
-			regmap_bulk_write(rk808->regmap,
-					  RK817_GAS_GAUGE_Q_INIT_H3,
-					  bulk_reg, 4);
+			ret = rk817_initialize_coulomb_counter(charger, charger->fcc_mah);
+			if (ret)
+				return ret;
 		}
 	}
 
@@ -846,11 +851,8 @@ rk817_read_or_set_full_charge_on_boot(struct rk817_charger *charger,
 	boot_charge_mah = charger->soc * charger->fcc_mah / 100 / 1000;
 	if (boot_charge_mah > charger->fcc_mah)
 		boot_charge_mah = charger->fcc_mah;
-	tmp = CHARGE_TO_ADC(boot_charge_mah, charger->res_div);
-	put_unaligned_be32(tmp, bulk_reg);
-	ret = regmap_bulk_write(rk808->regmap, RK817_GAS_GAUGE_Q_INIT_H3,
-			  bulk_reg, 4);
-	if (ret < 0)
+	ret = rk817_initialize_coulomb_counter(charger, boot_charge_mah);
+	if (ret)
 		return ret;
 
 	/* Set QMAX value to max design capacity. */
-- 
2.53.0

