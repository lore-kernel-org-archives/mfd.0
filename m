Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432751;
	b=iJwF7l2ikCy7SbkcDDc61R/YPd3lzf0+6d/y7erNfTQZ4x6uoHG/UqtZWffZ7h6S3GUL
	 3fjFcqiVK4iWMFbjuFuSKBDiOGQYo+t72CmHTUlk8OdKy4EI7PuHg92p7uypE/NSIxRe4
	 TmJVixfhC/vcIa/mbT7xFgyjlpU5tStfPsBx7ypmmZuJIJfxC62xhFqaLdUt7RRqmZJli
	 DVWZJbYg84dAUxEFf9t+H8kkZHn9dcj5GF0NT4tIYq4qjkOFWNegA2K76hJSVK64UCq2v
	 MZiEYOWMXDTq6mTFjM77oaGFvl8RkMmr+Ij7Ya/9zD3+Zhy8/yV4GIwWeqSvqtLbWyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=lOE6R7Xl/jlA0aq5T5u3Q2xfUb5jKoEz/z16W6dysFM=;
	b=175wEq8gmKPfbkX93z/aA+fBI6xAcVFREudNRso4KXwxyLn+X/L36pEdtAdutmUkR+a2
	 nnC1uMwW7CHN6+5qY6WhYbzEXihFkl86NV8AClW0Ur0Kn0Frv1zLytr9IdTex1QD1e9Bg
	 iRWCPxR/4Ban93MlRHXqIFrnHzszjC3f2q+vJ0xgnzaAR2rQqYzljSPFZdinZXE2TpCaY
	 xokIB1mrMHs5Dn/u6jZmcuiIWAaGhQ3htzs0KrdFfglzuBRszxRNn/PozRLDHxl/5A1VR
	 u6I0KMW22hZjzIiNWGsIyZwgLncIE9B8kId+cDUhJbInx5Y5+/ZVdYmdvAt+sqN/pNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gLdopmRt;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04B960A2615
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04B960A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gLdopmRt
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a358881793so1564932f8f.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432749; x=1796037549; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOE6R7Xl/jlA0aq5T5u3Q2xfUb5jKoEz/z16W6dysFM=;
        b=gLdopmRtO/6zDNs+MQniSMkL9DlxV0rkVS6OoefI915IFvtlCOOGkC8BBI+NzPk5FJ
         gzIIB8PuUfvn6OV0qReNqNpbjyOSEs7KDFliVwD1zZw/2cKGSG4WSCpl7GC2M+IPPLtX
         lFPrghhExw33K1sxqgtUyf7muI9zKVqbDwQYu6kjgMWzYa2fEuk4IWhgV+sxL2k6MRnp
         GuI32JK3US9/pk2GCKnIKO06F4/nyFaMCeu/p1m7AITzdfL0Hn8TP9QDG1P+0hoheN33
         cUuSf+N4OmdJm9MLiqe4NjQuHUHMYpUzCLPvyp3T4O9B1qtOgvqd37ohStrGprIMxnD7
         fH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432749; x=1796037549;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOE6R7Xl/jlA0aq5T5u3Q2xfUb5jKoEz/z16W6dysFM=;
        b=HGFrFJcfYT1gQbt6cuh5Vad8iLwMeRMFQcVIbZgZmsvZ5O3pyr2rnPa1HScnlJITtM
         /iam77+Z7z0snwO/FnvjG0K7SSkepGhc1VY2zNYdM61yAPgUVwrBpGC5+aM9aggYXLk2
         /0T/CMN3nL2A1BZk8hCT6MaF/+pGReshUTDJbC3lFyWFnAM+yG+KgT4+rcfjjhlDUOpN
         Kx5AQyP9AOUaOZoH8EWJLHrcc5Ky3dZ6X/btkNnllqDzqkPujwH1qRkZbE8SCSa1ueh+
         UV54/jgCIsj/1rRJDk5GUfymU4lrQl1LFrAcYs0DEEqpEFTmoGbfrmxxBYbj78f1zOA7
         DVmQ==
X-Forwarded-Encrypted: i=1; AL+hErFg0h1g/NH/aH5lApQM6kuXXiTE4ZXux354OHi6bj0degW2gP/pxtlzIcTWalHl2gvbltg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/BOdqewDVWmgD+Gv2CfP6E20KOS/bURDK9JKFpvQmfSHLCrv0S
	vUIK8Vsw0DxZ9ylJfbM7sT9G5SGobimvL/guz6hZBG3YqG08slXgj9WjgrNgaGQ0vyQ=
X-Gm-Gg: AZFdTZeHd1HdCtIoeS1a4s9N3w0tSHTrhFz3TLlwTH4VagdAyHZguZvq/PZ/tuej4cB
	+Ms7tfX/fKkVbFx+lXwayRW1att84Dval3G/ELBcqIWgQZRuoL+fOcC3Stoy41hdwyMvlTGF1Sc
	FQM4QMHpqXp6/Vh8X+Fma2Ymi8oJcPt9CHmYL0lu4Kf5dV5AX0rhhtmjk8ksi2EIcv1IEAfp4a4
	f1Kno5X9MOtk2MZSlk29JPrwW9jtUvHgrb+MwoEHD6FZoCIQvEl91zg4sSWiKELqeUPflGYMnRV
	qbJkX0p3jFdZwwgQrWg2Q4rp2++w3ZHpAWtA9KZPlRGWUA2eNOvMSrqq0e5s2RRG5Ot++4FPREm
	SVTsiy3DY9hIMeS2y6YFohCYtAxGqH58rRzj+rRd6gvfeCzmfEQEo0MrFY7R3TG3MreZDMpFHvD
	4NRFWxJij2cozoZADs0Z7aHgl3TYWeGTNEZmBmnaPB7B0jiSw4D5fYy9pxtr2icnIu1l3oc4RBR
	XgwY5IXeCosGskHQQhkYKslQyNGcdPk5A3fRkfZrKOYAZBaVS/q03Q/+2S9JHdYYRSbfSqMmSzh
	jcffh0dzeLySx6G6BCbn72hVC0EcoBVjXWczl/nHPCU0kYcnAdNwdCI5LztBhWp54g5TfFCohws
	kFEts1A5BqK3hroCItQ==
X-Received: by 2002:a05:6000:4a0e:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-4abb7787c05mr21163192f8f.50.1795432749041;
        Mon, 23 Nov 2026 03:19:09 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6b10b2c9sm22480961f8f.31.2026.11.23.03.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:08 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 07/17] mfd: Drop unused assignment of i2c_device_id driver data
Date: Mon, 23 Nov 2026 12:18:05 +0100
Message-ID:  <51e03a317097dd87a1afd7591032659611dae693.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=BOZAeiaAw4Eaud+KaCugllOmpmTVVDFpxRVJslTRZps=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCD4XyeVWvp8XdlcWO/uEO3cdf31L4fMMm1Wd nFDQVp25+WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg+AAKCRCPgPtYfRL+ TjfRCACV7ttZXwTw5e/+aK/ttVncaxXZPGCgFmRhxQRxOXavYhzNdvaOeqyVj3btMFnfEHBQNVo Nrv6kPRaHwYzXG6Hc9opdJBXN19lnfpRlDjM6TGhSqmHQFupvV3lHVaBhbnO3xX3BoO6J5Re+pW Kp7aERCGgp3ccAeev3T0N5+vWdwWX6tNxkh2NtJxFRkV+ixOr9htYHfWPy3Sd/xjR2NZlTtRjA+ uCseWDWEMv5Pc1YEYyhYPd26kZUBIz7RNUdJ3YDPWPB55sSRQT/ItCyNXS7e3bzsQWyrcoEsn4L xqxJwIAfY/JR/gHrhfUuEr+JjDXO4YOzvEjenLpPmkq4U2pc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

The drivers explicitly set the .driver_data member of struct
i2c_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/as3711.c  | 2 +-
 drivers/mfd/rc5t583.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
index b123195d911c..9513dc4ee0cd 100644
--- a/drivers/mfd/as3711.c
+++ b/drivers/mfd/as3711.c
@@ -191,7 +191,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id as3711_i2c_id[] = {
-	{.name = "as3711", .driver_data = 0},
+	{ .name = "as3711" },
 	{}
 };
 
diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
index 431ee5deec00..96553e5a8279 100644
--- a/drivers/mfd/rc5t583.c
+++ b/drivers/mfd/rc5t583.c
@@ -280,7 +280,7 @@ static int rc5t583_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id rc5t583_i2c_id[] = {
-	{.name = "rc5t583", .driver_data = 0},
+	{ .name = "rc5t583" },
 	{}
 };
 
-- 
2.47.3

