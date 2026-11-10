Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347803;
	b=Gn4w2xiRkUT58N7m4yiUHQMkTKFdFsq8DMYIIlaCY0RCUzBk+nwvHQE5Gyqba0venMx7
	 JhhvkImO6CIs2QwE3fySDP25lx447xNEo54/rlWGmBsAU426ioM9OHaxwK7G5m50E5aom
	 QevuyU/fp+mWYil9WXYXv/xfGkR6r2K4/9EnbaSQ/yxuaKbqrYvJG2hhaRmTkpvVJUele
	 eZRX73Su6e91PvuGAueXmJgMZIkJTvz8epDX4Rljf0AxuZqdORGdOZ65PgTRLfKA0Jb4O
	 bSU71YPaDZIHqOyu+g62CI7jfbeOnU7O3pnIAZq2DSxq45JX4Y2Ux7oSvup+mrX5CZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=E59CXqBJgHb8JuBP3VbC54ycnN+izEgm9vGp5wS4S/I=;
	b=4L3fdy9MZ4Cg631u8t5D1p6H7DuWI0hpgxu9x6Q08IWDo2P6KIt922w6HZX/2OLVaSlx
	 Gi3f6vZujCzWLjXYgOwWcD8Lfm8o5hhuH3zQktMCjWkZPTHhL0ie60VlXPEUCozJILyAR
	 JMWmpj6C/+4Y+UUP1ATxqqZ6I7u/Zgf9jhBCBjgQKnrcK1leRij+LXT78yRR/KQCjltFu
	 TVuR1kqbcGzikQsx3nFysQTdwaFp2ZMVN7bPaU4HXqcdzQaV++mxIIVFaQHyQTH4RdqJu
	 fKnMcR0xkHPAuozMqSZ3SgCA9OoBYrBqBQxZ741ZW5QPFWWGiNioGeLA+4qaSpW8Npw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kd1vr+VE;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F69606B564
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F69606B564
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kd1vr+VE
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1744761f8f.3
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347801; x=1794952601; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E59CXqBJgHb8JuBP3VbC54ycnN+izEgm9vGp5wS4S/I=;
        b=kd1vr+VEdBZJCq6drNngZzPI+fH98dZzaMgrlnVFdrxILmY9t3lZWlSqd36FCAWCfa
         Za4ORa2O7wsVjjyDoXPFk3ZCMG14HIMpydM28nZkkLgyS58iOCEMQXCxARPzNx58tV0o
         W/hsazkNXOuwLcxkQ+wu82Njg5+uuraesBqOaNdVdiY+syr98erd+kEgAs0fv9xRQzwP
         A1LSm5KqBDfohlYFd0iZD8M72Nc2nnewgY7qjXclSTjmTXAK2QbDZEpjKu8K2xzRfmgc
         B6itMo1UNjiIrnLczi7gMYyNNod+5P2w46JbIHJd/gnxJy12on+CKF7lbpBjVhNpKbWG
         Ul9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347801; x=1794952601;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E59CXqBJgHb8JuBP3VbC54ycnN+izEgm9vGp5wS4S/I=;
        b=u+jDJYx6a8CFgyjYZ3AN/9VsIdArWx5i1JkEsSQLhx7qUn9kiXLs81sGn1CSUW+qaH
         JwQWDzIrTrmq6lcB7NsOYpY0e4a9aCiXR1daFW1zk0OUJUSq2iyLsqhUu/Fiy0qDgusP
         yLXu61z4HiNrWYjWMD4zdBpoLhLTlVwer/deK7z/CyKBVgJGz3rk4hp0AY4Ky1Zsx2KD
         pFi79tu35xDZH8Vsik4IOg5jZm0DOcfBrnrxgc6GI+t3KXUjvhJfVSb6WIhI6tbokvF7
         EzXL3tluEH2Gn3wPxj5h2PlCJcDiFfY8LhXCKD7R3cwWhjVDrgSgP+SsGPuLGVN0OiX7
         KlJw==
X-Forwarded-Encrypted: i=1; AL+hErGueKm/IJwW+js6DnDk+NF1MenksHTBNnHeLeSNs5Dqu06CbR4Nt2NCntcty7tPYBP2uic=@lists.linux.dev
X-Gm-Message-State: APuU4Z8nV6N50mmlmtQClOV5tEK6JCVafHDDmZLgMUqlkt6Xz5NNy7Nx
	mhI5eknIg2kdSniKqTfETGmeK2sFuIMYooqzSp+uXPBPMV4UIsbrpXAvuDR5ngvSZBVzmNHObl1
	wjsHd/mE=
X-Gm-Gg: AYBFou0HN7CYbJYghdQYCIZ8tjKEWATcy0nvBAJlRSnjzRu9RlR2aC4f0AdEEUdHdsJ
	McM8hp6D4a9zb3669+V8My6L0Sz2FZuJs6Enj84pe8aN+tL1iU5xjUFuuF8Dkc1fpljMauds5Wb
	R1icDIPwO3srnNFQgT+BX2Zu4uZV+yiqQ3vu3nqLur2DrAKryWCiIADgyCGQKhGAa4W6jvPjzHa
	Z3vzwr/mOuexRvohy4UVVMqqWaEosMHcCV3zUqGc9lKTjlojVWg6uSwEqxVMnyX1SPV2OdOHEgs
	3b350BfkiczejUBZtZD875n8kgmNb9jJ4NCC159vhj2OiE7vRuURIA4hvu2HIYmOmFBtXum5OB/
	Z9ietxjx7cuR9dJWNqLZlfW48sthcPTlb1scK/gDpCt7nRLuTrkp/KFSY9jb1a+7JGyzamVoPgM
	2YAQMUlb2uKm5AYzRxRTTEbtZIdPg0y5PKbiMoxeVQOwfxgJM13/UrBWTzboGrHrlJn7W+Xm0rE
	QoP/7bUHNvzkS3m15K89tHycTltPVxQr0moa0JCw5YlKEksK+pkC7Pb5rks5w/ELH7Z7gwFMsLU
	fYvR3PG1fH7g/BeaCtrkEGMd9Jz952iVivs=
X-Received: by 2002:a05:6000:4917:b0:490:6e0f:a024 with SMTP id ffacd0b85a97d-499c69ca529mr383503f8f.13.1794347801137;
        Tue, 10 Nov 2026 13:56:41 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4983284c9b1sm6621758f8f.6.2026.11.10.13.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:37 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
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
Subject: [PATCH v4 18/20] mfd: Unify style of i2c_device_id arrays
Date: Tue, 10 Nov 2026 22:54:43 +0100
Message-ID:  <9d0e23458e847372a4ba9a4f582d36f0ff5b0edb.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9688; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=myyBJOjZPFrpOZu3O1FTOXkBTyz0HAOD1yt8lASvMME=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LQLmEJ/EfwuhlpMI5PAWgaYg46BcM2a7xBy Uc5qGX1phaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOS0AAKCRCPgPtYfRL+ Thh5B/96AgcnoILKjfGHz+Ttbq3WuuqTyIoUl0O2oKQ4URsccTHtPLRWDArTmC31psMPoxB+mqj ZcqOSIfuZbV2JuYvf4OFI+GxMSN0bI3KcEeB9AqVmmNOdMTz+c1/BM7duwUtf/ZQKDw+JJqAvu1 sgpHvePMiHwuES4dnG1RniGoMbxqDkxXTqnAmnS8gJCdF+9I/ymeLWOWwuXazvjMffzNu8D7eOs 7TE4XNpQjCtk+McVeaHXmPDaZkiQMkwyr2DYJr/iPslEwmp1J/D0f/PwCaxqg7f3E1Bm72Zadai wIXzc8+bn1lZEmO2bfBQ6m2qJENGLl5m0NxRLoew5xaMd58Z
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

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
index 0e5c6b20943f..0f209084e8d3 100644
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
index 1b201ad129c2..d3c24a7a3936 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -1233,7 +1233,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(pm860x_pm_ops, pm860x_suspend, pm860x_resume);
 
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
index eb03b813d58f..6d2fa63e7f4b 100644
--- a/drivers/mfd/as3711.c
+++ b/drivers/mfd/as3711.c
@@ -193,7 +193,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
 
 static const struct i2c_device_id as3711_i2c_id[] = {
 	{ .name = "as3711" },
-	{}
+	{ }
 };
 
 static struct i2c_driver as3711_i2c_driver = {
diff --git a/drivers/mfd/as3722.c b/drivers/mfd/as3722.c
index 2f58709ffd9a..ec7be5fb326e 100644
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
index 5310337fe9d4..48c5b132de2f 100644
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
index 6043eb6639b5..b61b0484644d 100644
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
index 64c7ea0b5d2b..4491aba8f835 100644
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
index b75cfe805d5e..6af9552ccba1 100644
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
index b57a6ee90aa9..068f080d1f9b 100644
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
index a66ca73997f5..e4d7cb4afef0 100644
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
index d3224cf5e3f6..238584e703b8 100644
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
index 70ffc08a96d1..6e2fed7021a8 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -301,7 +301,7 @@ MODULE_DEVICE_TABLE(of, max8907_of_match);
 
 static const struct i2c_device_id max8907_i2c_id[] = {
 	{ .name = "max8907" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max8907_i2c_id);
 
diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
index 4ad761fbfab2..acb42868be37 100644
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
index d05aaf576a86..c03db3ce5f12 100644
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
index 549f64255eef..aa2619e41484 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -841,7 +841,7 @@ static const struct i2c_device_id si476x_id[] = {
 	{ .name = "si4761", .driver_data = SI476X_CHIP_SI4761 },
 	{ .name = "si4764", .driver_data = SI476X_CHIP_SI4764 },
 	{ .name = "si4768", .driver_data = SI476X_CHIP_SI4768 },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si476x_id);
 
diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index b0dbee3e6ea2..d19bd3643591 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -532,9 +532,9 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
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
index 1c0ba450ef9b..d3180aa44e1a 100644
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
2.56.0.rc1

