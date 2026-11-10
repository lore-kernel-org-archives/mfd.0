Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320676;
	b=UbF1B03kkQ0fe/kx3eX8WQF+s8VeSxV130tTWO3OrqL/TVjOw3xO2Itk5YIzQx2TJiBb
	 z1Eju03WD0fIHraLvaaARdadeGNreB3T58497OVCGtKarj1vzGGF57xPoNkRZ5rgxOuVH
	 6+JaOuLKmcZiXfRHuGefqlk8IIIMxPlRSYrzz8/tEmomVJTY3THJpvB+55686ywTgL5a6
	 Ud1Fyz1jSDD/tle8CZ5Imxfuv5PyQwBdPCFHkPHfnZuUz0R4h0hmBQv+HZ0P8w8e+Lsr7
	 F5ZWcypkJET0nJW9B6mSxpE9Y5GuAv+hWmMgmHLBehopiCttv8youd5fCDmMcQnvEjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320676;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7vo6LNvfPKKWho27YuQq+/m4GHeJX4mESMijSFW3RzU=;
	b=IwrI6i9yPXqp89oAEXoqlvEgimv25GsRDho49ZAZX/cX350yBLTeouMqAcnWasbfzWsa
	 OxDZqveExcBWHoOUyX8Chvr9qB65rOfP/HGsqp1ZxCI12eXYmeZeN2K7OsGNQxHalcpdY
	 Gpf6BgzHscVVjHngloBi3oaQNGRUJHs+gBaD9yGi0yW0xCMh4JAXCeeF8TzKUENNofleQ
	 TRb/jGpNjjKl/Ze6JW20MNUEU8t/lPeKa1HDTRyxKwvrhfv0n1+JjgpayyxI0PNLdc6FB
	 ff+DdDMICZuD/qFLJB4BPXYt0/m6N8+jMvuSqiNKxIuoy+K4XsX4z3Rn+Axf5jwFi0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mG0gbbpK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB8606A32E
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mG0gbbpK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D211F008A1;
	Tue, 10 Nov 2026 14:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794320676;
	bh=7vo6LNvfPKKWho27YuQq+/m4GHeJX4mESMijSFW3RzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mG0gbbpKpapwHnnpm6fc1RKVWNqCj6Ipyv4HKQSdLadBAhhHRsumBqxQu5wK3wtR7
	 NCuzSs99L7nEzXu9dSNdHB/nPeLo42U9413ANZ9yi/PmfCoVFex+nIY383ovhTkfpO
	 w1PDKPYHU2UY88Enyz/aTTQX80N7KjfnMpFtWY/DLx4iqny+vbd6e0gW/0NJ5DDGfK
	 Qf81SM7cg9mPEQGTtC8TJAZNWqkn1xxiAmPZItGEaLgoheJRFjUdDvmDM5BhKVryMq
	 T0lAlxbEtsqWZZQeI1UFojSDXuwdx5DPMe+6iO+DtDrEruowhNdG46PoJi/WZk4HtU
	 9MEshxsGfOrSQ==
Message-ID: <sashiko-outbox-207186@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110141934.42490-1-festevam@gmail.com>
References: <20261110141934.42490-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 14:24:35 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The interrupt descriptions added during the conversion to YAML do not
> match the ICOLL source numbers used by the existing DTS files.
>=20
> For i.MX23, Table 5-1 of the reference manual maps source 36 to touch
> detection and sources 37 through 44 to channels 0 through 7. imx23.dtsi
> lists these sources in that order.
>=20
> For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
> 15 to the threshold interrupts, sources 16 through 23 to channels 0
> through 7, and sources 24 and 25 to buttons 0 and 1. imx28.dtsi also
> lists these sources in that order.
>=20
> Reorder the schema descriptions to match the hardware documentation and
> the existing DT ABI.
>=20
> Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to jso=
n-schema")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110141934.4249=
0-1-festevam@gmail.com?part=3D1

