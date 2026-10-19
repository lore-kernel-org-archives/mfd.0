Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F41E4CEE4D
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405086; cv=none; b=ZpqYV/U6ZKnZFPUWSArAYotvVQFZe1XqxqQR8uLm1KyohIxWjORNQ5nyCfpGyF2yvsrFWRj6l1KTbVqcRbQpdyHynUov/EmZKbtLJje5Oa1v8G04XdReMitlGplkH6dPY45Xh6qlW4ybUNoA3wV98XL0+kvsmgF7Qwz7ITVMoho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405086; c=relaxed/simple;
	bh=G8WQk7o1DoIkcj/cwqNdwxo9i1kF78La7EvD0bsoIxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J91XQ4h4DRkvSU36PSoekTa5g0hpeUPp3VTsvCiC2Ktnq1ROf/sspbHXBJl/0Tv+/6rnFQoiNALIZ5l961mTtOzK4u45NdOkUEKxT7dL0ts2RMhX8Oo+PHLpbb/C3kzdf3TqKfqEPDtPqCbJxBBIabtEDjJZdnccXL5uMwF/oYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rw1qvgfX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rw1qvgfX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso939504f8f.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405083; x=1793009883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=Rw1qvgfX5uBwWAxQ18/iYiEFAWBRRT7MV57B4Zk2bZ736pn3GvBDi2mKEuT0uaSy8U
         9gxdOYCSIiS1mZVWMBfYzk12/b7Rqh3fabL8gYWeL1bvnZkuqKBplivzC1DVK0pkMH2A
         sPwf7NK7Cv7l5HBg1+q/MJPmgz8mgsSxiKh+9V3ru0mS2NAwSTEC/YC4G6ILWqR8PDGG
         u1PrZDl27Ei0rOG5uSyDJdSUeUpTcaRj0yGNh/DYgVUHaG+Q8TLvnc1wKN2NzBbh+mda
         iTaxXTb3bvjl1pFRk1WtnLxEfMCdzaP3eYgmLwkncho39ev+wlkJ9tqVLKClKD92w+EW
         DcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405083; x=1793009883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=rZuL5sJURASHXYRc6FixCiB+kEmTGkVM2iGxvjzfZjQ54GIm4bie8NPOYrO8ZlDN3Q
         8rrxy4w3CTGMiZzrn9snpXrM0yRyfhduzo7Y2QPD+QEcpcB7oQ0yDvoZB/lGsiHcNDyL
         HbBu6m4LxmHKm6atsGV+j91UZas1DG5oWg2OfTNxN2XZKa+gckXqBHJg4ee1ulZAj1EH
         Xc8KeGb7ONvjqmNpDS/nxFs0gMB7teWby47GbtWKnPBX83Bx0BQyJzsd5FaBc3MRYU7K
         UITPVRRya0pc6+KORXRsxmdtsnTXGMrrz3HIS3G9g8gFXVjv3lpeLc65cGNgsNSjQWPd
         +BlA==
X-Forwarded-Encrypted: i=1; AKwUvBwddFhTgDH/duELMEHDdXQEEG1x61gjdAkt5c1YkXJvhuT6CjIn1rB1ux2fjRboCSGTjYY=@lists.linux.dev
X-Gm-Message-State: AFq9FYLJpIqJHciGCKpnre1+DSet+khTPEOfXlcBYemp81wQEwQ2BBQC
	zVNnChZK/o6Dv/m+DPB+61i+uRrjuw6E5CMfTEnfQpZfUUxD0p2pbNyf
X-Gm-Gg: AYBFou1tP3/5HU1qcmzgcgV6SYm/q0Mp+c5fRZh+H0F/tefTm7nXct/49Kg/7qRZzUq
	YL7lr3NItWSTuQHHYhxd9NvUakGlOXzHBNFCaEcA7/bI+oN0WQCW7AFucz8l3wplo1jEkqEGlLz
	yUoCBnr07k8aowWJ9Yryy/dY4XyCXzmI75y0YfZTryGYuIcg14UH/fCHSHgAcv3jAoPCMfjd1GQ
	Dee31d84n4k23hpf0xwNbIbc2gsTFvMKdN516cQ31gzoaWb913gG1iRqNuxerdOptk5oNeDdhV9
	xngdK8rHkhVO89gx/Xo+q1KYhbqrL0vnjb0XvZUQwOtlq5Qy/KWPn36gYlgsYi95H+plSe76JN8
	vYUosLp7N6N9VMf0kehQsKBvOeM6WoOg80T9RgiqfB1KT6B/NDpwwGIhRVwke1zy4pbWhXgndum
	W9mU2ZSKxEZpOMkoMa4eF4dFwTUP5McbOLu3+PPZXHbcYuKjjY28P2kCw4RXjooOehB+2Q6QiZk
	QP8pfVb5/14ZzcadWI=
X-Received: by 2002:adf:f606:0:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-48e07fe70aemr11254977f8f.54.1792405083227;
        Mon, 19 Oct 2026 03:18:03 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm23913237f8f.32.2026.10.19.03.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:18:02 -0700 (PDT)
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
Subject: [PATCH v3 2/4] mfd: max8907: Remove platform_data based probing
Date: Mon, 19 Oct 2026 13:17:48 +0300
Message-ID: <20261019101750.125439-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019101750.125439-1-clamor95@gmail.com>
References: <20261019101750.125439-1-clamor95@gmail.com>
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
 drivers/mfd/max8907.c                 |  8 +-------
 drivers/regulator/max8907-regulator.c | 11 +++++------
 include/linux/mfd/max8907.h           |  5 -----
 3 files changed, 6 insertions(+), 18 deletions(-)

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
index e59aa7a3ee546..521825c0adc07 100644
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
@@ -331,7 +329,8 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		case MAX8907_BBAT:
 		case MAX8907_SDBY:
 		case MAX8907_VRTC:
-			idata->supply_regulator = mbatt_rail_name;
+			if (idata)
+				idata->supply_regulator = mbatt_rail_name;
 			break;
 		}
 
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

