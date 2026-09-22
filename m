Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CF95187FB;
	Tue, 22 Sep 2026 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073889; cv=none; b=fe5Ti2vyW/u2VAK19aaSu0cCtNw68F3Rw1gsPtNFak430zAWq1T0J4wvbzK/16v5gSXHOv6NEZdGavsoLB6gbxfbbRi4TAZuqc3FG+Hzp1ZlHUAbnXp36HJ9EEmHxPotk1jovdO3m67lwD2emrBsriEpbtjqJ7DMftzwX4j3ooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073889; c=relaxed/simple;
	bh=Watr4nNyZvGw/2SwCQxoDhWOiPZZjAIJe5quJ9+0Rf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mw5RqRlSYsN2f5Mk+tFoIRprdGZHR8k1OAD2LzyhLfAePFiS4fLDHyeJ7PFydLNnsS9mNKUusj1+h9aq8rDfrEYSDXDFI6PaZZQJqAxa/bdJFVLoYoV4/2Wz3QzlH+47XbT1gNKaZ9vwMFnRmBpsxbqORIkB3kCzq4optFtNmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2SsiAeW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2SsiAeW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C791F000FF;
	Tue, 22 Sep 2026 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790073886;
	bh=3aPUPivC4b5ZIJUXeU1itKnx1QmlawxrfLmx6rLqt7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q2SsiAeW34O5majWfc/A/Z/Uh2w+n37JurYq/GHd/FUNIR0g3ZJ3z/gIARWNnstH2
	 n/9iDbwJc5Bys65jnBjPye9sXWBIFmXp6TZ+O4jkFy3aqPWg9vOOh2EbmPUgSRF5Jw
	 JKbDMLNHAii7kCEbh72oZeLX4XKgt2g2Yf3ITzWXs18yj+YvGYKEuz9p0V1qQd5L4A
	 MoZEpDiBHoq6j2BjmRuNjGaB5cpW4N6ygjGlsry4JMAZfxlcvd2UPQtJItO8cbLmLF
	 Qmq69hiYSzSQF4vt+lTl+qgYsWBqFhiMBblAd77VlH0Su5nf/9/oy2918IJySjjX9P
	 iZaCMrh2isOPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: lee@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260922103551.2754613-4-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-4-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:44:45 +0000
Message-Id: <20260922104445.D5C791F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: missing 'compatible' in top-level required list
--

commit 4b70261c8ce41e64c7020f41bb3084f3d73d0e07
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
   =20
dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
   =20
This patch adds device tree bindings for the NXP P3H2x4x multiport I3C hub
family. These devices connect to a host via I3C/I2C/SMBus and allow
communication with multiple downstream peripherals.

> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Doc=
umentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 0000000000000..09508a7bcbeb6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml

[ ... ]

> +      ldo-tpg1:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'

[Severity: Low]
Should the top-level compatible property be included in this required list?

Standard device tree binding schemas expect the top-level compatible proper=
ty
to be explicitly listed in the required array for standalone device nodes.
Although dt-schema matches the node by compatible string, omitting it from =
the
required list allows a node to theoretically pass validation without one if
referenced through other means.

> +
> +patternProperties:
> +  "^i3c@[0-7]$":
> +    type: object
> +    $ref: /schemas/i3c/i3c.yaml#

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922103551.2754=
613-1-lakshay.piplani@nxp.com?part=3D3
