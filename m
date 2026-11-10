Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348060;
	b=2RCetXHYvh9B6/AEOJtnIbUqqh8djDz2NaRK+s3BjrnZkTZRo3K6sygq/NcIpjTlGFT4
	 w92ZIIkXeoSaFrIVQjwJzzBfQhYOwOAuLN0ADlATR4xrHdjudMdmLtAFYjT/8oYuFRaD5
	 KBmhIW/oqD/tBsIKtWXcATpR48FX/kqwPfRXSauVQjbnBCG9GFmpdcQDBScdm14zZB8Z4
	 mEHsICobdp1IKO4ggIFi//gmAZR0D1gpnj5/4WHuD+xXEk+xnJdNnCXXc+THrxd7XGvJ/
	 BFG0TxrFQsX4mwohHqQoDoGaAF79Ee+hmQjBZLksDiJt/ITyUIJoXTeDzWLONvIAESA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348060;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PoLMubCZCQ7+wjlHLUWkMz5LYHziQ5q0fvUSn3GW3Ko=;
	b=kpiM4UBSIo7ocOjfb/IGd5B2s4f3+zKZmS8tu+cD3yzIIADSJg5DB8c/EkXnqw15YY+W
	 2CPdps/N0bZYPGFUZJRFN0uaSV8hhYebSKTUoLheDEbpk+uVfPZJQH8Ano+KyHDwxgbiO
	 jvAKRaBx6w1Es39mDDUzeGxfAF3x2Wc0EfNfNc+F90IFFQfPkiuHHBEdi7EkwIPT/y2Q3
	 3XjBLuqv/KSYZUe3ClTiC2XgD17btCbGNVvGzAOJn1EhMxYGfofstDAxbIJ2iuejroVtm
	 kMwIx2LuV2UqfdIrvp5MBNsJ2HHDr36LiCwn7WZFsHM0B8EAgZvvaTMqa8O9tGW3CDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqFob1Xd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345CE60A260A
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BqFob1Xd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59051F008BD;
	Tue, 10 Nov 2026 22:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348060;
	bh=PoLMubCZCQ7+wjlHLUWkMz5LYHziQ5q0fvUSn3GW3Ko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BqFob1Xdg1K7+ukKiNGKp5C8jC2X/qn5CTxDESvkVrKvcTRPYSfnxzoGyFF2kET0c
	 2MJ9w/zNUEqTwRJTPf+ORQSNGHP/a+NyDftrYsbeNAwwxdZz72hg6ZRTCAabmzg0Za
	 raIJIP5qmU1fYg9IharpO9/2s1F9d3NZyPsfcvYCQpFGYAp30OX+OC1T4wR1AcpNbN
	 EdG4no1GgNFYkyOQopCsG1T2UNN2xeaxlfzyWvAtnke6LKVAxAe98Fymwo+gDQVbOL
	 d/bRQMsFcqA7tVa8qqD9vnX5ngPOcknOm3VpOLuzMS4bBK7THVN6M13T3jo94V0m4b
	 2IfBBJerkD/Lw==
Message-ID: <sashiko-outbox-207804@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/20] mfd: lp87565: Explicitly set driver data for
 the generic dt compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <8f0bc82073121d4c2af24ef495873f486cd53631.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <8f0bc82073121d4c2af24ef495873f486cd53631.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:00:59 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The driver relies on .data being (void *)LP87565_DEVICE_TYPE_UNKNOWN
> (i.e. NULL) for the generic device tree compatible. Make this explicit.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D4

