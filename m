Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5AA3BB674;
	Mon, 17 Aug 2026 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961588; cv=none; b=rMOZhI7gPEjAgH48NarMCO0jjb/AVbGAtZ7gzFPNkwkzuGsBbEsikH/VPFLIQa7Xk1gzSo63XmzEI8H2N6h7/qslCL3SMyIOx2UsH00YmFoUbg2JIwmgNf+V/wpgFiCTk4gg9RpP8eYfyIdc9HyxBucW9fhUFQmEsbNL+wijKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961588; c=relaxed/simple;
	bh=fB3bFralXTgeOoIt0YK43Su0t+rNerRznvgUfWsjukI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OGFX1wJJwAyzgSarlGP9le9GTw1otDoFHuVqloDZMO7L+05ERrFSiqQcE4nEYQOgDLpbxtegG8KoY1Cl91rWqunPpzQ3tlSmow/tVe7R4n99WKJJp+4npB1EYfPQygEhSIDQnFTe86rklQm8Kak9s00pl5sGCZvuUlsTxI32gIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHZ1X5wn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHZ1X5wn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4D91F000E9;
	Mon, 17 Aug 2026 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786961586;
	bh=kFSLXQXWWTPxAasn1YXHC+DflzGkN0aSR9CX0lXSl38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHZ1X5wnfLUsPN+6E89eKNptcDY3Y7CGyQ33hHDlaxKucKj+v4uLOPjazCnUDxN4o
	 CLCZlS/5xOlmW9b/V18SwTMuwkbzFaNl8M51s9slsePYSOiGbCD5TCpdb8XF2/D7iD
	 f4bidUHV9QhJ+7YPG+DsAmxshr5QqW8A/fA6Q0xBIBsXbcnREg5oG57RFiznPKWvo1
	 ilSYs7Y8ADxQAd6s9YKfjGEa3VA3DI+TW7twUgxQFl3C6IvNFNReoDfgo3/Wck7njH
	 +YNZiqvfb1pGi/XPXfgxS7OVqD/mEQht3eyi+vytvLIjOS9UCgew8vnlD7KF7YGCgl
	 8Cu+817eMsnNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260817100207.2970303-1-egbostina@gmail.com>
References: <20260817100207.2970303-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:13:05 +0000
Message-Id: <20260817101306.4A4D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] The 'clock-names' property uses an 'enum' for array items without e=
nforcing uniqueness or order, allowing invalid configurations to pass schem=
a validation.

Pre-existing issues:
- [High] The MFD driver mutates globally shared `static` resource arrays du=
ring `probe()`, creating a concurrency data race.
--

--- Patch [1]: [PATCH v3] dt-bindings: mfd: Convert TI TWL6040 to DT schema=
 ---
commit 217f75902b2af0561cd52b8ef59fbfb6ab482cc0
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: mfd: Convert TI TWL6040 to DT schema
   =20
Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
schema.

Link to v2: https://lore.kernel.org/all/20260816092847.2522994-1-egbostina@=
gmail.com/
Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@=
gmail.com/

> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Docu=
mentation/devicetree/bindings/mfd/ti,twl6040.yaml
> new file mode 100644
> index 0000000000000..0d4e620d25a51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
> @@ -0,0 +1,151 @@
[ ... ]
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      enum:
> +        - clk32k
> +        - mclk

[Severity: Low]
Does this clock-names definition allow duplicate items or arbitrary orderin=
g?

Using enum for array items without enforcing uniqueness or order might allow
invalid configurations like ["clk32k", "clk32k"] to pass schema validation.

[Severity: High]
This isn't a bug introduced by this patch, but looking at twl6040_probe()
in drivers/mfd/twl6040.c, it modifies a globally shared static array:

drivers/mfd/twl6040.c:twl6040_probe() {
    ...
	twl6040_codec_rsrc[0].start =3D irq;
	twl6040_codec_rsrc[0].end =3D irq;
	cell->resources =3D twl6040_codec_rsrc;
	cell->num_resources =3D ARRAY_SIZE(twl6040_codec_rsrc);
    ...
}

Does this mutate a globally shared static resource array during probe?

If multiple instances of the TWL6040 device probe concurrently on different
I2C buses, could they simultaneously modify the start and end fields of the
global twl6040_codec_rsrc array, creating a concurrency data race?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817100207.2970=
303-1-egbostina@gmail.com?part=3D1
