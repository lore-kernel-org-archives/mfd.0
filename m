Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236322;
	b=M69OGLJB1tS1UiiuT+TPuYYqsK3VlH/GaCBlrH6+arQPtCDNhQeWsDSZ+c1UI9Igr1IZ
	 cKHnCU71caRaR8vC33kEX2glNINyqaNtUzLvKrNgIkJJ2x5HJTpA+uU2R06XmAgcTe4cB
	 8mar3LKOEyz99vAe0O16P2RQvWxIBm40nJGqhVFZashcK5X/RPzVFuUgukjqQkew+DAwq
	 /ofQHIk8vp9iDZIU7dwR1ZoaZISwjjV3XyyvxspveL7VKNdPFFFlMSHRgchNtZwBipJYn
	 2H0y00MPUuxa2uy1JssynuFZYVi6fp4E1kf12hGGkjUgQmkqW7QGAZzudEYFSnnJxfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qGWgS1kK7bTN+UKMspP8Lj57f8piI162PVpn3s78g9w=;
	b=zr913xq+zQyeSF+Q/dRHfvdS9Jutjp/TuGhMdueE0GEJ3ZpTi3o+Uu//lz9ZKBjbNkb2
	 p46eHY5uflt1GvnUavh2igffDVcbYyqLLhblRfa17gvhqgqeeItTn7hrKxY5CmYkwC763
	 8qdgdn3oCA98w9U/YpKK7qvabN5tAdrryS91WL9xOBA8ChPPuVA7uTzi7Zbq2XzvfNgp0
	 6o5O08Llw3u9Jsufo8eR0MOC24yBQMHQtgwcSmZXo6nbaQXO6bmxPvpAI4jgjbGBOsT+E
	 LDQXnn8ONf2140DK7HmdQ08Fug0ckzBptMv46GoSqIyKJFWD8Li/fzJf8u34mCFEhQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ccOL+5Du;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA1C606A334
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 14:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA1C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ccOL+5Du
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-5058b105df7so243044b6e.1
        for <mfd@lists.linux.dev>; Mon, 09 Nov 2026 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236321; x=1794841121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGWgS1kK7bTN+UKMspP8Lj57f8piI162PVpn3s78g9w=;
        b=ccOL+5DusFondD5JaoynAYIIZ4+LVvnngm3GegcGYk+iVqcrEiv8pOfXrNFVxfXL7W
         2etFlvun9gp8qCC0VJlPE15y+qwGRWJNByw/dE0sq5GbYeorLWJK2NVIldEnD2v37NFC
         rNPLr3xTp7sIg8TQiKCl6MiLdBJ2xhGpkUWrjlnXGgIhxUlcjNWAcWXAt52LFwv5EQFC
         9qepCoiVp5JV1mLnl5KO6BVChh3rxi1WBrcGae+GI0Sb38mD6fbV8MjI/JMjhjyKvl6A
         QuXsFu/c5iFX1IGBXw5U6xOlTk2/rcG7a2sMxbHCRHBo1PaWM7ZRTRYcLZwtTqcR/NAh
         kGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236321; x=1794841121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGWgS1kK7bTN+UKMspP8Lj57f8piI162PVpn3s78g9w=;
        b=BQWKsJgI+D36lPIqCJQEhXI5W6gU0HlmvUFivn1zmXQp1bJAS1K/+b2pCk5JUQFxcq
         AlBRk5WFEH+G6upl/KIUj20wEzN9+WIsZCgO1OXGBWj8zx/tlCAakttWGnEEVeNHG+Q+
         /S4Fz92NHwm97OipWq0pNyGvttts3YSnu9gNHcRdfUWJkVRg76QinzSry/53paq5nV4R
         yf5j9v4Eg/lSCnl48YzChRuhXPU+IRXKINOw92VjAaIJ8kUlTqxVvDhAvz8JdSI0QGL2
         Fnz7rF5Ha1pZLJJhI/AaJlSqU2BbBir0uo7lSUfBlbVG7InEK0kEnD+JmMimqPucfHJm
         MRMQ==
X-Gm-Message-State: APuU4Z9ypfHjdT9V8okSQ2Hge3gdWJf9SrX7M+lfRf/IeY6wWQy+AQ23
	/XiWke74/hGk/t9+tJPwhEFr+6I93400KzoFTY27oBNYeyemZexM5Q1c
X-Gm-Gg: AYBFou2tF12OmUQUqDq1sJtI1T2Iut4Yufyk1PtZQRcuskB1BNcq3rtpSRLCLfC/EDa
	JDNByOHLOuWANCEvZq5OT7XsVQSIOWhv64KS80vqRjmYwhvP4i6+R9k0Tn5cwQxxP9TVyTmI2o3
	cSNeop9UeRn5SzPm3MxdRfR1pbinmQFWchkzhFEMqYITdTW4Zdjqz5TuxGy/V+jW+ILAgZgJlg+
	iphAEpUXgYPp7tfieVwZNJ5qxyMGY4xavk337KHgNTRLHrdRomWPcZpr3b5LeYsEW/ILCFW2Puu
	8QbBhtq66Am7NDO2y5lhEz+A2eeSrACePAKjWp8LrTO2rkFNn/KOWoLhB6YadlRlolSQTiQ4cy2
	mxXUimWAiN6Dzdxtu93GXuYaDPrCPgXk8XkYMwEC6H+sOXaQWUtIkamnPKv69lN2FC8xfEPVl8N
	L4FLRtR2JigvPTlPNZ5sWb79YKzP8yJiQoEZmbeVkSAd5Q50kgMH+rBxVhVlPdplNg5AG7PlTPo
	Tpy/8HSiPQeuWf3OpufPMet61mSHJVaakZIV4cXxhvRreIusvs7KxFiiOw65b8fRcDmg2b0TJ8t
	eRTTgQG9XbUAjEE5dg8vD0rnrOeBgg==
X-Received: by 2002:a05:6808:2211:b0:551:eea6:9397 with SMTP id 5614622812f47-5681463f7b5mr2639979b6e.59.1794236321012;
        Mon, 09 Nov 2026 06:58:41 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm4667618b6e.16.2026.11.09.06.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:58:40 -0800 (PST)
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
Subject: [PATCH V3 2/7] power: supply: rk817-charger: Fix NVRAM SoC value
Date: Mon,  9 Nov 2026 08:58:28 -0600
Message-ID: <20261109145833.1363319-3-macroalpha82@gmail.com>
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

The NVRAM value is stored as a value between 0 (0%) and 100000 (100%),
but the bounds checking checks and truncates with a max of 10000,
causing a value of 100% to get read as 10%.

Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK817")
Suggested-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/power/supply/rk817_charger.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 674622398efa..39c945622c4d 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -728,7 +728,7 @@ static int rk817_read_battery_nvram_values(struct rk817_charger *charger)
 
 	/*
 	 * Read the nvram for state of charge. Sanity check for values greater
-	 * than 100 (10000) or less than 0, because other things (BSP kernels,
+	 * than 100 (100000) or less than 0, because other things (BSP kernels,
 	 * U-Boot, or even i2cset) can write to this register. If the value is
 	 * off it should get corrected automatically when the voltage drops to
 	 * the min (soc is 0) or when the battery is full (soc is 100).
@@ -738,8 +738,8 @@ static int rk817_read_battery_nvram_values(struct rk817_charger *charger)
 	if (ret < 0)
 		return ret;
 	charger->soc = get_unaligned_le24(bulk_reg);
-	if (charger->soc > 10000)
-		charger->soc = 10000;
+	if (charger->soc > 100000)
+		charger->soc = 100000;
 	if (charger->soc < 0)
 		charger->soc = 0;
 
-- 
2.53.0

