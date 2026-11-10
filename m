Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794332991;
	b=wFWC96H6laoQuxhn5z/rOHHtT2uixGz5CuRD8IxiB/7611pt2cAcoFgs3ZnbbOF2BEu9
	 s2V/t/Mcryii2ltnSAqlSC7Gar9wNrpDi/hm/QbNP3xLpHP+Pli3His+T6IxvwUTPciQ2
	 w/7DZtxgE4IN1aR6YBqO9mzcjSLBu8JznXkbmRXAva/CiwnMv9uQoh86DgT19bC1WBFQA
	 2PMgwc/pJ8qKh5V+bbOIbNycGS8nnF40OEH2z5BgpJHlTiepS23e1brvO3E6rFENrjm2T
	 YdS5suSdod90nstN0MS3kVGG8YwiRhiR3Ok7NLTkQatk35kZtZLVfIbbqHfQY66mjWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794332991;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uHMjSunmaFSirRhg8H3+3/g3MiFxf/ezvQJ8/gylj1c=;
	b=BroHLUMXGYZgkkkIADwKXDZZMr+ojMA66P2yUZ0AycD2Qjq7eHBXmTGrBgo8GzZwd2tO
	 K/af+Dhginh0W8CDmMgQJ/taogTH9DD2N3EjQ17yIRp1tlDQJdvFB5SS7Qgfu+O4sb+3B
	 z29aGwQDrOXPgfHlHKaLi1Tkbn622rJE2pQnjdX+Te522S27e6wLhDK1OO2r1P9fUJBr+
	 JS9jax83/F6qGHYBWByblHxdriZOtp3b3JIDDdGwPVPApcyehne9EHj4zzemCgG8cgigA
	 8sYsGzJgWYVzriH0UUXTGFd8ZlGHgc7kiv1nIpBGv8L7U55Y9kxhpMuqyZgBDi1oA+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAtmgX2r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B32606A320
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAtmgX2r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F771F0089F;
	Tue, 10 Nov 2026 17:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794332990;
	bh=uHMjSunmaFSirRhg8H3+3/g3MiFxf/ezvQJ8/gylj1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IAtmgX2rLp/BUKsgffWZVEFr6AIJmzzOYpluhh0dyoNSWxK4YdzrWuUd/KzMFlesU
	 WZlsPWE1hh3VB4CBv8Kg5MtUI3ygnpYW5g2cT0EsXuyPtqxAOig5T7D1z7r6U2kurX
	 A9flV7WIRmnx2mjgzjbewA/4psUpA4OuM3i26mAF2qTwqn6ktZUDqZjlkwIxtZRZL7
	 5REXx+gAZLK+eX6cb37Kr6dfuwtPmFtTCQEAbrxwf+utxtpImcgVOxAhV5PzwcRCo0
	 3VqdKBdYIoaRoVMQOPtpj4z/I0W9FdK67H2sZxktJrvOku2QMDA6ZyeUF0D5T4QT3i
	 hT8baoRixfINQ==
Message-ID: <sashiko-outbox-207519@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] pinctrl: airoha: make gpio register layout per SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110173941.301478-2-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-2-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:49:47 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The GPIO register layout is fixed to 64 pins in two 32 pin banks and
> four 16 pin direction banks. Every SoC uses the single static
> airoha_gpiochip_regs and the compile time AIROHA_NUM_PINS.
>=20
> Move the layout into the match data. The gpiochip register table
> carries its own pin count, and the five existing SoCs point at the
> shared 64 pin table.
>=20
> No functional change for the existing SoCs.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173941.3014=
78-1-john@phrozen.org?part=3D1

