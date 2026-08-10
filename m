Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB01D39BFF1;
	Mon, 10 Aug 2026 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346040; cv=none; b=QPu7l954NEfyQZUz3Kca/bpzJvtrDI3PRO/tLqTg4H4bUUXJEmah2zUKc1831PrLf3HYTsea/09kKto0hx+Z0h/iZk/Q5SSL89UXFP2ITeZpMs1vw96h35GB1jA0Ht/KepCmWnB2L88fZ6EzkT7uOKVTU3nOdU985TSFUkox8jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346040; c=relaxed/simple;
	bh=L9xDqTW6G8n1VT+QDVFtXm7c4Zap1I/vHD57QanoRDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=paT1LN/Qx59Vlf6v7ojXrpnlC2K1qg/Xna4/ss94HyrTusvdusKIUO7kawYau6pa7dryE5ylKM6gaY6ApyKGTFOALCujgYwkZjTXIiKQOAbCaTMDDzJlAgHa2gTJwUfty5p0lCNLXVpO6xi4JYFYAdk9jZq/4VymjiaTyoPKBO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzmeZa30; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzmeZa30"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5A41F000E9;
	Mon, 10 Aug 2026 07:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346038;
	bh=NmJ7Agw1Vc7vCXHaea9cwMW6pGMr3UBnZbfWkK88nVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mzmeZa30AIwPlIKZASbx4lcN7vdVQQ9bQsUIXYhhhIhqcgp+Fzvkp736jw8Uev1t4
	 JwIkSLrq6dvLQPT/kNI1JXUAFAFPoC4rBew8ag/+d8cSUVtbqdIL3r4Ebiv5BG20Ca
	 E+Eg62Xm4H36ZGUL7opJPNrhJgd9ssGKrvLgCuyIS58rqJEKeNB7dwvgzetDCf/SLg
	 XbS1rzLYIMs747XaFkY1sNVlQx2rg0qU6EyuE07Sjxyzezupc6ZVOwqbRKhwfJiVv0
	 gDxpgDUUuBVYlykSrZZIdbhHXlp2qIXQJtIX37ehwLQRVbDAewzEyuykuy5hxjMdcH
	 x2Ag3kBk/hESA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 07/12] clk: zte: Add zx PLL support infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260810-zx29clk-v10-7-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-7-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:13:57 +0000
Message-Id: <20260810071357.9B5A41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Due to integer division truncation, valid PLL configurations are=
 falsely rejected during clk_set_rate(), causing frequency changes to fail =
when the calculated VCO falls slightly below the minimum limit.
--

--- Patch [7]: [PATCH v10 07/12] clk: zte: Add zx PLL support infrastructur=
e ---
commit 02ad18f21bbd9b41b5dbd910425b934e48d8ecd9
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add zx PLL support infrastructure

This commit adds PLL support infrastructure for ZTE ZX-series platforms.
It implements the standard clock API operations including rate calculation,
parent selection, and configuration of fractional and post dividers.

> diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
> index fc76c6524a163..e8d57dd1386f1 100644
> --- a/drivers/clk/zte/pll-zx.c
> +++ b/drivers/clk/zte/pll-zx.c

[ ... ]

> +static u32 zx29_pll_calc_values(const struct zx29_clk_pll *pll, unsigned=
 long parent_rate,
> +				unsigned long rate, unsigned long min_rate, unsigned long max_rate)
> +{

[ ... ]

> +	for (j =3D 1; j <=3D postdiv2_max; j++) {
> +		for (i =3D 1; i <=3D postdiv1_max; i++) {
> +			u64 vco =3D (u64)rate * i * j;
> +			unsigned long out;
> +
> +			if (vco > ZX29_PLL_VCO_MAX_FREQ || vco < ZX29_PLL_VCO_MIN_FREQ)
> +				continue;

[Severity: Medium]
Can this strict lower bound check reject valid configurations?=20

If a frequency is requested where the chosen dividers produce a VCO at or
just above the 900 MHz minimum, integer division truncation might cause the
recalculated vco to fall slightly below ZX29_PLL_VCO_MIN_FREQ, falsely
rejecting the configuration.

[ ... ]

> +static int zx29_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	u32 setting;
> +
> +	/*
> +	 * TODO: Implement gradual PLL rate change. PLLs can be changed while t=
hey are running and
> +	 * downstream hardware is generally fine with that. The exception is DR=
AM, which reads
> +	 * incorrect values if changed too fast.
> +	 *
> +	 * Changing the mpll rate is potentially useful for over/underclocking.=
 Gating mpll is
> +	 * unrealistic because too many devices depend on it.
> +	 */
> +	setting =3D zx29_pll_calc_values(pll, parent_rate, rate, rate, rate);
> +	if (!setting)
> +		return -EINVAL;

[Severity: Medium]
Will zx29_pll_set_rate() unexpectedly fail here for valid rates it previous=
ly
advertised via zx29_pll_determine_rate()?

If the requested rate was slightly truncated due to integer division, passi=
ng
it back into zx29_pll_calc_values() with strict exact-match bounds where
min_rate and max_rate equal the truncated rate might trigger the minimum VCO
limit check shown above. This would result in returning -EINVAL and breaking
the frequency change.

> +
> +	dev_dbg(pll->dev, "%s: Setting new configuration: 0x%08x\n", clk_hw_get=
_name(hw), setting);
> +
> +	return regmap_update_bits(pll->map, pll->reg, 0x00ffffff, setting);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D7
