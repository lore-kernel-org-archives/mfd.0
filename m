Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE916364929;
	Mon,  3 Aug 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751778; cv=none; b=SLqs8A57sj+pr4jamh/ylRb3XR+YaUAFzL94ld2nWrOCPToU8eQWiOSne3MyRDwyrYX2IyijnWrOEH0KiiCGaDwGBXiGFmt16h/X4YOSq6rc1gF5K9ILwoNChpUdFt26rq7ic7BCA9ZHg1xjeVHj0haz1wl7BTTW1MP3cxlKdLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751778; c=relaxed/simple;
	bh=3F0Rhjnl/CIiKLtTJ9rapzzhbDouGaXIzYO4EHyhIEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pQczM3ER+VIun54jzGYyRIfnpLQ9GLboIxfc5v001JsLzCtdCmcAJVLbfHJFqztJ2exujGWH1IWE2oTA3jF0HtKl+NGu7e6mNY+z7MzTcnKmckK7TciWlUKUh7fd5svB+1wpthx0ci+tLpQLQ9b/uaNmVMIrmp5+99w/4o/fQ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4zJbren; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4zJbren"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E40E1F000E9;
	Mon,  3 Aug 2026 10:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751776;
	bh=B2A3gBhTb6UVUouYL56CgSeSuI6FRkjhh/Hd2yImmmI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X4zJbrenKlfyoMoxH+4DP4rbxIsPbUCS/AOxUkawdpt/rbxYBf1NIewa7LU/BZe9S
	 9PEzLOtoaxV9pW+nWvtxQslsk1cQjWxQiKqlT21J3WYzJuapMvgQRmgI94ujiuVuIc
	 /wVLb3DfT0dNXAO9Q3lDzlw66PxRF4Vr3ReBXzw0cQ2LhX7SQWtG3vfn4vLYlrbc2p
	 R6pwi+qLY8wPMLqlKeRASKLtmEfxF+BvjRTuxaAZEAdVRwIa4lvxEP7lCGc2Qg+jdM
	 fuIsfeqvqT66HFHKULiefV1wxKbCsU+hz5h2N1QXWUP+XjBf4ixN8Ux+kms1FX7isZ
	 grcQ6fzTeZDcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode magic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-5-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:09:35 +0000
Message-Id: <20260803100936.3E40E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect tuple validation of a 2D `uint32-array`, applying oute=
r array constraints and invalid property-level type `$ref`s to inner elemen=
ts, breaking validation and dropping the `minimum` constraint.
--

--- Patch [5]: [PATCH v24 05/12] dt-bindings: arm: Document reboot mode mag=
ic ---
commit 27b283c27fa751f1b79c98734e61c56bbcfb0f0f
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

dt-bindings: arm: Document reboot mode magic

This commit adds bindings to describe vendor-specific reboot modes in the P=
SCI
SYSTEM_RESET2 call. The values defined here correspond to valid parameters
for vendor-specific reset types.

> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentat=
ion/devicetree/bindings/arm/psci.yaml
> index 6e2e0c5518411..7d6a86690a2e5 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,41 @@ properties:
[ ... ]
> +    patternProperties:
> +      "^mode-.*$":
> +        minItems: 1
> +        maxItems: 3
> +        items:
> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - minimum: 0x80000000
> +          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-=
cell form)
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +          - description: arg3 (cookie_lo in 3-cell form)
> +            $ref: /schemas/types.yaml#/definitions/uint32

[Severity: Medium]
Will this schema correctly validate the property values?

Since dt-schema parses device tree arrays as 2D arrays, applying JSON Schema
items list validation to the outer array evaluates the entire inner tuple a=
s a
single element against the schema for arg1.

This regression can cause dt_binding_check to reject valid device trees bec=
ause
it ends up validating a 1xN array against uint32, which expects a 1x1 matri=
x.

Because JSON Schema ignores minimum constraints when applied to an array, i=
s it
possible this silently bypasses the minimum constraint of 0x80000000?

Should this pattern property reference /schemas/types.yaml#/definitions/uin=
t32-array
with the element constraints applied natively under it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D5
