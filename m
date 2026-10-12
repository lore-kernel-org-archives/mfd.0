Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0CB3A05C2
	for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791848604; cv=none; b=q5sfLMQm+a64IZMSlRsiHB+y0YnMNJ7y67/fgqplOeXrm/2cUqSOIibnOS6IXnR5c+WYIGBDS7WHmqRKd8Ufynr096HKHxRrgK2FlGUo+0ZMf5DAu+A25EX2Vq62FlDSxoAzLWkf/pYZ2J3H1zn2AaTgXd+km1KVIm7Bu2yVoIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791848604; c=relaxed/simple;
	bh=jnetyFY4MvDjWyjq73T38LnUAuNPWU70GaiNALUUzIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j56gstIwsPHB/LlIb/hmmpVs88vSQNDxXnQ2XGU0gGZulohpIZXtWA0D8uvf4pwFZODkDXiistSjXk+72tNtw8Ohkn3Tls7DHSpXEhXAe+ULEWeAHo7csMW3u0b+zwln9ajLkMVWKLr2lg0IMQ7svmC5RvkKIiP2cZ/Xw/xooAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7CbzgKV; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7CbzgKV"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53381e53b80so31153841cf.1
        for <mfd@lists.linux.dev>; Mon, 12 Oct 2026 16:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791848602; x=1792453402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jVN5OjZKu3a1LoT1KfzJzBHe3FT/eHM/KiKbMoh3YVw=;
        b=g7CbzgKVhiwCg4kN+1xfIgZymcjBvhCcDREgZ/eMx2Hg1DzvxcwklddyZyj3/qlgwt
         rByZqSJsuTnWUM5sq0BwCRJ/9kSyGeMZKIuuThHejfrDmkyuV/a3iSqLh0lI0jl6PNrq
         TLlyxgIbnz3Efd85jC727T2zB4fIl4qvEHCOQ8dgR3LelSgNb2W87ku1Hs8apdpZ9JS5
         11qpPYkPKjIURUiHhlJfgvwHgciQfcTVgIANkov3LNV+9kpsJb4ySfxnzi2meAznsRPs
         dP6LfrlzsznmLdA+VqT58qK4W+t7uFr8FnMEjjHRFWp0irBQtMoVnKx0aCdbRXdOAfR+
         5CCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791848602; x=1792453402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVN5OjZKu3a1LoT1KfzJzBHe3FT/eHM/KiKbMoh3YVw=;
        b=xQIZS5MiL7etxJzytLUPegSK66eML0XuL32QNJ1sbErMhYe9W9EhqyM53lpbVU4qC7
         34D2OrsDJ/G4p3eCX1oder5vYCMSg1N54dTjRQmbLGWaOx7jLoFeTncryVGgkSOUgni9
         LSfjQdPNbyB9qmNwKr0/qPhLLXaOKLm37yNaOdTppJdXWp/oEDY1QH34XPBRyxSBTYsl
         YPDQhBjohbC4Sz8T9ob9kjYVBQQSDLkCqCUWmb9oQq/Dq538BB1LmRk47DDDOlI7S9JO
         qUCcXCs6bbeFn3Ws8Mu2nPkf5bR42/2sNzHesBfV3BEm/nm5YquNaF0kSKuxuZ8kiawo
         W6cA==
X-Forwarded-Encrypted: i=1; AKwUvBw44hFLh/YDxggzqQM3Gg3jILig9JuGRd8kt2Q3Jo5vjcW7l6gd7WCv9aC+/aaBXt4cSII=@lists.linux.dev
X-Gm-Message-State: AFq9FYI9Riz5s1kl5qivHw6ENftwarKMsTCCmtOSRkizfkMfx3e65SLg
	MzbiUgeiq/cqqu/lgklxPybVgznPhY+brcFtJPAOKK1funXfKtsqew+A
X-Gm-Gg: AYBFou0fsmf34fq+9ZrLBx2UNa8BYSWnoZe8B/tICNMfVSDJyj3dJ+9HM6J3Dwwz77o
	ydkMs4NyAy+5GL0F1y4qYsFWcijHKp9MpaIS9sR7aj8mzf7qenxGdtbsxCmY2hlFvsEH7kQ3z5F
	a0wTvpvxll9ru1VasfN+MH/g5gUHa1VR2MRCzQ50kvb+XF6fItYE2ntXzTLvLCHYJXo9cWaBHsM
	Z1Gu5W4XVHbOi0LHWW+MBzGslga6mHOAvJG7aKL+d6mNFXXs/wFkw/6fcbs516h+IB5RaowEFCx
	myA6wujCYf8C43Svr4nD38g8i2ER1GTrx3EGuObOq+RJvSYtv3hCbvDBUUHMbaJwt8216itpQY8
	2WQFxAPAubrtbArV1PAygj1Y/oXJYagve7HMt+gPSkMmyJNV6k2tSBzQK7t61diX5q7wIsBAlGa
	focTFAsIntIBjSBzy0m9/6IVEQ0Ak4hsga4iHjsHDzrkTjzMQIpXkmMvBT9BpDpv6h5pA7ygMix
	pOUhKxxodpdmJCEaAHpXItedBO0DaqIl03mHJzaNWxPDJa8qtOBGGgdBiodpPnZ5ya96m12of74
	3TgxDJgskZPinDsU+k27fhyiif4Hya9V3J9ceqdzNovWZq9zd4XrhnzAMjGE2d3+hmaK1CBVlX2
	8Q1jnrxNevngRXMQWiDT6+VH+BVrRHI4O4oUbhswJcdU90jpO
X-Received: by 2002:a05:620a:4444:b0:93a:48a:171 with SMTP id af79cd13be357-93ebd287f47mr1776631785a.51.1791848601443;
        Mon, 12 Oct 2026 16:43:21 -0700 (PDT)
Received: from localhost.localdomain (wnpgmb0311w-ds01-161-139-200.dynamic.bellmts.net. [142.161.139.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef500809asm109030085a.16.2026.10.12.16.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:43:20 -0700 (PDT)
From: Riccardo Oliva <oliva.scorza@gmail.com>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	oliva.scorza@gmail.com
Subject: [PATCH] mfd: dln2: Fix use-after-free risk in list iterator
Date: Mon, 12 Oct 2026 18:42:30 -0500
Message-ID: <20261012234230.17966-1-oliva.scorza@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In dln2_unregister_event_cb(), the iterator variable 'i' is used after
the list_for_each_entry() loop terminates to free memory.

Fix this by introducing a dedicated 'target' pointer to hold the entry,
isolating the iterator to the loop scope and removing the 'found' bool.

Assisted-by: coccinelle sparse
Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>
---
 drivers/mfd/dln2.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/dln2.c b/drivers/mfd/dln2.c
index 0b1e7fd7f..7cd64aad1 100644
--- a/drivers/mfd/dln2.c
+++ b/drivers/mfd/dln2.c
@@ -157,25 +157,24 @@ EXPORT_SYMBOL(dln2_register_event_cb);
 void dln2_unregister_event_cb(struct platform_device *pdev, u16 id)
 {
 	struct dln2_dev *dln2 = dev_get_drvdata(pdev->dev.parent);
-	struct dln2_event_cb_entry *i;
+	struct dln2_event_cb_entry *i, *target = NULL;
 	unsigned long flags;
-	bool found = false;
 
 	spin_lock_irqsave(&dln2->event_cb_lock, flags);
 
 	list_for_each_entry(i, &dln2->event_cb_list, list) {
 		if (i->id == id) {
 			list_del_rcu(&i->list);
-			found = true;
+			target = i;
 			break;
 		}
 	}
 
 	spin_unlock_irqrestore(&dln2->event_cb_lock, flags);
 
-	if (found) {
+	if (target) {
 		synchronize_rcu();
-		kfree(i);
+		kfree(target);
 	}
 }
 EXPORT_SYMBOL(dln2_unregister_event_cb);
-- 
2.43.0

