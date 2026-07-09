Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FA43801D
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616422; cv=none; b=fHYiAPlrLpF91Rk9y9C/OLRqVUCNrFtNa+yq0VSFnxIgH+k+74e0eVpYowFvHxxEaaPufhP/YCRTvxJoCPAcFUzr4RBMYF4ZM6QkBlw3enUTYhkkuTdQk9CQDUj1QhiDQteV9kO/wLjKj9VtgYMDDbhJLnEeJ0rk3SAOnTMvdRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616422; c=relaxed/simple;
	bh=TkTGMnesvFFd2t1ImlsHzihfrszC5JGjADA5VYMS/Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mE7MhRC4XJrXP5tZ3UnOeI3/9dJ6zNrnvMooauu6YAGjDPssX+iXyzP9j4VIij670XGSScaCuY5RPirD18cVtBfguIwSvTLbC/Rg1yojHAJsbeAXH4FFJJHKTHNP8dyO6uYWTG4UHcw7gVLXsVwzoKcQF7Zn+593rp8ZIR/07g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=J+N2Trm9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="J+N2Trm9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ec555a26so242835e9.0
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616419; x=1784221219; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JAmRF9mTaJatDYc7qm7JFzLCBNYq1vSrvVh5zN0/f+8=;
        b=J+N2Trm9giRXDvrFVyMO//bIvgjGMlbimbQDx9PWDAiCjHijqDLM3xTCawslYWZA9X
         MBHSGIDtUIk8ZnbqwhhsJ7r7ubbJFgkifZitLfnMLD8V0um/f+s6WD9esJ4QCV5YJNkG
         YVb59hBBCsFrS66MPqpaq7TqnS3RFwg7FZr91M2RWa3RkL7UADp2JQcN/N4x6HlsCk3x
         YiwAvpSigAm4faD+Mt6rEQIbChlOBZqeuk+KW9tOCvVxz9wrutHQrUkFzQdrep+2rza6
         2Is/jA515w2RaMTDsVXlNj9D/JppwdgoLoUJ8zTveQbsLjx/JVwqdZpah2barXYQ3toO
         k7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616419; x=1784221219;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAmRF9mTaJatDYc7qm7JFzLCBNYq1vSrvVh5zN0/f+8=;
        b=n+ecJanNuuBVX6G4u3KEY59+jM1O/ZmdIDxd6fk5HlfcLC+fF0cCTYUjWctHSqVEQ7
         9sB0llzR4/BYc00AYvnb2lCJtvi4pWh8Te2CbvJp7mgP2dFXiR5zhCtgN8tiU0Uc9JVf
         C1yE27/uCOBPCqDlu3NxNhQg57HzVDPlmHr8GPwci4EQMh4pkBHhYmgVM5g1qqiORupQ
         d5QxauzxZs/1TronvwgiNWz4LPxSoMchey1yoVMMeC22ZFuhT9dTfxBchFKEI9bk6wg1
         l1cK9M2ooO4FBMHY4c+Fx1OYBWSztRnMMniLCT74rVbB3p+cg0k/6lJK5ZE7e4NAR4Q3
         IRyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF1JWEU495DuN8dLwhM1ZWEswkvC7UMZ4+9rutscHp7tZwfW6trDl0jUAGkuzgPQP5NF0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbWg8iXzsK5hxXXHFehEMa87IzCXnnYgf9IAj/zsl4g90qgXd6
	Ee2m/15LBGXrfJzGRu8ejQ9PCSw3HjnsyLK7rHm/0za8x0ZZGsRw9avg30rlnv4sqaw=
X-Gm-Gg: AfdE7cn8RjUqT7dmlsrA/S7VXXnK6nDAcFNn/2372oA+zUBtU5IBAq2LOWU2pIV2nO+
	WDn1A1Rqme54JM6UDxkNA0+8xbxdFGtYb/tGi3/se0BdhvMv0dU8+lo5KM8qQsHxbr/jhGBaVEQ
	D/NTMwnO28ZkS4or3UnlCFMBrF+13KUFSvCcr51bXc2lEvnFD9GLzqC4p8P+Yy+2loG5u2I06UN
	v/6d+yzYqTHmaJzegiPyV4RjyAdi/3hFRinu7FvvrUI2Z5nv22Enj/bBAW3UsWw+2Y6y3fbi8QQ
	hao+ROCXScKHmyTp5q6dG5EbSy3TW92iZ2NF0KW3lyEF2aCUz748sVJ1k89TATh3VjaUwn+Yh0a
	yl4OtzHBshZJC0KWS+8F4BZyuVahAgdtraCCRVGw87qYO7XQeExzUfE2UIQI17/NNZbKd9eG8Xa
	oU+1HaSPvJlkOlPX4QCUrNjuPaeJR59HGgI2qdtz2eGOvVCuSEki989PhAv+L2CzLIw1SsJOj3F
	dvA
X-Received: by 2002:a05:600c:4fc6:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-493e68ce3b2mr82123025e9.28.1783616419283;
        Thu, 09 Jul 2026 10:00:19 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e5a6240fsm110766575e9.2.2026.07.09.10.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v3 11/23] mfd: Use named initializers for acpi_device_id arrays
Date: Thu,  9 Jul 2026 18:58:30 +0200
Message-ID:  <84158ad2bfe67169913c42fe132307362330a6d9.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10219; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=TkTGMnesvFFd2t1ImlsHzihfrszC5JGjADA5VYMS/Ns=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NMSOx027Cqcd0B9sr1Mrb3t1b6uvzAwvJrs 46/ixM2aBuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TTAAKCRCPgPtYfRL+ TvEAB/4uxa/rUO6zMcHVxiU/9eiEerzYJbNmHKI0pSHReEnx1nxUN8BuMxLwk2sPOuyYCkVB8tU ZjUkfk5oBapVX5ctV/ARNuUd3UoWOlemRwXm6IEKjKrfgEGdVJBXGp6yb5NjyLylsVC9P04ejyK fq7qvU8uD2d4b1vdQ5Txl0ta88a2jznDBinoBo+BM4jQdHp+JpSEPNgFkP+FZHd7xhGrg1sxcNG db4Y5TSm+JAeMTy+y6Rjoh+eHXz/tQanqXEaR9bW+k8tOF9OfDhPXfDefil7WOBDacnylqm9JfN AjXsyhD6ejowmGh4+02dTXYZwJ/T84czepskgkhXwVd7iOBg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
acpi_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cs42l43-i2c.c             |  4 +-
 drivers/mfd/intel-lpss-acpi.c         | 58 +++++++++++++--------------
 drivers/mfd/intel_pmc_bxt.c           |  2 +-
 drivers/mfd/intel_soc_pmic_bxtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c |  2 +-
 drivers/mfd/intel_soc_pmic_chtwc.c    |  2 +-
 drivers/mfd/intel_soc_pmic_crc.c      |  2 +-
 drivers/mfd/intel_soc_pmic_mrfld.c    |  2 +-
 drivers/mfd/kempld-core.c             |  4 +-
 drivers/mfd/loongson-se.c             |  2 +-
 drivers/mfd/upboard-fpga.c            |  4 +-
 11 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index cbe05c3ea910..e9cb4fb9854a 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -65,8 +65,8 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);
 
 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id cs42l43_acpi_match[] = {
-	{ "CSC4243", CS42L43_DEVID_VAL },
-	{ "CSC2A3B", CS42L43B_DEVID_VAL },
+	{ .id = "CSC4243", .driver_data = CS42L43_DEVID_VAL },
+	{ .id = "CSC2A3B", .driver_data = CS42L43B_DEVID_VAL },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index d4b24a717848..19fc36164d89 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -135,38 +135,38 @@ static const struct intel_lpss_platform_info cnl_i2c_info = {
 
 static const struct acpi_device_id intel_lpss_acpi_ids[] = {
 	/* SPT */
-	{ "INT3440", (kernel_ulong_t)&spt_info },
-	{ "INT3441", (kernel_ulong_t)&spt_info },
-	{ "INT3442", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3443", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3444", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3445", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3446", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3447", (kernel_ulong_t)&spt_i2c_info },
-	{ "INT3448", (kernel_ulong_t)&spt_uart_info },
-	{ "INT3449", (kernel_ulong_t)&spt_uart_info },
-	{ "INT344A", (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT3440", .driver_data = (kernel_ulong_t)&spt_info },
+	{ .id = "INT3441", .driver_data = (kernel_ulong_t)&spt_info },
+	{ .id = "INT3442", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3443", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3444", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3445", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3446", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3447", .driver_data = (kernel_ulong_t)&spt_i2c_info },
+	{ .id = "INT3448", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT3449", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT344A", .driver_data = (kernel_ulong_t)&spt_uart_info },
 	/* CNL */
-	{ "INT34B0", (kernel_ulong_t)&cnl_info },
-	{ "INT34B1", (kernel_ulong_t)&cnl_info },
-	{ "INT34B2", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B3", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B4", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B5", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B6", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B7", (kernel_ulong_t)&cnl_i2c_info },
-	{ "INT34B8", (kernel_ulong_t)&spt_uart_info },
-	{ "INT34B9", (kernel_ulong_t)&spt_uart_info },
-	{ "INT34BA", (kernel_ulong_t)&spt_uart_info },
-	{ "INT34BC", (kernel_ulong_t)&cnl_info },
+	{ .id = "INT34B0", .driver_data = (kernel_ulong_t)&cnl_info },
+	{ .id = "INT34B1", .driver_data = (kernel_ulong_t)&cnl_info },
+	{ .id = "INT34B2", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B3", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B4", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B5", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B6", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B7", .driver_data = (kernel_ulong_t)&cnl_i2c_info },
+	{ .id = "INT34B8", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT34B9", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT34BA", .driver_data = (kernel_ulong_t)&spt_uart_info },
+	{ .id = "INT34BC", .driver_data = (kernel_ulong_t)&cnl_info },
 	/* BXT */
-	{ "80860AAC", (kernel_ulong_t)&bxt_i2c_info },
-	{ "80860ABC", (kernel_ulong_t)&bxt_info },
-	{ "80860AC2", (kernel_ulong_t)&bxt_info },
+	{ .id = "80860AAC", .driver_data = (kernel_ulong_t)&bxt_i2c_info },
+	{ .id = "80860ABC", .driver_data = (kernel_ulong_t)&bxt_info },
+	{ .id = "80860AC2", .driver_data = (kernel_ulong_t)&bxt_info },
 	/* APL */
-	{ "80865AAC", (kernel_ulong_t)&apl_i2c_info },
-	{ "80865ABC", (kernel_ulong_t)&bxt_info },
-	{ "80865AC2", (kernel_ulong_t)&bxt_info },
+	{ .id = "80865AAC", .driver_data = (kernel_ulong_t)&apl_i2c_info },
+	{ .id = "80865ABC", .driver_data = (kernel_ulong_t)&bxt_info },
+	{ .id = "80865AC2", .driver_data = (kernel_ulong_t)&bxt_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
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
index 6daf33e07ea0..ff6223d6f54b 100644
--- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
+++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
@@ -162,7 +162,7 @@ static int chtdc_ti_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(chtdc_ti_pm_ops, chtdc_ti_suspend, chtdc_ti_resume);
 
 static const struct acpi_device_id chtdc_ti_acpi_ids[] = {
-	{ "INT33F5" },
+	{ .id = "INT33F5" },
 	{ },
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
index 627a89334908..d3db727c08de 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -252,7 +252,7 @@ static int crystal_cove_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(crystal_cove_pm_ops, crystal_cove_suspend, crystal_cove_resume);
 
 static const struct acpi_device_id crystal_cove_acpi_match[] = {
-	{ "INT33FD" },
+	{ .id = "INT33FD" },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, crystal_cove_acpi_match);
diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 77121775c1a3..9d7e1881d693 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -139,7 +139,7 @@ static int bcove_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id bcove_acpi_ids[] = {
-	{ "INTC100E" },
+	{ .id = "INTC100E" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, bcove_acpi_ids);
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 839328bce150..3370a13d581b 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -438,8 +438,8 @@ static void kempld_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id kempld_acpi_table[] = {
-	{ "KEM0000" },
-	{ "KEM0001" },
+	{ .id = "KEM0000" },
+	{ .id = "KEM0001" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
index 4c668e2d2241..49a95b8e4ca3 100644
--- a/drivers/mfd/loongson-se.c
+++ b/drivers/mfd/loongson-se.c
@@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id loongson_se_acpi_match[] = {
-	{ "LOON0011" },
+	{ .id = "LOON0011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson_se_acpi_match);
diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
index 9a9599dcb0a1..6674f4a1d2fe 100644
--- a/drivers/mfd/upboard-fpga.c
+++ b/drivers/mfd/upboard-fpga.c
@@ -300,8 +300,8 @@ static int upboard_fpga_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id upboard_fpga_acpi_match[] = {
-	{ "AANT0F01", (kernel_ulong_t)&upboard_up2_fpga_data },
-	{ "AANT0F04", (kernel_ulong_t)&upboard_up_fpga_data },
+	{ .id = "AANT0F01", .driver_data = (kernel_ulong_t)&upboard_up2_fpga_data },
+	{ .id = "AANT0F04", .driver_data = (kernel_ulong_t)&upboard_up_fpga_data },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);
-- 
2.55.0.11.g153666a7d9bb

