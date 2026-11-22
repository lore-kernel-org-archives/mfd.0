Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338393;
	b=HFvo2ocgTL6S3MHZNx4LezC6Qd09uQ7oVmSxIBy6SQc7m0CiJfivUfE0gqDLnCQ3kPvj
	 9NQlC5pBS5+E2Sf6bcO9rPLer0F1mYcxbLgfhVcB+jLOr77M2/6cWm/8uY40kQXSUy82m
	 lA/vU35qKIrWTFM9tSZGsO9O2YPZLZMXG/hZHQu5HkbyZNA+R6tPkCo3oWIByD9YUA1Jz
	 syv3qXF+eC4q1ANnCR73IemadDtC+YxuK50X4CQz2gUJ54mKyktY+eyqbWa0FmyAjl3BY
	 A+YxgsPNMoOLAlIgnuQuScdI8V+LIAhHtL/f+S3FvksUhrq/l7wHswGAoHUJ4/vyBMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338393;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D/A3WGUn+t1KW/RoIlfCsHDVxEF3fQHtFfP3qscHqtA=;
	b=0Vla72wmJRESJ+2M3u5/I3VX5lwZ3qZwMMSNcUJXD9IbltyZ26bRs6IAgkoXnt9Mz2zr
	 dK2TfCwZBgA7Mz0q+OyswNQ1KXuAYU2j30/PXKgSgVoIOaYOT5NOASmddWqw1Mmtpo3su
	 jQzhK+OhnBuC6Wl8iOAo6sn9pufOBvKLAiOtiZn376xNxYeLEbNa+pan0Nx4MqqsbszyA
	 ezeVUK4rF6niNDjuHRhlYu3/I8zFCaUdZP3uGm03CrGm206ZTQ64xb/mfuorK0HBWXOxL
	 7kC1TLxdq/SM3ZwmUnlU7hd/BIo9qcPTuQo9ALiQ2Y2ypXrMK6EuQahHOOk4XkUyoLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3UpbIrR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0625606A320
	for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3UpbIrR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C681F000C0;
	Sun, 22 Nov 2026 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795338392;
	bh=D/A3WGUn+t1KW/RoIlfCsHDVxEF3fQHtFfP3qscHqtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b3UpbIrR2fIOuZ8VoD1qw16RyymI7V6yVC7ZoNKAlCQmI9YgdLMMwwLdZEg2BRWdx
	 S2iom3rIlYn68pSSd3X8Ez0k78Ep5ttV8AcBsgvgvair3AV9aND1juYyjRk5CnJXTY
	 MZwFVqNIhfn6Yg76tFy/KbI2t3PE9OK30PVJAGrRerwYGQIv6rA6z89Th4EoZmgh/5
	 B5Sbk4B6o1kpscoBGBU3ZmrDkPBjBkI+I/NNTUhWVG5CgMlBZtB4GkyJApyNuUEEbv
	 vP9gdtBM5wE8leZnAoQ1m82b+BVtCWrsTjxBdGyXPBXNJDcPA8nr7HVCXrouwHj9OO
	 zpOIhtUMF+mNQ==
Message-ID: <sashiko-outbox-227840@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: syscon: Give each syscon its own lockdep class
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261122-syscon-lockdep-v2-1-868056a6a808@gmail.com>
References: <20261122-syscon-lockdep-v2-1-868056a6a808@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 09:06:31 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> All syscon regmaps share one lockdep class, as regmap_init_mmio() uses a
> static key per call site. Lockdep then mixes up unrelated syscons: on
> RK3588 the clock-gated VO1 GRF calls clk_enable() under its regmap lock,
> while the CRU's GRF gates take the SYS GRF regmap lock under enable_lock.
> This is reported as a circular dependency and disables lockdep.
>=20
> Lock each syscon regmap with its own spinlock and lockdep class.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-syscon-loc=
kdep-v2-1-868056a6a808@gmail.com?part=3D1
