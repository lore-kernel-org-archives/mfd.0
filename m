Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909533;
	b=yKwwYz1ONBrXbOt5bKvUlK/neJBzRJw2FknHeGI4JrB3m8XOyhefkx4EugePiNhQ5nkx
	 04XvLGbn6Tc11jxE0gZcm8EKu3+nEEXQS3u/F6+qgWc0wVec6SpY0jieXwj2TQ/BThNM1
	 ZHLGoQmEA3/dWFe3VpFk/UnOOmKPEqkCO2s5s+2o+AJESPLiVxWW4YF2BWNuhfgKybfKH
	 w4oUQHe3Sx9uQxX3gw1UMx4YGRGQQwKZ2+3WNEKzHKz7fitJuFieRoSiZyeeYpAhGCg4n
	 +LTRc1QkRG4JTNTtYHhJZhTFwAdXR/wi3+IpKE96/3REeAspDD6R3p+JjcvrqcrxX1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909533;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Gra2tirUOCBD/5iIJlFe9Zk+JtUF3dQuqElu6ty3lv8=;
	b=1GGMZLUi4UaPaV6rcHLZ9Bp6o1QiUMQGk2/vSd/7si23UG0xmrKA9SAXec6X/OXSnXGD
	 D/bQYDendDKC3noSM1S75Fj1gtY8nugD9Y3tuprkljg/qNhs3+3rxmu2MMTAvBQnsYUhC
	 cmXPZ6lGMXdiGry8cukGu9mL/Ub+CKHmSK+id0c9WL5IBEIhVJV1tZ+a3ZJSGa0Np+Abv
	 EzA6DMwWw+L2PhvxzZyk6Dqth3/cavvwJ2TmkA0aiI9DbiDnD8hGT3T4/MuDhX3U3d1u3
	 t6ThkzZRCjotEIDChjforVR1iHOEvoMSgeZ+iwQk/b0Ee4FPeOHcVoJJ+R2Ic9eyW+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJdeFxGI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1B6606A31C
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJdeFxGI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C0D1F000C5;
	Tue, 17 Nov 2026 09:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909532;
	bh=Gra2tirUOCBD/5iIJlFe9Zk+JtUF3dQuqElu6ty3lv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EJdeFxGINmEgRvWtBljFE3KOqcqVAE42fYxgPyBeBGUJCTnVJluI0KsPfk7Wmmmew
	 Xykkx/rcyKDxFB24pVbOWCBkZ1BHURTbkMJ7C2xQpJCVN0G24AG1IrouHm4FfGPhGt
	 kQy0+wxzrEfjelyuM2IojGGp6ezenOSuxwHD+b7/lmzbTnXR2P2jA4rgrVMcQfVfXD
	 W5l91Jhx7FQnusBHJBc6+7diV3RWmUkQUb5z5TKGbqfyaK2sQ7QmdxHe+6hFKCZenH
	 KN8rIcLTGoG9DxlMgD/J8xi/cJp+wh9BOmvd5dvWvWCniNz3Ljwnl3XdoeIhnKfBpy
	 AgmRx0CRhc89w==
Message-ID: <sashiko-outbox-218556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/10] mfd: cgbc: Fix use of negative error code as
 valid session handle
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-1-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-1-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:58:52 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The cgbc_session_command() return value was directly cast to u8 and used
> as session handle without error checking. Casting a negative error to u8
> produces a valid-looking session handle. So check if return value is
> positive before to cast and use it.
>=20
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260713-cgbc-core-fix-cgbc-remove=
-v1-1-79274ad62b3a%40bootlin.com?part=3D1
> Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D1

