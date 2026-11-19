Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107285;
	b=Y/XCuVEpB9njzW1odzQWvIexaKNaxaUE6sv6fYtey8mwD3KRlUc1r53+D2pU8WzTpgfQ
	 4dOR+N5I1W47nDB7pAilPMN1J+pbXqF55GY0vmD1Hj5yYAmSyDa7/OmwxWgAtbx2ACrY3
	 lBwh9lgJTbcKG/bQ05WHMdT40th0+7OTVeALhBiE9cuMO5neM71oWwJTHL8YLMgYxYOKp
	 jTmA8sRCD7opvteQ+UAFU1iXBbH+fYStoJijprh7k4SuSUfuNzGg9DLadQ+otBGoBWcsG
	 aTjsluLm4LXlzz69bc8BeOcmyhsx8jwSGuXknEVjpX6OKvLeAaWzB4m9yQYcrkF0vJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Zf1PwkDFE7Zams1Bi05K7qbr7NWK8qRVIlbYAgmr/kw=;
	b=THz4rqL99x6K6lANzDZPp2UGnRqeWVgZY9JX825BD58Jgri879/BwJ4WSk5k19ogyZoY
	 1T3E3rjmjJE5Nyz7feq0Lctzsf3mSPoX5Jopl2rnhSWY+MdUqlt/S8tCx6EzDT9KiBMc1
	 nf/BMg51lHr0h5ZnDkBhCR5mRU2OMbVou4AmAKODKSgQqXVBvCfm2h6YMSKG+BmEg/GRn
	 JYj8Iv8imTVD+P4Y66iBrN4lbAfKWNwNasxOM9ObEg5MUoqu0PwZRx13l7LfihgNGZ5/d
	 B2wMLmnRj86PUsRgfkedW2Hhn/Lxu9eoudtHQblQVCGuP3lDWeHu2RaIvSVWTyYHO2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hy3E/2qB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E98606CA45
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hy3E/2qB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EDC1F000CE;
	Thu, 19 Nov 2026 16:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795107285;
	bh=Zf1PwkDFE7Zams1Bi05K7qbr7NWK8qRVIlbYAgmr/kw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hy3E/2qBPdDD8EmNuVbfvY82S0esPfsKLnSOTiX2bXmGajhOIiZfa6AmUBwZvV50f
	 2apz/aQcQwIGlgVc0EJj7DCSjYDzp/+2UIjVmQTbmMMyw3IwqUnVeNzKo/zJmeZ+5I
	 1/w/8dGH0/BnOBgpfja4cxmH2SnYd/GrEOSbBLOaXF58uAihYdtRRtjLBG/yYBZw8p
	 j9T+Ex63H+kLtSy92T1j0A/h6BmzCz8b4/QWzs/X8uHd1Y2Hlbh4IDR4yRdfJ/xjPO
	 2N3bmLqdDS0adPlwHOpgKtLcXdCEOjVfaqflZVgSiFOqj+Q0YL4X2KnVlomHnENbHk
	 NN2krRnxHDgBg==
Message-ID: <sashiko-outbox-223595@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: syscon: Put the clock after regmap_exit()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com>
References: <20261119-syscon-clk-uaf-v1-1-dc4a4c1be353@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 16:54:44 +0000
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
> On the error path, of_syscon_register() puts the clock before
> regmap_exit(), which then unprepares the freed clock. This happens
> when the reset lookup fails, e.g. with -EPROBE_DEFER.
>=20
> Put the clock after regmap_exit().
>=20
> Fixes: a00406b71c5f ("mfd: syscon: Add optional clock support")
> Fixes: 7d1e3bd94828 ("mfd: syscon: Allow reset control for syscon devices=
")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/r/179493691305.3136.16311404541139130213@=
kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-syscon-clk=
-uaf-v1-1-dc4a4c1be353@gmail.com?part=3D1

