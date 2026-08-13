Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AE238F255;
	Thu, 13 Aug 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639279; cv=none; b=lbb3Zb464DkURYdHBocgrDEmGG0IFCFJTixITNy/5aD6FXay6RZ994agc2MqTILI+ip2fNx7/o8tgIeFU0S5wFBSTCe+90XHP1cuhaKENPpAIwqI9bu+dRl+b/7rMOH5pA0yBsbfSgF24GiUEsgagyFbjGjavOYDVYy4xvsfGaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639279; c=relaxed/simple;
	bh=0bwmJeNyCqI3s4pqwSR+oPLhYwLzolKtFG3m/bwsJWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y4aDtrmck3FPpYupf9AQ+HAMT3Vb3REE9KABSPVbaSqVwmtyz1B7sMzl59jB9l1l/x1HqroufvJmhqYR7Lv7Q5C8GGvWZDodGobtUFwTc5EgO0aq56yITucFrSIjfA2oabTv7JEzJBn011qIvPiwZ2c8rTnFlHnEbTn3NLckPrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8EQc9zm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8EQc9zm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8F01F00A3A;
	Thu, 13 Aug 2026 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786639278;
	bh=X7gjPEHQnaOK/mGsrsovGlLsMy8sL0TXykMuyukjubA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c8EQc9zmoAk1XBLFtoglrp1oVFgcflK5GNnMODJUlmE3wutafXNW6I3gUJ4TQ4rgC
	 RI/G9DcWBPNTByFnB36qMlZ1f/MLs33EArN1kB+aZfhRyblcdPwYfxIt48oy41xX+X
	 MgBX2cAn6k/AXefRWpGpxNoIM+jzCX08Hd8YqkLBySGLZVG7jdYbq0kKddHW/ecoKT
	 oJ4AQfvlXtXEs8xBaKiEp4a8YYvpiX736tyNcDl+V8pjS8qAh02SU7zOPbQ30QGb3G
	 1JRR9zRHuv2kmSIlQs5yqLT/qdLjjIHsbG0Pl4e46OuUvut2/EFrbfAZyCQ875IP4o
	 hs75TdJWMOdmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>
References: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 16:41:17 +0000
Message-Id: <20260813164117.DE8F01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema enforces non-compliant, legacy device tree node names=
 (containing underscores) for child nodes via `patternProperties`, blocking=
 the use of standard generic names and contradicting the commit message.
- [Low] The YAML example references undefined phandles (`&devctrl` and `&pl=
lctrl`), which will cause a fatal `dtc` compilation error during `make dt_b=
inding_check`.
--

--- Patch [1]: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT=
 schema ---
commit f59b6bface010fc243ef7f899dbb8dddf737e2c5
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema
   =20
Converts the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema. Adds "simple-mfd" support, enforces child
bus properties, and adds validations for standard child nodes.

> diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.ya=
ml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
[ ... ]
> +patternProperties:
> +  "^keystone_dsp_gpio@[0-9a-f]+$":
> +    type: object
> +    description: Keystone DSP GPIO controller
> +
> +  "^keystone_irq@[0-9a-f]+$":
> +    type: object
> +    description: Keystone DSP to ARM interrupt controller

[Severity: Medium]
The commit message mentions updating node names to conform with standard
Devicetree specifications. However, these patternProperties enforce names
with underscores like "keystone_dsp_gpio" and "keystone_irq".=20

Does this block the use of standard generic names (like "gpio" or
"interrupt-controller")? Because additionalProperties is false, using gener=
ic
names in a DTS file would cause validation errors. Could these patterns be
updated to match generic names instead?

[ ... ]
> +examples:
[ ... ]
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    device-state-control@2620000 {
> +        compatible =3D "ti,keystone-devctrl", "syscon", "simple-mfd";
> +        reg =3D <0x02620000 0x1000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +        ranges =3D <0x0 0x02620000 0x1000>;
> +
> +        keystone_irq@2a0 {
> +            compatible =3D "ti,keystone-irq";
> +            reg =3D <0x2a0 0x4>;
> +            interrupts =3D <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <1>;
> +            ti,syscon-dev =3D <&devctrl 0x2a0>;
> +        };
> +
> +        reset-controller@328 {
> +            compatible =3D "ti,keystone-reset";
> +            reg =3D <0x328 0x10>;
> +            ti,syscon-pll =3D <&pllctrl 0xe4>;
> +            ti,syscon-dev =3D <&devctrl 0x328>;
> +            ti,wdt-list =3D <0>;
> +        };
> +    };

[Severity: Low]
The example uses phandles for &devctrl and &pllctrl, but it appears these
labels are not defined in the example block.=20

Won't this cause a fatal dtc compilation error during make dt_binding_check=
?=20
Could we define these labels on the parent node or a dummy node in the=20
example so that the build succeeds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-ti-keyston=
e-devctrl-v1-1-6f0aa87d9af8@gmail.com?part=3D1
