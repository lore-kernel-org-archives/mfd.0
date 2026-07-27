Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E0426693;
	Mon, 27 Jul 2026 18:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177123; cv=none; b=niCqDhrPeSXvmNMRb+G0Rj2drSdjyb17DJcPWkBgm/SNGEhnN6fXD9Kav0Y4ODt+Tb1/JUcK3/cMLcBEdua0/p3AcM+c9DHKygLQQtXu6Y+L09mgHq5CR9l33xmrrG9q0ZGTaOfgrbiSMBYFRVboDhw8Gs1/yiTVNVeIDgzFhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177123; c=relaxed/simple;
	bh=dlNlQLtQA7Eu1LpHNaYDErrnqTratFykeZk4pRryKf4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rWGYaJlYpU9/apM1bxTXxspRC0Tnla8ud9uuIs7/HTvX5Wur98UsFkdtHzEK0XnQplehDVlbHAjN5HUou6jhV4BV5NXSIugTYnVyb2OAc5k9zhpxsicdy4vbHx7oNbmNPlevikNmHbJjkwxU2D4sWXTZcMr9lhwm3THL9t1CjiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9G4Noc+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9G4Noc+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916701F000E9;
	Mon, 27 Jul 2026 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785177121;
	bh=7Udjanb1H9DVNjKGgmxcH/tjWmgiPuzp3pwFGTaMhmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V9G4Noc+EdYO6HXq/u9R/BuAP0uSG4ZBc/3n3gX4o5R3wJJpvc5TSnMTAe8fXULcS
	 k7OX9b5EtBI95nurFYaG4A6VhmK+1UK3xifrZ3s0DI30GBiehwlC0NoUkpQ50pu8/m
	 MM30UitdJqqW5hDGuQIBRY4xu0daTsVaOEW17MFt9a5azBWx83DgFllt2PKRB5T7vm
	 wZ+FusNoBku8WXJMCvQ1tZKz2clcYFLxzxilrwTVJ74f1Dq+p/GveOiZpBL3S4vBhh
	 SshkrHvaxXe3MZcqIOZOLFaeUEuzaD5rJkpcwFJLbZLvOWvVi9Yqdo2AXeDc71zKSv
	 Br0nePmae/PzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, mfd@lists.linux.dev, vkoul@kernel.org, conor+dt@kernel.org, lee@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260727-zx29clk-v8-1-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-1-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:32:00 +0000
Message-Id: <20260727183200.916701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Self-referencing cyclic dependency enforced by required `resets`=
 property on the reset provider itself.
--

--- Patch [1]: [PATCH v8 01/12] dt-bindings: clk: zte: Add zx297520v3 top c=
lock and reset controller ---
commit bd10e0d2ede4b7523e3aa201c9dc948ccee1e352
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
Subject: dt-bindings: clk: zte: Add zx297520v3 top clock and reset controll=
er

This commit adds a new device tree binding for the ZTE zx297520v3 top clock
and reset controller. It describes the clock inputs, PLL outputs, and reset
controls for various peripherals. The binding also exposes USB and HSIC PHY=
s,
and a syscon-reboot method.

> diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcr=
m.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
> new file mode 100644
> index 0000000000000..9dbca49871a0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
[ ... ]
> +  interrupt-names:
> +    items:
> +      - const: usb-up
> +      - const: usb-down
> +      - const: hsic-up
> +      - const: hsic-down
> +
> +  resets:
> +    items:
> +      - description: USB phy reset
> +      - description: HSIC phy reset
> +
> +  reset-names:
> +    items:
> +      - const: usb
> +      - const: hsic
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  syscon-reboot:
> +    type: object
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +    description:
> +      Reboot method for the SoC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names

[Severity: Medium]
Is it necessary to make the resets property required here?

Since this node is also the reset provider (indicated by #reset-cells),
requiring it to consume its own resets creates a self-referencing cyclic
dependency during device tree probing.=20

Could the driver interact with its own registers directly to handle these
resets, rather than acting as a reset consumer of itself?

> +  - syscon-reboot
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - "#reset-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
> +    #include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    topcrm: clock-controller@13b000 {
> +        compatible =3D "zte,zx297520v3-topcrm", "syscon";
> +        reg =3D <0x0013b000 0x400>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +        interrupts =3D <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names =3D "usb-up", "usb-down", "hsic-up", "hsic-down";
> +        resets =3D <&topcrm ZX297520V3_USB_PHY_RESET>,
> +                 <&topcrm ZX297520V3_HSIC_PHY_RESET>;

[Severity: Medium]
Does modeling the internal register operations as external consumer
dependencies artificially create the dependency cycles mentioned in the com=
mit
message?

The example explicitly demonstrates the self-referencing cyclic dependency
back to the topcrm phandle. Typically, it is an anti-pattern for a reset
provider to model its own internal signal lines as external dependencies
pointing back to itself.

If the driver handled its own internal reset logic directly, this cyclic
dependency could be avoided without relying on fw_devlink to forcefully bre=
ak
it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D1
