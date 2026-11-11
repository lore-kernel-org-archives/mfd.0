Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794430594;
	b=i+0N/bgoz6Qwu76YWiekJZ9t/Xm1JyDd6Y7IrcWUPqGNWz2R+UWtpkLah3JUrUakm6Yv
	 kjl+gK984AUw0LBtC6bbIxPXeO8b2ZHivrw726lRNq2M+iT+1NBFNS2GF/yidY11YWEn2
	 7E5auRCmYcMIpv0g7qWTm3l3vJZW4Y8sIHgQomlCpNxd7IZNuYNkM+mmP5rnUfv+6mjyN
	 qGFr3R4FMBGYtifmEcJVYZ6+v3VTRVVmG1KoBOtr5mwnbOZ3JsNj+YTqy2qNctAFJ66Pc
	 S9zaqNXrq6nOVgzbuTJv9jzgSFRV3DLeTTwctnqEm76LCbN+yuvkpOf/vr39Zw29c8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794430594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qGWgS1kK7bTN+UKMspP8Lj57f8piI162PVpn3s78g9w=;
	b=VeXtCVP+UgOMkW5zsfvinb5jFhOSGvdu/VbDiXcQABiNdqH+DRiLQXYK1zQ9lHb+/02c
	 w5LddWtUNaOBZ/gUyUALEiBv2bV5iCQeB8j6SIPkm6sTv0MIlt0bX5NzaUv4JD/fknSW2
	 p6BKQzBHmC1iXVmeqPKvQR114zdt9mWVSAY9HDpN4L+aLGCKW4QxurhHuvpgLKZTtJZwx
	 /+vdtVfYiqVZX++Z9AjX+IIdrD2BVpLd0eO37l+1c3wIiJIh0j1PgWlYUB2h7nuCMrjP8
	 eCCT2uLn0Q25FpM+KT/MmO8D2ZCltssm2MfdyMxUb63rYlJByw7wK1ol+xRDyGKzPOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMli83ch;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85235606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85235606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMli83ch
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-84e513874f8so2476691a34.2
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 12:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794430593; x=1795035393; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGWgS1kK7bTN+UKMspP8Lj57f8piI162PVpn3s78g9w=;
        b=XMli83chrWSmfF7oU1C6dFWKVy5xsbDFLo6x6BUxRd5pcWwq5j7HKVTdqeqxLdOIdY
         JkkgUBZMxghLYR3lfHQbPK94prrtKK56luhWBjaPyzu3PqbOIZtUOCBpdWDChwcGU6R5
         R8hWNq1N0ZjlM9px9kHOK1KU1L964RATSSRZFHlDVfyWzj9STVFeX8m//NeIKx6ix+KU
         Vo3XXTi25Sn2sgHAL3q0sDM0AEbvoDejZvF3CdQCPLjxQQ7EdgdDdfATEaKvMvuqhf04
         kTiVU/U8eSYqvXKQRQjewJ7kjtoethlrGgmMdwdA9d7fiDcNGogX3/GcLZ3lPKRCCi+s
         LvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430593; x=1795035393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGWgS1kK7bTN+UKMspP8Lj57f8piI162PVpn3s78g9w=;
        b=swCI8Q4zg4ZNWiXGvpIIyzBHn0gxGOjHJ0rBF9N4LEtY/fAt+qIcGQjq00YC4Z4KKk
         HgYD3ptVCORZe0AVjfY81tzY5ds3DQkwGhaQz+4ugkT1MREH2XLNWg1aqfl99P41BG0u
         Wdf60JZkTGWGKGJp3XRHOEOG+Iyio0HvNkMORdGdpHRy7PttMNooY0FqqmVpZAG7EkHl
         a/CIB39nlR5bEl0RRG1mf6VRhBmYrWFkdwm6RGQJBFODJsOggyz5H06zzw5QhQBav1wI
         cZGXcQPxkBYf5GNlmWHWJLGYwfoDrQfkzmelPUTGN0f660luPko4wC6t/wLs3n3t99AT
         8O5A==
X-Gm-Message-State: APuU4Z8US76kOzuhuCJU/9J2m5JSIOUbjz5655YotBkl4CdAgejWngwG
	Osb0YCVqhH6vByXvKudNrxZETyhINOhmqpBMZIKaX77p/hlB1BYsA9sz
X-Gm-Gg: AYBFou28u3wyj0JdRqmLYB+zfaS2UiwGizUP96/9BCV6kSpjc10vyF5TDJMnR4pnN6w
	wqttULfVxpbVLt8nvmiMXIw9DNHHxBB3dGa+HJGEaZZlL26bSOuEca96QdGn3yCfTqXD9B0fLoc
	IRUDf+erALJBiQuV793Vvor1TTgH60yK3FuQH0oleqCfGrsmSCsjpGA0KnVVxTRAdDYJzqu+eSG
	TBNZcj/ZQFUkT7r36zhesnwhVmKt1M4g9b8K8d/jqSWXTvVjFZaQnfvo4EGjqMS8cpxmaoiwU6M
	yEflSAW4l1m34nvbOl8V4poiB5q1rVr87Hk3SXs/4Vy16OyYcy+1kkrObS9cwvuH7+b8r7MmgTe
	IJgVr4f0AqsfKmXYPqg9JsJayI5X5O2m5eK1pImsd2yEVV33hWpb9uVtb16b6mHLa9qDf68zdBA
	BIcD5rBI2S3bY1bt4ct+3nrBAbqMYVt7U9DdEHZ5YtxivtLs8RJLl9GEOtKKXXHQ72IjG76bhBZ
	Q3NrXBM6pGppscAbMH/x7OUEs6VY+xIR3BYxKMwbrqmAsXyFeEI/+xEsUqA8DlalZusuzyBBeLW
	5/pCAhP65f3b//wD4AWJBWYutYjgwQ==
X-Received: by 2002:a05:6808:6605:b0:564:347c:5aa3 with SMTP id 5614622812f47-56b9344c04bmr3276602b6e.2.1794430593243;
        Wed, 11 Nov 2026 12:56:33 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm6564231b6e.11.2026.11.11.12.56.32
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
Subject: [PATCH V4 2/7] power: supply: rk817-charger: Fix NVRAM SoC value
Date: Wed, 11 Nov 2026 14:56:22 -0600
Message-ID: <20261111205627.56652-3-macroalpha82@gmail.com>
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

