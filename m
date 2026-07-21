Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE26DCE1;
	Tue, 21 Jul 2026 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637344; cv=none; b=aeyE6DmGEMXn3GPx5BJgp3QPh+CwceK6lJI6vrwEc6F5Jh8/j7PUM3CHyavGwCE9ARanMXLDWeCtyzvlq/rULtuFu3rvXFdUp39pPD0YyyDKKYXKzqsB9FcxF9L7fJr6YV97VAgHvEkTRdNLwBfkh5Ld7i128hge7cfuAiKz6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637344; c=relaxed/simple;
	bh=H/CLHovHEXWnZU+yaC4FhuYKPQ1DF7U/ILWs3PXazAI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U8lGw3uyW+fN7JNyHWLK1dncnXGPT+Rb5xDWg4kleq1molH0XxRaWb+AghfRZ0bk6Nu5fvYDJq/pUgJCEZ8TB5MWqOna7NatpAvv70j1wSkaGMKKDhuo4/ALmp7yd38UpfTXwJhE8ZsTmbSgs7HUvcUVOXNqJ/opfS0HOBjO3WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEYSnW6+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEYSnW6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF591F000E9;
	Tue, 21 Jul 2026 12:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637342;
	bh=HeRJBjI9EPJuombfTX+YWHuvzLjEh0ohfwvESdRne9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cEYSnW6+/ocwRZUtIRkGCHgd16+A/AtKnPjuiiGwb+b6AGJamATdht6FENLBm+k5Y
	 cjKTv8lLdxW+Pt2vAVs09bFIjIYgYcOgRaElDloev6y51QlI60bRQS5PRtZE6Cfkbz
	 R/xrbEQCZGdhqOV/TyV7mEgqAfW245oBPuTANlUSCPgmAt291tUAVM1kkjQbTMbtO4
	 ACHWaTVqtqv0CK2gsBIrfKEOfyTJfrCySjU6DYV7bnwgjNRt+h2G+OsHr1kUrF0wLX
	 EGAiyCaCqgqqTbWQzwJhAm7Ulxn2ntNmbeEeQFRO7RO+x3IVGsyvKXnyiR/dAEulEL
	 CTcO6CyIXz0ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: thermal: loongson,ls2k-thermal: Add
 compatible for Loongson-2K0300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <a87ca6afc11399dbc8c5d99d979aa6ed815b8542.1784619512.git.zhoubinbin@loongson.cn>
References: <cover.1784619512.git.zhoubinbin@loongson.cn>
 <a87ca6afc11399dbc8c5d99d979aa6ed815b8542.1784619512.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 12:35:42 +0000
Message-Id: <20260721123542.7EF591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `reg` property loses its strict size constraints for differe=
nt variants because the explicit `minItems` and `maxItems` bounds were repl=
aced by `items` descriptions inside the `if/then` blocks without restrictin=
g the array length.
- [Medium] The compatible string added to the syscon schema contains a typo=
 (`cphipid` instead of `chipid`).
--

--- Patch [3]: [PATCH v2 3/4] dt-bindings: thermal: loongson,ls2k-thermal: =
Add compatible for Loongson-2K0300 ---
commit 685d641d1fef4db6e1df5ead93f5d8354f9d319d
Author: Binbin Zhou <zhoubinbin@loongson.cn>

dt-bindings: thermal: loongson,ls2k-thermal: Add compatible for Loongson-2K=
0300

This commit adds a new compatible string loongson,ls2k0300-thermal for the
thermal sensor on the Loongson-2K0300 SoC. It updates the binding to make
loongson,chipid required for this new compatible and restructures the regis=
ter
region constraints for each variant.

> diff --git a/Documentation/devicetree/bindings/thermal/loongson,ls2k-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.=
yaml
> index 79e691b08341c..d312e27737a20 100644
> --- a/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/loongson,ls2k-thermal.yaml

[ ... ]

> @@ -34,28 +32,56 @@ properties:
>    '#thermal-sensor-cells':
>      const: 1
> =20
> +  loongson,chipid:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon with the Loongson-2K0300 CHIP ID.
> +

[Severity: Medium]
It appears the compatible string added to the syscon schema for this device
contains a typo: loongson,ls2k0300-cphipid-syscon instead of chipid.

Documentation/devicetree/bindings/mfd/syscon.yaml:
          - loongson,ls1b-syscon
          - loongson,ls1c-syscon
          - loongson,ls2k0300-cphipid-syscon

Given the loongson,chipid property name here and the commit message referen=
cing=20
the chip id, was the cphipid spelling in syscon.yaml unintended?

>  required:
>    - compatible
>    - reg
>    - interrupts
> =20
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - loongson,ls2k2000-thermal
> +allOf:
> +  - $ref: /schemas/thermal/thermal-sensor.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k0300-thermal
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: Thermal base register region

[Severity: Medium]
Does removing the explicit maxItems: 1 constraint here cause a regression w=
here
the reg property loses its strict size limits?

In JSON Schema and dt-schema, specifying items inside an if/then/properties
block does not restrict the maximum array length unless maxItems is explici=
tly
defined. Since the root level allows reg: maxItems: 2, will this configurat=
ion
mistakenly accept up to two register regions for loongson,ls2k0300-thermal?

> +      required:
> +        - loongson,chipid
> =20
> -then:
> -  properties:
> -    reg:
> -      minItems: 2
> -      maxItems: 2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k1000-thermal
> +    then:
> +      properties:
> +        loongson,chipid: false
> +        reg:
> +          items:
> +            - description: Thermal base register region

[Severity: Medium]
Similarly, does this block also need maxItems: 1 to prevent
loongson,ls2k1000-thermal from accepting two register regions?

> =20
> -else:
> -  properties:
> -    reg:
> -      maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: loongson,ls2k2000-thermal
> +    then:
> +      properties:
> +        loongson,chipid: false
> +        reg:
> +          items:
> +            - description: Thermal base register region
> +            - description: Thermal data output register region

[Severity: Medium]
The previous schema explicitly enforced lengths for loongson,ls2k2000-therm=
al
by stating minItems: 2 and maxItems: 2.

Without minItems: 2 here, will dt-schema now accept an incomplete single
register region for loongson,ls2k2000-thermal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784619512.gi=
t.zhoubinbin@loongson.cn?part=3D3
