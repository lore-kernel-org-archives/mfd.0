Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B353BB100;
	Wed, 30 Sep 2026 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777837; cv=none; b=q50Bs7+//NJFwePwjMiS2QHjGHCVY88rMiG36aHyITENvHTGtAluAwvw8LhzM0DffQVUSf0B6nqz/LPMViPLFf3pET+c7uPgvlCJZjQaoTVREyFyGfrKqq761p2DBoLjneGVV5FRC+jEA4SC+/nUPXor7pcoy2hASUCrf/VKwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777837; c=relaxed/simple;
	bh=wCcgxakG8qfp5X0N0+W5pUl3GxZxaKgg9sUvZuJ+Gjs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bl+L2Pi66lbY/392O7/P+6F6iF7NNG9zKx1nDrJfvwljRDUwOWvNPXFH4ZMzcO7zWhUgn5c3h3yK4W5Yr7A2RJCUz5+NL1iSkSWkD54at4tBxv5N6fqwbyxU3P/rE/VZeAskoxDZ8HbunWVhy+mJKBwhXoHY+hbLXCzdor+Sjwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JunjNJHw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JunjNJHw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529FB1F000FF;
	Wed, 30 Sep 2026 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790777830;
	bh=EAbQI2F8PI26Tl5IpQUZldVyoarPJbDqkbjf2GVFr5A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JunjNJHw5cTZwfHNaKltg4BsIbp/uBsmmbj0BuV9md5pa1iVC8EZZY+/1ajdZEZr2
	 sT1+acaezuZ+GPuFqZQjGH1a4O9wv0we3oP7O6cTcHwi3O9ope/bj0yb/BF5ywG2Uw
	 h/+IfTEgWjm88Mt3SO0Dh5JabawEwDwo0pdio/PLE+C24EdhhJ0ge14sQFBssqY1Jw
	 JwiP7UHRGSpGgLS+DkcQH+1VKHSDB8U0H5mLAk/jVjT843uFHV0IeKBffJVwGDdVl/
	 MjR3LqnJGSbPumVn2Fna4Wa9O181h1omyxRratwVZ+MdYIXYBme2dMfOs/ZgwPyIq0
	 T1LNHis0K7uJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260930-as3722-bindings-v2-2-a3bba649ebf9@nvidia.com>
References: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
 <20260930-as3722-bindings-v2-2-a3bba649ebf9@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 14:17:09 +0000
Message-Id: <20260930141710.529FB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: schema bypass for tegra132 due to const instead of =
contains
--

commit cc353b75e1127a04e8bb3722f63443c9ec2f2daf
Author: Thierry Reding <treding@nvidia.com>

dt-bindings: sound: tegra-ahub: Convert to json-schema
   =20
Convert Tegra AHUB bindings from the free-form text format to
json-schema.

> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.=
yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
> new file mode 100644
> index 0000000000000..4a7f5c74125c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.yaml
> @@ -0,0 +1,288 @@
[ ... ]
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra30-ahub
> +      - const: nvidia,tegra114-ahub
> +      - const: nvidia,tegra124-ahub
> +      - items:
> +          - const: nvidia,tegra132-ahub
> +          - const: nvidia,tegra124-ahub
[ ... ]
> +  - if:
> +      properties:
> +        compatible:
> +          const: nvidia,tegra124-ahub

[Severity: Medium]
Will this exact match condition fail when evaluated against the tegra132
compatible sequence array?

Since JSON Schema const requires exact equality, this condition evaluates to
false when checking the device tree array ["nvidia,tegra132-ahub",
"nvidia,tegra124-ahub"].

This causes hardware constraints (such as reg, resets, and dmas properties
requirements) defined for tegra124-ahub to be silently skipped for
tegra132-ahub device tree nodes, allowing incomplete configurations to pass
schema validation.

Should this use contains: enum: or contains: const: instead of const:
to correctly match fallback sequences?

> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: APBIF registers

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-as3722-bin=
dings-v2-0-a3bba649ebf9@nvidia.com?part=3D2
