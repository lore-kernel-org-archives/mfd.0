Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FABC35F5E1;
	Mon, 14 Sep 2026 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408720; cv=none; b=LdGrBqKgqjdtlEmN/3B7KMCW/uJzPxBHgRY8qu0wd0jnAZ2ks+BZHowfBtxV7QczkBL8N2QTnAvEDhm38fATOB7XL4utYw0nRgmwxUT+vR/gYQxMQGMNYLBktWVs6z5gg8G70rtFJiLvP3cSBB88WAGjsEj2QdDpl7ri6vns5AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408720; c=relaxed/simple;
	bh=U+dlreTHMrn8mVodgZLK/9z2doJFXHIt2bExrEmPof8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j+Gm/h2GZlLffW77OitDiip9aBE04tIh03AjaDnsM7deoxjAF54wbyMtEeDtImLKZJFUf10tO1WavnRMHA6vhE6LgWMQz9CUISkBxsgJB6uAerczdzX1LxARTGbVLSwHBHnUHX3ceI6RLKDjFPYGG0xl9YNugzXYo1GLr4e8YRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzAj6iGk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzAj6iGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B6D1F000FF;
	Mon, 14 Sep 2026 17:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789408718;
	bh=IhOQ8GEXdd7uvsZfUmQgjqmO71kvlQhQHpEUuxQmZpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZzAj6iGkGz2QzwVb22oW27D86y4wW2Tl8olT69zfrhJ872NmkUDJ4LVSQ/lnEP1Xy
	 jsH3J5lyR4ihAZ7M3UW0KVRnaxcc6869kmOCuVz8tsUCJu7bfaO9zPOYTFoiokkQjq
	 5XF1dRnCBYrHcXzMuzYsusG/B5iCCIoRdX2lni3K4CN5Vdsc0hUrWTrdRB6hpaefR1
	 ifHyrzOZMRqu/ODvwqK5I+j4IM37cQJtvgMM7a6mwtGtFMYueLu8N511bNm23HuqnD
	 kSqAkaR8Q3XG9ilZypm7+QR+mD0xk8me+qgjKaADL6rnd14ZSjTgnbxniuayzsvdD+
	 fM4iWHB2n5evA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: as3722: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shaunak Datar" <shaunakkdatar@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914174440.104115-1-shaunakkdatar@gmail.com>
References: <20260914174440.104115-1-shaunakkdatar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 17:58:38 +0000
Message-Id: <20260914175838.79B6D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The YAML schema artificially restricts the PMIC to a single pinm=
ux state node by hardcoding the node name to `pinmux`.
- [Medium] The `interrupts` property is missing from the `required` list in=
 the YAML binding despite being strictly required by the MFD driver.

Pre-existing issues:
- [High] The regulator driver incorrectly rejects `ams,ext-control =3D <3>`=
, preventing configuration of the ENABLE3 external control pin.
--

commit a75df0e5820c75f9d84e306c3842971fc178f5d3
Author: Shaunak Datar <shaunakkdatar@gmail.com>

dt-bindings: mfd: as3722: Convert to DT schema

Convert the AS3722 PMIC binding from the text format to YAML Schema to
enable DT Schema validation.

> diff --git a/Documentation/devicetree/bindings/mfd/ams,as3722.yaml b/Docu=
mentation/devicetree/bindings/mfd/ams,as3722.yaml
> new file mode 100644
> index 0000000000000..065537f50e063
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml
[ ... ]
> +  ams,system-power-controller:
> +    type: boolean
> +    description:
> +      Boolean, to enable the power off functionality through this device.
> +
> +  pinmux:
> +    type: object
> +    additionalProperties: false

[Severity: Medium]
Does this hardcoded node name artificially restrict the PMIC to a single pi=
nmux
state node?

Device trees requiring multiple pinctrl states (e.g., default and sleep) wi=
ll
fail schema validation if they define multiple state nodes. The schema uses=
 a
fixed pinmux property name and additionalProperties: false on the root, whi=
ch
rejects any other node names. Would it be better to use patternProperties
(e.g., "^pinmux(-[a-z0-9-]+)?$") to allow multiple state nodes?

> +    description:
> +      Pin control setting at boot. Each subnode represents some desired
[ ... ]
> +          ams,enable-tracking:
> +            type: boolean
> +            description:
> +              Enable tracking with SD1, only supported by LDO3.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - "#interrupt-cells"

[Severity: Medium]
Is the interrupts property missing from this required list?

The PMIC driver unconditionally fails to probe with -EINVAL at runtime if t=
he
interrupt is absent (as3722_i2c_probe() calls irq_get_irq_data(i2c->irq)).
Device trees missing the interrupts property will silently pass schema
validation but fail at runtime. Adding interrupts to the required list would
accurately reflect the hardware and driver dependencies.

[ ... ]

While reviewing this binding conversion, I also noticed a pre-existing issue
in the regulator driver.

drivers/regulator/as3722-regulator.c:as3722_get_regulator_dt_data() {
    ...
		ret =3D of_property_read_u32(reg_node, "ams,ext-control", &prop);
		if (!ret) {
			if (prop < 3)
				reg_config->ext_control =3D prop;
			else
				dev_warn(&pdev->dev,
					"ext-control have invalid option: %u\n",
					prop);
		}
    ...
}

[Severity: High]
This is a pre-existing issue, but does this off-by-one check incorrectly re=
ject
ams,ext-control =3D <3>?

A valid device tree specifying ams,ext-control =3D <3> is validated with
if (prop < 3), which rejects 3, warns the user, and defaults to 0 (no exter=
nal
control), despite as3722_extreg_init() explicitly supporting
AS3722_EXT_CONTROL_ENABLE3 (3). Should this check be prop <=3D 3 so the ENA=
BLE3
hardware pin can be correctly configured?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914174440.1041=
15-1-shaunakkdatar@gmail.com?part=3D1
