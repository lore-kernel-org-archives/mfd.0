Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842B32B124
	for <mfd@lists.linux.dev>; Sat, 29 Aug 2026 05:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787979767; cv=none; b=J6yi+X0/WIixCa+Jupd8V1w7NJatZZ0yCChQB8o63X3Hc7P3CL+eo7AwhqwjXOZd1Ojmx3B0X6DzJTYxd9nZYgcvQBE79X4ylymMjhZ1a3MriR+cJTBuDy1t8Agv22nVupKJuQl2aDMR8c4fHKyz6ZWgOAVOpIUWiHM36Vu/Yjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787979767; c=relaxed/simple;
	bh=WxWpm5z5LYtQxX8A1bxzW1T5uOj+yyzsdR3OnAteRoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fnykOWlekvxIrbzws+LYlS44jGp6y+pqMqNDr/fgtkU2NCiNZKN/5HJRn4tIJnV9ASIMmoBJHt9LAfZuviv/c1e2vs7YYSxqZxa2vfgSm/Ke4uBI/p6obz7j9n1dvm/hLNGalxgYZ3O0RBKoCfei3Iz0+h5nFhSsaIGBVSP15lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRhn/t0q; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRhn/t0q"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d560775ca2so11443575ad.1
        for <mfd@lists.linux.dev>; Fri, 28 Aug 2026 22:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787979765; x=1788584565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NQIlA6+yZSpU3Ec+DP5pbotRZ7dDJ3ws14iVzNh7kTI=;
        b=KRhn/t0qNfkXoNt0axmktbW0g52R6T+2PXvZrlty7xfeJhb174drO41Mmql4e66YYq
         6ldakRa2oP/HH83pJKa6N3FEC/edBD+MeIOo2dvJDoP38V6oTgy5qJuJVh8NKUcujwze
         EQvkXOsybiBPrMMPd0KkTAwkiJU/rSpK6Ay3vCwSu5lqoQMHH/17oToK735z88NlDafg
         JiguEmHzRFlCwgRVUOFQERoVOocVTCZhveivtA9wHJCSXQseltfbaTjeacsli5dR6PNl
         qh9W/w1MSGwk8cljyTlPSagNpvlWDYZw/3lB0uHc6yckp+2HFAZTGH4LIrdMPANe3e/L
         H0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787979765; x=1788584565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQIlA6+yZSpU3Ec+DP5pbotRZ7dDJ3ws14iVzNh7kTI=;
        b=DMpU5qm4M6+IC6lcYjG+NrS909oSCi/DcARpR6jpdjsy7vRW3bocJHsoB7o9ShD6Tv
         8C9zRYCPErkeiFYcaWcHkJuwFHTrV9/+pBhbin4sNBhxb9tBlNhPXvWc0GLNAvaDlw5G
         pdDYFM48EKVMCQb5XDcwL4gZhQXH61xvpJJjUqqbGvMeZpARZsWHQxK8Wa/czqC5vbLU
         f9e8eWxc2jzhhKIsTvKdjwRNDq/RfgZor6eJ/eACC/DWU57TytQudkufaVzpT7EyZYkj
         Ru389714ajxT7RyoxUhF3cyXWz07XffL945WhJzs8tor/A9lT+nbqMp4Jf8dhesNANzK
         upyg==
X-Gm-Message-State: AFuF++mWmF4BxDl0nSYTRwso+PtP1BAJpF9YqJ6RqKpYcG79ImjnRL4D
	wygrtD8upjGrifaI2kWnCkWp2YjQ6ji9lzcpv5QgXT3Yt6AJxCeiaas=
X-Gm-Gg: AR+sD11lU+I1C7HBNR5qrE4sfnL9IE03M37fKp7i6ncDrxISJf4UMsUZ6sykGuVhvjY
	joQ+XAr2dIp9TT05Q+FM4I9PFUMAOSnXi9JXzb8tZ63UEA42Y+vOdyMWfFwcLsmZTBykCqJdrb8
	gckhYrMC1ONCcBKheLe2mijRTr+FYFor7zYh24oTcXvgL1r7/8U/NyBoSi8uQrvMXDV+2hLBJ2h
	A/wUcQnYXeSP/6G1jwWnZ5Zb7PF2qU8ZiYURSEwTEBGHnx+dvterpKIZeeX6xIten6cmYmp+zAM
	UgfwfWCpbaIf/oO/cPA6XQlHA9m/UaYDQTxrjJJmhyr0G0bF/ik0OYO71YbrJtAW2qrLvMFBL0y
	LoTCOYzdkYrmAZ54uwwEHJ91wY2sSlylAwm3GbkLS4EldMLbr/HnDz1Jl/R/3cJMwhLFyte5ncS
	hoZZfmV/HeMltTu/wh1C2nzV93A61P4KgPmip/49EtUTT0/agMHymhfIS7uBuhZOTXTHU6QB/Kp
	9VwhRyV2a35
X-Received: by 2002:a17:902:ce86:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2d74dbfd59amr186110335ad.3.1787979765241;
        Fri, 28 Aug 2026 22:02:45 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([113.185.106.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fab4dsm11383715ad.13.2026.08.28.22.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:02:44 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: lee@kernel.org
Cc: mfd@lists.linux.dev,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH v2] mfd: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Sat, 29 Aug 2026 12:02:28 +0700
Message-ID: <20260829050228.42638-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_sleep_ptr().

This allows us to drop the __maybe_unused annotations from PM callbacks.
This is a straightforward cleanup with no functional change intended.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Changes in v2:
- Change commit message prefix from "drivers/mfd: " to "mfd: ".
- Wrap to 75 ish chars for commit messages.
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

