Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095676;
	b=GmudFNxF3roB3tJ6QbTlfbBn/lp9E28whz31H/XZ2DIYhBd6pJ3eR2H8Sr/fsn+Usbwp
	 zNjTGt5mre+/3G5WYgXT5Q2AJxlR2jhIDJ129aP8yXJIHeFcrLJERGtwxrSbTTzkiXfka
	 1go8H9M0m98tKtaLArw2gAYhQXhrAFnp6SGwW58f6g9Oi1tNVekg8fv9KQND3/wRp+fHZ
	 CEMf2kQ+4g+gBCRytG+ufSHt85Rr6OhzekMUz20hZgkpPEJtSinLnhY1O9K4rDhfKQkYL
	 4dkkw3RctzvdwosWRhHK6h7M8yEF3sRym7Gstpg3ACGVXEO5amn1u03qnpbcd87c0Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4c0G4YZiEJEesEvJcSiHJ7KCJftI/dPzJGtmeIgLqHA=;
	b=oqleAASnw8d8eS1QCVZALocmagTm/1gSFGhVHxkeLWIirJt/nnFdjt9oxcLCiCPBSJuW
	 UNZRW5ppOmxy4Cr8/kA+IRiIBO7mFJ3KJhWMKYYBNQEC8V+vjr9l8nhzuz6g2jvhVk22r
	 GcsPDpb5Bq3Uiv9B0uPnbWiwjgrlob86nRDCACCcmfI/0QZHvVUnE1SQQQPU3AlAb89+j
	 D9RjjxhM/ig+8DSF282uItmUUXyZXpU0ALQyhzTsco/owrwCGCTEVVH0xlkq/mDE4HS5r
	 MyGJuOqqRCkCVxlLtHiazklBNfnAEysniqLgCQhINW9mCLD0jPpXToWQteGku5M2kcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfWlR86j;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A6606A334
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 13:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705A6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfWlR86j
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9906870a9baso1118177241.0
        for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 05:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095674; x=1795700474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c0G4YZiEJEesEvJcSiHJ7KCJftI/dPzJGtmeIgLqHA=;
        b=cfWlR86jkEmxkM1a8hHbu3eYtSsKGjJQHaKjGhQWtO7FqdCSZ2UxiKT3QOOCehVxxC
         /BWywjaxsUVrE1Dbsov60qLC7QPGr46ylmOFOjHuO+NAAcrPh8Z64SHcVkAUyYhG52DF
         j52SNXUpvntSleu5FLpBggFamesVEWx2jFgnwh9yx+yu8qbNmn5GGlCKXdWbyNiAohqh
         wJLHJs/7v8pU8pMmZQ+duGWz/+EjsglRJBVRTsocEZnmuMVPpuDmCQ//RNm8Uf7n8bTX
         DFA0Llq6cJtJB8h3af++n8vz5Ju4G89i6bQOIu69wCQvXul2ZkI8UWddeNNaxbDtCLsg
         /igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095674; x=1795700474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c0G4YZiEJEesEvJcSiHJ7KCJftI/dPzJGtmeIgLqHA=;
        b=WnGNcBq5ZUNpqJ5+TvwF+39mx60GwnWeJFoL6TAHuMVOPVDhQbzxCXNdnh/0nMZmD9
         oFH+sgw57IMdj+y5/dlPE38r6oNeF9NDwV9TsyLi+moNd4uK6Y9Z7sO+PXZp3hm82AQO
         J3WCYUk/MfhX3MaFxyBSUKeLnM6CwN571CbB7pS/0MUc5oxeaTxStWdoskgc1zX+UBSx
         NcGKGxa+yukohPsrRfmoQ3EAHQcmvVSJ1DJYnhynQpILf3bUAz8yr/wqqdYLKrweRDoG
         wF5FLehp43O0r4iL67UtbC3slswu6n6E3B2Qjbl6hw4cIM0TnChDvHFo/TmmVgTex3F9
         K7UQ==
X-Forwarded-Encrypted: i=1; AL+hErGH7ypaHh30Cu0ZC7N5J8kptZWorRtkcaiZJawttYCZ9PygfcEyxb/GiuGqcEBo8tgbyjQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9VgwjLzjtJE5YQGbcZl3OJ8MrF74uxP2CXzm54NKFdesdGZD+d
	rLV9dmeCDMdMWCFXp93Rrt/qt5uFRYxYr+ZpgEVq4dSzFFWCT56BWWKE
X-Gm-Gg: AYBFou2x/yaqufPRd2W7W7Yq3W2JtghQHMBVwoCgHylDvQxoMF1Kgf0SHOxNWDKTb1D
	r9sJkEYXimA8AUEnG0FZHeWy7JTa+zAlUdjpZBRoIC9oginQ3FwpYd+2yDIfcnfgGKfBx/X0SQz
	K2x8sqo8IQn/eYRHb6q8vbAguuBkzJLhQHOMHGF2uPjPM1SoibHQ4Tpi6f4eqJJLMictqy8JpU8
	Wmhx0HDIXo8G+hHddoEphSrfBn38fka93nuY3zcqhAng71ODrX6MONHRIOjlrY9XvV+IxWpWpb4
	u/nzil46+TPnefNEjpjQvASLvLAbo1M+DVSk155QCuPSvgTqK2cRrI+5KQZ+EtVv+F+6XQdh4ZM
	cGENxYT0GP7Zs5Sj+8K/CNUaUanormtmtU9v+SWrfuGBqqVY2jEX58PLikdl6Jf0+h6tQHzb4t/
	lQ0Oy4/MqcF8Kyz8QfeaH32X1g7mhmoIZHQHAJ4kXRE+EVl+7p5aXHJcQHmP0XL/QPatzy0FAug
	ahreIqF7uM7N8CnucgWWroMxC0usujc/LAP97Q81VBV9XFoHtLZMC4nv/FbxbDV3APpwX7pFNnN
	RZIhfCXTS1vC3qHuRlkJ8Jc12RHGzouUuWfesstbxj46OpkhMNxDPgPVYG244YGryONrbzkISBr
	OmUfHWotIDHlt1PIWMhI=
X-Received: by 2002:a05:6102:2c8d:b0:7d6:49a9:fa61 with SMTP id ada2fe7eead31-7d6ba435c6bmr2530171137.15.1795095673999;
        Thu, 19 Nov 2026 05:41:13 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:f40:91:660f:4d51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a240ac5sm4134862241.7.2026.11.19.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:13 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	crofts@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v5 4/4] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Date: Thu, 19 Nov 2026 10:40:41 -0300
Message-ID: <20261119134041.16611-4-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134041.16611-1-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LRADC clock is acquired with a managed helper but enabled and
disabled manually.

Acquire the LRADC clock with devm_clk_get_enabled() instead of a bare
devm_clk_get() followed by a manual clk_prepare_enable(), so it is
prepared/enabled for the device lifetime and released on unbind.

This conversion makes the code simpler.

Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v4:
- None.

 drivers/mfd/mxs-lradc.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index aa55f88399ef..c3dd2d80e7f1 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -160,17 +160,10 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);
 
-	lradc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(lradc->clk)) {
-		dev_err(dev, "Failed to get the delay unit clock\n");
-		return PTR_ERR(lradc->clk);
-	}
-
-	ret = clk_prepare_enable(lradc->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable the delay unit clock\n");
-		return ret;
-	}
+	lradc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(lradc->clk))
+		return dev_err_probe(dev, PTR_ERR(lradc->clk),
+				     "Failed to get and enable the delay unit clock\n");
 
 	ret = of_property_read_u32(node, "fsl,lradc-touchscreen-wires",
 					 &ts_wires);
@@ -193,8 +186,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"Unsupported number of touchscreen wires (%d)\n"
 				, ts_wires);
-			ret = -EINVAL;
-			goto err_clk;
+			return -EINVAL;
 		}
 	} else {
 		lradc->buffer_vchans = BUFFER_VCHANS_ALL;
@@ -204,29 +196,17 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 
 	ret = mxs_lradc_get_irqs(pdev, lradc, data);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	num_cells = lradc->touchscreen_wire ? ARRAY_SIZE(mxs_lradc_cells) : 1;
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				   mxs_lradc_cells, num_cells, NULL, 0, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to add subdevices\n");
-		goto err_clk;
+		return ret;
 	}
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(lradc->clk);
-
-	return ret;
-}
-
-static void mxs_lradc_remove(struct platform_device *pdev)
-{
-	struct mxs_lradc *lradc = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(lradc->clk);
 }
 
 static struct platform_driver mxs_lradc_driver = {
@@ -235,7 +215,6 @@ static struct platform_driver mxs_lradc_driver = {
 		.of_match_table = mxs_lradc_dt_ids,
 	},
 	.probe = mxs_lradc_probe,
-	.remove = mxs_lradc_remove,
 };
 module_platform_driver(mxs_lradc_driver);
 
-- 
2.43.0

