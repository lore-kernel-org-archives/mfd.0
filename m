Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795272805;
	b=JXdK/a7VO9pat7wyW08gKQzB0auMhZ3jH5JlFWQZHSRcyE7bpQ31rVofuD77XiqLAZM4
	 2ANEJFqs5c/Ts2KipgjksYzjT/49YKD0tTkUbAOcCLsk+k8X43jTTLKdwGwieXepvZCXR
	 0vNyMEwsq4lJDk3tsCLU9L0uqAWn8K4xAG27mpXa3qzZ+8NEgztF409H60cD//qHpjb/l
	 lwwrD8BqO+Us4rrQNymNjE+vON9F19x9N058g3tIqMXG6rfZNxjsRyN94dDtKhrkoBEUx
	 p+4xKq8ZUeIvJli5lT16SADNdrSE9HL02/d9oWMNWFWgIQS8qlEPmpKcEdCT9+4DIwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795272805;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=B3qdhrkjD6l5KCthtQ9XvDIiehbeeysjLh8lTKROGWg=;
	b=Jxb3mDUbFwk6yuqwkBjjs3deYih1IVMyazyfsX4UAD8IFR9+9uEk1b3rr3IinQ2RAnEv
	 FDvKhjrNPYqnS4cr6RDfL1yJgf6jfLcKhv69oTTRA6nM6ZjxZZ4VYqceSF3hVflAWtIz6
	 f2xrryCpCEQsNdJ/svmurCEhXRr4cLG16Wl6CsZLbbI4s0qbGgj6p6tqfmaEVlotlmqwt
	 Wej74wG86YoSd1zTdIJsFE9NmhzzVQjOzYHHzCzYoqDgnQsiXrAeHdOwGjgwDaViQN/5/
	 8OyE8xGRa/l4AmZYMsbmZEmDI4hA8WRy5HujDHXa+U9xhDcZc0gsrqsF0PZ9rCpxahw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsFWO+Ag;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8F606A32C;
	Sat, 21 Nov 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsFWO+Ag
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 619061F000D0;
	Sat, 21 Nov 2026 14:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795272805;
	bh=B3qdhrkjD6l5KCthtQ9XvDIiehbeeysjLh8lTKROGWg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YsFWO+AgGxWc9IoMs04kpN9hHcY0lBKZXSXX3B7AacP8W5n+MgVXtnapCuSlF5JKJ
	 ngFxVwijjyGP8XJ/c2V387uvjRy61/DoB5u/+u5n03xHMJ/amFbB9SNAAy9sQtbDT6
	 3wzioyLkbel7Ni/bQupK0yevWDlsumusnxTqEF37nAXkCM6RcDRJfZmoV4YS/jE09+
	 JefVqdOnll/msBcUtYpZ2z5AYhW28r7U8JUVWs9pDBaqLJLMgjstJd8vRuqvi447Y/
	 ay6hiyJW1JIjpsfIHYShOxIakw+tXScHGJklYh19SgGYPmK5SFrltdNPDf/U1h/dq9
	 DBaaEXy0vZ8FQ==
Message-ID: <sashiko-outbox-227108@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 4/9] dt-bindings: mfd: Add SoC-e SWIP parent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-4-5de9225715e6@linutronix.de>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
 <20261120-devel-vstrassheim-soce-dsa-ml-v5-4-5de9225715e6@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 14:53:25 +0000
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
- [Medium] dt-bindings: mfd: soce,swip: overlapping switch child and
  split MDIO reg
--

commit beb83bca6b797666b59f03629a91afa93df57a6e
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

dt-bindings: mfd: Add SoC-e SWIP parent

This commit adds a Device Tree binding schema for the SoC-e SWIP
multifunction Ethernet switch FPGA IP core and its child nodes.

> diff --git a/Documentation/devicetree/bindings/mfd/soce,swip.yaml b/Docum=
entation/devicetree/bindings/mfd/soce,swip.yaml
> new file mode 100644
> index 0000000000000..69bb9eae379f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/soce,swip.yaml
> @@ -0,0 +1,138 @@
[ ... ]
> +  ranges: true
> +
> +  ethernet-switch@0:
> +    $ref: /schemas/net/dsa/soce,swip-switch.yaml#
> +    unevaluatedProperties: false
> +
> +  mdio-mux@202:
> +    $ref: /schemas/net/mdio-mux-mmioreg.yaml#
> +    unevaluatedProperties: false
> +
> +  mdio@204:
> +    $ref: /schemas/net/soce,swip-mdio.yaml#
> +    unevaluatedProperties: false
[ ... ]
> +examples:
> +  - |
> +    ip-core@80020000 {
> +        compatible =3D "soce,swip";
> +        reg =3D <0x80020000 0x10000>;
> +        ranges =3D <0x0 0x80020000 0x10000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        ethernet-switch@0 {
> +            compatible =3D "soce,swip-switch-00-04-0c-10";
> +            reg =3D <0x0 0x10000>;
[ ... ]
> +        mdio-mux@202 {
> +            compatible =3D "mdio-mux-mmioreg", "mdio-mux";
> +            reg =3D <0x202 0x2>;
> +            mux-mask =3D <0x07ff>;
> +            mdio-parent-bus =3D <&mdio_parent>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
[ ... ]
> +        mdio_parent: mdio@204 {
> +            compatible =3D "soce,swip-mdio";
> +            reg =3D <0x204 0xc>, <0x200 0x2>;
> +            reg-names =3D "data", "control";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +        };
> +    };

[Severity: Medium]
As reported by Krzysztof Kozlowski on v4 [1], should the parent IP core
and ethernet-switch@0 be combined into the ethernet-switch node instead of
using an MFD wrapper where the switch child claims the entire 0x0..0x10000
parent MMIO range?

Here ethernet-switch@0 claims reg =3D <0x0 0x10000>, which overlaps both the
parent register at offset 0x0 and the sibling MDIO registers at
0x200..0x20f.

In addition, mdio@204 (reg =3D <0x200 0x2>) and mdio-mux@202 (reg =3D <0x202
0x2>) split a single 32-bit MDIO control register at offset 0x200 into two
16-bit halfwords across two sibling nodes.  Handling the mux selector bits
directly in the MDIO controller node and driver avoids splitting one
32-bit hardware register across mdio-mux-mmioreg and soce,swip-mdio, and
allows the MDIO driver to check that the controller is idle before
changing the selected bus.

[1] https://lore.kernel.org/r/20261106-judicious-penguin-of-enhancement-b28=
c8b@quoll

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-devel-vstr=
assheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de?part=3D4
