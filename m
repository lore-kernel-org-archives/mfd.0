Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763427;
	b=S1C7hRG7ZOc2lFYZF4XT7U+qejBWZQw6sVjd5/urwxR3TWy+R83tzlnSh8RC8Szaxs1a
	 kE8NKcNwxt86SjJtrHmRqAq7b7gLmNHm+NioFP858VX/+sUvJzqN0LGxdqsfu1Q5+BozR
	 wRsr2p1Ekfa5Zog0c36qI2qTNnfwkqSt8d6n5ThY7qzSJaBMxw4RpstSOsySEcn5xUHVV
	 0n2mvLZ3R51mnIoj9YTnFE2/CiEPnDSgtV/6n1QWOhYSmJZe4N3ySjpHVo7a/10nYOE7H
	 JF6KVMVvWh7FIrjx6FoNXEWedWKwnxVMnfcAOOmS/89YYYn3f2O6trc6AOg6842hxRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763427;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Op5lVDnxE/GuW53XheStgBAYuBkTenK9Ur3F4Z73bmI=;
	b=W/do9LMpDJ0HNY55OiInXmbNUMhw85491LGrXxFzPg22Kmylke2UkII0vS6oeoUvv3UW
	 3zCJMH0bd6GgkGGHFUr+KAe8WgSJQAj2fTm2PUK05SXNipFW/hYLFtn++i7DyBVXxW31X
	 efbjd8wtET2b2LAg1GvSHwfoZHZJ0+18VGmSAIXQvUv9hQovXEfs3gmTXmdA/53YpkC8j
	 L0cbBFfc9Sp+fYY7ZrHnZZ5E6dBzuBsRn7P3dMDu/rVNMItG7UZjTEIVhZ4d5cfeGdZFw
	 8KfJTT4O2sv+Ko5GMNYDbg5W2XMt1N7+N2V4eBmYjq2vO1XqiJe6vHFJw+IYhvli1RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zs+gb7bd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32381606A31D
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zs+gb7bd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23181F000C4;
	Sun, 15 Nov 2026 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794763426;
	bh=Op5lVDnxE/GuW53XheStgBAYuBkTenK9Ur3F4Z73bmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zs+gb7bdAyjbg/sey11r6h/o7k+BbcawW+uwMrOiLbwDRt74vtrtHdhbn7o0amYXB
	 TnGKXH6wO6sN9RlEgyEIP860NGT6trv9ps5pAQW0EbhNpCuT7xi6FDFK3Xi93UDJhH
	 2umASUubnfxnFNbO1jl94E7zdIphlRpEKgF6vTLkDe7rarly9FmvJv0pig8d3BPTOg
	 NzqochEbDxut9dmtbvU2+GHLr98oplpwJEyTjtqM/KdQTYrENwPRJUtAXL+bXm2V7d
	 6OdkMF6mERCajrP+V2E2nrrJfPWvAMOAAWO4RjN/IyzzpiYLDZXG5DYaGDhbO76vKE
	 Ch2tthHNOooGw==
Message-ID: <sashiko-outbox-215678@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] mfd: axp20x: Add support for the AXP2101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115171150.64431-3-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
 <20261115171150.64431-3-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 17:23:46 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mfd: axp20x-i2c: use named initializer for new axp20x_i2c_id
  entry
--

commit a67c444ea588894310a61095d7e8d9b9e17db97f
Author: Olivier Louvignes <olivier@mgcrea.io>

mfd: axp20x: Add support for the AXP2101

This commit adds AXP2101 PMIC support to the axp20x core and I2C drivers,
including its register map, interrupts, MFD cells, and power-off handling.

> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> index 5c93136f977e7..c1f7bb8e3a14e 100644
> --- a/drivers/mfd/axp20x-i2c.c
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -69,6 +69,7 @@ static const struct of_device_id axp20x_i2c_of_match[] =
=3D {
>  	{ .compatible =3D "x-powers,axp717", .data =3D (void *)AXP717_ID },
>  	{ .compatible =3D "x-powers,axp803", .data =3D (void *)AXP803_ID },
>  	{ .compatible =3D "x-powers,axp806", .data =3D (void *)AXP806_ID },
> +	{ .compatible =3D "x-powers,axp2101", .data =3D (void *)AXP2101_ID },
>  	{ .compatible =3D "x-powers,axp15060", .data =3D (void *)AXP15060_ID },
>  	{ },
>  };
> @@ -86,6 +87,7 @@ static const struct i2c_device_id axp20x_i2c_id[] =3D {
>  	{ "axp717" },
>  	{ "axp803" },
>  	{ "axp806" },
> +	{ "axp2101" },

[Severity: Low]
This isn't a bug, but I2C subsystem conventions prefer named initializers
({ .name =3D "axp2101" }) for new struct i2c_device_id entries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115171150.6443=
1-1-olivier@mgcrea.io?part=3D2
