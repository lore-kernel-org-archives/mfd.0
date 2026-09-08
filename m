Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBB758B6BD
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 16:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886437; cv=none; b=Ab8SU39nE1aKTa7gDAN8PzPvvHP8733PrpzQyquNGnNGWoVdlQNIClbEyiCFbIkwCWk6CUVaJVNkv1rZscBJ5Rum5bqfhqzxyeti52rj2L5pRuR/YyShP5YJl5w2Uc7+p09iHolGLiaQmYhcbIx6RJCN4huGDRF/yBL1yKq1ikI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886437; c=relaxed/simple;
	bh=9M7weo/ro39rmyV3qc6k67t2ckADpSAmD5qUSxEkVV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XsW1P0KMgHKctg5aWA+i6E2uTAFN1XeofNru3JyOoSV5+h0zo51ndiOLKH55zFUQJayqFYbCixypnBHMRTbKboA5IJXE3kwPFKaRZPnjzwQw6/V+JYq27OvWYGtFC++Sy/wf8HGwXFZGtG/yr2/RJLRDYmZh5CtlA0KIVqMj1ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hmEGfUSr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hmEGfUSr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b965570d7so55319975e9.0
        for <mfd@lists.linux.dev>; Tue, 08 Sep 2026 09:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788886432; x=1789491232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJTRRM399Ynn6HcZ5P+mZPLneQozNygw9v2NsKc0JRs=;
        b=hmEGfUSrFq27owfZUvVlsAJURizvjixiSlgtOfoTumcl8baNZGSKIfmMx7Q8qqxe63
         l9bKKFrRA/RcIT6Vl0BwI91kmjHO0PVIMU6MVa114/mBZ5AzWNAmw69FMDeesZUKYXk2
         Vf4RQh6HbKKpBwDh1BysudNRzCVSVk1Ye5MoPGXNLc6mMmGDE4gMHJA6svD2ZeesVVq3
         R1PrcgHf5OcqvctPQjXKOuanmp1cdClJWW1lHTASlSfRZw42kwaRAT8HBw+B3Znb6iK6
         687FPba1cEr/mNGZ17bTTCh9yunbJMpaCUH3r+2rQ0WYl97NikLQtb/1WAoj2EmHtd7y
         qZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886432; x=1789491232;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zJTRRM399Ynn6HcZ5P+mZPLneQozNygw9v2NsKc0JRs=;
        b=edBlVgvf/J8wdP3O2meHo4dPV/WOl+9OKoQlxnDKCjHQ9I9Cn0MwFAIYX1V/UHh/mY
         4EccV0tgDIdcSJJRsE18DwotN0fURyF4kxIWat8vc2uQ9At9aMkeFWj2vMay7T3v+TXz
         kyaWCIgFn3NeCOEmTm8lFkRNNRa0t5Pr4omkAuiJU5w+bRrAF3sWDG2pfgJR4dniQwhX
         RVafNF+SDcBzGe3cYm/X0vIWKcUkB6bjgV/+1HACVZVuDIGCui4+FHWkKEGtlLzDoPao
         drOKRQQ7F2ws8uuHHVOU0muomemF7Y/t87MGTOYMTsEDHa1o5AL9Ks6p2dQvIGTXdVQt
         7Leg==
X-Forwarded-Encrypted: i=1; AKwUvBwVIurg8IAInBlvK1HuFPHf2eCUER61s4w3z2Zk699WZ7jThIm44A2FzZUqvH+YxfmO8jE=@lists.linux.dev
X-Gm-Message-State: AFuF++mzXbulR9YFYZM5CDbpC9ViFIpguZlM4TQRSzSw8uaLNOkv+hq3
	CSbIbkP9dndspFXbt9uz5b/aMvlTrD77GOHdEGYLdftXV0m3dDDgHX+fv23pmcjDrQM=
X-Gm-Gg: AYBFou0RkIglNfSiKNRklZYCBjmB2zc72puWc87P6yK+k8GmMDySFzcUMJnPKNR5Lb3
	gYYNeBKzI+AwOKS+yRA987nRnGyOAeWvE0vxhksn9uVr5ZrLdpVVtv3Y23cZB/FoUgq0cvmb3mq
	SdLb+pfcVp472NFOSRn8fAEN4Ij+HvVtQTC/OgVC3+FOZqqJwh2OvONtAaBKbBi6Ko0C85at9cr
	WMbEi/sOwDyjKfAR5P+k2zl1pHNGXAKrkK9Ifwzzbfgi/L9+VQU82AQXmqMgdf1csEwnepbpILV
	P2VfOIWY71At7mQFMvy5D/R95P86o3lTOta230s1bVeo5Ik1vdGEZBpTbUNItZ6gBdLEPqs8q8f
	iaRVAQNksSbUmPhIAXWAFXqMdGqVlcaNoAS3kqSII8gGDSSWepzYa36XMLQerwCZkPlB2gXV2l6
	xhMHM8kaKKReNbb/zoi8Dic51olYciBLoqYpdWMIA29Q2OhnVWxlw2kk1KtoRzCgQFGd5ANMqq0
	ybgvwUQv4fJWudI8uuaFIZvLCyGh7VTh2xIk5F9B6NqafcX8K0=
X-Received: by 2002:a05:600c:4e11:b0:49c:f2f4:eddd with SMTP id 5b1f17b1804b1-49cf8268795mr324700295e9.16.1788886431855;
        Tue, 08 Sep 2026 09:53:51 -0700 (PDT)
Received: from localhost (p200300f65f19a9042cc2680c1f1bf2f5.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2cc2:680c:1f1b:f2f5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49cee5d476esm536676275e9.1.2026.09.08.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:53:51 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev,
	Manush Prajwal <manushprajwal555@gmail.com>
Subject: [PATCH] pwm: lp3943: Mark parent device's platform data as const
Date: Tue,  8 Sep 2026 18:53:41 +0200
Message-ID: <20260908165341.1423611-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=9M7weo/ro39rmyV3qc6k67t2ckADpSAmD5qUSxEkVV0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqoD2VLnWy5R8B5NkHwHSMkn0/k3VEl+14/KK+G 694a8OVKSaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaqA9lQAKCRCPgPtYfRL+ TnkDB/9+HZE7ZVJbhQULxt24ztlbksvRvJrzMvU3jnHIoTQ1Fhlcty9R37MkMJcuhFjDr3crDB1 Tt/UNPv+m2EXBZSS8iNvzuhgCEW45745F/EOetjt6VezzjdDf6West9mFHQ9JzdOViL5rScuzlC Y5RzXDvHHAQF3HJbel4MUyZlDyFNVlHjBuiPt0aS10/S1tsjjfKLn6YNuzs5fToCnan5TEX86aQ vPRPVTtAaSG7WJhc+htDPSactsXYa8TG5dVtXTZCClQdIofqOm2x5bapTIe+npYFrWgg5ZUOm8j Y1EN8uLSNFXOzwuOcj5aCOvSQGEaAqUAy9ShNRY4rKKTrRrh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Platform data should never get modified by a driver. So add a respective
`const` which makes it explicit that the pwm-lp3943 driver indeed
doesn't modify platform data.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I found this patch opportunity while reviewing another patch to this
driver[1]. A possible followup is to mark struct lp3943::pdata also as
const. I made a note to address at a later point (i.e. when the mfd tree
contains this patch).

Best regards
Uwe

[1] https://lore.kernel.org/linux-pwm/6a9d5187.d63de05c.175391.a17c@mx.google.com

 drivers/pwm/pwm-lp3943.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-lp3943.c b/drivers/pwm/pwm-lp3943.c
index 10537e74be28..0fde89018d2a 100644
--- a/drivers/pwm/pwm-lp3943.c
+++ b/drivers/pwm/pwm-lp3943.c
@@ -21,7 +21,7 @@
 
 struct lp3943_pwm {
 	struct lp3943 *lp3943;
-	struct lp3943_platform_data *pdata;
+	const struct lp3943_platform_data *pdata;
 	struct lp3943_pwm_map pwm_map[LP3943_NUM_PWMS];
 };
 
@@ -33,7 +33,7 @@ static inline struct lp3943_pwm *to_lp3943_pwm(struct pwm_chip *chip)
 static struct lp3943_pwm_map *
 lp3943_pwm_request_map(struct lp3943_pwm *lp3943_pwm, int hwpwm)
 {
-	struct lp3943_platform_data *pdata = lp3943_pwm->pdata;
+	const struct lp3943_platform_data *pdata = lp3943_pwm->pdata;
 	struct lp3943 *lp3943 = lp3943_pwm->lp3943;
 	struct lp3943_pwm_map *pwm_map = &lp3943_pwm->pwm_map[hwpwm];
 	int i, offset;

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.55.0.11.g153666a7d9bb

