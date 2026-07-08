Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136E2442118
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509422; cv=none; b=RvC+vrr+ST07fJKuped7FB3rpBhWtmwx54f+w1y57Qfdsa2k3zTPruAN63mtUAOejdrUzyT4+hGu8gibcrPXG06+rP/Qd+5z2wyebBKHgWMNXixpZYNoqLLmYgu2DDhx/Op7uU1nR668itidxIoBUFcPx1o54Sahu2b99UEzgCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509422; c=relaxed/simple;
	bh=J3BCIbaF8e4vQqw/PDZunyp9IDodwLegq1o3eYSO0mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxaVy9F2ovn2jiuv0TaSEeYWpX8Ma75k8rBuDma4aFSnEMl9Ukn7Trffthpea1fY4xlLa7y2Qiiz83+my1zlj280ROVdNA9z9CUirz8FbKftXyIbKE9U6wovHWkEo2kae5JZtm5C6XyU6PqOn7BeyT/VIoTfznpBDQjjAPdW8bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=M98hmjxk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="M98hmjxk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47df343a346so239357f8f.2
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509414; x=1784114214; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gH6dydwyPFNhRyuhfNaMmzRjgqUkiRmdKn131qVwoZk=;
        b=M98hmjxkJRxiv8NhCOhff+ItkJDSaalVG0EEiHcaKuEjUVYs4/MBtHYf1f7WvqnB+T
         gvu79B8dBRjc56TCAuRzkjZGtOWky7wy9p5ZhwsYGf+fedEZIxDXy4Xc9SJOyDoN7zCu
         uEK0quOaQP7OVXd2KgVZlBzBgXpTX0jrZzYWXVVuHlzjd4uA//x0l/9Anhs6tYuvXiRg
         +gXnJUw8fJNzQYFwe6AOBBq4oN6rJSRda3MDICno85gWqpSkf8rJjAU+h70oZTcsGcfk
         oQQJgT3OfDNyPYYB7Df5dCl2kZTsecG1zp6ocLnG2jvOlS4owfLeWmCFA0BEzOIRfZch
         kMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509414; x=1784114214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gH6dydwyPFNhRyuhfNaMmzRjgqUkiRmdKn131qVwoZk=;
        b=n5h5MSCWlockD/hLgIoCan8olGX6h0Fq2iew6vMo21kR+3xa+eI5bUZJ/VmmtpQI8U
         Ii3V+7Iap41pSh+v1WBDvE4juBnp6YP06CLJTL+KRBwxXq+NTrtoAB5WePYpopGIJlLj
         1YXD4f7u8ayWqZ6N7NtVsKl4D8p4BSp5H3ymZ/IR7Fg9AnjVSWB2YgKYiWE//4G/acNV
         hUY2wNzsA2jrEGwrPBrhEWwSfdPt2pX1QNYbfdhwb6zDNzA3HNG1tW71ioSXzjtPf1cc
         YwS9Utb87cBtjuQXYVJvxvRef3mUjp1S2ILCPXN08aLKo9zzN42woKMiwzLeEQgT7BvJ
         OzwA==
X-Forwarded-Encrypted: i=1; AHgh+RqM3bOmnCCPx6jiOWLvWVJLHdUEYyj6CDlY+NxdYdmb4MVqgLi04vczQoao5lgS8TWCc+g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yza7buttYLqKqrPc3zejzeiKcgBLWUXuwtX5SJNQe+R9zU5qmiU
	PBAV+Nap7xlayQJ+B/YLSKX+GC/MkzrfrOspEAozEUQ+8+6bRZU2WJEobAnd0FIkAko=
X-Gm-Gg: AfdE7ck32G8MCa6qkG4NX8Fxn0uOi8bhDCzT/8ycyEZUP+/A9174MGN+yqxW8fyGfT6
	hlxeRXCeUCzfyZGCTMWYy8UQe3D4fQ3HgfwttaNw4+k0+tG85bHdSzL5WiDi9OAXkrPAGe1Y4H0
	hl5ohaXuihO9dfcgEf8ohxSDzQEExFn5xaOahsb2B1WtLkBIZjXkWg/zlTa7xTrA+lGZnEKxNjN
	Y3nUObRQia22TpgDm6qg7K1EhNNH4lDqWHQawuSel0Gif2Cnvvjlvz1K/uTPX97P00RTZmfYj7J
	tOg9Zh4sDQQxL3EcX2fTAEi+G1luXfB7YJjwD8C2e+rfaPN0iJYkzcMizVv9A6zPSw4BrjkfchA
	BBDZ7cncBvNXSEHasQPbV08azwgbqZhKsqGDhdiOR6zt0sBY6bMbTmJ7kLelWR5JlKOTv/CFImX
	lV8V25MSdrI6lnC3klAnYr6Xu4YkweeyptsV8hOSENT6CYU1BgYtp1xfhmCV4cT2qmEPfl5DvEu
	01E
X-Received: by 2002:a05:6000:711:b0:474:2929:474c with SMTP id ffacd0b85a97d-47df075c5fbmr2017777f8f.36.1783509414164;
        Wed, 08 Jul 2026 04:16:54 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm40327132f8f.29.2026.07.08.04.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:53 -0700 (PDT)
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
	linux-crypto@vger.kernel.org
Subject: [PATCH v2 11/23] mfd: Use named initializers for acpi_device_id arrays
Date: Wed,  8 Jul 2026 13:15:18 +0200
Message-ID:  <8c8ffcd41b59446ebac377341971d6572f79c842.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=10158; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=J3BCIbaF8e4vQqw/PDZunyp9IDodwLegq1o3eYSO0mQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFeXiedhVGv/CjI38AbIgdYW1305yn5X+5Uj R++VCSddGKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xXgAKCRCPgPtYfRL+ TmnzB/9mwObEejDkn1ndeET/GQnhsVJ7ddHuPe2KW+N2CZuHtDk2mlZj9i9//MA8srzP91Ji4j0 Uwsy+CgX8wJSDJbQiYRhVmxsaoDPuBCRT97IBFK5DbAyiRWj5i9IQFanDi74qNo8DcWi4OClHz0 Hj5n5ne5AS/CnTQILaezvnpzHHS2AGlpz8z43bYfXfLPWs9QFXdu54R1A7PfbouEiqsMYMRimsD U66SuYs0SCOnh6sv0Rbb2X42bRap4VWnzH1OGcEDk3jaXbxZCzm7KbMoeuYCGPlfg3LegasFhi3 l7SdjoVGnElr32HPpqLtQvMDB0qK3AoyaLGClYD2b5LuunzB
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
index e60736380cfe..bf02189b9a70 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -467,8 +467,8 @@ static void kempld_remove(struct platform_device *pdev)
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

