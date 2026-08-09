Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF9110F0
	for <mfd@lists.linux.dev>; Sun,  9 Aug 2026 19:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786304017; cv=pass; b=WBa92NAJDnp5JaxfIdL7Gs3ah0VyvCOVGbQty2Zrp7guhKhZB3n5PioNbIPrfJzuui7UiEFw760bP8SZMZkOLweL6Hn/dLs6xUAwf5zfbcUUnOTuCbuP2qqMapjIXeUflrrbXAWr/6ID6iutncg3qaoPwl8+xjOFCVWAIT7MnF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786304017; c=relaxed/simple;
	bh=RPr4HbeOYBx0UUfRs5eyQeh6mneGGhSTFXdVw6+j5y4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpbYMfetxU7evIOu39VX2+DwuORGvA8x9h+y5pFAUkR+W9Y/AaIFOs9LCTPR4Bo9Pe8ggHh09y6zakzodMnYFjpKCM7FP5BWXpFYOQpZ+D8aaf7E1yq7YwqAoNWfmTxjkkWpMLuqpYh+5QZvnug+ACzSEMp6R3Mzcky028Nc0mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kd6j6P2+; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kd6j6P2+"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c375a9e76cso777356e0c.0
        for <mfd@lists.linux.dev>; Sun, 09 Aug 2026 12:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786304015; cv=none;
        d=google.com; s=arc-20260327;
        b=nIdLwZ7S2zWIjEIbExPT4drQEjgh+TNT3p8JGGHsBg5UYVhnexe6us6lIhvBCZD1+1
         IHzP/uQNc2Jp6HBE282dMlQ6eUcMUywK8im3hRLC4Tt3H6t3Lqzx+//QHIx183yNBslo
         eUgPkkIdvNHVVQKak8x2IIIZ8ESZ+xncvtX46s7ThDY4sUlllsbYqId2s2RWc9g4ZCHs
         U2jIW1DjjNhpKW+Js+8ZNi8P7b7918U7Ai9qp/bWMxTfGqXojvUe6Nb64bJw/AiL8DUV
         ptKZ6adfJCDSGRe2gAz+MofAjJ8ovp0LNzEHuc1ZvZDm20stgVqTs/N33FCorqwdm90j
         eJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TGS68oaa5am41wZZT817t30c1pv9fxqQGsu7xsnoMpU=;
        fh=VGiTYPxhULU0+zc/+0OBYFNvQ/TKr2VGDHBk5/RnP04=;
        b=MFewTU6pKrV42wzVd0nMzKxaZ5fxt55Qt8LWisyIJRZIQsmjQF5Pzl+tYSUU68qHGv
         vD2RDSBX5TMH/geK4LOHd2poel9XZqOv0HscumhLawQKXHADH0ll0dMm3W7YhOTvLZ7K
         7Gymmyjn/cOyYM3YxI/SZy457ysoiluAcmRFq8g2DeQPqWgswjb+wz8HOtMpye2dYa0A
         OoSaBCyIpJKdRBWGePcroRwsbGVSSwAyhttKrYJhgg2ZkPKh6tqftKwr1EyyTk/Hv5ZG
         WbJxFJ2VitJvOTIEAZ6/haKKVaecGNmSeywHcApey5lF8U5qeiHsgMMjZmgrijCa6Qtl
         JBcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786304015; x=1786908815; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TGS68oaa5am41wZZT817t30c1pv9fxqQGsu7xsnoMpU=;
        b=Kd6j6P2+2dL60RCA91WrPvGkvb2sZTcMItkjXc5lzB/627dLy4kQIJPLIx0QnAoGnr
         PP0GvsPAzZyrWdqOYk2QjglK1RyuEGKCne9CspP78ZLIvoOT2zd/Z+l9UKhXWdiwbVoP
         2cDuPRwsXmBZNf4TtBcmAlACgRVC3J8VCPYUWU7LPTcJkT4DRHMoZB9vLgS4wKLCdmmU
         jFTRjlgKJ346Ze63hRDkhMgiM0HWLf2zNWZfoS7gSM822oDpOh028PhhKJnMj3RqPeDT
         XIMiClXrusS5iJQQvdDLK1zMs8SG9+Kq3+/kTpjlUZt2jh+b/pGmRhq+9tB1f16/TDNo
         EAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786304015; x=1786908815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGS68oaa5am41wZZT817t30c1pv9fxqQGsu7xsnoMpU=;
        b=NFW7O7TWey8xVMBGMN+v+B8kE46W3+iRdE+l3wHzaOnjy2AXqkKq3W+FE15wpN3b+W
         Ur5TZ+v1MNLz+/atm5+5I/1uKe7WiZpRBLuqTJhMMq0HmqbaYnB7Ok1tnctjAJhC78lR
         GYklJG0MS1QjAdwZzcE6vdvugzW9UnQFObsldyEgn/e+l9P+hWNA9TcmkAQIJjRbqyq0
         3CDIDIYOAAM6rsmxmWLGrB38GwakPNpV+3AFDYpDGsPEf7QUWiAKnxpHXSW7Ouj/DeMT
         FfIJR+z0f/YnV+FTpv/2fSyB7Vhd5PMFKNHCSCTWdbYP1u3Z6nacd/baNXUM11/XHMgT
         /Zag==
X-Forwarded-Encrypted: i=1; AHgh+RoOv3PZXAJwJFEo1wQ3rLS7zp/SgR4GqhLVJPKyDULjhymSyPC4CRUJJ9vcS21q1Xbb3Uk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYjYe6Ed+mJ2AFq8rkQ33V4DP0QUZMLJx+n+GcOYmV9c0ile1S
	RM+UjFG5Joqr+yGT3feIfIUVtk8PohllPZzdA++gAfkAl6fMTINqvVZyVFZN23bB9NaiC4PQMuR
	si85fD4jgQMKSkbSyJkRmtuBSOEo2VKg=
X-Gm-Gg: AR+sD10yZtCW/kv5cHdqTYbI3sjYnpSQbGz3g9voZuIkAdlsw95pIQFOgxesDf9YQ6h
	ZuFzm9RbXsQT0NDa9AA+SyQuLu7aqXLK+kfF2Xq2iYX0+fSdtOgBT92lObAlDi9lHcAS0fCFDc4
	TYawYi7O8HJrB9ZOUjCq9Pac5d6HlGVPjoKNl9wi0vTSfF+hNwR/MfGfNDUok5YVA3qYnpB5AF0
	5lX9F9bBna0/PNWw9NE0oSMxX4AC/f73kObfaIsyk5+OBB2m27nFYSGfVB9zxkHm1sARlda3unt
	KUDn+VpnLmM6fH/7P9FUmPYetcFVJt0EqdS9poio0BIunQO8GNb+Yd2/ANIq5P9Mdtm/1DIOpPA
	CQuaSe6tVYwIemhX++YfQXF4fwvJZEtHstZSfUEcO4bo78ovlYkMiXQg6lFGUg7MWHx5OR33/1n
	GcewIS3CqASA8dPgzIcRIoPawzFREHNscn/X6GePNBPgB/uE0=
X-Received: by 2002:a05:6102:801b:b0:744:dd70:a364 with SMTP id
 ada2fe7eead31-7634d10f5c8mr7573848137.9.1786304015056; Sun, 09 Aug 2026
 12:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
 <20260806-submit-acx00-of-dynamic-v1-v4-1-9bf2f7441632@gmail.com> <0cdd9998-51e7-40eb-8c01-54684f6944dc@lunn.ch>
In-Reply-To: <0cdd9998-51e7-40eb-8c01-54684f6944dc@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 9 Aug 2026 13:33:22 -0600
X-Gm-Features: AUfX_mzOq97FjaI0PSkDYysmL-_ryYIJwwwtqJFoOnJ9tJbRQVWAa9v1yb6KcCE
Message-ID: <CADvTj4oa=G0WYAG1Hw9se3dCXxer24X-L0Oe2X-D14m7FpLOFg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/4] dt-bindings: mfd: x-powers: Add AC200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 9:34=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +description:
> > +  The AC200 is a mixed-signal companion IC containing audio, video, RT=
C and
> > +  Fast Ethernet PHY functions. Its control registers are accessed over=
 I2C.
> > +
> > +properties:
> > +  compatible:
> > +    const: x-powers,ac200
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description:
> > +      AC200 input clock. When using the Ethernet PHY, its configured r=
ate must
> > +      be 24 or 27 MHz, matching the rates encoded by the documented EP=
HY clock
> > +      selector.
>
> What is the scope of this clock. Is the PHY the only consumer?

No. This is the AC200's external CKI system-clock input, not an
EPHY-local clock. SYS_CLK_CTL selects that input as the source of the
chip-wide SYS_CLK, and the audio, EPHY and TVE blocks have separate
downstream clock gates. The audio clock tree also uses the 24 MHz
system clock.

The AC200 core therefore owns and enables this shared input. The EPHY
driver only checks its rate in order to program the EPHY-specific
CLK_SEL bit.

> > +  ephy-vcc-supply:
> > +    description: 3.3 V supply for the Ethernet PHY analog front end
>
> This sounds to be specific to the PHY, so the PHY driver should be the
> consumer, not the MFD as a whole. That then would allow the PHY to
> perform power management, turn the regulator off when the link is
> admin down, so suspended.

EPHY_VCC is specific to the Ethernet PHY, even when a board connects it
to the same physical 3.3 V regulator as other AC200 supply pins. The
regulator core will retain the shared rail while any other consumer
still has it enabled.

For v5 I have removed ephy-vcc-supply from the AC200 MFD node and moved
the supply to the Ethernet PHY package. Both variants now use a common
vcc-supply property, connected to EPHY_VCC on AC200 and VCC1 on AC300.

>
>         Andrew
