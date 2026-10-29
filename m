Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268697;
	b=pDKmVlAVtS60waoRcLcEt8HQd1EgU0vldPTHhNeKjC0YEX2JaK01EIhmxAq6tpCr0/k9
	 eevKv8hg3EnYPQa0ihzJXpJnfrYBfyj450ZNavVER9Y4TBtHFNfqF5JRTVrV0dLj5sMKY
	 ae0Ubqv606yjvTMeAePpIzFdcoccYQZNexDSOMa0OSN0xzzx6I4EC713VRmfZaN4Qeox5
	 FSH9PofR2WGJ7ePgblUGq+Yvopk9Eg32uEFGn2Fq/xM0hyXh66rz6mOYuI8fPA61zl931
	 JR18gouPNUrjV8wF08iNua11vRyewguvs9Jris665F7GjnDY78IEi1Wt/MpRDV+J4OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268697;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b8iu8NNCf5thBEGTxmTFdzvLS5kC2lRllJjKBzdxi4s=;
	b=S4E5jMh5FD/1BjoYrkOgRwYunWSOyq85nnwER/W/TnAg3Pw12EG5GOYwujyFOh9yLQgp
	 z0BS8jny6S3kEtd0iYEw2AyVFfG9l9GT5mn/GSLRyLXA2EBTfm1mo4XOUvucAsYkVdq78
	 dzpWxA/eSiIgzAUMVWrmbBKcejqNaXxEwNlVF+6gWJsRYrqSq45imBjpcPiYRqdXVLjHO
	 sru/2TVgXWHaI/E9/MNFLLEuh+YIEiaLwWtKt8QGJfxSlMTm5NyzgWMmW75IroQ43e1iL
	 reAsm5bUNGuR7Rr7xWSNT5UGJ8IlDN/a3IJPD311L8qvyxPin8InmYzpGSWC0OYgFQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VChF7/Vq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06C7606A322
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VChF7/Vq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0481F01828;
	Thu, 29 Oct 2026 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793268696;
	bh=b8iu8NNCf5thBEGTxmTFdzvLS5kC2lRllJjKBzdxi4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VChF7/VqhTpY77wFxMRrdJcohGzLHdWYuzlHFCMLy043EKUa8pJ6+Z4kgg4Myx7TS
	 j+uL/meE9dcuXkyHkPoIsU5tZa64y/9w6S90D37RR4t8Yh2s6Hm4Ip6XtLqyQO4MpW
	 vfIfSRVlsV3A5G8DZg+jy08FQTSCVSUtsBbo936JIA4Pli5l9SM1i9V3Am6UWN30le
	 /mVhfH5mjsfszzc2HcG26M9+GQK9Eq+w1lzYeu0qIVeGvxDlcwYMcRVQfVO9aPZGJq
	 BAdesYzSURkopNwSc7Y6krjOuFjmKAeFnTtgLZ5miGBlhyAKoSe+WX5LCjKUI9NOrT
	 rB4cZd+ho7F7A==
Message-ID: <sashiko-outbox-189101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] mfd: rk8xx-spi: add system sleep PM ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakob Unterwurzacher" <jakobunt@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-3-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
 <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-3-cb12621c1fb4@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 10:11:35 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
>=20
> Unlike rk8xx-i2c, the SPI driver does not hook up rk8xx_suspend() and
> rk8xx_resume(), so the RK806 never gets its system sleep handling, e.g.
> keeping its interrupt disabled while the SPI controller is suspended.
>=20
> Add the same PM ops as rk8xx-i2c.
>=20
> Fixes: 210f418f8ace ("mfd: rk8xx: Add rk806 support")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-dev-tiger-=
v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de?part=3D3

