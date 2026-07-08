Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAEB43C075
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509413; cv=none; b=Jo39zcGJjWIxKJ/IByIur7imgot5GcpZ6NyGncjyQsvGvrgalF4R6STxgxsdO/mXA4iNCk3y2TKhRYj2C8pYwn9QR6GkX+MVZtg6bxu3lP+s339a961/N2DVn0Dr8UvHMm0GhAgYTtvyasB3LFbLEZUpH2WOyYEQcAPQwA72Sv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509413; c=relaxed/simple;
	bh=6qbdlzxZyZLMBPwj2Zmz1sZXp72LcZLMsWmZZfgKkIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZloUXKKc0GGs7s0iq9YlhoiRLW0uAgZNO/SaiLNNx22yyKcX7bT+nj0S70OjcdIW5meGsC9OsH3nTINLpAHSU/tcNXzbCMktsq+DqZbHvGo/n1nGKbKLEA6WWW7mPMd6WYKtoK2oBxgqfZM6X7xSPglwqySFHlTmy+zCtlHJxyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ms3s/5Ba; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ms3s/5Ba"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so5140235e9.1
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509407; x=1784114207; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TaCMfmYh26EG6vWNYZX/3pfm5a0Em0kXW/5DfKVSZ90=;
        b=ms3s/5BayHUlsGSX1abni35WPSY238HzfSA/daH7g1rOJmLZZe5T0FEc1KOLPbAEin
         fyjNDKzk377b6JhJRpFBIQqaFzY+0V8AL6gyhIzdnZ8YbOQYYU/jMWTiR/xe5TlMoFvy
         WhJuSo37MZ+N5vXhxpFOiuZQS6Otc3K370a3Nwl6B1uEjWdwcRmeelRNThipC9OwX9DF
         W/Q73SOuiVSjbJAVF2vWab3mgKiO6avMulvDWakUvZ5nl9nEJ4JIamEm9QFg4WExNoc5
         9owRx7RzjYoZFIAiZ3sElZzDR/v4lOJVR8oTvnmY+75dgK/Se6IXGXFcXD3qpWf1prT+
         B/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509407; x=1784114207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TaCMfmYh26EG6vWNYZX/3pfm5a0Em0kXW/5DfKVSZ90=;
        b=pn9Lvbu386HwfoesRSbzD7rQpNMRcmV5pFfH8GXkOzc9+Ov/tYi9pgk+/8DDTL0xSe
         xAH3kFaCeppDY+91oGs+NiYmyTEpxD3cMFzUEL5hzEgkPj3K4jSyDCPjUVpjPbbmYLR5
         pZI/4ylnmuvJj9ylpQGc4AadBNW1fna7EW16hVVLnRmjKjjhxtF03dJJKb/HlO9NnT4M
         D0MHmXYn1AG69f1xGYi+leuTaq+odxOqN4RaQC758JqmRuQ6wRrbu7RmiNuz49aPBo8k
         Qo1XjpCD6xvUAZlAeTUGLx1AwbDbbxKOao/2mHBBnkKEnMYWfZSF9MlgGZceFHuz0rQN
         uQxw==
X-Forwarded-Encrypted: i=1; AHgh+RrV7dq+SQI/ms75BNXymy7Orv1iL3C9ua9D5s0gT724h5UVryOHVTpZmi8BbDcx5/SSBvo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjhNzOVdb0SXThvX8NV+EkFAykIm13Y5HzfCnTUXVSIDfbwkEK
	ZkFC1q+zjn/R7+S6ZYFjgaa2krRlYsfaRN/PB1WwkCkM8GJ5TNQP4CjYhvf7mjfxPZ8=
X-Gm-Gg: AfdE7cnjmbOvQz3b8kCdy+qe+0LKvhF/ZlJRyoUv37vUzBgH5Pin8bp7JZ2tlMi7kxm
	m0CDaVRXobIMvGmZ5sw2yEktLA297wRo6t3Y30PMlySXBN2v/KJ4KpX2YEhhARBgbCZ6RIZoQ7b
	AYk8t6PYsrNDyf/w/5BOaCQnOQCjm2gQMZQfIa+LMIgmblQ0OVwe8PngScHGDNh2tb++gq/vUlk
	R71E6bGmbEd9O3g8wT2mzrLfTzZRSnDdoRpagI6dFhaujx4HolWLcmYqmNQ/13n43E7s4KeHkV3
	onLb0Jwl3/cDcfq0q8RXpH9sCaJ8i6aXBEIoQVoBpgpP3T3hLE/dtQNieDB3TvxNvr5cQM77x8S
	LQTPBX0e+Hpz07D4w1idaaQK6XyJnIA2bydztMbCoPa9pHiN1ayDt1eEkF6uOfONmz+Zfbi5hW4
	dprv8RzkVmxVCjjU9XN/iBSQtpPkvEVl2I9sH28a0fycH5Iad+EUjhaetdD1qdwVSVDzXmyrOL7
	NwL
X-Received: by 2002:a05:600c:6992:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-493e6d1702emr16184795e9.2.1783509407586;
        Wed, 08 Jul 2026 04:16:47 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0f43912sm151033615e9.7.2026.07.08.04.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:47 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Qunqin Zhao <zhaoqunqin@loongson.cn>,
	linux-crypto@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/23] mfd: loongson-se: Drop unused assignment of acpi_device_id driver data
Date: Wed,  8 Jul 2026 13:15:14 +0200
Message-ID:  <52d02d74d8c7589731ee0f0805123cfbf2f992d3.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6qbdlzxZyZLMBPwj2Zmz1sZXp72LcZLMsWmZZfgKkIw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFPPm0q2sX6r6XfARwoVd2skEs5VWoujN4Ud vzHvIn7q0yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xTwAKCRCPgPtYfRL+ TubsCACTTwl3FBbqji9gTFIlLTGwskOG7AMEO/JNLuTUuUjQbDjrOaRx4RBnzS1QSWiwvrppY/I sXi6ufnyXqLXQN01yDrJIEC+nynzVhvLvQe0GJ5BO/k5TKjsEFQIrbyo1wly7I8Bz2rKdf8m/tx mhib8ir8vuJRFy6NHOYM3agc0ndS+QpslK0fVkWY00CzVS4js4sDjt5z6Syv3Mvddp3mwBhU2QR yicc4eEHDtVnzvg4KD7hvS0RziNA929vjMSegWodsBJfkv9P2BjMkIciiEqqAi/rNpGMMcSSA2Q TtUd7iXvjeC1yHAuowD5pgObwNKE4S/OJqIva6rqpiE4hhy7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop this unused
assignment.

This patch doesn't modify the compiled array, only its representation in
source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/loongson-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
index 3902ba377d69..4c668e2d2241 100644
--- a/drivers/mfd/loongson-se.c
+++ b/drivers/mfd/loongson-se.c
@@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id loongson_se_acpi_match[] = {
-	{ "LOON0011", 0 },
+	{ "LOON0011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_se_acpi_match);
-- 
2.55.0.11.g153666a7d9bb

