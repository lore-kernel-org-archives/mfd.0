Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763239;
	b=H00TvZfZ2aAj6ST2ABVe/0auRAutUGUAaG/u2E6sdj4W6CdURld3s3oj/MR4nmy5qnt/
	 MOMGrACVGa2CdOW2x2uYQ2pXqZ5UiJaE3HZWlgyoPEEeNdwH5AxZCOqXaEKImt0Bsd9+Q
	 w/TyYH+t3o55bpdnvqQIFXAqrMWcMS6HfDXo64OgFGH+RFdAXs0bgvNHAk4nt6eyb0Gp/
	 ktxlPZOjcHyuPBTtUDL64PO7+YFTXxoreB7BFGpb092Xdk013Eevltd9NqG9wesJtNUOd
	 xxBlWRPscmPuGtGj8knU6Gj4ier+uI8In/p+hXQeTOG1DgdV5rhoVjGHylWpTicx57Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763239;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lUYSmdDAIz85Bf40o5kep+KTrVo3dL2FPwB709EoZ5w=;
	b=S7G9TTtswoc24p/PShmGWwJ1OdS57ZTKQDDrXbmIHdjzDatzrmFcbc3QqWPMPDe+gLVq
	 eO4cRtji1T31/6n5O6tHdS0FBjs82E5IP10LpkTfSjNPZ5tYF7R2VCxMPuSnDmYoaS0Fj
	 /e4o3AMmEVNDC7/Td/kV7JRSUiQY8FMQVsV8fpj1zBWPwYiC1ypvLGjvkuQZ7uv0ex7Su
	 klui0lK9y2lH2P/G6xWcIA3MtbsyPbaxhUWO1Y6caBaAqL1E2ibfMWLEJcCx/9OWqxu5A
	 4KhfK/aDVy60GtokckTEQLO4PaGunFec7ghdfzoDgg75XO5qNj5EthEQzQ5/OcN43JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FffA8WCa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC4606A31D;
	Sun, 15 Nov 2026 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FffA8WCa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C3B1F000C4;
	Sun, 15 Nov 2026 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794763238;
	bh=lUYSmdDAIz85Bf40o5kep+KTrVo3dL2FPwB709EoZ5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FffA8WCaViqM8DYYZc36i00+SItzpfE+ZZuxTYs74UGHPmwHN6lli0D+xCus48eEe
	 WognC1WKsaHJySNbLDg2ct9FX0q/F3l3OCu5hidwkEmd8ehJQdEBcEVzOWui+r8pZ2
	 JaQTcxRT5kuwwRcFnycQGct49aNMddUq/bjUr6WN+8T1gU54jmqAKVwwrBhrOCb0Kh
	 EuDXeSKOXXFXL3KvHeKJ2ZwDtd/pdasFIUUMi7IkbQdbIHky824XJGVfipyITJf3Uy
	 t3PHmtmMMZu727LXx8Ebfj89f7YrM1IqiSJChaWddnmzTto4mryWC1FgEzDBxLIkj+
	 o0QskSWe29p9A==
Message-ID: <sashiko-outbox-215676@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: mfd: x-powers,axp152: Add the
 AXP2101
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Louvignes" <olivier@mgcrea.io>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261115171150.64431-2-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
 <20261115171150.64431-2-olivier@mgcrea.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 17:20:38 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: mfd: x-powers,axp152: x-powers,dcdc-freq: false at
  wrong level
- [Low] dt-bindings: mfd: x-powers,axp152: unwieldy per-compatible
  conditionals
--

commit 520d0c5b7e3c77d62056e2ccbc2df67bc5ef33a7
Author: Olivier Louvignes <olivier@mgcrea.io>

dt-bindings: mfd: x-powers,axp152: Add the AXP2101

This commit adds the x-powers,axp2101 compatible string to the X-Powers AXP
PMIC binding with optional interrupts and no DCDC frequency setting.

> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b=
/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 45f015d63df16..024de5553d6b7 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> @@ -69,6 +69,7 @@ allOf:
>              contains:
>                enum:
>                  - x-powers,axp15060
> +                - x-powers,axp2101
>                  - x-powers,axp305
>                  - x-powers,axp313a
>                  - x-powers,axp323
> @@ -85,6 +86,7 @@ allOf:
>                - x-powers,axp313a
>                - x-powers,axp323
>                - x-powers,axp15060
> +              - x-powers,axp2101
>                - x-powers,axp717
> =20
>      then:

[Severity: Low]
Does adding x-powers,axp2101 to this allOf rule actually forbid
x-powers,dcdc-freq under the regulators child node?

x-powers,dcdc-freq is defined and parsed under properties -> regulators ->
properties, whereas the then clause of this block sets x-powers,dcdc-freq:
false at the top-level PMIC node:

Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml:allOf:
    then:
      properties:
        x-powers,dcdc-freq: false

Because the first allOf entry's else branch defines x-powers,dcdc-freq under
properties -> regulators -> properties with a 1800 to 4050 kHz range, schema
validation still permits x-powers,dcdc-freq inside the regulators node for
x-powers,axp2101. Nesting x-powers,dcdc-freq: false under properties ->
regulators -> properties in this then block would disallow it as intended.

> @@ -108,6 +110,7 @@ properties:
>            - x-powers,axp806
>            - x-powers,axp809
>            - x-powers,axp813
> +          - x-powers,axp2101
>            - x-powers,axp15060
>        - items:
>            - const: x-powers,axp228

[Severity: Low]
This isn't a bug, but x-powers,axp152.yaml already aggregates nearly twenty
PMIC variants with five per-compatible if-then blocks in allOf. Rather than
extending these conditional lists further (and inserting x-powers,axp2101 o=
ut
of numerical order after x-powers,axp813), would it be cleaner to split new
variants into a separate binding schema document?

Also, the commit message explains the optional interrupt line in terms of
Linux driver behavior ("the driver then registers only the regulators") and
gives no background on the AXP2101 hardware. Describing the PMIC and why the
interrupt line may be omitted in hardware or board wiring would make the
binding description clearer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115171150.6443=
1-1-olivier@mgcrea.io?part=3D1
