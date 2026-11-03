Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738247;
	b=acL4JqL95yzsj6lmHWQDRwu1nB9vU1Yvcx+wFPymXpJO7BZ1puuqomSM6wUAbA0dDWUH
	 cSf9MVNI53ewNDOkODCMNz94h1+IzxozHOt3ZKedQmlwfeH0+HHw0SWceSzVZYCTXC5BV
	 xcfuAh/6On0Rk89KpqgC/vj8cGEyaj5aWnAVQcVGdXk5GBuiMqf+3cu57KIe5P2HN9y38
	 2XfF5BQRQeTkODBBURam9ki2vOzxiuzu/6ZFOMccbtaPI5oQbyukSsROtK3J4s4GiRML7
	 RGm8BUnSDP7VMEcZFqzGADkGfcbBwM69afGMsTYRSsd0Cq0MP9n+vI9xdIWQ6rzbvnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738247;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4jECsKV01we93tb+KX8k3fUvMX/oMx8ZJgJvfFLq7iA=;
	b=HqFZ7fA5jPqCXrY0HtHi/deJ+bRaXeQATuhD+9LtRhbbnVhdR7PJZ+qmYWSB9woMccQ8
	 RoGXvvQdouoWrnB15e5o/82zcYJ5RG/JdJvsNgh4Pw9Esd6KUYq29f1DyJE2ZpdUi9Yy+
	 JwCvffzeQDqCIfoh6EHZ4v+sFRkPcXxzaRJolosPgGD34swNe84oR5qefUDMK4xWLOArQ
	 kNlhKDYnboFLkUh8IgxMszc074UFtvdi4g4x7+QQ3UAZP+jatmPXMLK/tosBCRXyI69zn
	 b+2u1sP89KTpURqhDtDcOsy4f/cUjfDQw638wwcCIHpc5UmqFG/moD/EeXKAWSx/Icw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFzHL0iC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BA606A31B;
	Tue,  3 Nov 2026 20:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WFzHL0iC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E0F1F0093A;
	Tue,  3 Nov 2026 20:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793738246;
	bh=4jECsKV01we93tb+KX8k3fUvMX/oMx8ZJgJvfFLq7iA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFzHL0iCpM6+kdjkVst039kPF0JpCWVjGlBVhHZOJKA3HIqIhS9X1fn0b6Q8Fcy+i
	 B9rbFjX90q3ai6A2gwFmglIQfgR+4zGAlSQOG3VfY5NALTHO15rY3/h/LP6CDEr1eF
	 VbEDL4iEcZPvRbb02PyP4AJm4dcx5a5j1F4FAZi51H6iwG/UYM6B1wpa4EOdaNkPT7
	 g0UQagaktzYO0YQURNah/UVDxbM9oRGdEigPbwvxdU01JVHru4peYFkx9crSWSJ98u
	 jH0TKlkPVsXObQnljh0SuSOXRGLLQq8urb5xERTLOQTdIzZG3eWA5//hlBS9xf4rDU
	 jQrKOdmGqPYpg==
Message-ID: <sashiko-outbox-195996@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Document support for Airoha
 AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261103203034.12869-2-ansuelsmth@gmail.com>
References: <20261103203034.12869-1-ansuelsmth@gmail.com>
 <20261103203034.12869-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:37:25 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: mfd: airoha,an8855: missing ethernet-switch node br=
eaks DT ABI
- [Low] dt-bindings: mfd: airoha,an8855: undocumented PHY nvmem-cells in ex=
ample
--

commit 5c22f417efc026df5dc02aca005efec24fec3d06
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC

This commit adds the MFD device tree binding schema for the Airoha AN8855
Switch SoC, documenting its efuse NVMEM provider and MDIO bus child nodes.

> diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/D=
ocumentation/devicetree/bindings/mfd/airoha,an8855.yaml
> new file mode 100644
> index 0000000000000..ee72411548516
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> @@ -0,0 +1,134 @@

[ ... ]

> +properties:
> +  compatible:
> +    const: airoha,an8855
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  efuse:
> +    type: object
> +    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
> +    description: EFUSE exposed by the Airoha AN8855 SoC
> +
> +  mdio:
> +    type: object
> +    $ref: /schemas/net/mdio.yaml#
> +    description: MDIO exposed by the Airoha AN8855 SoC
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - mdio
> +
> +additionalProperties: false

[Severity: Medium]
The description states that the Airoha AN8855 Switch SoC exposes an Ethernet
Switch, an NVMEM provider, and Ethernet PHYs, and the accompanying MFD driv=
er
registers MFD cells for both airoha,an8855-efuse and airoha,an8855-switch.

However, properties in airoha,an8855.yaml omits the ethernet-switch child
node while setting additionalProperties: false, and leaves efuse out of the
required list.

In Device Tree bindings, adding a child node to required after the binding =
is
merged breaks DT ABI compatibility because existing DTBs without that child
node become invalid, and bindings are expected to describe the complete
hardware up front rather than staging child nodes across driver series.

Should the DSA switch schema be included with this series so that
ethernet-switch and efuse can both be documented and marked required from t=
he
start?

[ ... ]

> +            mdio {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                internal_phy1: ethernet-phy@1 {
> +                  compatible =3D "ethernet-phy-idc0ff.0410",
> +                               "ethernet-phy-ieee802.3-c22";
> +                  reg =3D <1>;
> +
> +                  nvmem-cells =3D <&shift_sel_port0_tx_a>,
> +                      <&shift_sel_port0_tx_b>,
> +                      <&shift_sel_port0_tx_c>,
> +                      <&shift_sel_port0_tx_d>;
> +                  nvmem-cell-names =3D "tx_a", "tx_b", "tx_c", "tx_d";
> +                };

[Severity: Low]
In examples, internal_phy1 and internal_phy2 under the mdio node specify
compatible =3D "ethernet-phy-idc0ff.0410", "ethernet-phy-ieee802.3-c22" alo=
ng
with nvmem-cells and nvmem-cell-names =3D "tx_a", "tx_b", "tx_c", "tx_d".

Documentation/devicetree/bindings/net/ethernet-phy.yaml does not define
nvmem-cells or nvmem-cell-names, and no binding schema under
Documentation/devicetree/bindings/net/ documents ethernet-phy-idc0ff.0410 or
these calibration cell names. The example only passes dt_binding_check
because ethernet-phy.yaml sets additionalProperties: true.

Does this need a dedicated PHY binding schema documenting those nvmem
calibration properties before using them in the example?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103203034.1286=
9-1-ansuelsmth@gmail.com?part=3D1
