Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432764;
	b=uqtQZGTLLcQ3uL2cGTBOXVK0kM1u9kI5LlxzuC7NMMBCgRvbmYeOhbeo5ZmJW3zdO4fZ
	 t1dS5IP2eMt5kwRQvrmO/xuOdUCTq/XeGQ97WuzQg42TVdui/Cg+xVKZe8ab1gBuQ7z3r
	 O9ER3Gf6GRauEj9rJ7emLzwkVvYDwdfY1RjgS73RtEL+reeE+yHlOs1I5Q1aM4cB37q/i
	 AeW9ZSFybmZwq/vfR5e7xP5LH1Woc+QQRrVqycTA677sdW755TvT9gFzV9ACMt9JXS/nE
	 YuLhBnkZQ3EaORJHypdWHAjhHGVtUN51f4nWs72Dqu6nWYlpcYD8IfrjqxNMwyypodw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=wnHe+aJ2WsrFZPDl6pOfeR0Olf3ozD9pArGhE6Lcr50=;
	b=x3VPmQeUWLVFvVJfOT7TpEmrfkLKgoFUjsxr32E8KkH4D6biZQi6IfCLi+6cn6LWz0k8
	 dMK4HaH/2A+pKex61QbB255mhjLXku7R8aIwvp8b2ESMMk1032LZ/M+lgenSFW5cWwSLd
	 28tq0DMBbiksYYQI6LpDf2XkHgCqktCOs+vgfU/JEQ6Z8/7fTXCBOSq00cbMExpIgFghh
	 4pq85nKgfaWsycvBQLflWSV8mq2B1zMBJdbeRnoFVCLl3jJjH+deV8JQnZ/4TTcO8P17Q
	 HYz+iQDYqbFe+qMRE726gKes8JU4hjE1LvXS4b/F+ReFK714CEyhYKVIvcVjQ2Zxsdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TbwfTTkT;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85D760A2620
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85D760A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TbwfTTkT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso22254155e9.1
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432762; x=1796037562; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wnHe+aJ2WsrFZPDl6pOfeR0Olf3ozD9pArGhE6Lcr50=;
        b=TbwfTTkTn8WUqgbpjJwBrkd9JRbujkBP6KgiCpxH1DsHUjq3DxiZC2mw9wacsfLtnD
         PG0/o22cKx/6MRt9kCfqfBvzSsdj9myfHxNbhXqPfZ62/UdCI1eRMErENAR3XaO0CVwp
         YiIbEVrQn/nCqFHMADwE2fLPkd11kv1sBB8MOPmGK8livNp12lzyNB6CFWwvgbwCsXCi
         VGsYuYC+wo78RYKlSvfZGsNXBaw1XgyDdgVUWQ5Q9odOuM1yTDLjWWl0tWxaCk8GJVyu
         0+MjmF7AvBIHJb6pxpRmZH964XKJ/greOuPeoOEldT0U+nZUTGRTlOh4BPBWmUo8iSop
         glXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432762; x=1796037562;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnHe+aJ2WsrFZPDl6pOfeR0Olf3ozD9pArGhE6Lcr50=;
        b=s8rydB3JRxXX6jyGJ9FCJ7hKA3rAbQuTWHVBmkWK2aJnBJGZKX5wVKNX+YFLPi13Xt
         ro+PK2ZtLO4ZPjLhwloYX0QFPMcgHiOITw3gjDcYrPuIA7AgP+9PuInkBg8HO4TMie+r
         4K6C97xT2DtOYxwQCI6qZ6bwlY5wK8ZDm9s4IH+sCn9ni355hRqxLkwBdRGtwIhNtvNr
         rgYihLiKvGAfyIeDvs9s2ymri3bV13V9VBHQ7UnsPkSBDzfxqLWWJ/k85kt9XxMZOKH9
         NRyP6rW2Yi/J6+SQ/ofVamjBtMLIpN0CjlOrSarOZSQ4WCYvOq3oj20LgQP8cq0XLMnC
         5uOA==
X-Forwarded-Encrypted: i=1; AL+hErGmasoy/y6G94Er0c+lZa3NLnwvWEkpXZoyn+aqU6X6C4AwTr2T2/4dC8IRG9QWv7hSzMY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+g8fpD8uWsva6+HvJw5apujDVo7MpZY0yRNBXVU5i45QmdI3Ve
	ybA4phSbzHMgMKHAPXPxTTi+xcXbt9pa/uEBKiRG4LDL8zV9a0j5xHc6Io8rNoA9v7o=
X-Gm-Gg: AZFdTZfdTC7mHp/LJ9svCpSLSjoxWRrEc21TIIR8HHwYSxElgAcTUMFNV4u2XZpIoJQ
	D0QnwNI+yToCyRE8rdAyxMqVupma451RCsFAH6SHo+C7tIxIRieFpxcCwLW/PjRIRuzPRrXmeLm
	wKYsyohp4jAGzO58kYjk+B3SX48HQJNLShGVUXHQ9PnAmmJRI3vnAA/32dY9hgKKkJOICcFiujt
	0pBOafzIoJ9JHfikelCy41Mg4qd+bxjs9lVR+HC+/18Y8D2C6JbMWg5bD1OP+RfpMZkf9D7Hupx
	EleUtblkCR/saQq1Kq5gnOLsuDdgNS797aQjri+Reotn0J3qnFe/1TB9+3PhkCZJfRw/QK/W03Z
	nhw97b4VabGd1fh+FbCTa78JtUDh+Ht4pESAjWvPgcXI4bxRPv4LXMhRBg+D5qmi1pG4zymp4vd
	Nn4eq0F+wYabc9Jzrta6bCSkhCiy6Q/3uab2gC/57BJYHdTpv7sut6CyQQG1B/IJ3+kOeqJowc8
	gLZmr3yxehBBTsCeBm2QA+PFiVM/tJQ87iG6M0JCdAPzQalH830L/jD2J7/6CnR8CULmLb3HNUE
	dH9P5E2KbnPLMra0fjJngneLS9TwQds6Rfg+HJ37nFATuTo8OQxi07b3ku2KXNrrg778LQIPHw2
	Os2j/0aHvztCpcBiw
X-Received: by 2002:a05:600c:3555:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4bb8882907fmr231833505e9.34.1795432762456;
        Mon, 23 Nov 2026 03:19:22 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6b2052c8sm21640122f8f.41.2026.11.23.03.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:22 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Thomas Richard <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 14/17] mfd: Unify style of dmi_system_id arrays
Date: Mon, 23 Nov 2026 12:18:12 +0100
Message-ID:  <2ad1457d2b4d6c036934321d6afeda15e4112704.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2444; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=r3z65v4UhgVjo0/cvLPO1/pZfgRWfVroU9ADDGE99HQ=; b=owGbwMvMwMXY3/A7olbonx/jabUkhmwWRS5R3l82m+93Gx6KDja80BrZo/1aREnp7FTPuiieR Q3nrvZ1MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjARvXT2vwKy71Y+0JnV4nDI UI9n//PjR1scE6brn7ecseX3TiWvNLvkOJsbK0U8gqyqrq6sztHzXv5ye3eCeV6p3+97p4I28gW m5zCuX+/PqDX3dGCl3SaTxseLFZQaNwpP+OBz6rrB4oh7X14vfj79Hfc/hkrXCqGAuCNeciemG8 y1TzeWKLjuLD9vp8YFo+Udkx1k5Oe3zG3N+fd9R4HSh7j7rRdr5GZaPJfxLdNgMN1m3Flum3G9u /sgB6fdT5kmufMnDS9pfvwsdUzxslEg95/0PavTt7TpeDQ9DlR6r8/kz7nq8ha57xUte2Lfl5xh 68g1cjz8aRn/2wmV3YXOQrfmuYqcL2xoStlc6lPheI8FAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Only the list terminators didn't match this style as they didn't use a
space.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cgbc-core.c            | 2 +-
 drivers/mfd/intel_quark_i2c_gpio.c | 2 +-
 drivers/mfd/kempld-core.c          | 2 +-
 drivers/mfd/tqmx86.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 8a63923d1912..d1dee7b411fd 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -393,7 +393,7 @@ static const struct dmi_system_id cgbc_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "conga-SA8"),
 		},
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, cgbc_dmi_table);
 
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 443a1a0cf777..7f8c16d82738 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -74,7 +74,7 @@ static const struct dmi_system_id dmi_platform_info[] = {
 		},
 		.driver_data = (void *)&intel_quark_i2c_controller_fast_node,
 	},
-	{}
+	{ }
 };
 
 /* This is used as a place holder and will be modified at run-time */
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 93e35f6be9d5..e61d35664c03 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -737,7 +737,7 @@ static const struct dmi_system_id kempld_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "Qseven-Q7AL"),
 		},
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, kempld_dmi_table);
 
diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 1c2fe3f91238..16f47566cf3c 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -338,7 +338,7 @@ static const struct dmi_system_id tqmx86_dmi_table[] __initconst = {
 		},
 		.callback = tqmx86_create_platform_device,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, tqmx86_dmi_table);
 
-- 
2.47.3

