Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432766;
	b=hRjxrxyssiTqyxhlRRfYsEgTsm0g9UGYjfrd5+uz6CYFrPrwjaXneuYWPYpAbGGhs1sH
	 4TyTWp9NVVsqeT1WYg9x/NZG6pnitTABNTsh/icxhStc7O12bjAPwX/zByjyyVqatDNnM
	 2+8R83lkvTELyX7QgrlzW8d6G5pUcfnoeX1J479tXwivDQGg6Abp2GkYV0figg5POGVYv
	 l885RwcZaYuY7m/Ii3jOXtx3Z6zeGshWiJFb5UHVQNfA0zH7hDxPOFpGQWRsY/rLaqIgg
	 5WKkqnGmy/ZAMuxOsnyns1XLw78Zhm1Yc+iN+c4KGdibbWFQEpwTN24TOZ8YK1wExoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=UriCVVi4FzVmNtd9uxOgPEfOtJolmF8AfkCfRGKWNaA=;
	b=q0GqCBGAN3Lt5E3tNxDKdHszGS7wZxbDHhdU8sHcjrvteWuQzLuPmgOWnlRMBEM3Syyr
	 cnzlmOCfzVhoINtM3r0xW4s8BuNk3kH4X2LWU52B2FJsfpT26o8Pj8IQkbX5rVhpHFPjk
	 2bnbPAf8SWme5oOLEgrKcK/f968fVDrocObROLXkad5s1I4DswNQJIPeStjVioJdg7NOI
	 5b9zXVclokBGsk7YZnGuKHcXSsHF8JFVatwVxVp0/DsE2qZ5uk/z7vqyzdVvaXqh34x29
	 rHuF2f28ucxJVfanM3zAG03JNUwq91uQrBW7HTPJoiFCp9Jg1Hr1qUtHIzj3I/eEQ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=R2RAvfJP;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62D9606A6B3
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62D9606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=R2RAvfJP
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so24366655e9.3
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432764; x=1796037564; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UriCVVi4FzVmNtd9uxOgPEfOtJolmF8AfkCfRGKWNaA=;
        b=R2RAvfJPD4V2SQSDi60GAOisJmcGmuKY/VHQQ3DMEVBXYGsvFC8CP5KRklAkA5b8pc
         hA4CaORaT1kIJCkXhMqop5bd0IqtvXHcMFZlxifdB9ims60TqYdxxrI1+WTwPKaRNNqe
         UUcHe/QglgxWJL5ndSZzy7Sh/UBoEhMMI88bgEH47HXUJYX9noPcP1QwcaAgO1D3RTe3
         l1GE8w61/GOGH+ER7svCVHy/zsagizMoAPVOHMa8dnGpkjrdhEZ2wsjeD1zeVcwdyEAg
         eWETkinNFDjjiqRwpOHxLPyY/x9riDFp21aJm6fmXFIJvhYJhLChWQbCAAh9J7kdaBVZ
         bXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432764; x=1796037564;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UriCVVi4FzVmNtd9uxOgPEfOtJolmF8AfkCfRGKWNaA=;
        b=2jwEOSZUMeVHvigK4K6aFHp0pceFWr8B6dh4UAbSlvL6dEri1JQZn9sGhvQjfSKiDP
         C6UK+xe6bQ5RoteouApPgqYciAs/jrt74jNTENe6S3rRqvvYMyUpXPnxK4J+ki53Hp6g
         R+7ipDQmmG6Pb6UCDT0j2mfIh0vbb7oeXDyTj+n+AaVLkzaU/7D9Jx8tLwYhXi+yVfL0
         F0txHZIhhfL0tgdM7fKuFFx2EP545sHgKOJ6jFM6ALMLWROae/m2JTyI/FVo0LkjoJo6
         V2rux2r1GYUW7gaY1PwpuZik6hd+3PDv5v6fgxU1scnjnAjwh9QIoGUnS3dZqEvM71Xo
         Ev3A==
X-Forwarded-Encrypted: i=1; AL+hErGUKKiimt2j6E+d0xO4BxxHYcxMMwJsIEuKx7PcmY53iV11pGS7noUkv/IFB1UdH/1wRJs=@lists.linux.dev
X-Gm-Message-State: APuU4Z8scU8vwvAsDFUD/rva/ubS7Oqc3E/mbsLgiS1XSeEyDh1Yfhkt
	KiPzAXiU3PBsAYUGC+Jk0XhNrlyoVPGY9U+s3gOvoU6iHiPGWDs1XFGYHELXXhtvI4s=
X-Gm-Gg: AZFdTZfjn+q9Kly1J3IwZG8UB3h9fwrq+JATHPw/pUOqR9wSqIGZYiGVJBtRhjJ1jAg
	AdlsUVkUB1jp8qgPQVdXSIQbo/20ndb1UN4pfYttGL4l8BuR+r1v52iBC5QCZ5NNuJJH7KC5LcS
	XPzf5NBLywdMnU/Fclbl37KMmOvM1Q9pxhStU/9ckpa9sjISCx5b8SkiGwMFMciGqHpIRi5EE9K
	L+VbPs/BYGuP1YxW8uqcJ67XMR/CIiCFZCO9TrZBQ7c0dnLSUO8aZ8kIogi/TsMRM/Y33VqLhz5
	snbjmjrbgfebQHJeTNzeSb7mPZXro2OdFtTMXnEx2yMX6twTYD1xVI4SWGMYJYRY/gAIb0XOCtJ
	d4QBOpbr8/vkRxagAv4sRX4U2Q1khHmML3pKBrsgOlOCRiozAjvvp1uu8eOrrfn+HxrGk5P7nKW
	zGML1z2r7CitaQ4JMDcOsuv3W9t/g5HnzG7NxkjrI/Z+j6JFzte1nk6KV6VuXiQYcCsqhUB3cXK
	1Kg7wL6sewno1lufGmZJVvjNoK7f/5WgEbdCuTJ7nOJqbCCYcdamsgtG7gwYq4gPuTKediuIjNJ
	PvjJ6bK25IhpnGBywO7y10yYycaMU2JOo8gfOvGaa97gFO7SbkmZ9ciSe6vAgRhfF5A2U75wrq6
	WS3NtWQYF/B7H+Xz6
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr221173065e9.35.1795432764263;
        Mon, 23 Nov 2026 03:19:24 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906817ccsm160694775e9.5.2026.11.23.03.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:23 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-omap@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 15/17] mfd: Unify style of i2c_device_id arrays
Date: Mon, 23 Nov 2026 12:18:13 +0100
Message-ID:  <73d8e90d1a392767976100e83402ad31784a1fb2.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9684; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Fdl26dtonR7KNI6QS7TwlVPlGBMUYj+GEYuuZH9GZEQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCEN92s/Oe/+Qgz1dbF6dfn+BQeokBrqy4q+W 8oJMl1lSRCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQhDQAKCRCPgPtYfRL+ ToVYCAC60VXGJyc9KXGFedrGxmQ18JZn7pkcWp2Ak04fM93K66CnovfvTBM5ZKgkHr2sLzcIaVJ Kyvwt+tQCc17ZbnyX1lRm37InUxvQ5gZbPjVUjhJ4KjYqL23FkqbNT8V1B2jem0pUgBeoVuhXaH 5lOaUdVERrmAx18H7E7qIfBs1a91gA7AT5EAvdZZwK+AyMDLWLs7jMOig10LjXgQS4tNtvXsYPo Kq1HARQJuY7g8OxIxdjNtDYl7qk04nIrG2T/K0XOq9WfR15HvopCaGaKdKci3kMSsC4IcdCFgaA 2n2tc54Dt9SWLIYrVZ1pJICGYTaxTMpPu6GtxRKOl4C4yICd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Most of these arrays already mostly match the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly and also use tabs for indention for
two drivers.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/88pm800.c       | 2 +-
 drivers/mfd/88pm805.c       | 2 +-
 drivers/mfd/88pm860x-core.c | 2 +-
 drivers/mfd/act8945a.c      | 2 +-
 drivers/mfd/as3711.c        | 2 +-
 drivers/mfd/as3722.c        | 2 +-
 drivers/mfd/bq257xx.c       | 2 +-
 drivers/mfd/cs40l50-i2c.c   | 2 +-
 drivers/mfd/da903x.c        | 2 +-
 drivers/mfd/da9052-i2c.c    | 2 +-
 drivers/mfd/da9063-i2c.c    | 2 +-
 drivers/mfd/max77620.c      | 2 +-
 drivers/mfd/max77843.c      | 2 +-
 drivers/mfd/max8907.c       | 2 +-
 drivers/mfd/rc5t583.c       | 2 +-
 drivers/mfd/rsmu_i2c.c      | 2 +-
 drivers/mfd/si476x-i2c.c    | 2 +-
 drivers/mfd/tps65910.c      | 6 +++---
 drivers/mfd/wm8400-core.c   | 4 ++--
 19 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index 570700d503a7..961d37814aba 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -117,7 +117,7 @@ enum {
 
 static const struct i2c_device_id pm80x_id_table[] = {
 	{ .name = "88PM800" },
-	{} /* NULL terminated */
+	{ } /* NULL terminated */
 };
 MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
 
diff --git a/drivers/mfd/88pm805.c b/drivers/mfd/88pm805.c
index 2eb3380a5207..8df11233bc4c 100644
--- a/drivers/mfd/88pm805.c
+++ b/drivers/mfd/88pm805.c
@@ -31,7 +31,7 @@
 
 static const struct i2c_device_id pm80x_id_table[] = {
 	{ .name = "88PM805" },
-	{} /* NULL terminated */
+	{ } /* NULL terminated */
 };
 MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
 
diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 733f2a50247a..ce521b042c5c 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -1231,7 +1231,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(pm860x_pm_ops, pm860x_suspend, pm860x_resume);
 
 static const struct i2c_device_id pm860x_id_table[] = {
 	{ .name = "88PM860x" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pm860x_id_table);
 
diff --git a/drivers/mfd/act8945a.c b/drivers/mfd/act8945a.c
index bb1b4e4fb288..e5fba40f89d4 100644
--- a/drivers/mfd/act8945a.c
+++ b/drivers/mfd/act8945a.c
@@ -55,7 +55,7 @@ static int act8945a_i2c_probe(struct i2c_client *i2c)
 
 static const struct i2c_device_id act8945a_i2c_id[] = {
 	{ .name = "act8945a" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, act8945a_i2c_id);
 
diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
index 9513dc4ee0cd..23dabf4483e5 100644
--- a/drivers/mfd/as3711.c
+++ b/drivers/mfd/as3711.c
@@ -192,7 +192,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
 
 static const struct i2c_device_id as3711_i2c_id[] = {
 	{ .name = "as3711" },
-	{}
+	{ }
 };
 
 static struct i2c_driver as3711_i2c_driver = {
diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
index dfabb9b8956e..e545cdd09d81 100644
--- a/drivers/mfd/as3722.c
+++ b/drivers/mfd/as3722.c
@@ -433,7 +433,7 @@ MODULE_DEVICE_TABLE(of, as3722_of_match);
 
 static const struct i2c_device_id as3722_i2c_id[] = {
 	{ .name = "as3722" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, as3722_i2c_id);
 
diff --git a/drivers/mfd/bq257xx.c b/drivers/mfd/bq257xx.c
index 1858f03df29a..ea47496a81e3 100644
--- a/drivers/mfd/bq257xx.c
+++ b/drivers/mfd/bq257xx.c
@@ -131,7 +131,7 @@ static int bq257xx_probe(struct i2c_client *client)
 static const struct i2c_device_id bq257xx_i2c_ids[] = {
 	{ .name = "bq25703a", .driver_data = BQ25703A },
 	{ .name = "bq25792", .driver_data = BQ25792 },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, bq257xx_i2c_ids);
 
diff --git a/drivers/mfd/cs40l50-i2c.c b/drivers/mfd/cs40l50-i2c.c
index 31da37fcc567..0e6fa90bb603 100644
--- a/drivers/mfd/cs40l50-i2c.c
+++ b/drivers/mfd/cs40l50-i2c.c
@@ -41,7 +41,7 @@ static void cs40l50_i2c_remove(struct i2c_client *i2c)
 
 static const struct i2c_device_id cs40l50_id_i2c[] = {
 	{ .name = "cs40l50" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs40l50_id_i2c);
 
diff --git a/drivers/mfd/da903x.c b/drivers/mfd/da903x.c
index 36e1df514294..88a20e73a1ef 100644
--- a/drivers/mfd/da903x.c
+++ b/drivers/mfd/da903x.c
@@ -449,7 +449,7 @@ static const struct da903x_chip_ops da903x_ops[] = {
 static const struct i2c_device_id da903x_id_table[] = {
 	{ .name = "da9030", .driver_data = 0 },
 	{ .name = "da9034", .driver_data = 1 },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da903x_id_table);
 
diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
index d1da6e9e9b6b..110d0886f829 100644
--- a/drivers/mfd/da9052-i2c.c
+++ b/drivers/mfd/da9052-i2c.c
@@ -108,7 +108,7 @@ static const struct i2c_device_id da9052_i2c_id[] = {
 	{ .name = "da9053-ba", .driver_data = DA9053_BA },
 	{ .name = "da9053-bb", .driver_data = DA9053_BB },
 	{ .name = "da9053-bc", .driver_data = DA9053_BC },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da9052_i2c_id);
 
diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index c91f4c4feda4..fc053485656b 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -478,7 +478,7 @@ static int da9063_i2c_probe(struct i2c_client *i2c)
 static const struct i2c_device_id da9063_i2c_id[] = {
 	{ .name = "da9063", .driver_data = PMIC_TYPE_DA9063 },
 	{ .name = "da9063l", .driver_data = PMIC_TYPE_DA9063L },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da9063_i2c_id);
 
diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
index 1b5d4f0c71fc..10a2ed2acfdd 100644
--- a/drivers/mfd/max77620.c
+++ b/drivers/mfd/max77620.c
@@ -697,7 +697,7 @@ static const struct i2c_device_id max77620_id[] = {
 	{ .name = "max77620", .driver_data = MAX77620 },
 	{ .name = "max20024", .driver_data = MAX20024 },
 	{ .name = "max77663", .driver_data = MAX77663 },
-	{},
+	{ }
 };
 
 static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index 9d588e10f35d..81c95b7fdfb1 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -170,7 +170,7 @@ static const struct of_device_id max77843_dt_match[] = {
 
 static const struct i2c_device_id max77843_id[] = {
 	{ .name = "max77843", .driver_data = TYPE_MAX77843 },
-	{ },
+	{ }
 };
 
 static int max77843_suspend(struct device *dev)
diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index ae66027b5c35..e15370320a50 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -315,7 +315,7 @@ MODULE_DEVICE_TABLE(of, max8907_of_match);
 
 static const struct i2c_device_id max8907_i2c_id[] = {
 	{ .name = "max8907" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max8907_i2c_id);
 
diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
index 96553e5a8279..becb6637d346 100644
--- a/drivers/mfd/rc5t583.c
+++ b/drivers/mfd/rc5t583.c
@@ -281,7 +281,7 @@ static int rc5t583_i2c_probe(struct i2c_client *i2c)
 
 static const struct i2c_device_id rc5t583_i2c_id[] = {
 	{ .name = "rc5t583" },
-	{}
+	{ }
 };
 
 static struct i2c_driver rc5t583_i2c_driver = {
diff --git a/drivers/mfd/rsmu_i2c.c b/drivers/mfd/rsmu_i2c.c
index 435ffe3b0c89..e1c4eec6098d 100644
--- a/drivers/mfd/rsmu_i2c.c
+++ b/drivers/mfd/rsmu_i2c.c
@@ -335,7 +335,7 @@ static const struct i2c_device_id rsmu_i2c_id[] = {
 	{ .name = "82p33811", .driver_data = RSMU_SABRE },
 	{ .name = "8v19n850", .driver_data = RSMU_SL },
 	{ .name = "8v19n851", .driver_data = RSMU_SL },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rsmu_i2c_id);
 
diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index 4be7ea17e2d8..b1f70a6cb027 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -843,7 +843,7 @@ static const struct i2c_device_id si476x_id[] = {
 	{ .name = "si4761", .driver_data = SI476X_CHIP_SI4761 },
 	{ .name = "si4764", .driver_data = SI476X_CHIP_SI4764 },
 	{ .name = "si4768", .driver_data = SI476X_CHIP_SI4768 },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si476x_id);
 
diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index d7814f7bf6bf..ef465da7cf44 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -551,9 +551,9 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tps65910_i2c_id[] = {
-       { .name = "tps65910", .driver_data = TPS65910 },
-       { .name = "tps65911", .driver_data = TPS65911 },
-       { }
+	{ .name = "tps65910", .driver_data = TPS65910 },
+	{ .name = "tps65911", .driver_data = TPS65911 },
+	{ }
 };
 
 static struct i2c_driver tps65910_i2c_driver = {
diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
index 562fef196c34..bcbd2408acad 100644
--- a/drivers/mfd/wm8400-core.c
+++ b/drivers/mfd/wm8400-core.c
@@ -135,8 +135,8 @@ static int wm8400_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8400_i2c_id[] = {
-       { .name = "wm8400" },
-       { }
+	{ .name = "wm8400" },
+	{ }
 };
 
 static struct i2c_driver wm8400_i2c_driver = {
-- 
2.47.3

