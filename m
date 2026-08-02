Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BF3244667;
	Sun,  2 Aug 2026 20:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785703789; cv=none; b=oxBOwP2o8dKgZNE6TqXerBdpsfRy9wq1Jwtajg0+Eu/w5U5vVc2YAdfmD+5eCzVnwpu5Sc7xIFEiWycofAHIbomtLYv1VuMSG4iznFXzACrMW2R4/CUW3Ii0++oVHVBiKHnsIjkgZuR1zZ6Sgi7WQsOznawvE6gGQHxt0SRyqBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785703789; c=relaxed/simple;
	bh=Lud+J/j3Gddxw0FWi902iWsX2xS4qAPVEhQ7KrovZpY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WYioeRh0jPE6rE6XW/bH/CV7QLGnY9GOSMZGymH1uMcof5+7wP6/Gdl9QxsnXIHDRUBkxGvkQDAcqa/YlDqfZi+qFa0t8EL30uuutIXjietFevYYcTMw1il0ULQBxOMd6wPvkyHYkPmJv9HTgnIYWHarEExeWzj1juNFmYofy6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+WoHi1J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+WoHi1J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442E41F000E9;
	Sun,  2 Aug 2026 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785703787;
	bh=WUH9MSJOOosyMvV3xlQjw9fjUnK1TOQByKO3MzHfpRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P+WoHi1J0/XBVDlfGfIcGNVL2Jfd6knBX4aQIUM6hYjYXJFAuD/rtIZRgp/C6q/iC
	 eD9qRtuljW9FovX0owsjb/984VR1tE4VDgIOScXIA7+y+LWBmSz6v1JZAE3roUKHJa
	 3HFLKzzGPYLANiROtrYMFjAvI0PwF2N3yBDY3xMwit274km45W4BlqfiSLVkHAR7Rm
	 c4C9dXChWgnkIRZg931f2Lbs+dju32VGMfCiPnU8qcbJZY6wpKRZVIJIDe/LklSqMO
	 pYCfR13zB/akDw9572Zg7cvdUaYcpJnWOipGYOt644w+5+k7hooZa1iBwSzCj0YCmG
	 1G4/RjltdReWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: olteanv@gmail.com, lee@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 20:49:46 +0000
Message-Id: <20260802204947.442E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete refactoring of clock exports causing missing const, d=
ead code, and unsafe aliasing for sparse DT IDs
--

--- Patch [5]: [PATCH v9 05/12] clk: zte: Add Clock registration infrastruc=
ture ---
commit c095bc91f84da44c659bbf8482a8f9e0d8e6f977
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Add Clock registration infrastructure

This commit introduces the common clock registration infrastructure for ZTE
SoCs. It implements clock validation, initialization, and MFD child
integration.

> diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.c
[ ... ]
> +	exports =3D devm_kzalloc(dev, struct_size(exports, hws, data->num_expor=
ts), GFP_KERNEL);
> +	if (!exports)
> +		return -ENOMEM;
> +	exports->num =3D data->num_exports;
> +
> +	for (i =3D 0; i < data->num_exports; ++i) {
> +		if (data->exports[i] >=3D data->num_clocks)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Export %u points to out of range clock %u\n",
> +					     i, data->exports[i]);
> +
> +		exports->hws[i] =3D clocks[data->exports[i]];

[Severity: Medium]
If the DT binding IDs are sparse, won't the gaps in the static exports array
default to 0? This would cause the uninitialized gaps to improperly alias to
the first internal clock (clocks[0]) instead of returning an error when
consumer drivers request an unused clock ID.

> +	}
> +
> +	devm_kfree(dev, clocks);
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, exports);
> +}
[ ... ]
> diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.h
[ ... ]
> +struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *r=
egmap,
> +				    const struct zx_gate_desc *desc,
> +				    struct clk_hw * const *clocks);
> +
> +struct zx_clk_export {
> +	unsigned int priv;
> +	unsigned int binding;
> +};

[Severity: Medium]
Is struct zx_clk_export still needed? It appears to be unused dead code,
perhaps left over from an earlier iteration of the clock exports refactorin=
g.

> +
> +struct zx_clk_data {
> +	int (*init)(struct regmap *map);
> +	const struct zx_clock *clocks;
> +	unsigned int num_clocks;
> +	unsigned int *exports;

[Severity: Medium]
Could the exports array pointer be marked as const? Without the const
qualifier, it prevents the static clock data from being placed in .rodata.

> +	unsigned int num_exports;
> +};
> +
> +int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
> +			const struct zx_clk_data *data);
> +
> +#endif /* __DRV_CLK_ZX_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D5
