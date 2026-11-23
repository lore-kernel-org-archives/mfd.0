Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432763;
	b=fVc2k2rEeLBLYTQy9RRMemT83hoHPE54LbY6TQ4Q2s78btSGZee2RJqkxitWAkgwAiug
	 tYqbBfXyDwLy1FptRGCRJ0NONJUtKgNg+8xbn4VUfSr5vZF4TWWtInRHSTHEDpR4hr7i3
	 XanYHyiE07pitw8ul66V/H3uiP578/NkAEo9OG4GYl4qA2bb97PlLNTb5H/PHH+fRyepy
	 yoDrVtoY8+q7zVEAEMf/A5mqex2bLZopZXTrzJQzpGIs8gZlgMuqSl7gOZbfuBr3pERNR
	 dkE/G3y173giWkbAk7kos9KIfQydYJF6w/gA27NHS7CvPynp8JQkNJuEkPGgRrE2PVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=qASV4xy8VpLdCMimQ/y78J45DMpLU5AC0CaT8gTUwiM=;
	b=AUe+qmTqEM6g/s7B2o8N8VyxvwNcEC8TPP5V24cwJ3pnqOoejZjV9RoHKqrZkITaSyOT
	 U8o6yCDBQyD0/5NU0Ajuhv6dFtcCY+dpkZQBSYXgaIewbi+uJR+tb5uP0Hfvkc7opIYvD
	 2ow8DcSyFuuF+Lg2Gl4qwSCMgesCgyb5ZJuS358ctk+14F9BiNOxZM+WLW4jJMu5dO38i
	 g0TT36ZzPRqtvNERz17SkvxvrCDvD2VlUdNEpWLJ99356Mq+0lQRAI50SUXeKmbPtmMkE
	 7FR7PMwRs+PXTjThFu0sKJvwbqK75B7yQSav5l5gnzxDF7nNzMMn0CZ0ZIkmMeTaiRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="f8/YX58K";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56E60A2635
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B56E60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=f8/YX58K
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so28755825e9.3
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432761; x=1796037561; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qASV4xy8VpLdCMimQ/y78J45DMpLU5AC0CaT8gTUwiM=;
        b=f8/YX58Kh/0FdICt3TJFw6WJtUNMzVG22Qfs2fri5shIea9fNxZcBSS/nbCfPpyg3H
         uQVJnCC18Nf25B8WdRvFlNwPUfGjUx7Dzbfa+EddmZIhQBaVmMDO3AXv1c2hbHP/YVka
         Pyuzy/VdeV98xjbExDNvOfuMKuKnVuhMZa+KYR9K7OIFmnRcCLZ7nZWo/hNWSFJymJQK
         N0qtFC5Rg6FQz4GO6zqzWZjMMKiJfL4lVHwp654lF993ZbUwV0uazb0nNdgMG9aE4ddv
         s9XavgfuWOgdOvEsggGX02/LTf+mWj4xvCtdIqbrrNbdme08p6Xkd4P4DWK8uJH599Co
         9NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432761; x=1796037561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qASV4xy8VpLdCMimQ/y78J45DMpLU5AC0CaT8gTUwiM=;
        b=lrgAWpbaSku8UUqpZ9YK56MZ9/jp468Om/g35GDu/EU2Tc6VKmBWG5frC3lGqxW8bS
         2dv+d6jU+ajPjM+Q26DVQyhr0HX+SuoPAU+9edGIGL4DXAfiz5+q0PPe+kb2ZB078AVG
         dvXziBRjmD5CREpk1onVO4jBS8qK7CaRekWkx/HjS0XGh7QuRXfdbPZg7F08gh63xIwO
         9TLV/WD7YELJpmx7QVk+hH+6c259w7Zuqphgc1QSZYJaxulkU7TtLJk+2Tr1lwZ8q36E
         +pNQYpifY9cTaZ6/flN/IQhp4TmnnxhvLH9ubRHuah7bRIkd6rRGHf8WJijtR1ACOvxS
         Ov6A==
X-Forwarded-Encrypted: i=1; AL+hErGVN05L77CD/1JhaKw6+THFiy2gXUPibBbwku+W55vJHxqpAS/qXnr9w6SWbDemb913cYM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8xRVy9mSuULsVpLtuaH6+eKiy4n934z7m7eoZn3LWmut3JuD13
	oK6INZGLPmtFNHe+aT2STdM12anP40k1h/zodj+QJpFRz6969nzB7NcLxUftSX1J/pQ=
X-Gm-Gg: AZFdTZfI+cfhaEj7phoBMZdzRgfcbWHkrIhHIIfWI66vZ6lKxDawbRrLpJrV3jLPk5D
	2dgjSjxW1lolgg8BvguWzhMJU2BRyRliTGcGNCzqkhccT3ECJvDA6lt6V6bKSS1F5hocq3kJlxn
	fvNKcBDWUCjZJTvb3OEApigWvElzPK7argw+YE/r4hUz15GCU74U1B1q13q48S1mi0eou7eGCHo
	5h8rnkM5ktYWIgfbir3f+Q1TNGX+f8lpJa6sIHR0tHqRdxIR+AiLl181+L38mqH0C5ELEps/hgE
	rvabzbICPS5tKtpB2q23Hqa2DsgHnAa4TOqr6ZEyrHMOG2sFoxKUquILcg0Rz139NZ8QJ12FY/X
	tIQ3uPo9EAmoAkz+/TzIXRxgZFPhysQ0ctQJq4d5qDwrxkbQ6dIYAg4cjDgdW5Hdv0TEgLOJC9M
	46hPa1vVFlScJ3BCLDx0xvGEsvXc/EkYUyF9I7/3UFUNOsXnRPpbmteDInBDy6rUBjuOjBcHLmf
	CaqTG0alkcq3G6xUDnMWB+74cr8W+kwMnaRlGcKPLQmKpKvRlZly1s7hiN6ggXnULo4YnEvhM0Y
	jF75uxQfvWbvxusCxsxTMcAEDulG6zzQKHk/kBakWs9DQ9A3h/pPaB9KGfYgrvcDb03l9HLDRJu
	dJgpHT9SZUMx8mTWk
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr226781205e9.10.1795432760806;
        Mon, 23 Nov 2026 03:19:20 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm640103425e9.4.2026.11.23.03.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:20 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 13/17] mfd: Use named initializers for platform_device_id array
Date: Mon, 23 Nov 2026 12:18:11 +0100
Message-ID:  <77a7d8f6dc1defcd4bc444a17fbe12b12c896dc8.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yuApXE+uP7wBaUCWW0JJGBg4bYRq2vqUwBWOU3wES8s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCEIp7lbUSpH1IgOlUjliCpKsH7j3vn9CjcJD 3WO2mFrQS2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQhCAAKCRCPgPtYfRL+ Tu2jB/9cHZJmTztjkBAPewkCzIe0sLvYsApxAjpJFyVTQxIZsS57YALEG/TS583ylkpslKALZ0b jEelLoBq7MmKSd5oIaTxPtgrZNLWtEuF9+KwBSHpC1+Fa4anJcG7zsSeihzQCFik+1jLMASuEB0 YcvN99U16bLsKnKAjAAyX9xfCC2HDOIMTHWETww/LGG3b1utzYM/Vq4BPiX7AtUXEXPbk/QVrCD WzsP0BLCsc7IwXpqmtb5jw94qODzHtIip1y5u8dCk8ZwqM94NGMMM7r09N7+32zl0/mzbAztEe1 oYys30KFdupnY5eisDJATL1u7A2NGA/LDUfDEYwRj05RBfE2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Also drop a tailing comma after a list terminator to match the common
style for these device-id arrays.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 766b0eb73e43..ed7e6a99b444 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1249,10 +1249,10 @@ static int ab8500_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ab8500_id[] = {
-	{ "ab8500-core", AB8500_VERSION_AB8500 },
-	{ "ab8505-core", AB8500_VERSION_AB8505 },
-	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
-	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
+	{ .name = "ab8500-core", .driver_data = AB8500_VERSION_AB8500 },
+	{ .name = "ab8505-core", .driver_data = AB8500_VERSION_AB8505 },
+	{ .name = "ab9540-i2c", .driver_data = AB8500_VERSION_AB9540 },
+	{ .name = "ab8540-i2c", .driver_data = AB8500_VERSION_AB8540 },
 	{ }
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 96aac158fd8b..3c7e7f1efd0f 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 816ddfe1584a..9bc146bcbe0c 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -327,8 +327,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.47.3

