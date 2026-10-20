Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505615;
	b=YDRP2bRAZ900N4r/UrC4jnRxGgONC0zQxVmVk+G9jVOJqf+mY4T3LGkDC38rF/A4Cfn5
	 C3EygqSWy1527TLWA8icGnihyDH8Cx/9FxZnVn6WQWyXtxDlLlPaQ+FIX43Pq79lon+QQ
	 X65AwwsKEHid68eHbZVfgZy8DM05htqv9N4Ij2dYNHqjRNi3RXkvdSbzo9XwTyq/+5C4I
	 84xxod5AC6C/sn+eoTYOj+CBaAWTytkM9+nWtzvOJ7tuP6s9/VXrFitGFwSMZ6j6Kkl6i
	 niImAc1Ly4O+M1WWWljksFmZC3UYdIrwu/g7dQ7KnTvSUc82FWFoxGV+pPKbKTv+BQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505615;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PLntiroZh/y2z+O9lN+qFHnpFGx/LR03rRB9gMth4nA=;
	b=ItiaS61K9kmzq25C0xYgw8+bW5c9G6HX44IbNK66GdYBZVvQ0qsAYo/Owex01Y7s6pDs
	 bmG4WCNbHjBRFBhmkYdBa1l9pRSLV9DpojUzz6TanRQeednvrIWJBH7wvKRaK2PDhGK9H
	 aRmcMq9ruhAx8MiEWUajtW4eqI2YN3PxL+rN3HAxcb95QzvfqzbzfzJy8I6H0KmwWs7Nr
	 kCmMmjn/uABP5XhhSp8+06OclqVfengrryhAau8iFVVrjaegiwFK6T7mPV30ZDmb3RTfG
	 9MEWBJHbhJZ8NkmqkeQ4aQDXisIAAK0lt6imqWw5tSMCVRpMn2Q+MkSjDlNdatTgSSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBsJL8qT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E16606C22A
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBsJL8qT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAAD1F000C4;
	Tue, 20 Oct 2026 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792505615;
	bh=PLntiroZh/y2z+O9lN+qFHnpFGx/LR03rRB9gMth4nA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FBsJL8qT0mx5c+Ryz25RWw/DBJdq/Kz4sAmYT4X5SJFBVLiAzdr0w6rFneNuIW5Ym
	 dUADk8tWO/1hrUzAMzCNsB93UtvBS1cgPEEzt4SQ7ZEp3PBalpV8Vp0muPkeNutXkt
	 tZXZqNoJVTtaXjf4RTWj/z0I945rbk9PwoKpdVL68tZSTjU91jNQDmkFs/RJBHpMHz
	 8OOidO028pnv9rHwEdXOpjz7cu6wgAgM7yI/57tM5bw3aemwqpqotnespdFu+AEw+B
	 hmQvyFEzTo1udzfdqRHjEbX6FFQIAiUMlRv+IDig5NHgWmmL+l4VY2dZr2U4WTmz9s
	 wnFSPcc428OOA==
Message-ID: <sashiko-outbox-179097@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: fix power-off on
 Firefly-RK3399
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261020140127.720-4-yaozhonguwl@gmail.com>
References: <20261020140127.720-1-yaozhonguwl@gmail.com>
 <20261020140127.720-4-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:13:34 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020140127.720-=
1-yaozhonguwl@gmail.com?part=3D3

