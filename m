Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236521;
	b=GshgKWIilwAoWuZwfKC65I/jOYOMWwON1b37Y3Ig52j8qD/+Nw4mdXboNvTILGPxwYXc
	 fiXlZ84cv4zRTbRicDNgpPIYAQQFKWN3LLk1FWBKPTL8kyMNlkfbh9XSpM0cC6UO+uRg/
	 M6ivQpQOSxWdbhxBAoASA0cPOVtoawIFF2r/J1UtD/ArD7rZEoNF86kZ+UYQLwUppfBAW
	 u7DGo3mtIiIrOXlkQvBsTTs1jWdSvAgKD9xWZIK1wro69yY28uWc3w6j4BIr64o5J2JU3
	 2lyjGYC2Zwwb+t4sNSdFIxkM0haKch38t/jzvaXKtLIFIXtJFQDcFhO83mS6wk5RTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VOcJAa/6iVQmoJGKBpTU9xqWGdAlA3weGthwqZO31GM=;
	b=wh7gVp7z2lZVIwKzKL0g4fz6UrmHJU5Oor6Y5h+4+yzN/K95x91kHFTBK1Vvt0H7D1Qk
	 aMQI8De6npneqhl/dJz5lF5DIgbE1QuDuZQFWncwiGRBfXq/NKs1EC2yn2PwPsbnZHO8z
	 KNECQ7EJMG2J116LJTSIQOAk8E2FLmebxdVxXUJAspAl3SAm4+Qbv0m6JZxgsFwsxKy10
	 3sbUvvDgZhRubYnrua+uqecpajGNX9k1pXnkBXK0MT6/ljhXGQRflFoa/GGORcha44QgN
	 GXEu/q1vgEbkpuVYfU1j2tV6Wu1Ws+EKigUIRxIksScppxueikFHr4f1b0mwY3+4rgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7u2nANn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F400606A322
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q7u2nANn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03211F008A4;
	Mon,  9 Nov 2026 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236520;
	bh=VOcJAa/6iVQmoJGKBpTU9xqWGdAlA3weGthwqZO31GM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q7u2nANnHILFeunl0t9XxIbNOR6ATtUOBEmz8PaP955UVc/nyqbPeT6Gt/1Z+/EV7
	 yHJBNK7FuOWNwaCz5hulOEcSVkf8efa1ldIPlPs4EHQ68aY4f1eJ47z5Wnw1lPGxvP
	 bWCgq/b2yiOfIEiLJYjGygwO5PgqzeaeEhVFfx2clNfDykBfkcvYqlV0WYNPHoSu8B
	 woZGudIL39D1Fq6kwCfMFI0w1fZPAgzKN+8fV6M8p8GaLUIM7TvEL8cB30U07sEDIG
	 sAOSp7SGfpoTriyLs1AhhAgHo7HNjDzdgFUhP7oSKEoJwLdxCQdUXCsNIt4xc4PYoW
	 xpQY+TC5eKr4A==
Message-ID: <sashiko-outbox-205141@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 2/7] power: supply: rk817-charger: Fix NVRAM SoC
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261109145833.1363319-3-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
 <20261109145833.1363319-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 15:01:58 +0000
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
> The NVRAM value is stored as a value between 0 (0%) and 100000 (100%),
> but the bounds checking checks and truncates with a max of 10000,
> causing a value of 100% to get read as 10%.
>=20
> Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK81=
7")
> Suggested-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109145833.1363=
319-1-macroalpha82@gmail.com?part=3D2

