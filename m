Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8AE433BB1
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509409; cv=none; b=PMyBES4gu4pdQ3gNAtbDgSMYrB94dbzfYedZXjCpLxniQQMm+r1gs0sthL/HqX0KLuxczOhNN9AArbgB21ovod6RMkuSIp8Jp/C6OPXCiioK5SQ95fJLLTSISX+cXNXX68v+qW64UL6i76URT+YGHuMYW/hROtw3Ur1vMs6J8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509409; c=relaxed/simple;
	bh=RMStdZg/15uHp9XX3CRWrZzbzmqyNCoBwi5HiHoruCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kIYtcdoyZyHmF9YZ8LVprKy6ZszOiy9yko1nsOXBHvqMtw/onz9Q/3gynTjONt1eof9He89fk1irXmy6WvI8FlctW60JUY/o3Z5EclT/3XCIlhNRvh7UPomoMeEbzbtFXtXJW4h3coLGVKD2PByLZjSZiKU4J0EEFmD+IXyQPT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FXIY1gry; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FXIY1gry"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-472326ca506so370681f8f.2
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509404; x=1784114204; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=FXIY1gry475kzuWB1MYQ5j2PuaSLnyQKZantEZd3JY7fw/fM7RAhmtbtL5B2lViqLZ
         l7cGtFgZ4GXHFKpWDcMeo7nJM/WxxcdQUb+atXenb7UUVy5YKFJ6ngCkeucMY7Q5cNLq
         38jp43aTZ+11hqUcxqrD8evgMFl1FJHvTSe+rHUIE+23X6PZTv7Xp5/FPMuzRaQf7+eR
         5vqfrU+Xag6mVJBvLBXDMcBe5tDiYqw5pgeCbExuCqSrP57tS8p4bhQAflyXqKDf3SP4
         bX3WwSGxIv/AcSKSigwlLxzzSJ6fC1klrThRjVZPMP5nd815JUrJP3WZ1OHPjA9tPLwU
         MErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509404; x=1784114204;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=DfL5bbuC/05ZnI3K8lUPP0GVkVrngduPakFWeVZRTF8hcS3lPR62UrPs/LHX2vAMzW
         trr7bzSN4w+ajpMFYwYCmCQcM64Kz/z5Us7H50quHYwL5WFciLLhnbux1Jx2AZMuFg4v
         on65wM4Pzl1c5x8UXUbuLvozo7mIKsaD8kAP2P0FvsFC/yyesezVeOnZCSwEUGIGpDIB
         hyyMo2mXPDvjHltU9pwydxPqKs9EXMYl14X0wCgL+IEAIWqxqXR3xH0DwdhyNmwo8ctz
         PNmCrAcoRJxisFTdONMRT3G/TMDJc9G3p/bSlt0zHjGG5sK/CB995sX7CQ7zmaPL/oBd
         gHxg==
X-Forwarded-Encrypted: i=1; AHgh+RoPV5W2sh4cwbGzZ7KCbBCF1gM5gywlnBFxt1JmQ5fOQE2LaqG8T+yw/JEXGW4hynIMDIE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQt/kte1zjNxdHUDxLxg99f97gDxOboGTFKYalHIgxXTZUiuoZ
	J61ctZ2d3hW3vqZmRRwGJl6FnfO2ut+UnsbHmycw+eEkCuv7NVUtIPsu+zxyJTwojJs=
X-Gm-Gg: AfdE7cmjqC6iNxfa99IGsrriIl20wRhUtAuknCGov8vk/sfl6sGe8TRiP6Afi+jOyO+
	TYmLg08D2qN8AfuGUO7FpG5TphWsYebKnMkrmbWls2jX9WZVc1MQGHSSB/SnWY2x6FBqNk0nukw
	4iqzTqMVgQRWHuIKLvx/1He/VY+5G+UF+vCnU9MoZLq+McjiUu8dyz6iDdPQfnY/6cb42Iy7VCG
	2Y3df9W7bfvjec3C/XpLnK6UMNAcyjM47rZWwf6VP+cbWaBt62N7MwsCLxeBRbX/ijbAx4joAhF
	o82MY89g98Py1csr1ir+X8Dq4SRL6gyUhGQkFOtrHbnAtahFavVGw3AfzD8BMleSFQtt/bRzKTC
	TFF5/XW7Gg42pM/3panIN1oshM4i8tbab4OYef8WYWHT5ivcFuEmjCVWh6Dy639hrepOedmmrWO
	7y6HP98G2uba42NLq1CT+5QaLddi3M/K9HV9QGTaiO2pGILCtfluVRjZq0pR2YvRSID7yk5rMDF
	UAw
X-Received: by 2002:a05:6000:41fe:b0:473:3241:26a4 with SMTP id ffacd0b85a97d-47df071e158mr2025123f8f.12.1783509403913;
        Wed, 08 Jul 2026 04:16:43 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f2186bsm40991938f8f.36.2026.07.08.04.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 05/23] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Wed,  8 Jul 2026 13:15:12 +0200
Message-ID:  <f4ea197a16a6345018db79896ac9af4fa0567ac1.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RMStdZg/15uHp9XX3CRWrZzbzmqyNCoBwi5HiHoruCA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFKVe3Rk3+DT5D9qv2Ke/Xmv8u1/SSXaZ6sQ KvzRDDj37WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xSgAKCRCPgPtYfRL+ TrVTB/9U9NSx7cQnxDfiSL9uHTLoz+ZKQsJ9WOve4lpf0a3lxAHplLM93LtJHZvDEnioO68Beui D4qHHssA3c8cAIlbwOqfO/KS8wMt1mXGuipK6H6bK5uYV5G+9zdCZe2ZIIRc/QDgKs7RPuHz13f e4+5Xf7F3CgdYBLHCsmwxqlq4rFXX2OQqFNqKm+Qz4X8dlHDCVns0FrMPgjMn8zx8sSVJ37PNC6 lxrpFfJwxAGDkbedGWE1DPVl+RJGAhXbOOC5DyZqIyI8sbs14I69wN6O4ZarIBILvC0yQZkDTga xVuNjVWo8BWwvEZvfDbGDVyzggvFMFvndlS9/uw6frz9c6B8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index b9b1036c8ff4..254b00c905b7 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int __maybe_unused mt6360_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.55.0.11.g153666a7d9bb

