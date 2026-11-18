Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991427;
	b=GNqaqYKyj2Dy3C8TuDf5cfqXnyXSEhJv5yS6VcvSjhnZFhwEmlYK7as6Zr202r7h9r9t
	 l9aLmCA/UddwG9UrMsTvgD/e+mNPGRrLBqIzoEqMTbij6UxzBOm0zfAw+CdRnzprr7t0D
	 DLZYjOSmsCMmcKhjXW3wIvo48wVzJ3GgK47kNguOWsfn1Xahs8syWJ11DfW8TKCS/OmYR
	 4zUw8RHX89NM0VF3RpwejixG/Ry2MzEaAM757XajH5jAwA06e1sSNMWslYnuazTfMZz74
	 /HStNOWaC91cPDszOiGkKFiqxGLXDQKstm0KgjcenxeLuI9dsMVneX8ADijwUsJICkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991427;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lNaWqwFD9uPs1xMyZiu/xVh0f/fFpFMkOHbUXGBVvkM=;
	b=Y7naG4GbCh2T/TR72ZZcxu4GqEDZ09pgM6HH+Qhb4NT0xErYR7965tGfm5chjfX+ZHiJ
	 LkEmJ6yu4yxTMwnym44mthdsXgTG44kziQwOhqgIct+hES91BHBTsEPCYRs2CiuViiza4
	 p1TFscpo9D1JTfUjJoUUOjiS3a+HSnK9UU/dwRlMVMVOs0pzBISa3FQnPI59J6bzo8lS8
	 bQWrZhx6D+1gInKlTdG0Un5XscW9OtXRZTG9EcVgXP9zsN1MfekuhRG5vmKkY1Ht89hXO
	 DaNPBbZ6DItSyvetgLm19J2NZZDCrOA/tZscrSIc1C5KkOFP5XJBcs68lo2d08Lb9mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2Itn0b7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AB0606A333
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2Itn0b7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D981F000C6;
	Wed, 18 Nov 2026 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991427;
	bh=lNaWqwFD9uPs1xMyZiu/xVh0f/fFpFMkOHbUXGBVvkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b2Itn0b7/GTSanxN8EFwVun3dxIoeOCtM0jB2ELWz5zsi3gDhp598MGv/saoyiklY
	 SRdIjb/GzFFAfAkZGdYiA/AcdrXZ76x0GAFd6ru7ipxR+9ptr99qufV5609b1lKusA
	 3iHaJL6IjQuuSbesdEbsAcq0+/7UBTemx+Ol66pBTJ6pG01lYj5zF8zX4bhSQZrcAh
	 vKSHooVIZ/RchiF4iURUI3icsiZgCCQVKnxcWnv1eTIyJ0WePQ2KZoY/Qmc5N7HkFT
	 1T6bsHt+Y9Lmmj6HqxCH8PZAeUpx1O+IRbJ6TvkbRvdM0NnoAXzthm09KaUcAmSqxM
	 lrWRIbLUxLPrA==
Message-ID: <sashiko-outbox-220482@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 13/13] mfd: nct6694: Add Host Interface (HIF) eSPI
 transport driver
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-14-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-14-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:43:46 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Add support for the Host Interface (HIF) transport over eSPI for the
> Nuvoton NCT6694.
>=20
> The driver locates the Super-I/O to configure the shared memory base
> address and SIRQ, and implements a regmap_bus that exchanges firmware
> commands through the shared memory window. Report accesses are served
> from a separate MMIO regmap.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D13

