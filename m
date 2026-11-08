Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170945;
	b=Ve67RDW2h8FwYsyuJWkCph34KFzt4CAD+687TVrJnp0tg7P+7oMDNrDz4JNw4IPLOzKe
	 JhcFd3FtxLqmIKPMglbP0dkRrdJirHtE5ZjwZegVz+hDlTjPVV3vTqrpWtcoqGJwBWBc4
	 PfKTwpcQlqp/ECPCZYp3X3mz16riSBGYF6PYWQ6Zwu72oaNhfylric/PYaGsexKpnwDJp
	 Yovb7xIU99VzpZLzGtxsS3M81xueGITya3/ySZD7o017oqJkaUrjs45RZ99PD5WxK+SaA
	 c1Y/OhgizjPBqL/Q6u0JLkHnsX0XaFJ6/zTvc8SWgDRGebXfgGw963vhqUdJStCO/zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170945;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iR1Prsvqxl/08TvNR6iDw11gI4VBcoEoIa9MI55ARPU=;
	b=dTZVGcyJflP+4vRnRMwoB/oR0HJ2NHsWLkUTCi02/fVdF6rT+L5Iw2l/7bELXuQZhwB8
	 kbs/rZQ0HhR6o1XtuOU5P36hPFvH4XzAok/npJ73j3gSAeQ9cCX6XEJPXbkkj4FQcF++P
	 dSvxYvQllyokrrI4LALSC6ZT6eE/uTTFwLmYTtUnwXRCqzGJOYgGWVEq+Wa1hCowfbxyN
	 92AIeLv1gA0tk5iONg5pR/d557A9fuav4NDPYYKdZKDd47735zsKt23TocAq8gfQHWz0P
	 f81cWrOP0jhr/fUlrQSPa6BQNwAF0K34LRj/pHAsM3UCgvzgr5nIJa8DgPOpw/FalGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZWhVIupx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A051606A31C
	for <mfd@lists.linux.dev>; Sun,  8 Nov 2026 20:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZWhVIupx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E393E1F008A1;
	Sun,  8 Nov 2026 20:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794170945;
	bh=iR1Prsvqxl/08TvNR6iDw11gI4VBcoEoIa9MI55ARPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZWhVIupxorMvgih3mQxMMZ4GfTL7K2Nm7c/bsK2yUmajhIlid5MkytSQFiudUZRL/
	 9OLPTZUlXprFwFaCJG7qFJh1wgTZliSnD7YhFBas/YZus+rBI4u3h3Or+RhAo4ZZEo
	 c8GHBePzvgoGopnvPQUdoCH16XrHsZGq7pO/y7D2vf4kKAPTqo5Wi3BDkKRoq/WZaE
	 xxm6HH6TcD+F4+00xYbDs/0Gtbi0Uy+sIX1EDfUnnY29B4wuGhC552c83kpE73vlO5
	 L1gMLscv5xdcP9zOB6ppcgHmrzM/WrEbcgRWgLP8PQAMY0uc5hv7cWglheZjJ9H7kR
	 Wha9TmUWGgXbg==
Message-ID: <sashiko-outbox-204024@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14] mfd: zx297520v3: Add a clock and reset MFD driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261108-zx29clk-v14-1-48694e5a9d10@gmail.com>
References: <20261108-zx29clk-v14-1-48694e5a9d10@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 20:49:04 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clock child will be driven by the already committed
> clk/zte/clk-zx297520v3 driver and the reset part by a separate reset
> driver.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-zx29clk-v1=
4-1-48694e5a9d10@gmail.com?part=3D1

