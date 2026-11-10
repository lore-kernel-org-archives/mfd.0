Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347783;
	b=0HI+AEdcaPuWCqbS9NeHONF9D3o3fgTYUwjbpAbX559ctcu0WI7Nc7yQ/PcERc7FEZ68
	 fblcrBLTA2KnnOGlGZy8M0vBXqfAL9KDsDrJC+t7JWXjmmf2UwhdtUf7f0/K2ioDa8qna
	 iFuvXXv2jSPpndAK91i5FtZvQ9n1wlcY1JM8QKdxssflA1HB1eLBtqCP72Clwi9jQArvA
	 Pwv3CRO862HQhpWsqxVb+Adp3r0vlMEd9dHI95ucoBGXg/0k1ARDMc1gvGSzul6orcUfV
	 p85aZCm7Kgj3Ci1Q0YPBCA3po2h+37P8xEPokZ68DbvKlVo5+IoYGBsVXYsysaD1m/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=2R7Vfn0GQ5DPzT80qB75r6tRx9r0Ti6+T0q5fMrBmX8=;
	b=HWy/0fBqWUNoz0/bfc6AzXKbuUWRZB4jgIEW7i0enandFMtNzeDvs+FovIJtKv4f03iP
	 H3AMBO/KWlfniPqDGhGBFx1s+pWyLMfiaUedjdPHBkl2BPiY3Enj5HiqE1FIAWamWsVFs
	 Rr4ZMugFWjJ2tUMozk+2fmjAfIDErWUkzUWGIL255tqFyOMi4V/lk+Fs9YN3YosyjnLN9
	 bbZwZiQZPBwfvgUQHBAwboAuEcL/DEuMKA/W2qhoQUaSYEuc2g33bTb5Yv9rb25FE8nCi
	 jxo9OkhTIZkYmgb8EtIxawS82nv/PrZqxuWTZIkNxruZBj6eQR9soON9+vyxaQX5CKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="T/ZaqmOs";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04EC60A6F4E
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04EC60A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T/ZaqmOs
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so20468955e9.3
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 13:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347781; x=1794952581; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2R7Vfn0GQ5DPzT80qB75r6tRx9r0Ti6+T0q5fMrBmX8=;
        b=T/ZaqmOsDqrKoeYMI0QmN4ivSpi7s5SW5GJRek4J1Xf2enIob1oqUaYOmQNURjvqFm
         eTlr9g0/QmqEshQpbnkLoh17+IS+GG8ly453n0OZNMfNFW2lMkb+cbDI85eLKxGoOFJY
         XmcD+IzEVU0MvGjBYgkbmit4B1HsI4S3X5bNJCxVn9pW/0f9AU2X8PDeShS/ov4fJ7Zm
         j3qkilcN3YFp85te/vp/TvM3tKf+hUkD9EeRyE8CYh+Ef6OlEKiw8tM8Gg/ByWX3ZfRV
         nM9DYP15gBh68ZdpDX8NaXMvJmPqalqNZji8m/ZM1FJZA+PoA72U/g4yM84b2HMBXusm
         +3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347781; x=1794952581;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2R7Vfn0GQ5DPzT80qB75r6tRx9r0Ti6+T0q5fMrBmX8=;
        b=cBc36P2iFxTv2wU/jOHBGu15e0T0/zoMS9ZcDHTgKi6ki4M6p+MvyRpLCYaYylq/1P
         wJHLrNdgH6mxCRTfOkcaE8CuGBYfh/t1Iq9y1hrwtk2ROPwTPL9IPEKx2l0wJBCkk7ks
         2aPSd92ofHAzK62bK86NPE1Z1akjngoJ3ZyFD42UZUpwPmQM03goFFCxgrEnDULoQ/mn
         s/fvyhcG1x739R+2Ceoz598m6a+9qseI+xN5F78nK6tsHDg2w36vWKKfsGJiaphZviJp
         gz0zK+FkWgCAEyC4ApDsbLwnNHV/75ImRzTiWZNEUWEN0UO6Bd98Mr0/21M9vv91aO7N
         gj5g==
X-Forwarded-Encrypted: i=1; AL+hErEnHaUCIJ86HPv5hP0uR8JkaTsr2zLYw+jL+gs5yADNLmQZ0k1qyF8S1UmNxbxUcicMDVM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Z7OKwhfYAAbdghZOyoi2LndDnV4JDjUb/DK93Sw85ZZ+aJC4t
	Z+nQ1y8lyZKVeWoT8qqqVRnNajVIfk6/ebNUU+IUrrRNBGmVjpiG1KG6uDU0lBKFTVo=
X-Gm-Gg: AYBFou1aU633farSKmB/JUMuIM69xRNF7CfWruiHf7ro+6PkDQuM0uuwJlj57iywDEa
	ZC43ms4Pb5eJ1a7D1OBW96wxdr/SKJsmQESFMCwjXTD9erGyzxTQ5rxP1LCctQi71+8gC9GnOny
	0n0CWsRUvS2iOE0JZZkJaDBJ1xnNy0FoydrNDfJNBIv6IhTqVCFxRgL0jC5QgQ1VXnqxOLmb2sU
	euW89aIVfKf6lsu0a70wN1C7sdAbER9mBaO9JnBk8PSdOHj7G8wV0sQIQxpoHnfjnpnXAMYWReA
	eZlhW47JV7qYtL5tK3xIZA5Un7+0D9JHbY04dw8nykGnMAkp2yGDeFbHbKK2Mj4qVJdpCWd1m13
	HXoGxr0E15K+mLPQ7BnFyt2nAFWYqRpFLQeGe9tbLdWJp7GEwA0OAG22ngzLhGlYeQhso5gO4f4
	zYmvc/l5BTn0DOuw2JypIWM4ulkofWxp5ipfK02fW4wuNpSokVD68G0VHyRutvPDHFythr6Epyn
	EGBbzt/kv0leUzBwDAYBz0qVAJutPc+I52GNTNwyoT4g9Kh4nrWAfq3kliSiErmC3UmfHWfxEue
	jPSw2ybwp4aV5lKtdWWUV1WD4NDnEkcDFvmaO67AO2p+gN/vtNRVBvoS
X-Received: by 2002:a05:600c:1e06:b0:4b0:9803:dc8a with SMTP id 5b1f17b1804b1-4ba093ab912mr5881245e9.26.1794347781134;
        Tue, 10 Nov 2026 13:56:21 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fe2c5asm141480835e9.5.2026.11.10.13.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:20 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 13/20] mfd: twl6030: Use named initializers for of_device_id
Date: Tue, 10 Nov 2026 22:54:38 +0100
Message-ID:  <0fe20dd5f0218e5f283f50412bc549b2a37f73bb.1794347059.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=+wVm/Ab+8kSEk1PxbUHacl3hTVz3Pk7CsUo1EBPglgk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LB0W9L3jSbEh/EoEhWg+qwRUWmJ7ZJxZykB i4qaZhdQl2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSwQAKCRCPgPtYfRL+ TivmB/wM4c7D5xazvoGMYEDaQWxqfOpGo0jdoe8i11cYqLE0IQtsBTV224HDv7gKyHsW/pNhh97 P1LjIN6brwjG4XP+A3AyK8HFw21YNx2WjEOl2fu9+vcvtquoTdG2nzsKlziLHsPxfVToQ94Uwj8 aYE16Vuf8qN6AmzmnY8O71sQNamrQg+71XqKlLQ6ncnDyKjFFVTupW5dDyAG5ISHtfWGZtvhVpD 3lnRKIT10hYWb3PuNHuBm2MAyPmORPbeboGeFxN6iwt4VDEMBusVpjM7d4tYa41eVAjy0oaaXtM DReS8gBCRlaS5V1TrKj75j92n7Cka71tL9mCTTbZQVRcVMP6
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

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
index 0ca00f618d4d..4303fb288dd5 100644
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
2.56.0.rc1

