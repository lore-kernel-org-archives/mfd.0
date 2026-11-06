Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974656;
	b=zYM9AgeDcgo+/3ch1v+B6Y/CdKHrCboaHO4VeadmtbnpcQgKynCOVO/yPtMjCB49bvPE
	 tyNgRZLuzjPT/2P1LfoWI9uzgQrSyuApd7xSt3kSZYQbm1nPsdxVuE/LZVBoUJGaXVH5z
	 cSvTxtlGLg7EzaUO+PHoO7j4ERXjVzpk/IyqAwQsw/vBNpnVsmxZALe4BNhNqo7YdQkGO
	 5kJQkGQFN4MtW/luuuU5mpdxGm/VkycUAYDWo+OfTOyaNWCrcrivWB5MDTHO5QON0RY+a
	 oL48HyVg+e269Oo2Z0znrccIGRyfdDph6lYufANT8ZS3qr4a3qc6IwgwHEq1nXQO1Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974656;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Td15fB+eiBPCi28XCvVsez3qTzvKnOgbIC421Ms2QF8=;
	b=x9beR068g1W7/lIHBU8AIyiR86K9Y/El/8Erc5w4ZQoD2yZPOei+Dk9xSo/ZAQ9yEE0d
	 rmEOsLmeUHND6dMy01uSTXBiHRIKqg7uSZnSbN4SgK+r9ZE+apwlQGkJWEI9U6xvVTw8C
	 A5SQySDgDFcEbJ8LGr0HfkQQJTtogiZCaYzY2mv/qH+8PakqXeY3vBHQh5PWXPWt5sp02
	 U7HY5c2LX4SyxTCAGtMjk4sl2wqA4/a+86+/F9rqRnfn0zvgduVA3OG4PGfr0xVGPCHB1
	 VvbzLqtDwfSvds9Y6uqE7VjHh9WCRl0iAuX8G6hjAj1kRC/PGPGfESmxpKFaJq/v/CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPrdcRxU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7350606D80C;
	Fri,  6 Nov 2026 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nPrdcRxU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323E11F0089F;
	Fri,  6 Nov 2026 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974655;
	bh=Td15fB+eiBPCi28XCvVsez3qTzvKnOgbIC421Ms2QF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nPrdcRxUCuqpDqiUpIU4RPGUb4TyIXtHjCMHTonbJ4xh10oBmHsitzRY4jeWszsWK
	 IVx3yNgH3Vaui8ymmi6MRWjZAaJjhDpdCk8J65slsXHPV0O8zNpPyB452zVF0vQMPy
	 bh8T2SroVSjT/AQ11WWrKZcK+GlkNAoHM+bChvUKZs1iCgpqlIDpj2dHVD/jRkD9Lx
	 bXOxI0wVDjisFIyI4bEwgj7DPcrJK0zE+e+OBuPR42DzJJPXDhYSsP+sBWwS2QkiQv
	 cB7in4ZEyjGiF+zUMfb/qc4oLi6rFkKl6Qn0E2D9eKAQ4McZDHrVCnQIu0GgSGZ/lj
	 e/Jb8Ou4iMy7w==
Message-ID: <sashiko-outbox-201559@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/8] dt-bindings: net: dsa: Add SoC-e SWIP
 switch function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261105-devel-vstrassheim-soce-dsa-ml-v4-3-02f3cde2afa1@linutronix.de>
References: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
 <20261105-devel-vstrassheim-soce-dsa-ml-v4-3-02f3cde2afa1@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:17:34 +0000
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
- [Low] dt-bindings: net: dsa: soce,swip-switch: port@ nodes bypass port
  constraints
--

commit 4683eac7073869a69dfbcd2a3c82b050378eb665
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

dt-bindings: net: dsa: Add SoC-e SWIP switch function

This commit adds a devicetree binding schema for the Ethernet switch
function integrated into SoC-e SWIP FPGA cores.

> diff --git a/Documentation/devicetree/bindings/net/dsa/soce,swip-switch.y=
aml b/Documentation/devicetree/bindings/net/dsa/soce,swip-switch.yaml
> new file mode 100644
> index 0000000000000..daac779c466d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/soce,swip-switch.yaml
> @@ -0,0 +1,96 @@
[ ... ]
> +$ref: dsa.yaml#/$defs/ethernet-ports
> +
> +properties:
> +  compatible:
> +    const: soce,swip-switch-00-04-0c-10
> +    description:
> +      This compatible identifies the register layout; its suffix gives
> +      the offsets of the core version and feature identification
> +      registers (0x00, 0x04, 0x0c, and 0x10). Port counts and optional
> +      features depend on the FPGA synthesis configuration and are
> +      detected at runtime using this register layout.
> +
> +  reg: false
> +
> +  reg-names: false
> +
> +  ethernet-ports:
> +    type: object
> +    patternProperties:
> +      '^ethernet-port@[0-9a-f]+$':
> +        type: object
> +
> +        properties:
> +          reg:
> +            maximum: 30
> +            description: Switch port index, from 0 through 30.
> +
> +          phy-mode:
> +            enum:
> +              - mii
> +              - gmii
> +              - rmii
> +              - rgmii
> +              - rgmii-id
> +              - rgmii-rxid
> +              - rgmii-txid
> +
> +        required:
> +          - reg
> +          - phy-mode

[Severity: Low]
Because this schema references dsa.yaml#/$defs/ethernet-ports, which
matches both port@<n> and ethernet-port@<n> child nodes via
^(ethernet-)?port@[0-9a-f]+$ and marks them as evaluated for
unevaluatedProperties: false, any board devicetree using port@<n> child
nodes under ethernet-ports will be accepted by dsa.yaml without triggering
the patternProperties constraints here.

Would it make sense to change the pattern under ethernet-ports to
^(ethernet-)?port@[0-9a-f]+$ (or explicitly disallow port@<n> nodes) so
that port@<n> nodes cannot bypass the reg maximum and required phy-mode
checks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-devel-vstr=
assheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de?part=3D3
