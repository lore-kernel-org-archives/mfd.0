Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347789;
	b=5PlcicPpu8SbKAdZK4iOMR0z4R9PVlynfaPesV3X4HpqfDRNdjmtuMGLJBn7uYv29904
	 JhUzZesn0//DroUa9NtCTHHN2BuYio/5+Z2TRTY0kfAe8RC6xI8t7WZfkItu1/dj+ewob
	 XoLG/4FxKXgKrwwJ230z88LCKdDszbKaOEh4NUbdxjEsTdwiop7fjK+AjB+tEZjuPTvOb
	 joCA/gsDsEoVxPXr9LUqMFGnE5PhFjY+Bi82qp81DwZijem0F1aWWWdrXHdxGrz9pvq1L
	 DkKDrXxp47oqAlmZCNA5AqRfoE8M8R2PlvMclKwndzUubvsMhWNeoarbXI/UkcCtWGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
	b=qqhpTSMEUEhYiu950VQ4JmVeDnb2OeNeC7msZt6B9U6Okp/jpgYDBtxJn+OsPc2eDb64
	 M9n85p265WE/LoWktdGt/Bn0kAD7sjNh53qPnDDxE2F7s0psF6RIrNPikqyjjBI3l2JS8
	 KTsnLOvrhM3beJ2hXMpV9/YHt6WlU/GCH6/wBubKU5Kwu200nawvZJUq8H4jbUqFs9XeV
	 BfJXUmz9HYogCVivDcAHA1u/QPGMooflWtpUWTjLf++KmcQFhFnOu75J86njCjc0+ZbCu
	 Bx/gv/Z6eRcA7UYFG87p/Ujxd5wnhD+hp+Fu0r+zf1xovQpEduwvq3LNCHvI9qyONqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I5VTBGVm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2401606C984
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2401606C984
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I5VTBGVm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so19098605e9.2
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347787; x=1794952587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
        b=I5VTBGVmwxVemQ5e9FTEmZqZvlnK6MAXrPOfW6GXu3jfjvhZmef0j9VTZI+PveEq9D
         S9DZsN7XsB8tQh4ACYPMdtsdvy7PlVP5F0uk+C+gN9mOOwQXBPIyzSB+3R3dGlVkgOxX
         PwH2i3H8ol0fe6otrww0hBcNbfeAcB1qpRTkgkXWLITssZU9YiJKS061nE8/Ec44hH/h
         Wj/MNLkvNXn0pTwXsEIdI06RjAiBMuSHmZpQqJO8UiG8/vxxIwIqfccJiqc+NPyuPvtw
         EaU2lfrBCcAyRe/0ZvNkxaR6+eLdqTGGIORXxgp/sgP7P8RU35FIvpd+sCtqCKwwiWpJ
         n0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347787; x=1794952587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
        b=H88g0zDqh/TTnQhoK93+oviiHu+EsqPO3nJdCYpV/29FVNM8AMygpRwAHv5xOdJ3DD
         gWSKn9eS4dG0Hb22ryQvvUA6b6wEdYCzehe3oYuCO1BkuT9veHdY2oe1CrbzR+2EBLF5
         D/xvYpeD4ermQxCOjghv7Tqpt1wQTGXqlIf+h4eQcD4w0NSdgTpfjo9PXdQOdezdgomw
         c5URHaH1mF3txp3UtDXTll59VZGAgUmvdARwoJCdix6ikftUry6IbaehXn5Zhzz//nf+
         sEM5U7FxU2kUC7nNezUEMXV6BFBUmQuax9wtmDaShuoaClgI5k8ixT/tt1KQ4pLKcKnd
         SxgA==
X-Forwarded-Encrypted: i=1; AL+hErEMUSpeFL1Z+Y8eis06zwBiyuzdL1bKkUtpfFQaBTVbZstc0miHS3hMgYmBgOEHfEBuUkw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8iyj0M7lguiJ0g3o5xhW8ureWUjYi/W33pzQY0Ie7Mn7n09ylm
	qF6NwQvl5TF04VH7th+goaH29fogqSARauekxkUc4hn7BN80HW1AhmMaH1nHpbnKiCA=
X-Gm-Gg: AYBFou3+YARe8EPDZrqEe3k3w2AvtZ6dHNm8msQXS2C+qBidBx10Oefqc7QbII1cF7c
	3+T6l8q3bJCZL7CWZ5UN/z45xpkj1dOmV+W9pcsttgB1uUpvviOFQzhs0sKRsS8wTzIFmhGjqtt
	hX/On8DVzDAdEX4bPzid+MZk8i+ZoXmTLk9t6Qif9g2vTNYTPgmHWWgVv3t6fdhfYj0rHMNlFhh
	L6BgmV58egItmr7eA8geaBLvPmUJY9Qw9Qmsbno/QUNmOUJPo2+gYYeYbb44AiYFg17PqP0vd2d
	mtjTqb4dQllNclUu2uOD0cdY6RYjATrZSXQmBz1C6em1M876slAsOtnfr35JOJPCZLxbX7A3uCl
	cH1Ry0X1OOFUeINLZ8NMPH6Fh09zFj/0hUH7NDtIRb2ws0XTlnAHvaOJjRxUBAnHxAPWYWYFbOU
	aeCbTxLLsheOu4VIMM4jGvadiL2tboSUtXzQSOVSEymjFQnEw+BsODGh46mG5umBfj88acryITH
	3CADM+wTJuldvPQR5/5OmSejkkpAEcfcahpCvwxC7UDR+WpEbrv40NmKVFWViZFFJN+hhCDwWfd
	2pslaaEoupN3rzYZ766EuO7M8stSYp+txA==
X-Received: by 2002:a05:600c:83cf:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ba0935cc7fmr6834225e9.11.1794347787385;
        Tue, 10 Nov 2026 13:56:27 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fe9357sm104638115e9.9.2026.11.10.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:26 -0800 (PST)
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
Subject: [PATCH v4 15/20] mfd: Use named initializers for platform_device_id array
Date: Tue, 10 Nov 2026 22:54:40 +0100
Message-ID:  <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2610; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=GtAPN5RJoz25rnsaMIkCchglusimHC6pNuburCmgGRg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LIi8QM3sjZgogwtug7vcVX0SJ3+X0vaVym+ L1HdZB2sE+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSyAAKCRCPgPtYfRL+ TmYhCACII9zsLdrs/XbNbp5plwyC1+ueOodgi90o8Ine575DtEGWJWFKxuOyV3MjOikDIUogOsG MzJmZ24/rTI7I4xwYZlkYEAqHwAGYW8EMjWiQpKt5XO8wsAFYIxFSL8LTY71t74mgHbWDhNI+8w 2TxE30D1nc84pn3rOgSAECQGKJdmFQ2ypL3quSOgUzff6KmjPytCYfR+0y/C9BOwmXcw28lKsDc mkicJ29/gVaaf9mRn6Qtjl2QU/WU4d3KO3rTHSnwNDd0A7kyku+SPqvzMsCcRe+ONI4Alw7KzMt c3E3M48lKlrj231S7RpIbK24VOHABh3tP5EwFKaeE7IzoPbd
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

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index d5602b2f4a0e..8638fc8472f7 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1252,10 +1252,10 @@ static int ab8500_probe(struct platform_device *pdev)
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
index 96aac158fd8b..3c7e7f1efd0f 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index e74936ac206f..385121867da5 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -435,8 +435,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.56.0.rc1

