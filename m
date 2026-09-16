Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C101D511E62
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569422; cv=none; b=oqNZ24S4S4GU7I9H05jc8n1/iXFRq7o4Pf+5bzgj2pZKAuOpJIRL5xgRb9WwMMsWB16+wusHdMoLqOWJHNovSzJro86sXlIilwuEw4ebjsgo/PDGmm5iX48Eh3fQGGAVqXIhV4sN2+OlZXGrBUYapxCkia+FPjV9h8vdlwKemeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569422; c=relaxed/simple;
	bh=9VktpTC98V4MOQTaljcWhU8XsFF9PvnD33EIqxRl2hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CP/BhBZ9fHjCiP8BEV5p6Nhu0lTjUEFPDLzHNA0xoqaReh1w3yTDeOhB3uN2OYl9/HmgOo22sM3+Md4YRXM8riFfRBqrpbCXOqAlzbtDCRKmrCY6mXGfDoyPkWnoMLXCPLPkZuh9P67Qcqp+AIoTzRHdrrB7d/fj9jpmt/MyDmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ur1Ohw+H; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ur1Ohw+H"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1303620e87.0
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 07:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569419; x=1790174219; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G3Uyd4e8+1PGAxCMzU/ZkLPuNvoLPQoawhISwc8Gj7g=;
        b=Ur1Ohw+HI/RC+u4ig21WalI9KEU4QUbBVNv/Rm/bYinc0tjKjsEPqm9X37HueUwJZn
         Le5gcQd91yyd4hl/yYTMcqRkztcUbc5Yx4GOngGUkHk4CHyVmvgF6iQZelIqb5BkU2Rl
         APzwoMLm8eNpy4sEt7wmK6s7SQ894v4+g6Q3xEDojQf5PSPLtpod4n4RApd7bhuipkjC
         W2+My9tr3K7CBrsGk0f8ky4RF/m9JXIPaDl6ZrdBtqbmoWz2i2kXp4qu22hDGoLzc42X
         SM7L1jZJS6mtOak5FsdiT3ZZtiqCRZs6H/UtUCt6vJP2p216ZVNGtoZD2uDEaxIpIhOA
         heVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569419; x=1790174219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3Uyd4e8+1PGAxCMzU/ZkLPuNvoLPQoawhISwc8Gj7g=;
        b=WgTnlW3iI9Y1YNQVd95DlYtctZM48v2xOLrMOS1UwiFqGq8kZAkjraVHvQ/QSeCfDc
         pNdAdPazb6/x9aSMvEEjbVBGcwLioEQr9nh7V0lo27jd6WHO4QTb/Z9qgdMiwRbuG7Xu
         CLTkLZaKN4gtMtSJz6xA9aGiKqa78h+/HmRJMaCPKZRTDWQ0jovzQNpE3bNIKpqJdY5T
         grZn9uc/gkXawzKNUabjVdmh3gEfEET9ik6qihD21/TSnPr/fwKb7yV1HTOFT5wNAk1P
         bgiBCTc58Pn80IdQv9e9g5YYhwc5geuo59ZQcfuR2ZXkh4H8h2+/3Qd0/8BKtcMZdpx9
         21Vw==
X-Gm-Message-State: AFuF++kBlYJVLbY4eyCfCvQEskgOmnzwhOI7D1hAc7Qset62BAOvwf2Q
	glEJLYy6NzCGuN5HUBEf2ePJwcfNDeb7ZPr3ACrluBSvFA++pt2y3xE=
X-Gm-Gg: AYBFou1lF4FyMsRtdGZfkVs9dC2vRfmYt3FwGhcU05rLqPbewupKIv8EGXsCpXAmyN6
	4M155JbLuMEPSFVtNQ0VVPNV2KIZ+QYwGAblmrYQKSRJvcxNxSLmeYGCIYz8wFLWcvodlITeTah
	2i4j77wmRxmtTomElgmmzk/J1VHezWcQM+S4WXJDudOox2Sk6fn7jbhIOIUQTtp/axrLLDOIHoF
	zkN2lRddO3dbPWxGSSASK/qiEOpTg2vHupAzLl3Vu9EVtSAiz8Cv2DaHiDwU4OJ96cRE85eZ6om
	Yd0kXhLC0Ei83T3hRwTmOfSFD4MEluj0kWJYoHeaMtvi/RNMUMdBrjuoXJywLeVuZktJNaNcTlv
	KniBQYObUPvVAX/PdEejOTeS5632ktFwQDlw/xKDVpl+FzGLM+d9TyXnHVEDZc8WB6GqoFWXBkA
	DpmGE66EN/yeknIC/2gwW412slDvbCdKU9HY5vkx+cgKJMfUWlKGEJwZE5uZh+tAxAfPf8acbxe
	Kb1rcB6oRee15zqNkhZ+ia/N/HgN3GSDfY=
X-Received: by 2002:a05:6512:ad1:b0:5b3:e52:a005 with SMTP id 2adb3069b0e04-5b8b660cbf2mr909706e87.4.1789569418474;
        Wed, 16 Sep 2026 07:36:58 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:36:58 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 19:36:39 +0500
Subject: [PATCH v6 1/4] mfd: intel-lpss: Remove redundant DebugFS error
 check
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v6-1-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=9VktpTC98V4MOQTaljcWhU8XsFF9PvnD33EIqxRl2hQ=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmHJECu6BIf5JczQSxOe6N/toMW82BiZEQec
 r2/CONHONGJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqphwAKCRAT637qmaOf
 osamD/9+NoBFBakOk2sAxgWQkFQdhlBOMrx/fsvZDIwjd290Wn6s7uPoRNCWVw1nvVKd8ZwkTiu
 Cid4AjsPUz8hN6zU90pBJyCCWDQDdHZPORWWJtskwPL3mY9cMykt2A+lfzuywn3jRyb4v1tIUly
 8w6Ji358l4L18wXsx44YfVI05SM1g3w1oFPg3AAYCOetXqxr7M+wR0C2LLxBBbLheg3K0ixhFB4
 w4WymQ0Y0Xq9/Q9eaq5dt0ed25OM4i7UtQ+8x7X9k4Us+oGp0ESFEoOWXJdBxh4UXpkRmEnepOj
 BAH34xAf8BU/4ZuGCOQgVgQ+mWdxFl973Y5n7GzEv6ierzT0ZU5a6o18ZlBvl8lDaHVP1hdIPfW
 SlyZ++M0rUOGPQG3L+RrLr12ZenmxZT35xy5UmFrzZByUDCcV3bOdUt7xI/ink6uBlrdWTtC3we
 IE1hCKo4U2RJ9MqNqflFScx4or7D5H4+NaXY2doRSa8Sg4TYOGKSpO8EFcYwA3GvfcSrPI4VdoP
 wxQPRd8/mmItCgHxRztCTAZH4nvkx4jDj8IIZIcrodBJCDItfLClTGkRh4zEk8/RYTpoeXZDt9r
 FchPsRWj78CMq/MoDiOO+ve8uLeBix2DW2huro1B4RFH4ghY6054uP8W0E6wAz4VZeoxSJ1Txwd
 fSi8UOuKwG2iHIQ==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

The DebugFS API is designed to handle errors gracefully.
Any explicit checking on return values is considered an anti-pattern.

This patch removes unnecessary error checking and converts
intel_lpss_debugfs_add() into a void function.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 63d6694f71457b2e09d238af0a9bfb897a169a64..b6958e99cf54d3c8eeca1ba38055a9389678f6c3 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -142,13 +142,11 @@ static void intel_lpss_cache_ltr(struct intel_lpss *lpss)
 	lpss->idle_ltr = readl(lpss->priv + LPSS_PRIV_IDLELTR);
 }
 
-static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
+static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 {
 	struct dentry *dir;
 
 	dir = debugfs_create_dir(dev_name(lpss->dev), intel_lpss_debugfs);
-	if (IS_ERR(dir))
-		return PTR_ERR(dir);
 
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
@@ -158,7 +156,6 @@ static int intel_lpss_debugfs_add(struct intel_lpss *lpss)
 	debugfs_create_x32("idle_ltr", S_IRUGO, dir, &lpss->idle_ltr);
 
 	lpss->debugfs = dir;
-	return 0;
 }
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
@@ -432,10 +429,7 @@ int intel_lpss_probe(struct device *dev,
 		goto err_clk_register;
 
 	intel_lpss_ltr_expose(lpss);
-
-	ret = intel_lpss_debugfs_add(lpss);
-	if (ret)
-		dev_warn(dev, "Failed to create debugfs entries\n");
+	intel_lpss_debugfs_add(lpss);
 
 	if (intel_lpss_has_idma(lpss)) {
 		ret = mfd_add_devices(dev, lpss->devid, &intel_lpss_idma64_cell,

-- 
2.47.3

