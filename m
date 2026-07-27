Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F401EF091;
	Mon, 27 Jul 2026 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178377; cv=none; b=DTBofftdCm9lnt+Y8OiAc+BYHqPQeKDi7r9TRXaBOZfSUFKoLNrZ9GZ8bjdR24O8o5fVEboJIg66e1oeAw/oKA9moZPyQBPhyRR5Z7/E3ylPpItpToYdxWnzb/20En2zeWk7Ox40I3SAm6LUGkxudtx9x0gsndvLQgK8PqFOZg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178377; c=relaxed/simple;
	bh=QHxBWrl+2NySFNWWGPBQAg2dWNBtfw3TMi22+kefX2k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BlA6Joci7q/BgM9xrw2VbJvguPxGq6+GGCUE5dmuPhyuFRZNuplCNokMgXOJtRPaRDoVQlMqC/so/NNubuytRtXjTIY7Y4RSd3s79UaT45PGybB3Gq9nzB1/KTBo0Uml25QZ0VcVjFyHYIWs2JWXJNlmveTLyQ0pY2UMe2BQBNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4aWaWfC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4aWaWfC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FD51F000E9;
	Mon, 27 Jul 2026 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785178375;
	bh=TrMTw9dkljkOMikaGC9bKlvRQ+dvyW6FxMJ4sJKjlUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I4aWaWfCmPLGl5ChgyfGxwzFTYAq3PZuRaa1r/zbQYzrT92Miu988DPXsQWcriaX0
	 gmR5jCMDQmArmL2+RS9F/KlIQFISxAtkHbtphGFZ38StjVP0V3zEN19WnOGZcWdMv8
	 m0CLOxvEXAC7H37GzfH3EPBHzqTcwqPKkIQYF6JXLV9/JEstsl8T8V3t6O7KPuBGO3
	 N6OS3p+lrmIQf2nlZKsULa70aL3QZGbj7b4+qLo+s0SFy9M95ZnnCW+Evl1PH4pfMx
	 z7l8QKSAEt48BNzf+hLBWj6LBcvUIfqLL1QPDbFPxDaldwVFh3+zzONtHX3OkMSVHP
	 4wEAN2tBPv2KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/12] clk: zte: Add Clock registration
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, vkoul@kernel.org, olteanv@gmail.com, mfd@lists.linux.dev
In-Reply-To: <20260727-zx29clk-v8-5-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-5-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:52:54 +0000
Message-Id: <20260727185255.60FD51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The ID sanity check incorrectly triggers a WARN_ON and fails the=
 probe if the driver does not export any clocks.
--

--- Patch [5]: [PATCH v8 05/12] clk: zte: Add Clock registration infrastruc=
ture ---
commit a84018498091df350796aad9d7173588a10fa7ef
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add Clock registration infrastructure

This commit adds common clock registration infrastructure and helpers for
ZTE SoCs. It includes support for registering PLLs, muxes, dividers, and
gates, handling both exported and internal clocks.

> diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> new file mode 100644
> index 0000000000000..c9e9048d3ade3
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.c
[ ... ]
> +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> +			const struct zx_clk_data *data)
> +{
> +	unsigned int public_clk_count =3D 0, highest_id =3D 0;
> +	struct clk_hw_onecell_data *clocks;
> +	struct regmap *map;
> +	struct clk *clk;
> +	unsigned int i;
> +	int res;
> +
> +	map =3D device_node_to_regmap(of_node);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	for (i =3D 0; i < data->num_muxes; ++i) {
> +		if (data->muxes[i].id !=3D ZX297520V3_CLK_NO_EXPORT) {
> +			if (data->muxes[i].id > highest_id)
> +				highest_id =3D data->muxes[i].id;
> +			public_clk_count++;
> +		}
> +	}
> +	for (i =3D 0; i < data->num_gates; ++i) {
> +		if (data->gates[i].id !=3D ZX297520V3_CLK_NO_EXPORT) {
> +			if (data->gates[i].id > highest_id)
> +				highest_id =3D data->gates[i].id;
> +			public_clk_count++;
> +		}
> +	}
> +
> +	if (WARN_ON(public_clk_count !=3D highest_id + 1))
> +		return -EINVAL;

[Severity: Medium]
Does this check unintentionally fail the probe if a driver doesn't export
any clocks?

Since highest_id is initialized to 0, if there are no exported clocks
public_clk_count will be 0. The check (0 !=3D 0 + 1) evaluates to true,
triggering the WARN_ON and returning -EINVAL.

Perhaps highest_id could be initialized to ~0U instead, or a check could be
added to bypass this when public_clk_count is 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D5
