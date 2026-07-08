Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B65436BCA
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509410; cv=none; b=UfSHNo49uMm0XS3fLlDjvNxpXYTl48/Ha9gBAzSkJVEdRO6Sk+xXM1sIpxU6XZLQW0PdrRuQO9MMkd1Bp8OrT48jxcLZJAQVVhoJ/Jzw1rmEOZ7SbcMDZsxAm4YFWD12XcooOO+eUECvgzmJ1On7Qf2gy2HIy0TZPYJSu/0HTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509410; c=relaxed/simple;
	bh=VL/yluSZ6Fi7hWYHUFpwuzYE+FJZZhvA6JzTqpD+y8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pPJie8sI5yoApcOjogBRhEwalCioaFCNI03vB0muMqT9bavZTT50vtW9EQhD5fWdK10ZP3blW+c7xfwYvK+KGOfZJv84lqTKCXDPGTUmOSsLul0XxKApq0BMG01LUAbGMwBdW0NeYZS62kM58UhdneGTWXM5x1fJSME0afeZDTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Bib28YNv; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Bib28YNv"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b27c7451so19087805e9.0
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509400; x=1784114200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz4JNNqXWIj2RFumyBqHdTReXE4bscOwjkiOcUVPCAE=;
        b=Bib28YNvf7stlbcFAil06BiKsGSfR/Js6SXOQ6eLUuFQ+cvsGXe+iFI8sl+zkl6jb7
         MbmqUtO5pNxxuTQ5ynptWuXY7VWTtG5xd0M4mlR9yU69GNjgicF+njuaQK4GkRyRHwkH
         6DmfdN/lX1+LjPUGo8POlLv80BP9GFD+IBNT36QCM69AlQ85SJAjT1h/VKLTHC6R+6Fk
         TzZwM/rDF3CQlcuTBgtvBljJFq//kYeSjTn9iSt0AsxV5QgSCeaOsGGkHywlnpWwnfMl
         7QzwD+XN7FdTReeON5P6OOV6flrG2IhQkjTQMz6rxMYOPh6/VPHSTnR7+Jp3oXblDZJS
         eGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509400; x=1784114200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nz4JNNqXWIj2RFumyBqHdTReXE4bscOwjkiOcUVPCAE=;
        b=CTlVcNpIdczo0R2VmVykhihKbdyliiDbBc8uyI+t0izVFwurbuAO0UT0HxNz3FbnsB
         6i7jPyX2lSmq0ECsh8B5F2gfuKSsfcF5YfXmd6/azUzHMyNMeziH3ga/29/muWpurqzG
         58y7/j3TtIMC/G+17F+y4Xkt4aenM7HA7JAhLr3nENJfcbV/9k+rY2uZyzNoBbX5uiUM
         ZujieKqEMqew2fueZ/+zX2phOhvRy7PWt0u09LrE1H6mJp5rUf7wRmd2Fu+5LiK7/jO3
         avHB4izrKV7LS3K45/QmhYZs7pZ78dFraqgE4n+M/AC5273O5fKxqmlDSEWHteteHgd1
         59Vw==
X-Gm-Message-State: AOJu0Yw6njabhfGS/irsHPauIG165aZdM4Q4kFarmvfaMVPcGGlwqtO4
	jDb8sDTPAMyEs/GbeBg6Q8Tyz1AARct/E7Xucz4Zs0vlFaxkOuZHJM7/x2dxOreNElc=
X-Gm-Gg: AfdE7ckmw3Nvoaa6AgXQjCAI54ZvkXr2sx9hH1Wvfu7iPOmH1TyO23PX/R/7VGof6PT
	Wq4fnrPOE8HXky2ReXw4IvVtbyOoARI52reCFpufvtf9gTjodGPLSU1J6DHha0A416lsQcoGfre
	EHMd3iW2q+TqR8uUPL/YxlwdvhauCB0Cm7I4kf1F4NjMF2De+UL7dKWPhpJut27PJfjwdkBAJaX
	6YtO9xpqYtoTKvLDioiQLd4czXZr7zJ7lz6XBvqyes4GyCr4W3wx0Ln1XIuCy0afCVhyuI1giNu
	Ox9kEn0NLU8cwpaXfa+pTcywcpV8O+69l9WWPELE/vzOnfXHkT+0Yc5v4OIaJF6rwFPpYU6TJa8
	MzcajAN1inxiDuhg3B6+D+JKtxiy0eOGmwCbB1P+eK27QtmId7bYREtZcvNbOmCvaA5eB1p/vpn
	lEj6nWlAvxiSxdxDb1mDUXowo0SGk55aObsFiHJB/oHN1H4AYixJMSBnGD+4rCpwSozdpPj4J3l
	ivp
X-Received: by 2002:a05:6000:2689:b0:473:6590:c42a with SMTP id ffacd0b85a97d-47df024a269mr2571925f8f.9.1783509400481;
        Wed, 08 Jul 2026 04:16:40 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1e6ccsm42331869f8f.5.2026.07.08.04.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:40 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/23] mfd: kempld: Simplify device abstraction
Date: Wed,  8 Jul 2026 13:15:10 +0200
Message-ID:  <6a306ad0f1cbecd50332fe52f8f3eb089d8df2a5.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4481; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=VL/yluSZ6Fi7hWYHUFpwuzYE+FJZZhvA6JzTqpD+y8k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFE3SqDPUrOAXb6vGfx/nq6jnQEoUxGBLXq/ iosuJoiZM2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xRAAKCRCPgPtYfRL+ TnHLCAC0WM8dpoOS28SC8Hjout9aPmq/7FaGkOuxFg1fZmlKsDY8du5p8qloQ1QjDB85kTSedSQ FvaQCz8DaXNT9XEuwho/ilZ2iyh5tfSWdbFgXqpU8XE7PsU5ZIjfi6Cus227zCjC55GzcfsqHKa lVaY35I99irdr3sb5t2S2bAcy239U5aSWqd6QrDBBDDZYPhpHmo90SUBlsf2nFXvABCnFDElHBv XBisUfatHEouNjWHqje5EUCb85PeAZv4C/eKgaCV3b/XsyGkOAEmT69Udc18VhXHCeUujXiX02a KTKy7ImxihKyD0cb4j/0CuoNW/I8WdPjSuDQ9tHozvWWWUc+
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The devices that are created by the driver from DMI data and also ACPI
devices all use the same platform data. Simplify the driver by
hardcoding this instead of using the ACPI abstraction for multi-variant
support without real variants.

then in kempld_create_platform_device .ioresource is always the same
value (and this member isn't used otherwise), so this can be simplified,
too and the member be dropped from struct kempld_platform_data.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/kempld-core.c  | 25 +++++++++++--------------
 include/linux/mfd/kempld.h |  2 --
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index b64729918dfd..e60736380cfe 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -119,7 +119,6 @@ static struct resource kempld_ioresource = {
 
 static const struct kempld_platform_data kempld_platform_data_generic = {
 	.pld_clock		= KEMPLD_CLK,
-	.ioresource		= &kempld_ioresource,
 	.get_hardware_mutex	= kempld_get_hardware_mutex,
 	.release_hardware_mutex	= kempld_release_hardware_mutex,
 	.get_info		= kempld_get_info_generic,
@@ -128,15 +127,15 @@ static const struct kempld_platform_data kempld_platform_data_generic = {
 
 static struct platform_device *kempld_pdev;
 
-static int kempld_create_platform_device(const struct kempld_platform_data *pdata)
+static int kempld_create_platform_device(void)
 {
 	const struct platform_device_info pdevinfo = {
 		.name = "kempld",
 		.id = PLATFORM_DEVID_NONE,
-		.res = pdata->ioresource,
+		.res = &kempld_ioresource,
 		.num_res = 1,
-		.data = pdata,
-		.size_data = sizeof(*pdata),
+		.data = &kempld_platform_data_generic,
+		.size_data = sizeof(kempld_platform_data_generic),
 	};
 
 	kempld_pdev = platform_device_register_full(&pdevinfo);
@@ -415,11 +414,9 @@ static int kempld_probe(struct platform_device *pdev)
 		 * No kempld_pdev device has been registered in kempld_init,
 		 * so we seem to be probing an ACPI platform device.
 		 */
-		pdata = device_get_match_data(dev);
-		if (!pdata)
-			return -ENODEV;
-
-		ret = platform_device_add_data(pdev, pdata, sizeof(*pdata));
+		ret = platform_device_add_data(pdev,
+					       &kempld_platform_data_generic,
+					       sizeof(kempld_platform_data_generic));
 		if (ret)
 			return ret;
 	} else if (kempld_pdev == pdev) {
@@ -470,8 +467,8 @@ static void kempld_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id kempld_acpi_table[] = {
-	{ "KEM0000", (kernel_ulong_t)&kempld_platform_data_generic },
-	{ "KEM0001", (kernel_ulong_t)&kempld_platform_data_generic },
+	{ "KEM0000" },
+	{ "KEM0001" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
@@ -787,13 +784,13 @@ static int __init kempld_init(void)
 	if (force_device_id[0]) {
 		for (id = kempld_dmi_table; id->matches[0].slot != DMI_NONE; id++)
 			if (strstr(id->ident, force_device_id))
-				if (!kempld_create_platform_device(&kempld_platform_data_generic))
+				if (!kempld_create_platform_device())
 					break;
 		if (id->matches[0].slot == DMI_NONE)
 			return -ENODEV;
 	} else {
 		for (id = dmi_first_match(kempld_dmi_table); id; id = dmi_first_match(id+1))
-			if (kempld_create_platform_device(&kempld_platform_data_generic))
+			if (kempld_create_platform_device())
 				break;
 	}
 	return platform_driver_register(&kempld_driver);
diff --git a/include/linux/mfd/kempld.h b/include/linux/mfd/kempld.h
index 5d75071eaaea..e9b3e4063aae 100644
--- a/include/linux/mfd/kempld.h
+++ b/include/linux/mfd/kempld.h
@@ -99,7 +99,6 @@ struct kempld_device_data {
  * struct kempld_platform_data - PLD hardware configuration structure
  * @pld_clock:			PLD clock frequency
  * @gpio_base:			GPIO base pin number
- * @ioresource:			IO addresses of the PLD
  * @get_hardware_mutex:		PLD specific get_mutex callback
  * @release_hardware_mutex:	PLD specific release_mutex callback
  * @get_info:			PLD specific get_info callback
@@ -108,7 +107,6 @@ struct kempld_device_data {
 struct kempld_platform_data {
 	u32				pld_clock;
 	int				gpio_base;
-	struct resource			*ioresource;
 	void (*get_hardware_mutex)	(struct kempld_device_data *);
 	void (*release_hardware_mutex)	(struct kempld_device_data *);
 	int (*get_info)			(struct kempld_device_data *);
-- 
2.55.0.11.g153666a7d9bb

