Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E36744D020
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509433; cv=none; b=tPKit+55bf6j+A2Bbsae0t1oUvpZp+iwSH3hyLqxNOFLDbJewu2mnQTBRM4RFFf6qHwhB3nUMbo+dQX1CGvpw6fqlLwfEHDfT5f08FfsMV3pfhEZ+aIBsUvezFkkcMiVqOhPjIyMEXtQ5FFYRWwTS6XoS2bTV/Z2LXicovxN5wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509433; c=relaxed/simple;
	bh=ISkUf3wXpJDBwqrVQ+WtXzMtQQ8XttlFIYnqxhTu7Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sePtV1xgSNGa5M2oulAnlkes9FRX8NILVPCDjv9NAkZQfD0jrV8booi7/lCxlry/F58ouYbHUVTgdqDvvaKsXgoWppAeE2a81XP84yMtg7DDkf6zkxsGt76AZobXpBCEJ8h5wkKts4XkdUuq3Wd4/3XHDkFrceZ0W6rJC78AFmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XcJYwcCz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XcJYwcCz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso3437615e9.2
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509430; x=1784114230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llOhgMHciH8oq8MOq8MIs2c2dGOpWmk7rqBmL1lBY98=;
        b=XcJYwcCzCBXP8ikXSytIFfsr1l9fDA3cN/NTDszb6pHWpzKf9dI+c1usLLgqLHE+s1
         ahCB7qHKvqeMIlv51WVRAl6rJ7N0jFpbqgYdQzuQg9LFkTAvPICIoYC9Tf1FhipSkZ88
         vykVT5zC7KSOKtpcfneVyg1U+yfoRd96PP3UwfESVGKMImFLoMeRQaAuihSAsufBW5/5
         j5EY3XZjoaJkjJP38ffyfHpffVkSEgkIbzH2EC7vHUz6ugnfCU34pQxyC4vQphIFRXH0
         bUB9cAOSLtId7HfVIa7/yxKfYlpBqI2chMgCSR+I3mgXQ37SbsEOV7PkZ7vXLNilOK+4
         9ANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509430; x=1784114230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=llOhgMHciH8oq8MOq8MIs2c2dGOpWmk7rqBmL1lBY98=;
        b=Cf1kI8VMiOsA2lWElseSwg0P+SuFoMIxqaZ2A0S0A0eb0M1crrbBNUWzPBm22HM0kW
         6IcI1JK3aDbCZ/Pxr4CvzUP32MUu4gh5dttFu1nPHmdpNelSWWdIpqZeXHNUAgHjLQa4
         3kNYGgEpJWgDn/l6I0jjdnigPPqi9rJ1QLMpXjpU7ZqUsM7ReJC41QpDYIFVz0mnSTg4
         B8DbVQIq8b/zXhPyrGKI0Tfcg9NalnIkFx1ibTjTDdyrGaSrgiJZjt31tyV8/qQab4Zc
         a65V5S+XVAarwlGXTybDxEw8K/enp+2LXlGWVCTyp+ilBOLTInyviF5dpp7iNHR71k5R
         Rl3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqxGDTaCiTGq7U5aRHedpzirW4Yo7H8iAvQZN6xlhZf+0u/pWqDvkftMHUrKRMpaTc3FkU=@lists.linux.dev
X-Gm-Message-State: AOJu0YylPVNrHZVIucc6SyuCF76OwNSKmMuuDTH2IA91lck5OWvyQSVP
	4iiNaVrNI1Wjh4G24iPFx+04L8IHLLf9xgLGBBzP7X0g4S6aKp88UA+eozIOWLFsNHU=
X-Gm-Gg: AfdE7clisyiJRq0l5NRcVZAg1Zx30YujSp1ew3ay71TiXYDPGmmSCMVuH8xvL557Ark
	wDx9ZTgOcofShPLTM6UkBwY6O2OWEJgYYK0XZreM7oz/SXdjO5DvMuRJevKftijBvKKgVIh5/Hl
	h5fQrfbofitImaWvBMuV77dgnag4maptQua/QLgc0wIubC9tZPmu4XsDd0oEJ4sM0OrAShoRSkt
	ZdzUSyPneTCQwwzys3F3DiAStWMoK0r6Ur9i/B3akrQJ6VdLrgQvqkZ9BhY8yVXP6u6vFier2kH
	iO3r20GUoX352gUOHKkqA7akABOGGQkc2GpZ71nAlncXoOhcH73Nj3ZQiAfVGlJ6bUPqfSmr9SO
	Lyh7q+/jPNmB2mZqcwy8jdM7BL8PHdNS0EGCzoHkDQzBZZ7/r00ELvB6fQMEd79Fe6kzN2k5CEj
	+OtM+89cteIUJMk4ml3WzlVwWtvHVT0iLgtzTIi+LDnVKNKecnw+3hNE2lT3lcuB18Vx9kjEGxY
	Bjo
X-Received: by 2002:a05:600d:8445:10b0:493:b89b:9a27 with SMTP id 5b1f17b1804b1-493e68a0c32mr16856605e9.9.1783509429623;
        Wed, 08 Jul 2026 04:17:09 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e5a572c3sm60801825e9.1.2026.07.08.04.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v2 19/23] mfd: Unify style of dmi_system_id arrays
Date: Wed,  8 Jul 2026 13:15:26 +0200
Message-ID:  <d03f1a25cbceadde9b40461034262b0538ee2883.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2413; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ISkUf3wXpJDBwqrVQ+WtXzMtQQ8XttlFIYnqxhTu7Hw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjGAeYS3BPkHw4v+yj2JeDK61SDgdHfciMUO1 RPgs0k++q2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xgAAKCRCPgPtYfRL+ TuteB/0cXJbII+yuayxRpGB/zK4H2D+SFhESiYOTcYrIMquhX17MxaKbGWMD3TvZbz82TOPL5D8 2sFlP614SnBnMFXBim4vPNHwR6p3iPHXMMdGW+9TlzDazXXHSPxZZkw/jBQs/yKZbmDkQY0I00G tQsJglozkjGuUFPNI/AoXVBEGz/eFUlb9Jx1CRB9LB+EnaPdpjPJLNMpyXOxIwTyBzKMfkiezil EkUH2SP53jHXVZWSje9GTHYcDm/pMl+VCw5NkVAO4wCjqbCAB5Ni/QVL5eRBJVshiHGKRpekY8z OEvVdmMfbOq9hWLFCG/ZBP1ajFzW8djplQVLuqRmkFTYILr5
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cgbc-core.c            | 2 +-
 drivers/mfd/intel_quark_i2c_gpio.c | 2 +-
 drivers/mfd/kempld-core.c          | 2 +-
 drivers/mfd/tqmx86.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 10bb4b414c34..b568722cc8b7 100644
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
index 9b9c76bd067b..87dbe1a94247 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -79,7 +79,7 @@ static const struct dmi_system_id dmi_platform_info[] = {
 		},
 		.driver_data = (void *)&intel_quark_i2c_controller_fast_node,
 	},
-	{}
+	{ }
 };
 
 /* This is used as a place holder and will be modified at run-time */
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 9b3a877f44fb..83d912e82401 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -766,7 +766,7 @@ static const struct dmi_system_id kempld_dmi_table[] __initconst = {
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
2.55.0.11.g153666a7d9bb

