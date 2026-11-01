Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548032;
	b=lq7xhX7tfapLrXerwWIfQlJJbG6F79R6bpxKV9QmKJxHYC2d8DNZ2OTAGRd85SLikHcJ
	 04Tb+AbgSnBrk2sihUO4dtIbVwLFg8zkl8YvClHNJuU3GVQfv3CWro2HaucAEHTkMCnvo
	 Wxv7KkD15pY/yE5b1QREUkukoSuQ1TtNoBAkrNEAp/e1KiZtTnWoDfx7UJp8szXlN5cDe
	 QNGG1laNKUU6EsZ0RI4kbIvsmDwmgSk2U1NZUB7pcxBvXGsS4OK2b64+9KYuYlg3XkT5r
	 rsCpcjMyUqXsGDD6JQDTsnJWIwktPAxD0NIpR5JyzV/RRwmxWrTBUwQF0wMUOTLQvJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548032;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rVBuYkP0eciHzsHiNqQT2eJGNltEOANf3iEZqrdiNlc=;
	b=Q2Gmgum7pXbtynLLU27gw+u2rE4/GH79RZ9GLsOl/UURgkNmI+fvwHwwFr9O1UDc5o4R
	 IrNEyjKBi8yaZi2m44EepN98fAPDa9PErLpZMSX4i3led7fR0jsM4A/Epx1An/mtJiZG5
	 X2y4g4f4sN0OWUNBrD5tQI4GHFZO0opspvcQvMPx0YPnCXbPylRcf3I5z3bBjLt5M7ycC
	 BRiXiqV9UcVcWA75pg2EAq+i9QWQqcmCs4F+DHlCxQrRKpvoF1yanedUfhfJWwuuCecd+
	 i3lybFFXJHK7jQONjIzFd0Jn/3SAN6qVvLNwezK57AGDSlvBkgY89MQUf+JASG+xiyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLkGzJQa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B2606A332
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YLkGzJQa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F279A1F00A17;
	Sun,  1 Nov 2026 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793548032;
	bh=rVBuYkP0eciHzsHiNqQT2eJGNltEOANf3iEZqrdiNlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YLkGzJQaW5RBIvnokwk1IkzUUShNNZhiixk6UrgiiYCpRkG5KqHJAZLTuDgsoFJDS
	 nw9ckrr9twWhkl/g1/Gh/rp5Gck7QDlLSNDQvYzHnjZ7xntSVr6T5EQ0m6ca4Zf4Xz
	 Q8x/WonYVPGP2oVphtE927WlvneKSyAYJD/5pSZ26wGzFEqD4wTG7WEjXN09IxlQ5i
	 i/3W09cKgR9cZWc5e5yTu4q2kfW+NXu0NgQRGqgJy9/2ppfbTL7BOBAlO0aPXTCXAP
	 /WFn/dFiF7Y+7sbD1URgeuikJPNmhJeR7Y8QQISENgH7Co4/4AeJ+BCI0Hub9c9YJP
	 YRflaRqHxgfNA==
Message-ID: <sashiko-outbox-192483@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: fix power-off on
 Firefly-RK3399
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261101154053.3874-4-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
 <20261101154053.3874-4-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 15:47:11 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101154053.3874=
-1-yaozhonguwl@gmail.com?part=3D3

