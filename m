Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD343F4C0
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509419; cv=none; b=anQuzOdVeDGwSYY4gkUaLx/xTmnXtzKm7bjENntaRf0NQWN9YFT8idX6UAa/ApkQOr0MbbiSizilp0gu+YLlBphWeDz0iBkOFJ4+NO6MJLNuv8Jl26eI/p7DXC4gD0Ed3j4ayEpDUmulw8wQnDBXGT6soFu56hUza+AudpqTwDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509419; c=relaxed/simple;
	bh=ZXEYO677wOR07b+uvWDbRGqEV66DPIkM94r8xzsRegQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0tEUrVL9Gw/r6azl/NW39e6QcNzXD91QfzQKwKJbD8woLsasBXyv8AvgrRApewPRaQBrr0NTu0JWG/xLijZsz/6NtC1QlwsfnTIkjw7V6I0et+7IEcQY0SNqqR2CTu6kBUFz2+7uGlI8Ia3FJgBgRNTxm7+GwGHKI7A5Sjo27c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j5eyvXbR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j5eyvXbR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so479202f8f.1
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509412; x=1784114212; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XenFEC/uSQJl5RVuOXgCknmE+jCvO91XmOgW4Yef5w0=;
        b=j5eyvXbR/EohUtbJnX9Ieqt6TKqvthqMo9MrzPRfQgvvpjXJHGMlahCdC0Fj2y4dRD
         LF3FrGLG7Aq6K6AIEV/3Y42jIDYbJAJBzAXQmw0f/bCrgyJzIjcb1vacI9wXnZNfSgly
         32XYrKaK8eoR3iuMyKd4JH7Z+JnLoMoJ4iPog6cZxbz0zVkB14tlOXj1a8pkGn59m8mp
         novOsFgSENKVupv7ZaV8Jrcf6HjS90U6GDaUoHgI09XyOSTee2VTnjn5NmmnQMHAgwHg
         fnrgFpb2ak+5qC7KLVbNRhO/O/TK12kFM/MnJHOR4wQgNJfuF4bxYQY+pVsxnA3j/Jna
         RUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509412; x=1784114212;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XenFEC/uSQJl5RVuOXgCknmE+jCvO91XmOgW4Yef5w0=;
        b=nmvtqv90HeKzv2/GOqjAI00BR1LbeN/5nKiaerxAM3bBlslxC577N039OhSb1mZn8Y
         I02/EXJHA65sdRl6blku+JuuJoG+8x9MyetCUrNPuVCK7lzyZ+JWmxIgCEkDyVApb5gt
         5mJMN8eRIxWwNX4mGv2V+Q+64GiWz/YRJfzshxMXrlUOSqqgpd+RRnbpMFYg2Y5iptG/
         cjbzBDTacefJdYIquTnLRtqAWUrObrek/wmQjo+0NtjH5ypsWgienk4ABosOtMQWYIdK
         W3DL2UnWx0Sb2NYDEKWtZ820qvMRQ1gWke2ESU+hmes5LDvYVCNqKMAfWOZ8rqU4ncCq
         vuMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rohtz0hqydMxbZGE0iw71rqKZn+RykNpPoB8YIv/OI/g/tuHJc6FDWStXu20qn8MdR4XYU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDsrpgodtdkJ8P1NNHPmUC6tDf1YdwXqxxuwOHGtc1ooqZOVJR
	wJe325Rno/J1tq/vK2URd6FoULUy7AuS/WEIXGtU7hDKx6BLYAT1P7YF5x41XcqItSqeseMpCtU
	OqE3Y
X-Gm-Gg: AfdE7cm3FXZjwOrtUt9B5yqhTnm2gjSER6bHrv97FC5fovo+STEHjt4KVYdZ1vpY4zu
	D9OghiJjBl++P1CRaX4kvb1+ek1ifmql9tAkIsoW/655D1STQ2FPmzImUBQIILm+WDw8PSUWUs6
	1T/IBOG7I7NXqgE1e2vRNoXlF0e0Oy5QdiUpxRvHQo6UsYFeeTR7Baf5P7x8Pq1aQTFDV79iCMv
	MA866/zRTdbUgdwo7pcBZQW2GmXUKEgp3wy6guQSNQTCbzw7iCR/Fnc27EHsNVdD/aPaJY2IAoS
	vrCDevlGX9j/aYkNthTYXnpDVg35UQxOmJw3/7djKZLQmh2i6O2fMW4DN93Vf9IlSku6Ck53T6G
	008FNMVWJoh2/65Cl5BC8uckA+c2ahLLBUEhv6+NV2VrBWfhkFYkYO2FKUWByiK/L78IYuZXjbL
	TOjEehdKZpLepEk/WO0JGzMle2hSh5HiqEhufAJQDDfEIB6FCAVsbb7K10o5aPWsYpA3QP7Mg3z
	ePk
X-Received: by 2002:a05:6000:1ac7:b0:475:f0c2:759f with SMTP id ffacd0b85a97d-47df0797978mr2154701f8f.48.1783509412420;
        Wed, 08 Jul 2026 04:16:52 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d7801sm42699852f8f.16.2026.07.08.04.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:52 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Colin Foster <colin.foster@in-advantage.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/23] mfd: Drop unused assignment of spi_device_id driver data
Date: Wed,  8 Jul 2026 13:15:17 +0200
Message-ID:  <9569d4523b0d87d2249a087e760f3eaba231b4d9.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ZXEYO677wOR07b+uvWDbRGqEV66DPIkM94r8xzsRegQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFWHyXLBVQIVrjWvbTyfzSIgQrWuq6Z+RKTD mzRKVrEaZeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xVgAKCRCPgPtYfRL+ Tu+jB/0ZA4/49jVGlT3mGaTGzs+Pn0gk51WDVhrDYeCbg7XKP2GzplypH04u67jbMhsFKuS7ses jH8k8HVgWMKvXxAjOqi879U5JWgxSPAZTsMy4i+NwhVqdNZKCO2Kg781DE/RHHE7PmK3EcG9EMC 4piIHa+p0RTIptvdsGNza7/JUF2IREJs1tqxqrl7i1YeMcbjKxrOZSeyquaYs00TbAFqWn62Lk5 5mtji0K4mOO7WcKXWout2DzbXYziejgm6iMs2hJYwOtnKAg5cxdqPI9x4PUuc4KKQNzAOgseb1h I8E1Oumv1HeXhOTdUiNq78Ebp+tKDD53GwRA8j50ohvHAUDu
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
spi_device_id to zero without relying on that value. Drop these unused
assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ocelot-spi.c   | 2 +-
 drivers/mfd/rk8xx-spi.c    | 2 +-
 drivers/mfd/tps65912-spi.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/ocelot-spi.c b/drivers/mfd/ocelot-spi.c
index fc30663824bb..3c8260c7f8fb 100644
--- a/drivers/mfd/ocelot-spi.c
+++ b/drivers/mfd/ocelot-spi.c
@@ -270,7 +270,7 @@ static int ocelot_spi_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id ocelot_spi_ids[] = {
-	{ "vsc7512", 0 },
+	{ "vsc7512" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ocelot_spi_ids);
diff --git a/drivers/mfd/rk8xx-spi.c b/drivers/mfd/rk8xx-spi.c
index 3405fb82ff9f..95749a89f092 100644
--- a/drivers/mfd/rk8xx-spi.c
+++ b/drivers/mfd/rk8xx-spi.c
@@ -104,7 +104,7 @@ static const struct of_device_id rk8xx_spi_of_match[] = {
 MODULE_DEVICE_TABLE(of, rk8xx_spi_of_match);
 
 static const struct spi_device_id rk8xx_spi_id_table[] = {
-	{ "rk806", 0 },
+	{ "rk806" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, rk8xx_spi_id_table);
diff --git a/drivers/mfd/tps65912-spi.c b/drivers/mfd/tps65912-spi.c
index 2a77dccd6059..78f9b6015902 100644
--- a/drivers/mfd/tps65912-spi.c
+++ b/drivers/mfd/tps65912-spi.c
@@ -43,7 +43,7 @@ static int tps65912_spi_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id tps65912_spi_id_table[] = {
-	{ "tps65912", 0 },
+	{ "tps65912" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, tps65912_spi_id_table);
-- 
2.55.0.11.g153666a7d9bb

