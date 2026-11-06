Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974656;
	b=r/yv+bb9y6FRQDlGEvIuG50GkkNbJ5dh3P0R4f3ynmU5eRfXmp/6GsppBBg7pFVJC9te
	 rK4ililzoZfc9tNGa/tjk6GpDX/iccNLXf+ay93g3Lq2owWJfhRbhc9CMbbkmmXwmwCSI
	 WxC1RSCvpqkcpa/z03N5ZmYMxCv08dVkuJkDSWL/IagS8gVNV2IsOuSgqAY5nau0/yO8F
	 RW8SsvSb1bNc+kHggyW8Ruu/Kcn+mc/BbRAXNhKeBfuSz1BHkg8vSsN1Zppc0vgTkUxfA
	 9B2Qy1i/FYALzPrgTWtyb3EHlF6Tl4hctysjWTroEFpfZcSTh6xtOe5onG6LvFfczWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974656;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7zwmRHEJDXCWohgUl35MLAXmhPV16RPVVjitE2qRsuY=;
	b=YtHzJvFWpWQK5y1uPa1vBjV6x6bJS3CfeJHQgqBR0qmrzoRO90z3gqa1u/FUBZDYX3GG
	 je+L41GM5ElW3poErjT90beioiCAtgOK/bAm8bru+TVOAR+e9UfG6VCrEKQ2Yhjl7f4zl
	 ZA31kFK9d/fsakfn9TNVs1j5/vnapPzoRjXOUqTM+G9Xp2uep6Se0MkNbs5G+Sap0wViX
	 j7l0rMcJZOIz6oInSsZzzxwp8X4mSu426Oh2MdscI9OgXHoWakHEO494A7ldN2oEaDom2
	 f/Ko0YAf9/+ndnTXBp3IiHCcB4aBw53Xjj31CCfKdocfHTDO5iMbHzPNTt2CyiS5/IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1v2Ji8l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8F606D808;
	Fri,  6 Nov 2026 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U1v2Ji8l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A6B1F008A4;
	Fri,  6 Nov 2026 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974656;
	bh=7zwmRHEJDXCWohgUl35MLAXmhPV16RPVVjitE2qRsuY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U1v2Ji8le1+bazumS/0/34kHpK0WOYBLwNJE+E5d8O/ArgKFBojWPELtqVGCy5pBZ
	 B5iVh38cRyjX68EdhrG9gn7a4YSMT3K0BxCoTFrCsXmKDTPAtUZMwbP+XYtR6aKxX+
	 RGWz4/bjVt8IeVJz7ddPg4c++DhLpqGiHiT0aaCzITtdCvN0wiGFvwErJZU5tgqLSR
	 3Bk1PKhVEHy2qzeWmyYvMZp2zHln4mvnT/PMxwIQBlmK2WgxXgXZhhlYkr/B0Kw5xP
	 7PSDYWVBo67lFGE0b0ZYQTMninvq/LH52ioCiIn2QhAMrcimQfCsR81D5WQrirsDKR
	 a123Fb7GUXOOw==
Message-ID: <sashiko-outbox-201560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 4/8] dt-bindings: mfd: Add SoC-e SWIP parent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261105-devel-vstrassheim-soce-dsa-ml-v4-4-02f3cde2afa1@linutronix.de>
References: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
 <20261105-devel-vstrassheim-soce-dsa-ml-v4-4-02f3cde2afa1@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:17:35 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: mfd: ranges ordered after
  #address-cells/#size-cells in soce,swip
- [Low] dt-bindings: mfd: mdio@204 ordered before mdio-mux@202 in
  soce,swip
--

commit 801ea0c5b85665a13499e976133e6d6ca196c4a0
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

dt-bindings: mfd: Add SoC-e SWIP parent

This commit adds a devicetree binding schema for the SoC-e SWIP
multifunction Ethernet switch FPGA IP core, describing its shared MMIO
address space and child nodes.

> diff --git a/Documentation/devicetree/bindings/mfd/soce,swip.yaml b/Docum=
entation/devicetree/bindings/mfd/soce,swip.yaml
> new file mode 100644
> index 0000000000000..625be299e262e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/soce,swip.yaml
> @@ -0,0 +1,137 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: soce,swip
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
> +  mdio@204:
> +    $ref: /schemas/net/soce,swip-mdio.yaml#
> +    unevaluatedProperties: false
> +
> +  mdio-mux@202:
> +    $ref: /schemas/net/mdio-mux-mmioreg.yaml#
> +    unevaluatedProperties: false
> +
> +  ethernet-switch:
> +    $ref: /schemas/net/dsa/soce,swip-switch.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +  - ranges
> +  - ethernet-switch
> +
> +dependentRequired:
> +  mdio-mux@202:
> +    - mdio@204
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ethernet-switch@80020000 {
> +        compatible =3D "soce,swip";
> +        reg =3D <0x80020000 0x10000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges =3D <0x0 0x80020000 0x10000>;

[Severity: Low]
In Documentation/devicetree/bindings/mfd/soce,swip.yaml, the properties,
required, and examples sections place ranges after #address-cells and
#size-cells.

Running scripts/dtc/dt-check-style --mode=3Dstrict on this binding reports a
property-order failure because Documentation/devicetree/bindings/dts-coding=
-style.rst
and Documentation/devicetree/bindings/writing-schema.rst place ranges before
standard properties like #address-cells and #size-cells.

Should ranges be moved before #address-cells and #size-cells in properties,
required, and examples?

> +
> +        mdio_parent: mdio@204 {
> +            compatible =3D "soce,swip-mdio";
> +            reg =3D <0x204 0xc>, <0x200 0x2>;
> +            reg-names =3D "data", "control";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +        };
> +
> +        mdio-mux@202 {

[Severity: Low]
Similarly, in both properties and examples in
Documentation/devicetree/bindings/mfd/soce,swip.yaml, mdio@204 is placed
before mdio-mux@202, which causes scripts/dtc/dt-check-style --mode=3Dstrict
to report a child-address-order warning.

Could mdio-mux@202 be ordered before mdio@204 so the child nodes follow
ascending hexadecimal unit-address order?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-devel-vstr=
assheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de?part=3D4
