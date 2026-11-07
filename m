Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039955;
	b=VZ+Z2cCAGw5eSbI7+14xHmncT5XXxs7zIVLmklGMjSGkrIl3rloZHDhpAmIwZ5SEQtwy
	 qiCaNy6IIVp2LaVUx3lvylqqxJvkl/5/SoUwC7UJLkglreHWE2e+wbd7b+e3QnjXvxlDS
	 txtB8Ik3OJo4kczV/WHapLemOVFMJyf0lW8U3JMrqT0TyG7LEnnnW8hy80VeHSiPT8x3g
	 GD8FNpiB693w+RuRx6vHWzaAdEq/EyWNsIo3H6zfu3WV2xmdnffHBjR9A1hdTCd5AJK3I
	 TU78gSn9qoTDYVOIpWKqaHEhoUimrH2z8+YHRa1DVtTCEx6+lvVNYzTKyXXXhK7byIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039955;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ksPR296KIbMxYoehA8dAGGNO8Mkrwzm8tF+2qV/tnp4=;
	b=FnSmqPyuajw7G2vvGIqeX4XAjIhaE0x2pLNsn6cSVptupHTbe/Dcsr0650TfHU+07HV+
	 3tygRm4DpPh3cWCd7zCmMNHRLCYy7pbpVWMioGYKWSQFGH4BkrnCtMxmVFbzQxLf2dpf4
	 y0YBMuvYQ28Rx7FGJFds8JPMg9BJTSXJZx8Go1iUR5+wfMaVFZpdoBLqSz0C3QqyAohdT
	 S4EOX6AAfeywhtxeYIVNHcowW7DJ4J7dVi2em6I4of5/Zfy5+3a6a54kZd9e4RqMJDeJa
	 6fx8I33VvZcOZZk+TTBtsdnbWx5R/KwZwJJDI1LN3nu6pAP9mGwR0fCO7ZBkno/LU5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0VqSHCl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8A4606A326
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 08:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0VqSHCl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945D81F0089F;
	Sat,  7 Nov 2026 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794039954;
	bh=ksPR296KIbMxYoehA8dAGGNO8Mkrwzm8tF+2qV/tnp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o0VqSHClmK4Y2GrA6ZioQQZ1YWrir90+WgYFPzPmW9ab7zwt48lhijGUr0awsC9U9
	 o0zizz9CjeIpjQPpUInNUwyq5n2F2z5Wv17tBlkhPlHbtv02iWstPC0ylJ/TPEyg1f
	 73BJhtLfH86TUEOIhwuDN3b/xAm1HCEYR/HiLKlu66qvbcplhpgIgfXE/QprX8nxuh
	 r0BwKlNL1YKx2ADa+6Zrnu/Pi2ONx8UCBF7HjdikVTlAcvq/JLkYZ0ozyEPAMazfUx
	 iZuzXcZ4B/6hk+q51DmdF+qonDLU8zq3UyTpEDgftLIuRPz4p0FNL0rOLnq+5zNBtB
	 Qs+CB+rB8Ujiw==
Message-ID: <sashiko-outbox-202741@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 4/5] mfd: da9052: Disable IRQ wake on device
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261107162123768WcPgulYo-5-EuCbXTrwwH@zte.com.cn>
References: <202611071621143491uRwluLhxYsUHx2V3qhm_@zte.com.cn>
 <20261107162123768WcPgulYo-5-EuCbXTrwwH@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 08:25:54 +0000
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
> da9052_irq_init() calls enable_irq_wake() on the chip IRQ but neither the
> error path (when requesting the ADC_EOM IRQ fails) nor da9052_irq_exit()
> (the removal path reached from da9052_i2c_remove()/da9052_spi_remove())
> ever calls disable_irq_wake().  The wakeup configuration is therefore left
> behind when the device is unbound; the IRQ line keeps being treated as a
> wakeup source and, should the descriptor be reused by another device late=
r,
> the stale wake setting persists.
>=20
> Track whether the wake source was successfully enabled and disable it
> symmetrically on both the probe failure path and in da9052_irq_exit().
>=20
> Fixes: ed05be56643e ("mfd: da9052: Register ability of device to cause a =
wake-up interrupt")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/202611071621143491u=
RwluLhxYsUHx2V3qhm_@zte.com.cn?part=3D4

