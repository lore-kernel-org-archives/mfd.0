Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432760;
	b=G37hjSl95KqQ5jTbHAxCGAOBo6cwo4jlKLmYOJep0vvx2wWlciXQSVDWjXsERV6Logw1
	 4bVNe8SYYkZ+MQeVPkh1SUD3JLnklwkoP+p79nGdoea4gbLwmRah+PtfECZWIS0fiY6Xh
	 5TE3Uirw6j3AOBqRmLcdH4PCrH9wLHTj7f0TxnNLC113VqwkdobDiLRMP9oZzfSZoFKOz
	 cgORZLltYJzfijGdvi/KyTwrpX/Lg31wF35E8Aj8KviR5Raol+kkTVWcLlhv2ZViESZXv
	 CZMu37OctAMACz6sLx2/UE6klObqfMxTqEpecenYAZgedwRsA7GmHx2p8FPy4269/+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=ucAmEFsa7p0L3cxR4mHPR4770B2XlVZhSoV9n7aBPo0=;
	b=lErREL27tJpw7PR19Pd2Xh9lfcuPAINzjVBUB3DlXZ1PEoA0Ld3Wo0BoVHzL99/N42hk
	 y0oCxSxg8w7wmc15KJusbMENfQeamJEC4vioHH/4QBkLMGk6Zv0lqefZbwmu6J3nnqWqu
	 2cDOuHAUh8nz87dwsRuq7ViQTS/T4II+Jyhq1bJzp2n0TKJBOAHJwAK8EoSRQbFsDSA7G
	 nZmg/Fd0BkZl0/JskzZeIjjVXwd9ueS3ZlE1vlbpc8HzJkl8fTYZXiCjqt/4aXeXWd2Yz
	 /TGjvgo+lCMeih37hdpUxqRYa1rT0T9OppAHuveSScgRWzgQHIOqbLf299JvGyKDroA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SOhXlrd1;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1960A3822
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 11:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B1960A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SOhXlrd1
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso30551175e9.3
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795432757; x=1796037557; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ucAmEFsa7p0L3cxR4mHPR4770B2XlVZhSoV9n7aBPo0=;
        b=SOhXlrd1JmZBpEmvgOOslbeD1/xzzsytTG5c8iM1L+XNqJmNCqNGSG11LjFbHu4gQ0
         DRjbP5PfOiSqIdSxd6oVcfEfNshurx3GoQeZXAzhvlUyXqsFjguuKqUyVeyFiUn0Hz0E
         wwn07gSnW5dcQJjIRnGzfeFE3hWpC5Y4k8OFD/nucHEelsTD/Z0myttL756YRjDICSwa
         cW7mFJtHYsPzPketatg0mkZee74MHHsw1taC/0RJcsrARUgVfCnJXt50xJET2qX8jfZ8
         sP5XGRSvUREHZCOD3SIYAMCtnb7abM03lBZbLwE+U47UMF4XjSpxhqUcEnmY6oKT3xnI
         dL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432757; x=1796037557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucAmEFsa7p0L3cxR4mHPR4770B2XlVZhSoV9n7aBPo0=;
        b=FRtFAXLDYjCPGKnozfmmBBsWxYDv4Ie6WKhwSCbOEf6hSqVJDjOKClCJzS/UBS2vDi
         rS589muqqzFYuUBjdOAiK0nXKLhnf5g+qp7v1b/vDamFz50t8ivG2NCvajIwT+Pi1uPz
         N02GR1rR+wDis0/12oo3HD9rEKy95wX5+CQJpaaMXa3juSMY3vcoDZ/jh97BEl7U0jLj
         k606OIaY383yxkqUKAqXVmW5SzcfNcI9RSX3DkF6HGyzYJipNPFJQDncAF/tIVGIgQ0y
         +OIKMtk1poY6JV/4mGw8HC2Cla+dMIxui7e7fpT2cUI4a2SljZdz0Uet0U28OCCnIRBN
         QSVg==
X-Forwarded-Encrypted: i=1; AL+hErEg7QHFW3MGClocGouLXP3XrEtYunSH9i7LvluIfGuoceQTPsfEQbkCmr0e7Ep6lbsdVRY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/NSXERjSgw9eG8lh41O76LKJeQL6C2hQ8mEVkkhyF7A0C7ZS3M
	F7Ja9ZUv9EjB53z1a4/K6wMFwpjHF7BbVoD4TaSnlOBwVkxWUQU6vVQ0brL6hy6d29k=
X-Gm-Gg: AZFdTZfywb21HZgkp+kl9v+bkFLXptQiKMQ0rRJGVIoKMUSEKt+G2CAkPyA5kd+tyZr
	RbSpuU/MFiI5hUpvSIuPumiZqXjRjwsoLXVk3bF6ZNDGAvCXLR9/gap6229Vc++ANmK95kmTbgU
	7kDzkHYu2mfpsrM32NxYu5MfULkdiL0nPc2bYO4YKOEF7urVl41TdVmfKYFggMO/8Sm6ZJ/u+M2
	1cssyDaO5Dl8XfQOiupWQhdUiSPVvcywnt9Wayf2BXLiDC5pWD4mWsCsBfDHBqFQHwH9OFbuYiN
	IL9BrFYKEyIgJ2U9E9vlrhk6jTXcxnt3Cf7oczdlPFiozToHdeMBF5WZ2aL/+08B4fEQ6448UED
	yoLQaTNPikUc90StY9f2CztBCp1h/GAtHD50+5T5sOuP9FpWMmTOIJz+1XVaEgCq9AKyDrzn+AO
	icvqvM9QmVa5XUMO5FnhBTvowHZhETombqcT1d/hUBhQ4oXvAOcL6gbQcQHCZ+rTPsM7dCzoNjx
	KMRbE5qSXh7B19epzB0Rw7cQnJYzEpiHeMEtgPWu5WEwe6wI6//HVwNxkOKVjbcqxo9gEPz+Tqy
	v/vwLWE+jHXwXAPJSH1F8c0hsPnW+9l67ZonbTmvY2w6t32z+Eb/ovlmSCiiiBVKO8CevdMagos
	t5lNZLnE9fyO7zjIa
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr246892845e9.34.1795432757202;
        Mon, 23 Nov 2026 03:19:17 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884c3063sm351330435e9.15.2026.11.23.03.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:16 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 11/17] mfd: twl6030: Use named initializers for of_device_id
Date: Mon, 23 Nov 2026 12:18:09 +0100
Message-ID:  <67c8b42a7ade79452f9540899b8da762a800e367.1795431460.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=8Rq3Ynt64dgZs5N07nH6EhswZsw6cyYyIHyFU+QK58Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBCEDW59riR4bnjjOXgbHT5J/IbMCHUOG8L7Nd pUlUuniZ1qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawQhAwAKCRCPgPtYfRL+ Thi3B/9akDOZt1NDJUslN18OIZRU85umTflGQUMuziVJVnfi0U1eOfWubs112TDxqavas4twt5B E0TgY3QqfV3QjMkVr/X4Mwha7b9/XlTQ2r41qVnLL06aYVcyKEHoq3sKqLb7v+uvARtQpKcG0jL 6CNXRPMqPUJPtUfRb5MwV77797F6V2oteqp4++uDN8mBdIilWH3Qhb84fudPNtDXxSyousRRcVy NLIT0Cuhcs+UAeQ0GrBMRAfwIgDRZVVjYCWPo6nEhj3NFgdDx8JGcjY2/u3BdNCRLxGH6Zt6oCn LFFz88zz/f999p4xynkktV3yk1Jqp7Znc26Xz37lQ2JPMY1N
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

For .compatible a named initializer was already used, unify by also
doing that for the .data member.

This is easier readable for a human and more robust against changes to
the struct definition. This robustness is relevant for a planned change
to struct of_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/twl6030-irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
index 502b1542186b..c1d3ef007601 100644
--- a/drivers/mfd/twl6030-irq.c
+++ b/drivers/mfd/twl6030-irq.c
@@ -283,8 +283,8 @@ static const struct irq_domain_ops twl6030_irq_domain_ops = {
 };
 
 static const struct of_device_id twl6030_of_match[] __maybe_unused = {
-	{.compatible = "ti,twl6030", &twl6030_interrupt_mapping},
-	{.compatible = "ti,twl6032", &twl6032_interrupt_mapping},
+	{ .compatible = "ti,twl6030", .data = &twl6030_interrupt_mapping },
+	{ .compatible = "ti,twl6032", .data = &twl6032_interrupt_mapping },
 	{ },
 };
 
-- 
2.47.3

