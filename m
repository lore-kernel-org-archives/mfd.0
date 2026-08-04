Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E38F45D1AB;
	Tue,  4 Aug 2026 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856293; cv=none; b=OHdfcZxvnT0CbwyI0xUNZYslma+MtFDwxypL9AfMiQrxCSXjL+ruMNdQXxnkrYw2UAPSeiDZ5NLsomRp93xmy+FR4hRRaYC2Vz0E5+4X77jEW20eusq6b3prdiEOihnm7k5mvsUhOA/AtsxEKQrqhmHnHw3oLK+ebWV5Z5SbWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856293; c=relaxed/simple;
	bh=ixoht4SpoyfZkL3puQ2oIwLJKpGXmXNMZzfX9gUiSaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o8k0l5Z3rv+DaMjV+IOnq+7YzgWES01GTXxCJmekWbvEJe9T4z/ox/voicn4+sPrBaLazHzhOeY3nHtbBOXEhn3VSnnrI79FqBApFqdl6w2UFcPqhIda/byKL7Q4S96CAJ+2TojiMlZC6bkCGoJu8W5FPgDoUXCMYlcDAbqz/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+YGrZft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+YGrZft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA7B1F000E9;
	Tue,  4 Aug 2026 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785856289;
	bh=ZDneDKrx4RgEqEV1X+ts78qjARSbRc6eis3aZ3hnHhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D+YGrZft9hy5qQMTzffdmCx08rupW9AMd9vjBUIM+7p74smUxCrkK+BehkzM0zDFO
	 gA1sLvH9u6jvMJIu/MutggOPZm0tmCjhiddxyDKER0MQQdFfRfwVZmw15NZ4AT9SP8
	 ZiTH7UNiWlQTsba8PYpM99xoM0FRZpPTupJAA7NWKMtLMdLTvsVoVgDi1Kj9dG/TEP
	 SURWC2exgVT/VQUnRio+nTqNWLprPdXr2Z9YvZxBjuw+GtuL6T4uuGg/t8BRDArewL
	 P+jwKMxQYy1JsjOCGe+veeNfFlSFHYm1jFcEUjFQpOq8oFP/frLhrqDw3jKbkwaYkV
	 EwZbOtlhE0XTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: mfd: ene-kb[3]930: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260804-mfd-syspower-v1-1-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-1-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:11:27 +0000
Message-Id: <20260804151128.3DA7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Broken schema reference to non-existent power-controller.yaml
--

--- Patch [1]: [PATCH 01/10] dt-bindings: mfd: ene-kb[3]930: Use generic po=
wer-controller schema ---
commit 7180a65c7f429628f30dced562271d7d6ecc790b
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: mfd: ene-kb[3]930: Use generic power-controller schema

Convert the binding to use the generic power-controller schema instead by
referencing power-controller.yaml and removing the local
system-power-controller property definition.

> diff --git a/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml b/Docu=
mentation/devicetree/bindings/mfd/ene-kb3930.yaml
> index 9b11b6e2bbf74..1847a6d5b22e8 100644
> --- a/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ene-kb3930.yaml
> @@ -13,6 +13,9 @@ description: |
>  maintainers:
>    - Lubomir Rintel <lkundrak@v3.sk>
> =20
> +allOf:
> +  - $ref: /schemas/power/power-controller.yaml#

[Severity: Low]
Does the /schemas/power/power-controller.yaml schema exist in the tree?

If the generic power-controller properties are only defined in a legacy text
binding (Documentation/devicetree/bindings/power/power-controller.txt) and
have not yet been converted to YAML, make dt_binding_check will fail because
this reference cannot be resolved.

Additionally, since unevaluatedProperties is set to false, will removing the
local system-power-controller property definition cause the example to be
rejected as having an undocumented property?

[ ... ]
> diff --git a/Documentation/devicetree/bindings/mfd/ene-kb930.yaml b/Docum=
entation/devicetree/bindings/mfd/ene-kb930.yaml
> index 02c111def5de5..e0c8abf95bd92 100644
> --- a/Documentation/devicetree/bindings/mfd/ene-kb930.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ene-kb930.yaml
> @@ -13,7 +13,9 @@ description: |
>  maintainers:
>    - Dmitry Osipenko <digetx@gmail.com>
> =20
> -$ref: /schemas/power/supply/power-supply.yaml
> +allOf:
> +  - $ref: /schemas/power/supply/power-supply.yaml
> +  - $ref: /schemas/power/power-controller.yaml#

[Severity: Low]
Similarly, will this reference to a non-existent schema file break
dt_binding_check validation here?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mfd-syspow=
er-v1-0-a440783c2e78@nxp.com?part=3D1
