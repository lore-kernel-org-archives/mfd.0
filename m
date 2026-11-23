Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415715;
	b=MfxBQWXJwlJ08O8pVDojR545/9HoNmgnXMl2DXFB6FN+IFonHfF3W0xoxdXu0H7dT0v0
	 okJP2B53zOMw0uho9vO68ynw7S9aFsp+ZMkyUXEwDHyanIGiINtSrqQ1nXzdsNZTQEPT4
	 69YMgyduxeUADEZ2tWOLohfEF5e6Xbgt72q6hrmriBUtH0LNc6RhJoBE8Ai9RpZejdZlK
	 w5GpNmc5sJ+HY9WcQu6Tldkv2PvAFXW00CPtnVhnuqvjz5uGSu+aKgNJki4pu6ZEiEhin
	 KSv4ZN10RDKnRk13PxWm/VOdKqhJQaen4hFiN1lUYSPbE0XBHkL+LY9okdESNTIRAZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415715;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H5Sava7HD/Cnt6FARpWoA8cOm1u4jxdvtE9dj64z+yU=;
	b=TKGQANSv4P6pCq+HUvEoW4l+C70gg2DHVW37aa+pdakNcLHM57HXtHPeCX3r716VvsvP
	 sVFbN5sIGmR9zFiSn9K7S3wEVha5bZeKcp0dmX6qHvSxPkz6TCoU6grjIoaimMcD6cdNI
	 qBycRTcgE2YGsQsqyByOcDmC73EMlk07U4fGmW8vDM58eC4tMXjCD5GLvFJv2xyhPol8m
	 30dPDCvTRm0Nj/MKU2MaRUMcYfQ3R/lpK7h/a6bj/dDN8TjgEyBNphg94sKcVoRgsZ+YD
	 aauBjGYYfh3A42gF+WvFHkmzJx5OeGSfk+cQCTm9IJSTJNdKf45ha3J4SNcgwDPd8ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="h/DhfyKx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98036606A31A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 06:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h/DhfyKx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EF51F000C6;
	Mon, 23 Nov 2026 06:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795415715;
	bh=H5Sava7HD/Cnt6FARpWoA8cOm1u4jxdvtE9dj64z+yU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h/DhfyKxvtcDyAuw66AkWo75XvYMyRDWtf/tj15bQ+ppo1IDYlqOYz6NEG0HerT3c
	 qP3Zp61vK0gMdtJRSZ0tlMj6lK4Cl/eg2EoHjqnX9pqBrn5T/eDLkdZTVFYTaDC5Ib
	 KULFHdc02Ewa8z4VqnPBpVv/n5zBvq3GkmOsDtLJRxlG/j1Usj02vzrP22upjJgIMG
	 Pq3Oki8HB1vskKdUYdArBsL76gKfXi1/wiFSEUyFV2kq2o8ESvOaIlmcZJUrssqo0H
	 IeJISbzPDg8lQvii8yCbHDLmnxkUiJaNCluSW5X5GFvY1lmhj5XWl0vX/ojCNBhi2t
	 v9IQvU7fvMYVw==
Message-ID: <sashiko-outbox-228769@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: cgbc-core: Add support for conga-PA7
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Haberlander" <markus.haberlander@rosenberger.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261123-cgbc-conga-pa7-v1-1-f3d17fb02e43@rosenberger.com>
References: <20261123-cgbc-conga-pa7-v1-1-f3d17fb02e43@rosenberger.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 06:35:14 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Markus Haberlander <markus.haberlander@rosenberger.com>
>=20
> The conga-PA7 is a Pico-ITX board with an Intel Elkhart Lake SoC, like
> the conga-SA7 SMARC module. Its board controller is of the same
> generation and is accessed through the same I/O ports, so the existing
> driver works with it once the board is matched.
>=20
> Match the board vendor and name, as for the other boards: the system
> vendor and product name are empty on this board.
>=20
> Tested on a conga-PA7 (board revision A.2, BIOS PA70R026): the core
> driver loads through its DMI alias and adds its GPIO, I2C and hwmon
> cells.
>=20
> The patch and this changelog were drafted with the help of Claude
> Opus 5.5 and reviewed and tested by me.
>=20
> Cc: stable@vger.kernel.org # 6.13.x
> Signed-off-by: Markus Haberlander <markus.haberlander@rosenberger.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-cgbc-conga=
-pa7-v1-1-f3d17fb02e43@rosenberger.com?part=3D1
