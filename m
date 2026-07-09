Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B956339BFFA
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616404; cv=none; b=EIa92k7MeMdJjEdTniLsMB0Hi6SP+XayhZqWyBGcifJyk9HrEJpL39c6GJUCKC0EH8phrMGe1SZUEr8NO5FmfCa/NlthkDHmIWK+MaxN1Hqz9lJ3/rIKu8PU7ag5Qau13OA5LSjGDxSUXRVUHi5+yscu7vE7kGBu4ydwwg0p73w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616404; c=relaxed/simple;
	bh=1xIJ7j6GCqXs3V5UyxCknvTsa2XEwpXsBfO8oqhftBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NX3NmKkBqyU3kbvz32yzHQyAJ7gkU4lotnJZySiyjaFBqJfpkZLe+cz3szY6z5vswqymNZUpAVSzU49yf3B/aEOQaEZbhceodAW8Gu+Qx1jQokbtpEjaO4Jl7isf6bQHK61Vgl6UXLq50AmoNYo341Pwi8O7odHDy8185x9N74Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NFpZe6ZX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NFpZe6ZX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47df440fcd5so51671f8f.3
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616401; x=1784221201; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=;
        b=NFpZe6ZXE86RbCjWmQbHVyAn2bPvASQjlwi6YpP/ac/D8vBbjTT8EFnEeLbqPEWxom
         iPiC3BkMkx6Q/5wiOyx784gTTpFVAiPmIDIETOhEM27W2GLZbGUW6Ebt4HbGp+qWWyF1
         Zg0Bu0AIzfyvLNQG6DDo2NfFtffArMopUzS+JihFYvka3jg5BaTp/7UqhwL1Wpy8sazW
         /vWblpu7QOZFg17JjwbPBRPr6ZLgBnBWj9/0Yyz+VC7rZQ6/nhDtead/4BLDVa0QbQ3F
         MWBYPBgXZGgCz5Cy5QHUB3LXcE7dgCvQNMOo/YiqiIWsZ8GGRj3GUN01YqSDH0jSm/CR
         oF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616401; x=1784221201;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7xpiSqeInQmCCpQ2ynBS61txQNcQjjgq6PfjhT54YQ=;
        b=tNvv/kzKxCJC8juDfSD3mgkETkW6w5Y9A5AgxyRRLCvMFZrs4FZijOCW4zJI5/5R4r
         4lKEPS6BnAQsyIBVBPORUj11Al5s6HehF+xjJ8h+GxTvOsMg2RBfu0iUGuADSeLzBjIb
         wktOxS6+8MOkn7JXJ49l78sTTuPzsa9pnktMcwqUGpXFv46bVuMp9W0jIeC8i+23z4FW
         TlFQroGRvm7yZbQHo5CeIK6pREAQyy3KvZdt3pq7ZMhN3xc6HiZPIu55AgyFblmNgrgE
         BvS3Ye+l/InDnP0IJLq7xBfKuM+BGGgzAVoWfqyGaN31lhX8CKPkV9eYlRYi63ucIh/A
         QNTg==
X-Forwarded-Encrypted: i=1; AHgh+RoG1JzLzxlXJqIGo3MYNzPyBfTiXVUenneLvXk5CxgczfXqLCCoYOoLmBddYyks2u7P0Ys=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGUrVohyoI0VKZCt5imjoxQNVfDYGfjghnbD4hjLEwzAW2XzPL
	GQr6NRV6R3Dz7M66YMOzWYdsc+imDmP3NybK/B+Ia5v/b/o3P8AJ5CiMVQ5bh3fp8fc=
X-Gm-Gg: AfdE7cnj9zsgWHS37hZ2qtcuCefYdxFpGnzCfK78gUC/MLnSBFcaLyL9SyA84HVtxHB
	5hYMUghiNQwO3WS3JHGhmus9Ut4CsyAKzvzQiR6nJVwn/HYMyHqSeyvu1/ST2V0ZKQ7LKbY0do8
	Gso4BsG1N5sqKDQo1HrgIaTsvTNIXYvctvCdAFjuLT/jn+6uDLZH9NjmLGWv3ecldQh+ir4CSs3
	8pMM1RK4ZqFKSLBsspadq2L1Ks8LxoC/UtvMLppoI+V6XqUKW43kGrZgTVrobJ5yJ9kFNyY+3SP
	Wby2nj0y6PyDZO1g1rcAhVBlC9ixqH+yyjOdyaYRZJPhpEqE3i1+RjKSY/0xolI8REJtmf9q4E7
	XnzrbtP0+vxNy919sr3szgs3x0IYnHVWzzppYeo9onfz2E+SmRtTZSBGMS2QZhoRUBK306VLncA
	uF+6JHGpxleutov2MZjzIVVLpuvlx86cQmg51b8nuc225rt/hqqXumAQAAWWwEH5ctEj0D6T1BI
	QNZ
X-Received: by 2002:a05:6000:2909:b0:476:504f:7a8 with SMTP id ffacd0b85a97d-47df081e2c4mr8751545f8f.55.1783616400988;
        Thu, 09 Jul 2026 10:00:00 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e4d780csm53200632f8f.11.2026.07.09.10.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:00 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/23] mfd: bcm2835-pm: Remove member of struct bcm2835_pm that is only used locally
Date: Thu,  9 Jul 2026 18:58:20 +0200
Message-ID:  <5fdf1d0cc5a00e4a9aa68322bd2fca323b418dee.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1xIJ7j6GCqXs3V5UyxCknvTsa2XEwpXsBfO8oqhftBs=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiz/y0Zd0x5Ha5ybNiGfffOCbO6Tn2cvqXVeymujVd4W3 OSwSiesk9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJTPNg/19+K53lc2fqJpse V4Mg0/Boqe+O520iROe/q0g2dlcqFQm6kM9tcF1kJU+d/HGT0LW5Xf5dk94s8f+hG3bkjJ5KRkx A9qNnwaEHn6xgW515nnHzxGfBK6ZvDooRvFzQFrpR+NF2hx8u0+u6s1Pn3GX9XLzqpHX13bj48/ 3GLzX7xPewsPVcXvq/M8ZQ+bjX5L8NK/6JPJ33X7V3amvkhwuazjMVcvbkyIYE7+U1zHB6fe5nu cRnsWYbl4fSxuu0unbMme2xtFf6a7CX6+o0hnM6G4/knjnFd/hftX1uRKgxd7KK9w2Zoqiscy9W p7nv8zty/mNPkN0R94aEhrvvPl1kPPypuKxh7rdDOlqFAA==
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

