Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A13BBFAE;
	Tue, 18 Aug 2026 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043802; cv=none; b=S9HHaXcec9GOeQolgZ8SkfUXzok492A504oV3qtRsubaVlfY+7QTatCI/g6hQ5/PwOIQ8bj8X5mRXXxv0IdBXwOCHDX8BNpOH2vF6gCJzpwUQz348tniK9nv6vLz/A2e5KmSd+bpLMo53pYo7PmpP1KKxVcP37qFzB/Ky3R18IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043802; c=relaxed/simple;
	bh=jBFuATB5epOape5Xk5Pzviz5BtElDbEvZN/IJZAfZ9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PXAjuNrrC/B+QhDDrdgGmXl/sylFlr8A5xiTOtEWoKRdayPppM5vVP5Z2XezrQlqV2nCdRDqyxeAppaPCnvvdIFJkQOBmO5NK3fOpjrzewiNSz54ZWUjTU+twuZSAYDJuGlpZ1WptlEKKbVNNC+n/hhSCHRHwitZxAkre7AwcAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJsrX38T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJsrX38T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70221F000E9;
	Tue, 18 Aug 2026 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043800;
	bh=CeePKBm+dYGAE88eRVa49qlM5Ex5GEfAz8Fz2sjZz1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fJsrX38TTJTtNOAXR5GZIca4J2sWkFYapdQN6ElNsOkvwNOMfjfVdySMYnDlu7qBY
	 vOgl2dohYhqlt6W1BPEBGiK3ksLDxqCsXXDEg4RGqsYjx6+NW+6k3cumoxthYFfa/E
	 NRkAJdUlskgzQEr/PV+gsM5IWDNzQBLUsdVhZJFiFHwxnpRlhZeG7uT+GfHv7CroJK
	 z9z0Fgx6mee3SL+IDzf/jtfrpO27Ax+wmgQF63SHBlwQTm3BAWhinIrsLrN4lhbECR
	 mg866zzI1qquSQ3i5uscjSvW63WPM7K8n0D8qH1R59qs3YqfCy4Za5wyFm4+jrECsO
	 3vqEiBV/u47Mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 03/10] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260817082034.20326-4-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
 <20260817082034.20326-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:03:20 +0000
Message-Id: <20260818090320.A70221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `mdio` node explicitly sets `unevaluatedProperties: true`, disa=
bling strict schema validation for its contents.
- [Low] The `reset-gpios` property lacks an item count constraint.
--

--- Patch [3]: [PATCH net-next v20 03/10] dt-bindings: mfd: Document suppor=
t for Airoha AN8855 Switch SoC ---
commit becec7ba9d50daec0a4bb4e2976f7f7fc33b268e
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC

This commit documents support for the Airoha AN8855 Switch SoC. The SoC
exposes various peripherals including an Ethernet Switch, an NVMEM provider,
and Ethernet PHYs.

> diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/D=
ocumentation/devicetree/bindings/mfd/airoha,an8855.yaml
> new file mode 100644
> index 0000000000000..472da8384a30e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
[ ... ]
> +properties:
> +  compatible:
> +    const: airoha,an8855
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios: true

[Severity: Low]
Should this property have a maxItems constraint? The core gpios.yaml schema
doesn't restrict the number of array elements.

Without maxItems: 1, could a device tree incorrectly specify multiple reset
lines and silently pass validation?

> +
> +  efuse:
> +    type: object
> +    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
> +    description: EFUSE exposed by the Airoha AN8855 SoC
> +
> +  ethernet-switch:
> +    type: object
> +    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
> +    description: Switch exposed by the Airoha AN8855 SoC
> +
> +  mdio:
> +    type: object
> +    $ref: /schemas/net/mdio.yaml#
> +    description: MDIO exposed by the Airoha AN8855 SoC
> +    unevaluatedProperties: true

[Severity: Low]
Should this be unevaluatedProperties: false?=20

The core mdio.yaml schema sets additionalProperties: true, so by setting
unevaluatedProperties: true locally, does this schema actively permit
undocumented or misspelled properties in the mdio node to silently pass
validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082034.2032=
6-1-ansuelsmth@gmail.com?part=3D3
