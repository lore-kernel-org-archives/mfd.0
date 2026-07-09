Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB11041CB47
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616410; cv=none; b=UXojo9sJ0NAAn+cvWxuuDgK8aNbuLdS9mIhIVp0TFTIorTbkV9LSfKGfx7nQkRwQ2+t/Gsci7LVBU2YpZHRHrF1O7mT13JkCjIC8lSS0xkF/XhO7qwtEQOEfb8ZqfpPuM05iTZWZjmISCZ8a1VJTs2nkAIrFUSn1O0LQL4BgKyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616410; c=relaxed/simple;
	bh=RMStdZg/15uHp9XX3CRWrZzbzmqyNCoBwi5HiHoruCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AamdJMcE0ZLv/UFudRnzFjAGGzYKh9IpJLRxMvNn0iNR7gWbWEp8iGFQr+t1dIRxsRDbJWqVjY5FbGZl/VlA/r4ZSzSIE00RWrplCwWDR0gzMqHCo6484zcAwNX1ho5glK99Ey7UhfV+vRSyqVqPChdSQ6noUdWc5c9JTKNw1lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=V2f8Sb5c; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="V2f8Sb5c"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4759b4f0897so85850f8f.1
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616407; x=1784221207; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=V2f8Sb5cvDWUG/XCHbhsctPTyW8HfSVh9ksr4Eq32VNKI2cnGPfyLl+mr7/YHkQDhZ
         ShrVCBc28E6R9LKbjqZmlPNzUwwa3BOERGS4dKNBz9czDOdaNkbeZiFT6Cb2reOhqmgt
         A6wK1HpiOC3/9UMMl09kjxecPqOZYCBgVTRHDGnWaKShNJgouqV3rqfZvReHgZKjWDC6
         J9aNQZvHb3BOb8yjQE26DgWBwIZj0pXjKrmR2HAagwOZyXL9+Olg5dVAxVKj1fSSNDUI
         5QaRydcAjfkb5AVuqatwG5oRYeRig3Ik+0h3gXesz4WIe5RQfMsq26PiQuasirmu6ybs
         Gs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616407; x=1784221207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=ojktGhkIoQEk7ihC6jx2bfnrn2Pr2FG9m+2pphUofzSDZ5nsFD76UV4dxnRuHRfLL/
         GMwpdJbNA3gPiCwUbNMvmhXud0frhTkUpLuDsiFl4BYLqeDzaKA27C4fH7KiJtSnjQB5
         2FbYD+hTZ43y/Bt9eM+7ipVUPdSTT+saH8MvGkMozGyeGEHknQl3pRvJ0VKkAW6ezJAs
         CvrUkW7F+yaGlM0T1GjMsWTvHO4x0JlrzT8Sb5m9b96yn8G9noNppHRvxcp4JW1/6mbd
         CKB1s0ySH2F9ZF4BhqbI6X17iLH7mEgLcEv2otpb/TOiHOqYG2JxGZ79tLCYB39XhDYR
         Cjzg==
X-Forwarded-Encrypted: i=1; AHgh+Rog6Rq/uDsKa2QLqHEmPt8twKQLvd1F3y+nW+LpTeyFjbPHzWCWUuvMbM/deZYDXfHzfDw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkouXBA7Hy7AcdadUcrdTOLVZrKLNyfl7WnP1UPx1ObPfvMHU/
	go2YRDOK75n2aMG0B9lHY0LwYyy/oOK8gwmQ8FbjvfmYA5/02tjE0nzD/gc8g8OQfYI=
X-Gm-Gg: AfdE7cnp5CyKZghp2aI/aUGv4kJS38ugY70QGD/W6DZZqHW+1Fki5DrpZGptTbzjTz8
	/AhGVyUFmikWZN8zJi+DNasRRP8CW0s5aAhJ/csrv0NTQDytLPv7tIweSKqXnHypryFpJsfbQ5+
	XInwEBc+A+oK91HaQBfO1pg5CnrLfa6e11E55fp8DETHNfwfzu4EaVJqfEyTiEE5VTm5Iccmrqg
	H6CWyzrj/QlenELP+SDNIDjJztntDFNvsBSFbTFd4wyaWhzzOLTsclRL4EV21b8bFRiMgqrJNnc
	6eb1FM+LUJLTWJHw0CT9UkfbpzGNRtzmzWFsermDxWhGFT0elyHycFG1x41znPensP3boCwh7ze
	yoH8o3/XCa7lCONH/h99Bp4FMtTUVr8sa5Kz3R+m1qLBLnkbU2xWlpuQno3fN/SmmsBeyAOhMxP
	ASSzRmDsiJW2wcziB+ZXgh3inyDyXUlI/WDTsMwK2qZ9DzRcI8i0hGpnHPWgQDzhx1zithBUyS+
	bY/
X-Received: by 2002:a05:6000:2f81:b0:475:f0f0:9ed0 with SMTP id ffacd0b85a97d-47df081bb63mr8593347f8f.59.1783616407119;
        Thu, 09 Jul 2026 10:00:07 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d8f1sm53469385f8f.3.2026.07.09.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 05/23] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Thu,  9 Jul 2026 18:58:24 +0200
Message-ID:  <bd2ff9c736d422e2e93c5d2f07d570d3488799d7.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RMStdZg/15uHp9XX3CRWrZzbzmqyNCoBwi5HiHoruCA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9M8JlySz7FGFfwSGIY044anhaWqL/9WnrZx1 qOveDYaMkCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TPAAKCRCPgPtYfRL+ TvQNB/4q2FKUoVolCJF7p3hPnCwnzgNfIwJLyGp0BQt+1XtRgmPT0eZuO0XuJCzHM5w7dR1dPX3 pOfWT/lqjZAn6Hs5OLuUtrim+2RiflnV4MHzbDQTLmB0tXfkdZ7ore0haDWYdzXTCLjaAPMbeu+ 1fb7iyZAoO2QLpTfVRYchd7ahUItAR2/xAlCAli4YDyNUYLz7/6pS5X4EDokt0vyL179m/AWEUx AL6j/fLuLhLpUQfdCeYZHlBpjbDrVLmLcfgySNY8MmYu7x09aXaYX1zOrq2LeED6FPx+Ll+rt9O rCEetzIJbkffTs7pDO1oHSkMt8xcVTQoMb5Krc/cEiNM6ETd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index b9b1036c8ff4..254b00c905b7 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int __maybe_unused mt6360_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.55.0.11.g153666a7d9bb

