Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ED443CEEF
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616435; cv=none; b=uJDpDd5yBFYlvQh25uJVrW/OijXfg1V+XYtd/ur9hsmclw+MBsRk2jV04Mn2OkjqutCIRF16IhRJUQoRqADZq9N06T9wmYAbQL2PsGXCYZ2bl2KuWwCYWZBrKH7a5BaMY1Rxh5OTQoLEQkTBPBgMgYCBVLeUvaDaTTW/lniRkio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616435; c=relaxed/simple;
	bh=5X4nKYG/ZcbQCpN2w2hd6KcVa/LxQGHhCWV3uy0qIjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZCBMgT27BQAIVZmYxhdANx0MbYCWdPjkmtkRUnzA/+BHzLu+GgvTkgfMVVBfxUcdT65zQHaypLXF5UNEQP5UQ1GS22lNbQAfYXL/+wUzALCF9WeIszChPzdGKrU3ccnPm+rn+bpWMsoZ7W61VpUJiOJEEO3GlTEfI4YzrMBP/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=I+X3BNYo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="I+X3BNYo"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ec555a26so244405e9.0
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616431; x=1784221231; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y/pcbpKSfJcNlUic9sGarDYZLjUV5z3LnZUY0G89FY8=;
        b=I+X3BNYogOcF5g8u7ANO0kwdgHyo3GyvFJ4fIYjAO11FaNPUlI83S/7/FDfDY+BR3x
         jd4qR0aTK7UhTA6VNFJoiZqpYkel9i9unK1BioXDhs4Wn+/Vmfrdi6BCNsGDYH56onRA
         W6mGyveXRMwZ1YGGr52dmJpNd9bKx/E6dMiyQe2sliomJhpsxJPpH8bd5Ml8w59MCUKz
         2ug4km4X4dQ6bJubYG+i7Er0i5/jYSBtlOsES2/zuFoDzyeHbrP6sOH0Orn6HGMbIWiU
         2EwWEPLDnkL0Rb4sDEQqKU0UasoM2f9wmviLAvdn6+HylgrR02SWajG8U4/6osws9uHW
         L+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616431; x=1784221231;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/pcbpKSfJcNlUic9sGarDYZLjUV5z3LnZUY0G89FY8=;
        b=eA6RQcfw2Xrj5iCkSnNAr4+QIwj+6PA+80IubIVbjiZzmU84U/pa5XVSnRMkBJvqYE
         u9PNktRDgpwSXuRq1N/Nt3a2jcZM2gBhjM3boAHQhlw4TUJBcqBBhm5inrDKvO0v+xB1
         zwib2DWIWYWhOIswLIs/mCpV6QymTSl1/O5qHsWl5Inwsedya5lR1BXUkEyQ3+E51oeL
         qyIgboaiLjdxuFFuPSP0Hr/adI82iUD4G6q3O1syvcdb+zfUXAP0Au2zMMiZhE3aStjy
         5W07g7TVGsuE3LScCugv8UBXEvRviINIBiGXEmwIzg7i74KioZ3hsOC1+8TkD+zK4Ug1
         KsRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwWA6flmuuWBR+MrtgOY+VYRyZkga5EPqhxkYeBPCddGAUmWqHbPCNb+QvdH6zsZI51MM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7Xqop3bZe36o9X5rgUqYEDeKH5BrhlUptXsGwa8GjY4MWRk2+
	66msWlhGoOUmE/G0R7ivSmvBlW+JDCCQ8qzgMyIMn1TYfO+1oQFAc2gnknmImqIcWvI=
X-Gm-Gg: AfdE7ckzD4WdmjDZhgrBit26EPH1XdIYH6Va+dZ0w6qIrnmNZRpPUUqf6Eo71NGvyAW
	J+1bZ05Ddw3emlX5Mvl3WzMrebzk3yGloNMAlshBL224vTatg/5lHd6D4ZV564gb7lwUVl14uSI
	0YaDWmljboN9a+s2fgixLaVBalAyEgDFaI8bLXvtRLwZ0HDwL6xcxim5/T78lRL10ExJkwIoDKE
	5x2Lg8ngE8/U4XH52/7bQjcX4T+zXy8sVBMY2/RqAtUeD6gA3/Jf+qgeQb5ZtEGVBRPor+vADRj
	qIg83LIfIihGuTPW04JqIifwOc2hZ/vUCjl1X686UhbmAOQv1qpwjQvLRh4B5N5aPQEeWar9z47
	Ym3oGbzdZPSdqzkyu8V7coxUb7rCMCo76nny73f3nO3d+rJuzKt50lVZ74sWd9s0uPqGdVgbV93
	KohJKvIkKKfu4sxgw8NSV2zazhOHNVnSpfgowDNmIt7AmzPSzt+40G+Q/qrFPi21UuZX8Mma57M
	nlG
X-Received: by 2002:a05:600c:4fc6:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-493e68ce3b2mr82132685e9.28.1783616431417;
        Thu, 09 Jul 2026 10:00:31 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb70a372sm73749285e9.7.2026.07.09.10.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v3 18/23] mfd: Unify style of acpi_device_id arrays
Date: Thu,  9 Jul 2026 18:58:37 +0200
Message-ID:  <5b32d03de8e0e3293f625e9886e0ee849ed4e511.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5X4nKYG/ZcbQCpN2w2hd6KcVa/LxQGHhCWV3uy0qIjk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NfjzkocamEpX4ntS5pfDxVLbTEIAfats0Gp auNMA1jOjKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TXwAKCRCPgPtYfRL+ Tiq3B/4pZiXqQiZvqHTMWD/a1xKPxVIEKs8RiBDyg1eQGIkuOLTBzsKo85yV5ZKHTBWRvQzpTfx tugD/PZHhXWMwMyTYXkEOYVNXoAws7+2nXClDYJkT4f0rc6cglmSZwChaVTF9Mrlup+GhFeSale UDwRcsJ9qyMLT9OCNrXwNMNKcl+jf+cWWjwz6jqyeXFQNKFG4wO4Qq/KLwvNYgauUHxzYAv5jkE s3dhrzPsPaiSQjO0nP1canC5fw5MumTXZhqFupxGAd+iMmdKboSrhZp1vilCu8xD0IfXg/lPA5V XIKTkTdC+RHwn0G8iyb0MRfxoWf2PXwSrR8qIOa2jdbMyk5D
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Update the various acpi_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c              | 2 +-
 drivers/mfd/cs42l43-i2c.c             | 2 +-
 drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
 drivers/mfd/intel_soc_pmic_crc.c      | 2 +-
 drivers/mfd/intel_soc_pmic_mrfld.c    | 2 +-
 drivers/mfd/kempld-core.c             | 2 +-
 drivers/mfd/upboard-fpga.c            | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 2f595e2b883c..57695e46e00e 100644
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
index e9cb4fb9854a..6a4e4ddeb268 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -67,7 +67,7 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);
 static const struct acpi_device_id cs42l43_acpi_match[] = {
 	{ .id = "CSC4243", .driver_data = CS42L43_DEVID_VAL },
 	{ .id = "CSC2A3B", .driver_data = CS42L43B_DEVID_VAL },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
 #endif
diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
index ff6223d6f54b..49f4138961c8 100644
--- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
+++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
@@ -163,7 +163,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(chtdc_ti_pm_ops, chtdc_ti_suspend, chtdc_ti_resu
 
 static const struct acpi_device_id chtdc_ti_acpi_ids[] = {
 	{ .id = "INT33F5" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, chtdc_ti_acpi_ids);
 
diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index c1c02700ef08..95588caa2e77 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -253,7 +253,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(crystal_cove_pm_ops, crystal_cove_suspend, cryst
 
 static const struct acpi_device_id crystal_cove_acpi_match[] = {
 	{ .id = "INT33FD" },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, crystal_cove_acpi_match);
 
diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 9d7e1881d693..531d8b8be44d 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -140,7 +140,7 @@ static int bcove_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id bcove_acpi_ids[] = {
 	{ .id = "INTC100E" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bcove_acpi_ids);
 
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 3370a13d581b..4c1e7a0ab0ee 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -440,7 +440,7 @@ static void kempld_remove(struct platform_device *pdev)
 static const struct acpi_device_id kempld_acpi_table[] = {
 	{ .id = "KEM0000" },
 	{ .id = "KEM0001" },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, kempld_acpi_table);
 
diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
index 6674f4a1d2fe..37c3c50aa6e4 100644
--- a/drivers/mfd/upboard-fpga.c
+++ b/drivers/mfd/upboard-fpga.c
@@ -302,7 +302,7 @@ static int upboard_fpga_probe(struct platform_device *pdev)
 static const struct acpi_device_id upboard_fpga_acpi_match[] = {
 	{ .id = "AANT0F01", .driver_data = (kernel_ulong_t)&upboard_up2_fpga_data },
 	{ .id = "AANT0F04", .driver_data = (kernel_ulong_t)&upboard_up_fpga_data },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);
 
-- 
2.55.0.11.g153666a7d9bb

