Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626999;
	b=x7f7Jm7FnTBRfuSile1MC4lcy4SOm/EO7+the+dcclFbeur3uzk1F321K5E4hw5v3mxi
	 AXwpd0pUo76VtWPyPo6JSRZg2gyb86cJfSpp5ashB8eHOkXtiMMLwkzj5TtgK93I/kwgi
	 55KzFjAo8UndoDmf9qeUDlcXTCprnWbS7ClD+kepecxHtEnx3NSx8JuePIMSCjd4z9Gl7
	 L7a0Jq2fRn6GJKd/3/wp6aoW09Gjv9lwmNNaxBSKjuagM+5ibiu/p6xOQXQGq1bEAazgy
	 W6T0tLbbgCxQpLHI5wfiqjbPa+TJ5y6vws0eC4b89igoxgLe6AiZwfVPpwjaSf43XFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626999;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7pPf1UUpBMP9OPZEvxjET4tLADV2rvFwOKmPxPl9oww=;
	b=c4RiEIv4JqkEEjBDps8qJ/4oE8emLxx/ovpwSJXR24VtP+juFOHR7zf8gn6i3ZVkyTtW
	 W2tfiZQ1GdnN23vP2uZ/Jyxzfjn7veUN5oCAvbLKWge/nS941PyIeUOxdCJQivLSASJyz
	 CHXGvaL0IiPpgUV7uq2pVPKtIR2XaKIdqVHj8eagbzbK2d966ot6TU3GdqVgbrGjOxw9N
	 fXnrmAPw2lYh+F+0mk79G0tk4ey5HXKrrw/cJAAUx0uetptkWecPZOlv6IbM/xiFqZed3
	 5/Yq5MBNK1KmmkMWl6pSzUaOsJgZJowEo1RefnjsmRh0QOUClk3hvBbQ+SmtvHDvcdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ws5qbdqi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A7606A890;
	Sat, 14 Nov 2026 03:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ws5qbdqi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7152E1F000C4;
	Sat, 14 Nov 2026 03:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794626998;
	bh=7pPf1UUpBMP9OPZEvxjET4tLADV2rvFwOKmPxPl9oww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ws5qbdqiES+DKjB1bIQJlZvdgdHeoCaHAwOHW3hPzg+VQZwThXjQj2SOakn6IeM6k
	 cEND+V9uFC6bIIUVmhk711VPHdeo0viLXhThMMqaebM2zD2qok72MUIkvMNaAx8Y1J
	 hxt5Wcx2TVrVROHx3ZpyTC6sMUgodxNM8pGLKhpHAURIIbKWFBUElB+lZDafSKstee
	 IAWxRzLb6a1hGw/ndty8qI4/ywLSGKNVFYHYSKrh1LUniAv1hkMrWD0T84s8FalstO
	 ZECj9kDIAnpOThP9+u17qZ4f1dhMNNaRBL9/bw5pLseSHaxcCJHIJsIesU/Z2aC104
	 nLtEH6qF5FAoQ==
Message-ID: <sashiko-outbox-214112@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] mfd: tps65219: Correct the MASK_EFFECT field of
 MASK_CONFIG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chrispine Tinega" <dev@chrispinetinega.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261114032457.3434248-2-dev@chrispinetinega.com>
References: <20261114032457.3434248-1-dev@chrispinetinega.com>
 <20261114032457.3434248-2-dev@chrispinetinega.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 03:29:58 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mfd: tps65219: missing Fixes trailer for
  TPS65219_REG_MASK_EFFECT_MASK fix
--

commit bc69d7bd96f2d6a411ff79d868b4352a275dddc8
Author: Chrispine Tinega <dev@chrispinetinega.com>

> mfd: tps65219: Correct the MASK_EFFECT field of MASK_CONFIG
>
> MASK_EFFECT is bits 6:5 of MASK_CONFIG (0x25), per table 7-46 of the
> TPS65219 datasheet (SLVSGA0D). Bits 2:1 are the warm masks of sensors 1
> and 2. Nothing uses the macro yet, so nothing has written the wrong bits.
>
> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>

[Severity: Low]
This fixes the TPS65219_REG_MASK_EFFECT_MASK definition.  Should this
include:

  Fixes: 74c17a0a49a6 ("mfd: tps65219: Add driver for TI TPS65219 PMIC")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114032457.3434=
248-1-dev@chrispinetinega.com?part=3D1
