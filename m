Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432016;
	b=I9aFPQu6RrmF8kFTDX1U2PGeP4U9S2NdGT2Y8d7MVds/aj641RZn5BgVAwNxhKzmRFye
	 x1DBiCWzxSrucb2goer6WMEjbE2B1FfM8OhN6OwGFVeHaiijJMwPysc1i8SPUgy4J0dmy
	 Fi5wouqgD3bYIDU1cA44mn8xBth7CvZVHFg0RByEnHuaL3C8xHtQ90ik7cvrbGsmFN872
	 YovKgUSXRWdMA9joEArKVSxlkrt+YeQyW7KYfescLiByG30FDbQ7ki3fXxiY3XXITYZBz
	 7ZEfa2tZ1ay3axfdAgaMXvOpIwZ6WTwwH5K9pnvPn3sV+biAa/U/RMyf3SPmgyFZd1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432016;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MtW/pxWmaBDD/8SC6mxliaYsNHFLi0yS+2T3X6BDpPI=;
	b=aaZDYIAdSDg8c0CUJQuld7rTmu2L4QpY96LNpnQWBV/zQX/kk52JEx1wG7bGJrk+kIHV
	 MkLah7G0VzF0IYXS4kmLNVvonZQFd/7X8LuMTKxHIDrURpdwWU0GZhgzi9TJUZqAwjPy8
	 3JN6RUTz0iuOcbehufk1poKcZidp4JB71rf9TwrEzirzPxRC9PGjBsOt2fYyXDkc+uipu
	 KoT3I920Xfy6l6mHdzcM6RWJfgTb7q9T0B0OefgtLcYOXGeYyjGzNNx9k8KYlPMVAVmpD
	 XcvIe22Tg/s7TaHy2sauqhNI9Za1SFdk+3OHFhn1UQCYXGks2BfNdZ79MPisO/xng/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otlC6ccl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA13606A324
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 21:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otlC6ccl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7041F00A08;
	Wed, 11 Nov 2026 21:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794432016;
	bh=MtW/pxWmaBDD/8SC6mxliaYsNHFLi0yS+2T3X6BDpPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=otlC6cclusJunH6iyMEF40lu/MTKv0mMxXtAgbc7secsUiKDhK/FQYc8eSPY2E2cr
	 6CsSZmjZz4ADxhBarkU6HiwpA4hYxkGsJWj0n4Q0srJiyIiPenOTwzpFD0RXTy+5zn
	 EqHOVcEv3CYtSAiGFsJO0KEGhPcBqNxwhA/89ZEXvv3Ao5fLteuZRMp7CI3j1h8Pxl
	 nClmZohpk/tl3e4ukblv8gtedczb92Ig9i+6FwEHtpzFOHw15JVn1vq6RC4W8pG7bP
	 1gNGhjuCBJhSBTVVTCa+jt1gZTH6RM2ISVOv6XHlmySOAanmeMFoPaDgh216tpbxje
	 dJWovvCrEPKUg==
Message-ID: <sashiko-outbox-209695@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 1/7] power: supply: rk817-charger: correct spelling
 of coulomb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111205627.56652-2-macroalpha82@gmail.com>
References: <20261111205627.56652-1-macroalpha82@gmail.com>
 <20261111205627.56652-2-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:20:15 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Correct the spelling of the word "coulomb" throughout the driver.
>=20
> Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK81=
7")
> Suggested-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111205627.5665=
2-1-macroalpha82@gmail.com?part=3D1

