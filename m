Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFBC3CAA5F
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304324; cv=none; b=Xc2hzqMB9HljLRBbs66WL7S2Fc7j7vn8KOhr9HkMWWAoTvJYjWYDOHqJsgm76rCr+/oHKBmIRBbXkMu/i4s02lJHVoLmyaP8/HXVsxxK+j/0Aaqgpj43oD9+MW3rBtwmAR/iGG8hE+pV3YDix25NGCHkSvWYXcmyzVoS5P3J/eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304324; c=relaxed/simple;
	bh=0OkZfUr3LUZRQ2K6jQIiJECdewIVP9WXG3gYKFl6jnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OkXY0zANAQk4fsRq5XEgCB7gl54yQZxKo2PcEbwA8mOEGgjJq4okUHZmJpSXNuoFKjoEDH2EqrrwKqwKlvLdthzLkRQoVkjfx5LgtsNOrP0PXoe1aK3jfNCl2Br/bSCo9Qt6xkJfg/Gmux2NouEGF9H80Z1EKtfFv6zdp/9MGpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5namTqt; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5namTqt"
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ccc2e84048so2774655ad.1
        for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 02:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787304314; x=1787909114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nihrwGZwgqG0Er73+zrNV3ScTNb+tKGxsnufv1FiMk=;
        b=j5namTqtKLH77w8v3uvoI0TQMKsucDHFpyatN3RimwXg4GXiIrcfSPHWNBL0PU1SnH
         2mvxsfWtaFopqOfpyWskIrbIb5Ct9/KeSUayW/RlTcKd7saLcS5yTQsi/pSYPMfDQqhZ
         6oOltF/D3fEkgLvRupQzaIvu2HJj5Lu1g7U4tV+9FQcGinS9+DIhNCVBL3BDA+lNATTd
         s4eiIY4qgF9Zfq8vtDfq0nkoiTc3j4YURRCrVxhAMWkeI0bITokmYV3f1i7qSa2PUyPR
         J0H06454T/t++pdla/py510bMuanLHi9Oq/2TylEvGoDWM657moFjna8UHfHB391BL9k
         dBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304314; x=1787909114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nihrwGZwgqG0Er73+zrNV3ScTNb+tKGxsnufv1FiMk=;
        b=lfIkIjZb8CEBD+dTDNKzFD+cSw9gW8iBciHXGtKCjI+sLbd7DSAXv1D7J7Y6exbjx8
         ywuVJIhpM/sv9Wz/jPKutOUuINUFZpGePPj86/JUDs21c1szs8FJqkrKmZ79m/ZX8bCs
         R2C/2eKYurrqTN94VXwIzTpdkZLKCX/vakgIzfoxwOLGcrRyoOWfuPycdPnz6PUnm7S3
         0k2eP6oxBd5q/OEqi6Mw+7aSC35XzCUjFWLW14iaFPEZtL+c87Kj966SImhlJxZ0GyuX
         KDI88Y+tZZef8ukC379viyzRHkguNpHJ/Dbt26SMuOO+Y6lElbzdk5E7CVbfbnwG2hxX
         uRQg==
X-Gm-Message-State: AFuF++mFybvAAcRGt1BfYLUpZsbcQsOrmiMufhzvhff3zQ5b1/sG6QvD
	uA90bJFnF6KEk6ThLs/fCiYL+9S0/Rsxuh7ADjP01ElB54IHLvAmd9s=
X-Gm-Gg: AR+sD10SPeoA0ZTdWdS5eKpWDKTaDB0fTMwNCyarMVJe+Z4XzdUQsAuxmjBP6VwsYAx
	WgKUXRkF18mK4BvF8EfZTbq55fPFsVdIoCDV8cnOMipREit9kbxDGHEhs0iD/IwSCuR0IL5Cjpz
	Ev7nsqmCYDtQJLZ/e7tFJzA82ThVjHSTRk0xtuVx+iWotKCWBdJHlD4cWsnVxgFSGExIdcnpUWM
	LRr7tUffsuqIvUYtU7eXL3t7pVasaeNN4lgJdpwG+SIeW1SMIBFhKBD4zSd9bM78vpu7lfccWtK
	qJnLlikKU2fW0+4f3d7lUjqjhYIWcXeNS7hoa2Yy8ZKkE0cMGaLMkhuDC7krHzRusb8TnUIrTbR
	Lfu9yepT9dMGaaumIrEwCLNUg68wzRhD8lY+e87v6m/O8xr54qSFoIWdKSYqdt1VihpaI+waXn6
	ka+/4vWg7ganTPcy+668K5oGn/RDcI2PwFaURncQ38m1KlkBVu8iBgUhewZr4VqA9qwqPHdWZP6
	+hYV2PxgsJS
X-Received: by 2002:a17:902:ce08:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d64afe9569mr96571235ad.10.1787304314313;
        Fri, 21 Aug 2026 02:25:14 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e3c27aesm16264185ad.69.2026.08.21.02.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:25:13 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: lee@kernel.org
Cc: mfd@lists.linux.dev,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] drivers/mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 16:25:08 +0700
Message-ID: <20260821092508.324787-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/mfd/iqs62x.c           | 8 ++++----
 drivers/mfd/max77843.c         | 8 ++++----
 drivers/mfd/mt6360-core.c      | 8 ++++----
 drivers/mfd/rk8xx-i2c.c        | 4 ++--
 drivers/mfd/rn5t618.c          | 8 ++++----
 drivers/mfd/ti_am335x_tscadc.c | 8 ++++----
 drivers/mfd/tps6586x.c         | 8 ++++----
 drivers/mfd/twl-core.c         | 8 ++++----
 8 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mfd/iqs62x.c b/drivers/mfd/iqs62x.c
index ee017617d1d1..bea1ebdca9e7 100644
--- a/drivers/mfd/iqs62x.c
+++ b/drivers/mfd/iqs62x.c
@@ -1015,7 +1015,7 @@ static void iqs62x_remove(struct i2c_client *client)
 	wait_for_completion(&iqs62x->fw_done);
 }
 
-static int __maybe_unused iqs62x_suspend(struct device *dev)
+static int iqs62x_suspend(struct device *dev)
 {
 	struct iqs62x_core *iqs62x = dev_get_drvdata(dev);
 	int ret;
@@ -1036,7 +1036,7 @@ static int __maybe_unused iqs62x_suspend(struct device *dev)
 				  IQS62X_PWR_SETTINGS_PWR_MODE_HALT);
 }
 
-static int __maybe_unused iqs62x_resume(struct device *dev)
+static int iqs62x_resume(struct device *dev)
 {
 	struct iqs62x_core *iqs62x = dev_get_drvdata(dev);
 	int ret;
@@ -1051,7 +1051,7 @@ static int __maybe_unused iqs62x_resume(struct device *dev)
 				  IQS62X_PWR_SETTINGS_DIS_AUTO, 0);
 }
 
-static SIMPLE_DEV_PM_OPS(iqs62x_pm, iqs62x_suspend, iqs62x_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(iqs62x_pm, iqs62x_suspend, iqs62x_resume);
 
 static const struct of_device_id iqs62x_of_match[] = {
 	{ .compatible = "azoteq,iqs620a" },
@@ -1067,7 +1067,7 @@ static struct i2c_driver iqs62x_i2c_driver = {
 	.driver = {
 		.name = "iqs62x",
 		.of_match_table = iqs62x_of_match,
-		.pm = &iqs62x_pm,
+		.pm = pm_sleep_ptr(&iqs62x_pm),
 	},
 	.probe = iqs62x_probe,
 	.remove = iqs62x_remove,
diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index 2a48577b1a79..9ae6715642ae 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -173,7 +173,7 @@ static const struct i2c_device_id max77843_id[] = {
 	{ },
 };
 
-static int __maybe_unused max77843_suspend(struct device *dev)
+static int max77843_suspend(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77693_dev *max77843 = i2c_get_clientdata(i2c);
@@ -185,7 +185,7 @@ static int __maybe_unused max77843_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused max77843_resume(struct device *dev)
+static int max77843_resume(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77693_dev *max77843 = i2c_get_clientdata(i2c);
@@ -197,12 +197,12 @@ static int __maybe_unused max77843_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(max77843_pm, max77843_suspend, max77843_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(max77843_pm, max77843_suspend, max77843_resume);
 
 static struct i2c_driver max77843_i2c_driver = {
 	.driver	= {
 		.name = "max77843",
-		.pm = &max77843_pm,
+		.pm = pm_sleep_ptr(&max77843_pm),
 		.of_match_table = max77843_dt_match,
 		.suppress_bind_attrs = true,
 	},
diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index b9b1036c8ff4..8a97c30cad3f 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -583,7 +583,7 @@ static int mt6360_probe(struct i2c_client *client)
 	return 0;
 }
 
-static int __maybe_unused mt6360_suspend(struct device *dev)
+static int mt6360_suspend(struct device *dev)
 {
 	struct i2c_client *i2c = to_i2c_client(dev);
 
@@ -593,7 +593,7 @@ static int __maybe_unused mt6360_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mt6360_resume(struct device *dev)
+static int mt6360_resume(struct device *dev)
 {
 
 	struct i2c_client *i2c = to_i2c_client(dev);
@@ -604,7 +604,7 @@ static int __maybe_unused mt6360_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
 static const struct of_device_id __maybe_unused mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
@@ -615,7 +615,7 @@ MODULE_DEVICE_TABLE(of, mt6360_of_id);
 static struct i2c_driver mt6360_driver = {
 	.driver = {
 		.name = "mt6360",
-		.pm = &mt6360_pm_ops,
+		.pm = pm_sleep_ptr(&mt6360_pm_ops),
 		.of_match_table = of_match_ptr(mt6360_of_id),
 	},
 	.probe = mt6360_probe,
diff --git a/drivers/mfd/rk8xx-i2c.c b/drivers/mfd/rk8xx-i2c.c
index 2951b2911a37..161b25fbe146 100644
--- a/drivers/mfd/rk8xx-i2c.c
+++ b/drivers/mfd/rk8xx-i2c.c
@@ -251,7 +251,7 @@ static void rk8xx_i2c_shutdown(struct i2c_client *client)
 	rk8xx_shutdown(&client->dev);
 }
 
-static SIMPLE_DEV_PM_OPS(rk8xx_i2c_pm_ops, rk8xx_suspend, rk8xx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(rk8xx_i2c_pm_ops, rk8xx_suspend, rk8xx_resume);
 
 static const struct of_device_id rk8xx_i2c_of_match[] = {
 	{ .compatible = "rockchip,rk801", .data = &rk801_data },
@@ -270,7 +270,7 @@ static struct i2c_driver rk8xx_i2c_driver = {
 	.driver = {
 		.name = "rk8xx-i2c",
 		.of_match_table = rk8xx_i2c_of_match,
-		.pm = &rk8xx_i2c_pm_ops,
+		.pm = pm_sleep_ptr(&rk8xx_i2c_pm_ops),
 	},
 	.probe = rk8xx_i2c_probe,
 	.shutdown  = rk8xx_i2c_shutdown,
diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index 23ca00d2c624..8c68dd16bb9e 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -243,7 +243,7 @@ static void rn5t618_i2c_remove(struct i2c_client *i2c)
 	unregister_restart_handler(&rn5t618_restart_handler);
 }
 
-static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
+static int rn5t618_i2c_suspend(struct device *dev)
 {
 	struct rn5t618 *priv = dev_get_drvdata(dev);
 
@@ -253,7 +253,7 @@ static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
+static int rn5t618_i2c_resume(struct device *dev)
 {
 	struct rn5t618 *priv = dev_get_drvdata(dev);
 
@@ -263,7 +263,7 @@ static int __maybe_unused rn5t618_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(rn5t618_i2c_dev_pm_ops,
+static DEFINE_SIMPLE_DEV_PM_OPS(rn5t618_i2c_dev_pm_ops,
 			rn5t618_i2c_suspend,
 			rn5t618_i2c_resume);
 
@@ -271,7 +271,7 @@ static struct i2c_driver rn5t618_i2c_driver = {
 	.driver = {
 		.name = "rn5t618",
 		.of_match_table = rn5t618_of_match,
-		.pm = &rn5t618_i2c_dev_pm_ops,
+		.pm = pm_sleep_ptr(&rn5t618_i2c_dev_pm_ops),
 	},
 	.probe = rn5t618_i2c_probe,
 	.remove = rn5t618_i2c_remove,
diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 068c25401c6c..81f07a1d780c 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -313,7 +313,7 @@ static int __maybe_unused ti_tscadc_can_wakeup(struct device *dev, void *data)
 	return device_may_wakeup(dev);
 }
 
-static int __maybe_unused tscadc_suspend(struct device *dev)
+static int tscadc_suspend(struct device *dev)
 {
 	struct ti_tscadc_dev *tscadc = dev_get_drvdata(dev);
 
@@ -331,7 +331,7 @@ static int __maybe_unused tscadc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tscadc_resume(struct device *dev)
+static int tscadc_resume(struct device *dev)
 {
 	struct ti_tscadc_dev *tscadc = dev_get_drvdata(dev);
 
@@ -345,7 +345,7 @@ static int __maybe_unused tscadc_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(tscadc_pm_ops, tscadc_suspend, tscadc_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(tscadc_pm_ops, tscadc_suspend, tscadc_resume);
 
 static const struct ti_tscadc_data tscdata = {
 	.adc_feature_name = "TI-am335x-adc",
@@ -373,7 +373,7 @@ MODULE_DEVICE_TABLE(of, ti_tscadc_dt_ids);
 static struct platform_driver ti_tscadc_driver = {
 	.driver = {
 		.name   = "ti_am3359-tscadc",
-		.pm	= &tscadc_pm_ops,
+		.pm	= pm_sleep_ptr(&tscadc_pm_ops),
 		.of_match_table = ti_tscadc_dt_ids,
 	},
 	.probe	= ti_tscadc_probe,
diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 3cfd2f02b62f..600186b1e8cb 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -618,7 +618,7 @@ static void tps6586x_i2c_remove(struct i2c_client *client)
 		free_irq(client->irq, tps6586x);
 }
 
-static int __maybe_unused tps6586x_i2c_suspend(struct device *dev)
+static int tps6586x_i2c_suspend(struct device *dev)
 {
 	struct tps6586x *tps6586x = dev_get_drvdata(dev);
 
@@ -628,7 +628,7 @@ static int __maybe_unused tps6586x_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tps6586x_i2c_resume(struct device *dev)
+static int tps6586x_i2c_resume(struct device *dev)
 {
 	struct tps6586x *tps6586x = dev_get_drvdata(dev);
 
@@ -638,7 +638,7 @@ static int __maybe_unused tps6586x_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(tps6586x_pm_ops, tps6586x_i2c_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(tps6586x_pm_ops, tps6586x_i2c_suspend,
 			 tps6586x_i2c_resume);
 
 static const struct i2c_device_id tps6586x_id_table[] = {
@@ -651,7 +651,7 @@ static struct i2c_driver tps6586x_driver = {
 	.driver	= {
 		.name	= "tps6586x",
 		.of_match_table = of_match_ptr(tps6586x_of_match),
-		.pm	= &tps6586x_pm_ops,
+		.pm	= pm_sleep_ptr(&tps6586x_pm_ops),
 	},
 	.probe		= tps6586x_i2c_probe,
 	.remove		= tps6586x_i2c_remove,
diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index c024a28b057e..b7d749208131 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -903,7 +903,7 @@ twl_probe(struct i2c_client *client)
 	return status;
 }
 
-static int __maybe_unused twl_suspend(struct device *dev)
+static int twl_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -913,7 +913,7 @@ static int __maybe_unused twl_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused twl_resume(struct device *dev)
+static int twl_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 
@@ -923,7 +923,7 @@ static int __maybe_unused twl_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(twl_dev_pm_ops, twl_suspend, twl_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(twl_dev_pm_ops, twl_suspend, twl_resume);
 
 static const struct i2c_device_id twl_ids[] = {
 	{ "twl4030", TWL4030_VAUX2 },	/* "Triton 2" */
@@ -942,7 +942,7 @@ static const struct i2c_device_id twl_ids[] = {
 /* One Client Driver , 4 Clients */
 static struct i2c_driver twl_driver = {
 	.driver.name	= DRIVER_NAME,
-	.driver.pm	= &twl_dev_pm_ops,
+	.driver.pm	= pm_sleep_ptr(&twl_dev_pm_ops),
 	.id_table	= twl_ids,
 	.probe		= twl_probe,
 	.remove		= twl_remove,
-- 
2.53.0

