Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F6C54DAF7
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790190425; cv=none; b=RlrCD21OnU76N+7Mr4bBUVQxI01Bz7emfJHfewv1Fvu+HHCso9jxv7P1LN4uiZiFpMsuMrxm73oSgHxeGHI6tIuSsJeOQlS+c0nWpO/zr5hpF5dnNHQ393EeBIp6gA4nNV+Kgnw3hPQ4FTKbw8KaJaeWh8Oyn7+fAIbcBpXeLd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790190425; c=relaxed/simple;
	bh=3SJ6moiMR97rZgQTa8jc0c3pSuImAf/vLJ0uFkNgxQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kFewv1LSss3RpOEjCiC9g+ecISSj/E2LQn5WUf2o0/JsrrAccOFFAd3myEcCSTbVfQFTAXdsu/ewM8qbI7D8ue2ZVYAzpaX7T22M7Cdp5rfLGOpI4PzWeRtfDBA4JM3Duc2CIUFe+T8Oo5jc3qo+933iq/YYMXdusAd5m3zL3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWciq55w; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWciq55w"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so7104495e9.3
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790190422; x=1790795222; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRrAZTJfbjxM2jhxnygG8js/jIMoruYacFcKnFzjgtQ=;
        b=aWciq55wBfspgRjqkLadHjALoq9QPPavyiVWy6hRrTTVeyViLvwA0cOiN/XpF6fVBP
         ZibHiXtgAZo6yUyaMrUJxGvHudSHci5kgiU1kracJ9nOPFMhVPyU3oZJDOsQIbPBhyoa
         uppvW3FjhUxzCC+SpuD6/to5SzGmifTPLPVL7+djyp3zgSlB79+Vhv7tKyjNxOGULL3I
         75j4AhQwdAw0/L2tmSf5JSwE5r5rlQiOiFeO0P2BKxbYvAwxjakr0HF0igfI/6ftBxW2
         XL2kClq6nSZCG5lHIy0+INkeSIzoDDRGJYlWNnqEjbpe55KUYSDreQLvDlxEx/C75Nz4
         JneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790190422; x=1790795222;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRrAZTJfbjxM2jhxnygG8js/jIMoruYacFcKnFzjgtQ=;
        b=jmH+bNNqO/l7eZVpqCrUTcJ0b1L7YGDx6Py+mOltEoEM4jDnbJS463wi2hKjmz/UEB
         YoZO7+iaVZQCZT59Dx1FsGtrJJ/7g/oVfC4489kGe1kJyDCMr+SG6ejDqbnnIK1jUnJR
         IW3a+fm3YQcdmhPat/CmjeWUM3fpW9cNhsTZnedrc6Neu6DiX8/C8sKfBxvBiJqyBQbd
         F8kprU09ZIK91P2Lj3h4+OO+UoEaclYnn2MaGLNofONxcKsafrqV4UcqsJP2Nzh4KVs3
         wpubVveyXEe2+mamWf9kYeQrtd0cfG2BNjmk5N7TjTu2pU7oxMHNUGPPEBrmCTQKrKIC
         xcAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwULsgkerZUEK8Kvcsuv3q1kVErMnqQ0bQ1Vmk2lUVir4ZgeRoRB2GIZnLM4oBVo7TyVIA=@lists.linux.dev
X-Gm-Message-State: AFuF++kYspJpGfNOxpfc+genF7dXbnF6vUuqRkkJHECmEJAGqT40zJQV
	p64k4e3tEfXFwrHTYuBblcna9VbnbagmpMg6m7+0iwXsNETTyoN2nCm3DH6IgmDquLpyJA==
X-Gm-Gg: AYBFou0S1oaX2ROq3UYcX0il1B7htiH+/4fXL+/aqX7IbqQchRJ4QcygN9eEr3Lgc7J
	lcUXtOv0lReVLoWHiglXT59fG7Fk1xrB75EEdWYXGgwc4PTFrGsPJDLcor3W0Kb1fMbkoGI/MKX
	XdaheMU8l99ApmUguiRDYBpNnccUKxt15rGQSJZ+94ejvu5elgmEtQnkxGmQFDDvJkWta9bpAOU
	bxpOlQFP3lv1BsQkJdcWp5mP6MGutnxYOvWLa1v2Dt6aK5Tkv3yDAgc01M6vrF5HglV3fafY6gs
	YXKkz7rDfvAr3a1XSvgffBayP/rN759sdcmu45omV8SEB1v1LZH4QUYtu6u39WF0jRk3WtkZx+Q
	X4e6KmD23KeGuGKrV9VVKTfqH9ONWpCwnXZzoB8PkuJ/l/8E2Opn+Z8sioSYt22xxIPE7T/+7Al
	BjqkafWfHRrAvxT3Ytldf1GBErMuwR5H6I3yVg88FDnL8JdoFcFCr7qEYDNluJuyYIIrHF4x7jq
	FnfAyzWemdWD7gu
X-Received: by 2002:a05:600c:4e8a:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49fe66fbea8mr2319335e9.24.1790190422340;
        Wed, 23 Sep 2026 12:07:02 -0700 (PDT)
Received: from strix.localnet ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm76197825e9.2.2026.09.23.12.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:07:01 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org,
 neil.armstrong@linaro.org, linux-clk@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org,
 olteanv@gmail.com, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH v12 09/12] clk: zte: Introduce a driver for zx297520v3 matrix
 clocks
Date: Wed, 23 Sep 2026 22:06:51 +0300
Message-ID: <wditwJCDQOOx8yviJrPU5g@gmail.com>
In-Reply-To: <20260923184051.0BA291F0089E@smtp.kernel.org>
References:
 <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
 <20260923-zx29clk-v12-9-9c243796b6d2@gmail.com>
 <20260923184051.0BA291F0089E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartbapkTblkT9q_p2c-f6yx5A";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartbapkTblkT9q_p2c-f6yx5A
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Date: Wed, 23 Sep 2026 22:06:51 +0300
Message-ID: <wditwJCDQOOx8yviJrPU5g@gmail.com>
In-Reply-To: <20260923184051.0BA291F0089E@smtp.kernel.org>
MIME-Version: 1.0

Am Mittwoch, 23. September 2026, 21:40:50 Ostafrikanische Zeit schrieb 
sashiko-bot@kernel.org:
> [Severity: Medium]
> Is the mapping for ZX297520V3_RFFE_WCLK intentionally missing from
> zx297520v3_matrix_exports?

Sashiko is right about this - this clock is missing by accident.
--nextPartbapkTblkT9q_p2c-f6yx5A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq0I0sbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi+RwQAJ7LdzarWQJsNGnuTtIt
v7A0IaCEADzg/eOTVZOapRX1DQ1MBLfOp8OAgAgWf+VqD0Fwfhhor5R5EUuDwWwC
igC8QX9otApyyzP14ewnO5PvOhL6fJO8XQSwz/Q0H7cj/Km7exGMKAW3bKPFmOkP
6A6BJXNUVUTGz8lCfjWUkEN0pomCjORtx93e4jDS4zStbtETvxjd1ADd+0yeRFe1
FUhTa4t6KZqGfme4YnFrRXu3JK4jJRzI+xDPqKObgTHZQ8sjCeDoi3zVkYBSoJb9
VvzaKBMvPAo3m01t0EZh/IT34zq0dxWLPL8cfX+FONANbR7s+zguec/DDpzzpPFD
BLs1BFcP1BkVQJmYAfS+s+6E6gEfPKFlc8OtJaeZhJOd6H3iirHQiD/xFB3loMfS
m45lbDTE+r6rNX766bMUmFbTF9a4OQbxVx7sBHlFrPUYQS3HV67euaaAjYYdpSPP
bDcDnAi7DoGNWazr1rC3bHZmnnlRObBCsxw4GiLFwfP0hCH9KuqgEBpU3IH7KQo7
RQnoef5ZGjFs2lKIFWBJ79gDblrL3DSafnNjAHwQdOD2EK2MyeNXggsvkMWkcOXC
V4HoRzPMRxoTcbPjbb0OTFkSOdIHk5Tbl5W2k5V+1dvWvYd7mokaq5RvY8MAaKf5
XnS44kqcP9o/dcJvhIq15tT3
=GiyS
-----END PGP SIGNATURE-----

--nextPartbapkTblkT9q_p2c-f6yx5A--



