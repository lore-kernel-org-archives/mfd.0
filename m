Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627153;
	b=FoiWTOjM0F7XfgkPbnOE9ylxVXEo3Lx7O95E2CR3mfkvlgHp57j8IjdA2OepRfr1JWrg
	 0yEq7fBa2iMV0BeWF+kmknxv/N6txLZQnrtwsWTi9AeYxfvRPoo8yBdtVyWttbWGxOALe
	 gFwekIRc50r17HPcW2pWW3Of+8t3GWxWqOddLNSgSGwJbHTz/FlzzPrNGruihMHkC3ygF
	 82tHt/1oMgUQOuSpjK+kAdVDlDPdcG3Vir3ipgsNSxZxhiE/vm1jF7KcTEe+VHVO3n8I7
	 hXHvZU5vO5fGw3d1qQaFeYmkhrK2pLAmk6v7cNHGSdSEZ2yEaITG5oICTJEKRm5JRBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mPTpWY8XijqNt5C4fP2MtfVfv5BZegXMKuSmYs5OfcY=;
	b=v+vT7sGJujgbvf799PBTJoVHfHkUNJwrsu83CTPsnrwvCbvIewpbSNlj31ZpqhRBTjz2
	 iBX9KYaHzCWwTS5/EVvEqlNy6vWZwE2W1hS89g9UY1ELmBJ3RcgddhwhupgJfhkGSdoKm
	 nNs3+4vFXHLVFazw6zcfLpd3wa7aixzjuEiZ66K1yE6zNLQp9r3GbmKfqcwTCME2ij9x/
	 ZwzZg73T/+UzkTD7FVqtvK4aAimSrKGPMR4PnWrtBDq5zv4GvJTYBgXL/brxUUazEXB8P
	 rTu79oxLB+70K/tDqowe9Nwvrnx5/ZfQkBfpeskf5WDrD2rgO8KrXuB61sEdNkYrCoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huCJdsrj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EFA606A8A0
	for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 03:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huCJdsrj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37641F000C5;
	Sat, 14 Nov 2026 03:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794627153;
	bh=mPTpWY8XijqNt5C4fP2MtfVfv5BZegXMKuSmYs5OfcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huCJdsrjxE3iME/O78CnBm+3PN6e0emkmANuBuNNtN14h80gmip5JxzuothdM76in
	 Mqvr2vn9rItTc3QtclfPw8ee6dPLKEo6tBrk+RjgIS8oTHfWcgbiDuCLUhF1WGt3i0
	 zvYE8NqaLhh9BEgT0wqWOw3QBfGw7MpCk4tRRjrBT1/0mcfbdRGGW6csHxPSCjRvds
	 sxqDzQlgetBdd07Yc8PJLeDOBa94Fc5G3zUb7tex9BmDd4/lj575veVSZN0y5z3rjt
	 oYnGhofDf2AoNGSnx6C8d0u47C/QaqND4Lhmr3lDeSq1e2qiTFn3TQ++CC7nT/Wogj
	 yHSMKdiytQ3Cw==
Message-ID: <sashiko-outbox-214117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] mfd: tps65219: Keep running past the warm threshold
 when asked
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chrispine Tinega" <dev@chrispinetinega.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261114032457.3434248-4-dev@chrispinetinega.com>
References: <20261114032457.3434248-1-dev@chrispinetinega.com>
 <20261114032457.3434248-4-dev@chrispinetinega.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 03:32:32 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> When the devicetree sets ti,no-warm-shutdown on a TPS65219, set the
> four SENSOR_x_WARM_MASK bits in MASK_CONFIG at probe. The PMIC then
> reports a warm die instead of powering the board down, and powers off
> only at its hot threshold.
>=20
> The masks are loaded from the PMIC's NVM at every power-up, so they are
> set on every probe.
>=20
> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114032457.3434=
248-1-dev@chrispinetinega.com?part=3D3

