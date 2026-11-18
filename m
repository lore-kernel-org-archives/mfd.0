Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991025;
	b=lH2ji/YFpsgEqBMbvGorUkuIlVUWtmCK3puFatTPtgSS+qGtgNn0+DiBDZUkUfBulVkd
	 nTY2hYPJVYDvwTHZMrBfYVe2hRkUrA+G78rKSP1VnEIgwaW7GCePzHiPEuKvP8r0IqXh+
	 WeLZkWY98xtmDd21FYLhRwzJpQUlrPm5R0AGu9Z175Xi27FmF/ky7rJzoxqut2SJgqrBW
	 iMjaLxcZ3ZziRBd/2B44isFqrX8gX+cimP0MBosGQZ9xoXfb+WD/vy40W2mjVCGIK+Vy+
	 H5jzVG8kJ3cncNqkBHB/HsK5JT0kYR5+gMNDk2gUMQ5bBMclErJK+RP4lTiPAWCUwag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991025;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yGBW4JDzY9iPRvCv4+WGPxoesJwYebVWYcxtAuMBI/8=;
	b=fJZ+O0R0/NM6rhH72wh7XC3Wiv7ROD3ZEoDKRLTw21dfzIiQjL4hL55933t8dv2DE1sN
	 WGpInX1h+Kn3CLJyoljJJdovfWiV0uY4JcOCqyXQHDGqAJT8KIIcsNvNf9CPd2tMwp+Pc
	 oQCXj7qqXvzT6+JLVfc9Z9ZoIYxo7IZrppx9yg0So78pngAs9S9EI+Wd6wAiijq3F9G8h
	 17QITPCdIiaTJZ76n2cxbpbKe6AFhYEMlXuVEnbp46yYZUCDy+yk96MZzybm3Gle71Ya+
	 N1VysQYU3OB/TzwyzpK2E7PnoJBM8wyieD0FqHtzBl0X6mpj0Qu18OJYRyNcjVM92Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAw+CAU8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E7A606A31C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAw+CAU8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2C41F000C4;
	Wed, 18 Nov 2026 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794991025;
	bh=yGBW4JDzY9iPRvCv4+WGPxoesJwYebVWYcxtAuMBI/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MAw+CAU8+nAo8xoixdyu7u3F1J2C7dbxLOEV+VHcT2c5qfg2sB1B8v/DJ1q9lYjcD
	 7GkW15d7PuXSDEgyzUhQ3DOxwjnyWMXDIbm38unANc3TyoQiczhLXP+zGbr8IN4RiR
	 dAceFPjuERU2qEUXaLjbsLhUo5LRHrBHj762IoMKIZGeoEUb8CZab64B471F36iVpF
	 G/ObVbekdZsxGWKaKHQnqgFpFoF/u6HdBhAFXWwQVyXoT1qiWYwJWawXSaT3ljLF+h
	 QdWGMh8edylyvQp9wRehXqU4v26LAtXLPWiP3V3TyskqgEK4agdYZqlMqxttZ/TUoQ
	 7/Y5E194mKmpA==
Message-ID: <sashiko-outbox-220462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 11/13] mfd: nct6694: Introduce regmap-based
 transport abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-12-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-12-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:37:04 +0000
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
> Sub-device drivers call into the USB transport directly, so a second
> transport cannot be added without touching all of them.
>=20
> Wrap the transport behind a regmap bus. The command header is mapped
> onto a single 32-bit register by packing the host control byte, the
> module id and the 16-bit offset, so that the sub-device drivers can use
> the regmap bulk accessors. The access_lock is dropped as regmap already
> serialises the bus accesses. Transfers larger than the transport buffer
> are rejected, as the length field of the command header is 16 bits wide.
>=20
> Add nct6694_write_read_msg() for the commands that send a request and
> read the reply back in the same firmware message, and use it for the
> I2C deliver command.
>=20
> Acked-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D11

