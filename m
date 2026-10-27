Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115005;
	b=Usa0h0PjK9O9bHHpncauLy/C2sKhe5F8PVbth6kABkNJOeJiSJniA/AmSPI/8IG9mn41
	 udFCUsaKhF9/Xd29IVHJB2JIpy7u8PvGEipeUdJi9Hxzod0QZkpZv/kDBRuyBfcNa5/cA
	 jrYmUBP/NlSVR8eHOwBTQ57kj4LmNWxyir3+qySu7ipAnPn4RmryP22ZjIZ/ksp8njp2g
	 j/w0rSX9Hl8ZAgT9SR7Vb3Yve6jmqk7724oE7NgayEH/h75AP34uaEA3q1aYm0vkusyJ0
	 SX2G/wSaOrv/9zgtxUiDEphRWLYIAKlUbckWJG2+uRvy9Gbkj+V03Ytjx0nUOS5oyxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115005;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kJ81hx6aFLucgAFZZfsVHffzqnfdmXpVV2gz9i/GOx4=;
	b=KKBV6FDwzsvm8NkIMhGc1VaFScLiLJQviWlndYROs404VenOsH/tk4g/VeWW7Lv7eYFp
	 NLTtpYSr35yPLoGLFEKEidcr79a7guHFePfmyuOLipXMUYAA1B6JdYHP7frUPP/1ZOc5o
	 SygppwvZwslEo1AF+MMBlQwx22meRWplCcrGuciSSHOrxiD++nVHEirJUYpEFeRUnlKTH
	 86iBFT78Majre26X2O491oA+T458VQm9xRZXRT/wY2DowUPa5w1CiFsDwO09P4IGtXvfx
	 adc1YxCUJ57DPutqcb2Rms0+ezx7EghRTeVgDQasaMeKvEszbmYAtl5oEYKJP7I+WtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gHnt14IS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9131F606A31A
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gHnt14IS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FAA1F01825;
	Tue, 27 Oct 2026 15:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115005;
	bh=kJ81hx6aFLucgAFZZfsVHffzqnfdmXpVV2gz9i/GOx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gHnt14ISWboC+upN19WI3tYAdqjrwXqpzZcCA6SykD1y4sjtzVGd5UmUMjsw79l9B
	 Lmbn4LzVI/wtVnbuq6eh2pdBq/7W88mkI6otqhYhEEukEP1OjkUkdt5MU1GiDjCOr+
	 nmQCxx0ADHPrSTp7FoLQxu/b00De4UoJ95c3qKLBU1nCXGlzyH/98QiXAM4WZrCW3k
	 A9GRSAkwEFUizb/mPytZ5FLNaePmBRe3+5J1gScjGRFgIzMGBqnqT/oGqE5U98LqZU
	 y/r3Y18JI78J1HybRdMR8FkKkbBja4nwwsh7LTJtrSvU6loLJovbqIY2DcvgQTsguu
	 pp6QWFOMIzp9w==
Message-ID: <sashiko-outbox-186841@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mfd: tps65910: Add restart handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027152423.194794-3-clamor95@gmail.com>
References: <20261027152423.194794-1-clamor95@gmail.com>
 <20261027152423.194794-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:30:04 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Dmitry Osipenko <digetx@gmail.com>
>=20
> Add restart handler to reset hardware properly on system reboot.
>=20
> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # ASUS TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027152423.1947=
94-1-clamor95@gmail.com?part=3D2

