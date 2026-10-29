Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268666;
	b=w3FzZ6GEtAgczhSj49Xc/EaeI3101RrSHsff1bg8r0YWC9sOjw5IkClZ8EAB81i0hAtA
	 dekGsVwYc7mHTXfpkc5PoHiJl7B48VQ6XHKgFiSGpKAxC6/AGit22McaC9fv1ndKRjmxw
	 HPaxutLpGyafq7Rng3Q1tI43bUekJ1c5v9zQ1t71yEWG7KGCJ23btubFEfjKKjZBY8vGw
	 jdHLiZO3oyaboE615beQiZ7/CT4wZcY+dwwknnGE9u5FvvxkMSLM8Cn3i6VA2CZ/Vf5En
	 W6Ea8R5zWcFTrvvN/9/QOk9Z+rW77uokGCqfutvQN6n4FZP7HX0Hd6R2WAf9j8IDQ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268666;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vJDW1uZZ6V1XUTCm1DqMbtqc0609OPl+me2kIvxDucg=;
	b=J9m2x3/7hWFvkEMxWLqEBq3TMW/icHhNtquLfe5azqT+2MnENrx+WnnK2tdC6tMr0nWZ
	 lt4aQHpA9/bE/Axi41M7m09QAbvcBNwrZP+3UgG5l0MzgkUM8pKPWNrQQHddavl3LIUCW
	 P+WuCF2LUKGE4/sdr4WBQQ0UbZ6p3eqDuIHI2QvGPULStCfl5nWkikZVZkP9CwCGCzsv3
	 14QcPqXuZX0UwSHGut+YBH+A1K81kdqALuWQPtgCyiIbIhD/hNUWwGD6vo1LMLGWQu7gQ
	 lzC+Fyh1u2FzQ3bn+sN8blZdWxFFQhFPNtO6roo29QxQte1mlDuIJEjaGKuaF5jBCqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kx5CFGTJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD40606A321
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kx5CFGTJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40B81F01825;
	Thu, 29 Oct 2026 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793268665;
	bh=vJDW1uZZ6V1XUTCm1DqMbtqc0609OPl+me2kIvxDucg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kx5CFGTJnxK5Fd+kWZQQ3FZ4csagVpVRVpa567nS9UKlLXOrTPIc8YVT2CvvLKS/+
	 H2/H3fdljPUxahwp6C43OOGdJy29iRIKfwsOr/RRZCRV2FQj2FYZnS2BMnQMEeJVbq
	 9eH4zNIT7ds0ZahYFYyBhpK9p32buOlVPKM4ZUseMzu5JCB3wpuswENfLQvv30cS8Q
	 a0/mT3QsX8P+yUbs3bZNoQ5OaL3jNat3/8PNyiS6boNeTDEvSodTXzlbCCox8aaE6O
	 RnZLxqmsN+X4uaO3bhgzBbEMxsEAByJDrcbr3aCXCvKp5VbLwI5zLnapapL/gOgdD0
	 I9SPDT5Ayd3Bg==
Message-ID: <sashiko-outbox-189100@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: put the PMIC into sleep mode
 in suspend on RK3588 Tiger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakob Unterwurzacher" <jakobunt@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-4-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
 <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-4-cb12621c1fb4@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 10:11:05 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
>=20
> The RK806's PWRCTRL1 pin is connected to the SoC's pmic_sleep1 output,
> which the firmware (TF-A) asserts when the SoC enters suspend-to-ram.
> It is configured for no function, though, so the PMIC ignores it: all
> regulators stay on in suspend and the regulator-state-mem settings have
> no effect.
>=20
> Configure the pin for the sleep function instead, like other RK806
> boards do.
>=20
> Measured on RK3588 Tiger on Haikou, suspend-to-ram with the logic
> domain powered off by the firmware, module supply current (5 V):
>=20
>   PMIC pin with no function: 0.218 A (1.09 W)
>   PMIC pin with sleep function: 0.086 A (0.43 W)

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-dev-tiger-=
v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de?part=3D4

