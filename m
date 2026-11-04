Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808583;
	b=x53hlOD35VhWhNiOQulWUQ6dXFvvEB6BbAJzj7jKjx97yfygMXNHT7U1puAHdY00z5t1
	 cXR7Lg3QZRG7FFwtBCW5ObQzolHKguk3CoMpKVqUjEmD4V/fnKBJbl56uoHaHu7h8ysT5
	 ZT5NA3IqlumodVXJhuzNxQYdG2B2OF4jEPv0fjqIjt9oCTyhRKPCZKiIWrahnrE8yKv61
	 DF1xbT1sv1opUBffeWqhhoVTJoYNIwhvobvdKrpBGgOVaISex7kNL+wghCk6rPteaK19f
	 25L72SfVfSa2sQbAnqGrj98ZzrxsGZt9wQagP1gh+ZIks9Ee0vgntDpYSE6zqVu/k8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=I/5XjpRkuugiUvajtiQst7cmnkAsliJPRUsIIgPB5lw=;
	b=p3kUDM4avOJOiZtRyd6DQxdJSmFcfREdqpOmTIi1YJuOrFgAIlJKkrtQLGyzNcixkWaX
	 6O8D3UBYnZDZPSwKNTX1OvOosdnALLGMqO2N2CEb0gCwkEdVHiSUIwCknN6x/wSXy6smg
	 e2+RbDICYg8smq+JrrcTG/j08Uz8Sc1KnJX9qd/Q/r+rFQJ6+o2O3wdYLuo+E6x9lcZ36
	 hsg+ppzQuLWznP50U6Ep4vc5i0IMnj2Iv4DXxI+2RU3KWYAwP65XhGC/DBT/LSbarea+0
	 k/6LBRjU9yVpB1aRcacZKUAzWVFQ708Adj/9+eBp+coWdXJedkvVMSZNUdpD0H/ljEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aFN17xjm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E37606D80E
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 16:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88E37606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aFN17xjm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso7986405e9.1
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 08:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793808582; x=1794413382; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/5XjpRkuugiUvajtiQst7cmnkAsliJPRUsIIgPB5lw=;
        b=aFN17xjmi23oC2/YShW7ja4GzVtffQbmGrhHTbu8jfJhWywxF7H1VrOBPe43rDFKhv
         1o+0eJA7yAF6Pybs58ZoXG9/SPWw7eh7uCSiYdGpz6Cl5xFYC5KhYRGH36ZXG/qqlItO
         DW+pbT7vuZ8gOrBNoI2Ty/RUfSGkAmNO7/0ZaYzsUl7z4eUTZM8x1VRHcC6KZpVB3hzc
         fQDC2hqfvwRmrf5tZZJULZnM95fz1FF7v9fovjPpxqU2CSEqhFMVQ4L0FbkUPb3LnNiD
         x5jbA8nEWgqfU3xZtrw80rauMUjz2eNu2wwEcpXDJU7T+b63iwpyYchKzE2ALjwejYp5
         dufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808582; x=1794413382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/5XjpRkuugiUvajtiQst7cmnkAsliJPRUsIIgPB5lw=;
        b=o5DlYQYchh5dVZhPBh8gfPK66YMqWXXV+/Snv3hyDmbEqa1azP+wkRRew45MW8D8tn
         tIVGOSnGB0dRCDxER2uYCma509hoBz+pnT2lHssSKdANkC6rcedrNuMk44F6F0Kimz/3
         hVwPyGoCPEZPYVZnvZ8MdCsMrXbHRwPXmv6+/2/LGMtSD9dpFvxwNajan+ZrYg7oV6rN
         K0JNYaUe+HBIk4PdM5I73eIa+hWGVpxC/5lm01i2UDKjspaPSn/Gi4m0b5GQlicbYe8C
         xRtf7GWG5ZVPV7doyheBf7uIcqwhxDD748JzsX6hk6nNu9bDYaR+5A2G2cW8ZSEH+92R
         tx8A==
X-Gm-Message-State: APuU4Z/aq/nGBFXxquM1B2w/lgCe7PT4d9VeYQvM0zTfemifsoGnnBpo
	k47y5HxtlRoG9Z3Kx7rC+ZNYykUF355XgyhCScrBajJyJFHzIxA0ffKVpM8xVkApT2c=
X-Gm-Gg: AYBFou2uPsfugMlexnNGiKDfwQy+ZA8yP5ZsBzO3d0z5YQ81L8AS/IEUtG2kjcnlpl2
	/T2Mg/taIAZlxJ5Ehq54DjMyL755kqC+WIeKNbFSRwfFqHh/CLsMh5XloNuRt21TpJMW2miUfQX
	YK64maZYpn+FkyHS35tphcb9734wZ7a8W2/EoElrWTPEa+SEQy12IkVTH9Gwk7OSrN9piW9uQvH
	tY8JOTxNVKuxNdDHjgtW7lnzDPYj94tXW4zNC5YXiiiv9a/3Ckj1PJdz2O2ar6W+6cit68lwAUC
	a5KM0HRvqjZiM7JCL60T/GwnfY3+0oBvXZakptJ9DqVXXsbMAJR4IN0pSW736wRiRdhmafnHEB7
	wJc78juigmkLAYgo/y0ELqut0V7+5v06Xx2EuouKJ6A/aWxZZETmOZUNkaJn+0ZN3myNNJUc53F
	XxGIt/QtOGPvUnbZu1US4QYdXJgfMw4RZ+BfL0r4D2Wtebi+PdXvz9Aa5aeiG2xN+PDgfEz7V0r
	PQZu4QzpmyZO+j6tnnDbTaeOGoRGzP2E5siEh/45sDdw/JSVRtBiRrg5r5WZ95mBW2iMu6Azxqz
	glCgzcHJY0AufH3IVi1YiGaQVrndtdn+PHbbKdQriYjlmg==
X-Received: by 2002:a05:600c:8b01:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4ac1737c682mr380593515e9.8.1793808581916;
        Wed, 04 Nov 2026 08:09:41 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:458e:d526:4eee:2f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm85089815e9.3.2026.11.04.08.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:09:41 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 04 Nov 2026 16:09:31 +0000
Subject: [PATCH v2 2/2] mfd: Use named initializers for acpi_device_id
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-acpi-mfd-v2-2-64b9dee3baaf@thegoodpenguin.co.uk>
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
In-Reply-To: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-crypto@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793808577; l=6931;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=Vj9aA4kkyLkATCkr6co8ZKsAFirU7o8I3IUzmoP+oTU=;
 b=/CnulND5qAnaKTESsxoCTPHT8xa5xKKx/FKC3JkDQ45uhPQYBjiw6v21n1uS5CQ2D0px0j8Dx
 AjLvUGtJn+2AYiELUoqAmHrCh/nqs72pLWkwd/sLS9OEwdhIQGQ6gBT
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mfd/axp20x-i2c.c              | 2 +-
 drivers/mfd/cs42l43-i2c.c             | 8 ++++----
 drivers/mfd/intel_pmc_bxt.c           | 2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 4 ++--
 drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 4 ++--
 drivers/mfd/intel_soc_pmic_mrfld.c    | 4 ++--
 drivers/mfd/kempld-core.c             | 6 +++---
 drivers/mfd/loongson-se.c             | 2 +-
 drivers/mfd/upboard-fpga.c            | 6 +++---
 11 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 5c93136f977e..c5d0d35c7fb0 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -97,7 +97,7 @@ static const struct acpi_device_id axp20x_i2c_acpi_match[] = {
 		.id = "INT33F4",
 		.driver_data = AXP288_ID,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, axp20x_i2c_acpi_match);
 #endif
diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index 2f1862199618..89dca295cc57 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -73,10 +73,10 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);
 
 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id cs42l43_acpi_match[] = {
-	{ "CSC4243", CS42L43_DEVID_VAL },
-	{ "CSC2A3B", CS42L43B_DEVID_VAL },
-	{ "CSC4244", CS42L43B_DEVID_VAL },
-	{}
+	{ .id = "CSC4243", .driver_data = CS42L43_DEVID_VAL },
+	{ .id = "CSC2A3B", .driver_data = CS42L43B_DEVID_VAL },
+	{ .id = "CSC4244", .driver_data = CS42L43B_DEVID_VAL },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
 #endif
diff --git a/drivers/mfd/intel_pmc_bxt.c b/drivers/mfd/intel_pmc_bxt.c
index e405d7513ca1..6a9ad1f135c7 100644
--- a/drivers/mfd/intel_pmc_bxt.c
+++ b/drivers/mfd/intel_pmc_bxt.c
@@ -414,7 +414,7 @@ static int intel_pmc_create_devices(struct intel_pmc_dev *pmc)
 }
 
 static const struct acpi_device_id intel_pmc_acpi_ids[] = {
-	{ "INT34D2" },
+	{ .id = "INT34D2" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_pmc_acpi_ids);
diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index 117517c171b5..08fedf3d3fee 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -606,7 +606,7 @@ static int bxtwc_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(bxtwc_pm_ops, bxtwc_suspend, bxtwc_resume);
 
 static const struct acpi_device_id bxtwc_acpi_ids[] = {
-	{ "INT34D3", },
+	{ .id = "INT34D3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bxtwc_acpi_ids);
diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
index 6daf33e07ea0..49f4138961c8 100644
--- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
+++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
@@ -162,8 +162,8 @@ static int chtdc_ti_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(chtdc_ti_pm_ops, chtdc_ti_suspend, chtdc_ti_resume);
 
 static const struct acpi_device_id chtdc_ti_acpi_ids[] = {
-	{ "INT33F5" },
-	{ },
+	{ .id = "INT33F5" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, chtdc_ti_acpi_ids);
 
diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
index aa71a7d83fcd..413d2fd4f86a 100644
--- a/drivers/mfd/intel_soc_pmic_chtwc.c
+++ b/drivers/mfd/intel_soc_pmic_chtwc.c
@@ -261,7 +261,7 @@ static const struct i2c_device_id cht_wc_i2c_id[] = {
 };
 
 static const struct acpi_device_id cht_wc_acpi_ids[] = {
-	{ "INT34D3", },
+	{ .id = "INT34D3" },
 	{ }
 };
 
diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 627a89334908..d39f73ae6773 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -252,8 +252,8 @@ static int crystal_cove_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(crystal_cove_pm_ops, crystal_cove_suspend, crystal_cove_resume);
 
 static const struct acpi_device_id crystal_cove_acpi_match[] = {
-	{ "INT33FD" },
-	{ },
+	{ .id = "INT33FD" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, crystal_cove_acpi_match);
 
diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 77121775c1a3..531d8b8be44d 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -139,8 +139,8 @@ static int bcove_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id bcove_acpi_ids[] = {
-	{ "INTC100E" },
-	{}
+	{ .id = "INTC100E" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bcove_acpi_ids);
 
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 47062f876e5d..399f1c97320c 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -470,9 +470,9 @@ static void kempld_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id kempld_acpi_table[] = {
-	{ "KEM0000", (kernel_ulong_t)&kempld_platform_data_generic },
-	{ "KEM0001", (kernel_ulong_t)&kempld_platform_data_generic },
-	{}
+	{ .id = "KEM0000", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
+	{ .id = "KEM0001", .driver_data = (kernel_ulong_t)&kempld_platform_data_generic },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
 
diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
index 3902ba377d69..49a95b8e4ca3 100644
--- a/drivers/mfd/loongson-se.c
+++ b/drivers/mfd/loongson-se.c
@@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id loongson_se_acpi_match[] = {
-	{ "LOON0011", 0 },
+	{ .id = "LOON0011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_se_acpi_match);
diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
index 9a9599dcb0a1..37c3c50aa6e4 100644
--- a/drivers/mfd/upboard-fpga.c
+++ b/drivers/mfd/upboard-fpga.c
@@ -300,9 +300,9 @@ static int upboard_fpga_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id upboard_fpga_acpi_match[] = {
-	{ "AANT0F01", (kernel_ulong_t)&upboard_up2_fpga_data },
-	{ "AANT0F04", (kernel_ulong_t)&upboard_up_fpga_data },
-	{}
+	{ .id = "AANT0F01", .driver_data = (kernel_ulong_t)&upboard_up2_fpga_data },
+	{ .id = "AANT0F04", .driver_data = (kernel_ulong_t)&upboard_up_fpga_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);
 

-- 
2.53.0

