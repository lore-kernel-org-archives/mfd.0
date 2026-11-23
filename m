Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432741;
	b=RMU6oJbRIuiH+yX8gPIOv/UOQZdhiB3Y3pTNB5mi35swok4uuEgCKECfuQnBw0ey7N+n
	 QFZAAvIt07wFbYkf1taq81tXbg7/Pquj9iQNQ8Kq4YNJwwIsn8JsLuUFeY5yuCfbE08Ws
	 BOZMERe408y2f4/G0RKVpSU+7uYFvSlTk/X/27/EPoHupUAWlnY6YHsC19JiCz9cj6ZqU
	 CbGlOYTWWDJsUQ2C3wcEI+dJUl7qEbJCUpXJuqatxJeJJ9U8r6EXyU6t9citFMLzR1FkX
	 6BlDYFaBzRm/Uio9PSB5BLbdn84yktRjZrxyJ/B8KE0YnHLCM0uYj1vNx3zrO0Zi5Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=jwL10KRKcG6XAu94ns6q7rnAqyJIXDIiUk5S1uZsgLw=;
	b=O6+RHQFSadXzyQyPNmLR2lwhfR56sSpf7tTz2kTUljWPyK0DVN3w02PQK89OOtPMOa+a
	 d4A59tPmYYdKgNaUPJehy6xawgFJ/zlqLB9mxrNh9DU2elSiwUekZvEee7jG1x4DPbHB+
	 RRTYtW3HboRKnHvfESEtetTopS8AZGpsstsJSUhEtZpCYqbapLQJE6Gac7nX0jzZhQwyK
	 2yoYKF7W5w/kcwn/93PaAFzoUepU8TnOjR6b5coedJBHJmcs9FqMmXcRsg2Pbr25v4ZG7
	 lIOUpBVt1GJy0GFlJO1wnm+RnTu8Tr0u5XopcqDm2MpYBiAgbkd9Bo463u6sqrTX6hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EsJuqJon;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4C3606A687
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4C3606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EsJuqJon
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so26108655e9.0
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432739; x=1796037539; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jwL10KRKcG6XAu94ns6q7rnAqyJIXDIiUk5S1uZsgLw=;
        b=EsJuqJonqDKgvffvQpyiRV9Phrd16oWKSFsM81Vvu8PchPWRjOm1UG4EUvqAr1dDxx
         iiju1nVtHmeuLU1rZJa1aqwRS4OScbqAmyrqwI6RsFt211LO4pCWrcVRfrG/vOW9vFn8
         jCGHPEEcHoTWplp6V5HXmUVbZ9xGVJvCM0MUAjlcSeLWlaxikJzxLZzu3KKm7sPWXgeW
         b1Mdvy3U3ivHNi51/laBZcpEjCW4uOBCTHTxDao1QW16q4Q0Wjt+0jlfCIxigIU9jO6q
         C1GIppL5nVIG/GsP/sXNt9llMz5j1r9t9mWFKvu/7xQ76Sv+evBMYI5s8FKX64J9nxGx
         peJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432739; x=1796037539;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jwL10KRKcG6XAu94ns6q7rnAqyJIXDIiUk5S1uZsgLw=;
        b=hktOxqgKfjGf5PsiUrga41TCDkCd8pn5K8e9GMbA6ljWPfLiEB0wZ48/JE0C8HXzBY
         lkwcV0ka8yRufKjtayy8Z9q8sYcWxJt4dCFCjv3Ju+mVnacNzNQNujyJJO9DXm71uPVl
         RV0Cb6KBDac73MN7gm1pc8tFYAzrPnJ0it1AvVwZPuZervI75AP849s+LtP2QNlhS8Cj
         jWUEu19ZqrRht8Ek76pL0/V1yw7pxJA4o8KC7n1U0Fsc9UHl0Xf5yfa3szQroHg/hLm1
         Z5j2RQ1gG5IHPKkwqs3zHhl/h2Muaj2UsTTXF+e9VCtw1jC2TwIDHRfrnwXRWlddoN/f
         PZqA==
X-Forwarded-Encrypted: i=1; AL+hErEBasarEJFrKoerV8YOMw3XU+cOt3WBB0OQDH/xNXYRVt7L3YlmRbWXJYG+n+VGiQdpUSI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9p/FNFqg3JQMAqXgY1yhUP8pIxgDc/7IvOq/f+P58FmBkjExsI
	VIoDPv1pKoF077IZ29NdbJgp/QWmMCQDVK4B+j1yiAoPmnP46Y3mTakr5uAOaqMn20g=
X-Gm-Gg: AZFdTZcDzTJRo0AJ5ascQDGPJ5mu9CRPzOGv9cP4uwQQTNO09q9xn7iSQs3+JQId8Hr
	LfrlTQUfAdQAFzkBzA4b4ZumjYgOSr81fL5D8tVpBA5A/8FXxpXLGA+CMMYjKbiU4P5YZD4daJG
	cNayU+CgUoGupArYt8JR9Sve6/tNIo2Dus0ubEGcS28iQdry+kCpinXbYFaLC3hY+snm5oeyrRG
	iXJE2n2ZXilpgV1XWqyj8ux5gitcUjJKYcl+Dg3T0E6Ak/qfMgoJlR7qfBkmo5BoevkJg1MmNhU
	UFz2KpEwfEQCEPtFEU1RUhwcxuwLVFn2b7f5KJ/wA/kndek74gWS260RKdjSsMSL+ZSc7KEQWIU
	WTw3VrSmPmVKjo5AHr0JQc+ZZ1fYIy7op6kjCgVOUDYQ3ogq8QyIzQSvZJmzo2AFZKEnudedkDC
	JfN4y8AyUyNIX4KAT89WO+c6qfXiShQrnfKGZplCIbet4u8V+3UTRBBMzrZH+iAnez6ly4LCY7+
	GQJPUTGvK0cya6H2ZNeem1rPkyrODttfJrC0AwN59ZB2TQLYKxWVJn/5pUwOoMA8MFuM5AUSAC6
	xaKvDGz/nC6iFKeqAPSxAKV+vU+Fkef/d49QXifgOObmyHvToERY2dTt/00eHVR6JEtRI73w4LP
	3I+pja9+anA37emZO
X-Received: by 2002:a05:600c:a088:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb8880ac02mr221401195e9.6.1795432739420;
        Mon, 23 Nov 2026 03:18:59 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb85399e2esm393577795e9.7.2026.11.23.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:18:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 01/17] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Mon, 23 Nov 2026 12:17:59 +0100
Message-ID:  <eb63d4f97f6ca7b02843ae7f847e05f638da7244.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=exzuZn6/A2flHssSAn+wVJWquiw1+beBF6wV3QD1uzg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCDpWobcWgfJETkKzicHPb9yb1Q1GEbAd3fRS P06FmSW3syJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQg6QAKCRCPgPtYfRL+ TqnRCACB34VmkH/Zrf4kcZRTb8jyWXVRlaCXFu9f9mPWr4O6yveUz5kyugfZc3cc6JKYSC8vT9M h6MbSNuPXyVYUUJjlfyqfnF1pRoQ8FfnOZmfxZI+nkx03Kmw58dG19VasOBEvWJD0WkluRQgYiO MtH4WUtCqLkeMhZYh7GC6xhdAKG0F0FHALVNvjHkpo6UyyLBnlAIK+U0VS3kgXZS5tsHdrCuE/2 iwH5uL2w3Hqh4F0/jCuAn+vG01VkNGmISzwXdH0emgTbs6DYBGBNif/mLlcXhAmzlYp97yMNJB4 2TeYN7/s/DXqGRTGr3IE6+cxSTfuGBgIp/4zArY6PUnkZtXb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
replaced by a local variable.

With that change enum bcm2835_soc is only used in the mfd core driver and
so the definition can move there.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/bcm2835-pm.c       | 11 +++++++++--
 include/linux/mfd/bcm2835-pm.h |  7 -------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 14b18dc38058..f21d5689561a 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -69,10 +69,17 @@ static int bcm2835_pm_get_pdata(struct platform_device *pdev,
 	return 0;
 }
 
+enum bcm2835_soc {
+	BCM2835_PM_SOC_BCM2835,
+	BCM2835_PM_SOC_BCM2711,
+	BCM2835_PM_SOC_BCM2712,
+};
+
 static int bcm2835_pm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct bcm2835_pm *pm;
+	enum bcm2835_soc soc;
 	int ret;
 
 	pm = devm_kzalloc_obj(dev, *pm);
@@ -81,7 +88,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pm);
 
 	pm->dev = dev;
-	pm->soc = (uintptr_t)device_get_match_data(dev);
+	soc = (uintptr_t)device_get_match_data(dev);
 
 	ret = bcm2835_pm_get_pdata(pdev, pm);
 	if (ret)
@@ -98,7 +105,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	 * bcm2835-pm binding as the key for whether we can reference
 	 * the full PM register range and support power domains.
 	 */
-	if (pm->asb || pm->soc == BCM2835_PM_SOC_BCM2712)
+	if (pm->asb || soc == BCM2835_PM_SOC_BCM2712)
 		return devm_mfd_add_devices(dev, -1, bcm2835_power_devs,
 					    ARRAY_SIZE(bcm2835_power_devs),
 					    NULL, 0, NULL);
diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index d2e17ab1dbfc..f70a810c55f7 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -5,18 +5,11 @@
 
 #include <linux/regmap.h>
 
-enum bcm2835_soc {
-	BCM2835_PM_SOC_BCM2835,
-	BCM2835_PM_SOC_BCM2711,
-	BCM2835_PM_SOC_BCM2712,
-};
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *asb;
 	void __iomem *rpivid_asb;
-	enum bcm2835_soc soc;
 };
 
 #endif /* BCM2835_MFD_PM_H */
-- 
2.47.3

