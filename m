Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613093;
	b=vZXn4ORpanwl00ELZQ6e8MQZBIhsbF44M2X/1SLBtzjQsgill2hBqkRsqb/xeP6a1p3Q
	 jJDX44G5rgYPA41SmY/bwgrv1QfBXWWQFLph3/mQ9BjkEyiZh+bamkmzs3bywMSn4iWiW
	 fyEX2/wRcUznqWpQO9nTZ34I6d/mOQackLiIoaRIEKfV7a8j16gvBNkmXNkHcqIeiItKH
	 8OzeaABGQWKHHw47UAnW9UAlU+7Zi7hx+15BFl+840qp2lttOkgvx8s9Yv/TsIcWvV5Ke
	 Wo2P96HOaIfFOeSHYQxa8t5VXs8tnKgGziT4D4Emq+tvixdOje/ZCIIFvPadMlUoZGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613093;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NoFfXTbkKZgeVewnq3uhhhf8T+SbCXkg7T74d3ottDU=;
	b=bjLpFuY0QbEzGhBSlQDxuhmDHKPwkBqEyDWGXNgLVveKHMDHFzF1VsrAUzZ6lkIAkIWL
	 QicfLAqtFKJGSZNBd+ADG4LTP1JmrEe0di6Q7CVkWCYZj6Fxm5YKmoQRp5W4JcYI8CnTc
	 seGqTqm4f3PSEfqt1GoUbPhaji01MTLXvNoXmrglhzp9RyDGQOGvWO3zgQ6uLeO6t64wz
	 s6/diFBXcYvhgy/DoZnZ0e+X3IST6m3tNCDBghQLkOIemR+p5gLgTIHXksfSWcOEPTmdK
	 8Ie7V9SDTDmbUnHmxqRKRHkZhtB4OkX0ExPF06HnniRYw/5eAy519UcCuv1DrnajMzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOuXEogj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DA3606A330
	for <mfd@lists.linux.dev>; Wed, 25 Nov 2026 13:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oOuXEogj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E15E1F000C0;
	Wed, 25 Nov 2026 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795613092;
	bh=NoFfXTbkKZgeVewnq3uhhhf8T+SbCXkg7T74d3ottDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oOuXEogjgymFws5P2Z369F7BhJRHAm4QiC0+wxDJQVsSY/Yui3vuwiqcBcWeuyU7n
	 PXUlBc0UWYLSf01bzFviHjWzfCeTfR3sBK1GChdQIMTQUVDXK9rTv3O7vAQhwNqm2T
	 nA5khNljHieXT36Vcs67tjwVOGNeY6DUsxYcA86Zlr7Fyib1ZcjZugjJy/UMdojNBH
	 nK85Pe0TIXMsosUYXY78yPYSrx9mpb0x86hpA6Cy68n4GOkumk4yhE9soVpYLL7Maf
	 jnPcir5pr6D0tAi1w/HfheU1zyNt6hxmXy2Qe4BND1/UENIRd2VhtYwJt77hA7m+hN
	 rHMgEvIMuUhBg==
Message-ID: <sashiko-outbox-233487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] mfd: tps65910: Fix GPIO amount for TPS65910
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261125131845.4025694-1-alexander.stein@ew.tq-group.com>
References: <20261125131845.4025694-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:24:52 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> TPS65910 only has a single GPIO, see datasheet
> https://www.ti.com/lit/ds/symlink/tps65910.pdf?ts=3D1795584464029
> The wrong number was introduced with the support for additional GPIOs on
> TPS65911.
>=20
> Fixes: 11ad14f86a78 ("TPS65911: Add support for added GPIO lines")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125131845.4025=
694-1-alexander.stein@ew.tq-group.com?part=3D1
