Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8FA3542F6;
	Mon, 27 Jul 2026 19:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179716; cv=none; b=Tz52YbKRklWHAxntYwglNPdqsLbOHzMlNYe7Jq9KWP6aFd2oATPn2GvkIPgRe2usmujFb64s8ZopV+vPlCwEO4VYnjTAuAA9jE2vIznBqHzKHwT4ywwQIS5CcM9XiZe3w6kObSb4DXeHpGEk8qGgZ3EqqWzkdQ7o2cfOP4Bt28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179716; c=relaxed/simple;
	bh=FZP8gDDExDTIfQOM6LQibhAlAhV61J5EDMkOb/wjkAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KxGfF84KX4BP2asnUDdyBuruQNxE5MGgjVoqjNvWW2kRG1CgVw/wdaqlDw0auEoxHSdHo4NBw7oadhcflHzpJDehDP4DQt7tB0X7eKbdFqHfo2G7i6pezZirB/WnGQv/eAud1gTgeEAL/4oGFZs2oXGHPLBdUt+8T6ha7gaA4kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R01GptUR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R01GptUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7EE1F000E9;
	Mon, 27 Jul 2026 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785179714;
	bh=54z6X8nhUXT7ZsQi253DU+1CQTthZ+Xv5SDBK/KCXa0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R01GptURH2m23jAe5EjNasCjeCVN8i7IgIU6/Skc54D61Jg1KnJSew6mlT53DDyYi
	 IOoAD+I8+HYOpc920dJT2JhrPtr1zau7MLNnoROPqr/XI/htthWgeszCbLcftp8/DC
	 xsJ8Tz4PytXWI2m8GkDrIQwn1nm0PqYDLwXqqoAfIP21mI73EmuiCOi3bsUv0IAT/e
	 bwuPHxawdlrLlFsIHUPdfzad4+Ilw154YV4PsdeinyeAT9cEFkrZhsCVCqYazohIFi
	 S8F8+uyW+MwcYQ0tDplnImc+12OdKGlXIXSXschv/N6jpS9zRajA/Ez61/XwU3rvfg
	 LjGSELBtPWbOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/12] clk: zte: Add zx PLL support infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260727-zx29clk-v8-7-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-7-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 19:15:13 +0000
Message-Id: <20260727191513.EC7EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] zx29_pll_determine_rate ignores the req->min_rate and req->max_r=
ate constraints provided by the clock framework, potentially violating boun=
ds.
--

--- Patch [7]: [PATCH v8 07/12] clk: zte: Add zx PLL support infrastructure=
 ---
commit b2281439469368ad41cdfc2e3b1cb9178840d858
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add zx PLL support infrastructure

This commit introduces the ZX PLL support infrastructure for ZTE platforms,
adding rate calculation, prepare/enable operations, and registration logic.

> diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
> index f8ddb4c7dff66..6e3a20cb5839a 100644
> --- a/drivers/clk/zte/pll-zx.c
> +++ b/drivers/clk/zte/pll-zx.c
[ ... ]
> +static u32 zx29_pll_calc_values(const struct zx29_clk_pll *pll, unsigned=
 long parent_rate,
> +				unsigned long rate)
> +{
[ ... ]
> +			setting =3D fbdiv << ZX29_PLL_FBDIV_SHIFT;
> +			setting |=3D refdiv << ZX29_PLL_REFDIV_SHIFT;
> +			setting |=3D i << ZX29_PLL_POSTDIV1_SHIFT;
> +			setting |=3D j << ZX29_PLL_POSTDIV2_SHIFT;
> +			out =3D zx29_pll_get_rate(pll, parent_rate, setting);
> +
> +			if (abs_diff(out, rate) > best)
> +				continue;
> +
> +			if (abs_diff(out, rate) < best) {
> +				postdiv1 =3D i;
> +				postdiv2 =3D j;
> +				best_fbdiv =3D fbdiv;

[Severity: Medium]
Since this loop unconditionally picks the closest hardware frequency to the
requested rate, is it possible that it selects a frequency outside of the C=
CF
boundaries?=20

If a driver sets strict constraints via clk_set_rate_range(), and the neare=
st
PLL approximation falls outside that range while a valid alternative exists
inside it, clk_calc_new_rates() might reject the out-of-bounds rate.=20

[ ... ]
> +static int zx29_pll_determine_rate(struct clk_hw *hw, struct clk_rate_re=
quest *req)
> +{
> +	struct zx29_clk_pll *pll =3D to_zx29_clk_pll(hw);
> +	unsigned long new_rate;
> +	u32 setting;
> +
> +	/* TODO: DPLL can switch between two parents, one of which is another P=
LL. Take this into
> +	 * account when searching the config space and set req->best_parent_rat=
e.
> +	 *
> +	 * In practice it shouldn't matter though. Dpll is always configured to=
 a fixed frequency
> +	 * and is the only clock with a switchable parent.
> +	 */
> +	if (!req->best_parent_rate) {
> +		dev_err(pll->dev, "Did not expect best_parent_rate=3D0\n");
> +		return -EINVAL;
> +	}
> +
> +	setting =3D zx29_pll_calc_values(pll, req->best_parent_rate, req->rate);

[Severity: Medium]
Does this code need to consider req->min_rate and req->max_rate before
calculating the new rate? The minimum and maximum boundaries passed by the
clock framework to restrict the search appear to be ignored here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D7
