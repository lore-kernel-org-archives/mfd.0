Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101614;
	b=JiOJfRSoj25xNuzm+aKrdM13j2aVHqdSbEKf8aX990zgOhetpw8uAkErDykF/X0nSpaq
	 4ZO8gtwyFXRCugP8BMU6OGxtwNdDrlNAZXTkof4jI+wEF6q72YIFZIdOthFp16kXnagi8
	 EPQSJNyktvj9RScvhT1iU8ZWCdtjqASrgGJu6FLWOPNI57GZCUwqYJMJPjprGXcthYP7B
	 L2FxkMOvliS8k7EW7qqel6tyb+ZIRGG6btagqlisUJb96QUtKeFe8CjE3dO0Tu5epM2Zg
	 VjASRI/rgeNXnldSv9XTeKW9cxyvOKQCOdwxvDDL6hOc/s5T/pG8D8EkBHd2ney7mEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
	b=n8yFNs5czQByyxZ0fcxpfK8/NTTnsNv1NU2vieoZ4RyXvZ+IqGsP5tt116WhT8T8DTlO
	 W/ID2i6sdVq6s5dudwA1mpLnXF5VOrQCR8Pp0qWhObi7at0q59iGC9nZhJCkLzkrKAzAO
	 zv/+G0dQECuB9sPKvtDdpp78HGdL0nKN8V6QElChEcHu1cYUS7pDIetU1sFRYoATayfE5
	 6y4t/qAmv/nN7U/xV3PRtp3v+e9n0hf1u5P6tiUXj8Pr+rVEIzvisdly9noyfXctfsKJC
	 oQUYf04kqYS/NMefQGrK4arCa0flor0AzVeGOJP9fqZfgXmEy1rN+aLFncG+KalBOgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ViWUVoCF;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C10606A85C
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C10606A85C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ViWUVoCF
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4550d8ab15so517816566b.2
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 04:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101612; x=1793706412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=ViWUVoCFpKZ5ozPduL0uKFyAnsU+kxtxxujWoP9bq77Wsmf25IKtguPM0ki0I7syR/
         su1N1rppVCXjw/bm7KrkEWciL6+YB5h/uZ5ZwfYPJEUxTsNt9ifeVi+OYry628++soA9
         MDnSFuSkCg/gFuPj/t4SiEPHDo+b97bFw/qhK30ot/LQnkHl0dUV+aPOP8N1G4MWGHe2
         t8bB1HmHDjJyOyRDGJBdu7HKwvL9r4FmsHtnsyt3NXvuMlXpsqIFRT3Lisf7EmUxdDlx
         9BCdLYS1UCHKvex65bunqSH3ehSTNPIa1Kev+yzRAHAutI3eZFFENxmdZE2zE5WNJENU
         QigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101612; x=1793706412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=FPuk0Q+x+kmTaUN+4xG8HMurOXZT0rox+p/GVV+6XCFeMJupkgkY6luOYMKtZbjMvC
         gkEdPVc+39yFOsOhRHv2fx1iwoItINCAqNa23muwNZ4WuiG3b0GGYWFvyN+h6kdA9a5+
         tME08R9mJJeF0R/tbXA1NGwiPj5t93OiH+q8rYt8UrwDJCVJK7t35psbr5/IQ1Mzi4Hn
         e35aL+5fTBP1H4qVbPDSC84ioOQTz3US3E5QsbJQp74MGtkqOqRxs9aM46/vwU15YXGT
         e1WyFbKTTbHd6KsQyoVhZRhAF3rP/nP6LFBHghQaTbQmVkVh6PE1B7upWpX5bmlY/tNN
         DuiA==
X-Forwarded-Encrypted: i=1; AKwUvBzZzLGSVFZxYoY/GQHhcTLTzenp42Ryhy3Ph8Hg+SyQKSk1ugan3pIjsuFdt0r87HtjnHQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKwega3p1OCSZdTtxdaTpViTlx31wMkGM9ktYAT6laClkwhPAWt
	Lyq3sI6/c6le47A+mvKfBPl8c4D7sSi/ZOumSbqrDfCADLmUHqqvx+cU
X-Gm-Gg: AYBFou0K+L1cg0710GKRG6E+GagnvuQnLZgGlAApCqQQ2Q/6S3xP414wfr/665FRUQm
	PTgwHV5epnfdttjeU2y0RGiUiwe0MNNHZf+Z+Q15pMZQUUZVyP5v8/wpMNRVy4QaKxsoQHgSZ+m
	jwh3+4A+2X8zEFgeHpWDMzFduW88GbucfamDJtspn0EvM0mmEJaETGbk5/Scr9ul/4aafEMNIxV
	ff0h1Me27niHQJ7YhGC+tLnbJTUM/olyKQx9RBJJneBxpk3WE1OrD4kNi9z2j0wsuUkvcc3d9i+
	lNxacCL2THxG3dbh82jbtzjMh1TIvNg+T2eMIUDIELE6j/JzPQt6W447QX76GXMrFYEmJlToIee
	xt6H4DRdNwaLg6KSiqXHSUM50Q5JhBU6ZTg0vqBkuYK1Xj7Ir9C6501OOordGAFX1z/FqGTb8/a
	47ojb5JloL7q5L8M1q+SL+k0JpAM64WKxubcWF/nPB0vmzMd9rQjtKNYgINylLEKuCUUqCEJEVW
	D/klfeGox07fFPpBoQply20CTkqtwL3FaYXSYTF8ASZXUICCGdWCOzS4CJDkdPC0n8ges2zI0Tq
	DkZ02cJUYxJzaf5yemlhWg==
X-Received: by 2002:a17:907:d64a:b0:c2e:4b90:3c55 with SMTP id a640c23a62f3a-c46bdaa5e52mr1109139466b.5.1793101611523;
        Tue, 27 Oct 2026 04:46:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:50 -0700 (PDT)
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
Subject: [PATCH v4 2/4] mfd: max8907: Remove platform_data based probing
Date: Tue, 27 Oct 2026 13:46:32 +0200
Message-ID: <20261027114634.79706-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027114634.79706-1-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
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

