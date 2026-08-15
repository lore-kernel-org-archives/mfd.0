Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911551F1304;
	Sat, 15 Aug 2026 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786783597; cv=none; b=IrnK8rEw4vb+Z83iqdyFim7bqyx2Qlhkp+A55fItQz+Yiyf3TdGvOcB+JHwzT+vPV7mZgsJ34XVx5sYCsMstHACLDtLAQBibhFJQBP5/SpHPVlZgdDjSdrQzmZROdzYKGZURiVQvJRI3qgIq/T0A7pGoDCPZxdxsQ0YW0vTGo1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786783597; c=relaxed/simple;
	bh=wUNPBXsvILGDPO4Jv66cWXuuoHlGplnDeqfLipvbsaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=teIpB5kqtrltDopB4YGWOmJFQ1wgxXKshDCSdNdkYbYyyyDmFCcoKped97kstb+W9o+kTWci3mo56/0FwTWaMLBgda4qJ+MXxM7aakVYNSZttEjxnvyMBWru6Rl08EoHXXvpmX1em7r9YDkk1M46q3/UZU/QETMV6dwhFiWTHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5WZGNhy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5WZGNhy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECD91F000E9;
	Sat, 15 Aug 2026 08:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786783596;
	bh=pPMNvL26/CUMdrQgK+CaMXY0qkxc35ZY57Fer2DszYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J5WZGNhyQ9eiFQBlCrrI4p6rgWmQoKqZ8dyIry6bZ6Ypu6d3C9vAija9dj0CteSSh
	 2XZojJoOE9NuY81vF0wZFo7PDqp7v1+kHygi8OgUySYxDxpEiVA8KCxot1tGMxEPY0
	 ZZ9yUJsvCtWxIFCXI/mw+PkSTyFWjkPNVr+DdbgoXQJt00mmWWARhOkxNxjss9KGWh
	 zvF1TYfp6cXUTMpZtArX490GTPbuBw356tr0mszmD4eSDxyr2b5YbFzoRETbJ4vR7Q
	 BVfunES56G+WSQYB7JNaumiSWL4mBFZVOU5AmbXAS/aywGVdGDVutJ4n7gmFBry/fX
	 JXIttBvkjPrHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260815083451.2147129-1-egbostina@gmail.com>
References: <20260815083451.2147129-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 08:46:35 +0000
Message-Id: <20260815084635.BECD91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML schema defines incorrect property names for the vibra d=
efault voltages, mismatching the driver's requirements and breaking schema =
validation.
--

--- Patch [1]: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema ---
commit c57af8c690b680b78b9119a5988e020149e24c1e
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: mfd: Convert TI TWL6040 to DT schema

Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
schema.

> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Docu=
mentation/devicetree/bindings/mfd/ti,twl6040.yaml
> new file mode 100644
> index 0000000000000..a93835aa91535
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml

[ ... ]

> +      ti,vibrmotor-res:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Resistance parameter for right motor
> +      vddvibl_uV:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: vddvibl default voltage if it needs to be changed
> +      vddvibr_uV:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: vddvibr default voltage if it needs to be changed

[Severity: Medium]
Does this incorrectly define the property names for the vibra default volta=
ges?

The twl6040-vibra driver actually expects these properties to be hyphenated
and have a "ti," prefix. For example, in drivers/input/misc/twl6040-vibra.c:

twl6040_vibra_probe() {
    ...
    of_property_read_u32(twl6040_core_node, "ti,vddvibl-uV", &vddvibl_uV);
    of_property_read_u32(twl6040_core_node, "ti,vddvibr-uV", &vddvibr_uV);
    ...
}

Since the vibra object sets "additionalProperties: false", won't valid devi=
ce
trees using "ti,vddvibl-uV" fail schema validation?

Conversely, if a device tree uses "vddvibl_uV" to satisfy this schema, won't
it be silently ignored by the driver at runtime?

> +
> +    required:
> +      - ti,vibldrv-res
> +      - ti,vibrdrv-res
> +      - ti,viblmotor-res
> +      - ti,vibrmotor-res

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815083451.2147=
129-1-egbostina@gmail.com?part=3D1
