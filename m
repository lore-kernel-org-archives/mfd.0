Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B596F37D11A
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 16:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575849; cv=none; b=SFJJG9qRpiociiVuLSd2gfQUEdJiygbgG+T2dgwi88s34atRdgUzZgfKXU7bTQ42C1HkT2+kaUcjYFPBOIVvjLt22bX/6Wtp4TbYZprbFBuxbsLgxuKI2prNBy5d25xYIfjxmDMeUTjNV7qMpfaGzXGYjNw6QbjwMsZRWATn9pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575849; c=relaxed/simple;
	bh=jzhzRVq7BASQjDartlB8xIX0fc5cN6M65blwwfuQnJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LyCVm897JcUB0M9k+P6Us7LRgjjGDZOBDYspq2gOjW9mB1tYkXGKPMILPzuybpWnTOzF3OSnnzin2pBNxHaby5y9qBLkUC+kKNel13g6vR1PJpBa1lrL8WUwfTGcIA5gONZLncdTPAxwhqhxIEjf5NnQSoa9b+yrp4QsDF1ZLrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmNINxSC; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmNINxSC"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f16so1095003e87.0
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575840; x=1790180640; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6nrA08QHaqyBffA+mNJN9lkq4Lm82slDbnwzoPxRENI=;
        b=MmNINxSCH2E9r69Vfu+I7OMtTRLC2clDQ4/B/lt4di3PhxqraZvOh5mKCBC54RtGqQ
         9BLC5WvUn3EsdTdsQCjR4lSKf04ne6jvDNCBpnutdEXsCsVi174flTFNo2Lh6tqmOccT
         8Pk/9YYChG3uhkBwNT+XdxMLPgUx1vbM+aDM+vgszrJrFF2Ha3J/DdJ2jz2nJjjAlE9f
         DDJOwUfqhnVSkUuBEyVdl0D07ELnrzTSrxU14ckTNVpnHqT2q2wsGyerA+a47n2E7KGc
         ZzGkeD/ic6uzIEOzVVEiQsO5fOy0ehKv9xJyeDBqqNFngn/U7z0AZPirQuUtw5+0itV2
         Md1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575840; x=1790180640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nrA08QHaqyBffA+mNJN9lkq4Lm82slDbnwzoPxRENI=;
        b=qR7rajk0A81jNyEbxIiGjCHysLZwSkqr3nnAJfCAjYeFiV93KeSYOjVZW+uH/KTaUs
         pHAOw1NhILc1HK5hcAA+Vb43kcwbc9AL+9cLRCXhnzl2T3fGHeoK/F0sqtrt4A/AS1+s
         SMrYo0C3lQbzh08x0nkLXYpIrX5RAp7+0DbBIHOslZxF3RnrZJe7K+btVQDRXO4h0oeY
         YjeS51qliuTGko3MiLBMUVxFvyP2p4pOct7BGBu3YN0GetEvi8pAjqsgOrjr9GEIVUbd
         DrRad1YQbptN6EHnA2hYD4arJKjRTe/wPa1MCEPbrdIjtAcWbgscY1E6svxJmuw9o+EI
         MpXQ==
X-Gm-Message-State: AFuF++m1coOsyJ8v5irR0adm4+1Zenct1TlrH28W4i0TxtxiY8yxgxiI
	4S1JPwE6x66n+rwR/S8L2Re7coK2B/7H9HThLcAhd/sALe7FEUYMyMg=
X-Gm-Gg: AYBFou315ACdUs92N2+B8UgyFc2XqUAgvsM2r5+XOqCFo5+AvsVLoltoMIOpcYCo6R6
	gs0SN0W4+nmOVNZbpPLG0B1QrnqCdDCdFITcKNvW10tGv+jSy0XLiPrZqOzgzkB7A2qMCyapujz
	201JvJr7Ojmkkf/hNhIP4KsV0ROxPOW6trmC+MhTeSbUw6k/h4nhAESTFnWzSctNjNiEgwa+ZQr
	vbLfLzcjaB/BmgNVbQF4mvHE37g/Ep/AYUPw0X0WWN2TBMzqS4s3HEKWx4hWSrCbB5ygbf8Dhjh
	sONaCgOwBettkdZHPc4kjPzzGqUz45TTg+mI4TpZ3dHHk3TUYXn9gjYGSLaY+poIlbMPIPpK9Hs
	A6iOJXlWQB/NoGdNxvADHHVYE8KCCejBChSC3kzJ8BifsNb4sTcRpHU4v8aYYAn5hDUs6ldvD3J
	c1m0Hh4VdMBM99PpTzET3ucSC1I4FDtRab/T01S6B31xbS28ZWESr2Gu2GeOoYV7D8irwVcpZvp
	XiQYcgnWiZwcTsqpeei2NE7
X-Received: by 2002:a05:6512:3b0f:b0:5ad:55f6:1ec3 with SMTP id 2adb3069b0e04-5b8b661a3a5mr1984413e87.5.1789575840449;
        Wed, 16 Sep 2026 09:24:00 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57cc66fsm1036205e87.37.2026.09.16.09.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:24:00 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 21:23:48 +0500
Subject: [PATCH v7 2/4] mfd: intel-lpss: Use plain octal values for file
 permissions
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v7-2-eb51d41f55e0@gmail.com>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=jzhzRVq7BASQjDartlB8xIX0fc5cN6M65blwwfuQnJM=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqsKYntMYpWKjAwufiOQpd0/qm3peZ7hV+MAQo
 EEvIft3A62JAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqrCmAAKCRAT637qmaOf
 ojrqEACLCAsDQkObxcWyvAmnuMHXBmg+s01Me5+U4xeRh8mdKP7pocghJfxBxWSMUgBPm46ATYX
 k/B+P0bxicJFxL5uyxzyAU0o3CmpB8lovD02is2jHBlifXTKEW7qy9oP5nX2ZN/M4oINLHsuhCM
 W9DNJlWAsH6gAALEYilsmBUar5QvwFiE87aBv2UdgDhT1UtKKZ3TxBrKV3DfT3q4TXYOHxFjDmw
 xMUbF68qTzCC6A4XGGF23VzsUv/54HagN5HNcBBLQwf6F+aLKlOlkifcxOyhjY26Q202Wze6xoM
 kHLL/MrhF68MlymJQoA+7Y3hxn0eushaD883rlwSAccdqF2U0s3at0CX0GjGqNp4POWcz4cn8G5
 Dm2KfeElV6OsRT9TCCby0lne2TY4mgrzxFtUbPonxspwLp/cBApmVfkaET1FugUWHTS5FMTOn9h
 Y/0/M/31c3fcz1fLGMwKGpzyhOg9VqtFKAop2CcPfaBIOyZqq3jq8jQhmnUbIHs8SGJ08x4lNGt
 Bbz4IdVL98bxEh/avViaa2xwJhC27fXURmyAIrzZEnSyPPDjfTvF8NTM/hKCUZwMHgQTO7YMyUC
 TXqde8BUK5JUil5ffuPXKGhBZEbGqsA4GtKg7VAYNZkwEooeiPTYnXDdwrfC2q2o3ZLSvRbYIhV
 pqrdpOD28TM0BvA==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

S_IRUGO macro is obsoleted and not recommended to use,
therefore replace it with plain octal values.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index b6958e99cf54d3c8eeca1ba38055a9389678f6c3..190de88d146aae9418566adf36a47d11afa90b2a 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -151,9 +151,9 @@ static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 	/* Cache the values into lpss structure */
 	intel_lpss_cache_ltr(lpss);
 
-	debugfs_create_x32("capabilities", S_IRUGO, dir, &lpss->caps);
-	debugfs_create_x32("active_ltr", S_IRUGO, dir, &lpss->active_ltr);
-	debugfs_create_x32("idle_ltr", S_IRUGO, dir, &lpss->idle_ltr);
+	debugfs_create_x32("capabilities", 0444, dir, &lpss->caps);
+	debugfs_create_x32("active_ltr", 0444, dir, &lpss->active_ltr);
+	debugfs_create_x32("idle_ltr", 0444, dir, &lpss->idle_ltr);
 
 	lpss->debugfs = dir;
 }

-- 
2.47.3

