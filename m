Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3943639E16C
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616405; cv=none; b=pfN05cW8DPdVb6S/NutTfjm/ggQk8KTd1jYn30HccIzRVP+seiDrYcqwPmIHzwWaK3JTEmPzewz4gzgePFennXH2oAXE60Zn59zW/Fv53z5gCBiZWnXEszOsvxMJH6D0iaYWXUAiiGNG6ADCtJTbDmS0k5xk5oExlrx24oFGGds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616405; c=relaxed/simple;
	bh=duMJOMhRMJ7vzwyjzXHRpzbNOKXgwFM5i7qlyVVPaOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lHSrxeAh0nDuo4bv4gp92EDNUPk7Od2x8aTNxZvW5B5rGrgtk3QQ/dkXmhb0uPcCcfhaDgcK2NW2s40nVBX/k6KinPTSNEdaXTZJBy1T1UjLWn19niHCWgHWSyvHu8Li4u2e3efZVl5fJ9GzPMngRDJ+3CG56BhFfx4aIbkyZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EhDgYSTz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EhDgYSTz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so365345e9.0
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616402; x=1784221202; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=;
        b=EhDgYSTz3cfWnPXNYPfZRfoKO1cMh+C08xSWgihzQF4A0dcGhg66hfPIW3N9dHpILT
         xlkJy3tta5Gy0dSCZB6OnMLs2MzNaKUMbuGVZY8WUQbqlPSuB09Y7h+vCA9+pDdfhDMR
         Eb0cvnATc675To3fPazRRTtJKJ/eji7+SJgu2jGS5SLFZt7i9pzhDmeUTFYDEOyaJ7FT
         vmKKjI5Li9mQXLKopFbpPlEgleqXDrDPwBi1zZl3TavSdXv9MK+W5F++iLaE5xxQZfbb
         1cHZmkrSiQHLGG8GAO2tktmxMPe5IXNNHUc7txC1vp7NY6Q8fJGM1jxTylMxQzWNlI/r
         9EeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616402; x=1784221202;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=;
        b=U+ToXqkUJTcuaW9AdeUPsIPil7VF3cPmsHyDhbUdr6wonImks2goRARU0/Yjq5tHCX
         +C5h/zB9qntq00Izm6qabbcTkZahh5C76t73RZU77YPSL8X0ISrn9yFtsRTnn3qGc7bS
         A7yhPvmTMUtgO1L5qA+0Te1dGtzoAPfbg3xfkeCDDqs4pB+joIKrQGQEWceLZ+EpBqnc
         SYMP4VcGNYonO4qdKNxx82NJm8Et4N2x70igCIYcu3dncMCagF487uatO/p25U2qkE2k
         WF+2qjinUTseUlMa52uzirw5HK4YG6urujkhRAjdsgGlkMf2pLB3NxK8pLifL66vMInk
         /ScA==
X-Forwarded-Encrypted: i=1; AHgh+RqflkilOI/nwYpHtJm8GNTPjb1DY3Q20tgF+PV4XtTW5kluSHj2hyo636clpm/dFX7AMYQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2w/PAQbmzQj7OC+LS8D8R8lFq4Yq+LDluAE9JtUW78bzDbDpO
	qFfkVxkfg/TEVa+BiNHjmKCI5z3CRn8ezubC3pwJTcP3yFR86+nQND1S3t0jdi1no1lx0bAmU+t
	lAxKP
X-Gm-Gg: AfdE7clEGB/KMdjVwaGtKmO3ZFIdhuHOrberfIBH78Q+t+z3tpNTwqZvTjqNeSx1m+S
	7zgoXVJUgzo+Cngu/rCIELipzhK1TbT6t8AGNes91RyIE0+yCN9rBFCiMm0EfCfAuDzMQGu05OV
	N8MDX+oHSlMqqTyQoH4luUuQfRZgN7by52rxLubWAsRQ9/TLFs9d7hgul5ZkwptXyMJHUedkD4a
	8lnggXnC5/BR3pJ9FjCz00C1OZN0o434+yDxZzJFx/IrJT/46oL1GUMakVXkq2ynprt8SaZq1YG
	morcsfplzARMvnHSiUKcTcje+hGWlTmwUtmbziEhysphxh53jgFL+DonEZuAA7MWtUwp6bKI0e8
	FBmmw6DxlgT1vZfsUvpjsyBqh32cmF3Su31Xmxc7/2fPR7SXU2z4r7MmKgUW226wUeMYpBzanXw
	7/LZZY1dVVtrixAmpAh5ZEd4jmZMFzIcJFYjyJME/TuO2qOYVPwdxgQ0lj3D4j8xRnVYigFBJUI
	v8V
X-Received: by 2002:a05:600c:4ece:b0:493:e81c:fc9 with SMTP id 5b1f17b1804b1-493e81c1017mr66554695e9.15.1783616402515;
        Thu, 09 Jul 2026 10:00:02 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6e0e5asm77915675e9.9.2026.07.09.10.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/23] mfd: bcm2835-pm: Drop unused header
Date: Thu,  9 Jul 2026 18:58:21 +0200
Message-ID:  <5d3ff1a1732708946761d3356eac278b1d8e82c9.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=830; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=duMJOMhRMJ7vzwyjzXHRpzbNOKXgwFM5i7qlyVVPaOw=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiz/y6bzc6MD9XYtivBeXD3/6d3MOE75jA0rDhyJdTneG cL//K1BJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQAT2fuP/Z+yUCbnxxq2dG4u jzuh7nE+KW++Xa4J/taUvErt44tO+RNJrgcEdj7g2mKb93GC5Nky4+Y0m83bmzLK7zJLzb3NzrA 3fofsdNMt3+oCMw6ZzdWs68pK+Mfic/J3r5e20ys+i/Oz9Hk5VK59uiSVbKXVZi8qf3h/7dNjLz X2Jf3+fiP56Zm9yq2Hmabf7/diZY0LWN1z+snSPw1bHhq+avzmJyP5LT+q4lXL8m95ghbSx2LOe Dw3zF2TdHGGxwPeR64bfNYc1BOc0VEjPP3VHv6nzGZGoa91sl8qJHSvNDS57VEiLJ3u/aXUadkc /XW/zViiyjOUK86qnxQssVk8X9L57LW2FuMit/rua59kAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

<linux/mfd/bcm2835-pm.h> doesn't use any symbols provided by
<linux/regmap.h>, and neither does any of its users (i.e.
drivers/mfd/bcm2835-pm.c, drivers/pmdomain/bcm/bcm2835-power.c,
drivers/watchdog/bcm2835_wdt.c).

So the header is unused and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mfd/bcm2835-pm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index f70a810c55f7..12bb6bc2c07f 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -3,8 +3,6 @@
 #ifndef BCM2835_MFD_PM_H
 #define BCM2835_MFD_PM_H
 
-#include <linux/regmap.h>
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
-- 
2.55.0.11.g153666a7d9bb

