Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277A40B6D9
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616407; cv=none; b=cjMvv68WTMBeMTeIgpJUUS1CkAo5u/VDaqjt9sgnNiln4Hil5d7zKFudAryOPB8S7eDLGeCUUwtYvFgA9xD3CWriU54VDTh+UzTWYpqZbAMmxPfqLxwFVRZav7PmCKRPR7jSoozfpcWZBwjJd+eKUnrP6xFr5PCRblmZjveQaE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616407; c=relaxed/simple;
	bh=etgPkbKbUfoS+htO45Q8kqkRZ1JNnJILE03uMw3EDhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VgEKBQlI00iZmmv0NqhVMxGN0drvmRlR8Qh/bttKLWWp2LIrl7eqF3Zsnu6x34HQFBVPq6CwrdY3cRA/HlLtUlG0TBfb2F+BIezrneqNUR+mDGf/eYrf+alc8ifWuZZJG5xCg9N2W3UTULNtGGrUprZNgQiX0y9boQaFWjZ0sNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UA5Wo56B; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UA5Wo56B"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso81034f8f.2
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616404; x=1784221204; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pQLSYgLLr6OrjJn8nEn0fUGh0WRKcFyg9KuWII/Jo00=;
        b=UA5Wo56BeC48jk2teLCWT10eXfDxzOx69BpYx6sNundPJdzh/Lq8Cz4q/PvJOUmKoS
         C6DIvS99bqXm9BL3XBdjcPFzmGIx7MISczK+JECpyAxYyk2mvL72LibuGI+b2D3XhylD
         ClVa7lo5fytdv4EkaCUChq1HECF0tIIkcHnfS/nMY4s650cb6KXP2YLrOdI1qmaotEuc
         WwKhdn4JyhQWC8ckWtpvnmj6NdUQkAWLqhsjhx/hhgOTy1fbH1KOiiuKjZVRW8O56thQ
         PG+VzT85ZHOpUGD31ULMCiOIzNkdPw+jGAB/6KWVxlQmtt1/vPxRgYTXrXVY3xbOGrOW
         RDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616404; x=1784221204;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQLSYgLLr6OrjJn8nEn0fUGh0WRKcFyg9KuWII/Jo00=;
        b=GAJEC1N6z7iGwEgh9AonxTrFIIZ1tjTCFLqe2N0jvkrBtjKfF+DSGod+7ohlTwtvXd
         gN8XQ8jiBUioZnTfkAh69GYvkI8hUACIfG6Y7dp3NR8EHqY2jFhYcEL575CzMWkS/dFH
         0etNMBq5QRXwpUy626Fkqt8iABIAgMJMyxd9mQ8cEQXFxfHkjznqSxdOundrvGrL1ruu
         c069FAN6AygBV/5wlms/aVpE44c8sUO7/G9NK9h3Ct8qLKML3ELnvGr+6qX7UnVU0erA
         IMi6ReZIoTOz6wvbxKlkZAQ53WPTuN/2Yl4Px1TzTMQGSLsG2f3OQk69zijUdu8ZajWN
         zcow==
X-Gm-Message-State: AOJu0Yz6c9r8GRNQecVu41iPqe4i6JIx1iNbGWjFIkXTz1opFs6EP7H3
	dF4p1imn57yVRI9oe57+BNRnjp843irMT6BLB1e6+cVAyBQ/qSfepPhKn8epWjwNdVg=
X-Gm-Gg: AfdE7cnhYcyc+CHyVE9k6Zf81celmGGGxGpp+JOfuwh2KsQXBw8zbyz+u44YtkAxulB
	5xX8LgZfPyj7ZpimKxWOXjHn1A5/hjnSjYcojzsTwU0N6nVox4mdwau4R68VFukiffv3H+8Ne2F
	f7aZptWFFCfVzD/64gse+VbUYyfn9uXiHVPZ+VXxRTayEJJpWuZJemYAnDc+dgt79qgxa1+dh7P
	0+o1douA2UmS3HCOVC12obCq6ixACR5jQ4qkp0P4AThBT4jlYtdw4Jw0EdUChMRgp3SNpAMwJ2h
	Xxmv9dEO86i5ORoPbxSkc//diGpp1eNxkZg8vLqGxYXI+ftznlm0LnvR+S1191mf2FyLvHiyl2Z
	fMOqI2M9HFlW0/vDrFVluZYLx3UpP49chdKB/JxWtLtk69ju+dnuEVWkvl8f2dp41xIMqWxj81B
	UIDqGBXzFyHTaxbsNo0UvsZwvdQhTC6sJ+bnYisQKTPxZTVl6aJdJAhpQqmpbZ9+OoKD6DFNQxx
	cTr
X-Received: by 2002:a05:6000:4203:b0:47d:d812:e067 with SMTP id ffacd0b85a97d-47df075e2femr8259957f8f.29.1783616404043;
        Thu, 09 Jul 2026 10:00:04 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f2186bsm51289197f8f.36.2026.07.09.10.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:03 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/23] mfd: kempld: Simplify device abstraction
Date: Thu,  9 Jul 2026 18:58:22 +0200
Message-ID:  <03fa806b7c0fa6a68d34384f694cbe83a17fba90.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7757; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=etgPkbKbUfoS+htO45Q8kqkRZ1JNnJILE03uMw3EDhs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9M4NjhASLahTRoGr/I6KJ7uqv0h6/saJ/gBS hJmUOadr2GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TOAAKCRCPgPtYfRL+ Tna6CACiBgu4AFbd91iJn6eARulLxcymH4F2O17/39al49Rn1dy516x7X5H5QHo+ok7HL6Mi38i NOEjBf3FY4baDegGzvwdl7vdPi3um51X6zt/6AAL5nWWtBGbCITAq65lMR9UPNhrmHu1SoFLrUQ h/t07kMxlRlsmKsz5YsGtxQAU9Yrtz6NFGNZtenviYF2Rtpf4rLzbVfy39hpBi83m+zbEuI6bDu +SZey46ZNYqLb/PRpB/nIHSNBGY+X2Fh2uw/CaNl8O86H1U0TeM3SAyvVwqUMLk3rGynsq/W1wR hR484lHRnuzQiwnc30fLVglMtn3XOhsyk9zaYtpJyF0IyU/l
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The devices that are created by the driver from DMI data and also ACPI
devices all use the same platform data. Other devices don't exist. (A
provider of such a device would need to know about struct
kempld_platform_data, but none of the other consumers of
<linux/mfd/kempld.h> creates devices.)

Simplify the driver by hardcoding this instead of using the ACPI
abstraction for multi-variant support without real variants.

Then apart from .gpio_base all members of `struct kempld_platform_data`
are only used in drivers/mfd/kempld-core.c, so they can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/kempld-core.c  | 66 ++++++++++----------------------------
 include/linux/mfd/kempld.h | 12 -------
 2 files changed, 17 insertions(+), 61 deletions(-)

diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index b64729918dfd..839328bce150 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -118,25 +118,19 @@ static struct resource kempld_ioresource = {
 };
 
 static const struct kempld_platform_data kempld_platform_data_generic = {
-	.pld_clock		= KEMPLD_CLK,
-	.ioresource		= &kempld_ioresource,
-	.get_hardware_mutex	= kempld_get_hardware_mutex,
-	.release_hardware_mutex	= kempld_release_hardware_mutex,
-	.get_info		= kempld_get_info_generic,
-	.register_cells		= kempld_register_cells_generic,
 };
 
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
@@ -235,10 +229,8 @@ EXPORT_SYMBOL_GPL(kempld_write32);
  */
 void kempld_get_mutex(struct kempld_device_data *pld)
 {
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
-
 	mutex_lock(&pld->lock);
-	pdata->get_hardware_mutex(pld);
+	kempld_get_hardware_mutex(pld);
 }
 EXPORT_SYMBOL_GPL(kempld_get_mutex);
 
@@ -248,9 +240,7 @@ EXPORT_SYMBOL_GPL(kempld_get_mutex);
  */
 void kempld_release_mutex(struct kempld_device_data *pld)
 {
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
-
-	pdata->release_hardware_mutex(pld);
+	kempld_release_hardware_mutex(pld);
 	mutex_unlock(&pld->lock);
 }
 EXPORT_SYMBOL_GPL(kempld_release_mutex);
@@ -266,10 +256,9 @@ EXPORT_SYMBOL_GPL(kempld_release_mutex);
 static int kempld_get_info(struct kempld_device_data *pld)
 {
 	int ret;
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 	char major, minor;
 
-	ret = pdata->get_info(pld);
+	ret = kempld_get_info_generic(pld);
 	if (ret)
 		return ret;
 
@@ -296,20 +285,6 @@ static int kempld_get_info(struct kempld_device_data *pld)
 	return 0;
 }
 
-/*
- * kempld_register_cells - register cell drivers
- *
- * This function registers cell drivers for the detected hardware by calling
- * the configured kempld_register_cells_XXXX function which is responsible
- * to detect and register the needed cell drivers.
- */
-static int kempld_register_cells(struct kempld_device_data *pld)
-{
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
-
-	return pdata->register_cells(pld);
-}
-
 static const char *kempld_get_type_string(struct kempld_device_data *pld)
 {
 	const char *version_type;
@@ -399,12 +374,12 @@ static int kempld_detect_device(struct kempld_device_data *pld)
 		 pld->info.version, kempld_get_type_string(pld),
 		 pld->info.spec_major, pld->info.spec_minor);
 
-	return kempld_register_cells(pld);
+	return kempld_register_cells_generic(pld);
 }
 
 static int kempld_probe(struct platform_device *pdev)
 {
-	const struct kempld_platform_data *pdata;
+	const struct kempld_platform_data *pdata = &kempld_platform_data_generic;
 	struct device *dev = &pdev->dev;
 	struct kempld_device_data *pld;
 	struct resource *ioport;
@@ -415,16 +390,10 @@ static int kempld_probe(struct platform_device *pdev)
 		 * No kempld_pdev device has been registered in kempld_init,
 		 * so we seem to be probing an ACPI platform device.
 		 */
-		pdata = device_get_match_data(dev);
-		if (!pdata)
-			return -ENODEV;
-
-		ret = platform_device_add_data(pdev, pdata, sizeof(*pdata));
+		ret = platform_device_add_data(pdev, pdata, sizeof(pdata));
 		if (ret)
 			return ret;
-	} else if (kempld_pdev == pdev) {
-		pdata = dev_get_platdata(dev);
-	} else {
+	} else if (kempld_pdev != pdev) {
 		/*
 		 * The platform device we are probing is not the one we
 		 * registered in kempld_init using the DMI table, so this one
@@ -451,7 +420,7 @@ static int kempld_probe(struct platform_device *pdev)
 
 	pld->io_index = pld->io_base;
 	pld->io_data = pld->io_base + 1;
-	pld->pld_clock = pdata->pld_clock;
+	pld->pld_clock = KEMPLD_CLK;
 	pld->dev = dev;
 
 	mutex_init(&pld->lock);
@@ -463,15 +432,14 @@ static int kempld_probe(struct platform_device *pdev)
 static void kempld_remove(struct platform_device *pdev)
 {
 	struct kempld_device_data *pld = platform_get_drvdata(pdev);
-	const struct kempld_platform_data *pdata = dev_get_platdata(pld->dev);
 
 	mfd_remove_devices(&pdev->dev);
-	pdata->release_hardware_mutex(pld);
+	kempld_release_hardware_mutex(pld);
 }
 
 static const struct acpi_device_id kempld_acpi_table[] = {
-	{ "KEM0000", (kernel_ulong_t)&kempld_platform_data_generic },
-	{ "KEM0001", (kernel_ulong_t)&kempld_platform_data_generic },
+	{ "KEM0000" },
+	{ "KEM0001" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
@@ -787,13 +755,13 @@ static int __init kempld_init(void)
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
index 5d75071eaaea..d7a823ba1a7a 100644
--- a/include/linux/mfd/kempld.h
+++ b/include/linux/mfd/kempld.h
@@ -97,22 +97,10 @@ struct kempld_device_data {
 
 /**
  * struct kempld_platform_data - PLD hardware configuration structure
- * @pld_clock:			PLD clock frequency
  * @gpio_base:			GPIO base pin number
- * @ioresource:			IO addresses of the PLD
- * @get_hardware_mutex:		PLD specific get_mutex callback
- * @release_hardware_mutex:	PLD specific release_mutex callback
- * @get_info:			PLD specific get_info callback
- * @register_cells:		PLD specific register_cells callback
  */
 struct kempld_platform_data {
-	u32				pld_clock;
 	int				gpio_base;
-	struct resource			*ioresource;
-	void (*get_hardware_mutex)	(struct kempld_device_data *);
-	void (*release_hardware_mutex)	(struct kempld_device_data *);
-	int (*get_info)			(struct kempld_device_data *);
-	int (*register_cells)		(struct kempld_device_data *);
 };
 
 extern void kempld_get_mutex(struct kempld_device_data *pld);
-- 
2.55.0.11.g153666a7d9bb

