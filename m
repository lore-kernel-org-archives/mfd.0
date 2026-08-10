Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5892939DBD4;
	Mon, 10 Aug 2026 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346254; cv=none; b=QxgNicaAbFdYZZJcIodAYdqVO/0NDo+iIZyaaLQL+rm9wrdWCwO03pYqmy/hbfSmWi9X2JsCr4P+2gUbkteiM6kqB25XiuGpUy3w5Znk19M/U6jAcug9FQOppGW/egQ43nnhlnC+Mclaj11NobhNE0u0SNl8KT9ideI3M3emvCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346254; c=relaxed/simple;
	bh=9yf5yT4zeMVBaz6F9TkirPZoxvcCBKxPXqL36PP23EU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jlwjxuBdRJyR02Ip1nyjkf3g0TpFSTrxSf7bmDLTO2Jn6EMwEoAoB0DZ3qAceH7KCpqRnYVIaxYx22FuKdVvIKus0y0sCBIXSIkGvqu6cOVMUtWgU2QVnMTStKpHZeSy/mmlrDPzDbS30kjab3AVpfoMy+9TatFdH0C/0WyX9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K417BgN2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K417BgN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B851F000E9;
	Mon, 10 Aug 2026 07:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346253;
	bh=KrmorWvqzv0rfohVqwCw8dOMTCjiHYumRGdauTVarKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K417BgN2m8izC84Ln2JAEVvB7Fax7SKvDmtY2gs7UYhMzjCaZSYKXhaQXFVkQOYva
	 XKV2NgJJOJAE8mSRkTP5A921X5NflmpongcQRGLKn3JzZV/sgY0nVw8SYsmXbPyyOc
	 1wCiRmpxV/ZcMqUDCh+wC3zwHjL5JNXcgu0+Lu1JokYKkQNyGBQCcZZMz1eXS7WaaW
	 l1WCmWUcwKCqsw8FdChgadjnIxzDJQzHS994/2DjttfiZ+Wm5Ozh1cRr7gXZ8r7uUI
	 7iMMxW8jRJwmDyjVuxV2msuoVYE2n1g0GLeu9lAnIapL1/vYn6GKBU8qCZ+59yw+Z9
	 RmlZ/I7P7T9XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/12] clk: zte: Add Clock registration
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, olteanv@gmail.com, lee@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260810-zx29clk-v10-5-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-5-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:17:31 +0000
Message-Id: <20260810071731.97B851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The clock driver fails to pass the explicit `of_node` down to the =
clock registration functions, causing the Common Clock Framework (CCF) to f=
all back to the child device's `dev->of_node` and breaking parent clock res=
olution.
--

--- Patch [5]: [PATCH v10 05/12] clk: zte: Add Clock registration infrastru=
cture ---
commit 796448cb70bee510176b9b976cf13443c5e9c07b
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add Clock registration infrastructure
   =20
This patch adds the common clock registration infrastructure for ZTE SoCs.
It prepares for regmap clocks and PLL drivers to be implemented in subseque=
nt
patches. The implementation allows the clock driver to act as an MFD child.

> diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> index 0000000000000..aef0f7c753e64 100644
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.c
> @@ -0,0 +1,192 @@

[ ... ]

> +static struct clk_hw *zx_clk_register_fixed_div(struct device *dev,
> +						const struct zx_fixed_divider_desc *desc,
> +						struct clk_hw * const *clocks)
> +{
> +	const struct zx_parent_desc *p =3D &desc->parent;
> +
> +	switch (p->type) {
> +	case ZX_PARENT_FW:
> +		return devm_clk_hw_register_fixed_factor_fwname(dev, NULL, desc->name,=
 p->fw_name,
                                                                     ^^^^

[Severity: High]
Does passing NULL for the fw_node parameter here force the Common Clock
Framework to fall back to dev->of_node?

Since this driver probes as an MFD child, dev->of_node is typically NULL or=
 a
child node without the clock-names property. If CCF looks for the clock-nam=
es
property in the wrong device node, it could cause parent clock dependencies
defined via fw_name to fail to resolve, leaving the clocks orphaned.

> +								CLK_SET_RATE_PARENT, 1, desc->div);
> +
> +	case ZX_PARENT_ID:

[ ... ]

> +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> +			const struct zx_clk_data *data)
> +{

[ ... ]

> +	for (i =3D 0; i < data->num_clocks; ++i) {
> +		struct clk_hw *hw;
> +
> +		switch (data->clocks[i].type) {
> +		case ZX_CLOCK_PLL:
> +			hw =3D zx_clk_register_pll(dev, map, &data->clocks[i].pll, clocks);

[Severity: High]
Should the explicit of_node parameter be passed down to the clock registrat=
ion
functions inside this loop?

The of_node is correctly accepted by zx_clk_common_probe() and used for
validation, but it is dropped when dispatching to the registration function=
s.

> +			break;
> +
> +		case ZX_CLOCK_FIXED_DIV:
> +			hw =3D zx_clk_register_fixed_div(dev, &data->clocks[i].fixed_div, clo=
cks);
> +			break;
> +
> +		case ZX_CLOCK_MUX:

[ ... ]

> diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
> index 0000000000000..8137185f497f7 100644
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.h
> @@ -0,0 +1,137 @@

[ ... ]

> +struct zx_clock {
> +	enum zx_clock_type type;
> +	union {
> +		struct zx_pll_desc pll;
> +		struct zx_fixed_divider_desc fixed_div;
> +		struct zx_mux_desc mux;
> +		struct zx_div_desc div;
> +		struct zx_gate_desc gate;
> +	};
> +};
> +
> +struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *re=
gmap,
> +				   const struct zx_pll_desc *desc,
> +				   struct clk_hw * const *clocks);

[Severity: High]
Does this function signature need to include the of_node parameter?

Currently, the of_node parameter is completely omitted here. This guarantees
that future implementations, such as PLL and Mux registration functions, wi=
ll
also fail to pass the correct node to the Common Clock Framework.

> +struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *re=
gmap,
> +				   const struct zx_mux_desc *desc,
> +				   struct clk_hw * const *clocks);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D5
