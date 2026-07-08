Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D770E436BD3
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509406; cv=none; b=rJK3ZqX+0Gwk/BiXPwnRsTL3SLq8YW9Gugi6Zduc0tUPR4C/wwUrDGF6ZUOyErm39503oHtr9SCJMRGFOHjkFsKHXznGVvDRF6f9XRElcO95OYY5wBGz739mMiuMQxQoaoRsAzU3R50yrwj9NVmeSqVBt/fdPiyR1wzqw7CtN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509406; c=relaxed/simple;
	bh=1xIJ7j6GCqXs3V5UyxCknvTsa2XEwpXsBfO8oqhftBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PyNMkJYHvC25pl1pOQAJZ24m020WTIBWUqBkbQbdjm9zFqAai1tN17zElzfiBdGxvNw9omdSjXZxUD6OhMhSn0Z1yeZakCT5Ba49uNn58Ws+VfvDoDA9LaaVTncxtpTv8b6pnfpLoLyrGiw51RFwPrOkuCxg006OBQY70lC3/Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aSID5MoM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aSID5MoM"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47df343a346so239124f8f.2
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509397; x=1784114197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=;
        b=aSID5MoMskYKCbXple6yvLcwqORF9AD4JVMRghY7TJHjcmhhOpYy3IbybNR0N1ZDAP
         KGlGolvlFzkknQs6vCnsfygcEMc7TRDro+s5AvDqditIThpp/f3SiCbhL+WMFzTvWPzi
         qgZznhNex1o9ubIzsVHzCZivlkZ9r+LJSh0xt/iZiv2CaClSWD9bEfn4M3oMBvnEWfgT
         rxcYiMefLZ/TmvapDmx37kS2F8n9J2OjLBpI4IFPjpLZFC0tnG64PGsjfMVy4oyEVBBE
         PFKmJWIVKJP6BYi5w/9Aa1MPeW60tCVbBcJtnC+8z0ZZqY8/xMFRGXGB3u/T5zs7sDka
         rwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509397; x=1784114197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=;
        b=dSroO5P6o39J29/r2/4amaSIgLGzc3cHrlmeOq2EK9n+yj4KY0MtlLcONJs/RDeuY3
         aprziU2KKRFiPARRar5a1BcIHejsUe8FXzxHN2OFaSceHOOvceCnF/Bi3A5f3uCpwlpX
         LGNMGl5GGTT0qEQod+SNguworCID6mq3bS0uDor4mcqyb4/eEBSWjEiiPILKYFiKkVtF
         0kTIV6pWDHQQZYFEEqhUcuwvkozoAx2SljVOJHRbi9d5IgCvsSU2wf8iagFqykmXz0fj
         bJ56ITxqlw++gh4PNb296mazxPf+yMjR796Dgt6tnFRWijA5hz4FN1MCAXLygzj6GWeq
         zLWQ==
X-Forwarded-Encrypted: i=1; AHgh+RojCOrLEuMZFbrdlFCpfkWks+tO2ZjAOj/FMZdV0hEpKlOgXnIuBSqdXJyxkNbzNuLyxH8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzkv6V5e+ukKtifWtTUO5h/8d+J0alaSxXmTeBZymdYmoDa5Q3i
	V9uWHuU6oKwJ9n/ycjcqrEUNpcElT7Ar7DEf0CsZpJdpVe8/O2lHB06SQssNjjaQTd8=
X-Gm-Gg: AfdE7clXvUmeClWyaaRkGs3M2v8OXdJQ5X4FcRxf9OriJ3Uvn6Oeti/9ZLufnsWhA/b
	D1lEOZ9tTyK8BtPvg5nskjdptVqxrulOj0jLMhpHMRVjN3KOIMC1BBfhTmvEtkaJnzoMV8GxDDo
	tFTKLBBvmewKXmJZH6r0A3zZ8bEyNpSClTAkO2sUvYm8F6cFM6UJoGrbAqYFF9Gk4TgEpiQLJqM
	2suw9dvcVVWkXxLWeZZeR4Rg+EEoxfuhEquJFiVrKG4D8HjyuGhlHhkSs9iU7AAfr1xLynzU5pJ
	6BXMCRtDp35GdL3PBxahieEyI8taJIodN64jWJ/hziOS2GEs2z9cjXgGm7NJL8i2C1aZlxRhz+E
	klD/w6RdDe2Nf1nPYSX5HeLMme/8pCQZjJubNMiUxqqDce22Kl87KvTsIRCefRnZO8z6fesDfBD
	A+g/247ZfJTD2nmqZVZRM2sQxi57gg5y4dkzL+TtKk8SwoH90wydjLagCaJNNmqCJVvXOkEkDLu
	5su
X-Received: by 2002:a05:6000:1ac6:b0:474:fd7a:93f2 with SMTP id ffacd0b85a97d-47df071e6d3mr2474928f8f.15.1783509397326;
        Wed, 08 Jul 2026 04:16:37 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d8f1sm42676631f8f.3.2026.07.08.04.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/23] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Wed,  8 Jul 2026 13:15:08 +0200
Message-ID:  <d80395cc8008817427e63417b97bc8631236c72a.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1xIJ7j6GCqXs3V5UyxCknvTsa2XEwpXsBfO8oqhftBs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjE/pluZyxrzVFbTyPl5jsOwP0Qa3t5vxaWaB QIKD034NZqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xPwAKCRCPgPtYfRL+ Tt4OCACCOMmYmXJE7xq+JazBPa9e5fYdSoDRlNOUwskyb1UIdVCDhSFBu3t3mOeLlqzs2Q/JqUg 9aywG+xKp8YD8JudHB/qOMog1fn0I0LrtCsFLOzcTLwv78TifwhDM38p5DRkTjPIKAFu/eZMg6S 0VT4T345q05ABPe1bJ4Pjak+s3x/F1LABTm5JeIDw6iz4Xp7xFE9xKiCiN2l6UheCra0raoWAoC cbwqbGAyPBgQvcjmy36MtsK+rRp/31KGIOa8dHRLaF8qtA5Sf3XcnhZn5/K5H5x7fapq8kTzJ6U UemEPOAhHX62n6Lxb4TeTv6cx9Msg3kuWVRNdoRemb4htW57
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
replaced by a local variable.

With that change enum bcm2835_soc is only used in the mfd core driver and
so the definition can move there.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/bcm2835-pm.c       | 11 +++++++++--
 include/linux/mfd/bcm2835-pm.h |  7 -------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 9e8e3dcf4bce..87de35075419 100644
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
 
 	pm = devm_kzalloc(dev, sizeof(*pm), GFP_KERNEL);
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
2.55.0.11.g153666a7d9bb

