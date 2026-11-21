Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272805;
	b=u4D34ZgH6djEHlNYMTNemf7mf8eFutEzfjg1jPvubzzMSIpDrU6gJI9fzh08njdIHboO
	 7a9tpFqKc6kMU9C+quS1x+i3iBvPm4yxQ19dltpMtApNxx/ExCeRKIm5iakHT+Vh0e6YH
	 k5X6eCNHrKXTmltJ/qNWxvdDmv8LnBltB1+v8/DxlgOQvNqrYgZweqkB3RPFv8IPI4ZTR
	 CAsoypk8kiP0NeOfkw+bgRnH2HTafMm4p6RolAZmw2H/Dm03p2tXvl6DtL2k8UkwU4/Xc
	 cIl88J/JZIVZlhCV7JeOGzNiyPBlsCrbt/RVQq0pC5bf3Eiu8+vv3YllkQ21c2QV80A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272805;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t8YKsvSsRYdpEtvMqIFjw9Tbp35P4YugTmyFetEXrHs=;
	b=Jnk5h/S87uKv8QKT1wKzPAdg4LmY5S7PDzkofpC5usOJLXgaXLUCB5GdnghmEcKkjPTG
	 DsEQfrdBzdx3cEMQj1OQXnMs54XSnZqoHQ6lhVxLDFrCkEm/PX35jj+XhpaVqo8JIXz8N
	 MiVfPLPcHpopgdg8EBrLtx+B5pdoF99mkkemrGtcYC3hhZIB0/PK/aL4uXbkXyo1+2fA+
	 sN0DMUovIeYPd1ifY9a56HGgxJrlNiT9MR2ERi1b4yRO59SG8qT4VESa5gxbvPcXW9mGg
	 aqKSoP9cltaNPN19WrvYaePkMIOha72xx/HdTacpl5oIrmcQxfF4F+uiLmusUz82ZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nMsSya1j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33969606A332;
	Sat, 21 Nov 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nMsSya1j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9681F000C0;
	Sat, 21 Nov 2026 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795272804;
	bh=t8YKsvSsRYdpEtvMqIFjw9Tbp35P4YugTmyFetEXrHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nMsSya1jjGSjOyrEAOyqkwH99yKMzdsDdtk8G3q0nm6OPla2mpBfJOWr80OPpCU2G
	 UHFHuYFFOELEFL24xt7hVQ5oxWBkw44QpMIbF+Z8VuEUd70p2oTrAg12RGr19TaKtF
	 RHg9+XEjvnuaJa9aYLejfMdt0cI+gUHtj/ro1B8U+qIewCt3xUD4isbR5pNkt3F6J9
	 PhO8G41O6+cYwdebakjGQaqu1iyn9DIepoDMe058npQRC5rWPKADboTyrP22zL7rkI
	 yd8vGHG6LmsafbXcLvPK9Wd9hLgAgSJuYPXbxwBomIjno65Krb9a22p/kwcv76LZ/t
	 E2zPuY+f/tMlA==
Message-ID: <sashiko-outbox-227107@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/9] dt-bindings: net: dsa: Add SoC-e SWIP
 switch function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-3-5de9225715e6@linutronix.de>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
 <20261120-devel-vstrassheim-soce-dsa-ml-v5-3-5de9225715e6@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:53:24 +0000
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

commit 9b06527d85dea0f657bab899811b3c6f614a7cac
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

dt-bindings: net: dsa: Add SoC-e SWIP switch function

This commit adds a Devicetree binding schema for the Ethernet switch
function integrated into SoC-e SWIP FPGA cores.

> diff --git a/Documentation/devicetree/bindings/net/dsa/soce,swip-switch.y=
aml b/Documentation/devicetree/bindings/net/dsa/soce,swip-switch.yaml
> new file mode 100644
> index 0000000000000..55232c0f3675e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/soce,swip-switch.yaml
> @@ -0,0 +1,101 @@
[ ... ]
> +$ref: dsa.yaml#/$defs/ethernet-ports
[ ... ]
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
Should this pattern be ^(ethernet-)?port@[0-9a-f]+$?

dsa.yaml#/$defs/ethernet-ports matches both port@<n> and
ethernet-port@<n> child nodes and evaluates them against dsa-port.yaml#,
so a port@<n> child node under ethernet-ports will pass
unevaluatedProperties: false while bypassing the reg maximum and
phy-mode constraints defined here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-devel-vstr=
assheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de?part=3D3
