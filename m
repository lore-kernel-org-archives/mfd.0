Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EA91A9FBA
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509443; cv=none; b=BRVvuH9r7P4EDFMma9p5aQIoHp4wtV8NHZ1i49tHeIMwbzNyfhd+EE5mKjtRxoslNvutn2V6Apqm+5koQ1ZMxsaN6gbUE3WipoYKBIVCVarnEEVeRIk/TvewqdI/jAeIZyeFCKCoJDwIvbXbHoBPaScNHzHyjhaxJUM53S2WWho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509443; c=relaxed/simple;
	bh=AUH0QEL8dJYUHkKEyP1+Wnxmr6TzUPNptUL9kgsC+mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YdAEJ8dR9qCsCP168jJ/hx2sd0yUTiK341ArEApKgUHgIGq7SGM2TZnDvhfi2YW0OT5EWO5gU3Dy1RHkLOLS/rGxGJZIUylAv4Ts2ZxXo4K+egdz9pnwPxt87V8Ga8VqeSWfyjbyHE8KX91OJznunQzfCSjxc8T22pJ/uqGcfwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Bk+6JIi3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Bk+6JIi3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so3524535e9.0
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509437; x=1784114237; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VS/xmPf3JVe5KLxw0JrGYq5kvVh31xyr4Kg5yxM4aT8=;
        b=Bk+6JIi3pRffu4zQQz+9yqY26oMTqeXrcz5CMtVzc/ks7wNfkeRtzPpj6p3k9G975S
         6w43yVS2n3dsQC79nsxKvw4TKJlNl67N5Th1Ft3c2fJIQsjQgMiWIPSjtd29icxbiguO
         ZqtagP1dQ4qYulIV5LnC3DaiN7y3SRWJ9Q2dN4eB/vuGkB8A3SNLnRfFEznkyuaz3p4l
         4yvrev49Kinbzqiw72XtijLZ2WBkhtn3PAQ6sdkm3MgDy4iipXyj/koOSW6U6tln5SXw
         GRVGjllUsGW4ghbki2iLv4KMFhwEKsk0/7usl4DavoJON3EBTCsugMWDaIgig9D5ucNW
         9bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509437; x=1784114237;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VS/xmPf3JVe5KLxw0JrGYq5kvVh31xyr4Kg5yxM4aT8=;
        b=UFFJaeGNJ/ZXpayNuDx9BE+inbSvQOasTO3hWMYqXgCBfK3m4OvycCjDLCMvxZxqV0
         96G4c5Nbs9SSMYygpcn4K1Q82B9nnTfENHGt+QdGhQJ6s2lfVn12xlXE6mlP1pIGuMWD
         YkXYiQ39Mi2iIE1x88GfhW9WqCqOsUUtX+7kTjswxO8C1/uuGwWvwGiqXgzftrRduWwF
         u0P61qZqgDy2hg/fikOG/wY6HM9CSXul6nPI0kD94wwPwsw4Png3KIE4o/enYBFzVVU9
         MhvAbV6djaNhpdCDMHIlzOaxTzF2CFpU774O04bP/+PtFS+WAVlKXnTqCrgnukyU2w7+
         BEZw==
X-Forwarded-Encrypted: i=1; AHgh+RqD+OJ4EemJj0Y5oj9/Qx5aHSkk3wi+L7HmweKPhYVK4ymLqwCYADbjuNJUSNYrHjVdzRc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXs8y2u1XoOpjU9uVhhczZm96NN8JbQ/s7fyWJ+ltApLHLvdA2
	KkMmZS986D63Dr2Vj7+vOZ0t6yBTGAHFetYTEduvkakDXE9VkLpSgbo4JscQYYivGAc=
X-Gm-Gg: AfdE7clcXEDY4ATmQIFtUrGDrlRjVsdEesizj5NGHNGhEZ3cOhXSwczw8w7UDwl6Dr1
	nVjEp4KAoBATE4WfRM7TMzVTi3/gJ80EFp3NinlWt+WzLUVGgDk8EaMbV24hmjLFFhsXNQwZHvo
	8YnxRl+8OpiVDIbRPmQ5M2DoTYFUdkXrVeEEYamxRHOeA0g/d5RDmaGBN8i0twUY2X6KEgq8D+w
	4uaLDDcvVv5HR02ILykNCSlFxE7eioNEWDfJStVFto0jPh0CdhH3dEWOz2Dmsn9/zt/rTcQKVHY
	7Tg+gDsJs0U33/U2IoSJjYK8JWqLycp2P6MiPkJFPT6bX+XJbZh2zCNllwZctLXtxUe+q4r7USR
	/tuPfsxpEYWSDk1bonUwxDjMj6esRusUzqQAMOPHQy1XxwH6mhuIP/+9SjIlkvcezmgPqis3+/a
	07ZlXUstcpCE/p4B2JU954UAZlZEx7bDdiEUHiYC1nOt7hQ0OKNecCeoAKLPGjdcjHVmwenoYf4
	kCw
X-Received: by 2002:a05:600c:e54a:20b0:493:bf88:edbe with SMTP id 5b1f17b1804b1-493e68df961mr13540905e9.19.1783509437649;
        Wed, 08 Jul 2026 04:17:17 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039b0cesm42042425f8f.22.2026.07.08.04.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH v2 23/23] mfd: Unify style of spi_device_id arrays
Date: Wed,  8 Jul 2026 13:15:30 +0200
Message-ID:  <13f1c0ae1697c6e3a342250e25fabdbf1499d642.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4606; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=AUH0QEL8dJYUHkKEyP1+Wnxmr6TzUPNptUL9kgsC+mI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjGMTjh3m3lcDCxC0y4ZIhqpOh7zHGwBvs3DY LCfJjNA+b+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xjAAKCRCPgPtYfRL+ TvwcB/0V9JbnAT2bSNI2eEfjYVmEsc8s4TNstUfRkoxykJLa7jFSHQmS/mhstC5s9lbLyoFE7cx lmMBG7pRcA0mSS/KdlmiJ7/0m11s+eKEPVYr3SB1Zryy1JPrRi7A6hLWFfK5Y3hdBH5YUGMnpHg jmgdWrQyK75Ox5pYy5AXa8oZmH/Q4xa7Zt8/b59C+jm3rl3NvNcdYCX0Iat4PiSob5LnmafLfmy sgFCfU/auuPKB0oAdzs71xB7J94dMAdN1GA14RdUFiEnCHx98vuYVGdIMIjR4rHZNNksg+/o7DY DTROggwDLfWVYRe5DHAmY8PUN0VpKmtXJ2VSaXG+MLSYs/td
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

Adapt the offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/altera-a10sr.c    | 2 +-
 drivers/mfd/arizona-spi.c     | 2 +-
 drivers/mfd/cs40l50-spi.c     | 2 +-
 drivers/mfd/da9052-spi.c      | 2 +-
 drivers/mfd/motorola-cpcap.c  | 6 +++---
 drivers/mfd/rsmu_spi.c        | 2 +-
 drivers/mfd/sprd-sc27xx-spi.c | 2 +-
 drivers/mfd/wm831x-spi.c      | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/altera-a10sr.c b/drivers/mfd/altera-a10sr.c
index 260e590b87b1..6ce20c764e30 100644
--- a/drivers/mfd/altera-a10sr.c
+++ b/drivers/mfd/altera-a10sr.c
@@ -155,7 +155,7 @@ MODULE_DEVICE_TABLE(of, altr_a10sr_spi_of_match);
 
 static const struct spi_device_id altr_a10sr_spi_ids[] = {
 	{ .name = "a10sr" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, altr_a10sr_spi_ids);
 
diff --git a/drivers/mfd/arizona-spi.c b/drivers/mfd/arizona-spi.c
index c4ee5b499fce..c02b291574a6 100644
--- a/drivers/mfd/arizona-spi.c
+++ b/drivers/mfd/arizona-spi.c
@@ -260,7 +260,7 @@ static const struct spi_device_id arizona_spi_ids[] = {
 	{ .name = "wm8280", .driver_data = WM8280 },
 	{ .name = "wm1831", .driver_data = WM1831 },
 	{ .name = "cs47l24", .driver_data = CS47L24 },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, arizona_spi_ids);
 
diff --git a/drivers/mfd/cs40l50-spi.c b/drivers/mfd/cs40l50-spi.c
index c273bc98e7f8..902a6c324d83 100644
--- a/drivers/mfd/cs40l50-spi.c
+++ b/drivers/mfd/cs40l50-spi.c
@@ -41,7 +41,7 @@ static void cs40l50_spi_remove(struct spi_device *spi)
 
 static const struct spi_device_id cs40l50_id_spi[] = {
 	{ .name = "cs40l50" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, cs40l50_id_spi);
 
diff --git a/drivers/mfd/da9052-spi.c b/drivers/mfd/da9052-spi.c
index 2a08481432e3..29cf2c17fde1 100644
--- a/drivers/mfd/da9052-spi.c
+++ b/drivers/mfd/da9052-spi.c
@@ -68,7 +68,7 @@ static const struct spi_device_id da9052_spi_id[] = {
 	{ .name = "da9053-ba", .driver_data = DA9053_BA },
 	{ .name = "da9053-bb", .driver_data = DA9053_BB },
 	{ .name = "da9053-bc", .driver_data = DA9053_BC },
-	{}
+	{ }
 };
 
 static struct spi_driver da9052_spi_driver = {
diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index eab96299bc72..3d7aa4b0895f 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -202,9 +202,9 @@ static const struct of_device_id cpcap_of_match[] = {
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
 
 static const struct spi_device_id cpcap_spi_ids[] = {
-	{ .name = "cpcap", },
-	{ .name = "6556002", },
-	{},
+	{ .name = "cpcap" },
+	{ .name = "6556002" },
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
 
diff --git a/drivers/mfd/rsmu_spi.c b/drivers/mfd/rsmu_spi.c
index 8b2e7cb401b5..3fc1135c24be 100644
--- a/drivers/mfd/rsmu_spi.c
+++ b/drivers/mfd/rsmu_spi.c
@@ -244,7 +244,7 @@ static const struct spi_device_id rsmu_spi_id[] = {
 	{ .name = "8a34002",  .driver_data = RSMU_CM },
 	{ .name = "82p33810", .driver_data = RSMU_SABRE },
 	{ .name = "82p33811", .driver_data = RSMU_SABRE },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, rsmu_spi_id);
 
diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index 11d4aed1d43f..3d7d896e11df 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -294,7 +294,7 @@ MODULE_DEVICE_TABLE(of, sprd_pmic_match);
 static const struct spi_device_id sprd_pmic_spi_ids[] = {
 	{ .name = "sc2730", .driver_data = PMIC_TYPE_SC2730 },
 	{ .name = "sc2731", .driver_data = PMIC_TYPE_SC2731 },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(spi, sprd_pmic_spi_ids);
 
diff --git a/drivers/mfd/wm831x-spi.c b/drivers/mfd/wm831x-spi.c
index 4cdb6e0734c4..1e519fd9a9e1 100644
--- a/drivers/mfd/wm831x-spi.c
+++ b/drivers/mfd/wm831x-spi.c
@@ -84,7 +84,7 @@ static const struct spi_device_id wm831x_spi_ids[] = {
 	{ .name = "wm8321", .driver_data = WM8321 },
 	{ .name = "wm8325", .driver_data = WM8325 },
 	{ .name = "wm8326", .driver_data = WM8326 },
-	{ },
+	{ }
 };
 
 static struct spi_driver wm831x_spi_driver = {
-- 
2.55.0.11.g153666a7d9bb

