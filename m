Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B543C7CB
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509406; cv=none; b=cZMMJpA4TMbRvhOc0tyJSbsfSFabDi3QnkU32qEs8CqjpnHnuYazawlcT0f4gV0IWG2+vAB+hIhLUQqIcdChhReGg/2K/LMpxLi9neslX/0XwCmhw5lEloZad4vGNEhAPsAM9bBpRU5zUfrjNul2rhHv3DoStpssqWaHMm68zPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509406; c=relaxed/simple;
	bh=duMJOMhRMJ7vzwyjzXHRpzbNOKXgwFM5i7qlyVVPaOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7qab9bUG1ChBsEIQ29wbrW6ljVsQyfugH0d3p6kLD8Mx7e1saNJQ0npBrrLfgpGtm+8XaM9Yl/YGg3HBDnpNHeE+HUhoB6VBVhg/tUrtnH5hGtS83quiTU2pvQZGk2LqSvPJv8SLgg6UmC0O89T9qPqJ0BSm4vzgp+IL4qmzM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jpQUrxmE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jpQUrxmE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de008b020so302075f8f.1
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509399; x=1784114199; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=;
        b=jpQUrxmECC4SduY+GLL4Rex3QQ7zxaHboeK59nwEzbiZRLdKugf3nZ3jsZgDjRjdMV
         hQYcTC2vwGDgedMI131Hkpe7AEmq7drbh3vSLeZecg2fsAVFlDaTX+2wmNtNZTl3kDX9
         hIHW6ETmiXhxENh9vzz+PJWA862S2tEg1voIMZmR4FGSjjr5yE/fwR+Cm/tefJ/h0InV
         v02xNZ03S+kjzP22/yfqN9Mh9pyfu4mijnPjovRkzM2lb2ODDUZNU2FffK4Vea3ha2ri
         6erdhLQ86dQFsdJr3CpDr/TXT0bM0U7Wtxx2wt86rhD4qy4og5blCRAmZ31KjWRNcjOL
         cj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509399; x=1784114199;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZz5dHOpX+Erat31ZHODxdGoH83h4CoVFtEy/HlH4rY=;
        b=YtvGmRVewnkKuGByhBRjJyhHeA7jRUqClz3klIicdWRaheBBZZ6LOzzOsQ4yGECbay
         8PwgS6roVqm6nlMj7y1E/DN1C8etlcy4kdjH9qcf685pM5y+xnDSATdHGsHdlm1Wp/5B
         GjXsua3d14T/Yt/k2hKhvPs3uCOBPlODyE77wtR60oarljv6O1kMlPX/OcP5TwIdM5Iz
         odW4LqDjQobLxCsJ3RU6uJ1ysWgMYEmi8bl8pwx88fC6XcIi0H9mVVMq16AynFmnfQ0r
         1LWtqn9sXyWfAGv0N22VJsbl3YNeORmRpFSjA/ndY/0Ew4RbwEcVPX61F17VPVRbTwZc
         re0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqn9BqPmwNgEq+e95VcbNTLJNjD3U98DmgAstqd+7opOdQOiNr7ArvnqiauxjMaIvGmbEs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxW4to7cKgVn0VzzxjSar0Q1PhoAuExGfTUe5Lqc0pcJNNPtJQv
	whOUC+UA66xWV6+wQB219veSTe7PCxz4O+2gGqV/V5DuccaT2pRhOdyMVMOn9Pw2ij4=
X-Gm-Gg: AfdE7cnVtsxal3udXYoFZyKTG6VyjnnFY4TTHod6GIZ68BAN4g8ri1Aw+5O+UJD/F8c
	AYCi1q0+99ayP2EgR7iBHwiJOmky9xaTDK/UCpzTHUjeMC+xhHA1EjhhfukQPYi4NtXSWW8hF+X
	Erxx9qtBcubmxvmxdLQ8nIXEhadRvfyXCM9I8aydXOitI7wLlvbXKZBk+Oklo77yYqL+IvBtkqb
	9jEf1F/kh0HQKG1mSrJ2UrOMCp3bf0niJJdPl6bPz6w3biUqV+Prh7VCmjCHUCeS50WyCT5NAN/
	2xiw7C1D1JlhNgOXy6qmwGSQQIZSpTvRb/3TC00X7DTQ5wRCL4utD9Ksenj76WrTLKiRgBLpnKI
	I5rQlWYEdG+G5yyRWkTrkrfsJaHvytNhFV5XoPmdmtTHP8ZFkLIDRYwaSBiqhVUA9M+K9/OflFD
	8ZoL6eDNKv817WLzH2C/AfZwGHz/OoF5tb7joIGPlVHfv1ZTo0G7makfmbH//4HlKnkV1AtV6Zn
	1pU
X-Received: by 2002:a05:6000:4916:b0:474:88ef:cdec with SMTP id ffacd0b85a97d-47df0245d73mr2621597f8f.6.1783509398941;
        Wed, 08 Jul 2026 04:16:38 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa039ae4fsm43122869f8f.18.2026.07.08.04.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:38 -0700 (PDT)
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
Subject: [PATCH v2 02/23] mfd: bcm2835-pm: Drop unused header
Date: Wed,  8 Jul 2026 13:15:09 +0200
Message-ID:  <d31a5092ef0e9f1ef9f53979f2c5b22a83e9f697.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=830; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=duMJOMhRMJ7vzwyjzXHRpzbNOKXgwFM5i7qlyVVPaOw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFCTv0TFdgVKMIjyLAKa+ZhG9Uj6OIm1KDV4 xVdwvHzvCaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xQgAKCRCPgPtYfRL+ TtQBB/9yw2y+rrwbKmgisWs8vAKTeVbqbDnz5sBNUasP4KfNNYNy+8h5AiJO3Rw2PWgynngOxgQ i0lcjPjKQ4dCNt8OhhlkEP4h32gCDQqYTK8CLdgs/HSPrk+khDLKnFACXrBjR6eMlNsQQk/NxmB 9KFevHmHVA3/cn4jxFdYWXDjBvR2JhfmlHc+PQMW7FWYg886C8GqagvNHaq6xza7hiGAWrYvq82 CANOM/YBLjqHdQgh2AClmSbFnCxSDPt7o6qgXKf6Q7tZAIwyvljqEkS+zM/JLCAqLVoJXlBu1nr O0aTkfSzIKmMLU+thKJoqgg7W95CIiiNz0J4nD0IkFak4Zog
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

