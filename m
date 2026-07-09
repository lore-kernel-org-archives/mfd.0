Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D541CB47
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616408; cv=none; b=BTNEqB+C+f59SuDW9GhiUlc5FArTyqsUt57Y7iz/lJVDzOH/afUh8+D91LHXta5FHaqMsbAY7sdO/2qCOJ6+EnCE88bCEoeXMKk91hC+ggtLyvuTH5w2h12Xx2yUgyXkCpMw8YE4t0j0yenmsOW6euz2O8GEnx/1296OiAFvzJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616408; c=relaxed/simple;
	bh=5SkTZsUqSy9SFf45pMZh19Yk5Swb3xpbHrGPPbY4N6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P8xjnRHqy+h4CFLDF4ryIokUtBXC3V6vdMgQmJqN8h6vbVSYw7Q0ui6zgc9weQZKmTRRJbyrfA6v05APytMzU7txZSYT4aLXrz6ASzmeJ741dcLMqm60baam3MZNx/Xm2/oxblbbjJb4Q3jKmMDZTGK+bnIa2SHKcE0nAegKufQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hxZNbM09; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hxZNbM09"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47dec32798aso126930f8f.1
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616405; x=1784221205; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m2tSBJow5S5Sgpy1deDJVTUqG2qqSEOe+iGD0siXXIs=;
        b=hxZNbM09w5iioEqhWFBa8fmAifPL5FdASEDB+L/mcU9f5Iri8qvi+Q6oFHqdtRyiYw
         36U337u7rGTvRah9FlgF2CDrR2ec4dS6IbNGirhjaHw5sbxQ0LYiLrsHwW5sDl0YbFUt
         mX1qCJeIr740Vz2SZKo/Q9uwhHzjiQdz7B+YGN2sZUG/Zil40BbwFDW1WG2JxtTxjetV
         iPJbCpsZng7D1w4rbWTQ7fPVhvXlPmBcmBKOg1k2uGxX3RCvTQpvQGUiEn7amB5Uj218
         lYa1gItr6gcPHleAT4/kWcjd/rw932VImVn1bTp7uX46o7i0Cj4GP7qPsPhAG8EdSlwg
         fVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616405; x=1784221205;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2tSBJow5S5Sgpy1deDJVTUqG2qqSEOe+iGD0siXXIs=;
        b=jXS+p1bLV0NzU8MAXndTq+ZAm+AeLUM+ywLloCF9vajBsrcdq1LwNLB8dEUAFKS40B
         5qjndNrEuUrNIXqvi/J4l2vFcMkECCOgK/TdJ2BEUXsZwzxVXoOGEHj0ctCnfPVPey3w
         7hcBb7XXzHSmX0+WmM3l9cGiiHiMz2gXIpmwbp7/d1HjnfX4oOto4P3G+nluOYkZeqKY
         zVk+0e7RtK6ge4ypUc0Ao1ZKQpoC+ay3pMiq5ypFiGuXrrigKE9R2xeD4nLUHP1O5jwY
         qBkqlRWYLEBjGWd4CorQpVpRLB61SdIcVpwKTpAtMjT2TjzTD4Okeonz0eFhnkAuwGx1
         vhHQ==
X-Gm-Message-State: AOJu0YxOzGQFFjd5OvqluweAzCvsqnh0hmifCaOqrRKPNQqyOjW9mLh1
	nvaSWufqfkPRPzEqe3GsZF8MCSmoaDbFRsRWq7CbOws2lAe9X5YucVsHTAkLcgyDrCo=
X-Gm-Gg: AfdE7ckrrCJ1FHDUEE5PQaQ7Bzy/MiG388YMNV6siWSEOxB//TTnFgLmxHqCXNElcuU
	G7VovLHVc81XiZZ47bj7P+D0oC3fAUUaLQkyJT5Fm59A1qNNsH/LISe+ioryTgy4BRok8H4g4tW
	NMn1bzF/dtU1gbArsk+6lCYvF3lfElu3LVQUhoh+8J7KCvmoEO1pg0KymAYK0gOmpFadwSprTPy
	Fpis7WUGXyEvEpPPKrCr3+Jxkbyf7nivkNGkn0RlO+rTGQfPAakNRYO42c5qyitou51/7gyDIFU
	YK3LvGj8uOo/xB0FZIXTy48N614cdoVOC9UrWjJUeCg8Vwj6b3xV071men0UbK4q8gmHI1niqU7
	Om1dhN08q/tXWQo249FCod0ouBilss2oOKiCyycagSnrFlFF8vWLm9bamaPACBoDoVxnYXTT3u7
	O6Skx/0hyCmjMKL0w5io1Q/IqZn7Ri4GT24jx99MXpxtCLv6wSSk/MUmef/DpxJmxZ2l1vhjzJU
	qfF
X-Received: by 2002:a05:6000:4b04:b0:47e:9f03:e542 with SMTP id ffacd0b85a97d-47e9f03e597mr839402f8f.45.1783616405448;
        Thu, 09 Jul 2026 10:00:05 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9e3e2702sm56871939f8f.9.2026.07.09.10.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/23] mfd: lp87565: Explicitly set driver data for the generic dt compatible
Date: Thu,  9 Jul 2026 18:58:23 +0200
Message-ID:  <67f459e39590ebe562964d59c4af63c62792f237.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5SkTZsUqSy9SFf45pMZh19Yk5Swb3xpbHrGPPbY4N6U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9M6P2cIMmiVJFaSy2vWra7k+Hf+FDAqxhsT3 EmFkeAb7buJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TOgAKCRCPgPtYfRL+ TlO9B/wNFPbWRTPszNn24fxbUlHNJLC7cgeGr3Jysfvi2n5ZzCRylBuktNBeF8uxmiIxNp8sbxv ivVe3jAGiHqLG8x/kHldIJI/Pll9uD1rmq8VbRv3zYNtwQhMK05X54RocmD0arNyghpT/2+xuN0 0DVjdS/hEUbPVemfkSqNH3s182dEuUPu1Xrrt57mFcdb90hTHlv502xzX0UcFqJuPHuD2mtxLAv Fina7uuNZRpNCc5aEdQnsExB67G5KeUe2PBFUdGWtWIlv6bg+LHiBXvR9mfYH4CpUXD3XBa9DzH jiWWCfmvGmJ4dpKa08g63LHMyNKpz7c/9ScTb3nSsEH1rhBo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver relies on .data being (void *)LP87565_DEVICE_TYPE_UNKNOWN
(i.e. NULL) for the generic device tree compatible. Make this explicit.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/lp87565.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
index b78ae79df5fa..efea1ba82811 100644
--- a/drivers/mfd/lp87565.c
+++ b/drivers/mfd/lp87565.c
@@ -26,7 +26,10 @@ static const struct mfd_cell lp87565_cells[] = {
 };
 
 static const struct of_device_id of_lp87565_match_table[] = {
-	{ .compatible = "ti,lp87565", },
+	{
+		.compatible = "ti,lp87565",
+		.data = (void *)LP87565_DEVICE_TYPE_UNKNOWN,
+	},
 	{
 		.compatible = "ti,lp87524-q1",
 		.data = (void *)LP87565_DEVICE_TYPE_LP87524_Q1,
-- 
2.55.0.11.g153666a7d9bb

