Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1347C455610
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987268; cv=none; b=L2HpXzN5c1jQAtkWeyst0dWFHZ+nLzXqDCWCXototB4TsLqt/qTkOTPgl68pK+bmVxyEbhidZ/lHPzcyPVG1Yj284inZ9Duywb1hcdDluJpV0wxWnCVenk04v4MzszeTce2L9gODDHqNjxr7Mfa23hv6KvhApgtBjV4deaQGk3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987268; c=relaxed/simple;
	bh=jV3rXd+gLIZ1kbXj0TODJowVFnqZ1XVvvGYuSJ4XS/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NGwloGCco9f6RZjntVoO6WNvNlGj9WB7cRK+bdQMZl8NjTnfEmPOeRt4Nf17UwAGY2imEDATw5v4aKwJUmC3CUwwOEJbS4ixG7vijBJrS821dJ7MfSqn7bgORfBOohJdeCpj9zXqsfcsQz6D+c5vRlwh0sQM9EGfvHi+aHUrPFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSnBqCMl; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSnBqCMl"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so1983182a91.3
        for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 03:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789987266; x=1790592066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=71o9YI6lTkfQsxMzDOfAZ9YQ4Htmj8t9P5fvi3r60mo=;
        b=eSnBqCMlUN+8tWpLJX5eOAD0Oq27F4VKKHm6ea8qPfUJFr3DoF4SnUTxgGrQDGpFyt
         IvQ6YWr7fyQyP4pJUNfn6+nWg6rNWVxP26VLnb4KBwBoNFQizfGn42iux4wPj7fnUnqh
         F81wgTWyfz6F5DWNK2G0TeH3jEMjB2H9KB7sYDDdWtPeFOh+4VDzyYLdXyaVCznLdAyD
         Ps3moqBQSeYIoQD1eKpDWmG1Rm0HIcamMPWkXKGoWaPTvTrCfn48dhCEdKqeGtcNnHNq
         63fTzQj9kK2UI0dIfk1Qz/QArmtATOc7jR3oG2LOTPRo1QDtv1LAR8SGGB6q3ZhGQ6Wv
         jdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789987266; x=1790592066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71o9YI6lTkfQsxMzDOfAZ9YQ4Htmj8t9P5fvi3r60mo=;
        b=WHhFSKx2XweCi5Pk+xXBkUlTGFv9+wb1P78KFAkzr7iJXgPSpNWIw2TqpDnC91vD+2
         RBKpMBQq+pDxyfxpWRx/Um6JTkI5ltn/IUhFsUjjvjniDzE4JQ/4Z5ScO6jtUDMSQVZ3
         MRa8XZeTDtxzYKF44gwRyCmBiYYOet1E/AGUMK3I/bGqN/hT1sm1XqrVfX49oYDdI6D5
         adk21mYIurS4VYG2TXqKjJglabnM2X37UbpuUKvNsOdR7kCry6gFtyisOMHVpHUq18+d
         HdJigqubIhHsKIQ+GGaGrFeEM8JHHCw6Rg30EBjlG/J5qQQoIM3aRisEyjdE+ElHeyNi
         CgVA==
X-Forwarded-Encrypted: i=1; AKwUvBwK2du2zcnIr2tRIotlM26FppvaoRUiCKTbWB3COCTQy+sFeGJOWLMaVYgrDqY0RzoNfpA=@lists.linux.dev
X-Gm-Message-State: AFuF++mzB9JRjZuEGkJS63XX1NndzNF/3S2ixnfCjBH2rHcze1mS4GOi
	FGdjOfV7Hq2oF9u9XucUUdtFiAwdaE+EY/jfa9KWxA74a4NtnlnW4lFm
X-Gm-Gg: AYBFou01t6t5Vs2DtLtmFhvj/lO36sHxFapM0SCweMENfxlDezBWxxKTIvKjjmKJXgs
	QceBb2JK8uTnJ2ccWTd48ymAZv0ZfxLCm5TWNH/zViwDbzq+i/o+GvicMenvsaJgHVAMOgoT4hh
	idSn2LkIbpT6JbITIDFjOLUVUJVACd3piZlZwckQfC6vlmhwzb13SuB+18cPVzJQwaLDCLP3auD
	TMWclGANy8Vhg/HC/JRWtJMoZHZq+2ybKqmIAcgQSpiCkKXwMQQQXNu13ZpCVtEcbLKRjU2/dPE
	4g7qi5ccV5cf0oPHjY5PJNtLyw2LpkiLCgEREsk4kU+Y7a1r/XaeWLLmM19E788Ycey87vpMlob
	bBM3LEAXZn9jFqQAgXjtAmhBUJQN9mJXpTpKmKMY2FgXCB8Nq/c94E0svj5VSdYITVlxv3nQLfm
	jhUPEa+ydZHdiD0e10+WSz3+GxZmxqjSaAu6Wagq7URnsWyO7ZfKrn6rAKRjMNSbAw
X-Received: by 2002:a17:90b:57d0:b0:39e:6c69:f479 with SMTP id 98e67ed59e1d1-39e6c69f5acmr10028531a91.56.1789987266133;
        Mon, 21 Sep 2026 03:41:06 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a03ab822b6sm7600102a91.5.2026.09.21.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:41:05 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: intel-lpss: fix iDMA device leak on probe failure
Date: Mon, 21 Sep 2026 18:40:58 +0800
Message-ID: <20260921104058.353748-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel_lpss_probe() may register an iDMA MFD child before registering
the main controller cell. If the iDMA child is registered successfully
but the subsequent mfd_add_devices() call for the main cell fails, the
probe error path returns without removing the already registered iDMA
device.

Since the normal remove callback is not called after a failed probe,
the iDMA platform device remains registered and is never released.

Call mfd_remove_devices() on the probe error path to remove any MFD
children that were successfully registered before the main cell
registration failed.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 4b45efe85263 ("mfd: Add support for Intel Sunrisepoint LPSS devices")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/intel-lpss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 63d6694f7145..657b1e3fb896 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -455,6 +455,7 @@ int intel_lpss_probe(struct device *dev,
 	return 0;
 
 err_remove_ltr:
+	mfd_remove_devices(dev);
 	intel_lpss_debugfs_remove(lpss);
 	intel_lpss_ltr_hide(lpss);
 	intel_lpss_unregister_clock(lpss);
-- 
2.43.0

