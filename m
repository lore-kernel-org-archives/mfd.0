Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516858;
	b=axQsRMCyGVL5xKsvxnouD+MA7WPwSNFhrbVTiZMAFcBTnE03apjjQ5GbTMfRLzQJuVry
	 wZBtV974h2peFmaqJr3qW7pHbP/TVyJwr9JnSdSCezkWifA5XvUJ0ZFSD9iYx3jGy/buM
	 HAfiXPmNmIUsaTvEW51iOaH6PGGfVQJGiO/7bsW0SWXOggbbHqgNUZIHQELRZtcf2dU1C
	 /WiOBwJLYzxHIgxsCbJnKaxcUDpHTEEmn4e0OyqFGmaEZS6cpZIFa7INS8nVEaAppqgcg
	 E553V0FDMAm51l66P52B1SqlOmFPCzkS8sXThEiHbX1HC26as1FXym0/dMmERrp9ezQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516858;
	h=DMARC-Filter:Message-ID:DKIM-Signature:DKIM-Signature:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Rb9J0hSRc+mSsT0T6DiOfhg76UjavfvENEi0jQslYHY=;
	b=UQksa4is+fWFBDEXb+2sANTeJaLfdA96rEPAVYnQ3Pqb3dZ5F+KiXGDq2mnz4hmDbU3i
	 VkwMd0PH2xXRbvdujXbmUWOjVZpKuVh9SSYUQfH/Xo4ELauSG5voJejt2j1pXAXzQ3SWh
	 v1/qNeNe1xTuWMw035k1uKDy0j1GDsegB2V4dId8OqtOyGJ3J+Yp0WUL4gteCzRUz584d
	 JavC+fh3quHGJOajLXVPJ/LzQbzIc58v3WAiS5w3WeneaUzPA0bWlSHM1RikjQHkJYHSB
	 7W/RXzy32YnQl5gbyux1gSf5Sxg171VqNWYV4ntN98cQ8ogbpUAZoQnmiLVG5PUPMxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HfngUNTA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Axiv8UFE;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D61606A322
	for <mfd@lists.linux.dev>; Tue, 24 Nov 2026 10:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D61606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HfngUNTA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Axiv8UFE
Message-ID: <fd998850d10838b97a3627ac7f9eafea6752846e.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795516855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb9J0hSRc+mSsT0T6DiOfhg76UjavfvENEi0jQslYHY=;
	b=HfngUNTA+8qnIMWJ74QOqK1c2HJEfoD/qO4IzC3JDW/2tIHlXQXhHOgTqN+xXYJIvM3c5/
	4O1NvveekJqzqBU/Y06WKA+o9dw8gcCfej164dJNWyHfYgwBUD+b52FStHhdPrz9xUWGZ+
	y9Ou/CsqameWQnrbnhD1lfFPp1Jg+93juKOK50jwSuaW4nesCGt5zwq5QSAPI/v1Myz0Nt
	PwbDEEQ7smN6VCih1I9mvDg/a3d0c9FYeGaC+iUCi6Q+EUGM+eVW/YbLRcMttrf8T7o1ze
	8c50gZwaIIRlYK32XpWisI6AkSvaegWtgKplSLm8bhz9EaNxkjj5060qE6SUWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795516855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb9J0hSRc+mSsT0T6DiOfhg76UjavfvENEi0jQslYHY=;
	b=Axiv8UFEAkx0LUy5zK8nNlC5Fu/MLL+V2QMS0NLB7kh/BQL16vXNMFOw55zcFMXv5wWH72
	9qys7gGcmKmUOYAA==
Subject: Re: [PATCH net-next v5 3/9] dt-bindings: net: dsa: Add SoC-e SWIP
 switch function
From: Vasilij Strassheim <v.strassheim@linutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <olteanv@gmail.com>,  "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Eric
 Dumazet <edumazet@kernel.org>, Lee Jones <lee@kernel.org>,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, mfd@lists.linux.dev,  Martin Kaistra
 <martin.kaistra@linutronix.de>, Benedikt Spranger <b.spranger@linutronix.de>
Date: Tue, 24 Nov 2026 11:40:52 +0100
In-Reply-To: <20261122-camouflaged-pretty-camel-79f370@quoll>
References: 
	<20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
	 <20261120-devel-vstrassheim-soce-dsa-ml-v5-3-5de9225715e6@linutronix.de>
	 <20261122-camouflaged-pretty-camel-79f370@quoll>
Organization: Linutronix GmbH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sun, 2026-11-22 at 15:54 +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2026 at 03:52:20PM +0100, Vasilij Strassheim wrote:
> > +$ref: dsa.yaml#/$defs/ethernet-ports
> > +
> > +properties:
> > +  compatible:
> > +    const: soce,swip-switch-00-04-0c-10
> > +    description:
> > +      This compatible identifies the register layout; its suffix gives
> > +      the offsets of the core version and feature identification
> > +      registers (0x00, 0x04, 0x0c, and 0x10). Port counts and optional
> > +      features depend on the FPGA synthesis configuration and are
> > +      detected at runtime using this register layout.
> > +
> > +  reg:
> > +    description:
> > +      Register window of the IP core. Switch register blocks are locat=
ed at
> > +      offsets defined by the compatible. The MDIO controller and bus
> > +      multiplexer occupy separate subregions described by sibling node=
s.
> > +    maxItems: 1
> > +
> > +  ethernet-ports:
> > +    type: object
>=20
> I guess this should follow:
> https://lore.kernel.org/r/20261120002549.1908299-7-prabhakar.mahadev-lad.=
rj@bp.renesas.com/
>=20
> so: additionalProperties: true
>=20
> > +    patternProperties:
> > +      '^ethernet-port@[0-9a-f]+$':
>=20
> and:
> '^ethernet-port@':
>=20
> > +        type: object
>=20

Yes, that looks good. I will do that.

> Best regards,
> Krzysztof
>=20
Thanks for the tip!
Vasilij

