Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223199;
	b=toUcUWeKOJTRiv8X6ui9MY17f/vAyZ+28j8ndS4SIZWvSPcfL6Zk+zrcESfqh4QlNBxo
	 cseqyoLFwXi2VtQGVnc3PkLss4e5QELl42oEuxFmGrDWE6wXaf4A5DL7wZoeyT2mW/GaH
	 R7/SOeUPoIw0xG34PTjwz3FrnOxWJOgdDQ/IIuZ0bBsKSFIGexsFDFUa5O25XOYjcj6Zh
	 6Bi9yUBrcv2XR07YjwbEwSAlbLkAD9oIso/fc+RPbu8W7E+vmLXKWMED8gOINEfULvUno
	 Cqlt6j0ei0EhAXGNmM8woaEEvILP9wLNIaoRK2rMwA1C1kiJtdKyM83aE72MsAOSAaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223199;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6kZy3lrQGQdEc6c08sa1YWR/wGmyKCescIhhA2Y8gvQ=;
	b=yWgRbxWKkX0hkOZWArcwZ08eDF6OTKvOnvImvL13JjawF0yBZCi42Pc+fgfyajqfbbKD
	 l/MS1CWdezvu02JSzdpkr+FOaebk46CHBFW2XJhTH+N/x8u5u+5+93CrTR7h+LCUIQ9Mm
	 f+8EoAsaPpWPgsomAKnb8GrMw4Ghj5hyN2X7tLOToU5/XXKvunU3hl+BT+UqzfSgdSRB4
	 acO78ffkRkw2KA5qOemeF63aagOlT3BO3B1gs0B10JSHHfVeGoZ+AElFdI+kuNjVofhp9
	 9PH9lnhO8q85L+e9lIvy/pGLOfHSaOQVVe8gDkDA0TkPnX2C0Jub5tSCtZNVR8qwHeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0+eApaZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ACC606A331
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0+eApaZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF051F008A3;
	Mon,  9 Nov 2026 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794223199;
	bh=6kZy3lrQGQdEc6c08sa1YWR/wGmyKCescIhhA2Y8gvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I0+eApaZJf8z07IJWToZ95vjL09MUFG9596MtrPJb7PFAS35ya8zs7OoYRfVqzdnN
	 ucB30IzI4naFmhcuQA2Ar75zKi80iMip/ah1G2buYNgSoD3Nb4Ngv3w3DgTmi8Vnk2
	 BvyPHTGM3g6ne8osBSGb1B7z7z3Zff68ZJtEYsAYoxVMXu+cfYwCICmxySfW93LiG3
	 5yECpDYsK5/6+5Octv/xAI8yiP9MlmhXQeSIqYdrnBcZNaE3XAgfAuaZJzGY6PvdIV
	 VpCDhy9eEE6e+hNG5NcKwM+IFCPeh5cJ7ZzILRAM+KcWbaRM3BlxJQZ/UvgiegWgtl
	 LtcWl1XizbEJQ==
Message-ID: <sashiko-outbox-204863@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: gateworks-gsc: Propagate I2C read errors
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn>
References: <202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 11:19:58 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>=20
> gsc_read() retries the I2C transfer but then stores "ret & 0xff" in *val
> and returns 0 even when the transfer failed.  regmap_read() therefore
> never reports an error, so the FW_VER check in gsc_probe() and the two
> GSC_FW_CRC checks that this patch adds are dead code, and on a failed
> read the firmware revision is built from the low byte of the negative
> errno.
>=20
> Return the error from gsc_read() before touching *val, so regmap_read()
> and its callers see the failure; the FW_VER check and the two CRC checks
> then work as intended.
>=20
> Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202611091914028089L=
4I88l9WGcWziY8r3qZb@zte.com.cn?part=3D1

