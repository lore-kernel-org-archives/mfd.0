Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0709A477E48
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509432; cv=none; b=XIXVCWxV3S/sMH8aFvG2FE96WFbOlgFIrhl8OhPFU2b2E6dMWLmIKnnw+T7GZarkPlbHFgPxigPykRb7YVhrbvJga143J1tECBtTPmMBmZ4wvByDlIXrzZk/5mKFHNzCdeYJutAmeCajFXs4CgZY7rZRU0BvuxkDNnsnjBK0wnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509432; c=relaxed/simple;
	bh=0J9253uCRHW7Dyg8hqYskvGYiZ1mSfxyMzfcf6OnIpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HAgcfG5wY8SOXqSPZoQEc8FCoQ1YtN3xtFEysumcy5yK8+L+NrmLUu7wDy6HYOYY7ViZQbbqSDtwVjGe+8XS8N9zzEOAM1hS0etyMsBjAZZUz/d9eoFC+BFm8eo817u+6IF3pKOUKDbcCbLBF+k2HF3q+D32jClxOAasc/hSMrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NAmBBWbW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NAmBBWbW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso428895e9.0
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509428; x=1784114228; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H5jhc6YVXr1FZGUjHnU8wtQTNwuB/nx6OMzkF778AIk=;
        b=NAmBBWbWe1KevCGQDEd5YvA99cNaeKNCV8PhAbwLnlbGM4ySNschtaN7sKHRb48Rjw
         yXeZmyPNQ/4yy5h70xx4RY4rIRTw17AcflnV1GYuUAmEqIpieFdEvAj5qKs0mpoe3NC9
         kLrxQ8mhNs2ernP59RahMwLWoFMstugOKCx0zo+AVwBgaR+x3E5LLeg6xBptf53uQV+J
         vkiW6hh6E3aHpJwIhHLcGrEPN4Q/Z5bPi4xQPdr/tilLebhRAOpriOcMELCAjADF6E/x
         N7PpQ6iOYdgxcl+ROKAsa2XBA/IMZAbV3wpOw05yx0KLHLImnlBMk3II/4apxF9Av4+J
         jkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509428; x=1784114228;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5jhc6YVXr1FZGUjHnU8wtQTNwuB/nx6OMzkF778AIk=;
        b=pgyuwH1/VOc3gHCkwXHUjdJZ/k0zBUqUaoIPjE0RU9p5PjNNmYT3GULV3hQhDNEBcz
         tNDzzGP6WaYZ8NnDU6pndeCWEEdjlDEnprOZmoaP+lgtJjMVFbeQxuDEkbJOW5UYdAlk
         81RRO0mYt/+DYWJkY+6WKrZCQNyosfzYA/saRV+6bXAAgIgLHZpsi1CKT7iEArcDopIj
         0Q2NDXmO2YGzkgnd2XCVizZFXRP/tWZ9OwZBbo9CXXhwxmpGJjH+TD2qVeDPJdu5WaOX
         I3TDTXdfol2TvsgBZg3O/l+gw4W2vjwrgj96P716qK0f8iDgqYyEfebCMtmadMx2P4Hf
         qTSg==
X-Forwarded-Encrypted: i=1; AHgh+RrDfdcgCbu0GVuuo+sfB3pR3WYT5DDJRIEBRm97/ZeNdZeQrLIeuuPym1g1nLBe5Q89uoE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcYlqDTuMVl4tsX1KakmdWjGtHnPhpXjzoN6PvWEf15hFaGiZK
	9czLdrnp/TAwABKFr13IyFimxbEL71aSft95y0NdCNsrIv5rgSepz5DNRmhcIlSAIug=
X-Gm-Gg: AfdE7clRw2CKO/CLWUcgGCLgN97vBN3AUT/yCZE8JiXdV0LUnDw01wj1ca4yCMZTXVQ
	PIzTUd9zGLypvmxEBaRzTqVe1K90ObKrGpw6zZ6jSIs1c3t5h2KCtTmsRVhKy75gsG4zfqhg+1i
	YJX/gokgs2atE+AI9VgcURw7t4yMiqAktX9PdKYXwohtUUQ3qS0xQ9COYf4qxawXtdLgtOSJKUF
	rEGzPDBpvlKDTjq/NlD6K2ru1Gc0fQUR7SHPfwavLnJwzE4vgxMGsNfhb+fvVE/N2Ajk4tByWXA
	7HXXWAngA3D49pjmiNGmq3LGCXU5SuPZFF4ME6nLxE9eQV/8+t4DWWE+oA5pWqiWvywjIqD2F9C
	2koaZJ8uss2IGcBsOSf9mFGQ0cwYB5vChE7YXs3uaHoz6FjAEb7U8ZDg7Q8RekKTefjAMzgCNh6
	TE1DKaQMbGurDxfGEhrDVgt6lZ2u7RoCVaQVeuHAtowprd7A0ewOJSHekRLi+3ZdHAH4t7tt61O
	SfSTFdk0QHZAzs=
X-Received: by 2002:a05:600c:8a1b:20b0:493:bc4a:fb55 with SMTP id 5b1f17b1804b1-493e68a4fe3mr15360095e9.38.1783509428075;
        Wed, 08 Jul 2026 04:17:08 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0fc1348sm139152395e9.14.2026.07.08.04.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:07 -0700 (PDT)
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
	patches@opensource.cirrus.com
Subject: [PATCH v2 18/23] mfd: Unify style of acpi_device_id arrays
Date: Wed,  8 Jul 2026 13:15:25 +0200
Message-ID:  <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4214; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0J9253uCRHW7Dyg8hqYskvGYiZ1mSfxyMzfcf6OnIpY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjF+I6MmqkBGKUrusSTty5Wd6pY6NBJpKQstM Cx54fZb0x+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xfgAKCRCPgPtYfRL+ TjaaB/9Bj0Ig8aVXwtojSbhDug3A8xTOrdYsoU6TfRqDcwnihXXeHEv9ANrkhWRgB7frpeqSm/j 8h/7ZebRBi9RtyxTbveJTRKXsl9lFoutFI069UqPfHmvk1r+snMBpuKXJZWCsvcadcHdn2GLLnH V6Nno0vTo4dbXE42ODJ/ejdY/QKg2L2ym0QhxMIOAi6MgWmTLVtlZSirtVEQYt/sY4g7xzUDHPk /QExt7hcnVLY4+KQFot2+yjCzrnvTAUsFEQFZlj1V9mitWIVdPy2/OjZsR8nQNTrhaa7kb1wQ9t h36GXbvBpfh2GCzPUV2Ehx6eUpM4rWnLeJ+Ug3j6ZFWbyLA6
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
index bf02189b9a70..9b3a877f44fb 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -469,7 +469,7 @@ static void kempld_remove(struct platform_device *pdev)
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

