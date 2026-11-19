Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096502;
	b=uJft5cjjvijHKQsel57TIMzsZ0sV0DcM71eHzjgcoKx/+1V3D6LHk/Fk9G6LUV4A9i47
	 YKqcMg3+PzeQflbWMyMZM/rnvyYl7JQ5j2mdULjsncmauF0Tpx5IGOgOUyYoctpQh/NOF
	 gE7XFRPWdPPZPyfeBgidEpfB/HY83pl/M3Ve/0Sv39X0YgeTnE01wCeZWn5GctkF5VpwD
	 O3kl1n3MNv8G1JWdBJ70dYak7zMw9/N4APX8HEQ69k3oXp8sbZs+5jn5RE5aKmJ+/uwBZ
	 9HW5ivQLy3CNMRBocJm9ofVlmeilo3ubM2Md0jgB6YyKvQ6fMvFLoTewyyUq0BsrccA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096502;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eUbGqZiuQ9ZNYFF6X2jr8p+6Xempy+kcyrETGtzmAzQ=;
	b=BGxeNN4yUHr0tMpGN5YPJ4+5xtBdEi6ilv7kE6p6WJJuBxQt/HaDNjwyByKCo9nI9VCP
	 I2sWmZ+2hXRWgpmbC1HS0oTxLWsn1LBVYsOFkIFWnQh3FfmoBGhy866uEILI327vVgcbB
	 zn98z82ZixB+KN+sFAfKshRXrOZOGmcxUYk2ju05mT384Yu4uQzpl81Nfm2UXIzzq1/bO
	 sP6p1rE72h3kTYY6G2UMWMmO5MMaaErSchUyOE/uG/5iDStGuMvguB55QBZ9K1I7u+bB3
	 kyFvfr3q38DRqwmCIqq6unlOA9l08vrGoR5i2mFtyQh7BowuoMzVeA+27yCrggh50Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AM92X9G3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263B6606A324
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AM92X9G3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A174E1F000C5;
	Thu, 19 Nov 2026 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096501;
	bh=eUbGqZiuQ9ZNYFF6X2jr8p+6Xempy+kcyrETGtzmAzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AM92X9G3HpGj/mGv1ryiJFPcZsT5VrIORhXXfhE80CMiLHFkF5JtXodoGig3lXvN2
	 VhDciWuedjtb4IawBGoK0T6PjsHWDY5PmTd3Yf4BCfQxNaV26ffXihsrptrwAkUvAI
	 O3AvPpvlwcCjCjHH8ebVtjxfZ4T/JBzLrsjPFNfbjm0dQ7x1H03MGxc1qI1ZoJeUEJ
	 lRVNuUvqrYc0F1YJK2xNiimO54aSgrpjou57lU0h8Yr8nrTzbwokIjlarAengNO0Op
	 CUM4dHmmhM7SVz1B+Ae9PieKmSArBIObVE8Pq6L4foRjXWxViXDOY/AqaJJhxetSue
	 0+hB2wrFeEV6Q==
Message-ID: <sashiko-outbox-223220@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] mfd: mxs-lradc: Pass parent IRQs to child
 drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261119134041.16611-3-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
 <20261119134041.16611-3-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:55:01 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The MFD driver stores raw DT interrupt indices in IRQ resources but
> registers its child devices without an IRQ domain or IRQ base. The child
> drivers consequently receive the indices as if they were mapped Linux
> IRQ numbers. IRQ index 0 triggers the platform_get_irq_byname() warning:
>=20
>   0 is an invalid IRQ number
>=20
> The children then try to recover the indices from their resources and
> map them against the parent OF node. Besides duplicating IRQ names in
> the parent and children, this relies on invalid platform IRQ resources
> and fails when IRQ 0 is rejected.
>=20
> Resolve the interrupts with platform_get_irq() in the MFD parent and
> store the mapped IRQs in the shared LRADC data. Drop the child IRQ
> resources and duplicated name arrays, and have both child drivers
> request the mapped IRQs directly. Map the MMIO region once in the
> parent and share the mapping with both child drivers through
> struct mxs_lradc, removing the child memory resources.
>=20
> Tested on an i.MX28 EVK. The mxs-lradc-ts driver probes successfully,
> touch events are reported, and the touch-detect and LRADC channel 7
> interrupt counters increase as expected.
>=20
> Cc: stable@vger.kernel.org
> Suggested-by: Lee Jones <lee@kernel.org>
> Closes: https://lore.kernel.org/linux-input/CAOMZO5CgTzo6GuXptD4mFTN=3DUs=
JJqpkixDW1Q64gqZGrij8+uQ@mail.gmail.com/
> Fixes: a85a6c86c25b ("driver core: platform: Clarify that IRQ 0 is invali=
d")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119134041.1661=
1-1-festevam@gmail.com?part=3D3

