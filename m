Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634CA43DA53
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616437; cv=none; b=R2ElktugYDMHbnl+rCG2gmaiIvqLQKl7uWEbg//ip+x8mJF7dxV38JboDrba3oZryuO5uJHoCigtEUYXad4riOOnRmiEszwJZ1rJE7lWjnchLc5qJoM1l9DIsU3CThOgcQ48hujxOReRvAgcfS+GfePQtb1IR7whNqhg/ys/isI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616437; c=relaxed/simple;
	bh=L6a+TSyNeQkXodANJ0bxdgRUoHsiDZJuTEW6IHqgFsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mB6h4oBtKpITaYStHPcnKOlq4hdvaQ1PV7HoH30oQXdS+3dzatnPbTKt0JiFNYxQqrzmi86oymWdbiBCIyHG8tqRmquiEOzHymweLs1pjC7ybxmmqvdYuCKyw995fYp/vTfIbhQdLfkNEHnveowRsF3zdIJbzJHN2oKcdtxjRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T2FICli9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="T2FICli9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso312125e9.0
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616434; x=1784221234; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7KzrJtufX6WNLCGXrHTiBunCuSwi/GJa1WSDb82VDGk=;
        b=T2FICli9ha2lrbhPxU55BTqxmSOEPjIpW1KO6gj4TfzfwldwuAsYVij9txfdmPRrKY
         ga4YxO7WhnEducXpF1pNyoHbFgoakue73y+x5703QOxgn3j+p+GexCt8Uw03OAqOYfqs
         n87MCt+A50IirlzFnZnz7QYHu4WXUhhin2cTkABCHD4WAcBHw9KrmbrEBWY5qkrtopdK
         +tEPJz/wq6Qr0/h3SWEBCwJsi+IbXFPc9myqSzO6w+qGHGQYmoqDzix+JqflbZ0bhHkq
         iJE41qyDSJu8uJK48YnPLNoUTHrapHbCu73J60egLPJOhj0Yxl32l2hymdzTyRayNttb
         L32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616434; x=1784221234;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KzrJtufX6WNLCGXrHTiBunCuSwi/GJa1WSDb82VDGk=;
        b=ekpmJ/vfU0/rvBi5fmi1naCzydDBpL9Mxq1OUIrud8H0mechCUKKRYU3a+orjy7Xgf
         adgc2BPC319YxODTC4z6fOsEby6/tGB+q6E5ZRWHNlqlZp5tyMXeXS0irEKVbcSakKYS
         61V6Dx3Hh7aUSs0WL6rrQZhCjaxc/sJJzfGLOWVlDXLk2UGtyPzGc0pd32GwqmOzqZpU
         VapE8vXP1iIsZuyAV+wilY4hQxg0TEKPKLo8gO8Q6IJEE2AvN8hgEGwz317I5KBcKmFc
         t3RyvXpog/O3228+0gD+ddh6wXGbTRfATXh1t9px/iPZGh+d1nhR2HLgiiy8K8Ubfsps
         HTfg==
X-Forwarded-Encrypted: i=1; AHgh+Ronvp7sfBSnvUvNsuraSN7FejBcDt8o0SvDYLH83ydP7+gmMvlui2rp4pJwCqk+FKysbkA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQJEO6a5I52BSDSsm+c/ZNznLy1bH4xDXgyeuJA+inCFtYsWcs
	Yz1MGGYEDuTJq+zR4znzBoxl0Xz8Yg++kk5CeVsag+V0lyY+Aqr4L2KDZZMmWR4zUGA=
X-Gm-Gg: AfdE7ckgMFN7Ds1k4hN+m1hd7EIC4pyzlkspSe6yHuIDZsXt2SsY0gMzKcnTKHRsC6n
	8+wfIoPJchZDdyqwhHg1CDTG1jZcxFMQ9l+slUVbe9/gUMm5dbAjT2RyEuWMUW/Fiu6Z7a0kxEr
	ivzX2jDuoHLqPSOLO0CADFLBbKmEUOVSq/DRgWAlktyFy2txeMRL26/KBIjz9bNvW7kOrpi9c8U
	d5BaCZer6TT2xg+QeVo/DRwfhL+jusiC91k670ivMfuPOyNGznCizSyMzbBUs6aKODuK41D4/6w
	5qROuuq9Fi9fHFEILg9CrCo+aOChsnfD4mkVCG7PElVR49/vZjKJ34dBdyK4jZsLO0bxMD/OodL
	Ir+FquUmKRHnoHyYAkmDZ5aiDnT4YKC9KfJXrncxqO413iX2TTMMOJgSjo86cNAQazKPxjAxcv+
	UYiaIK+7aLaxL/hIV2OIodTR/AH9Hw1482p+MWwT3lohogXOAvo3B2wZ/Axx8+pjQbsegeAgfSN
	iOzt+PxS0laBN4=
X-Received: by 2002:a05:600c:c173:b0:493:aa0a:45b0 with SMTP id 5b1f17b1804b1-493e8dc7b7emr67186605e9.23.1783616433017;
        Thu, 09 Jul 2026 10:00:33 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960af0sm48359451f8f.30.2026.07.09.10.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v3 19/23] mfd: Unify style of dmi_system_id arrays
Date: Thu,  9 Jul 2026 18:58:38 +0200
Message-ID:  <605877cac2c3cad03658e742ebd6b02f4f2ad9ea.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2413; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=L6a+TSyNeQkXodANJ0bxdgRUoHsiDZJuTEW6IHqgFsI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NjhncETPKfo5NopQjFICPU58pWglP5hND4v 827baBNsCKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TYwAKCRCPgPtYfRL+ Tm/5CACQZzIhhzsTelhE89zFIrYsL6Q1KftHMtqsB6+npNNqiQ3ChB5MPvOiGUvFVeBZedbtOwH AnkMdkHlskZieXl1Joi3KLuYT8/OyOiNvWdNa0NNt/5Ix/5PfV36tYRUJ2rJk5UhgRh8vnXCdkz nlho5Q3ITdn+cgVhUzOxQ4ln0wE6opA4erCnNqWp/LTpKo0DW35/S99XSvfZ5RA5ORe1wtX0/+M nudDmTtQFf2gwBvgbtsR7Me+D7NqezJrNqXS0/7SopghRPe7tGhmxhkUgomZeeO9FPor78ZEYMw mY9P99svyfOrXxjvmKbeyH/0DY4ZRz13ySjJs86j2JjMXVra
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
index 4c1e7a0ab0ee..104a07dc8f16 100644
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
2.55.0.11.g153666a7d9bb

