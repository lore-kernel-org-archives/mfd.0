Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851636;
	b=kvIRadlALJQ82S3pkFQINoebVACcFv2Bjt/cSlY2ACS3uSq/mvARABSf1SgoDgduPRCM
	 1vEFbuy182DY0rrHlYHg23tfqORZs6UhEB0bPILEObnpLTaefmsWkg5tw1mMVHd4vM7Ch
	 DFTqAxKDhaEee5QgtiiYge8eq4vCLIstUQK46awEWOl6Qbc9aL45kMNbvnSP3QBnKfm4Z
	 bjwuiJ89T4Y+yK8FNXszdwM3IcvrlR+85OLkhv/sgPxQT8yfugLBVls9IgD38Z3VEqT+N
	 +fsidfobvNHNQEsuyOncXsyIdRvmFEBJ/VwJ8ndChw0ygUNr9tdi4XMbEotI8nKRHLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6K2oT6KkEuqyfPANOnltNGngqYYKEVqJ2VTwHActogA=;
	b=XPzGUOZO99KvcqsyGxPhLsN3zXfuQdnsTDSh59P6V9FFUVP6UfmrPMzabcsTpXjn9dTE
	 i05mDAVA8nrbMVb3BLhlkXHCtttL1fpz2UogvU+243X8gLqtK65YYkH4rsj4l/QTxWhVU
	 j6gBl4AuUCaS5YtfrejgZivr9RvXDv8JD1PlU3eVx4o64Zb17kKQ2Izynux8UiJSiyH+l
	 FDMjxOuV/QpNmSXgNz9x2aLvUddG3bHYW5PyXlW6tHKH+hC9iYpXZjNtCfp7Ee5LPKUV5
	 P6cTBOKedjRAqKE9abgVbFTA6cYEs+W4BS+ftaS2yT6CV58mafec4LRH54UUQJy5KEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hze1L0qW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C309606A336
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hze1L0qW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5E91F000CB;
	Mon, 16 Nov 2026 17:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794851635;
	bh=6K2oT6KkEuqyfPANOnltNGngqYYKEVqJ2VTwHActogA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hze1L0qWqv9BdJAbmGS7gr8SfLE8Wu3wlDZ9oIsUFpJKrs8aD93yb9O2vzVwPzhDS
	 VzSKAw5REmjrMh03EI4xIPpv3c8W2CuGLo7y6Y8XOiet7jXM3qest/J6wRyaUO2w7E
	 qGILiwT7BqlzOR3188K3fhJYN7Yak8aF1455+WhVD6kJKN48kurBNkYRuUo5yrAEMR
	 k8DxrUmd6O3jwunUkfO6SBFpXwfNFbwtF95umYnj++/JbC7uC/bqrIUUKs6YOtF81c
	 Kwj6RhCDSZNJUFQdnUT2C6o4uGPGtcuVcz479xs5vBBGCZUnSGdgTROm4EhQMXeHDR
	 uLHTNjxtj0ipw==
Message-ID: <sashiko-outbox-217455@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/9] pinctrl: airoha: mux a requested GPIO through
 the IOMUX
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116174854.342912-5-john@phrozen.org>
References: <20261116174854.342912-1-john@phrozen.org>
 <20261116174854.342912-5-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:53:54 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> On a SoC with an IOMUX block every pin turns into a GPIO with one mode
> value, mode 0 on the AN7589. Add that value to struct
> airoha_pinctrl_iomux and write it when gpiolib requests a pin, so no
> SoC needs a gpio function with one group per pin.
>=20
> Without an IOMUX the callback does nothing, so the existing SoCs keep
> their explicit gpio functions and their behavior.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116174854.3429=
12-1-john@phrozen.org?part=3D4

