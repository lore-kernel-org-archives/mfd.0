Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B5939E6C6
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616419; cv=none; b=C9k/uq2lmgL1W4T4Soi71QZ1cPJVu35doPqKEj+dMyKoHASjmok7ltplELeDro7RPpZXL5RG7NIO8k4hM0Yi/lKKA95VUtrVcSxA+U/vJcgZbYyBY5MAPqsw6hadpm9kPvut4YBrEp1g2Q4VXFSCkuDw6UKkEnel35pvnaeIrQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616419; c=relaxed/simple;
	bh=ZXEYO677wOR07b+uvWDbRGqEV66DPIkM94r8xzsRegQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ffj2PDDShaQWNc1GJcOCrAOuXMqltwA5rJWoYbcW4Q6Jr+4AuaBYBZHxkm5X15Xj8L8yN3fURmQBPqwPP562iZ4uyuvt+e12VXQs76y87TrDIhDAyf6kUvTHkmSkCR/Iaw3yHUZVZlQBSVCXoHJSog6d5MQc+QPdSpvieX5duao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZLoH/dho; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZLoH/dho"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bab44440so482805e9.0
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616416; x=1784221216; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XenFEC/uSQJl5RVuOXgCknmE+jCvO91XmOgW4Yef5w0=;
        b=ZLoH/dhoKHwCPA/frcqOSq70fLFyA0vXa4crdwWcAsmVa9K3T8azS5dS6gmG898KfZ
         I1jkiclbgJEo06pSLpBT6Ag8mx9uxuxj2eoGNlKmUFGf702TSabjPHVyc0/GKH7h6eDX
         9V6vnxHOpCmxMGlVseDRZOmMLjnEBTMGU4LTXo4mWupmh3VqsI+7/Nb0kg6xZ6Zp/6PB
         38FQtSBy1Zt6Rzx2INYsdAOnyzGutJDs1c9AqFXLt3AyeSzNSaPEitkHupHG8/wQEpao
         bxmJkbgodpI2ShaeRF/gn5WS3+XpCbIEZXLQoFWqbsO+TPlnXG0IJ9d1OjByI3cJwVQC
         APnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616416; x=1784221216;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XenFEC/uSQJl5RVuOXgCknmE+jCvO91XmOgW4Yef5w0=;
        b=lbb/b+5ISE26zot3Yd81tew9X9dnKTg+tpBElq8pJ4p4I6GslMfa2cTAJj8Q7qr/b0
         wVGLe02AqTkff9kghN8AccawhXKtDoK56+D22DvFtX0l8z+NOh576dRqGJjXX3oZRRWQ
         TIKjwrtcAoG07KNvn3j4+2hhTB+sNrsyySy5FQwxFXV/zTttIkVwbTrusuAQO/4l2dFB
         kMj1dwqMQOtUiMWdxoymK6hwltL32sJOFK3nlDDeYy/ag/fukLYVPlThGHNwvUs0beGQ
         ZtbaXoTwJz+5XGnFpsdkXWal4ZmBNLplBPDaN27XcQHa/yTPNeMu3RkdL1/odH0J6lVd
         qwBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwL0YmaDeo5fa62Q8JyZTFc+CmM5Qe18W4nRN2cEUFprP5lloJPL8+WKoVHXTRVENrRs0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiUyc3sP+p2SpDLSJX3OZGNnEjHf7ReDHeQIyIfkngrRFmpIDs
	Y0MSEj4QsJSXvaNqNeKDNxPxG/H0NENRwHy9RnBGsU8K4fxYMUhVbAeZB7uNsX5K0gQ=
X-Gm-Gg: AfdE7cm5Ze1cJ8/E1LfwxVAGzl4Jt4NzMJHv6bMOvv7eiRjPhxCA2ssLNOh3HW2BGBb
	SYSlR4G6NijE70c3OxtHde2dL5BlG/4ib3ISNrBSikcr2J8ZPANh6PrLdQsIopnjyLm1eQWSNkL
	ahLmYwqqSwhpRE1CqXHC5MGcdoE5P8epQ3WKe5Z5VInapDS01dFOnYbVX9bp/sDthYJHwl3s90B
	zdW2oJBsseuaDDrwqZxZ6Iyi9AkdHQLCqe4j7bLIUSwFYn2aDIbMGml19hx6UCfxWk0D+euQ8yV
	Xn6t7+0Zi7GLZdStcuED17RlckYtkqd+MoXHgG8SLARyqDIr5BmsNA1DK1xqawby9HfFoJoSpmg
	GgmEOa8s0RRj1e8TlTkOTdNe4/XrD/a5YOunm40+zfJ8z2LNc9MQkMo+okCTY6bPrPYWxAnQ/ix
	K2enppjmrRDNofT4s/fcVm0wdLb5PlS3H+KRGQnj/gjLCPJCcYlYJp7BEQulGZPg==
X-Received: by 2002:a05:600d:6447:10b0:493:c991:8e56 with SMTP id 5b1f17b1804b1-493f2b24cfbmr120485e9.4.1783616415989;
        Thu, 09 Jul 2026 10:00:15 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6f2e56sm91096525e9.13.2026.07.09.10.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Colin Foster <colin.foster@in-advantage.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/23] mfd: Drop unused assignment of spi_device_id driver data
Date: Thu,  9 Jul 2026 18:58:29 +0200
Message-ID:  <0f1fd857e1b34e69f83fbc784b10d2dc608b2494.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ZXEYO677wOR07b+uvWDbRGqEV66DPIkM94r8xzsRegQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NJJyDMZaigKaLRYvbZsS0S50oE7DUZWHMzQ gCdcgBZP1CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TSQAKCRCPgPtYfRL+ TlqrB/9FksOhP6nTkmnH8USfuUkKpnOLgQKNM2kVpJdU42ik0CdtlHzYwuEq/EIblADJmcfXJ1a 4i+cAhh6Lt4jx79F6gLpTrA7dLfeGvwEKrcxE8qmQ92y2DE+G7W6SP0q4r/Js519mvIqUhH1F8L rBxybLy1FTPSuZpAxR5dn+VTXhiIkJkO9PS4TbZCmxN2HxcZ2j0vcQzpj1D5tbNdYiFQduI7Gxv Al49wygWP6IHkrSONz5ZLcG5gtChF6JIXck5AllqNGxEscr9Dy0duhZbX5BPg1qpWwABxOJNW9v 0UksZA+Z/ZfIhXRwdZKNJyrkjAObsbkz+ZdpsrEwhSaEkgtF
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

