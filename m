Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4B3435AAC
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616411; cv=none; b=GMK5eV8fCyycWr1mou/PkOJv9h2sEYvjILKlZRuP8yZ0xBr+awwHaWzvBWPbiH1SXKcyIpTQ6MlV0Kq8SHsqtQyP25zdif8iKuk+t0/fhLJ81KxkCqPnCeYJEnKjrtnu9ju826L67KZebFfHcBnIZqTjIyv27foFMXj48LTinrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616411; c=relaxed/simple;
	bh=XgzeRkwHCtgLE8cDPcpkh+fRSLRZc3sMAzqjruWfXXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c6P586VOcHQFVMJiAI0qnMqmkU+qf78FarAmyetoTqTogs7g5ChfNc2pE9mQ4JWo+fMFjS5cvxvtnzrWctSjs1MmHT2lWu6q2CIJ7M5aPKlE1ay3oPBUCAukgMUj/X9/K6KRuyfnW1dttbCPdN8nuy2iSJFXBVilYeMFTHat2NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XSegOR99; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XSegOR99"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47122683cf3so81210f8f.0
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 10:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616408; x=1784221208; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1CXdimNtV+8iKOc+nx9ux4G2sDnokhnNrrDBoO3UNEo=;
        b=XSegOR99q8DGxGxrR0gqHfYQcIPOa6eUKJRLNtneq983Kz+6b1Z5+lwtDi/2aZaOER
         RZMUMVDBaIYzB7Rs7O6xubBbpbzr7dj9wrRvY5t9a0qDEf/sHwisodBFtNuaOf8FT5ho
         RM16cHllaVpAcbb3mOCBZLdTQuNEPX6P5nXAZux53vNo1hQLqePbgNnEGDaqmSs2EL+J
         yVvo3OmOdPYCJ0WtI6I1xPW0LjEIYNiVLBLSwYwi6u9lyWX8Mu2FfXGYVYQ6aHDnJIpg
         5o4cx+iULpXI4gjEhgAwpkGc6PHZJgNZR5n0bdcbatW+urTh9AU+iNByrSICSCxuKvbZ
         4SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616408; x=1784221208;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CXdimNtV+8iKOc+nx9ux4G2sDnokhnNrrDBoO3UNEo=;
        b=GC3Y3fYUn1HAYgZGf+Xvl6Um+UUQ//zlPcUO/TUttClcPXBhU4uuyl6ZNVptD0yYTZ
         b55iY6I07Y28KuDVc5OVGwnqZY7lk53bQjIDnOu14uoJmiPb/XWPXrvvtx04Shms2tIt
         utFfYm+UbkxLtahGOS5fkpBhnvzKWzwba6eO/vqQZn1ShEvrmF9QClgoAyi4NFjHEAAV
         n0KTWfLNEITEJHA9QmVkqcYY7KwNRO22ze3/G8rSu7kRpt2hc24JUdAzBrUY+aTvAq6x
         VINrz3dfvnavEnG4AgL5gSc47We59uxcF6H75TXvo8nwJcZ759pwoTUPbKQW5+lotjoD
         z+4A==
X-Gm-Message-State: AOJu0Yyr7FzB7eOLw+lpxLBJnueZ+TwDM8Dm+j5GHXlka+zA7+ONuiuc
	lGzuxu0PeIkBWd3Ei1lzuVUQupSEIZ04wVwRttWADrsMYFxril6kNLV9HxFpu1RtqMEKMN1X8tW
	bWqNu
X-Gm-Gg: AfdE7cms6bfx2AyPH9gQidTYoOkdnFaqXav61mK+b2liJ8OIBChJOnlVi5DzJJNjsas
	og7kV+O8A+88eeCSDJSbLGqYSdixjNUjuJa6DcM9BlXSSmIN/3zDtOL+BWKpuXiPKVMfhPUoT7o
	+LK/lfxtC8CptNoF7vMxrH+c/sbEtF4q5+IhVto+6H4bDzMeglPedO4ECV6GNbsruyRskgjiQsP
	86lbcxPrrPm4nVhYxfcf75+ltdRWuiW2i65IkjjoUNZVpSirqyAXngAKWhvI9Mv+UdXDB95Y1nC
	kH7lhqwWJ+Dz02/0dsBWJmhK+j8DSGKX/iDXL9VOra9dYxeleRA50nkwBGjCqNn/2oCAZRjHr8x
	4Y/FnlK3SQ+VipRfDZKzOQyvcijVaPgexBJN4aXBtepAMb29K34BNgAzorx5uxF3K8JMr4UZ/u5
	06J2UsW3IB+rLJDPL+FFKunhKdhy7Rjs/7VCwRyXF3WDH5iEw3rwhSBZ2xBpW8DAWH+P6q6ztfk
	lJ0tW7vwIvf3cQ=
X-Received: by 2002:a05:6000:26c2:b0:47d:f01d:104b with SMTP id ffacd0b85a97d-47df077657cmr8468318f8f.46.1783616408571;
        Thu, 09 Jul 2026 10:00:08 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960634sm53758363f8f.26.2026.07.09.10.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/23] mfd: rt4831: Drop irrelevant __maybe_unused
Date: Thu,  9 Jul 2026 18:58:25 +0200
Message-ID:  <721f349322e9316c81763cc1940dcbeebb6f0241.1783615311.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=XgzeRkwHCtgLE8cDPcpkh+fRSLRZc3sMAzqjruWfXXc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9M/ODQ7TbsH+hWirC0bKAGudcdur1M1hfW4O wKW00QVM0aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TPwAKCRCPgPtYfRL+ TjdNB/4pScTDqcZs0JX0iixLeJ3K7EC+azVYlP6j3rIWbk/gPrAjorE7LS+8HggaFTtPBbBnKd4 8UCrOROjJmu1gUdvqY2xfKktaeW4MHbAuzExGb6frNcZAuN6h3lESFrWSgOH53w1yqSgnb6BxVS pgxYA0RPrB7RHekxiqQePz2lQg0RXYww2PxI6BFc1ZMwf6+ZZQ7hkk0q3kufBEqmdhpiwqsZV99 r24KXQHXL8pNn1clz+V4uGjfFcOhGFNpOAwECisd5Hxjf23XiPHOmMCX/xYlll13dTRHHrDzxTY gKlV3qhaH8AuV+T1Y6ui0N0vvzQePUqad/MHpbwkAaOpOiOF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So rt4831_of_match[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/rt4831.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
index 1ab8870e4ebf..2b3f84b81c65 100644
--- a/drivers/mfd/rt4831.c
+++ b/drivers/mfd/rt4831.c
@@ -98,7 +98,7 @@ static void rt4831_remove(struct i2c_client *client)
 		dev_warn(&client->dev, "Failed to disable outputs (%pe)\n", ERR_PTR(ret));
 }
 
-static const struct of_device_id __maybe_unused rt4831_of_match[] = {
+static const struct of_device_id rt4831_of_match[] = {
 	{ .compatible = "richtek,rt4831", },
 	{}
 };
-- 
2.55.0.11.g153666a7d9bb

