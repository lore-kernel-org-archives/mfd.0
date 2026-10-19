Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423262;
	b=INDTTO4w2eoa54Hud9rxbJoGWtRMXA92PlsoBVCROd9LIYbdvDhaEej+g7fH38efy1hV
	 aMlWoJ0uRC/eZlYmuboNZMtY7QA+PFvAUOFxI+aIR+M09OAVl6+/r0fEGQ+kQyXXNMXJ5
	 aXOZW8yarSoAKCXH7pqlOYCwulKfFKkHdkqo7iX9DrQylNQTgcSUQ2kJwfBEC/8yxpOk7
	 ZlImPtZ3VglwOq8wj+3IHAOx03bQeqXZRjZNSItzpzfFzLtNVYJ/zDAIck4AyDvSba8qs
	 /i4YaJ0bxkKoRTJsVKAbae8wnE9A2j1MG9tfSV54CYIrecM2jJw4x2UYKc0FS4IqqMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423262;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=B/OitBJ+joKHRZ/XXj/u3vOnieBQ8zmOHunwotPvTsY=;
	b=LyxYRXM+AX8Lzju5VJ90/tJThXAD65ZV5hecOWYnOKAhKU3Avgj6f1ZcUV4zgJo8iCp0
	 P/b0C7d6gFQhElbEF1qUHruNHg72OV49t6B/f4nO1Fa2+SsYa8cctbyNZiPyb9X+FS3Nj
	 I5wc0sS2hGEF+T76Bv63ixi3ImAvKXS4GBYLg4RO4s2gtMzoNXUoKU7bGtjFqh6o49Rwt
	 UZs+5y+JuVMCoFH4suXzZnCwfmGrsjHe3pHIFmT33md7CFmESI3eel6Vu4lnnPwD1h+k4
	 0DqWrOuDpFMK3VYtHHFOXiRjOcVp/MZwkzYfQ9E0VcPFEJBDAOXRa0rW8A7G5ZLfApw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcZZQx19;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C944E60A7E64
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcZZQx19
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E7E1F000C4;
	Mon, 19 Oct 2026 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792423261;
	bh=B/OitBJ+joKHRZ/XXj/u3vOnieBQ8zmOHunwotPvTsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gcZZQx19oH48tFiz7J78hV/dbvQizUnqd0pjuhtCQQ9+Adl34d6N6PS3DD2XFZeqt
	 vO0jdTJpqaEb4ZQMSo46RygL2KPC2NYHgqV0ObpHIHNGWLNHWxwoRtTTx3VLU97fcH
	 PhctOQRHQxx/DG17VK076jy1YVssv5SiI8KFaHrwTAzs8yEYYa6yo8w0lXaXEB/QFz
	 /e4tlC082UwUB0eHlhACjMxYkgbdN2iqCpZrlrl9oXtuDT3+VjX07MUpAT3OkTAJm9
	 cEkUUHHgX+8wgPkBY3mYVDIw46iNfsUlMvSzr964oA6il+raQu7sSVVeq9mzgc7+dj
	 2akRbHMhdUD0Q==
Message-ID: <sashiko-outbox-177687@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.6] mfd: axp20x: Preserve other control
 bits when powering off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019135441.1420968-472-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-472-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:21:00 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Oleg Proshkin <oleg.pro171@gmail.com>
>=20
> [ Upstream commit 3756bf05c963563f1325af105356541882dd5899 ]
>=20
> axp20x_power_off() triggers shutdown by writing AXP20X_OFF (BIT(7)) to
> the power-off control register with regmap_write(), which rewrites the
> whole register and clears other control bits in it.
>=20
> On the AXP221/AXP223 (and the register-compatible AXP228) - that
> register also holds the CHGLED auto-control bit.
> Clearing it during an orderly shutdown disables the hardware charge
> indicator, so the charge LED stays dark while the board is powered off
> and charging. Other variants keep unrelated configuration in the same
> register too.
>=20
> Set only the power-off bit with regmap_set_bits() and leave the rest of
> the register untouched. The shutdown register is readable on every
> variant, so the read-modify-write should be safe.
>=20
> Tested on a ClockworkPi uConsole (Raspberry Pi Compute Module 4, AXP228,
> which enumerates as AXP221): register AXP20X_OFF_CTRL reads 0x08 at
> runtime, so the old code left it 0x80 whereas setting only BIT(7)
> leaves 0x88. Writing 0x88 at power-off enables the charge LED
> while still powering off the PMIC.
>=20
> Signed-off-by: Oleg Proshkin <oleg.pro171@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Link: https://patch.msgid.link/20260611154629.76607-1-oleg.pro171@gmail.c=
om
> Signed-off-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-472-sashal@kernel.org?part=3D1

