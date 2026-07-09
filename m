Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F93E3C76
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616445; cv=none; b=pPXx201jpWS/dx+ALlYvbnRDRfnmbxLwdxUcAPfFLCqk6j3uu/8D+dchB09TBuQMqAnHL2xH5wFtMUn7N64GGEDYNNKN+s4qPa7lcB48nItiO5ot4p/lkoyr/Yl6xwUyoCGljRN5opLxa7KenHae1BwLfKYkqc9WMx0I1kTR3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616445; c=relaxed/simple;
	bh=hktNwOqteYxissnbcCpZ7HVwvlamp1+/cyg/Q3UlFkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JQW7BnNWLwX2uXH13lYJpbmumVkRbBzLPXWGmEJq3CDq0Nj1KcPQjNGjJf/Tc0OiRxPRUMQk5TFSghiZz5SNiCjtcMaoYFtl7kWZf0rW7eIA/QDsxJHUqTw83RNvxD/9wJId/tz7wI/I44tFFrKpQQ9gtzGr2rZKNOv0ytoSuzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BT2Ln42+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BT2Ln42+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso53726f8f.3
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616442; x=1784221242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CRl/6KGSRn3vEPALCdFhY9b/PHsNbLau1BjyMf0gUs4=;
        b=BT2Ln42+p972JAsg4mdduV3Ii4XWXY51SKZ1dMIj7W/vduHVP5THYMYKJWokkkJ9VB
         eGXwCEzdZ2mDfgk+f3FJcgsYthn9EymAFy5iKw0zcljMShVPoG7qSVzgaiYlzHnBI2OO
         rrGS8d6hPxubgY9NoQmKOw+1OyU8OFRusRAo7JxthlWYpAwYMGL08ybJorRxXMr0lYPk
         1xHWCQMrwLwhxmjqS5kjF/yHyo0bjLvf91p9cP+AsJjZxbHS8re/EgDPlWPhUIQdLclD
         u0CCtRh2oLfhWlhi7wmn/SGfIDSrBD22eWFVgQnEYHlWyEakL9FAHHFhUdPVzd/B1qIv
         qSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616442; x=1784221242;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRl/6KGSRn3vEPALCdFhY9b/PHsNbLau1BjyMf0gUs4=;
        b=qfR3kjFIjuFcj0t18qTVDnxLYelMiR1WDlFrntbDzXxYUr456yu4YnVWIybaJCa1xC
         FpPiFV6EhqsXVTDg8jMQBgwDrTiH/6IxdMtaZqM66ASr3xsGJuenOX/T9yVUmafO7QbR
         ONefBpYjMMV+sSyD/pt7QmzY3X674eEPosM0KDPm/KuCV2RFoaCABomgNl8+l74rNtHL
         0FW7rFUEUsR9lWnHgPsjb/lEfdJjB4sXdJJN3BwXjPX4nDm6s0PjtIwNDLRx7LAWg4Fs
         Clx9TQKxwQVcpPRfSPA7J9VqtXT8vrGD3c6MnUny4D38+muCBFGAUXRE9bDrnv/gWEsu
         Ufyw==
X-Forwarded-Encrypted: i=1; AHgh+RoqGrMEp3WJ4clenlFxGSxL3SA5lMn+z1AWTLEttTRzwLqFHOKH/t3dRBuMz0fespWs7I0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFxWAJxRJ5BVzUDE72CQL9hfYcsG0DcIIaJkanXTPiEhzfOBkn
	vc7xusa9tsPyspDx5YAPEYNse86G/m7YBB9LiOEswxqHZaDXK1hp8DOzZIGcBnGEpVY=
X-Gm-Gg: AfdE7cmNfl392+QjXlL4XMmcFy8uLX2jwdUtif96EbOpg4bFbBVMbWnZ5TxfKJWMp0n
	rPpGn9+9G4enVFViQkqfzLswPAOKKItCa4OguniHXGjKrnvxdVkw/CG8L7kwBWM4Pzv+i8rqWFj
	sk75hSxlerEAFha6JszEfb5w2FbWiYTW8DD+MpGa4bCKtaBNk/5C5BoNZOb/Q/0M+Ec40a/2a3C
	ZnEKe4Y4Kc6k/B4HBiqrfAsRS1SsU0PS2UqEvaOvU4UF+aWhOy8zpBRQHIJrttQSix2b8Ku0lYQ
	7HZHMHc8lRno0jqKcNx9rjxIPIwGuRpHdKlEHZNu03/0BkL3zp2n/8JNRrdt+akVAAN5HSRIogX
	Q1sadcVLvhvIgi+ZnIJhqFh1TXmDYjVNNP7cDzZEJRd8JLYNb5IsP+90KlZI+FUvy0gjCtIi+fv
	PJVilqfjFKDnR7W7iQfekumBlahUun+gb+BGOqoPONZRJx7BRSNafxTPAcyauAab159uWuN+J6z
	fug
X-Received: by 2002:a05:6000:3104:b0:471:f180:86d7 with SMTP id ffacd0b85a97d-47df077a91dmr8658740f8f.41.1783616441650;
        Thu, 09 Jul 2026 10:00:41 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d91bsm57690092f8f.4.2026.07.09.10.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:41 -0700 (PDT)
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
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v3 23/23] mfd: Unify style of spi_device_id arrays
Date: Thu,  9 Jul 2026 18:58:42 +0200
Message-ID:  <a57cb7bbbb1199f8a80b73ee65c607f2c05c4ecc.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4667; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=hktNwOqteYxissnbcCpZ7HVwvlamp1+/cyg/Q3UlFkk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NvfHTfC22V/u0gxgA0r9ewgW/BbCheNEz7I JtUSkWOoA6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TbwAKCRCPgPtYfRL+ TjshCACMqh6nTYgVCakvGK2PsMBnr8tJ8r3uUOduTtcn08vDEVVxXJAZxZol3h/KTcV30EvF5df jOvTBLvlxZr0bY609AhEqXI3liuJfnXdiYXTx6rz7pAS+QHqgzPNr6ETv+0yLrNhTYQF+ynRlKL 4VeajmGNlU4FqhT2XKVHVA3gR57q1bSDkJCyVlOwKYhLjg4G6vQrDbkIvmclsphjiFrwjzUAf+y d1P5xeA3o5d+5OSAcMPg2NNBDVwfleQE9VHFGoyQfmurFnqs+6JmphDhLpn99yNzuck0+tVFgEv eNkddNqlCGtsXMi8HfHwZnTIBDjHdp1xcqnyjKK3Xnhn/BSf
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

