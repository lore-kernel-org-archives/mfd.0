Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2272481A9A
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365026; cv=none; b=A4BoEtFkzm9uS6LI2jMbdOEb/gbmfJdIKZvP5D3cbhtHxduP4uNBCzBWpsj4eRFraMuekKoesU/QHtGmlRhLvwoH2Q2PbEeQWaeWXur5XLKkeDWYb+BvTu15qnvhVC+zt4W0KgHRk9sXaOBJur4cM6WG/is89C+2NvkwOxKOoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365026; c=relaxed/simple;
	bh=rLAfTReqQBy5oHycSykWo3YZxdP2tCK7HFvuwX22jJc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bbTcZb3zVjF17m9uuLUbG4MLmMxEqpKXv1ZbMogJ6+c3KbPHew70+rR7Fe+dv3PP514qd0I51uKiLQJCJOe/IestdLxFEMY2DCFnfvZO4kT6MtBaxE+zDBgnlXNOTze+r1ibc/UJjEEfMzzSK0tc0sS6KUn61vEOHxi7dBpCuNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsAPHBKX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsAPHBKX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso22592685ad.3
        for <mfd@lists.linux.dev>; Wed, 07 Oct 2026 02:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791364891; x=1791969691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2e78eUVa9cie6XDXt1bL14kso3QrI8dR7GF7W0M/Zv4=;
        b=fsAPHBKXnBUB+m5ikr1nkPsyOto4jlwadBykAoIA2cSMWvdVrgQrKhlmMmPJF3LqhZ
         /xGE3siEgnMyS9r22R6GmMcWVFkb0MDpAlLyRI5m0ZK0EwzOPjWsoyuRLuMY+fTOghEt
         rizAn/0nUdGWOaaoRuQybSUEBBvNiCpbaklh7hosHeJFjNIg4g13SWpfU/X2sdqMJOlZ
         OJNe+hx+9UiGBC3vbNi2py2gnvH3DMyZ4vCe6PXbygltOXWSFbyISg+F92JchHfcXDEj
         L7GkIUKMdoBBRGSMYIvMTueNFsx4FrUWaeSAe06vzycY/7x4fXd8zEhxQM2cbyl2RoQ/
         tw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791364891; x=1791969691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2e78eUVa9cie6XDXt1bL14kso3QrI8dR7GF7W0M/Zv4=;
        b=MbRxQ6uV10dem8NQpYZSc6fIsK1qK417HyhOkq44rVAot1Fs+16mSs4nN6FYNeOG6k
         A8+TzXRqPVqkwfZDevbiZr4zz4z8rGJ8koKLUlaYs492DRn1p/dz19L+bBjBCMQ/KpBo
         KOTbJ0iGNrXR0Z8mbUIHX3UhpzcK03AmRXd4HqZVovQbRJpVOHxaAeZ8nBT0ruQsl0Uh
         9XmfzX7ctaUd7G7cpYbUmTIvipcRJf5lAjkPnoxD99/OMyv+mPhhFd8TmXd6HdpdRPr/
         x82/VcW7sqQy6WaRc2pW4NmoOHbd21GwVAK6rCffszrMHwaOUE7OIoRBUfKh/0txKrQ+
         lfrA==
X-Forwarded-Encrypted: i=1; AKwUvBzC27Zx+fZO9T0zx1aEcFS2lN/5MOp1c0yEFa2a/qEVnRyvPFN7j8R6ODkcu5Eho7E2Gvo=@lists.linux.dev
X-Gm-Message-State: AFq9FYLdY+YCpGesj4OAujO0U7FpmF6TMA9uSFn+WltgCqXe4V+2/lEf
	x3LD9RBH9NBFR1ho1oPmAveTcGh5SJC09b410psUtK/p3YKfNpjHXaqq
X-Gm-Gg: AYBFou0KdFtFdYbnQ8Cy3MGF84BZ3C0uXYc2U+vkyhj5I7KU1bRKdqauAZIEO/X/zka
	Xd2WmzZItDdah6wTwfO18gJOFqQvZUiHB5afXZDGqcYMPVtGON+L5vE5WhiIjy7iaZHOlKucjUx
	gWXMKE8X+x07vHfZZ1eOJ06tTZmHSQTcqWOiX85SfWxMipStAonPV4F0rkQL0hZMan3L53dJo5N
	KXin+i5n6itWpQ3afQSevAWjY/3BPYRLQQEYAUzPgJ1NbjSoD1z90Yc+yksKw9/FBQ61XDkaeH4
	t1brxLbsJOCQfZF6mzhN8PzWzD4NrgNdE36sHyOf94uItTsTekKs+b1okhkPcO+Ojw+jqnUOA0i
	z5axGuwyadMYQMcQ5NGDUP1VmZlfI+QKB0Opbm/yfwhLHvX848Wox4ehr1fP8xrXoV12ybvWxsi
	90C3P8uhlqUzidPoiq6uxLKNsZ2quHqlr4pLIMHXFJU3r9KLKhZornVmYCuA97VwQWcA5Lshvhr
	mFkkDEXd1bnhf+P1XtznG9/5QCkkIDZAcxogucH
X-Received: by 2002:a17:902:ef4f:b0:2e6:943:39e0 with SMTP id d9443c01a7336-2e609433caemr10540805ad.29.1791364890628;
        Wed, 07 Oct 2026 02:21:30 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0e8sm7180675ad.25.2026.10.07.02.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:21:29 -0700 (PDT)
From: a0282524688@gmail.com
To: lee@kernel.org,
	Ming Yu <a0282524688@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v8 04/13] mfd: nct6694: Ignore interrupts without a mapping
Date: Wed,  7 Oct 2026 17:20:53 +0800
Message-Id: <20261007092102.3768818-5-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007092102.3768818-1-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Yu <a0282524688@gmail.com>

The return value of irq_find_mapping() is passed straight to
generic_handle_irq_safe(). If the device reports a hardware interrupt
that has no mapping, irq_find_mapping() returns 0 and the handler of
the system's IRQ 0 is invoked instead.

Use generic_handle_domain_irq_safe(), which ignores unmapped hardware
interrupts.

Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
Signed-off-by: Ming Yu <a0282524688@gmail.com>
---
Changes in v8:
- New patch. Use generic_handle_domain_irq_safe() so that unmapped
  interrupts are ignored.

 drivers/mfd/nct6694.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
index de0027c98726..4f5a5b855de2 100644
--- a/drivers/mfd/nct6694.c
+++ b/drivers/mfd/nct6694.c
@@ -227,7 +227,7 @@ static void usb_int_callback(struct urb *urb)
 	while (int_status) {
 		int irq = __ffs(int_status);
 
-		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
+		generic_handle_domain_irq_safe(nct6694->domain, irq);
 		int_status &= ~BIT(irq);
 	}
 
-- 
2.34.1

