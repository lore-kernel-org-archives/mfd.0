Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE403033FB;
	Tue, 14 Jul 2026 17:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050391; cv=none; b=im5DkMt3FAjnDetNob6hrDxW19oeMACayXsF3246orfQ1c44v82nvERyPziZOJ08wV4Oh8vqJjyiKR0KC0mHeITbhKpRjIUOjtbDRynmQpRSeDLLYJt7usy1WDVIljrSpdG5k60qUNX1QcikiwFDAsQiF3PQhxu4Bhmcn4wON1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050391; c=relaxed/simple;
	bh=jgVNe7aH6wXO/r+nW0thdTULUYToh6UZn5K/zcHdklg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XUbIeFTG5G1qzGqPBWfXpLCT566QM3tmsl+s7zl/nyjinh5qA/Fi7oO2aXUqBTWwaLnkrvIcJN3yc2TyiezYlmoAogKQvniard899TLf2pdNM4p6Jz2WDNqxOw208i85SxyBxjfHXWBrXvDGUvfBEXT5ujERzsrV0qTeQxqaFNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzsp8+4F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wzsp8+4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3D91F000E9;
	Tue, 14 Jul 2026 17:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050390;
	bh=TIKYSWtUDZGcqfq436sQvCr9Tpj4N35Pa5EHq0trnbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wzsp8+4F0XT94Ev6KWAyJLSjKoD2laxJxm7SUqbdSvxJJzZLu7pJxXJC6XAcwuVRu
	 rIxxhBZtDEB4rWpEIf6p0q6p6NDc6lPdPdSuaGzXJ/Bx/NY/hQ0hYVmngXoprsSWT7
	 cVjMBpkNQq0Up8RWw9kAQ37KYV/3nFhKcvtSRgh3wGNSMTZnWDZKUtzApynd7+gPHe
	 WM8Fq0CkL13Wark1hAza1/0YIT9F8Q/7QPy69T1jh0g9q260GGTL192b0RZTaIc7Aj
	 zrXVKzdZWynNPgQPE/J5punlK5PQadojZukTap8VSrW8JOoBkPIZaGUrY2NhQpQPgX
	 OksD0KQlg5Mpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode magic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-6-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:33:09 +0000
Message-Id: <20260714173309.9E3D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The dt-schema constraints for the reboot mode cells are applied =
to the outer tuple array rather than the individual 32-bit cells within the=
 tuple, silently bypassing the 0x80000000 minimum value check.
- [Medium] Incorrect use of `additionalProperties: false` alongside `$ref` =
inside the `reboot-mode` node definition.
--

--- Patch [6]: [PATCH v23 06/13] dt-bindings: arm: Document reboot mode mag=
ic ---
commit a9e970af5fba06441f5c9bf2192c866e245aed96
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

dt-bindings: arm: Document reboot mode magic

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentat=
ion/devicetree/bindings/arm/psci.yaml
> index 6e2e0c5518411..11b90e8affb32 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,37 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/cpu/idle-states.yaml
> =20
> +  reboot-mode:
> +    type: object
> +    $ref: /schemas/power/reset/reboot-mode.yaml#
> +    additionalProperties: false

[Severity: Medium]
Should this use unevaluatedProperties: false instead?

Using additionalProperties: false alongside a $ref does not consider
properties defined by the inherited schema (reboot-mode.yaml) or standard
properties injected by the dt-schema core (such as status or phandle).

This can cause dt_binding_check to incorrectly fail on valid device trees
that include standard properties.

> +    properties:
> +      # "mode-normal" is just SYSTEM_RESET
> +      mode-normal: false
> +    patternProperties:
> +      "^mode-.*$":
> +        minItems: 1
> +        maxItems: 3
> +        items:
> +          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
> +            minimum: 0x80000000

[Severity: Medium]
Does this correctly apply the minimum constraint to the 32-bit cell?

In dt-schema, uint32-array properties are parsed as a 2D array (an array
of tuples). Because items is placed directly under the property definition
here, it applies the minimum: 0x80000000 constraint to the first tuple
(which is an array) instead of the first cell (which is an integer).

Since JSON schema ignores numeric constraints on arrays, this silently
bypasses the check and allows invalid vendor-specific reset types.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D6
