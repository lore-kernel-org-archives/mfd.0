Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339694;
	b=2LkzUwrbyo8aRyEDasjuFLLhvF7asw9Peh3SuoDg+ytU35O6xSc6eG/c33Stfy8kidm1
	 y0VLWyWE2LOWzAaMTuQwFGiSMpOX7w/MZAKyKthUE+HsIPXZzMk86wN+A0PGs9Oku2xm0
	 J2RKiJtlcbTWgIc2jBX9ofUbCRZO78Pt/TOUieVU9hU0jhx9wCc5M7Kkq36qE8JA0r/PP
	 u7P871OucENR2tJqIPUs78ALjWYYO8hsvQxm/4cMIUJ3n39GUHqLl+NbfxotBJftF6pzU
	 SpHu0tY/+O9MjLSoHR1etf8NreM2k0CFWUGOM7HBtmL9CK1EqcDALO100pG1hEGU/rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	bh=+XU/L3s3AR1zRZpGx05jem8OuHu+Aq/54xxilnMM65s=;
	b=B/CId8NzNVtfCCKqnYJJwkryje3u8JHX8rYT660PbcgrCeIWCj6HRX6Pn8Q5dj/Un1H+
	 zTcMWZyJITLu8OtiCn0cz/JbePOs8uVyLmmWsd0Va2nfo+/g67Gi7fuzawP/fqFV2V7nf
	 zB4EDM4uCcS1EohaqTXO1oBqk3mFgFEEiLz3pJ52/u9iXiZFg3dXBUBiVXCLuQO+GaVNM
	 G+puFXYDTDp/8fqjho5DOGtxUXdE4xNxi56WqWHp1jHUCJPvFr1imnmESS0kODDW+MxkF
	 A4PgSAN0Sl6uVsD2Fq/nbhmPVUIGnqXHoIPx7Ub/gra2q1J35T0YIBQ9rDy440y0djA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlWhNfY;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A6F606A32A
	for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 09:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A6F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlWhNfY
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso999624f8f.2
        for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339693; x=1795944493; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XU/L3s3AR1zRZpGx05jem8OuHu+Aq/54xxilnMM65s=;
        b=aUlWhNfYGVmkxRPWTEKaqfoeTYAMTQtlBC6DYKsG8YHxnlNh1oUg/9L6mNWaE/RHyo
         qWw31neNk3o/kGxA9HRGtC2fT9BQEjCKhCMtOdjlc2a03Qrj1bqoivI7tlaATg5KtzJ1
         4IK172lY/MNrbgGs1mxK+oFDwZ9NqgnEGwq3ZCGk7FAgjOoVNN/vLEneOEzG5AyyKNFE
         feqNHpv/o9o1Gph3mqYUi7YhV+MgvgRy4u/J9BKnBqNWBD3lhoOMhUSfOwK0aMR33onB
         QH572+K8gN90Urw6x151N2RjmyIxRdZCI3Q8o+t3URRGjARK/PzoyypqvyxzObDpAMKN
         32ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339693; x=1795944493;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XU/L3s3AR1zRZpGx05jem8OuHu+Aq/54xxilnMM65s=;
        b=KsnHqoRrOKKzOx1aKCA403KS9b7MwAIUqQfEmVK1V3euvEYg4DoCVUKiAr049sm2fC
         gOLyHxuJEkazu5FfsUMaPneJCyUJRLUoH/pGFQcTtzR0mWXBP+RXp2kmDZyzBio6ijMv
         YcapvFUC0h9FSF/R5gswQ/kjCHVzlNAcqbqcj4eg6TzfMJubs0CuKF2arI39sO5ril37
         NLJXlSMzcSfDO7AarLDSRtUXWWxE8upeIO3hCUSk+C+zrg+Q2Vm+36oJ5eAd9ZMygDyU
         lXfuo2nmcl9MjYdgTNhoPiO46DQk8ONCvgDeqfJfHufS2KJZd9qzVpgFRVWyIHGXkGzw
         ABHg==
X-Forwarded-Encrypted: i=1; AL+hErGcYeomaxtM4mUgccfM52Ndlnj25Wv5XQs38cZDfAqDnGmNGtN94ewZkOwXLBBhPBVJUQA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9BhVb3YWyJGGhyrSM8GvzmXksY53GU6F0Jh8n8qDu7z/l9Z9/B
	IMgqHt1QIH8Vucmc4q4xsOmIo1CV41qOE8K5nz/faaEJl2UO8EwPsEZs
X-Gm-Gg: AZFdTZcGi5rbdUJlNd6XyuYpJJFofMO9Hyvlxdpt2yfpHNROHB2UsqH2/pAVB1rt9Nf
	4wyKKeZEdQvFeO87i6+dBzJBPNnpmQ6ukFhqSekrlx0dD+jlyRaTDFVrOzxj7DoKwUGPEYT+hlX
	WhfehxzlMMs4C9hL+j8EC9qXbeTPY2LCj/A7zw72b/N4MmD3WoD+oywUoLNNWIaieeqe62XuxMW
	zXq7/qMpfGT82S4Qh9PcyVr1ORkhLnzp2tSJDuZKQBtTKHXRi0TQz70D9kAqiNX145J7etc67bt
	yzxhjzePvt6v/ARaFFeVbPyi1wlhJV10p81opbLThNGRtX3Q+A6T2lFhibhG14YWup4t+QGVHcX
	45WqONQ1FCQaoJFvjsYCDG/CyUoDH8+8fPgfndNhrZefDpfQSuipDNgeFvijmjNFdciY0I67FKI
	X4RTJYeSTgn97547AK4nne/HJYrzx5OJL91hNFnYYnWgWWhAq7MSJRo9KZHWIk6AZHJdHwmX1zk
	lK3Jy2YqG4uBR90++VTawGSY8hcKBucamVhb06wcBduMp9gUBucgjRNx2tJ5Jknw05TMOEj26in
	ygG7TirWX6ncxnXQDhIMzID1dgP9xfXq8fiPrH7p5Q==
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr12062401f8f.29.1795339692451;
        Sun, 22 Nov 2026 01:28:12 -0800 (PST)
Received: from strix.localnet ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm12250751f8f.17.2026.11.22.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:28:11 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
 lee@kernel.org
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Sun, 22 Nov 2026 12:27:50 +0300
Message-ID: <pmvkAYeQQxqf6KX1o0NWJw@gmail.com>
In-Reply-To: <sashiko-outbox-225964@kernel.org>
References:
 <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
 <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
 <sashiko-outbox-225964@kernel.org>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7pWE9LkGQbyJZPD4mlTCyg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7pWE9LkGQbyJZPD4mlTCyg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Sun, 22 Nov 2026 12:27:50 +0300
Message-ID: <pmvkAYeQQxqf6KX1o0NWJw@gmail.com>
In-Reply-To: <sashiko-outbox-225964@kernel.org>
MIME-Version: 1.0

Am Freitag, 20. November 2026, 22:51:31 Ostafrikanische Zeit schrieb sashiko-
bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] pmdomain: zte: child-to-parent device link deadlock in
>   zx29_pd_probe()

This looks correct - the particular line shouldn't be there, it was a leftover 
from earlier attempts to handle device unbind.

> - [High] pmdomain: zte: wrong supplier device in zx29_pd_attach_dev()
>   device link

This one is likely correct, but I'll have to do more reading to be sure


--nextPart7pWE9LkGQbyJZPD4mlTCyg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmsCtZYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiWwUP/1zrUTig3p1zQi1yN49m
lZsHM1mGoC+rZz8b6Gofd32dOfizYgpEF7nTr/TVadx3oSzKlKF5ayXHR/Q8Bgfo
ke9bKibuDSpORGTL5M5S4hxiwi9xIJ9Ut6alnVApxneNS1AkYMNFW/mDbSQGaY9n
RdRD6/yKt4miuWmJQdWJLCPaiwcM6e8AbUjCavhkMWEL8z1yxQaUGDNJKIdSrv74
OubQcJfVPr4v6UN7JfUvg/aBCyVH4L/hYNSBaasfH5Gu+BjgB0S6j/i1FY8TRhHe
/+LKiKGph3Bqq5Mh9Ho197e7vfKbK4R4agnxrJV5Iad52JhPtWYhiKUEdeRvduxB
fngHWLMNa2jDLI6iie9bWLAZGAP1Hi5ZeBQrkl2BhXN+BulUPfdNWH8nNzJduDMI
a5NNnM85VdY+jnIMl/D920QGXAii613m+nJg8R5jGg6LrGNt4lV+pcJO3tS7BhOu
vL7UsI2tna7TUMj7bwnVdzmbLMipw8prPWpRTNUNBkP0KaSl5CnKfce7OEYFfgvY
tLLl/eLGF+sOQ7Mx+ZQE6KE50wx23vPSrpjXfERtrFGwm5PyI9OO1fxrctm5cwdd
j7kTk7HZcAiZQUsC+qN436NqIkBHCNR9CCm5VLlOVCRxq9yqYNH0+00P5+jKGjmb
OkG3sJu7139jhrSQYgGPFpFC
=7yFm
-----END PGP SIGNATURE-----

--nextPart7pWE9LkGQbyJZPD4mlTCyg--



