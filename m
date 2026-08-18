Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4403BFAEB;
	Tue, 18 Aug 2026 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049687; cv=none; b=cpW8xLYajleadveFKF8VnzTFaMoGUYb9L4hivm7luHvCWGBksq4xmN8axhhY+Tb9qTUlJe21iNQfbjv7MDFxSvhnj/bUuWmC+sTSTur2ltroGBdwjSr7IFv7chyEK1iWMCEcQiuMngsp12SvdtksYmu68qQS3OR6Pyvhb2t0sjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049687; c=relaxed/simple;
	bh=k+Y643r8dMlBB0xXT7Q9qV+b1AVasHvT7DAKlGWB3Fs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IKxyK7SlcMDThG1KW8yZdS+6DEQLorW7KBzrRX/3saS7gtvCk1imyI/rqWmVFi3VVwX/M81TChoBNPCdXOfSjFnuCNoLTQvjM5bChdGnS35hJ+EqOLZl0bljF2X2xXzuWNIXSiL7jfavzJs4Xc+KGEy1waEynI1ME6islornRLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdCaBeZ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdCaBeZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6AC1F000E9;
	Tue, 18 Aug 2026 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049685;
	bh=YyL7htxtAQkG9vAqWuC3lwcaaMREQzjOyvvQONAWCvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kdCaBeZ7Koxk0WAvmj7jGeJz21cv5iQH/JU76c6hqsiHlOWEXZfnLLzVqdDD4SrkX
	 yL18+cTKvjPIPbXffilh/oYWowfsx0FAWZ9UMLkotKLggkkJTMRBQmPve7+9QxB037
	 45O812V/ttsaAO2aDd7VJGYTamMPGtn1TbpANFUhNtiJ2DpXpn5TIbc+ycOGlK6OtN
	 ODkdfdv8uYm4g4XCJS0QVsYjLjSqHVLapBasSY5Y1kU6QXt0lvdkKjlFCKR/L7HpQe
	 t2ZEDFdWxihhbhBenynJQU4c4+kd4LPUqEeK+BE84Do/KJuqmNK4giuxYf4kl1xkiL
	 /1XqNG90JnMOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: serial: 8250: aspeed: add ast2600
 and aspeed,vuart-over-pci
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260818-aspeed-driver-v6-v6-1-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-1-fd7cc0b338ea@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:41:25 +0000
Message-Id: <20260818104125.8B6AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The schema incorrectly enforces `aspeed,ast2500-vuart` as a mandat=
ory fallback for PCI-routed `aspeed,ast2600-vuart` devices, breaking backwa=
rd compatibility.
- [Low] The schema lacks a mutual exclusivity constraint to forbid LPC-spec=
ific properties when the VUART is explicitly configured for PCI.
--

--- Patch [1]: [PATCH v6 1/6] dt-bindings: serial: 8250: aspeed: add ast260=
0 and aspeed,vuart-over-pci ---
commit f87e924205ddfd55af4d5f7799223f4c9c2ffb59
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

dt-bindings: serial: 8250: aspeed: add ast2600 and aspeed,vuart-over-pci

The ASPEED AST2600 can be used as a PCI device with 2 Virtual UARTs
accessible over PCI. This commit adds bindings for ast2600-vuart and
a boolean property for using VUART over PCI.

> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index bb7b9c87a8072..8dd4b7af0c0d2 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml

[ ... ]

>    - if:
>        anyOf:
>          - required:
>              - aspeed,sirq-polarity-sense
>      then:
>        properties:
>          compatible:
>            const: aspeed,ast2500-vuart
> +  - if:
> +      required:
> +        - aspeed,vuart-over-pci
> +    then:
> +      required:
> +        - aspeed,scu-syscon

[Severity: Low]
Does this allow logically contradictory device trees to pass schema
validation?

The VUART must be routed either over PCI or LPC, as UART FIFOs cannot
be safely shared between two concurrent host interfaces.

Should mutual exclusivity constraints be added here to reject
aspeed,lpc-io-reg and aspeed,lpc-interrupts when PCI mode is active?

> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-vuart
> +    else:
> +      properties:
> +        aspeed,scu-syscon: false

[ ... ]

> @@ -106,6 +128,9 @@ properties:
>        - const: ns16850
>        - const: aspeed,ast2400-vuart
>        - const: aspeed,ast2500-vuart
> +      - items:
> +          - const: aspeed,ast2600-vuart
> +          - const: aspeed,ast2500-vuart

[Severity: High]
Could this result in a regression if an older kernel boots and matches
the fallback?

An older kernel's aspeed_vuart_probe() driver does not recognize
aspeed,vuart-over-pci. It will fall back to its default LPC settings,
programming the VUART to route to the LPC bus at I/O port 0x3f8.

This fails to enable the intended PCI communication and actively drives
the LPC bus, potentially causing hardware conflicts or host crashes if
another device already occupies 0x3f8 on the LPC bus.

Should the fallback be omitted when aspeed,vuart-over-pci is set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-aspeed-dri=
ver-v6-v6-0-fd7cc0b338ea@9elements.com?part=3D1
