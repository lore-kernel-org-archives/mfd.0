Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456792;
	b=wpKHDaJ/oa3hZpQXvkIlv3qlXhfw7P7+5xuYykxNvgJPMW3cFHwlEUA7jGJtjUt3yjXg
	 wIRQnL3Tc+R2TUvh38KIA01rMScanyw2YX7oCXEZvZT+fNi6SkmM/Wo/dGmKJwOPDg0GG
	 A1eSM6IMfb9h2m9NmG+1RVrWCSutU1lxdg9KMoKieJ3Y/1ly3iqz/ETm1EIatHSQITdZk
	 s+IQ5D5/huhoIlmZdR0chbCy4ECZb85SDBIJJ3OCv8FNmnt/EVYRlQ5JzS/0biGDqOcEf
	 Sf02GuTijWf7lYh8NUFwlz7gCxAJJPrE/CbuotdARsR4MCWTRK/GztpWr9g8IDfKSHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456792;
	h=DMARC-Filter:Message-ID:DKIM-Signature:DKIM-Signature:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Organization:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FfRowKDIqJJ06TaZd/p2W/N3uwv5mRb2fjX+HqmFftQ=;
	b=lv3dAp612I72RmPesrOeO9wBPf6H8qj769Pz6hMYBLmpPZZ+Ch4XiR3qw1m5oFz8PUsi
	 n+2dibWz79J42H8h9hdmXreU7OdTSA3g5lKAYBEd53A2dLDW/es/mI3DDGjhR/v+ZoXMG
	 LiABp7gPxVFE02RHQg0CtSrImkqRfwDP5//XV0uZOMSVMn5oyfqro1fzF9tLFrYCDPjLd
	 J5y2vf9HeO4j/Iu45ROfuHAH3lQp+3He0A/tuvcBYtZYd3eRKMdbUoKsrrKGs9OlEvkPQ
	 yQxzuVjSSRLx9ZVl1zqxTeQoIGkidxM+778bO0EKbZvTcVNiTdZhQ7o70YH9FZOCq2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qdNnJWs2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=H9brzsHb;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242AA606A31A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 17:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qdNnJWs2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=H9brzsHb
Message-ID: <4d56bd92d27429c3ac2cbcefac74c0327b3b3af8.camel@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795456789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfRowKDIqJJ06TaZd/p2W/N3uwv5mRb2fjX+HqmFftQ=;
	b=qdNnJWs2gBgEno4xTlLe1uC8g2lqMnVCLCvKovXdlAuEYoc+cskX1LjfmvxpH3E3DqJkBz
	QWeKfftzs63qkZLnAPtsumz+Gr7+LBeR2/CjOeIokqxV9ZG11RJV1/W9adZXeDFAe/DUxj
	P8BhHS0v7bOXrn2ufXI4RNCDPO6NJFAXVnNylfT4MVSE93pdbQQVl5eyFXRoEn8wPU2L4Q
	W3V/Cbv0EQMzjlj9r67OzAN2B1LBckNCLrPCZTMmJhuGJWwrTtyQyPrVoKcIa8aNKioGht
	V198+DE1P2FqZSARJqMTxdtLWwopGsQ59jp3noTngzd2+RQN3XzAUYcZDLxqMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795456789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfRowKDIqJJ06TaZd/p2W/N3uwv5mRb2fjX+HqmFftQ=;
	b=H9brzsHb1FdVP4AXC4/J+YYXSesAezfa+fCCy/79GGG2FjVP1ko/3/QaOfqmG8iM0mXWWB
	GYT7PwK0nivO+5AA==
Subject: Re: [PATCH net-next v5 4/9] dt-bindings: mfd: Add SoC-e SWIP parent
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
Date: Mon, 23 Nov 2026 18:59:48 +0100
In-Reply-To: <20261121-lurking-bulky-crab-b9619f@quoll>
References: 
	<20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
	 <20261120-devel-vstrassheim-soce-dsa-ml-v5-4-5de9225715e6@linutronix.de>
	 <20261121-lurking-bulky-crab-b9619f@quoll>
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

On Sat, 2026-11-21 at 11:19 +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2026 at 03:52:21PM +0100, Vasilij Strassheim wrote:
> > +examples:
> > +  - |
> > +    ip-core@80020000 {
> > +        compatible =3D "soce,swip";
> > +        reg =3D <0x80020000 0x10000>;
> > +        ranges =3D <0x0 0x80020000 0x10000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        ethernet-switch@0 {
> > +            compatible =3D "soce,swip-switch-00-04-0c-10";
> > +            reg =3D <0x0 0x10000>;
>=20
> You have conflicting address spaces - this covers all other children -
> which suggests this is artificial split of device nodes. Basically
> comments from last version are valid. If some split of device nodes
> makes your driver easier, it might be fine, but only under the
> constraint of proper hardware representation. It's not proper hardware
> representation anymore.

Yes, there is a conflicting address space here. I used the full IP-core
range for the switch child as a shortcut, because the switch registers
are interleaved with register areas belonging to other child functions.

However, that does not properly represent the hardware. Sorry for that.

I will describe the individual register regions for switch in the next
version:

    reg =3D <0x0 0x50>, <0xb00 0x1200>,
          <0x3000 0x14>, <0x3200 0x400>;
    reg-names =3D "global", "switch", "ports", "statistics";

>=20
> Best regards,
> Krzysztof
>=20
Many Thanks!
Vasilij


