Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4153F7AA8
	for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547529; cv=none; b=hjiem0K9oiAsCMyIXnZbP4/BEY/C42k54Dq3lf4cz3FMiExoOYFk3gio8/godY88GnO/1gEM9q51hRJjC/EVcYOXe7VEd6JhFXG+GLJoH2gXlP8MaWye0Q5L67SNN2hYdBfJxhK5rimlWOGeJYh1gFoN8W6qCplnBOS5fzcOVLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547529; c=relaxed/simple;
	bh=dlMTPFtsBeQGxgr2XZu/OGNjGA04J4d1NowoJDCEljU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ENPBS0m9J78lK9A2GVsUN/e6i1N9UUZ4Z3u/R7UCwUB5hUMBGdiGrxia19+Nk+SOK2T4Ltsf2WOZbDcQY/Yi3sD0K1Ub3AOQbyJzJqXAX2CKU7s/3MzDYRBmxOw6fUkwtq8ZJtyxJOKbRswfzTeLgoxarDE/u/WBO5mwqDencd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=nvgR9srP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="nvgR9srP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cca0c5799eso75767365ad.0
        for <mfd@lists.linux.dev>; Mon, 20 Jul 2026 04:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1784547525; x=1785152325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nsdh+fwHmWa5XVa73TyuvW6VtjwnCR2ZTFQjARlnTb8=;
        b=nvgR9srPnwfGNjDjnZkWfKgqKmYeyYrdd3qUKZHFoxGCt0FkQMx5bIaL/wrZx/pWBo
         bbon/8e+7CBJnpkaVn6Gs8JmSo08b0PF1tpMObyAwxEYGoHU8a3P2dCSmFtmllztDRI8
         yOnRdyeJyIJQDicpUZ9/TsT/cTxBYyZY58VYW0Kt3k1lWBkCVk89ow8lgo7vOPZCwliH
         N0OYnJAjMuWiZoBgVO0C1HmEt8PTCfwBPDrD2aiJ/QlAXmIL0w5T1MPAfw5c02+5+A5V
         P7rQ1DlhSPhiycvAYiM3TKm0fvk3yikGFHYwWrJHDJe0SrVQVFKJnkYKhetx8zT3o6l4
         KpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547525; x=1785152325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nsdh+fwHmWa5XVa73TyuvW6VtjwnCR2ZTFQjARlnTb8=;
        b=lv/no9VD2mKbV3vqTgtG+ZDMNjpzBBFt6O0TBTBGldS39b03igHrkNcns1sgx6b/zj
         UKH+09+UT9wl488NGY0qrVnj2ns7iTPo8BGkfvS31pyF4+xTYdYHurpWvtLLAQAbnN22
         85rVJqW2/2Cpmp3lJcnhuixe1nViKmC5MvO+7uDYfRpDJaxXSxzUklknpzsa9eoG+Cxu
         Oe0t9SqC0YYxglCb4eg6GY+7eR4F4BuMD3BbC8MujxXTjwMeN8xYG0vxc8kAfDrLb+rA
         9HXPBN1WThdCEZYutCg3ryPziDuJXC9BmGxGlg12w+q+cM51ixJtdwzy3VPxUdHGQFSo
         2rmg==
X-Forwarded-Encrypted: i=1; AHgh+RpaFWwzvawdl5uh8JtjszTazJ1/DMqiSAYsZ7LKWCigiaWZapq43tqq6naP7EfOvem0lc4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZkKwQzAAgGAlptGR/3zpY5BnVDafZvjNQY2oEsBI7WGJGrBJq
	jLFe4FSPuIaRA6V7KfVQtVHE/67g76GOh/5Sb1uhRKVECwFgXVzoJiPodkRp2pUleFk=
X-Gm-Gg: AR+sD129LElDw0hn6FHB7kt3eUDETpp5Fb/VnaybCRzpTy5ELfLmdndgVAXdvvmWt8G
	I+AQRzbOW1gHXZemzVV74dbeWzBSDVeoIjp9mLubF4tNTWjL88RvFLekAslDLFKunK0qcFfvyAW
	HfR48j/Bo9/VcOjN1Zc7nDZqKvDYsx4SJgMFovbKrZGQW5yq/zmk2/inBuf3/JDVVoAQlGHz5YQ
	Ba77H709Dg0lX1mvobIOE7M1U9VeUMrkEhnRRJcKcpQfypNtNSdC/x1EEV4eD4RnTFNPsOhtMAX
	HEUaRKbIfjjnU0FBijUa2LjJU016XKL6//gD1+hnNBv07xtTKWpAEf72rVY39ZxtukKAGLF1lN8
	KoGsd+2yXEuZOE3zQbZBLhP2Pp1osd/2MfQheK6Fn3QDvwck60EQIhoEIpYJeIT6j86HrQPvWKx
	shd6JutXCaXaRZ2YTnJ/11CojC1rso2imoMlLRl0o9R+NvDqqTRTngTaCGXUG+zPKkRXJdgvuLY
	B2joAP+sw0V/yZjUZvqf3DVkOEPNsQF
X-Received: by 2002:a17:902:ce04:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2cf3496b2ffmr168181275ad.27.1784547524888;
        Mon, 20 Jul 2026 04:38:44 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2cf3448f91bsm55554995ad.8.2026.07.20.04.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:38:44 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: lee@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mfd: sm501: Fix potential memory leaks during remove
Date: Mon, 20 Jul 2026 17:08:32 +0530
Message-ID: <20260720113836.73133-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocated for struct sm501_devdata in sm501_pci_probe() and
sm501_plat_probe() is not freed by the corresponding remove functions
sm501_pci_remove() and sm501_plat_remove(). Fix that by adding a call to
kfree().

Fixes: b6d6454fdb66 ("[PATCH] mfd: SM501 core driver")
Cc: stable@vger.kernel.org
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/mfd/sm501.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index 49c6b21a44e8..0b802925d6c2 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1629,6 +1629,7 @@ static void sm501_pci_remove(struct pci_dev *dev)
 	release_mem_region(sm->io_res->start, 0x100);
 
 	pci_disable_device(dev);
+	kfree(sm);
 }
 
 static void sm501_plat_remove(struct platform_device *dev)
@@ -1639,6 +1640,7 @@ static void sm501_plat_remove(struct platform_device *dev)
 	iounmap(sm->regs);
 
 	release_mem_region(sm->io_res->start, 0x100);
+	kfree(sm);
 }
 
 static const struct pci_device_id sm501_pci_tbl[] = {
-- 
2.43.0

