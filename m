Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BB643DA33
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509418; cv=none; b=E50mtMidvMDCbiT3fSVmGC6YXN8v9dfLeFxPCzjGsc+af5Rey48vfrOaoEt8SOmUEKIwj8sLrVdQi8xkFKNVVugohN0SqUDBQqEQslubK97CWTZ1++GdgVlR2SKwOsOaoovGHTsSIsBu3rD0oRNt6isiGXODxiN0H9ELLwHcabI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509418; c=relaxed/simple;
	bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MnAbOsula8JF1DgDbTh1KSE1Fq0i5lXPVLu3KXoFYZrZr5hUDCiVHfIWNaM+a9ai76/n8ClCTjJtTMffRjgbbYpcoJHdisDqdYLAmJaMZZqK8d6oPa5T4C3DiT+yRNe+38Jy6J0284szC0cif5l2+/4Y1RZRZ3zbzigGcmEU8Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=leJEqLNT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="leJEqLNT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47dec32798aso564054f8f.1
        for <mfd@lists.linux.dev>; Wed, 08 Jul 2026 04:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509411; x=1784114211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=leJEqLNTssbPlh1RysatPkfUUsREFZSdQixc2rsPjfhev+6VvIg3fxsLw5TWLjL5ML
         8VgDVUQUHnBfimj0wZirr9nYueXCqDQHLJQGQKPQ31xmO3Fn1JNAmiLEfomq6wVlyu8B
         VBAWaZ9KTbB92NpWTKxKleXS/Yd4GRK92LB31Z/gb31Yz4+eazk1MuOnkJYA71Me7Vx/
         Z/qCklQdUiILITmFGxplq7cu3hUDOWd6AzGcOMYpcUDS2XntYzarEm7q5eg8oC2TZkwd
         qhlmy+zaIwUTT2d9Nuxv02qWvaUmAmOTFlaKBUSXB2ZOwWKCB8ZFvhpx4jMpLe8piL6B
         wQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509411; x=1784114211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=IpMyUNh1OkhVIQd64NBIGRiCF9WGcg7UM2hZ7gbXD1fy4X5Jv6jg7AuqFZEP9FRuoz
         AKMEAUYgNWQyYwrc7RoVotLHm4K9RHbXqsrapZCs5DVJkd14Ugu7nCVp2ts9NyzZiOHF
         GyN9NwlUBnm/dyZHSPcP0GDjyKLT9xKLEDQHL/KW96Q0GAnZIljgmYa+McRHo3NKZzc2
         dQzznaiXh/CYVGNpNmxGqYsp7nqn9UXL0l+bwTvbMnBBdElNcfNDOGPDLJMoZT4GIPw2
         7FJunJ8qNdbM5lhHtbUQgZWN/WdR9FL3AuVJ6bolJ3GSiFt43xiwQhx8dkIeEyCNkzVt
         k8ig==
X-Forwarded-Encrypted: i=1; AHgh+Rr0Jl1ThkmJeOD2mw5C4sLGq/AksHjuz9pl6SMPWjeaOW7TLs+Xjmv2zvsjv5N1PlRivhw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzu2GLEoirlhK2IPgnGfdpe/8IQL2dnSxh+2P4+lPrFJ+/mVfq
	4y+tavKEp+Vqq+pirMXs91y5ClQQqqCtLe6HIQUIyHB9gqikODL1vzYkPbmGcCd56ec=
X-Gm-Gg: AfdE7cnP0n4zNOVLNg95BEY8wpZJGRc6myFWVr9hsAOAbPLE68XTpN1AQ/LYy7VgkwU
	8yEb+62OyVmCDbqbTyJJl1FFqmlFaCY33cINfEieqPwoNmCNPpP+D0Uq0Ps04Wx52Ts/FoOjhfr
	iJuASnY7qWvfwlz/lxssDjY3d0PtxSAjm4n56lUQVB3mo0XCK6wgzky62a908X6LBtzo9wmSSwf
	9Q87zdZXTmKj43MROolbz/6QkT9B76BP6O7nLJ4xhIMkSRIGdZ/JY79257AIlB8eVre0by1TuoZ
	7eHUW5UaQHiBrtRw3/hnjEnDBSbNPKZZulddc1Fu0nJq3i9m3kL9CkeDX0g/vBtmc/kaJPiZjcp
	kMUk+aOH4vAE2bUA6IWKCYjMMsB2T7V1uV1Wps8KQp/Whnnp/DtAgG+uXrfrsfuS8QiDxSOBHkx
	xjXOJu1fXCdMCzDhhNU0nfYz0S/S6NnDpB4s9pPUokfTNs5x/EX5ATmOA85l0TWNGIBBvjz3n6V
	Lek
X-Received: by 2002:a05:6000:4a11:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47df074e23fmr2309041f8f.1.1783509410912;
        Wed, 08 Jul 2026 04:16:50 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm40326700f8f.29.2026.07.08.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/23] mfd: Drop unused assignment of platform_device_id driver data
Date: Wed,  8 Jul 2026 13:15:16 +0200
Message-ID:  <6cdb070a4e773c2c8b84bd2c2dd3628545d7e7bd.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFUyx0qnP2zKCNNfgNq59gFkbTpytA6eHk24 hmc6ZVxsBiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xVAAKCRCPgPtYfRL+ TgqzB/9Bpu/S/yCAfq1ceJH388wa3hj9KYRwwsjLsRZ2wITDPFEIeAGSqN9eX6tfaS/ZeC1rBru RN0YVsdLzykyYbvWGsTFBRNnRWUKRWYeON725oyq3tPzWBgxPb/4M6ab/HM1HCsakAKN2Po/BL1 EMFbC0kr3R5f3F1QSj3tmoN8DesptbklIOW+WuwoGWR/mvnrmOPF1Lun+nBv8x6G3bsEJKflEeh 4h22Y9y8Gh7z5MG/cHlH1eIc2KfK0lwOm9Oyt0iNoQMjKt0AM/hMgHQiRNm0xlMgQGXmNg94cfD VQT2NL17J5x2Q1u4m/nI9EULzqea6htUHzmA0miZsGYP/p00
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e253c753beb6..a933cb936da6 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index ea1d039477e3..7987583afc60 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,7 +429,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.55.0.11.g153666a7d9bb

