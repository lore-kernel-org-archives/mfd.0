Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236325;
	b=ru6gU5iogXeZPPx0feoCu+cZx3S2jj+vU8NxEasUoKa2QV1BKIvoVEJe+ifcaS7NaX+D
	 LA25KVZrSwcvtMp+xSypVCDV+ilwvHPt4nDWssMgztgRYkOjGj7HsRIUnIJaVpLwCjPnv
	 S9QMvccxUS/iYPmkPGrj8rWCHFWM3x5WdN4hMFD30v7BACnTINuMr5PWhx9EvJcTNkD6d
	 kGrKRdUJQHGmQquCOsaww9VOdQKlfojz9i3gda/sKYZbmfoDMImyGxGQlGydK6kq3QPrP
	 LsJK45zieZWapqflbiRlRvn3j70WXzqrv+iCMb0sZdGWWDbVbZ4zp094EM9n4bpnACQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6y/oCXeZA/xU4FFB9st6cAy7P1KGmFoThXo49p+Yf0I=;
	b=UEEtDGKKVWA+ZdZhCNx6bvyE3FwOGyeIFt/0Yu4Ei8Tu2tZm5UIXlO/LQgiTmplg1+hX
	 IrJmWe5o0t8sKVWpDxzqK99ZQHdHWJ11sM3SHOTuUO6fE0nXlM3Y04zAW8242K+Zg5jTT
	 dUwH3cB/JwNjfcv4D5KoU+/Jm00xjKAAPvUVpAezM9mA38wpf+kuLm4vo3R1VeJA3+y5K
	 9DkYmss5icQm4SVxEXAT22Z+asqPsNyEM0H+wdtHP7AjC3meDIx4xuYD3pHgXZ2ujnHNl
	 uNs6l8nbxblEg1erR+dKHyNWVX5kWA6pGSPk/DgGu0E9NnOr2GhSEzyiaLYfGXgfrzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYnX43+6;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40827606A321
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 14:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40827606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYnX43+6
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-70b875f6f13so738577eaf.0
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 06:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236324; x=1794841124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6y/oCXeZA/xU4FFB9st6cAy7P1KGmFoThXo49p+Yf0I=;
        b=bYnX43+6V4bOiiE4MuomYhqBPiQI2C1A2WT0IJcmP6oD6RXgKAT5W+XP5xfhK/60y5
         Wu7K+s/Q7WtPbIJ0el56UHEBO3eiYingptt67xjgs/JIkk/8B8F68OZuZ/EaO6XBuAWC
         vGzWfOXPSOIc9voKG6vYWrzl2uqXe4dMlIqu9vEHPRJzWmLAFznBjzHryQGj7SqEmUnN
         1/3jV2EyNNEP6mkHizUKzNXlPhW+Lcm63tyMbAipDkYKQ22zU/Uwyc9AoMIbCUZNiUpv
         saKHETFzdikrGumHP6L7FKYTDxI0xHRhhTHaUMki0OsWjvXfpRegP7IdWFAS7MQR5z7T
         htsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236324; x=1794841124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6y/oCXeZA/xU4FFB9st6cAy7P1KGmFoThXo49p+Yf0I=;
        b=drx0SE8AK0WipJnF+2kePOu/f8YUeDTMA0Oz6XjY/uRdApuJgLLLvgl2SY2qfEtNt2
         3RhcXIEXjm821rYZK2lxV+A7/EMttpsa+1wShApDqTlcg0m56U9PV8/7omggqF64chvj
         2RP8+9Hvm8ZSRPYw7S4P2vx2UViTskcObEsVQlBpc4i73G91O6zbY/ZvxxXYrIWcNpn6
         XsILVwMlsKn4ZMN4OdYI+ehmJ0BNR1Mo9QFWLAufpoW4kr5zga9S/7gjD1oEmTTjd7Mw
         nC8XiRxoO9NlvLkGvWzXWvkfUFriT+M56uSdkerUglY+TBBHh0RHUjcYIQ1oxEhOz6lH
         ZsEg==
X-Gm-Message-State: APuU4Z9RJJ2D6zYwVJjup0883R5rgQrNIy6EFDOBUbyQuPYxs5zKDzsR
	CXae/3Sm1HXQ39vCwMsza7bOai10NhmkK17Hq/d44viWQCIZnOQiUNrL
X-Gm-Gg: AYBFou0a7R8WfXPKRllWAwul7DKVp4ouKzk2qhku8rbeoAxsaaRr8pJHWfQONfq4Mt7
	OJZ01NICDgwLl4kZb28IuSdFW2w0dHe7WHLR1TkI1pBWbqJERWPLJ8P0HCiQpxpjKsvEEJHYFGe
	oLNvycxnh+U0lgHyb5pQebZskZzFk421KXMFYcQYAAYvzZEJxvtQqs8Yks/QW5Ph7Ne72QE7j7t
	abL5JyG1DYdI0B7oxktPLQiW95ISEftRCF5Lpe4AYwTe8t5nowZ3VFWs9bZOlOBcJaiD3aT5kgw
	HSwtk85YrY5Z2ovV1JCXzK9k76qdOQEUNlDp1ODppkagjVZ6cF7p9GUbn+POS7mqE0JRLIIrser
	tj/fylX07gU9xBPof5p5dBpNURO2Pz2PWxHOdXN1GUmvsTCUHrDZSB+ZJDvMzviBpu9ePUXaE+Z
	/se5NqEf4WR/59xWGXI2//tOdWo14MBPdP8Lut8dQjtAlUvrQ5+fgMXSyIND6+LbDpikutOz13b
	Hqbq15uQrpdxNYts3Wz3IgtW3ZUw+zECa+QAw/2aLqrYgzVomlzKt26IuHLtmi619ZyYxf40KF7
	zeis1pfVpaus0TG9NpW76KUpg/rVgg==
X-Received: by 2002:a05:6808:bc5:b0:4c1:e6f4:f2c5 with SMTP id 5614622812f47-56814022c7cmr2987656b6e.2.1794236324258;
        Mon, 09 Nov 2026 06:58:44 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm4667618b6e.16.2026.11.09.06.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:58:43 -0800 (PST)
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
Subject: [PATCH V3 6/7] power: supply: rk817-charger: Clear SYS_CAN_SD reg by default
Date: Mon,  9 Nov 2026 08:58:32 -0600
Message-ID: <20261109145833.1363319-7-macroalpha82@gmail.com>
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
index ede89d84ab0e..0d1ec775304c 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -1166,6 +1166,15 @@ static int rk817_battery_init(struct rk817_charger *charger,
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

