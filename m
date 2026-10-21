Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583163;
	b=FGEcYfojVVmNJJS9zVTkDcvQzeITltRljhKAdycPckO7SE3/xDglD6CyoA27c9iTFGe4
	 GRIv6MhEiEuSq5HaesobtPuA6D95WniPzrzO82zTtHM518Gww7wojCagbc27WD3kjDZsp
	 lQGlFUJTL/vV87FT0pXC0nuaLA3NINCPWhEhh+Rm5k55mV2Z2dYjwQqiaLBXcueRqvkZL
	 07skHX5IBMkW38d4qLKiOSL1odYn3HYFbR/b2/GWOhx22h7jZtT2VyblFxAU3q7246Qlt
	 /2wy0/MqVOkn7YfOS3sXWNZH/9s8rFB1nkceBiMMMx7nvV1s6PK9A571NekZh+3CxaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583163;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sKsqX0ZP4s7UUDGCO6Qj+6fn/PcFN22dLb5Vy0w8F18=;
	b=MkvUkykElFY1OCxtXJ54yVi5lP6zoqn3LbkAOyQskJmZZ0+1w1Wb5Qmi4aNMYYI9uWEK
	 AAIjtyV7vc3J4hpxBecjPnQcFlbPcvy0TSbarcZ0IVcfJyQWQi47zF9RigWLwIy+lFPXc
	 eHVmRjhCKtHkiofTKCNcNlQ/3zLVhI5sSmge42VxVdqivmRKqTzbskpETbRyGlf4x51Hh
	 nLbbFnijlazigUMoO9djgvD4huJ4/DG+k1G0ikZvM9cowxo2TBkevObHnDPcdP2cWG98Y
	 9ctfw6gyegpQE47knlOxZJCwOU4xaNxujNP42fNTsC5tZxIb8xesjO7ve1Ho5HIifzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idmDr7io;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76605606A31D;
	Wed, 21 Oct 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=idmDr7io
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE42D1F000C4;
	Wed, 21 Oct 2026 11:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792583163;
	bh=sKsqX0ZP4s7UUDGCO6Qj+6fn/PcFN22dLb5Vy0w8F18=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=idmDr7ioFbsr2QY5EqlkbRcma6opEnQ7yIyREL5o6E6VeN+1g31ECiJ5a4jBWZpdu
	 5ttikeD5jeN2DaB+zYtwSWv2kzxT565eFru5kJMWqxuSkvsxSeRniMe5PxemYDMOAF
	 O7AX3zF00jEumBJ0FVyNdBrKOuCFsUOS3X08PDbXdYBHMgQQt+kLyM8Sg19DEjhm3j
	 SEOvKPHGNXSHCNAB78NpOdsXcJ5vmhbBZm9Bje6CL2DsYekwOcNqkyHOcGxj9z7geq
	 Mo1G05YQJ1+8mCM/4uOCWGxVzKMu1K0ps75nnI49U0SEtBcan5P0d/5yJNFhI+8O+F
	 NmE3ug0ITFKuQ==
Message-ID: <sashiko-outbox-180180@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH 1/2] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261021113419.283015-2-ansuelsmth@gmail.com>
References: <20261021113419.283015-1-ansuelsmth@gmail.com>
 <20261021113419.283015-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 11:46:02 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: mfd: reference to missing schema airoha,an8855-switch.=
yaml
--

commit 8973f67919d9fd3d92a5417e6a75e38e2eb9cc42
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC

This commit adds the devicetree binding schema for the Airoha AN8855
switch multi-function device, including its efuse, ethernet-switch, and
mdio subnodes.

> diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/D=
ocumentation/devicetree/bindings/mfd/airoha,an8855.yaml
> new file mode 100644
> index 0000000000000..48127e956c965
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
[ ... ]
> +  efuse:
> +    type: object
> +    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
> +    description: EFUSE exposed by the Airoha AN8855 SoC
> +
> +  ethernet-switch:
> +    type: object
> +    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
> +    description: Switch exposed by the Airoha AN8855 SoC

[Severity: Low]
Does this break make dt_binding_check?

In Documentation/devicetree/bindings/mfd/airoha,an8855.yaml,
properties:ethernet-switch references
/schemas/net/dsa/airoha,an8855-switch.yaml, and the examples section
instantiates an ethernet-switch child node with:

    ethernet-switch {
        compatible =3D "airoha,an8855-switch";

However, Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
does not exist in the repository, causing dt-doc-validate, dt-mk-schema,
and dt-validate to fail on the unresolved $ref and the undocumented
airoha,an8855-switch compatible string.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021113419.2830=
15-1-ansuelsmth@gmail.com?part=3D1
