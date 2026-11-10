Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347761;
	b=SURR5jyBuc58k73mWZ5r7zCbGF8M4ygkxDWpogcp6tqRtrJEnG3aks70y3wSugi7yswk
	 my3PkrFEQ0zRXLEIyFc4XE6BpZEdTZa2kxTD+HqN9GaGNQNIiHr5IOxan7QgdYEZ3Ek3t
	 leMdERAfjCZSPGttvCmmCu+36vyf6Cd09d/3K/0xJv+068VtaNpApHTD9SltK+ki9RLem
	 91ohkY5oMfpSYQp65czhBQHA/VvUOGxETXaLGe9JsEU7cO1JArZHNxFXtmfzGE06i5JLH
	 561GNpbvrHhp3N6UegmpN8rxxi5/A1iUsHSNLSiyuKjtuN311MyCjZOyxJu/CqSoIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
	b=OlGTd72JG+nxeDDzfWRXzlizJkqLtuyzIvAG0uwbWRS3VNB74bhNvDtWMW3EbJzESJYB
	 pcyrZdXbmCAdeYEx/bhqQ8d0BqaElH9gnps1gcjT53T+BFx2PpyhqVf1zua7PD07KxwHC
	 ajHjHPxak5M0ymWwuChxQhojgDSEkwqBLB90y9nRmDmJXwVayVd8lgmPRxhLvxFFB+2BB
	 RrTEL3ONYLE/PDmrwfxm5VuB2YxV5WqyacSgIUeh7TuE1eHbGE0DdqDYtae58e7atAmur
	 JehlSN2Eo9NirX7eI8SLRQylg/li0eETlHx6bIhCE/a4rFw/XbA3AyAoAmKlgsZLUAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W9lR3zWH;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB6860A3801
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB6860A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W9lR3zWH
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491971ac844so2470665f8f.2
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347760; x=1794952560; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
        b=W9lR3zWHTrLge78XUED/iF3vd8/V+R7vdDpsyXZeyAXGCnLnBU0/4YU1tPHBNNfI0F
         kAFIlXLErCLi2ladbiMgMCbjksse9EZVMLwE/jyN4N5jGpFUFIgYZTbKkbmmfbkKgujP
         cyzR/qZUzMHCuOXiCBzeeXV0Ntl5Cpd4DQqJH0t26tdOSyz5cnV+5A0rnpNF6b7qrRRj
         gzdqxRnw4Y2RH9t9B5D59G7TuGwbO9Xkb19wF1uHMPX2ZIQ9A4gJo8xHkThki+i425IX
         Gm2TmE69os714H8f+ZDmsU6QTeIL8mzJx4gfahfEsasw5wGFE77tZ7Q+jv1rv+DE2eQ8
         xazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347760; x=1794952560;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
        b=TXIR8I0dp8NocnfO4b9/BkkvnCpFvg2mcbr5iv7rkK/jnsVhPflf9f1Y7kYTXm8Quq
         uYwn0nq5ac6HEhj92fzy2tII0KuMyYl9nmVeA08AMoQkT43o1WUjWSLS9y/yqe+Ir+JF
         sJrcmFNl5rpci/78+gZbEceyhiRQsQ/fNV5iDU+rF7ut6zMx0dqHVKxdbakn4tt2UfFh
         2Xct/KA44AJ5MtEp8Kkpa8NNp9P1d4/fiPUbaPPjoRGQTDB4Gf3YLnnbu4FdjFJjWLAj
         G4dzPVh6Mv36B7OgnaVxa8P04bXbkMhscZiN5KWyxnmHIC+zCqBFWC/TYlDnNOhjQ+ZC
         5u8A==
X-Forwarded-Encrypted: i=1; AL+hErHQEjknjIVn8qvFYOfft2CUp3BCmqEjjLN+vuFffy+dUGr6JzjFUhN7pDZVccxMcXm1/e8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9jPX27JYRI69QSq7T+ubQS8YnOKxDS9PpRKDn3J48FUhB3Szop
	tsDpChZZn+c1abYd1p2dnQ4WaaoDO7D6ZNjFf0XBS9mlj7+RhtX7jlB3yy4TjFZPNHg=
X-Gm-Gg: AYBFou270cqp7rCHpLWivyGvxQF63roJdEIAUUqsxmGlxjDQrmWUrFIKRqxU0GZUge2
	1qnldEJQRFZ17JH68VpNIubO3XaiXQMSa60qSMqbwKHdNiAmxGf2qmKFxhC3WrWMnt6b6IjWG4D
	5n029654bA1ffJe/3atxkXYyWDAxG48IlJr26oBz8IHQzCDTFWqCLipjar/q2XYNxjt1i2DbjQN
	mQqAcl1l5bn+SZIvs9yLUBimxZGdSWd6BYkOihZyGAhhRo/3YRG1SuJmDSobIPxkO+DfvC6IVEZ
	jFnBBBlDGJYKQY8p9+depbcyckt+gNIlLFpoF7kYbbzvS/D9mcHnx2R3j1pDa2vi/u2nDnKzfQ/
	bdfU8LYbQ8us0FrAG56rrxA8Jk5C25XVlnQFEgLEXY7vJO0GzZdL0XQpX3TVuArauAsgpK1COrF
	HRtO13+T6nikj08DyNnjU9CDE2VyChXFhFPiodfbWkHmPHfPQWvebhIDXWcN8kmBT6UgWWSpF2n
	AORYKKwbHkyOV6J3HumMvpTjWWcEIbgSazKcEPWYkbOiJLu4Yiqf/W7YXOPjdLQKOuLY+8bdKCX
	yRfHoDazZIUJkMkF3U78xSKe9tAfsYBVLQ==
X-Received: by 2002:a05:6000:402c:b0:492:820d:107e with SMTP id ffacd0b85a97d-499c792ef4emr428787f8f.47.1794347759890;
        Tue, 10 Nov 2026 13:55:59 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4988bdef64dsm5664845f8f.20.2026.11.10.13.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 05/20] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Tue, 10 Nov 2026 22:54:30 +0100
Message-ID:  <f24ff673333c0fe34408abf1a4f013eeeb5b63d2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WVXc1FvtvHtwehAQUPEvKaZfuWX+hZavONn/+2WOSYw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KisuoYTGXVnjuOAoBv1WtV1Dwwmw2ojVv8v Er1hTByizaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSogAKCRCPgPtYfRL+ Tt58CACDo/1F4WSgBgjg4oDThZrM6JlYHXkQrOBvMkMkN/laIz2ikPQOpQcH6kb1HJ8KJICzPkL nfRlyhLgE/4bzVPNjE3WM5My9hgSQ4RpVWEWH60bylCAJ11pxX2cVVohWpRVn+y+R/9aa/4zl3L rvKkcDx2LZHxL/56lhEcX2R4suG/y5AkIlhXL1SAz63gSvvtJJYRPrnEt9TvbnByWDDTe3MYns7 odPfiaSK40lzbMugKCueM5ixaCZQBeGFzfqChaFn3vmtjN/AYYQ+vk2OVcJDXbDbkLJaLH5peEc R/SfnNv9Eoz8HYLAASLC1o3YqZMqweOx9lMdqz/6Z9nDEq7I
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 8a97c30cad3f..8263e3ff8315 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int mt6360_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.56.0.rc1

