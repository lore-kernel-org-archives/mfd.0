Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42648A2D1
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 11:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989330; cv=none; b=U+nWR4uPxf6NtdBoKpxWdCTzjj8Ei9phrI7DqpNJ8qU67pRUb8f6J+MNjzvOg6V0rb1mn5a/AQqtGCVlajWuIRXXM+ponkloqCSOtLz7xm9g702NUmpPNRkDqqxKGR6GMle+ZaItkJLYSYu6saTvkX54s5nonjGI4xiEhtmD5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989330; c=relaxed/simple;
	bh=Fl8LEDF2+G92eNmZm/5BuP9dhnVEgbjMk0wmGrfEco4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DEklwu9J1SRQsSspwNPKJ9m/NDoSylHSYmYlFrcvdGeSHJYTpy8LL23XEwfI+XE9KxR4x6e9OrMoSzwiR3eMEQaKljsTJ9W5gG4oNFo8ip7aBH7+AAVfgAk1Z6jaBAtqMV6bY7cCOzlmMKw/iuF8AGzevOgj6XHb/agpCYG7FNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGLayeNr; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGLayeNr"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffdso19975825ad.1
        for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989328; x=1790594128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cuLvycUbpxuZeCkGbkO7ppnyiQyHbP7lOQEyxsj8o4=;
        b=tGLayeNr7NtLQApVZfZiqyzEWSMZ6tbVYpXzg9uTjlWOJREeDAtBZvOr6SWpPQG1nK
         GUre6EmBtt4Fl97W+WBbd+HDnRVdMTcV5+bOgZ5KEcmFBI5zO9WUIFQ3mPNdh2wwhIM4
         KfxTWX07R2bbiWoju9qcS4rDz0eNNzBbWOMwVIRraEQiafARBchmJ+c8EJ/cArKFctRb
         2/CZiDLO0g1fnk563jEuqxMCsSNM+11oPs0UJ1tUMQgU4WmtJ7KkZrGwCb5q9dStPzGL
         tJt9w0fdYE79xrOOl0QVwRLia3rgOOQkuYYous3wVByovZvF160HR9DvZh+ie69Ffofx
         4Spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989328; x=1790594128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cuLvycUbpxuZeCkGbkO7ppnyiQyHbP7lOQEyxsj8o4=;
        b=xGKbZVxnCy3pb0daeulXVL+PlqiUfoTG9mT0kUleoq5xrkzp+M3VEW6EpFiTO7BZIx
         puc8h88XZNyfRXzTJvzuiHVCd563+U2jvseyq7NQmWVBW4T4k6+zMcVVRKf1JtSq1Utt
         0iH6dSll9yIhGPfIRGP0e634nwjr7FVWz6cv13WtddhdFU0VcqSwBZuXNON1Ru6UYHIh
         fgv/YGd+NsCQf7aZz/wZvinzFk2crLy+QHKGqh3HaV/fy6X8ucYLhIdRF844urz4OVdC
         z5NRfFvEwALXZaEl6DDmcpHicsRR4f2WWl0wO4S8IEeDvn6FqEHIAh3jUQOzjdgi4xkT
         fZDw==
X-Forwarded-Encrypted: i=1; AKwUvBytGnfLECgqWTDjcPqL4ppy5X9NyF9W6zeuLX1jNowjk0Khz0SBFmwTvZwZVH/VvRoOzJo=@lists.linux.dev
X-Gm-Message-State: AFuF++nlydr3MBFOtnUrDN+nLGAT7V0qgMBRF3OD2CzcswFHBHC1CDwp
	eWIMR2/Kt994EEWXOHmy9y6CpZMtnW8BkFzICS/KCtsDfLb/S0BUMXIY
X-Gm-Gg: AYBFou23k60jdhWUz3X339YoKEBvxfKokduvJtuSBmrE8LbqNl+HoAlX+POkEyQY3xZ
	QoXadUwhW66bWoQ/ESNEq1tVPZ4BGfdSwm5/xRsdpbmIvsMbId+EKHPU0VFzRo9GixAXD7N/J3A
	ZOGs6oj6qwpDzIq7q96dNYV4Xk837e0akXdbjWUKIhxvkSoL5dqhnaO+AJ4FGdAFTPO+xhKxz3H
	yCweiFzKveuoZFG+1eUITxpjvnQcbc9YcyUyDmabPFdOekD0YYK4AjJseJdBYKQg0v4lKYz7X7H
	sZ+uaFOD20d+95B/XgoIv+XiOTdOvGXwgPRBTYNzy0xyHGsdk2LTsi8wRVJ4/six/TlfKxRHGpU
	o/QGlvAo0S0H6LxZdvREr7vkQ8iGy3QQOO+EuwTcyUKpT8YNYvyZWzDlSYQW9L1UlWUOJtyDrtF
	cImPnZk3z7pY2leO4p4YS5SntScLQ0j73nV6tLXfUGFJD+n6UXKYolb88U5cPHkg92Ch7NpLZmy
	W9xZ2E=
X-Received: by 2002:a17:903:2c47:b0:2dd:c168:c4e0 with SMTP id d9443c01a7336-2ddc168c512mr84966165ad.0.1789989327719;
        Mon, 21 Sep 2026 04:15:27 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df378440f4sm26419465ad.59.2026.09.21.04.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:15:27 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	Ludovic Barre <ludovic.barre@stericsson.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Julien Delacou <julien.delacou@stericsson.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: ab8500: fix child device leaks on probe failure
Date: Mon, 21 Sep 2026 19:09:09 +0800
Message-ID: <20260921110909.370945-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ab8500_probe() registers MFD child devices before completing the
remaining device initialization.

On AB8540, the main MFD device batch may be registered successfully
before registration of the cut-specific batch fails. In that case,
the probe returns without removing the child devices registered by
the earlier mfd_add_devices() call.

The same issue occurs when sysfs group creation fails after the MFD
children have been registered. Since the probe returns an error, there
is no later teardown path to unregister those devices.

Call mfd_remove_devices() on these error paths so that MFD child
devices successfully registered earlier in the probe are properly
unregistered and released.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index f0bc0b5a6f4a..e675223b6023 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1220,8 +1220,10 @@ static int ab8500_probe(struct platform_device *pdev)
 		ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
 				ARRAY_SIZE(ab8500_devs), NULL,
 				0, ab8500->domain);
-	if (ret)
+	if (ret) {
+		mfd_remove_devices(ab8500->dev);
 		return ret;
+	}
 
 	/* Add battery management devices */
 	ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
@@ -1243,8 +1245,10 @@ static int ab8500_probe(struct platform_device *pdev)
 		ret = sysfs_create_group(&ab8500->dev->kobj,
 					 &ab8505_attr_group);
 
-	if (ret)
+	if (ret) {
 		dev_err(ab8500->dev, "error creating sysfs entries\n");
+		mfd_remove_devices(ab8500->dev);
+	}
 
 	return ret;
 }
-- 
2.43.0

