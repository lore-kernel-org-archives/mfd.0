Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FEA429029;
	Mon, 27 Jul 2026 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785183193; cv=none; b=Wuatx7z3OF5I20RPI8ZZFB/qjoOeud+BItBqqrSo/7iKhwTM4Lnv3scT6m+YSHpazMkaKpZOz79RWLdGES4p/bajniTcYS5nL/GMA2CduCmyugdMRrfbckv8GFYFa8GpxmSXskWaH9htxe6+xH/Rgj+iLUVsrSKMbZiiz2XAZHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785183193; c=relaxed/simple;
	bh=BvpIE+h+Bb8SVRK5xaAKv1SnGxkkEuwVkiUvCrf6qIM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VTLcQRC0UHFoeZpvoTvzFU+sCzcCV701R0xEgb0ZhbNWFaiEa0mun056abMkZzZ4XJ9AmkgT8aPG3DZ/KvaYkKhPwBgM/a8FWoBWjPHUHIPqa1HtKRZjUvK0EDn1MLdJc4YdsOiXdESwQ1UpZKAjmVF/eb9P31Ws8pYlu1UJni0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HC5MTNkk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HC5MTNkk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BEB1F000E9;
	Mon, 27 Jul 2026 20:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785183191;
	bh=5hxWJ8fLVh63dP5SxRY8c9B0C70IaVjp/E0hFXzcp0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HC5MTNkkbzsz9CmhVs6Yg86O6w7xdM5/0MxP8D/qMOSFxqVMRvee/hvpwFfYdfZWk
	 BRGUV263E7jlSEH4z7VK0+PPqyrHcJaLrxy5eIBHQdPum7Q8XDbmIHI/OqpUe8ziqg
	 /inc46OwgLkpQ4mEN37gEgCNX4vbyav1fzbUPgmhUg3fEfUuwjqg6YyECihAAnAXJX
	 wZ0d2j4F7FY3LiBB9J7CZ1uRnw/yyVjcm0IfZceAOQPCMvIS5mXotX4rGbTDxmDfHx
	 CvIwK+vmFH6mfYaey90uDLYB3iRWQlJSM8xH9dstQz2Fb9gTyFXgivEvvtNIg8K8CE
	 7HhEiCRFIY/og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-zx29clk-v8-12-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-12-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 20:13:10 +0000
Message-Id: <20260727201310.B0BEB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The lspcrm device defines a hardware reset dependency on matrixcrm=
 (ZX297520V3_LSP_RESET), but the CRM drivers never request or deassert it, =
which can lead to a hardware hang when accessing the registers.
- [Low] Nodes under the `soc` bus are not sorted by their unit address.
- [Low] Non-generic node name `syscon-reboot`.
--

--- Patch [12]: [PATCH v8 12/12] ARM: dts: zte: Declare zx297520v3 CRM devi=
ce nodes ---
commit ae42492b8ef6fce4731646f6907ba63dc94e9ffa
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

ARM: dts: zte: Declare zx297520v3 CRM device nodes

This commit wires up the zx297520v3 CRM device nodes, clock inputs,
and resets, getting rid of the placeholder uartclk node.

> diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zt=
e/zx297520v3.dtsi
> --- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
> +++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi

[ ... ]

> @@ -70,13 +75,74 @@ gic: interrupt-controller@f2000000 {
>  			      <0xf2040000 0x20000>;
>  		};
> =20
> +		topcrm: clock-controller@13b000 {
> +			compatible =3D "zte,zx297520v3-topcrm", "syscon";
> +			reg =3D <0x0013b000 0x400>;

[Severity: Low]
Are these new nodes inserted out of order relative to their unit addresses?

The topcrm node at 13b000 is placed before matrixcrm at 1306000, and lspcrm
at 1400000 is placed before uart0 at 131000. It is customary to sort nodes
under a bus by their unit address to maintain readability.

[ ... ]

> +			#clock-cells =3D <1>;
> +			#phy-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +
> +			syscon-reboot {
> +				compatible =3D "syscon-reboot";
> +				offset =3D <0x0>;
> +				value =3D <0x1>;
> +				mask =3D <0x1>;
> +			};

[Severity: Low]
Should this node use a generic name like reboot instead of syscon-reboot?

The Devicetree specification usually recommends node names to reflect the
function of the device rather than its programming model or driver name.

> +		};
> +
> +		matrixcrm: clock-controller@1306000 {
> +			compatible =3D "zte,zx297520v3-matrixcrm";
> +			reg =3D <0x01306000 0x400>;

[ ... ]

> +		lspcrm: clock-controller@1400000 {
> +			compatible =3D "zte,zx297520v3-lspcrm";
> +			reg =3D <0x01400000 0x100>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;

[ ... ]

> +			clock-names =3D "mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12=
",
> +				      "osc26m", "osc32k", "pclk", "tdm-wclk", "dpll-d4";
> +			resets =3D <&matrixcrm ZX297520V3_LSP_RESET>;
> +		};

[Severity: High]
Does this hardware reset dependency require explicit handling in the driver?

The DTS correctly defines the dependency, but looking at zx_clk_common_prob=
e()
in drivers/clk/zte/clk-zx.c, the regmap is obtained using:

drivers/clk/zte/clk-zx.c:zx_clk_common_probe() {
    ...
    map =3D device_node_to_regmap(of_node);
    if (IS_ERR(map))
        return PTR_ERR(map);
    ...
}

Because the lspcrm node lacks the syscon compatible string, this bypasses t=
he
generic syscon reset handling. As neither the MFD driver nor child drivers
manually deassert this reset, won't subsequent register accesses hit a reset
block and potentially hang the hardware?

> +
>  		uart0: serial@131000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D12
