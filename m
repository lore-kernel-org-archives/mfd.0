Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68474756AC;
	Tue,  4 Aug 2026 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859848; cv=none; b=XFB9CN+gb1vtz+gi94E9kXfIeECpiAxi56HXs3/0zwg3Et6LGH1rd/wrafqbjVRM8FXma89LjzgCERhbFl8pnj9na4x3KNDgeA03KwtWuAX0QNqrwdP9De7HEjDnk3P9x12wl92AwLx57FZDDCGBdjKMYWBT0bFv00RDgFy5OBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859848; c=relaxed/simple;
	bh=VSEF7OHYOk+wLGuf/rXbUmhHd3XSaZZCZpfTUNONSYY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OnPSAXmUHlrMYnbxUf4f4bYOVhr8yKCPxmo/yDBMKePEcWTmDU+5nRhrkAQtsbEFPKLmB7kjo3ZMKBrr/YSu9NZ0LC5DfsckiStP1nKtSsGMlGvPTzQBCzAJognaREjSkf993sdlwjbXfhdRvIdJn1U0Y0hw0kQji9ZUAUn2BEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpm+eaqX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpm+eaqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAF31F000E9;
	Tue,  4 Aug 2026 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785859838;
	bh=XRov15RVAYqIX9x/Y31pHUBq7bssTRXA/aFtNFBwBbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kpm+eaqXD6/HM/xx8L3QbwJ19Rje41koEtLp8hbpqUg5tJMIQXJY0P6sNPQJG2PPu
	 GfUWauNga9XCArNeEVY2qsJjPaIyg6pSjO+gjyvvemlly/cbLY0TUTQVg90ENcQjk4
	 9uo8O2DixxBo0rTsYDXiYEl6JDMTwKgi2lY5DyTOW6fCXKOw9ZvDCxwCKV5icNzTgk
	 RyoJwhyAVM433od0U1wg5P+CpS6z8I9aCPdm5HsZLhVooRGFQX2fxTpfwd5uXVbBwk
	 8VMxn4SUPwjdnQFnZ+oImdv1r115Jp21WgG5XmoBt+po6o9ELX08zjp0ZGySBNk89C
	 hq5bhb9QSQ+Jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] dt-bindings: mfd: fsl,mc13xxx: Use generic
 power-controller schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260804-mfd-syspower-v1-9-a440783c2e78@nxp.com>
References: <20260804-mfd-syspower-v1-0-a440783c2e78@nxp.com>
 <20260804-mfd-syspower-v1-9-a440783c2e78@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 16:10:36 +0000
Message-Id: <20260804161037.AEAF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Broken schema reference to a nonexistent YAML file.
--

--- Patch [9]: [PATCH 09/10] dt-bindings: mfd: fsl,mc13xxx: Use generic pow=
er-controller schema ---
commit eeab4b123a8fd6063871fdea625f14e773ee0aa4
Author: Peng Fan <peng.fan@nxp.com>

dt-bindings: mfd: fsl,mc13xxx: Use generic power-controller schema

This commit switches the fsl,mc13xxx binding to use the generic power
controller schema. It removes the local system-power-controller property
and references the generic power-controller.yaml file.

> diff --git a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml b/Doc=
umentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
> --- a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
[ ... ]
> @@ -174,6 +172,7 @@ required:
>    - reg
> =20
>  allOf:
> +  - $ref: /schemas/power/power-controller.yaml#

[Severity: Low]
Does the power-controller.yaml schema exist in the tree yet?=20

It appears the generic power controller schema remains a legacy=20
power-controller.txt file in this tree. Adding this reference will cause=20
make dt_binding_check to fail with a schema reference resolution error=20
since the referenced YAML file does not actually exist.

>    - if:
>        properties:
>          compatible:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mfd-syspow=
er-v1-0-a440783c2e78@nxp.com?part=3D9
