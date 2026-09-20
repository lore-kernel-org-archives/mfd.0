Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97233D6473
	for <mfd@lists.linux.dev>; Sun, 20 Sep 2026 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789882332; cv=none; b=Hx+DvimPyhiPI6+Ek5vXsyWn+Cobt0xolvNaiGPXfKmb0d3lCM/+Nc9M85AOWJoUpiRZpatwrsMtP9mddI4YuYx9PiEwVdNMatDPshvJMa7Ih467XHgZLYu4hfsvciqSqF0VJYUYakft3+UGlPJU84dQgzX/JuDDdfstHwt2kAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789882332; c=relaxed/simple;
	bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V7Lm2X9l1reYAfBOXFAtJewaYPJa/GNW/4x9lQKXsYeIOBSPw9LWSM6Kmk/nG4eE4Ui2qV8TSQT5YuoihEQHKLNabwuoMfSK0qLxJiPeGk+R2G5LM5a1y8upLua9c8Yd2/XlHeuqC74k4i986bKzjptB0niEFPwBcqfpDGzUbCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjHp81mh; arc=none smtp.client-ip=74.125.231.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjHp81mh"
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-44cdbcd53b8so260966fac.0
        for <mfd@lists.linux.dev>; Sat, 19 Sep 2026 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882328; x=1790487128; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=LjHp81mhOl2TU6LzNcV9FRZHi43k88DWo7ISCvf6TenS7BBKizGGHRsKHqSMZAqB4T
         o7nDbKCYbChM+Y0tFM+y5KER7cR2QUgEYvd3JtibTv1Miy+0uDnLXFJ0V+Wzdto8s+JH
         oygaYNtZIQ0CZUXTbv4h8x9mfGh+wqN0VBL2m+ev6e5uYflkWVE+oU/uKDMMdNKZZX68
         xZAUZLy3t75BswY4vPshpAmfSiWbDTvjpIr1EJzYCc96SQEQIC/azkuguJZfMkehAJob
         Umjcne4qhli8J3twg8HksblVyCfDe7fpxU4NPZjH9ZZk32xOziRjesVZmULVtaiVadUp
         491g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882328; x=1790487128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54xUl28tB3oyyAr/XFRTTgMHGsQTvwV3/5B41pgtCxk=;
        b=MxmRvq6HCU6MiVrPYmGoAwyklG7jokxjRB524tpswHMo+TxLTxxS+nLHiH49xT/Ko7
         vf57d+DOX0DiAMggwT3g+0rOpKxB+2KEKgh1wdcT1wRofYNDcTbT8xjH5Lvx3iuqsIIx
         i28aRBO1KV8UdFXaW3IWmY1izPCUSEMlrowZkz40tRHADkrd11q4vbL994iZvGPqoIuT
         htlWGbD4HtksDmBC//uzs/A7yCKmCngiSiCvvMgvWyTbg94qSxa2Rcda+Co5ViXALoxe
         37Pj9BwDZcV6l6cNZnyjPvkso+6jAdC5orZAFtbtqDM85mUSoBvrKcD2NIIsHhQYfOhD
         wE0A==
X-Forwarded-Encrypted: i=1; AKwUvBw4B8Y/d20l8RqCAYJQcGkVfs8l2QEuynivcX1UJn5Ci8IHHRG4DQ4EbxM5WbxN+IKVHdE=@lists.linux.dev
X-Gm-Message-State: AFuF++kep3USoE+VdBLDEP2p4Ocr6phlCuRSlsq/TXuQJPD23PNAQOUF
	VmrLs5GuHoSS3tSFGr/dPvUDu+j4NcGj8GF84Ma0XcJhqEMO+Qt2iNBL
X-Gm-Gg: AYBFou0Hg1km4/J0g2lyPR57o533hKgcOA5GSB/LzbONzaZVg8h6sux6DxgvDIix3yj
	bqgW1aBYg/8TXVh4+yotMpU1NNJiOJJtMwztSmN5RlXMIw79vb7I070EZedXnlTissD0Bc47NUf
	2mjkalTT4ar4LSUDZZhw3aqENUs3ADD+5rA+NLYALZEkgidgk6UYxWoCEbzeuWU11NTRujzF5u2
	9HvuZ01xRV4C+BoJ5VteNP1JIkpCEdemQwQ34X//0YFwrzz5TYxP9J1suLgAJN6R1j59lw1X00h
	JOmY76m3w02nCnzIyuplFsSTAqqTfRMS+yNM68t4iKaAhXdg774/S/WXJvH9Jnd7Fhw1Ly2Udvr
	9D+IskKAc03yINSl6Al/zb8XsTpddxejsKGYv0y9/uPMe2a7pyJxHdNA4usOYj/0EWGsNeV3/qq
	iRoaKmKjaLlhahQ+OzEK8MBpLx57nJchgqKsLltKURAomvCfbVF6V0wsZmA7emElyO1Q==
X-Received: by 2002:a05:6820:818a:b0:6b7:8396:f3d6 with SMTP id 006d021491bc7-6ca9ce4cfcdmr7217118eaf.56.1789882327657;
        Sat, 19 Sep 2026 22:32:07 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd3541f07fsm5007319eaf.10.2026.09.19.22.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:32:06 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 20 Sep 2026 00:31:53 -0500
Subject: [PATCH v3 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-3-c00edacbee64@gmail.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789882316; l=822;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=1otP8UYV9viBZZ+f8NwjITACufQDeLB/kdjE9I9R9IM=;
 b=9u9PT8EgMhT2CU7ynGTjZXDCJlhMILqp7KosTLFKUyKBrbzaMyv7T6YSoFBmQnoUOssaMtNEq
 wq0GEJz7dXDAC/rXFbTt3HuxJH3iGRrtfTsh2kyNLr/fEKdyaxtfq/X
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0

