Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710F751993B
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569427; cv=none; b=QkHCfoSdXIdNfMC2M1fwUbI18qrLRnszB5z3npZRnI8pl35gNSwvCcfvHuavoVn8tdVmUoeaD59IQ1TylMX6YLtQojQbHVILCOJxDqx8rkIqc+jWIRqWHETlEIV2PoY5IrPD2MTljm+pTffgTwAPovrl/3bm5oktqoPcXag+W20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569427; c=relaxed/simple;
	bh=Plcq2owhNg0Sj/G/B7MmlGcqYnIdbvu/V2UiRRh0xc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gIr4sJkypnAcqTQJBL4rhmKbpzvgzz3Xqy4AHb//kCn3uQwJ9eMkGlMk15BiCS3LNwsC6RN+XNNtsWsQ8Ss7hS39Lkm1SZaM82xLBo+ftPEe0UdJ52zM/iRnv3WtesXWYjioWo/okPFNi4qRjXjIc5g8UwcZxFsv6ETNRFNTiUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBgg5c+h; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBgg5c+h"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so1153036e87.3
        for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 07:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569422; x=1790174222; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmw0ERx25M/EqcNmLRr7smyny30OD8/FRmvQ0lL93qY=;
        b=rBgg5c+hZUd2jezXiBUeGJRUOtJqov8kMqWcNg4XS/XlXp4XwcViRkyPuo54srgxKS
         WACXAvPLo/oZvDzL2uhPFSSzv2jhmbpIYB+n2AeLX1ZzmWtYviF1Xm2cXDldev7nHk4l
         nuRfqaektanHIUDsZcnydT6jsXLldeZK6O1LogOO55FoBdyrcHLlOqUQEkFKfkJlhOM9
         O5NDi/cgAYZqqS7lwtLBWACWBTRpPU0vVmC064SJn6HSAqARx6TQDoKiLJ19xFht67gq
         uu4tJN0zU+Q9PYlijfd90Hzaz7cUjXXX2VLocl8u7Q8w7iKvWqxKLb9/I62DQ3DIo1pc
         KGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569422; x=1790174222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmw0ERx25M/EqcNmLRr7smyny30OD8/FRmvQ0lL93qY=;
        b=LLLJ/jqWKMEYgNjilj5QmtvSH4dB4b4D1XCA9+kty/5klR7vmw1Q52sVQu2gcFJ0w3
         nLlp3kIJZ1H+AxDEBn3QW9L5ct9Tw/T8UfeLT4GaHe0lSnoqd4cSuuD1mMo3HZVcuJ2c
         xHU6b5NZnoOaBHMhkfcfY8KHqMcwA0eMS1xeBmZo7PPdUJvXuzdosMR4vwaXtVK3OQJg
         //hzAI4HEr7PT43uX0d4iwM5LTpOneW+3CkzOD279ZsjDPcxTH72YrTF8+ioKgce/NkC
         kfFtwMlifCevvb7tLEW6MuYv3qcoNiG0gqB/NTpaKX1BxnaOK5mCoyBVKxm7jINzRjJ2
         7rpg==
X-Gm-Message-State: AFuF++kJAcMK1JKAXA5R3WkEzXkm50TxkHyCK3XfsWMnSc5J+AYsggNN
	IMRCH7r1s86zWHofQF0RtPwM2LR0l53/vCGXpORcOq4H4AxitY3d2hE=
X-Gm-Gg: AYBFou09Zq5rP+L6+mXhF5QxLRNiKr9uuKMUFfO41DevKWO6v9Jv6lTQ7X3UmHmpPju
	LvloGDVhmMcGYD1VkLenBboeDbe2MZg/MGVpJOGxWReuzhGA6ZvNax+1DWT2itVG7QKn5jMNOQ5
	ljwzsKNGPF+wA3sYdm14XQmQcDUapU8f4W8nt+mQcYjM2NJ0kHYqS+D2KO15KClmUgaAWtSpwxj
	77GRdfereFTEJGn9JRIQFgmN+/Zx3JuLCdXqDBFKWnRsXW5IS0LmLvF/f76ckmXk+rOYxXYQwnv
	BBgkpt0lhWmfCXU2G+1+S/rRaqiRKV4+fPKAI1Wwpf8rvmMtfMuV0wm/pf2P2BIlII+1d3F8o0d
	ZSy6DQKmdJjAX057Bnb7YfRorYuqLL0RhP36Hijmn8Y9rlCq3rQ+YQsC2FjZExt6CxEEFpieKGO
	66HMn9gm9bDycAK/PlDA3+3+Eq795y6OtWCi6DR1mT5xf/qUlBdFWo0dF1L/bvDxiHy5/GPwpPp
	5ge8dB6ewegO08Sas7DeSwaJA==
X-Received: by 2002:a05:6512:6cf:b0:5b6:1a7c:28 with SMTP id 2adb3069b0e04-5b8b6649eefmr816014e87.43.1789569422105;
        Wed, 16 Sep 2026 07:37:02 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:01 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Date: Wed, 16 Sep 2026 19:36:42 +0500
Subject: [PATCH v6 4/4] mfd: intel-lpss: Switch to debugfs_remove()
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-intel-lpss-debugfs-v6-4-5c118ac430ed@gmail.com>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
In-Reply-To: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=Plcq2owhNg0Sj/G/B7MmlGcqYnIdbvu/V2UiRRh0xc0=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmIhbltBtihMGq/M3BExEHj+gmJXlfOt0sEL
 5ye5ii2QNOJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqpiAAKCRAT637qmaOf
 omcoD/kBF3WXjeuCpjqW3XLz6MXZGZWv0ilitCt5mDR63fcZFXitPP4p+PiduKXI+vB2OVRVkpv
 816SWIAoIPBYVqqVs7pYPesWbkhBc1sXWc7z47xDJMmFrv5162mfISLSYUj1lVEvTCdffaO/l/W
 aVTGA7G9x/hHfU1pEkMTC9vqdpTJQQN8Ta0KEqAVfGM5hxKyjDYDIZ5LR3QcK9pc1cOYyw2kWFO
 d1XhVflQQJYkq2Xdcw2tKEgNAO9xRf3lYr28r15AENBiP5s4BAKe/LdzUXvi1MCELQUcd3JiL07
 tPpGWpahtZEbHqdkH39+VcYAr9Rdvf/0ItM4FYS7kDqiQP00qax8DEs08+C+w4bi0fk3LLjmBqL
 hG0KJFVpf5Krvt8z7224CiB5lQ44XYXKMC9fhC7A/b4tcJ3UXqiQcWscfcZlivM2UfsH5RyIhE7
 nbdFaP4p8biHj4rTGEfBeXC+m9wiOW/5U3CpQD/ubQ2XEhs5xOQkGajkGrSwwXwA+K6qEb/qtQm
 seXCn2VzSoZ0N8tF5G3FzsTGRGsx0W37ya8qAdSzjr0A0YGZDpM+jYValWsrSOZjR5tPFrUDDdd
 qm/yWICgh38i+ycs0blPeiCp+m39MyLqlCh3HhrMCxPmXX3BAZ8v5zPKC0F+0vXs+/IBTQMeYB3
 ooAHXWWv6f07IxQ==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

debugfs_remove_recursive() is deprecated and has become
a macro for debugfs_remove(), replace it with the direct
debugfs_remove() call instead.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
 drivers/mfd/intel-lpss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index f1a8feb0fdf2042a3b6a8422400cb8f9511b4876..beb01252f9021bbf40b293c81181b29e9b61bf56 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -160,7 +160,7 @@ static void intel_lpss_debugfs_add(struct intel_lpss *lpss)
 
 static void intel_lpss_debugfs_remove(struct intel_lpss *lpss)
 {
-	debugfs_remove_recursive(lpss->debugfs);
+	debugfs_remove(lpss->debugfs);
 }
 
 static void intel_lpss_ltr_set(struct device *dev, s32 val)

-- 
2.47.3

