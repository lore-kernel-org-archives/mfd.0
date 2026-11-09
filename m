Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236323;
	b=b5eAfPCjpTQl2bwY51lf++2vY3egQlSx4InRrBG1ITmAchdQNM62D6/WZ2sYzzPCnvS8
	 wAubrofah/6PXo55wMevC9RyxWKB2mmeBiQl6ID9izxFlk1k8Tx3gdgVBz2miPA7O22C6
	 QDpK5DjB6ZkS3Nwvd25bbQUWptAWGl2uQHH+0TBe+qd37++Cfi1lQFKqai84rMTCt84Vu
	 3seml7w0dvhRXklbR6oA3xcwYXJe0GNK+j7hK0n/QlTTzM/nOHzfIORzIuVyTeOW9KIGi
	 cbJVYtDzQ16gvwbKbjRv3SW9jPzRBPNv3Im7aBupJLYAyBBdsrEBRyyr2QfHZaxfwqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lvwOfzLc6z0XT7JDSFybwf/dtG+Oy9O6aFTtJV96gfk=;
	b=qN2oewKMLIDi1saLYKV18M+CVHmTl/nbbZdhzpyrpGsgAuyxQ1U737yDeflAv/KXwV0F
	 0ScWbTzEHGVBj9sJOpDIURi4rMcYccpj3Y/sfkiIqRSyQpwrUOIArc4aWIEsMe8o/ywqO
	 Oo1wTyTzppLLP/IfdquIw9SoNL7b+M6xDThz9rLa36x8gvER/QyG+XQL91q5+tomY5l4b
	 7rSHE5wSMi06v+FBG236B7H6k7obUSW5W97ChjgHFILnq2aKXtNfbxKydaN+3M/97rrUN
	 HAVAtlKk8IxFqjHejeMt7fTWKpL4CiqTxaaAxpMQmYfXmv4LBIJMrpE6t4kF7FbBp2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMbnAs6p;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A7606A322
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 14:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52A7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMbnAs6p
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4877837890fso461003fac.2
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 06:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236322; x=1794841122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvwOfzLc6z0XT7JDSFybwf/dtG+Oy9O6aFTtJV96gfk=;
        b=FMbnAs6przDlNo01xBeTx2F2jOr+efg1TDD852CTG+SYUsAWN+uZgkzDcQA7gtZgmk
         bO7f31saooKC9EDw1M22AhIWabEf6Gwsjk4PZXIj/X/bAV9LZZMxE4xKwAyHxdJMK/tx
         9uKBVWbAJPDe8HZPCdgo76kwwbuI8ezFEbg4EWPb6UDCI0vLxeGJOc+HGVes9G8sKbLn
         vhklTA6rnyw07Rc7NgzN2m+hAZ6dcR46yGmdgOfVlnS8C1KcJXdWRh11E8+EBnZA8X8J
         PDz9/lJnHqd6eBKVTBE5HAaLFcGAP62+V8UmyTirBEjsnHQptlIUix16QZlHlfIn/jnh
         zGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236322; x=1794841122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lvwOfzLc6z0XT7JDSFybwf/dtG+Oy9O6aFTtJV96gfk=;
        b=vB9eevOGPM1LCx4sIghi7nJJEX8m4TI2lFmNBfpTmvP1FxZDPwMg/9T7Ede5XkThGx
         Kw6XEUE9n1+SlRnreWA/ovVG3hhFtWMd4E0ENgg+dvPdIw32f+l9YioLZWbLrtrzZr00
         iG3pXRDJvXiI/DuvlEf+bQKWjd5VHsCJb/J3IxaWdsWvGKj/LpL1j4JPL2gmUBCdexVZ
         wv5bPVmJ3qTqIFUV9qQJR75kDSaiT0fUtmnmr0/Wvurp0doC6gXfwsbQkUImRWu4lmDt
         CE8pchaLMpbM2yDRuH0rkortuCavWc5jwKhqpItvX0P4R0XaGs+LH7yzY7OsLT8n6FR1
         +6iA==
X-Gm-Message-State: APuU4Z/EqKFUIdJrl/qBbqF5At61HgFVQv6HCpD2FR9bHRMTqzpdC7Yn
	M4yZN3MbbKe3FhP8Kg1py7IT8zqlXad3i6Pw/ahQFKH1kqD9AZWXyPcL
X-Gm-Gg: AYBFou2i0PmkDMVTJl488Spd7n30w95DdNiLYXDqpYGSZte5PKKczL0EWd8M8OLqdA0
	D6ZL2nkqbs828HJ2yBLkrtTgoV2c8UfbjNdn4gEOWSKI2VtagyDmwv4xcqaf4HG8GhIYjI8RvI3
	YzMdYG15ziBgj2WX4KuMmNgZI+ve8EVEYcCwnffYR92ngQPtMYvgc8jCWOIOmMU+oFs/PG4b24A
	yzDsQhNuTUyTbxt38SsiFoQ8+odqOIZVbzSpoYvcHywymrkm/Xeh8nl/g1nZC+fwyXiEVp7UWdf
	UrjyQyLxw4e2eCZVX4yfqwqf0EZ0i24PJd2s7vWjZo2lgW0HRxfHJU4m0iCF+gWanjinP4Yv8G7
	JAEzKB6N5RujtAzoOefaSZAFAKADtUP33z4JOnFbOapKlDAx98TSqDxZSCu4cLBzt2IX1TrVKV8
	P0Wiq3uZlA3jzElL6Y5zlD+YfTTIEspf86AmTzqbf6cTYWp0dydlrIZFZjU5hSNESf8/XhjUwwT
	SUVnwSc9yfpi2MNXCYObzSeQqzDacpCnxGCGwzgObcFB/Q85bYdAZv3Gh7NQ/4+3YkOwQX15DAO
	eCNxY0muFAKuJc8niyzRVHhbMZRLXA==
X-Received: by 2002:a05:6808:4f49:b0:4e8:f740:f03a with SMTP id 5614622812f47-56814379845mr3502958b6e.27.1794236321610;
        Mon, 09 Nov 2026 06:58:41 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm4667618b6e.16.2026.11.09.06.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:58:41 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 3/7] power: supply: rk817-charger: simplify re-initializing coulomb counter
Date: Mon,  9 Nov 2026 08:58:29 -0600
Message-ID: <20261109145833.1363319-4-macroalpha82@gmail.com>
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

There are multiple places we re-initialize the coulomb counter. Create
a function to do this to make the code easier to read.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/power/supply/rk817_charger.c | 44 +++++++++++++++-------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 39c945622c4d..8843871948b9 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -167,6 +167,20 @@ static int rk817_chg_cur_from_reg(u8 reg)
 	}
 }
 
+static int rk817_initialize_coulumb_counter(struct rk817_charger *charger,
+					    u32 charge_ua)
+{
+	int tmp = CHARGE_TO_ADC(charge_ua, charger->res_div);
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
+		ret = rk817_initialize_coulumb_counter(charger, charger->fcc_mah);
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
+			ret = rk817_initialize_coulumb_counter(charger, charger->fcc_mah);
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
+	ret = rk817_initialize_coulumb_counter(charger, boot_charge_mah);
+	if (ret)
 		return ret;
 
 	/* Set QMAX value to max design capacity. */
-- 
2.53.0

