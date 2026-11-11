Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430597;
	b=l5MK2drQm3yDBAmgG6oEkUzCcGvioXL6y1hvl4n0IcbAn+WDo9KWHYzcTQ2KAp4g48IB
	 wcKSpuJXyGt4AKUX624jD/sgBhpJVAGGIoXnYnjD3ZbVQC/pJzFyficygVMbHv6l1GaLX
	 5HW9AapNzlCGiiZz6+giS5qizX0bIXTDCsyDX88BXRV5+HtMiT3X/0ITH0kUkPIEDxxwi
	 caI8BD4TxDm9U437g7PU3hOySLvd3yw/Wmr7YBXa1sd6k14g9G3fFBeIyTiFSKQ+6iIf/
	 VTtnbLQ8CY0NArKRwQzHj4jZiRyBCzyuajr9Gu7/R9teAtrO8OKgn4Kc22EWQkdJoOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HjOEWycR68mGwy6ar+uiqBKxOWb6Jsg7X9ya8m5L0hY=;
	b=EP/YTJmbR01ABJsUxx9Jdf5DX8lsFWJIWsdxK30QD9EBkxE8uQubkXI9LoOni6gVUp3E
	 kbFBs3TkIII/KgSaMCccwvkMifwuTvMXd8u+hb4839ygImDHaGarl1jMotunI2gG0r1zW
	 boVFaWaYVfxDZEeyrUGdGcVcEHNAosmgRqgE3ILJeOX5vU/Ym8edtKr/Xgjt2pbvnjwEu
	 TBzelqBqH1AD0/EgeMzi6O1uvGEEwPdUZ/gl5m/pHXH1Gj+EPquMhWkMA/jLBS0VrXj0Z
	 d2S9geDw+rlvOCkWOcJI3xPxG0WSXCe3W2JtHTxNCSVjXBzQ1+bm5csVs/aK+e9Qusg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bSPJwgZ/";
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87F606A339
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C87F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSPJwgZ/
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-5058b105df7so1283629b6e.1
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 12:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430596; x=1795035396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjOEWycR68mGwy6ar+uiqBKxOWb6Jsg7X9ya8m5L0hY=;
        b=bSPJwgZ/O3m4RXGdY4yQ9opju1VfwQtx5mhKszva4ahp8DT/InLgQij2oQvT79ocR/
         5htGlqWhHTEoTLT+oNCaCYhXEOoA2lTeMhiPM/dH6RckMMW5b+1Tpga91UJs5dOWJkLX
         8wkTOUpzL5mjE0+3RG9I4kES6OS/Zq07u1s0R2m6tVa0L90UGwf7OuJPYieKT4KHcQQO
         Jb3e/uQh7e0uzjBCZhJuPq/Qs6F8B9Rji1uZrb+FI4Bi0OO43M1Ec+mh1fWKaNJwk0Cg
         /KiBDsxrXAXNFjP+erpGuVVAoEwTW7QIJleTLTwk37xoLryOztDT/543uekZKe/XITII
         LEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430596; x=1795035396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjOEWycR68mGwy6ar+uiqBKxOWb6Jsg7X9ya8m5L0hY=;
        b=ZgqVU6fEELhumsR56RDE0GAvqNo4jXvTcHeVUS9JfvtNgtSP/P6TJha6S2W2ZtusIf
         Jht89a3hqF1bc9zeai/J1E7+WQcZiel+uk3jeD936gvBXcpFA0TUab8IfNR5XXBOAFvZ
         ktGXfhrRmEbDRChSBYK6z9U5qOGvt8uOu8FuZoJgP/AffTR7S5hgyOvsXctinrt+HBQM
         fGnM3ZMQ2GAIRB/xprvtcj3yTE25ZOkl+L+VcukCl091UGKKcFKz8xD8yEGbqYtHDfDd
         ekiVoCTpF0LuUhuh3XJnbIeEGfG1hyoi27XcmZxYaS9LSVDl4Wuo1x3aS/WSfO76YF0m
         GysA==
X-Gm-Message-State: APuU4Z+nlzpgDq8rdrUF1sF9lOvtWkJLEAXeoxnXT/yVFkPu0hYlSKFI
	pUfjXiJOO0uS4zq5qq2lq05TdUwFQAARmDtA09VFdTOZlkN6I1VedxI/
X-Gm-Gg: AYBFou31FUluVPsRClddxd7wymG2jZ59oyJnoGXd/B5mxYyTwumZRIXDRdop0VJfWMB
	MJ3gfLS1XNFxyRenHlo2EmJsSgG6H4YX3twRoF5/m+KbeW9jw3mx2u8YOlfTM7Su8IFeHeSupw2
	LO8G+d6o6+l0GSgZiojc9wIwCjM6f+m1t6ClWAKzZJXi/40o8gQqgfoxCfP7bSH46D+WC5mZRqI
	ewGUetDYxwyU0ZMldKPMFSkEvIh252M2zHcaiwDi3NHmX43K9ilhmx138N1bATqzMha4rD8ctk/
	HlkB/tdhG7BLTjVqW4Hx5dtcdBiYGd80jPrmfWiR6omknMHJXSoviWkKpk7EAIyQfk5s0ydnNmb
	1XXwpofeK8zDkd4ORmoRTK+PJ3bbzgYv6yf1NWwVLBmvyWmmFPhLutunfo/DOz7NI6yM8gzpxqJ
	CU5718Ghtb0KJFPMzfPZCmB8ajoOfpwVPPRLMwoeY+g+9TcfVB9uu501L8Pg8LW0he3NDuZ+fJL
	AreMibPNixAqAORXvEIfNeKjzilN62W42RD5IW5zA2+CrcyBh2+uq8jOGCmDJDY6LX81YLrqdpr
	z7aAdcQGxuClNY1h4xLt74qYxdj7vw==
X-Received: by 2002:a05:6808:14c3:b0:568:2816:33bc with SMTP id 5614622812f47-56b98330b4amr3383178b6e.66.1794430596314;
        Wed, 11 Nov 2026 12:56:36 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm6564231b6e.11.2026.11.11.12.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:56:35 -0800 (PST)
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
Subject: [PATCH V4 5/7] power: supply: rk817-charger: Expose boot voltage and OCV values
Date: Wed, 11 Nov 2026 14:56:25 -0600
Message-ID: <20261111205627.56652-6-macroalpha82@gmail.com>
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

Expose PWRON_VOL as POWER_SUPPLY_PROP_VOLTAGE_BOOT and the current
rested pair as POWER_SUPPLY_PROP_VOLTAGE_OCV. The OCV value will
return -ENODATA while the battery is not resting.

Co-developed-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/power/supply/rk817_charger.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 5b53cf288fcf..d334941ade5c 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -583,6 +583,14 @@ static int rk817_bat_get_prop(struct power_supply *ps,
 	case POWER_SUPPLY_PROP_VOLTAGE_AVG:
 		val->intval = charger->volt_avg_uv;
 		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_BOOT:
+		val->intval = charger->boot_voltage_uv;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_OCV:
+		if (!charger->relax_voltage_uv)
+			return -ENODATA;
+		val->intval = charger->relax_voltage_uv;
+		break;
 	case POWER_SUPPLY_PROP_CURRENT_AVG:
 		val->intval = charger->cur_avg_ua;
 		break;
@@ -721,6 +729,8 @@ static enum power_supply_property rk817_bat_props[] = {
 	POWER_SUPPLY_PROP_CHARGE_NOW,
 	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE_MAX,
 	POWER_SUPPLY_PROP_VOLTAGE_AVG,
+	POWER_SUPPLY_PROP_VOLTAGE_BOOT,
+	POWER_SUPPLY_PROP_VOLTAGE_OCV,
 	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX,
 	POWER_SUPPLY_PROP_CURRENT_AVG,
 	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
-- 
2.53.0

