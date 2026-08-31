Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04825443315;
	Mon, 31 Aug 2026 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193131; cv=none; b=J22hiSsELxHiWOsHa9Y1cRahWPNOhsD2VFIkk3sUBkYaM1sqFL0id6YK1m516/YjMapBIWUp/wqnZ8MtJzGzT9a7p4IeTQZP1TGlCTcxK1lcFsEtAiwpnFXuN6I0f8693Peob0Xvl6kK1gDK37s/ARv5JxFoJK3dbQbl6iRCKpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193131; c=relaxed/simple;
	bh=IJ+zRehKN0y224Ldw20bv2xH5LiWTrZL5fk1m/kb3ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTlBaHAwnCrwYClQMMh1+na06766cyqPGRvIqctx70W+CdVnhT9pacnLHpLAZ9ww4EVfFlYh5dYXzOUnCOmSO9YNSKm1fVXpD7Dm866GCvFxGyL1TQj2aj8k32Nc4viIfjqgsYiXdUfha99ng/HPRrh/EIMAtgQ/T8Px8m+l0BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HezoiP1P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HezoiP1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CC01F00A3D;
	Mon, 31 Aug 2026 16:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193129;
	bh=DTpytfhLlzWOmZlTdJ8Fn3stWcWuXGiQ01JaEn+BhMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HezoiP1PHT6jbJlyF/fQhZpgJIm+kgUQDWd970B9nE/NKZGqtpFS5dzKFs4GAVntf
	 Jzw0REdpxnXCIowL8JeqG78M6Gp4CSc+LP41YtgFJcHzB48bpfFHkd/Ca947tAKBM5
	 HFywcfD0CWOx1IVSTNgwWSxkUj19el3Jekadn5deszgFC9rVt5WSVRNyBSdrsjlky/
	 hor2L8XnhGEMd5s5EPkjAgAiP8ALUGeWRSXtcU5b6Xuy/IWgUWGkKXppby122TcTK9
	 +6Z/V5wrPBfFgidRTErmMtzKQ9PEwCc5V4tv582W1Si10kx+kfZcowbg33EEE+LAqf
	 h1hEokXQF/QXA==
Date: Mon, 31 Aug 2026 17:18:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH 08/13] dt-bindings: mfd: ab8500: Add regulators
Message-ID: <20260831-subtitle-anvil-0f33fee6c2af@spud>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-8-fe279fff5e18@kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xAt71OldtqA5+2eq"
Content-Disposition: inline
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-8-fe279fff5e18@kernel.org>

--xAt71OldtqA5+2eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 12:43:37AM +0200, Linus Walleij wrote:
> The buck converters were not initially added to the device tree or
> drivers as they are mostly always-on, but their outputs supply devices
> which need to reference the correct regulator.
>=20
> Describe the six AB8500 buck converters when the regulator node uses
> "stericsson,ab8500-regulator". Describe the AB8505 converters under
> their native VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM names when
> the node uses "stericsson,ab8505-regulator".
>=20
> Keeping the two namespaces conditional on the regulator compatible
> avoids representing the distinct AB8505 VSAFE and VSMPSC rails with the
> AB8500 SMPS3 and VAPE node names.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/mfd/stericsson,ab8500.yaml | 102 +++++++++++++++=
+++++-
>  1 file changed, 101 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml=
 b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
> index 0fdfbfdfe88a..d44652aede0c 100644
> --- a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
> +++ b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
> @@ -439,10 +439,110 @@ properties:
>          $ref: /schemas/regulator/regulator.yaml#
>          unevaluatedProperties: false
> =20
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              const: stericsson,ab8500-regulator
> +        then:
> +          properties:
> +            ab8500_buck_smps1:
> +              description: Analog buck converter for the VSMPS1 1.2V I/O
> +                and memory supply.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +            ab8500_buck_smps2:
> +              description: Analog buck converter for the VSMPS2 1.8V I/O
> +                and memory supply.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +            ab8500_buck_smps3:
> +              description: Analog buck converter for VSMPS3, which suppl=
ies
> +                the VSAFE power domain.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false

How do these differ from
  regulator-external:
    description: Node describing the AB8500 external regulators. This
      concerns the autonomous regulators VSMPS1, VSMPS2 and VSMPS3
      that are normally controlled by external electronics but also
      sometimes need to be explicitly controlled by software.
    type: object

    properties:
      compatible:
        const: stericsson,ab8500-ext-regulator

      ab8500_ext1:
        description: The voltage for the VSMPS1 external regulator
        type: object
        $ref: /schemas/regulator/regulator.yaml#
        unevaluatedProperties: false

      ab8500_ext2:
        description: The voltage for the VSMPS2 external regulator
        type: object
        $ref: /schemas/regulator/regulator.yaml#
        unevaluatedProperties: false

      ab8500_ext3:
        description: The voltage for the VSMPS3 external regulator
        type: object
        $ref: /schemas/regulator/regulator.yaml#
        unevaluatedProperties: false

> +
> +            ab8500_buck_arm:

realistically, all of these should have -s instead of _s.


Cheers,
Conor.

> +              description: Analog buck converter for the VARM processor
> +                supply.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +            ab8500_buck_ape:
> +              description: Analog buck converter for the VAPE application
> +                processor supply.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +            ab8500_buck_mod:
> +              description: Analog buck converter for the VMOD modem supp=
ly.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +      - if:
> +          properties:
> +            compatible:
> +              const: stericsson,ab8505-regulator
> +        then:
> +          properties:
> +            ab8505_buck_smpsa:
> +              description: Analog buck converter for the VSMPSA 1.2V I/O
> +                and memory supply. The selector range depends on OTP
> +                configuration.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +            ab8505_buck_smpsb:
> +              description: Analog buck converter for the VSMPSB 1.8V I/O
> +                and memory supply. The selector range depends on OTP
> +                configuration.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +            ab8505_buck_safe:
> +              description: Analog buck converter for the VSAFE permanent
> +                logic and DDR supply. The selector range depends on OTP
> +                configuration.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +            ab8505_buck_arm:
> +              description: Analog buck converter for the VARM processor
> +                supply, with a 0.6V to 1.39375V selector range.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +            ab8505_buck_smpsc:
> +              description: Analog buck converter for the VSMPSC multimed=
ia
> +                and graphics supply. The selector range depends on OTP
> +                configuration.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
> +            ab8505_buck_smpsm:
> +              description: Analog buck converter for the VSMPSM modem
> +                supply. The selector range depends on OTP configuration.
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#
> +              unevaluatedProperties: false
> +
>      required:
>        - compatible
> =20
> -    additionalProperties: false
> +    unevaluatedProperties: false
> =20
>    regulator-external:
>      description: Node describing the AB8500 external regulators. This
>=20
> --=20
> 2.55.0
>=20

--xAt71OldtqA5+2eq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapWpZQAKCRB4tDGHoIJi
0oJiAP0T9qn14ciZWZvClvdPwXcNIIJLTDCobZWaNlYw/LYeLAD/XfSd6O82AgfL
Ki46Nl1VatAma1CXQuG30fu4vbhuQgk=
=RZil
-----END PGP SIGNATURE-----

--xAt71OldtqA5+2eq--
