Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641901;
	b=pfYbppNh1E0GQvWsg1DcHEHnYe99AOT0iOb9vRbntZgdpDOD4UmgoYepT24cucIpst3M
	 lqWyVgsmT91Brn+7txIV+4JJYyALYj1v4QT93hlqJ5dagD8HlcqWllZO1jp/32T8YX736
	 r8EHEZTtQLYriFj0M3EcjxzZe5Lmy4lI4KfbvqhwraDiuTyu585KWo5AFLQdBcBskXcYQ
	 3MRs/3FK9UDbG1GTLbSMs30Jqtf7lRCdkEhK6fncgCHIVaPYs6JNk5emiZ01vY6UvYqSB
	 A1ht8SccVvol2fE0E18THONNsqh15KExi3kVGrYqqMI4S1F4aamXjBM/gIIKQFceuEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5Xa/115bcglogo2Lde3OroJ4iJzU0zzKruxbGyxC3XM=;
	b=EAjhJn+4HY8xS9yK0d++YlPeNvc8mMEXpgZGKESTMH/YxJCgKrCamArEKWXRjl5x31Eq
	 4FXhtdFareX7A9Dhk5VIngSgagPwWz8UuOJh3vbDtN38v0+ibS16xPbhcldZDn148uL3b
	 PzqUoJ0hl7XaJkxOtSQPEa8dJNvbZOlP8EGV3LihS2QtJeOyafjdQM9QEsqYZnhbxp+gS
	 oPDOm2Tem31GX/Kl7Cz1mQZpDKfWzWZzw1WzXocuciinrXxgCM6Vk889iDoO2KmIoMVzm
	 wRE1f+80lNMgMY/IcHKGQudXPTlyLrD2f+h9gWRrqdpLw4qAcdxls3ArexJ1XZGH1XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VUssPJ5e;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D63606A321
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 04:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D63606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VUssPJ5e
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3646e6de3e8so95933eec.1
        for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 21:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792641900; x=1793246700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Xa/115bcglogo2Lde3OroJ4iJzU0zzKruxbGyxC3XM=;
        b=VUssPJ5e51jURxKYG33r7F98qXeTOAeCHa9RZBK4xUUGJSnYrNDxocGyqDbM2opnkr
         VCwxVDazjPyKFLpJlq+/+yfarGg1l1EMJFvSF8R69c/9n09DeZFzliKSTclJNt9po1T2
         ZjIPT0do9kCpZxMs18pX1r6TEVb/8Y2LziNKBBkhrUa+/qTqmbrcEuHo2XNipNHjrjvA
         88IU1uBhBUVJe9dVuSluFyTJEMn/HSSi4gCltufkY0pIkhDylH3n2jnVgA1wDnbxXJQp
         XJS4DMK0H7W9Lg+bZuS/Voqzhgq4Gw9h5uBlw6SPCKTgpAiJYc7lvy59cHr7RPIi8/fo
         e2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641900; x=1793246700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Xa/115bcglogo2Lde3OroJ4iJzU0zzKruxbGyxC3XM=;
        b=nCp0OKt3PSQ1Dd+WWOeIByrOiq9i/glyOHVCmq+3/2/eoHpAxXmQvfZ3lGp9WzY0VI
         W6DXoYLXga87hXpt/T8GZzJPOAxiFbkFoPTI/0yDoU5a6pz7tQ+L/5q62WjWyfTrlGYw
         Z8YRPIZtryBWVK6yatY0vWR9BfD3d3zfI80/Us2EFeMae9YbPg6d0PHOZZ81vnCxiqpZ
         4vHd25tDbRErtHfoGCHzDJhj2u9sDBO9Hmyj9fP9K8CIuo1++mJTMtwALDQAJ8WB+K0N
         xDx8s8L/TZsiIcZZetgxQPDS8vY19wUggjzcsfri6ECKcykHLo1boXOhlYW6eFn9msyn
         eUCg==
X-Forwarded-Encrypted: i=1; AKwUvBw11Ad6bo1MxMw2qS+U8ZlNfbDYD6jeaNr1aKjqf8qZ3QO/vPyZo6vLONzgZ1KHJnj9+oA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIR1UE5TsUJbz3pVX+oXY612LyIupQoVNdoW+P9hKyMljrlWqFu
	yHOwvpmOoX/mKxxhX2SYUJxEH4NknC6u88GWhlNv1bFwI/88C06kuapq
X-Gm-Gg: AYBFou0FTmSlwkBnlhbjCUb8iN8QX+Ayr9n/IE016581Ii3AihF7+Nm8yNnKSk+MJDR
	BgDxs0QQp37jd7hBSY7tGm3SgRa3B+jrOlrG+RJN9N6VTdT0acQ8kr+AoXrZHsimaDrJrBjLiLC
	6/OLEp04x2p2OiLQnkE0+m5obJKdaOueduWbhHcsqOov0wVMnQof6YcYDjhRea3OJy3K7K53XH+
	HTrhmxlBZJWo5MrRruUsUdlSpnN1zrB8boAYQw0VQ/FUK0AzQIACSRskjKE8gNe1PDFHe2v3I2s
	XWgFPFowSOTrl3lwd0jlpgpIn4bKmJ8IPgDQUokniFZ6vQmSO8AWIvUa5ZKC2Sg2wjIaVNYp0Mm
	fZ+izUXef3kXmVlZ+TC8BeSlHMjhTckXfzmNw3ROcYAokcJ4H8lazUSZOBEtJu4j4/MAf+dFk+T
	C3mPYnLZ1B162WjUypGWri5r4hyawFwECjIiiCQE0YipIdhXGQLdRGHC5wgCIeUbff/tN3WynAd
	20OEuWTQZ6LT8aJzoqqvzCgoFjQ6JkNGljk9tHWgvr4+nh/EA7R/XYxNg5aG4JgzIdGZqIPy6P0
	iCZTiVVMLHbltiCxEEeqfaaM7w+LEFs7oobDvbleuKi7oDPbm5J21KukL3fvkcR6N3zBfaDJoTY
	=
X-Received: by 2002:a05:701b:4301:b0:190:e602:c769 with SMTP id a92af1059eb24-190e602c831mr7355159c88.1.1792641900034;
        Wed, 21 Oct 2026 21:05:00 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d3ae06fsm10950539c88.19.2026.10.21.21.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:04:59 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lee Jones <lee@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: intel-lpss: Set d3hot_delay to 0
Date: Thu, 22 Oct 2026 09:34:53 +0530
Message-ID: <20261022040453.45797-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
LPSS controller still sleeps the default 10 ms d3hot_delay in
pci_power_up().

The PCI spec asks for those 10 ms on D3hot->D0. Mika pointed out that the
LPSS controllers are not really PCI-connected devices, so the delay is
likely not needed. quirk_remove_d3hot_delay() drops it on several older
Intel chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
same for the Intel I3C controllers.

Nothing misbehaves with the delay in place, so this only shortens resume.
On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the touchpad's I2C controller
autosuspends after 1 s idle, and the first report afterwards waits for the
resume. With d3hot_delay set to 0 the i2c-hid interrupt handler for that
report takes 1.1-1.9 ms instead of 12.6-14.4 ms, with no I2C errors. Only
Arrow Lake-H was tested.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---

Notes:
    Changes since RFC:
    - Drop RFC and add the review discussion to the changelog (Andy).
    
    RFC: https://lore.kernel.org/r/20261016114347.23633-1-navonjohnlukose@gmail.com

 drivers/mfd/intel-lpss-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
index 63a3fb58566..5672f033e5c 100644
--- a/drivers/mfd/intel-lpss-pci.c
+++ b/drivers/mfd/intel-lpss-pci.c
@@ -70,6 +70,7 @@ static int intel_lpss_pci_probe(struct pci_dev *pdev,
 		info->quirks = quirk_pci_info->driver_data;
 
 	pdev->d3cold_delay = 0;
+	pdev->d3hot_delay = 0;
 
 	/* Probably it is enough to set this for iDMA capable devices only */
 	pci_set_master(pdev);
-- 
2.56.0

