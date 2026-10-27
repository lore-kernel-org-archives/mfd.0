Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091110;
	b=WLrEyH0cdperZ6ap+9M9wTj499cpn4mZ0dM36/It+B0RcUS8+sI2eoyiAROgAyfZZBuW
	 xtYDeC2nJC0sxXOPk7zCOfWxMdir3dLXCEUcJUPYTmZOYumu/SkjWJT/snK1JwQiy26gv
	 dv9BAPl/J2ibqqlOSy5WMHv33aL3ALDanO+ev/PJmNTuVoIs6HFb3WXt50OHvTvca2MNs
	 dLGTVsp/8UmRQf6O4LKwlQIIRXP5kH3iaFNQ+pfl13ZFa5qzzulDfmdv4tTyyW+czFCu/
	 H0/sfR5l7Jn4JP4pljDCYJyii7KpsLw+KtA6rJgA/ANQAT4X0jalnZxV0Nd1vsqcC4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091110;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l+94lKtvulLfljwfu5ajB7X4S4HKcHl/rIebL+JDuZQ=;
	b=UNZdiJyT55smH0X6hsFj8QeO09XU2mG89R1Z2DUmS3xngZBQB/kDzAlsJZM4I0KjyRF4
	 JMGg8nkUZhMLz4IUNEPK0cUqt2cUV0erODMz9x9MoJbxICRGAxctEnRc51pZNEgzs5cRu
	 GudhoUW4etUVoXJfjTr2g6OazlVusD/8zTVCE+D2rS3Wm/zDUD2SdNmQtx8hR5o+hGtXl
	 QjFg/DKbRGdBLAemI38rogLV6IHnbPhb0sWIX+QfkvjKFojzyfNOQni8Fbp9I/mLfnnJ8
	 b15BASVC4Nn48myBa5/3beeujFCYXspgEw4fJ+ixaKKwWxmXC4Tm0EqyGw8FOOkeVWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACSCHga7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C689606A31D
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ACSCHga7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB86B1F01825;
	Tue, 27 Oct 2026 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793091109;
	bh=l+94lKtvulLfljwfu5ajB7X4S4HKcHl/rIebL+JDuZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ACSCHga7PQ9GpdyfRr/qZc2PVs7TYexdNedKy8/2KhGu+lXykjbjTaG67Oto2XIx7
	 z19oMjYvALt4pOerta0m7mW1yvClBdE0WX7Wpahhz5lwnv9VAlLsDikc25Z72a8Wm+
	 knhfZ0s2xsJZ53FwloJiAsf/FGCIK1UyRd8n3U2ruNUphyy4zGs34oJaWo5BxG77c4
	 nfSB2ntqOvMnvFwlV2wZz2gZM8BnVwsZfbBE6rwgzFz9KyZKS/HDgpEMJi5b9NaTci
	 UoqR5VheuzI1T3xBHF/ODv/AgUDdZumSd7A1OrAEIHgfeYWVY1f8HOxG0mGGrNFZFC
	 YRCnz8oFvINlQ==
Message-ID: <sashiko-outbox-186306@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: fix power-off on
 Firefly-RK3399
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027084511.1992-4-yaozhonguwl@gmail.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
 <20261027084511.1992-4-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 08:51:49 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> poweroff on this board drops the rails and immediately brings them back
> up, so it reboots instead of staying off and U-Boot reports a power-on
> reset.
>=20
> Firefly's BSP drives GPIO1_D0 high while the system runs and low during
> shutdown, before writing the RK808's shutdown bit. Mainline does not
> describe GPIO1_D0 at all, so nothing drives it and the shutdown does not
> stick. Describe it in the PMIC node, with the settle time the vendor
> uses.
>=20
> The BSP releases GPIO1_B5 in the same sequence, and in testing the board
> came back up when that pin was still high as the shutdown bit was
> written. Mainline describes GPIO1_B5 as the backlight enable GPIO.
> pwm-backlight drives its enable GPIO low whenever it turns the backlight
> off, including from its shutdown callback in device_shutdown(), which
> runs before the PMIC's power-off prepare handler. When pwm-backlight is
> not bound, nothing claims the pin; on this board it is then an input
> reading low, which also lets the shutdown stick, although that is not
> guaranteed on every board. The pin is therefore left to the backlight.
>=20
> Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk339=
9 board")
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027084511.1992=
-1-yaozhonguwl@gmail.com?part=3D3

