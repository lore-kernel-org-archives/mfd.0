Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432744;
	b=OEsvxb5BdS9sMuQjNR7JTgZw6jPIEEND5+2BDQxeJTwIOZ/oHms3ZwZu3cQLNOoO0pNJ
	 nx/D/fIebF8MjIeZXieqBe8SlUYOkyeNkwYeQpqS2NHVJAyBuZeb6zfDjqsGiFoGUsxf7
	 OGArH9sUkDrWE2yLvjIAmyskIJ965nqg0pYGjPIrcmXeU4nCgIqmT5SZhM+4+hzxjwAAb
	 cSucsTHFWtosjzpXVsPTtJvH7EQm0RBnTq/9P2TspfVMQnppg04WsHWLlw6DNLiRr6TaC
	 ATI58f6BsQMGJ0nDopE2y9NjB8isv/vbV/GXxKkss39FlowI9EfcF0WwY2FRypkC1OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=5Za9etaWzrlUrj531Qe77tzP9ZYrvCitBUMHIjM0+zU=;
	b=poB3uYcZxLXZrYgiMw58Kv92V6Xwexf2iv9SiSCsy8xQK/8LqBGU5Ou9k7k0p5Ch7l1g
	 3XDvUmOXfsFFeuxOVJ42DwzekebeFH6f/pYsXxWMtXy8DnwrRBX4M28gZ6iZb1YBxkLN6
	 EpKOFF4Ky2hxpSKx4vpQ4x0f3U+j7hHRy+K5QYB01yLG5NiKGGZhfs+Szj7MYplxY/DK0
	 XGTJ3nwKobZHXwZRYuAgE5Du1KPQ0OlkKXd9RO15rz7d3WssYl4I3FaQs/leWOaYzByMe
	 qhOofqgrKJ1xOXZZWiOPZAv/7TVwua6m3TpbnO8MKDu0/ZU+S9clSQBWBEmVR1FUK/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Bru19PBN;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32140606A6A9
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32140606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Bru19PBN
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so2181573f8f.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432742; x=1796037542; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Za9etaWzrlUrj531Qe77tzP9ZYrvCitBUMHIjM0+zU=;
        b=Bru19PBNu2Yg85VrLhSNzvBdFUd/T8Uc/3ueNnrBuXrv84Wkj1nAcNh+9OAWliE/gV
         HeQJifGmLXr4U1cjVnMjAN5o9kiFNmtthllfAz2s1URJF28st+p68PnyaVfvsqMsmg8y
         h4fG/rTVyCLPx9VSyGDdv2obP95ujbeWcfOVkvGqicPLpDhuqmvkn4/GIAOhgSwcZLhf
         UNtFI+Lfn6L8lxz/fGw2jn0Z899kvdnU15m8dOFu02bhHtcB1yx5ZxYemwzHkJnZ1Kpv
         vk9gdgaKWVWFCwS4svBIB/7J6ew0zGGHds6Fry66ahctqQFsRQM2s2t8vjuS+5nnXUJs
         PmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432742; x=1796037542;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Za9etaWzrlUrj531Qe77tzP9ZYrvCitBUMHIjM0+zU=;
        b=QQZp6AgUmqUMjkMayGrMK+L2XQ7RMt873J79hQ46wneRpLSlAZEPE5hWZxZ3wOyEAs
         qSEhfGH5f+nP6MZLJXr13B+ICwKEhMEsG1GtUcs/x7noiangjDXk+ihsRiF1am3O0l/+
         isNBVwNWtQvVi4sTYSfN/HMZjhYuxqYrHy2Zn4V/qlwhrIk4MtKpZPknfyxZyXeWXmFA
         Vr2Bgt6tBRHtsDKza3pfoXEpGe0ecNfyWIBqwmDs4uX/Nwng+FIMKGcyi5qP83T2m0WN
         Zvwc39Zqo2dQnIUmAHuMkvqs9OHBpUXy0jgXOaCkXE9nsqLi+J14PqR4Iii7Uw53oEYP
         FxDg==
X-Forwarded-Encrypted: i=1; AL+hErHxOHIZwYGIfgEjJnNMzG+RKfz4UZ+QTbzrtfb0kYkE9Ot7y7bOcLfhkUd3R8/j0kceu2Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZngqbizQR+DVHXtW+iKFxE0SVnO1Hr7KeyWDP6lnMIfq/vXQK
	ZL5Km2GAOFyi6N+aDq505OgDn/hLKdGtFvh/4+rD6jOQ6rlc4bbr7YbXLksg/k6/2v8=
X-Gm-Gg: AZFdTZfdwp1MR3XuNspicyJsYlxSkkUs+sFXlnLf0MQnKyblCKmCpS3XnE0LONgG3Be
	YcmGtI9sNulCx0yzkmwXn/b/XqmUAVrPcGnV8y3kjhuxqEgpZ2SbbttV8qjrU1iP+ULmXYX+H6m
	3xMaJafeK4E3BW1LsLE02SVoc/LZSMmvBGY+AKj1fWk75sbafEfc1xH7ydBbuiyeYC+w9X7x4qo
	p3NLn9BgxOovKQ1sXODdhK0RPU2xZkIiqQL8XHcBxjsthACsoVs38I386gWM7pxwffMJ6pBVFGO
	rvROhhHbfY89xYQzMCGZ93MsP/bFjtl+3LqKhr2XMzUMdhhC+er7mxqS81no+1O3UfWAKdCcit0
	2j1TQoEY9vDfKeELNkh+j82CoBaTCbky8edy+kvwVt94mJXBPepJNvaNodv2HY5skubWcdOVIt1
	7uW3ZNyZPtGx9LRIcCnjz3qYbpZZnhCAuUdL5WJk5mXfc1YFeIgVNcm74PCWmauQbNsXbv9gMh7
	cL5FKJUNSuR1VJtQstj0/Fl9wNykqnOS0E6yDHGOETPRHwR42Q9Y1sGzQOfQncaBAMVf3p6XMjk
	Ytue3GZo1BrqJNnsOYOLZYbe1HkAyJC2KBmy1GfMDik5wynp5zijci2mebX2WqIDXMZ5BXplnoW
	99BWGi/zuS2uSMHST
X-Received: by 2002:a05:6000:1788:b0:4b5:7aed:6812 with SMTP id ffacd0b85a97d-4b57aed682emr1011422f8f.4.1795432742510;
        Mon, 23 Nov 2026 03:19:02 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6a67f1b2sm20093402f8f.25.2026.11.23.03.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 03/17] mfd: kempld: Simplify device abstraction
Date: Mon, 23 Nov 2026 12:18:01 +0100
Message-ID:  <ce2d4bb028b4c896bc3906cd9f7959af557ce6fb.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7779; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=z3bdjILbd0+/ElOXnFuRTbokuf1b+/kGcrxHGSae46Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDup/fV/Oka+ciBkW6yUUB5S4/i9P/9XLCD+ nChmmAk06eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg7gAKCRCPgPtYfRL+ ToBzB/9Q0o81OrykvKpA83T4JfKNiAR123raAgvA8XWqp/Ij5lZc8q2jNFx4igPTYMo5cXI2yF9 e+XoVVTCSgO8R37qTgSw99/D+k/t4/xPKKLdiwRqvisWpjxKKF5r7+DZyk9mZv6Vd291Igd3he3 a7qzRz5zj+voVB/HcXzDYTIecdM/O3X0023UM2Xq6UbmXp5GyTo6H5S+jeMd5m/UCz5O/gJnLiT 7DHGjDn7bTQ8NCCTHCWpyk9qUI4dIOvijoPN54u2nXXOyXYBlGKHsIKiuzSp8tBUv/NC+Mk1+74 SjYcbJ6LnEGcd7fOZSpgZlBhmob75zkKaRK1aXZspXcolXuk
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

The devices that are created by the driver from DMI data and also ACPI
devices all use the same platform data. Other devices don't exist. (A
provider of such a device would need to know about struct
kempld_platform_data, but none of the other consumers of
<linux/mfd/kempld.h> creates devices.)

Simplify the driver by hardcoding this instead of using the ACPI
abstraction for multi-variant support without real variants.

Then apart from .gpio_base all members of `struct kempld_platform_data`
are only used in drivers/mfd/kempld-core.c, so they can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/kempld-core.c  | 64 ++++++++++----------------------------
 include/linux/mfd/kempld.h | 12 -------
 2 files changed, 16 insertions(+), 60 deletions(-)

diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 39edaed70694..93e35f6be9d5 100644
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
 		ret = platform_device_add_data(pdev, pdata, sizeof(*pdata));
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
-	{ .id = "KEM0000", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
-	{ .id = "KEM0001", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
+	{ .id = "KEM0000" },
+	{ .id = "KEM0001" },
 	{ }
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
2.47.3

