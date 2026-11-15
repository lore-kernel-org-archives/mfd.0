Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733321;
	b=OgN+bDDGxdvHDOKXTwMgS7Nn2pFdF02kZwpSjABFYMeDmv3b+0fF4MlRmoEFgF2rNJsT
	 aLKEjbmlrIGdKetpmwWsop7VhhRfdRfeVy+JYVmuPYITj9No7SuUup1EoaHPqNOfnxMJB
	 KHwjqXWekHg757jtDvDh1iWUNLEY3raLM0lD7V8u1tzW8qDLUiYKqb49lKmjEPqw9NVcy
	 UmPc66SMlratzTkkaQ8/3I5kybS+qgl7ckmOq3GJusstkeaSvax+viBsEJIGDqQqGL8N7
	 Zh6Ul9kNmjjJZB+hxous3rz7Oz9r7kn+PU62/Xupidb2u6niiUnTbSEP4w7dIuJRfMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZUURgUr8dXxqKz+c2MEq98G6BmE0uIQKXrceD/LihTE=;
	b=BkjTtAcF2tYuDFdQeUFfBXg77t6qnPpGO78Zpcy65VoqAmf0wdjESS1lg+B5ikEcKm15
	 7r+7rT63e5bhqRmM8WCKLttZEVwgMh09rCO1DmQgbDiIOgkm9T4rfYqCOWaV/swV8iMMl
	 HdzJcqt8YBFUnGqvPPXcj2WJDBJN3VtdOhiSLEpHCVTWmSkZUIWI0irnkpEC9DlwxWMpr
	 Nok88h6k9qB0wnb33pcOCmLK4kM+whTzFlpbVhzkkPuNmabpq2WBigdzdk089IKfZk5Io
	 63/U7H5gYhNkoixKU3AzGp6nfjnRfu7nn/9cByFT+Ey9mG79ctVIgRYnjhfzBhtVARw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=unmFzcO5;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681F606A88E
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C681F606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=unmFzcO5
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso3506341a12.2
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 01:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733319; x=1795338119; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZUURgUr8dXxqKz+c2MEq98G6BmE0uIQKXrceD/LihTE=;
        b=unmFzcO5p0AodVOJsrNP917IIPPuRi+6IdiPCfwcYnOxf8D2zeZftJ8xeX/UPCJivJ
         qYBuoR8fukbp9nAxxVRRTqfzLlrZJ9cR2ItldYxvH8ZcVCTq/0skkVaNE6DqTfxzvPaM
         pmawc40TcPlFxd91NH96zKnnkPALfzcT+ecn/dnblK84IsItCIVwPSahDCuXiGKLJ1gI
         dBHJnS6me5idhMuMpMZg0o6AfjkgE8JAOWI2e3E485okwgNGLry1szxb9TmXceIl0eN1
         CEa49/XcExzLyupuIdrbn3qS42L96jG1KpsYm97AZcIOU8r7A9YkkY+RGSyvV8LCv/5D
         nSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733319; x=1795338119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZUURgUr8dXxqKz+c2MEq98G6BmE0uIQKXrceD/LihTE=;
        b=r1GfoIHg+miF90/1mTYCFSdRy8tbyMNdirpl5/C5RZsQsmOuQ+R/iXwuYb4XGykSqs
         4A6IhL+3Lu+fiZpqOAZPkiMhbrPZf5Kpf/1e8+UmdrpFbmqjtcjUY+/zrx45v0uYEYH2
         VHny9xDiax8kMQvu0HcmJcUJ2I6rRkCWdYEZi0DH9NmBIBKeZulpGGQkWhVfEYpVHI9l
         ywkMdIItV2IOOCJmc3c/FNCqdPfwyWWTVZVoYTIg9NzRIkF+XhdS7G3N+7m68eCqJxwC
         0AMx1RFaNuwNgpDWcDjHnVQ8qsB9tXF2Z4h+OF38noFo7oRoWuTILWXPzwXjMx84EcVU
         krwA==
X-Forwarded-Encrypted: i=1; AL+hErHD4TodTXu6RtYB0pEM3IPhF0ByvHXVwswHxSfRMAqnegxmrAL8WSL9YHtq05eX3m3dSXs=@lists.linux.dev
X-Gm-Message-State: APuU4Z+PyP/0VjMuG3vI7tR3t3TAl4oGW7j/pOLAAe87vcBbo3hCkAqs
	fU4Rs804Ts134mcX2W+hia5InQ61lsxn6/GdXjim0fUeahLq//Qt077X
X-Gm-Gg: AYBFou1WciFluacypAsqHZpbjNl/5IzR23PIbCTb5kWJO+5DC8ckFMGOIXsnymUKgZe
	IoPf1mz5hz3+VX2MVkFIN184HckI/ER0kPOisKOTMESuq2yLZBmEeI1eir+vpdqCI0lYNbAYMcK
	NscPz978sP56d3hcSfO3Dod0WOJAafk1JvZpHQfJokEmQC/r/qi+ervZkHke3av5M8n/4uJyl94
	WZ4lRF53DA09gMXFxKl8t83iMAj/j/m0+Vu3+x/rYoULxgduHdjtQf1O/HNaI4n73F/fRDEQ2es
	us/NStgJ1C2SMSMGdLXitD02YxwCw6qBghUQRH1i1tnty0ofCB15PFhtcAmCa4UVIS2B6q+JtBn
	eoU1vDcPMOMn/UFkWI5TO1FYJfg7aC6MJ3INyHcjaxD+au7w74ho/pG9pUvrJGNsSlvHBJ+3uLs
	wfk5JoCb0QjboI2SXc2W8jpUTaopPFykkhgj3TN5jQFoRg7oYfp4FxRCbdd7A7Ub+BYHCCFU1HA
	aFxIrEY83hhFZMrw3DsT1qKeFX2NieRxY6KJtbDT+/DKxZGELcNraz0REmNqhb9adliqBCsdPM2
	OltKF+wIt5fTmnz00Uer0wig+fZR1qZC57kG5EbrjY0AjoJm2QfJj3mZvmLj/SpqQxb5DgV0WBe
	zt78Kh1poRA==
X-Received: by 2002:a17:907:3d4b:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c50963b2f7bmr651176666b.39.1794733319040;
        Sun, 15 Nov 2026 01:01:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm291440966b.78.2026.11.15.01.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:01:57 -0800 (PST)
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
Subject: [PATCH v5 2/5] mfd: max8907: Remove platform_data based probing
Date: Sun, 15 Nov 2026 11:01:44 +0200
Message-ID: <20261115090147.95337-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115090147.95337-1-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
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
index ba06a49c9c60c..d5d40d2c7c425 100644
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
 
 	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index a9f014eae4d61..5677c59ef5b8e 100644
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

