Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430598;
	b=rZdH4PGbo/oczx6BKuFFNi70NXMzSjrUfpFtHcSQJj7JqyzlJcVM3E/Tt4ZdC6FyTet+
	 sPhetgz+y7uaBt/Ubg91IzkHtI6aM1+097nII5o8qQEQz+7DYRa2ve8aZelISLyiNBdxq
	 h+z2CBUp0Z7/2uJVCdp//seqe4iZPtZWvOxLAcqqOl6ZEhl2L66NZ4cV16zDwHXDw3eYH
	 E3vbnK8CbE0iv6sWo8aZa+NVxxaIXHnk99zuyPwHVXbpvg6S+Sk611onIlrnuMUk7RBN7
	 rFLIcvrowlVKQ6SfhA9h4wKHn+rbe1QiGduI6QXhCF+Rih9p/yAuqcfncxRlDWv4yTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430598;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kZH7ulLlOmLBHaQyYUqZ+qwps27nudFGjZP/GZkheHs=;
	b=WH5Vhdj6SEnLShqQTf41LHodUzpgNU7gmdB1kaVdbHsEgEiEykJS5ounPGilJ0w81zP3
	 EX2aAwISXBNaA+YqzammBg8fQpm8sOQqoNQGhvZ6JdbCyfH7Pm+NTH+3rGquQPhaS8hP6
	 yB1eUpOYOfOYXKd2gwSq02miIpaz2PwQIHOxccME4WFdXiEVcxApGiT1ntxhPLUWOPIGQ
	 Nu2Ns/8B7vMPXjZegUjCW9f70B+Ih2y13rnEytlEqVxJMLQibiR59xtA83wEzh3ZqS0II
	 9nTm3wK5zNJdHh3U28E40S5Z06H25Mf1dPQ9Nd7poTgpMHNNYEShgkS0TO27s9hcrQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COUwpExO;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECEB606A885
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECEB606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COUwpExO
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-84621d8c7aaso1658926a34.2
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 12:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430597; x=1795035397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZH7ulLlOmLBHaQyYUqZ+qwps27nudFGjZP/GZkheHs=;
        b=COUwpExOeKBprUiL7w71ptRx4XkSrdq6Kv1R00HlmD4/N5a2b7tIdlWD5oXU4HrhxM
         91/+QSParNC+A3/yTfkefmQESQ5w47pDd6dv2nDw3B+VTe1CQA9ZNFcagj734k/pSFQB
         0V8uI9KzLQT55dPvl+kOCmod/b3y+Dkyosx3sUutjQ9yw4ICpQ3FtEqOk20StObGY37H
         QdPB/9hejoxR4oaXN73O1AUchoHBHSirf/X9LCyA+1Cgf7MZ/gZq5l5Kgr3a/Q0EWhEh
         gdRnZZBJnawWuBg9bTZq+g5GMC5WIExpZEADFOK16V7UEAxEJMGnCNdpjxTo6FO3FBYu
         BldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430597; x=1795035397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZH7ulLlOmLBHaQyYUqZ+qwps27nudFGjZP/GZkheHs=;
        b=D15xBWmXLFu+RBTQ6MEf0iasKxF1haoDVngNwQTg/eS8HB3dxsld/Em14jtp5KK0I9
         r1UYaD7bSWniF2KkdMaswoY0iWqkmccxSu7tcDVXoWRSZ99d+EcI1SqYWpUusd4V7v43
         IrCsz0mqRUKxwYirc+mZg+rnXJB29y/aq8Nn2U5ama4PO/ApORNrQM9WOHgglmeOx/Op
         2PZqS+onIeOT4bVUqUMpPyEZS1E0sMsyPumnfkQvKZ93VanxkTmnP/jDRc1s56B+Ws9l
         tE9Z22rA09ge/WQE7NC4E/y2LCdCP84Sl4QitRU4reHrQQmFbbGbdl0sDU2Fg6/+vpq/
         8i/g==
X-Gm-Message-State: APuU4Z/4NQBhQl6wOoLbYVsZoTo4ipr+YoaYEtp3uOW2k0OzbjnKzhOU
	y4hzdmH6scVduFgNOaqj23D8yuduVnVx3Gh9CeTwLmSW9zHyX7obkvpN
X-Gm-Gg: AYBFou24XhWdhsHsaLvOJ7C+SCyIxRM5ZIUuh5h7Aq4n5kGh0ve/uTdp8U9WYIgsFu6
	ZvktgfJ4y3cJyXBvrRFZI4thOCj938OXA6BlTSC3x+fM7nV8yD+u0tJrcErGsSHOyAqKGiCZVJK
	7+YeubzjSwU5U+oibrvlYhfmtoCxKqo0SnRFT7rnqs/l6jJ7Jvp299ebpQ4mcAUxJq4JVgDxEcA
	j03SirBnOI2qdpPlLkfxeieTxzkyvi8ScRa/PCCDEihBefhaoraV2SkXkCT64egXBpIsCScwUNt
	ibYxLEttoIKE6kxiPqxOpS9NEOv201FK48axNEMJn/3nOlGRsOptp+dYd0ZLMpTKhGhQsHudsGS
	Bsr6b6J+kSPIX47udEVhlsDi7/C1FIuL5Jq5NkLeEgxjynFA0J5ZyXNHe4yTuIekVBwuduYtzkB
	ZEvd/9jdvK3+OQWZ/rA4xh2QPA3/G+zKGPBRKdbUy3iOacLqKJDeneEj01uYqBapYfWt6t6usVo
	ONj6kCsz8QY2k+e4gX/HopQxhyHdO/MNgePaNdVKnQ1G9wOFZ8Ao/uZw0P0O/nGDP6PqHYPJKta
	PQQYErQd2KpNoiN5GGllSh7bz7LIPg==
X-Received: by 2002:a05:6808:5198:b0:4f4:9314:af39 with SMTP id 5614622812f47-56b96bd3b81mr2711691b6e.28.1794430596927;
        Wed, 11 Nov 2026 12:56:36 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm6564231b6e.11.2026.11.11.12.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:56:36 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: mfd@lists.linux.dev,
	linux-pm@vger.kernel.org,
	maccraft123mc@gmail.com,
	heiko@sntech.de,
	lee@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Zetarancio <zetarancio@users.noreply.github.com>
Subject: [PATCH V4 6/7] power: supply: rk817-charger: Clear SYS_CAN_SD reg by default
Date: Wed, 11 Nov 2026 14:56:26 -0600
Message-ID: <20261111205627.56652-7-macroalpha82@gmail.com>
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

The BSP driver for the rk817 charger by default clears the SYS_CAN_SD.
This register tells the PMIC that the system voltage can be shut down in
battery off mode. Though the BSP driver also included a way to bypass
this behavior, no boards have been observed using the override.

When this register is not cleared, it can result in a persistent power
drain on certain devices while the device is off, as observed by users.

Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK817")
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Suggested-by: Zetarancio <zetarancio@users.noreply.github.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/power/supply/rk817_charger.c | 9 +++++++++
 include/linux/mfd/rk808.h            | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index d334941ade5c..9a8d14691f9a 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -1187,6 +1187,15 @@ static int rk817_battery_init(struct rk817_charger *charger,
 	regmap_write_bits(rk808->regmap, RK817_PMIC_CHRG_IN, RK817_USB_ILIM_EN,
 			  (0x01 << 3));
 
+	/*
+	 * Do not shut down the system voltage in bat_off mode. The BSP driver
+	 * cleared this bit for all devices unless a specific device tree
+	 * parameter was used, however I have yet to see such parameter on any
+	 * device.
+	 */
+	regmap_clear_bits(rk808->regmap,
+			  RK817_PMIC_CHRG_TERM, RK817_SYS_CAN_SD);
+
 	return 0;
 }
 
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 72419d311626..2bc58de53d82 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1297,6 +1297,7 @@ enum rk809_reg_id {
 #define RK817_USB_ILIM_EN		(0x01 << 3)
 #define RK817_USB_ILIM_SEL		(0x07 << 0)
 #define RK817_PMIC_CHRG_TERM		0xe6
+#define RK817_SYS_CAN_SD		(0x01 << 7)
 #define RK817_CHRG_TERM_ANA_DIG		(0x01 << 2)
 #define RK817_CHRG_TERM_ANA_SEL		(0x03 << 0)
 #define RK817_CHRG_EN			(0x01 << 6)
-- 
2.53.0

