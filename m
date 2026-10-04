Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5083CF043
	for <mfd@lists.linux.dev>; Sun,  4 Oct 2026 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132367; cv=none; b=nxA1jg2bzjICRWmPrkitEh5+4ONgJMTJLFzJI1VFLaG4OORQnhTHIqeLGmwIilArMvncx2/SWad1UR/2TEICTOiJXcv7SJraqMoG6G1HZ+J65Btl1pAtqpaFAOzfI1/DgZgC9LIip5UAZ/TcQhRKRqW+ORtMixuGGdl4zCjnm78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132367; c=relaxed/simple;
	bh=LUJoAfm8d9DBAnqMkyJ1+9asGnatYQIAciuxSlDdENQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGEKaxscoPdkgcp6TTl6b0ORuEhTn67yKkOTKqr5uABPgI6YMqLqyIZvH8E5bngbodR8FPhWOb2QHldGmGEsc8+ZvVA7gjpZ05TlrwIqByvCbp/qTHwbRPo42g7PQOchIC5neaL5LP61NWgvvVcw+DnYqjCrmclv3MRWl10dqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7JRzww0; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7JRzww0"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so463329f8f.3
        for <mfd@lists.linux.dev>; Sun, 04 Oct 2026 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132364; x=1791737164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=J7JRzww0mtiHhVaCTWa62G8k/ivThOzaSaDfp3ajSPL5OvTtM4gaeuNNzofh1fu8Rb
         aMj/MoKXNHgno149A3/M0dEAxHRPJMY1BzKWyUE42GM3WYA2Z8vvq4EhgZ+3a2sYLIhm
         TtYOnB3+0/4dccA7tkPXrdQQNd0cWUHjyEADYXE9khyduQWkLr3l3siOs9z9hxlxDFzF
         q/IEGhm1L+ux2gp0zVmGL9EZLYcPLY21NuQyMs0FODGEIFz8Z2RWG827XUaMvfbhnfgk
         7F7ayx4std/5z8MifOkifFEl/JLDtFvc5hqvjw8SJFrlmLBgLiyjKvdnHr2jA11Tm5t5
         2GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132364; x=1791737164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=LRFhU3gw6h1Qo8FalUmQ/tx3LSZclLdY/2FtJ0H+Gbb/QpG460M/PIaJ4PcIXVlGvA
         tL45/GdpUX7eY2rg1TEDkXclY9gCdXyQBIkLVH25Uq3iH9nbVt3jc1tqxO8hoenI8MfC
         lrhuI99iTVOy5aZJY75VkrfB+OP3MrpH130f6yeZNz4nvCeHSfthg2KUFaeN08/mmgAc
         Pw4O6JdTa3qfGL3brn7WompD/7mPYh3C0Eew91g0AliUjHIQXJ3ramrKuHKHHBqcJTjy
         LT+XKZsAV0huW1LwoRC6KtRQe2sju0isr3c143FP26hWsVg/Z27JSCuSCfgv/yDKBHch
         lLfg==
X-Forwarded-Encrypted: i=1; AKwUvBzBeeBhAQE20F4rl/fYnquSmn3ameQOItpxfI423ETb0U9kkveKKz8Q8dV4f3FEmIOWFWc=@lists.linux.dev
X-Gm-Message-State: AFq9FYL2QhuOQuQhGWlJDP3Q1roOUXx3LcMyfSfZBG5XVg9Nz25JyuMt
	LlPo2N+jh+CpNagGG0fHw+N/QB45hT/Wf6tUOtqYS+8/y32fmWLjSeu2
X-Gm-Gg: AYBFou1eVdGN3+ZdvgATnqY0IvIUV+/Cij/B9rbwzEQKxCo4+Pg8h6HR3mprukmNFB1
	fLA+x14E6GeLSv7sdY1YFkob5Y7IXJLigJH/0A/nrYixGaKogSEbBoPIvmcOq7mpFwAwMNZ4VtO
	E/fcxljtPBbh0ZepmOf/cYQ1G48lHu75BvcKxiWTCj0bG7CPJntyriuYoIizGe9o+MnNbubc/Nx
	49Kg9s/hhYfxEKMSOwgHL9OYDt8d+3Gt5woMIOe12lKB+TsdkkZmEcnsGEi0V8tF83XH1bC8s0E
	MoLzazkvxfAs3KFZMS9uD5QnBiEDKQhbXL/aN4E6KCZq+1Agp/XtxjG6GfAKrQ54HE0f2wkQU5j
	Fm1ij2rgqVNV48pkr09rUibD90EG84C0quVTY8eQuHppqYB0vrJeYX0uqACy0VTo5/uMy1dYhNv
	MmoKgX2t8QMlf6GRsxDFU8sPMupSeW+HRI65c28XjADYkbbqo/sk2k6HaM1px2T/+u9EKAi4vrH
	2LVDgGuoMOr21nxq7o=
X-Received: by 2002:a05:6000:18a8:b0:487:57d:18e4 with SMTP id ffacd0b85a97d-48b1276ad48mr14676290f8f.41.1791132364197;
        Sun, 04 Oct 2026 09:46:04 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm21801435f8f.13.2026.10.04.09.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:46:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 2/3] mfd: max8907: Remove platform_data based probing
Date: Sun,  4 Oct 2026 19:45:39 +0300
Message-ID: <20261004164540.198446-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164540.198446-1-clamor95@gmail.com>
References: <20261004164540.198446-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 | 8 +-------
 drivers/regulator/max8907-regulator.c | 8 +++-----
 include/linux/mfd/max8907.h           | 5 -----
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 7bac1d6517717..363ac80c0593b 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -184,13 +184,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	struct max8907_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	bool pm_off = false;
-
-	if (pdata)
-		pm_off = pdata->pm_off;
-	else if (i2c->dev.of_node)
-		pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(i2c->dev.of_node,
 					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index e59aa7a3ee546..907ed3fca5e97 100644
--- a/drivers/regulator/max8907-regulator.c
+++ b/drivers/regulator/max8907-regulator.c
@@ -274,7 +274,6 @@ static inline struct device_node *match_of_node(int index)
 static int max8907_regulator_probe(struct platform_device *pdev)
 {
 	struct max8907 *max8907 = dev_get_drvdata(pdev->dev.parent);
-	struct max8907_platform_data *pdata = dev_get_platdata(max8907->dev);
 	int ret;
 	struct max8907_regulator *pmic;
 	unsigned int val;
@@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		struct regulator_dev *rdev;
 
 		config.dev = pdev->dev.parent;
-		if (pdata)
-			idata = pdata->init_data[i];
-		else
-			idata = match_init_data(i);
+
+		idata = match_init_data(i);
+
 		config.init_data = idata;
 		config.driver_data = pmic;
 		config.regmap = max8907->regmap_gen;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 4be3c2370e2a4..e222250f0cc1e 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -227,11 +227,6 @@ enum {
 	MAX8907_IRQ_RTC_ALARM0,
 };
 
-struct max8907_platform_data {
-	struct regulator_init_data *init_data[MAX8907_NUM_REGULATORS];
-	bool pm_off;
-};
-
 struct regmap_irq_chips_data;
 
 struct max8907 {
-- 
2.53.0

