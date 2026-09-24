Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297214BFE96
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276207; cv=none; b=byP5doCiH/u+vaHUweNU3bfhrhbBqpujQjdLZrH28eR6qltjd77NdSq3rQh48Iu5/ib6p1Tns0ilgwggFxzntwtfCzTQ8TKYCt0qi1AO9mSBLtIUhC61Vgs9Ehsy2UtNib0I0sM8zF1azHl3LFxFfJZveq6NJMMfRRfesCuW30Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276207; c=relaxed/simple;
	bh=8FwKlIoS1YJr20q5/GeHL/Z3vtXW795veMaqn77uBQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQo1bB3Vs9hmTul5d7AaugNjunXyn4n4EnTKk+Q7DfNOpHSm32ym7E2vRb8Q6rIf/zjEznEUFuIuqwAfTAa7kbRxO1vKxPToAQsImWWf8Q+n36JZoaQnlWNn7XAf1vfVuXm/qq1VOvsroeo7vCbNcTeMmD3wzGFouoA7CI4q3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeiKDZa/; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeiKDZa/"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7b325so1508611cf.0
        for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 11:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790276204; x=1790881004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7if64GBDyZRxjhYKdKsp7wUaEGoHDi7prbfVqVtWGk=;
        b=UeiKDZa/Y/T4xlMJOrkEQrP2wYcdjAndh4rC1790u0wrBHo/DeB0W+yREwMI1CKBtz
         IWr9ZAxphUUBD4H4wzVK/oel1UhrL9zqoSnbWLV4X4RLaHS/oQLsz7NYo/kLonIa6GbP
         BNTXWohtri8n9H0RNgPk9yDqhWormqqD/CKcFsIhqbLWBlgDwY0XNVsV4guYiWwwyYCt
         YPTmwgRo7ErmwDoCbzRcxCBHlGtN6Bmy2rXGPyHC5LGOx38XdbrjLHhajSFN/nYntqjA
         AnyLlvOdqVGgly1kn+uGG6GOdSwqqMPaeQSTuDev/x5SN4H0ZHsWhBbW+QGTSuESeDxm
         /D+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276204; x=1790881004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7if64GBDyZRxjhYKdKsp7wUaEGoHDi7prbfVqVtWGk=;
        b=GlGl4ZYMr3Qcd0ybsLGjRTjlucuUhTgANcKungBDKiRqIw6CZobxALeh5cYl+VEq1r
         QdVVGYBYhCBzzTd7V2Nkm4kaoFsGtooTiBcWYo7pbGGlelmvYrob/jeDhrbiBesH7k3z
         A+fWHLeHqVWyQPf8jiBOIguu8n1k6TPo9iRE7nAJS4jX0MItc4nPT8p5zJK0UTmhMi2G
         d/kV5HQhGw4MLZ8KsMhW4BNe9W+VPPwPSrZp3Sb7vUz2uyP9DZShkzLdQAgwLfBgD9nF
         M/kwH7GM9mHxutKvWU+OmVRHRNo00+ro3CX6mDJDFE3wzOziiHn+3CSVocn8FLw6cAGb
         RnlA==
X-Gm-Message-State: AFuF++nnKzgf6dkG3y02o7F/PsI3Fx/oDQ0n3Yx5RTwGUQpYNBVVvvnu
	SlOXga0PbqFCmAPx8uQsCTY57z7zeyA3nAT5bx4KtbwjyR4z4nc2KdejGuJx8w==
X-Gm-Gg: AYBFou0UY30+s4bsWSkXQQpvUoYOnM1lpa+OwCNeDoOij6Z+zqh0/Gu1BVINV6yS1PH
	UyrlkhyyYbPqTtSztAsI+iIPBOy25QthduEmmEZ8sHezJUqdJ7LoYI1bvIObRwqkfBfaacb0joe
	8KYZIRT4A6dRpel/5DkQsmjWJ2K7zwGwAnCjDZQ0SKFAUwgjRffHU9IC2MUg8hfDtB3X+RAE5zc
	dssH2tZNaPozq09P928vsO1VPvNZMgWW8/rb4T6Tbq86OSe0nOtrQQZQegYEOBSGoBo35fLI+rs
	FvWrL8+Kt/izt5/4w3VPXZccUyxX3UO7ysx7+MVmVF2T9+OwkQtvTpdtIjdIiU85lP16BVfNofF
	PKOKefAiekcrPzTwdm6lgWbcOhiYzp8YrdMXs7PZSLLg+NtzWg/362eSK/64ewgxMwC6F4S47pv
	5Nu7v8MnJcd0pfcle3vsSyvWSSulZ5pbYgdgGA35KMRoX9xS7xZnuvc127lyhAKE2WERHp2pNJj
	EDRIqxY7Feet4DD+vjK88HSv+gkE8HB8Wsx6ZxaDbtIwOYV0UJy82WkoHWCkpWH1qAcuGvwhx2N
	ECWvbuatc9SFYYGGcFioSUUuueC1EOqxSgb0q0o81/7VWVkNgBNJLgLczvc=
X-Received: by 2002:a05:622a:130e:b0:532:d743:33e6 with SMTP id d75a77b69052e-5330b5881b9mr3667121cf.9.1790276203621;
        Thu, 24 Sep 2026 11:56:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330beed557sm286031cf.15.2026.09.24.11.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:56:42 -0700 (PDT)
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
Subject: [PATCHv2] mfd: twl-core: allocate modules with twl_private
Date: Thu, 24 Sep 2026 11:56:39 -0700
Message-ID: <20260924185639.30913-1-rosenp@gmail.com>
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

Can't use twl_get_num_slaves() for this as that bases its value on
twl_priv->twl_id , which is unallocated at this point.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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

