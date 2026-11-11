Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432104;
	b=uMNDq/gdacaF6VrhoQ11sBJzokRyXUvAXK06AR0fvZ6tevE1CozOjaBygkOb6bLYcfr6
	 nV27k3jeG3Ro5B+hIl7J5GVUad3OA2THdJgzXX8fzIeUr1AFSyrY6NQ0f8GF128L6Bb2A
	 A7wg3qE+t03bMJZw7c9165QmVmh3GHHAjsf5Fl658TYBt7SczeIdagU1EiUVYjkrqqOoE
	 pwPXwB3jDAlhUUfi5hqZ84+/sLa+7gkD9y1e1IQQU92NN4YjUBman6SAyT1HkFv/tqmRl
	 5sEgwyO6K9OSe4NScG3YQduBwpNcTfiyoYziVRdq/zl8sbtIVoEfv0rmpb9vgfLuL0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432104;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TVNXB1mRcGE4dr8lts8lySVa5JNvGzFV+ZgEsAd3RiI=;
	b=3qhB3gvSdeYNvlV/1ZSNovmGvf9vfJHgB3erdh8jsNVEFWIAzMwd92gXUqbN48hD+/s2
	 v95Gthoe06cvUTGcW6ie0wZ/rR0og6fwSknFaFJ+0/PYrc8wa8PZHQ7EBrM2jsW1X+ppA
	 MfkpY4ZAy1gF+zBLz0u8qXaf2L6/RanvRaHwBMKMlodrNt/TEOPLAflEYrrrMm0Ox3209
	 F45t4IYE7Gvq1CdbXCtczo3os3s34sCvrjHGy1ynTG0g6cyh5ukLhJwMzHlaNnoapOIrE
	 da32Szcv/sJAom1FnbIHhPlQQIXSvLo2Fxm9OjVYYqYX2ujQPYBx6OZIHgzfYvOQamw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZqOXvIUe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E303F606A32A
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 21:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZqOXvIUe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700031F00A05;
	Wed, 11 Nov 2026 21:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794432103;
	bh=TVNXB1mRcGE4dr8lts8lySVa5JNvGzFV+ZgEsAd3RiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZqOXvIUefs6BuQJ/F3aAgeK1Qpd/4BGTxXrfmQorRBszbeB9i7NsnrHyvjxhuCgt1
	 Ajt/+QjUl/u9o+hHENkNaTJouuBdnO3IWYxjKTY0ELdAls6lUr2pRO1rOVEAQaKEmI
	 jRvyHTIlEwpdixXGbLVelGbIM/EDvvBNqWlxGXglkc32wvOccXcQ3Rlu0st7NRdWYn
	 tAbuQDVtnLh12vgSC6ufu06h0Uk7h1CstEqYwulrbnOheHGcIMbmIZ230tozLPgg74
	 jfPt8boX+L04EjIgKLPCebaKrlD4odfdlXmRvL824t060D/vHwHah7Wdw2WzVEYPUD
	 alrJIRfNuLk4g==
Message-ID: <sashiko-outbox-209698@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 6/7] power: supply: rk817-charger: Clear SYS_CAN_SD
 reg by default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111205627.56652-7-macroalpha82@gmail.com>
References: <20261111205627.56652-1-macroalpha82@gmail.com>
 <20261111205627.56652-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:21:43 +0000
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
> The BSP driver for the rk817 charger by default clears the SYS_CAN_SD.
> This register tells the PMIC that the system voltage can be shut down in
> battery off mode. Though the BSP driver also included a way to bypass
> this behavior, no boards have been observed using the override.
>=20
> When this register is not cleared, it can result in a persistent power
> drain on certain devices while the device is off, as observed by users.
>=20
> Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK81=
7")
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111205627.5665=
2-1-macroalpha82@gmail.com?part=3D6

