Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD1A4EE874;
	Mon, 28 Sep 2026 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613188; cv=none; b=D+Zsc4aawj/c7h3N4N6I/uUJfNIzm7x7MRTwD5mZbyFOfCLg4hJSbYw3UxzzApEcl67U3AWMIkv/VhiWT+71Hi8YbsPDa3VdwgGGrjL7/0vi5v0+cTu0+x2b2YKfQrYMV1iVrUcMtXllc+ITiyqm4oZaMejXNigtfap0fHH3FLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613188; c=relaxed/simple;
	bh=YN5oZf+nb1Abl2tW2AjgzdUMyCIGKfT451kkYbr32aw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KFXXPw2oWrlDqsC777YZVit7nBI/KKVsGHYfPqOfIltffLZqOO7hc5/Z47AHYW2/pIz8sB7Cvnb9VK2jQZf+Z/8Avh2E+uVqnI0lWWxUifbHUOb5mK/S4ZQHu51U2ra4tuRylkRniuz46lwvkItb1wvEnY8istJhXM2hGc0jH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCyZajAx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCyZajAx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9531F000FF;
	Mon, 28 Sep 2026 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790613187;
	bh=2st5WPmMY1KRVxiNWWjebzO9dQdnaOGdWBjeDh3UJ/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SCyZajAxT78YMyDxCQYTpzJ+O31Hi+Z0YQUGjLbN8jNvNrdh830zN7s9AfiHp/yXi
	 f8QPRHjuGt71x6G8xzafUo+r7SNhSSODkicr1fi+kEj0XJ1ohskFb9zX8m3+tXeYt4
	 5LjdwHo3ZSRH10/oi+7unzLqT3FIH1OVHRgd51TVhNrp0ESOcqkizL0aDVsJMcjEnb
	 s0qAZgvaXJl0wHCpb5JnOli8hMrrrCuDR2SscyAW7J8AIr8EISWNly4Zq6R4qGlhk5
	 4VMvzoZuhHSpjqhsaVVe9c8NIOiX13oFLS4MbXG6wHRp24n5Cnw9oW1SMn8FKiE/R7
	 uRfeglD2MWKOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: as3722: Convert to json-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260928-as3722-bindings-v1-1-35f423a9f2b2@nvidia.com>
References: <20260928-as3722-bindings-v1-0-35f423a9f2b2@nvidia.com>
 <20260928-as3722-bindings-v1-1-35f423a9f2b2@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 16:33:06 +0000
Message-Id: <20260928163306.BB9531F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] dt-bindings: mfd: missing const constraint for gpio-cells
- [Medium] dt-bindings: mfd: additionalProperties false breaks validation
- [Medium] dt-bindings: mfd: missing core regulator schema reference in sub=
-nodes
- [Medium] dt-bindings: mfd: missing additionalProperties in container nodes
- [Low] dt-bindings: mfd: missing required GPIO provider properties
--

commit 3390b1809db67797a4f31079a198e4285905107a
Author: Thierry Reding <treding@nvidia.com>
Date:   Mon Sep 28 16:24:40 2026 +0000

    dt-bindings: mfd: as3722: Convert to json-schema
   =20
    Convert the AMS AS3722 PMIC bindings from the free-form text format to
    json-schema.

> diff --git a/Documentation/devicetree/bindings/mfd/ams,as3722.yaml b/Docu=
mentation/devicetree/bindings/mfd/ams,as3722.yaml
> new file mode 100644
> index 0000000000000..6a64445003966
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml
> @@ -0,0 +1,276 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---

[ ... ]

> +  # from gpio.yaml
> +  gpio-controller: true
> +  "#gpio-cells": true

[Severity: Medium]
Does this schema allow invalid configurations for "#gpio-cells" (e.g., <1>
or <3>) to silently pass validation instead of enforcing the hardware's
actual requirements? The DT bindings subsystem guidelines mandate that
each cell-count property must have a const constraint matching the hardware.

> +
> +  # optional properties
> +  ams,enable-internal-int-pullup:

[ ... ]

> +  pinmux:
> +    type: object
> +    description: |
> +      Device has 8 GPIO pins which can be configured as GPIO as well as =
the
> +      special IO functions.

[Severity: Medium]
Does this pinmux object definition omit additionalProperties: false? If
omitted, invalid or misspelled child nodes under pinmux might be silently
accepted instead of being flagged as errors since additionalProperties
defaults to true.

> +
> +      Please refer to pinctrl-bindings.txt in this directory for details=
 of
> +      the common pinctrl bindings used by client devices, including the

[ ... ]

> +        required:
> +          - pins
> +
> +  regulators:
> +    type: object
> +    description: Device has multiple DCDC and LDOs. The node "regulators=
" is
> +      required if regulator functionality is needed.

[Severity: Medium]
Like the pinmux node above, does this regulators object also need
additionalProperties: false to ensure invalid regulator nodes (e.g., sd7
or ldo8) do not silently pass validation?

> +
> +    properties:
> +      vsup-sd2-supply:

[ ... ]

> +      vin-ldo11-supply:
> +        description: input supply for LDO11
> +
> +    patternProperties:
> +      "^(sd[0-6]|ldo[0-7]|ldo9|ldo10|ldo11)$":
> +        type: object
> +        description: These sub-nodes must be named after one of the regu=
lators
> +          found on the AS3277. Each sub-node should contain the constrai=
nts and
> +          initialization information for that regulator.

[Severity: Medium]
Do these regulator sub-nodes need to link to the core regulator schema
using a reference to /schemas/regulator/regulator.yaml#? Without this
reference, standard regulator properties like regulator-min-microvolt
are unvalidated and typos will be silently accepted by the schema checker.

> +
> +        properties:
> +          ams,ext-control:

[ ... ]

> +          ams,enable-tracking:
> +            $ref: /schemas/types.yaml#/definitions/flag
> +            description: Enable tracking with SD1, only supported by LDO=
3.
> +
> +additionalProperties: false

[Severity: Medium]
Will this strict filter fail to account for properties brought in by refs or
standard core schemas like gpio.yaml? Using additionalProperties: false
only evaluates properties explicitly listed in the local properties block,
which will falsely reject valid standard properties. Should this be
unevaluatedProperties: false instead?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - "#interrupt-cells"

[Severity: Low]
Does this required list omit the mandatory provider properties for a
hardware device acting as a GPIO controller? The subsystem guidelines
explicitly state that hardware provider capabilities must be included in
the required list (e.g., gpio-controller, #gpio-cells), otherwise
incomplete device tree nodes can pass schema validation.

> +
> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mfd/as3722.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        pmic@48 {
> +            compatible =3D "ams,as3722";
> +            reg =3D <0x48>;
> +
> +            ams,system-power-controller;
> +
> +            interrupt-parent =3D <&intc>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <2>;
> +
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +
> +            pinctrl-names =3D "default";
> +            pinctrl-0 =3D <&as3722_default>;

[Severity: Medium]
Will the inclusion of pinctrl-names and pinctrl-0 in this example trigger
validation failures, since they are missing from the schema's local
properties list and additionalProperties is set to false?

> +
> +            as3722_default: pinmux {
> +                gpio0 {
> +                    pins =3D "gpio0";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-as3722-bin=
dings-v1-0-35f423a9f2b2@nvidia.com?part=3D1
