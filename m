Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8172C431A5D
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 19:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142976; cv=none; b=ia8y2U4Bl0EpwjqdedFieq2xv8lxq6Rzbkxm2SsxErRmFqLX6HbBZ2Kt9PH/Nn4EXtssCUeHKlbC4UwlSsRZCJz6V6adejbKodM5IFizaNRoSZ9I0dRs4ydgQDFdQr51lHuCzFA0v11HKd+ckSix+U6LRyGJCjr+rcthYNvj2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142976; c=relaxed/simple;
	bh=mcQaMmV5a95EhV+C2IlJM4DSXer0+NWfA0EBGtIg44k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A40yWlQYWnLzxm+c8J0Ks9R2PjHdcivpIr0Gp/ly2G6Vr9RpLwaseC1brKVGmYDCXKFf0WxXc6rauMaABn43muKM7ZpMnFnIbx5ugMa9yTKZ8VlqQv+/4vB/FEsvn6n/SrQ3Lvxl2JpjXu4JWoIR5pJbS8MkZ6eb+u1M2eyPFII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBtfUy+2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBtfUy+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784142970; x=1815678970;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mcQaMmV5a95EhV+C2IlJM4DSXer0+NWfA0EBGtIg44k=;
  b=WBtfUy+278kZawdBfPjf6aFaCa/fzg7ScAmcNNefx1vNMoigUk1KU+nw
   sm0snun4tyDJCMFrKLQ1A5bzgrJl0t2ZhJ1FAvASmxHImah3HqxC2uPyP
   bxa19nZzXu81w80iFB7mkxbhdwiaptG98I6K0/Z3doGz/RYsOYcoVO37T
   zQM9IQUhfogxY3DTA+F/gmHCQ3nFUsqRswu/hYOhrji3tNyTvCDV4Bqvo
   l8qhxdg0e/yiOAH/ng9HSfjYpN7xgnQMYQpUp3f+Evnud8MtVFePMBxW9
   B6XlwlOe4US7zPreUWI1bgqari/aPYfC3u9J6rzgkboGxipnpCZqiBRD+
   A==;
X-CSE-ConnectionGUID: SpErBZKARASPJvN/wRK/rA==
X-CSE-MsgGUID: 2ZO0f+jbTaabYBHGBYkylA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84836794"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="84836794"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 12:16:07 -0700
X-CSE-ConnectionGUID: ojKnnjxAT3yO9h6uCDoPWA==
X-CSE-MsgGUID: /3i1+QfoQeqTLKhdXNOAoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="253666313"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jul 2026 12:16:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C64BE95; Wed, 15 Jul 2026 21:16:04 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mfd: si476x-i2c: Get rid of duplicate NULL checks
Date: Wed, 15 Jul 2026 21:16:03 +0200
Message-ID: <20260715191603.1325479-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO descriptor APIs are NULL-aware and since the requested line is optional
we don't need to have an additional check each time we want to toggle GPIO.

Get rid of duplicate NULL checks.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/si476x-i2c.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
index 55700ce711f4..9bce720a0a08 100644
--- a/drivers/mfd/si476x-i2c.c
+++ b/drivers/mfd/si476x-i2c.c
@@ -130,8 +130,7 @@ int si476x_core_start(struct si476x_core *core, bool soft)
 	int err;
 
 	if (!soft) {
-		if (core->reset)
-			gpiod_set_value_cansleep(core->reset, 0);
+		gpiod_set_value_cansleep(core->reset, 0);
 
 		if (client->irq)
 			enable_irq(client->irq);
@@ -197,8 +196,7 @@ int si476x_core_start(struct si476x_core *core, bool soft)
 	else
 		cancel_delayed_work_sync(&core->status_monitor);
 
-	if (core->reset)
-		gpiod_set_value_cansleep(core->reset, 1);
+	gpiod_set_value_cansleep(core->reset, 1);
 
 	return err;
 }
@@ -242,10 +240,9 @@ int si476x_core_stop(struct si476x_core *core, bool soft)
 	else
 		cancel_delayed_work_sync(&core->status_monitor);
 
-	if (!soft) {
-		if (core->reset)
-			gpiod_set_value_cansleep(core->reset, 1);
-	}
+	if (!soft)
+		gpiod_set_value_cansleep(core->reset, 1);
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(si476x_core_stop);
-- 
2.50.1

