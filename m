Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272804;
	b=h7dp2laLUe7+H5Kiuo6eD153EGp87lQOTmKuvVRA5+o13ErycN2ZPxq9mIAkTkKrZX2V
	 +3wXsEgNLhIxl0qhEhHjnLJWPE7NWqd7cTf3T+9ZrB12ZqgzB6jpJB4mcfkB8HZ9/TBHN
	 /i7qpkYCE6oasG4Uxigec9CILnEJ/IFFK3d0SKbGiHmEXbnAbqC3F7HUkuuOQY5KNjKnp
	 RTmzU9et4Dt902D+PGiuuoU1F2wV8tFuuvd2tkZ7mV2dQ+bHg4cs9MOEmKp+gnEL2OQOk
	 MKGiYStsnacxTIm8zbKvFPgLpswMplJv4L+eV53mUARV7viWMBuB/jq4fsznIADcr+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272804;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XzYskYCDVCZWe4ZMqduiJUHlapP9vP/WS3GN+hiPxNQ=;
	b=4FFfZcsne9xvEINrOtYNaLO2rpPX28zTWfkLx5FxslQXIhA6OXX1nAVExGHCFD7cIxG2
	 r1DZj0iziortzMGHWCdKMiP8usADDgg13iIncvspuzRA+y+KajGGNJdy12zMjVCJZNaVi
	 1dFMWkd7DnK5vj+czfLJv301//VLkevlb4v2blG1tkDxo6N3HS2pq55qR7H7qKXy2JtBs
	 ebXxNF7j4YwOCoy/mY+JzyFjR2Z79bXLY+w45qI5W/pDtJB3frr6sQrtvWvnGfzP1UPq7
	 AK5zbfpnA1bY7wwKKcWdiQv10ib2grX7p1PT9PX7eFV0knjMD3MztfASKrXEf/o9NIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pkw+Fubr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB78606A320;
	Sat, 21 Nov 2026 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pkw+Fubr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2101F000C4;
	Sat, 21 Nov 2026 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795272804;
	bh=XzYskYCDVCZWe4ZMqduiJUHlapP9vP/WS3GN+hiPxNQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pkw+FubrEuWKlNMojIGVY1XI7Q5ZjR5pM6Hf0UpNOpIsuQTnNztPOsrW+IcnJ38rN
	 wKHmFw8eEhDeA8dFlIYCoeKwJfZJ8inHMktg+GMmFyNZvA28RgeCFjoyKJxMixB6n1
	 1cvm6gUT4bj+HE5cm9TvVBCSis/wdATtapI+gAcNabnG4HXNDxZJUa9oadunQHnAhy
	 1f7eIWp2i3yGLzh3WSUhi+AYTDhzz1vyq/hYp6ErAbNKmo/uVzpY4fOMD8rFMYslvN
	 z0QSXKpk5ft8k44uUeMh/0CaRX3xfDB6CYDCt8WDHNvyiR3R0DxWsKlTXG7/EgSA2B
	 /wN7JrZrWtxDg==
Message-ID: <sashiko-outbox-227106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 2/9] dt-bindings: net: Add SoC-e SWIP MDIO
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-2-5de9225715e6@linutronix.de>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
 <20261120-devel-vstrassheim-soce-dsa-ml-v5-2-5de9225715e6@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:53:23 +0000
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
- [Medium] dt-bindings: net: soce,swip-mdio splits contiguous register
  block and 32-bit control register
--

commit 9edcf12a958c9e727ec0bdb9d997f3a5d2655e08
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

dt-bindings: net: Add SoC-e SWIP MDIO controller

This commit adds a Device Tree binding schema for the MDIO controller
integrated into SoC-e SWIP Ethernet switch IP cores.

> diff --git a/Documentation/devicetree/bindings/net/soce,swip-mdio.yaml b/=
Documentation/devicetree/bindings/net/soce,swip-mdio.yaml
> new file mode 100644
> index 0000000000000..7a0b8bd3ab71b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/soce,swip-mdio.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/soce,swip-mdio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SoC-e SWIP FPGA MDIO controller
> +
> +maintainers:
> +  - Vasilij Strassheim <v.strassheim@linutronix.de>
> +
> +description:
> +  MDIO controller integrated into the SoC-e Switch IP (SWIP) FPGA core.
> +  External MDIO buses are selected through a sibling MMIO MDIO mux.
> +
> +$ref: mdio.yaml#
> +
> +properties:
> +  compatible:
> +    const: soce,swip-mdio
> +
> +  reg:
> +    items:
> +      - description: MDIO parameter, write data, and read data registers
> +      - description: Lower 16-bit half of the MDIO transaction control r=
egister
> +
> +  reg-names:
> +    items:
> +      - const: data
> +      - const: control
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mdio@204 {
> +        compatible =3D "soce,swip-mdio";
> +        reg =3D <0x204 0xc>, <0x200 0x2>;
> +        reg-names =3D "data", "control";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +    };

[Severity: Medium]
As reported by Andrew Lunn on v3 [1], should this binding describe the
controller's contiguous 16-byte register block at <0x200 0x10> instead of
splitting it into out-of-order sub-ranges (<0x204 0xc> and <0x200 0x2>) and
slicing the 32-bit control register at 0x200 across two DT nodes?

In hardware, the 32-bit control register at 0x200 holds both the MDIO
transaction control bits and the external bus selector bits, followed by the
three data registers at 0x204..0x20f.  Partitioning that single 32-bit
register into 16-bit halves so a sibling mdio-mux-mmioreg node can claim
<0x202 0x2> encodes Linux driver details, little-endian byte offsets, 16-bit
MMIO access assumptions, and an artificial mdio@204 unit address into the DT
binding ABI.  Describing reg =3D <0x200 0x10> on mdio@200 and modeling the
integrated bus mux directly in the controller binding would match the
hardware layout.

[1] https://lore.kernel.org/r/e5aa5cd8-e805-47d3-a105-07bf1b9eb9b8@lunn.ch

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-devel-vstr=
assheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de?part=3D2
