Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236931;
	b=R6t8/pDqy3rRomsw3Ixfpl/nYX7w94h2GeN70rJ9sEfv3bjeI/giiam0gf4bplyYez66
	 +4aI1SV6riERpDR9bGMTWNxEn5nT89GAFQcz37IsW/56QKUlTFlpzUmI+IKjGAJj4B9GU
	 5ZrwAMQhDOH+qLQ7GfvoZyEogTw9oAsxTfP8TY39Z01BuS56kcRAJR3QykzkEeeW0XJVV
	 XoF50WR6iWQhvNRx+Fxq5hKnvyMinWFUc1RPJ0YzmUOCH/UdWNHCj+xFjfIDbFUKvDOCM
	 gqk5BPsdJy6jS5Fmvvyquh8FWBiZBtxG6Q56XVSoxqILjveoOa1EqCOv72WQhalVJ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236931;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m95xj8MGdMqozEVXQVC8T7kIEoOWg64wjdjrLs+mfAM=;
	b=aKYhu91O29g5FeBev3liZJg6rilGv56E7DFEGZ56XEFpFxOtVcrybLyY84wU98LXqzxS
	 8KT4Y0oF0NmGeTCgvMm5McCO6oanXu/XxcXJ5xIywqc1T60VrW8jJSmkXumU2mwRBgYJ6
	 kimozQ7+XpdIMImMPHxcV2TCu2NZaCPd2OR1RyZwH3KleD8t7Ly9GXVRXPaaxHHVG8P7S
	 p+HwNuNOd5LlF88FfO9GEXM9Jiuq8x1OZEQg66AEQDiclIkd5zBy10iwlMRDfjpjB059o
	 +4gvcJAxfOmLaV/ysjiRRpWYHb1QbdnXuKXrsNGL2Fqr0mDEVJE6b/gkVegqSjeVAEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQvVKMsr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889C606A333
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IQvVKMsr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA73A1F008A1;
	Mon,  9 Nov 2026 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236930;
	bh=m95xj8MGdMqozEVXQVC8T7kIEoOWg64wjdjrLs+mfAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IQvVKMsrFFY7CKzED39cdHp6c4rUo1Isy+PiatSbIQ4vX5u+GLYZKORbis5y4YQGl
	 mHyXJ9OBYahe8hCm99ZipIh3xUokrDf6YzduvxoLRfK5yjTjMubz2zoY8uoEH1LWpP
	 jJRhg07f+asgAxb4w0BHmHAsjjaOmrFkZJ+NDG4UhljEZ2ofsAOphwnyrjO8iHPAud
	 2s/3Q9Tn3VagMrEZRZkJbFI7Z8YcVIfthFCxRPqdQskdMMQAD/1q3GRyxHxYa7+DCX
	 i9fctEM2M50/h6vZtEiZpYqk74etPQ4AGHFJm75QGTQ6jU9HNv2p1xLB3gKTVXnxAv
	 jOwIneSYzNnpQ==
Message-ID: <sashiko-outbox-205147@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 3/7] power: supply: rk817-charger: simplify
 re-initializing coulomb counter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261109145833.1363319-4-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
 <20261109145833.1363319-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 15:08:49 +0000
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
- [Low] power: supply: rk817: unit and name typo in
  rk817_initialize_coulumb_counter()
--

commit b448d006b93a3f8946deba334ddfac864d0ff7c7
Author: Chris Morgan <macromorgan@hotmail.com>

power: supply: rk817-charger: simplify re-initializing coulomb counter

This commit factors out coulomb counter initialization into a helper
function and replaces the open-coded register writes with calls to it.

> diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/=
rk817_charger.c
> index 39c945622c4d9..8843871948b9c 100644
> --- a/drivers/power/supply/rk817_charger.c
> +++ b/drivers/power/supply/rk817_charger.c
> @@ -167,6 +167,20 @@ static int rk817_chg_cur_from_reg(u8 reg)
>  	}
>  }
> =20
> +static int rk817_initialize_coulumb_counter(struct rk817_charger *charge=
r,
> +					    u32 charge_ua)
> +{
> +	int tmp =3D CHARGE_TO_ADC(charge_ua, charger->res_div);
> +	u8 bulk_reg[4];
> +	int ret;
> +
> +	put_unaligned_be32(tmp, bulk_reg);
> +	ret =3D regmap_bulk_write(charger->rk808->regmap, RK817_GAS_GAUGE_Q_INI=
T_H3,
> +				bulk_reg, 4);
> +
> +	return ret;
> +}

[Severity: Low]
Should charge_ua in rk817_initialize_coulumb_counter() be named charge_mah?
CHARGE_TO_ADC() expects capacity in mAh and multiplies by 1000 internally,
and the callers pass charger->fcc_mah and boot_charge_mah; naming the
parameter charge_ua risks 1000x scaling and 32-bit signed integer overflow
if a caller passes microamp-hours.

The function name also spells coulomb as "coulumb", reintroducing the typo
fixed by commit "power: supply: rk817-charger: correct spelling of coulomb".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109145833.1363=
319-1-macroalpha82@gmail.com?part=3D3
