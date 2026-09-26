Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B720B80B
	for <mfd@lists.linux.dev>; Sat, 26 Sep 2026 01:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386410; cv=none; b=OfA9Fm0bSC1avsytcJSgRFwXFb6VS/YXaiQPIyZ6tsEhmsCmYfctLaNchBDB8y8RMLm+BYU+r5CyikluS8sfVPmiAzhkHluFPVgx7pDYhYvFXnO7yWXoSuKzULmgLau+gvD65LHvdzMq/RXXAlqryRqbXb1x27RnTlKd8Wdz5zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386410; c=relaxed/simple;
	bh=1f1mz/u1DXLFELJxB0lWigtpTDzng/wOa0yeqTZVdUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Srj80L3r1F9k4zS4ozbJ5GCNWK0lvgl8x/gBatB5PRf/tVloA0m5SNxXb1eyNxK9xgeqJ4djXPtaWTxjrB3Y1oqcyfAOf1zu3S+WRtbDWGWeWJaYsVqCyk/E8+uRgs3ZjjfRDc2xOiybUYUnwYMfjvW4la9BLn1NixlAEvMqxto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lG6yhoWP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lG6yhoWP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so6705505ad.1
        for <mfd@lists.linux.dev>; Fri, 25 Sep 2026 18:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386408; x=1790991208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XO5IQrDqXhCVEXobXwqmnVmb7P8gC0TesjStAXIcO2g=;
        b=lG6yhoWP1EwF5g+cnh6yU2uCp5PjrRUSEvEQb5BVWyKnLlhejHqs4rw+t4y9HjuGke
         tLeUCgNnx6nGwnQ3dpZMkNn1QzZ0EUQnI/2/pZUsU3jba813BD3SjXf44slFyrYEAjEK
         naqksE4Ehlk5itzb9vWyDLM/J88T+kTg21VKQG0oni1HsenFxAj+GZHobslAsLcIiuNj
         jBvBp8CUeXvXEHAsTsWexHNiZoKmCwB7ZaBsDIrczby3D0zSEQSHjbmfU+nkwT1f6GGU
         P15MJX57LhShnt82p2wewNzC6xIE+ESZRlbgtJ787dbaGo5m/cngqpmFdCwsornCmWk9
         BnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386408; x=1790991208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO5IQrDqXhCVEXobXwqmnVmb7P8gC0TesjStAXIcO2g=;
        b=QfYyIJJ+Qbm14RZTw3WqMuemdvTaMLvBMAAGfE2psUAs4G69rRct8Xb4rFzbA8dAbl
         I2GvpKxsIC7KecoeDM3zrYeOXlleBXQJcgN+08PQ6Vp3ctqVFnyJYy5uMHryRSRvu3+5
         xe1vZ0ekwEN/1k48o0Py3eKBE3+Whm/zbLZ3TwM2xU4TuDlQZB/KXcNiqeq2CnyvG9Wo
         t4hvMUqkTsH3wmF+dV51yT7lFdB9BMh1wMsMfkXmN828vhOHrPmA+2PNH5+9KOIfqL2O
         rk4f+7nWOxocWeG46j7tnu1slqZ9X4Wa4NsExAxJQoIb+4D2sXUDhz4tf1kwHdW066+l
         wnwg==
X-Gm-Message-State: AFuF++nELCEC2JWPtcEvpHd213acL6TErmwCinkBGnyP2ag/Oy0Vv5Ra
	6PTNN/DEdwtJxqn3r9UsVW8ozJFCEfHqfoE+FWmInSNcVdRjct1o9/xdFZrWoQ==
X-Gm-Gg: AYBFou310DOfPhGGAedLxdt1i+Ty9BciJzdpIzuRZQEh6/csoywV54J2kRoB09lR3tc
	/3aZ3UsV5Mz+SL13JHuD0GpgtSLn9UzfMNWGIypkg1qYdUOLzjR4nRiWPZqUK9dyL6MyjBBaCLj
	2xtj6KVIqpTuWSw43FgIm80mm6PSvEEORfXzHgl6sU69PvCCCsnNmYdkiN2qgXJFHDdP5Rka16y
	CwpzUIkY/gtV6pMhYwSvnb1aUBXvjSn9WGWmi5qBZPVPwTc12pim+vWpJUxC5hbPWal03UPeEf8
	+Axk68tEjJzs2gD5BEf72lYlM/Do84XOocP7Zp1GZiJwC+e/EKHnro6khZHIatLTWncZvpvoVOX
	/raiHK3Wd47dPO1hsEx0Aw/qdjpXTqp0GcSIHErVukbfcnslwPm+6ws98Pm+sRNAc2IAwS80znn
	EmhpRuJ/0gPCgz2XajfF9bVMaGuwiUCujRrahyoeUhDjSHfJxK7Ju8zodyZjLYrD4+L4G7T2m38
	Jc8WY9whIYPXGtiOCUmqESvhpMEsbuQ841vD/7Mhgt3XJ776nhAB37UUTEa0mxZfRPCFplYRFjW
	PGsmWhsD/MALqshDCprI/B6ObOBfaBQ7vf0g5UfpLtaj5MZg/UFLc4KtvT0=
X-Received: by 2002:a17:902:cf0f:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2df7e251f3bmr42954915ad.23.1790386407959;
        Fri, 25 Sep 2026 18:33:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fc39ddsm17396165ad.7.2026.09.25.18.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:33:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: mfd@lists.linux.dev
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Lee Jones <lee@kernel.org>,
	linux-omap@vger.kernel.org (open list:OMAP2+ SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] mfd: twl-core: Allocate modules with twl_private
Date: Fri, 25 Sep 2026 18:33:25 -0700
Message-ID: <20260926013325.75073-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to allocate the twl_client array together
with struct twl_private. This removes a separate devm_kcalloc() and
keeps the module data tied to the main private structure.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: Capitalize Allocate.
 v2: don't use twl_get_num_slaves().
 drivers/mfd/twl-core.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index f86df356d658..0b78fe30e047 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -159,7 +159,7 @@ struct twl_private {
 	unsigned int twl_id;
 
 	struct twl_mapping *twl_map;
-	struct twl_client *twl_modules;
+	struct twl_client twl_modules[];
 };
 
 static struct twl_private *twl_priv;
@@ -770,7 +770,9 @@ twl_probe(struct i2c_client *client)
 		goto out;
 	}
 
-	twl_priv = devm_kzalloc(&client->dev, sizeof(struct twl_private),
+	num_slaves = (id->driver_data & TWL6030_CLASS) ? 3 : 4;
+	twl_priv = devm_kzalloc(&client->dev,
+				struct_size(twl_priv, twl_modules, num_slaves),
 				GFP_KERNEL);
 	if (!twl_priv) {
 		status = -ENOMEM;
@@ -787,16 +789,6 @@ twl_probe(struct i2c_client *client)
 		twl_regmap_config = twl4030_regmap_config;
 	}
 
-	num_slaves = twl_get_num_slaves();
-	twl_priv->twl_modules = devm_kcalloc(&client->dev,
-					 num_slaves,
-					 sizeof(struct twl_client),
-					 GFP_KERNEL);
-	if (!twl_priv->twl_modules) {
-		status = -ENOMEM;
-		goto out;
-	}
-
 	for (i = 0; i < num_slaves; i++) {
 		struct twl_client *twl = &twl_priv->twl_modules[i];
 
-- 
2.55.0

