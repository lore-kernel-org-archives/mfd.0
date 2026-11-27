Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802852;
	b=3eRCdjy4mtIFYivFLQDCmdc3AG+9dXRlJRxBmgOqTRLPBsSNHVEBz+fE6ommpwPfIsPs
	 NYUmpGmdiIVT5w605kmi2HLiNXH2JQGVfowt5UHG3TuLNRwUWBhCQVBa2y+a9vvK+8u6L
	 M5yanCQqAH4LlxXOq1JsQ31KucC5hfaBYTqLWursa4YstT4mIYeCoI97WD+r+Sx1zcIXh
	 ZskFUoD4ovoyJ/sKEBEXL4Icy98Pfm7sj9mVm2ErLtZ0Hrm4YSEllRPKOVyElNyAQ33Cs
	 4nhMYNAHf1AHmSGcGi1R7ubdbg4beoTIhljzSt73Mecl6Ht/uTM3xRysoNhwuAbZRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FtPlK5CQKt8igbcY+UOchey7QbaopvckYCnGVzWNupE=;
	b=vU5j+cC2y33tmuHsb9igKZ8EXGowP4G6I6MLm2x4pePXvHT1+oKLnXjtKpcWNtOAsItw
	 runccrpKgw5yRcdDmq9Pql9gT9l6w4pmuzl6Rbh4hSSEtDsq31AFbgBSVhcBzeW9wx1Ci
	 tPjF3lsZcVnlZTFfSXeyv12TxNkwCR8gf/EkNhkZfKkNXVO4J6ZeRN1mNwMzVe8ouCp73
	 oevLqojFlr2z+zhJZaXoe6BVz/fd4jLk9wNBi/QWXsNk42fwmMu4o3/fVXClSbQv9aD8s
	 Crgc78qcit1Rq9zBNnb9NKaThUdA/FH4Ml0udMq9Ecoir/CBc2YDNK7vvZ6JdsWM5ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Da/7PkYw";
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5874606A691
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 18:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5874606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Da/7PkYw
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so2688793137.1
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 10:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802851; x=1796407651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FtPlK5CQKt8igbcY+UOchey7QbaopvckYCnGVzWNupE=;
        b=Da/7PkYw758ab3SqBMf7bTlvmWIqqq/+LLQ81Ssxy12EfzfZ0ihpoC53Q+bBCoKmIr
         KcEVina+UM/T+sk68kpV3s6wi2YZ3sQZNFGr/A3gXykRGGAD0MgOEslonSbHQMiAyn88
         b1hwdnqPloLOxMWOGyNmryRwa5r2bTs7eNluMlxmqgyxY6PjNKXvC5Ya7mrVdoAnON4v
         b6HN14DP45LucSxZXtnk/Is6TSUd//1EwtRn4hc36GEHd86bQCMcRvwT/h609XqxzhdL
         Gw3rUAuREGa5rUd8YU9gK9ubNmRKXryGKaPdD7m4hcYoHX+HBCxIDLjpSbLymXKhT+BL
         4ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802851; x=1796407651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FtPlK5CQKt8igbcY+UOchey7QbaopvckYCnGVzWNupE=;
        b=n/UYNxUR2FzJMht47Bp0t7JPm7cGyGAZxB6DK7OAavBFtTl7T50lArib8oSwKWlOcC
         2utH9i63hrFSvjUX6h7l0URcvBOv5rqoE0kgs6vjtvWDIgj4UHh5VMX918tGz/vQFcE7
         620YkmMssBiFatQhlx4WGftwNnzUUhpG07ewtUWjyA/qa1aOr6aCKh/6FY0g1QZgcXVV
         Ji1JcVn1oez/6DhYtw7diuO12NZWUpbPi0TYvCzRHWTVDJNBBdHR9EDgFMu38LplyMU6
         /DrKTyS2S+sMsSyCBSULTOPyZarq9rNqdpxJEjqHcXAtSPVl2nOGsoalfmjUpFAMR4Z5
         yqqw==
X-Forwarded-Encrypted: i=1; AL+hErEXQgnqL3gcNGgjPHFqq3IlMoVrg37t4WsTYooaHkjO26gdOb0gte6qAyZJ0kCX+L+Yis8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/y4/Dicp4qoqiqGU3/j9VrsOwsfOd1RwL87BvnkSWFi7Do0H21
	GniFPItoxMGw8HA+gjlr0grmxa2EA7C55Iu7/oeap78U9h8jyskPI1TbZp3nug==
X-Gm-Gg: AZFdTZcj3eL3Cek4iRcxAhbNwDcED/CmKSGENjKLq3CIP+orU0ro1m6Z1a9AX4apL8M
	9klm3aEsDs9lZWYoO/5UOJoAb5ScM1F7bPsRNlPQjm0f8PLL4Rx1bghvlCWiz9EGsDlxJ4csnOt
	VOi+wRz0hGaEbNo+/loR39lWFNZeaBuFuy0Ml0vqUqW0Y0vFsI4fa1BTlG9X7cV+LE/Xex9w9wI
	zTldvgcordoJFDmJcW0XYtJEEgzjBA/4J80Y5C3dkVM15UkwSV36UNBx5eA9Kgfw0d37UAKImc1
	A1aXGLDfycaaILN9EbRZx03SSIqreL+g4Ws7QMdKQWZ/VDHGR0Z1bs979AxPgaJOr/Eazn9V3/F
	K8HIQsSvfxzA6/CJdmvZr2O93dGQI4AbJpIl2PdkGsPE8SqswLUDMuTLqe7msPFpDDIudvUOqOD
	hyswSMXJyj9THAYWoUEL/fm3sid96NjFb8be/JpMk5dFcpK8IgSsu8X4j3e0gSrmYshifFSiKmL
	xwxk1oP3Qts65QeXjZYTGkagwLqhy2MLws2HTs9uAh9Kx1YHDzKfgKBucafz/2T7KZTTaGwhzWe
	Lteco4Qv98hnyqanix63EDg967rp8pPVwCYuIGd4sum0bO8qtHLBzNf8laRh+3Ix6MRKYaOmuVC
	Z0X89EaIGpbJv2ORN/8piDEub4RM+wHO4QWkJICU7K9gHVg==
X-Received: by 2002:a05:6102:f86:b0:7d6:5e38:3418 with SMTP id ada2fe7eead31-7d72b361662mr12116275137.1.1795802850643;
        Fri, 27 Nov 2026 10:07:30 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a800:1256:3c75:eb0d:7d97:e4f8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8219b2esm26087020137.9.2026.11.27.10.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:30 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: jic23@kernel.org,
	andy@kernel.org,
	mfd@lists.linux.dev,
	imx@lists.linux.dev,
	Frank.Li@nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v6 2/2] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Date: Fri, 27 Nov 2026 15:07:09 -0300
Message-ID: <20261127180709.315826-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127180709.315826-1-festevam@gmail.com>
References: <20261127180709.315826-1-festevam@gmail.com>
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
Changes since v5:
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

