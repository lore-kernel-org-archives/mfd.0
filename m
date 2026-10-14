Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA684B1268
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980168; cv=none; b=kuUunMRKI98y2Hv0bKTn1/w6Dwti3Un4SC0D4xZduQq+DfHO/36wNqvqaWix+UJ8ZsEjAFBa4am0QiuxOCbQF7JyzQEDtXCq+Xae1j7Xx0ZlgvKt0i6jvmctXtHBfmsnMFigZcIu6OkX8RYEeVVOyEiYkNLVT6aqBMIZ8FaCoFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980168; c=relaxed/simple;
	bh=LUJoAfm8d9DBAnqMkyJ1+9asGnatYQIAciuxSlDdENQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDoYOxfpF9Ngne/sI+4jKA14usSODncqqWQXcl9SpDhko32vsyfqHFj2EUjl/130wkFTA0Ypdf1fwlyUCvZAOX4okJI+3dyaSQokd6w9WBYi+fvC0RYatPv640fiHHfsH1wkJ8mgPR46NwE38j5FIjE4TFzBVjFHZKdAQqlir9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZL1LW6u; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZL1LW6u"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so46618f8f.0
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791980165; x=1792584965; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=QZL1LW6u7TjUoujCjVtk1XbMJ+9QFqdjmfuJbCq7kRsPDLiulJhIVC77UUGQxSsnuT
         LW0Lu2M6tmyBl9znxQAOQZghBJqcc8oAvQp7PecI2afLRmS8ztt6A5pkTiL0OBkOt3/W
         RIe92y+TSpkO9jgDD26vTwHTnmTNiNW/KsGjan3BUavHljxgzQN+ik7E56wmjNHSTov+
         61vdFG0U1cfX6uZ5P6I0FfMNVQwqbgUoZj31eUAusauPw1kMMftUhXthSkU39zCmvkHo
         aDYFxbqs9FDeGwGr4oOlytx9wpcSSm1Q/4etXzo03RkGHt4mF9nSdAjeyX7tu9NyPXyc
         Pkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980165; x=1792584965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=Aim6etaCjuH8cWZH9uPTaPVX3kIOyJBcL2hZH+44tUSpcdiSfnPbSUkm40+F1tI5sy
         Y9lqIwtMvw+6XtuCFbtOVLp3SwCkaCDiBUPt/OvG8VZY/zHVXUomgY+JjxJpfQVZGNrT
         prqRardYHIE/wkch21jwalNk7bJMln1r5eSV8yDxoHhwGaSiyasusUct3jzwHcmRd+SE
         8T5rw8D3/gZoyXmkhnBhaO3Irjy0ShSb6/NkGfFDARvBPHWe308oM/gjm+0b/afJpJnC
         Z5eDg2jyz6Jagigd5bLvNAPWOqmJMrPdEvR0KdCE45liEVn9gt5qQ9o0xIKJevKBZ5x5
         FJwg==
X-Forwarded-Encrypted: i=1; AKwUvByN3xMD3M8kSI1eHMNWbTex9dn+QoKPYIaCJ2DWKjOYGMODEcm2vdzGoA3IoNYOtn/Gthk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLxu4WGzsM6BPe8g0IOIb7CBoJDGsguxpQSMAAtaYa7+y+JCN9F
	f6HguvCqBLHIvcaKOJxUZxB19ZJwQ1Y6AQutc3wYvI+9Wn/8zqPySlQb
X-Gm-Gg: AYBFou2/XCxx1vCUQk5yUAqCPnrb3ey3vgb/T7LLbEchNdzWT6tHll7Y8ZEFGKdFq4Q
	b5I9oAcS/KDvS5BKLZk1gVh/h2xLWV/ssZq1Pf8v0GTNFJLeuntqH4HTWlWK+rIvgM6LQ2UZLq9
	R/Wqp/3NT9SCGKkf7TpqOOQ0MLKPJ6H5awF6dZWR6756rydlHWpye7x7W6xuZGjQ5yvYvioP31g
	vboPUwlaXpsY0Ky4+eYtt+4+/XRZsPV+DI4axREMKrutWbCsmdb/E2siNhNdvd/TdlcsCnVN+dz
	rzRGKkzKSKrPlh1PsMQkxJ1BtvrXykn/azQ+qKJQqyqLj6OyvNUYr9ekLMyR8lQjs3rx8aZNw39
	jbgxbkpxbHOaV+Ypdhkm0gWR00UX+6sWZlg+I+oJKwrRxalSD3ZORLL+4uTvYUpjRmcZCiVNuk3
	I+FhDqiQo591mqt0eNP5phAcanBEzRN0kA60nKUmh3QrHgLEfLk9+bmxWw7ZtEQ9VtxM8KD3pu7
	Uh1Ae+xawqkNV4Y8tM=
X-Received: by 2002:a5d:5e88:0:b0:48d:bafc:a3f6 with SMTP id ffacd0b85a97d-48dbafca4a1mr32494960f8f.0.1791980164766;
        Wed, 14 Oct 2026 05:16:04 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm11006660f8f.36.2026.10.14.05.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:16:03 -0700 (PDT)
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
Subject: [PATCH v2 2/3 RESEND] mfd: max8907: Remove platform_data based probing
Date: Wed, 14 Oct 2026 15:15:43 +0300
Message-ID: <20261014121544.138958-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014121544.138958-1-clamor95@gmail.com>
References: <20261014121544.138958-1-clamor95@gmail.com>
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

