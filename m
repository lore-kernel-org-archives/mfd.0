Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851877;
	b=cPS0Tx+7hQoWsTFsh50tzVwAtlGn9dS223oEjJK+lVC5mTkbLU4/FUywypYeHX862MWr
	 XagLEGjnUrjrGbI8wXW5j225B6whFVchsNY9X6FM127MEwu/wC0JwhFHWPl5NuuR8IdtS
	 wQI4lzqYWzMgUB/iiE9O9j1lcg7Yp5MJU/HbNW8LkDOlMGtiDXNdfbMLiaTC0szPwYwuW
	 iqB1z9xngZsq/MuYHhbDer95636hN0aXjhlW1rsyzKOlU4acDKg/dhyH8gzODRs/icQ/j
	 rKtC3qTIOQG8SbMHbGK4dmk1KQVUr/2O8Y1aJF7EP6oVt6zEDhy2LKstACMo//5cWhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851877;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wVxHU/efKpeR8LJlpROMpz6wzM9PBni2SjDPvFjwuXk=;
	b=aeCa+XF3BjpmWTol3FvLzq4pNy6Tdr3ZBgRlU2OP3+y3BJIcaDFYquACBKv7Q0Cc/KJb
	 GUwDf6tZn9N6gCKuydXp2rOJgzrYDh6J/jWAghr8eVoaTDYtOpUH9rcD5N5QslhlZkp8o
	 HDsA0IJ9TB8BZA3il9DPhVyont4KGmkJ71jMfuxuz7hcPDkl1U3l8VS1FbATNvkoRpnxN
	 O+aaHdeVJX+ddo63vANI26dcMcHLBkqGMsmDpV3f+xm0PMorTb4ZvejcIVYQIGGZsm9qv
	 dBr2tS0zCs7j2vsP/8t4T52YUl5VhbpDx6sEpzGNB8lyJtDloWBdYTsinko2UUP9+BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jf4PPoTI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C82606A322
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jf4PPoTI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0591F000C4;
	Mon, 16 Nov 2026 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851877;
	bh=wVxHU/efKpeR8LJlpROMpz6wzM9PBni2SjDPvFjwuXk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jf4PPoTI1n61yeYpqVrJkUnPSRbWgyAJTrnOLxQ2J5KdsgDc1hGHQanP0RQwaaQ/o
	 y7go4IueodwiDdIpc/jAaAmEgN8x7M8dxqx1fq5w9ZZSKyRyLhQ0yhIazD7qnV5ZO/
	 5rDk2NNV4COXGQBwNxms2234CkFGre81m5s+0LHj2nMPl1XDtqA+J9ETc4VRvZJ53C
	 GXt0LIBGKwPUcDKGX0D0RVgP+D7/JSHEWDmy9wHy/R3C2NCvCAWSMxP6tDuSotCDf4
	 HB3a49Et/09d7ZUQx5GKK1s+M7TqSyvR84Xyx3LBTMPY77HfTPGduY3yaR0gRCya1Q
	 /5UwYZ9mt1iyQ==
Message-ID: <sashiko-outbox-217469@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/9] pinctrl: airoha: make gpio register layout per
 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116174854.342912-2-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-2-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:57:56 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116174854.3429=
12-1-john@phrozen.org?part=3D1

