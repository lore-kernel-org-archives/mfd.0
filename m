Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D526C435EDC
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616431; cv=none; b=fUkiAPU+irigYS24go6jJxUr/krQ5Ny2HWVS1z3J9BddY8SQaizQr9b/jLxZ/PvdTtwN7E+HSaGzixg5lb60XuOm5aBYcW1gEF6+kfr/YQe0bF8S0tucNWj5E8SzKh3Lt4Zws/ZdMDcGWvWCop+gEyDSqPMwNcTJqoVB2JD5PuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616431; c=relaxed/simple;
	bh=Yocslbbh2Ly5jl9ltyhoSfTRYYTxd9v0B/P+M4FNVM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DoIGtZb8Ug2SaMOCeR7LfJMS57QI2IgmCdMBPSUubfCECcNYt0xvv/mRo7nAI0iIWGWP9kM7eFZiZJdIQPW7uNAm8jP5NPlGmUxmB06U7yAowtK9RxFrVyEiyfIYRf+Q+UiRU/6+tKLRyIWqlDyBWuw6WKJkMj7CPwwwmi65yPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GhwMX81N; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GhwMX81N"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c83474ddso195235e9.3
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616428; x=1784221228; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=GhwMX81NaDs/vH+e0sIRf74Ekt9ke2AOLRXriqrrqwabMtnvdomDpNUCfjIoPT7mi6
         B8qvpj6mFeNaSZmWWMBAawLBoUdZEEsaHapYGabfkmxlAmls46LUwg6ngM/WdMybkB+B
         0G6UES8nJpxcqhbPhxFWnp+UMQZw0Z6MGKEw4bdQ8/kV9JK/mqYrtcYtnHgN+RCmv/h+
         FDF+kKM7cKkVeqpRGBtQGUaInTkAv0KogkT1Kl59GwhYaWWIO2nLNGeAQ8xtQl9avQCh
         /E471thShgom/8kZ5tJmguWoQWAB7wn7hIcauhjtPbPKT4CAeCinT3c13hqqT+KisNfa
         LYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616428; x=1784221228;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=aUXSmAxicEsF5qAWzJOujwareZ5Qa7UtiyYme50DXkdvGvG2Zlv324uyAF7hrKWSAz
         BpPm+H/iV23NNdzQQntvPZiYN4m4Hv+YIpqriJPruIaMS74F9yScFqELFT6rGoDrsp8+
         /xShKiHwLRg0+OKHfPK3U1UQ+xzbz6Rhyk/xNRi3ey7dqlBCTGFh49ZTVa3tj7Ftm4A/
         jtnHxQn+stGPukCu5Nve6EtAACk1kmv+QckW+SdDvpO6yuxSgJXltxR0DgVYfWxee8t+
         w1C63t3hXMn217OU6N/jwXGTo4AVjb7iTAZKwMyIX9lhpmPUGZszW2vd6KFC3FZwPdi2
         Dhwg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6ktCTSPrMk58fxZp5KkfQhi6WQaVXd9q73dquMlKIeR2P9WLuxZIQQ5bwX7lgpo4wvsM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqgNlixMaSUmguCbQZfjs8hWRXwfwGELtzpYXQydO8/GiPgWpe
	Cw7et+vmmNK7lLnAu3SQihK88tmhc7CB9AlqNsgQNqkk+dIR/5oGFUj9Tc5l7POZBQY=
X-Gm-Gg: AfdE7clED+eJDGup1/g0mBGQdhRZE1DsoCiIeCQUPRdi5ud6JzEcMxgzwehkm345dZ9
	60nI8FqCdW0AI6mZDbnkdS2tP1b8+GGSmvFZsCZM1hbC1M/ZPe2yoALf4AtZpSci0B5/unB+dJp
	ZtIy8stvSo/wwhhNzpmx9sqwDzZ+tHwsEpe4Q7PdgwYXy8VP9RdpC0Vmy3ZuyzhW3CJiEbAC6X9
	9161hFbWoPShkBaUyKNrriB2ki/cRnU3o4LvuFnxg0vk+oUyhgZcyuViDWu+nkTTzOlx5w5WzSW
	0LSCmHzudIlmOTlDKxV7CGfhFMXCS0p1NrsbG2fbahJ3mJXHkErYDnkxVoWDQzHgRK8AKKDCOu7
	tjIbUg5kXmjqCfBA2Z82RzO+eTLNKOPi8o5wNlXdkoP9YQ300jr9wYE+Pa5J06vJe9FzwJe8ePF
	susaBOnt68R4i8m36H1czLjMpHT1WW5HsXq6RgfK3+T2XVqgxTSy2OOXz+fkdXMo9aoc1JD0Qs8
	OaK
X-Received: by 2002:a05:600c:3b28:b0:493:bb2e:11a5 with SMTP id 5b1f17b1804b1-493e68c689bmr85633925e9.15.1783616428141;
        Thu, 09 Jul 2026 10:00:28 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f2a2e499sm2548325e9.0.2026.07.09.10.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 16/23] mfd: Use named initializers for platform_device_id array
Date: Thu,  9 Jul 2026 18:58:35 +0200
Message-ID:  <c7390ea19a88cbfe80e86b7ff308664a2eec27a2.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Yocslbbh2Ly5jl9ltyhoSfTRYYTxd9v0B/P+M4FNVM8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiz/y5FP8p6Y/xAWruic5Prv2/Jq9oNxS7qtlldzHWtpr jLl3GHSyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBE7tSy/xW/zaVm6TOH4X4O a7V8Fvd/6ULDU0ZMRy+ziwQkJov8+f3ocouBw6b3OSdvsiW8fJ+5Xzlq47cuobVF/yXWv5dIvGy o2fddfJPewfAH9wtKMx1NjBVqH/r/nHnQJe3z+cA7HNLSCt9fnolg8/v4g/m6+aJOrbm7TF696Z y168zJM2t71JKX/k9mtDpeOCXKI9XN469wQLGacbWs1OVfYnxMZ05eWVSccM7uSRyLiLT7rCuN3 lLZe64yXq2RaGJO2sRS+/jllddvXWeIiVV8P628uTbrvGoXk96PpEqzfD/rFvWZMsEPzh6Vr73H wCRfd6X6XUXt9q99NtcqJhnNm2v9JtlbadUBsdsh7NvNAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Also drop a tailing comma after a list terminator to match the common
style for these device-id arrays.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index f0bc0b5a6f4a..7c00c71ca4ba 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1250,10 +1250,10 @@ static int ab8500_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ab8500_id[] = {
-	{ "ab8500-core", AB8500_VERSION_AB8500 },
-	{ "ab8505-core", AB8500_VERSION_AB8505 },
-	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
-	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
+	{ .name = "ab8500-core", .driver_data = AB8500_VERSION_AB8500 },
+	{ .name = "ab8505-core", .driver_data = AB8500_VERSION_AB8505 },
+	{ .name = "ab9540-i2c", .driver_data = AB8500_VERSION_AB9540 },
+	{ .name = "ab8540-i2c", .driver_data = AB8500_VERSION_AB8540 },
 	{ }
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index a933cb936da6..baa6487abf9e 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7987583afc60..7bbd9b730b75 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,8 +429,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.55.0.11.g153666a7d9bb

