Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627229;
	b=VZKh7fpbR/3CN848pyQl7hseF95EQYVLH3vtvMEtJGTC9EyT5T9MtfzVoLe+iTMiGlTp
	 MPwTGayBztxegsoldZxk30eRxP74PHXsdghAqe0NnNjJv9HyvchZfL0zKRVqoS7MW12fs
	 dMP5tW75tGepGhtstO5d6dPN4aTbaSPVXSmP9AocQZ0kiDK+czCI+Qyn71x9dxrn5l33M
	 YTo035QSzv/QhLgYS5X64LfVtrckctnqGHyfCgLivbKrycGoIjpFMOxF+KVgdSflCORUx
	 FUa5akvCm8qR20RrsrcHItOElpAGqBa8Mo632FrRruXt2BLfWZnk6NacVfOiChfkl7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627229;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oboaAjczc6iJXYJtv6ggDn5QNO2FwN4i/B4G0wTGqRg=;
	b=ALAMLRhXjx4kuYzt9uVN1Rvs+nWeR5bMaH8jmWQSR9542A5oF5EbSHYRMSaAvSpH1C9z
	 G9wchQho+5GX5Ya2FAS+dJXytxQnXuOmtFOI83W6DthA+hHqFjDu2vQqPRWMsDSS0UWSf
	 nyvgt/UksB6oh/TF8/9ErGtJryqfm37somaabspZUVMw7KrLnKl/hFTgMu2WX9Fz7GZaL
	 mWo7GIfMwtGwdqlWJwtuVidkZOkS6Kb7EN6QKH1rT9daRNhFVJGZlTdy2i/TWasiMGlqm
	 iU4weGWHa9Eso4oOEUSrz2ZWsed5N9CN8nI3SQ/6QJifIYyEnqhMMGXtlsTsqp2WUPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SJVrQY1F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D0606A32D
	for <mfd@lists.linux.dev>; Sat, 14 Nov 2026 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SJVrQY1F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DA51F000C4;
	Sat, 14 Nov 2026 03:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794627229;
	bh=oboaAjczc6iJXYJtv6ggDn5QNO2FwN4i/B4G0wTGqRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SJVrQY1FZ4fye8z4e7KcUQlYXGG4Vb96MmrRJIpMT53XpnCcBCkl5O8fnxb+dQwoI
	 4L2JZgr1TFzajaNBXQkLe2aI7JcoKoe81pgIKYztNlGOvKlJCFHVh1mLRBuIjJXqZz
	 VWOWvuCvK1Y1bcu9s+OQTjQXOrtC4WR68WeJcCfFwAVbQD10qL+y0salOh32v4/Ojg
	 ZOEwU6d7qWABGGqAtOUScb7X1BwD4zTwQqkBBqCC6j2KEAFTBET7fnnYZzpL1Sr1Qx
	 INisIG2tolqEF1jjqFcr/63t2WR+ZeiLCDNEJxLMfFEGcmlNsn/UUTRvh7dtFrL/EH
	 iAjTIRywbGjvw==
Message-ID: <sashiko-outbox-214119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] regulator: dt-bindings: ti,tps65219: Add
 ti,no-warm-shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chrispine Tinega" <dev@chrispinetinega.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261114032457.3434248-3-dev@chrispinetinega.com>
References: <20261114032457.3434248-1-dev@chrispinetinega.com>
 <20261114032457.3434248-3-dev@chrispinetinega.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 03:33:48 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The TPS65219 has four die temperature sensors, each with a warm and a
> hot threshold. A sensor whose warm warning is not masked makes the PMIC
> sequence all its outputs down at the warm threshold, 110 to 130 C.
> Masked, the warning is only reported, and the PMIC powers off at the hot
> threshold, 130 to 150 C. Whether a board can run past the warm threshold
> depends on its thermal design, so the board's devicetree has to say so.
>=20
> Add ti,no-warm-shutdown for that. It is allowed on the TPS65219 only:
> the masks are not described here for the TPS65214 and TPS65215.
>=20
> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114032457.3434=
248-1-dev@chrispinetinega.com?part=3D2

