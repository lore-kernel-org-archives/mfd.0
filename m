Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC01A3DE423
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524694; cv=none; b=myntCjfC32m4tNmPztqbrowMERoTpQjYr0y1/h7+J3+WLdY1p48ZbRnTuntooZDig/+uiLqNl4Ug3vl9OuK2qxf+BcjTNmk89v82Hh6WvgoJpvcf1XdCLcu4JqpZ9fK8Va4O85zCKR/kBm4O06IZM/3d/NbW77fFK4cvn26rrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524694; c=relaxed/simple;
	bh=LUJoAfm8d9DBAnqMkyJ1+9asGnatYQIAciuxSlDdENQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTCW6VeAyY7o/ybHNWlO6cnbeUQEXvqdhcPiefDIBeuCOfn1y6kCOUz2x8Mbzz/rKHgXV6zEiHvNJI3xcOuhfhxxU4V/3XYY2UDLxhzxU9fD/TFVBszprrJ7szTga3jHgBDD/V985vmyZdo9NTuHKKu1xQ8C+rL/XNqnTuVQrWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPKVRnzh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPKVRnzh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so4716105e9.3
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524690; x=1791129490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=RPKVRnzhHQWFaoNYU75Wk6hpPsy0FSsbsJGkcKJZO42uzkojSc+AY2VWIhzQGdgqAY
         qfuRIvcJwOjUyEV7Tz0X8ZpIwhyuRQronj/aKdFn0vcIgTWoXPzemGjm33xLzPObVnGk
         yFs2SGLYoLtH5dY3WzbTUlSmCT/tbqyhhFcKWZq9luurcq+0lOc6SsW8va0PTBzf2Lls
         96Ou+ASI+N9W3mub+u/mYs27YupSicK6VNsG+zoppNjTpcR14aWHq+32dkePBZtFPYql
         Mo27Dp8fTRnnr7XYRqhBq4K01c/nA1rHOVMrlR+FINHwuRGUU7IKZUIE0KTRa1uFbuHS
         lxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524690; x=1791129490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=VQR5x9/ixnUq8Hb+Is6C3ZJvxrRDpPH8dA2M0rWhzcb8gCA96uLEsDUxeTpNjBCMLu
         GT99WHD+3P0xWL4vjtyP7oZF26amzaCJrOF3yeUtRi0e7JTU4Ys4VUEZum0pJjvBVGEZ
         2gSsMs11/5tfj8BcoOVEVRb1f6Cx8DYzrVhZFPkW6b1ebMC+mjLzaC6Ex0EDocq2Nz8s
         rDL8/vxT0g0LE4RXYzMprwzEPAwWkIrp7Xd5fQEYQOfLk3DOE7temNvBTh1PGFnGedFP
         6ZKbR9R4CcJ50+ApLmICZV3qT7dIqIwqvl2uG1sLQ4Pqgfs0FOp1cFXylITmUIZoNlCt
         rotg==
X-Forwarded-Encrypted: i=1; AKwUvBwPA1wa+FZ8+ovo/1OudqnoGopeQe2p0JNGCUswTzYG9+dPkUlMX56Mw164I7pl7nr6DxE=@lists.linux.dev
X-Gm-Message-State: AFuF++mTBZv+PdCa8nrxP4XRh/Yi8JTEbeSb/hG6wY8j0ttETAGvxshG
	psP+1quEBk6phGyjBG6LZVzZVcvouw79ED9DRQg7WbqvlwCOLouBmFRj
X-Gm-Gg: AYBFou29UXFky+wgGUMawCHaKU0+4zyaoShW+6WAsYfV075WzZj0vBjeY81tpT/FyjY
	0Cfa+rzQQKZsNZ2kU//U/UjvK2Wxj+R3mTae+crVCYYWS6JyQXqR/imZYBRnkdZpxU6ydoo2kmi
	0Qdq/WwbCrFoC1BZW0ruv+Np8vOFqQMdttDcUwTlSLNuBXK9rKEBZ1fS1HDXxDrKaykN7Z97KB0
	gv6FH0xSbCq5J8rpsd8cfkmTzet7QZOGiu9wQCnF4VcS1gwfJ0Fh/CzYI6Eg1YSsglke0GLn18t
	+n/3rNzgA3psL1z4WPd6dLgzyl2P35JG1zdh//I3CY008OVuO2UHnvv1g/lLLWPq7Ce79bml44/
	uQWyl1u14PsZwDhcdnOatZTie9OL2kq7XJIkvX6/xxvCf8yUty1dnnwtrTUj98jycKfjIIjK9Ox
	eDJILzVHH+17IkOQqTZAbUSaH24wzEiCj+en6+ZejqeP963OHLP1Kljc+bkIFNXcGH2yYSLLJ5D
	I+M80EkIqdhx8AhdLZcwT5mayp3nw==
X-Received: by 2002:a05:600c:4e52:b0:49f:e238:e7cb with SMTP id 5b1f17b1804b1-49fe7bc4a41mr172233425e9.29.1790524689940;
        Sun, 27 Sep 2026 08:58:09 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018dd5easm66708625e9.3.2026.09.27.08.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:58:09 -0700 (PDT)
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
Subject: [PATCH v1 2/3] mfd: max8907: Remove platform_data based probing
Date: Sun, 27 Sep 2026 18:57:43 +0300
Message-ID: <20260927155745.187758-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927155745.187758-1-clamor95@gmail.com>
References: <20260927155745.187758-1-clamor95@gmail.com>
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

