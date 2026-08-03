Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D42931F9
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773356; cv=pass; b=OS24ZMbG/XCAK9cAlDogHrxiDjVt63Z8hoDjlQ4ka1xzskp9dDTa9thMSXZQdEuhftHuldAkK3+3fMcqA8IYswGbuuoYB3vjl6mHkxqgYMxtkg6FrucitrqHSGrU58Q8G+ESNAr5tJqI0fPlvSLVeSENSJIIB2x2BbB2ynZIJJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773356; c=relaxed/simple;
	bh=WkleEX41KDLCmTlkLZWoFZUTVoGZM+SKri5I4gXE6so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acMQ2/1Q0ga0IMoI9Pt1b+x512texww8J/bgBqeEh3yWS2HNcJLi6HZFGTCbNshmr+8Y5PsKOI/GKLZeFu9Rj5Ka9ej/vlaF5gqyZWB5ZkpCw1vpcKHpgKGmz/3izGdq/jYpRfhXtLzIomYCzsnQaF/+Dx6p9bOwZbdZdfAI2EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mzX/4zBE; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mzX/4zBE"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-74ab6c88052so1150490137.2
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785773354; cv=none;
        d=google.com; s=arc-20260327;
        b=pQGbvRbXFL1I3K/ZtgP+hBQJ5vrRfVYpJM6Z1aK2oDexTrz0OTPlFpYzG6RXMe6oDn
         uovNjUNEsMFjD3daCfQjuSWmzfrRb6igVbKrnqsYQQyA3xSSZrXESNdloXdq6LfaMj/H
         E3m9TE4on6p+qlT3uF3k/BgGgtZWXOaJvFH6RsvP4N7J6zSB8q4906EJzC3cZRHCCpTu
         OmOIiKMIeBH4fbf0gaENK+hAfnmYIHdHHJp+KW9IrBRYhdpJPEuwdqQnCCFkWTjmLGr9
         qlXrrFzuqI7zumIo8qDlO8uRMA1ofQI2U9+qrfvJ0ybprMreykNN0omKUlZuC58NLBTx
         K+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        fh=wO6g5sq2OxZXatEbwZNYWksW87fBWqhy8Nb9WRWlEXQ=;
        b=UtLXpeL3zs9CVmWdlSXzzPoSk1rg2S3GrwZfkjJdgibCe/A16nPEgTzFwBNwXokg5u
         3dXc7Di6Yg1gGfFyCdWLaOsXZRluf/AkFlsyHPxTQYFIao3WTe46aKAdeWbybooCYREL
         gtB8DYOLGiUabL702YXMtnR5SYOnWElpwga0ubnXq/Nh3LLZgRXpC7yAtqAOKrGPBl8P
         Njh76DdAYMWkGGwpbp+Hr5jV5H+60Mp+A9g3gjo3BrJRNXTKfvkwQEA221tq6oiI9Yf8
         hwxTG6CTRg3kHh/E2VLctawdw8JcIFQA1L8g2XWNp0fqMfy7j2uMlruJKU19MFaTSvLf
         B3wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773354; x=1786378154; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        b=mzX/4zBEe+052mFRm7SN81ZXt0CAziEoNiDYOrD5pharPsfeh55I6PmPLq0cgK0e1y
         BhM7x2jQa0lYSqjxdQ/oDLcOf2Q+LCLttP0Mh/hmVGnDBjp8QlT0GIh5IQucWTu0BwD4
         OYaIACDi+HBZgAPuBARTZVwnkDFKHN2om+KaodZrQJXFQsqpyvUFyiylMnDmuNthTyhn
         O+xYXCu2fkbiFeYeEJgzMI0GvbDpt6L8//8c1i3YyZPSpmUQ7I776Cm7zQFsYAH7MDSW
         F1K+85CRkh1R4ZzmcvrIGjaFIJGVxDQPuXMiLm6SRGZXVxL2U//uIx0YiwA6c8pqQeyA
         +54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773354; x=1786378154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPUuUdXNlj9HGEt2H/gq9i9+yKMP/RfrBRw+r1bpfmE=;
        b=S9uUY+wPyhjpa4NTDIn3qub96RxuCDt1TS1RAo11hRKAIDwUIlRlgXJQ8ReQHp0JP/
         Kl1fHlr3p8pdMhi/ThLkCFNKOK1SmgeDAMELKzcia4GZkEhC0vcmNH0KBvRX6LPbLf2u
         kVkXBX4g1RboUJt2HC4Ofz/KttDy3t9lQJoXmjTOAfDul2E8Nx4iTP1JvCwo+euxVh7Y
         4jsn+yjphMlSspTxoFPWQQxdleswISHL5pA4QCLjBTy7B81a7zcOthGh7epTbvvOka5U
         EA17253uMBzRmz5M4UnF8Nr1QdPn3AMIeYZryUjeS8+R0OfOcRxWuTw/njKE3zi4n2j8
         PNDA==
X-Forwarded-Encrypted: i=1; AHgh+RpyC9HZrI1O5dmvfIYKIEVrW1B2X1ZSENRjS7mITYfK8M45uQIvhBYr1ZapL35Ls3OU84Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6Ohx+dHN9GJYHmeF/jfIeZYvs4O/r2vHPJ5WeMZQqFA7ng5AX
	uCagYdXl5YJjaKi9fTKK26aShzglrfFVpXJaYR1FJOdWGA5KgRLdy01WhZ2THp9Od81FXP5oBoO
	SgR1vVi239oNbja3ah2ETobklKBzWorg=
X-Gm-Gg: AR+sD11bT/vziP5aTQzBWr4pe9rqg4gOsnKfPNws5qt5OYAbAITCQ1+T+obOb+d14jW
	ZpXVeYiCjR171WsJVd4mQxfiSSa6TuvfQG6u4fPXlOyw1VKSCK9F0PRK7oCQTq7VCVhKv3Fl4EK
	TOxAc9XWyGHHtMYq8dibiIDV1CTJEdX5epuCz9vg0Z8b7lhFFCC8xXNh5lUHah22JQihdrIGgPm
	M6NBIkeKOv5/FTLeMnYAfCsANuXKl4M2m/5PpfBqb+z+rBT75cpTpFc+nsPG6ZZB5SITY0+SN9+
	IpBE6XfYmtAr+AJY8vfg/I+K18mE2Bx79olFYt5HpD7bGjdYMChxkgcJEiwiIpaf22lWNqlOYg+
	EBqbayUnuqEKadn4TKoR/3KhXzTI683j5uomWdhiGdlufCpCjRMu5XQRWTy+RDne3+B3LVJ/RDf
	euamyxcJMQiifQjbv1N+sydFhK4hcsb4+w+9xn
X-Received: by 2002:a05:6102:15a3:b0:738:be73:55e0 with SMTP id
 ada2fe7eead31-75b237677ffmr7059647137.12.1785773353603; Mon, 03 Aug 2026
 09:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com> <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
In-Reply-To: <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:09:01 -0600
X-Gm-Features: AUfX_mx9mt9dbVrMmCFnN7qHq2KVIXtx4IDcN-1su1pyV_2ANjujEXVMup0YQWo
Message-ID: <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int
> > +ac200_ephy_ctl_set_led_outputs(struct acx00_ephy_control *control,
> > +                            unsigned long outputs)
> > +{
> > +}
>
> > +static int
> > +ac200_ephy_ctl_set_led_polarity(struct acx00_ephy_control *control,
> > +                             bool active_low)
> > +{
> > +}
>
> I've not looked into the details, but these look like pinmux. Does
> this I2C device have a GPIO controller? Can these pins be used for
> other things than LEDs? Maybe you should be implementing a GPIO and
> pinmux driver. The Ethernet PHY driver can then just select the
> correct pinmux configuration.

These do not appear to be GPIO or muxable pins. The AC200
documentation describes them as three dedicated EPHY LED
outputs: link/activity, speed, and duplex. The bits in SYS_EPHY_CTL1
enable those output pads, while EPHY_CTL provides their shared
polarity setting. I have not found any documented GPIO data
registers or alternative functions for these pins.

Therefore, implementing a GPIO controller would expose capabilities
the hardware does not have, and a pinmux driver would only provide
a single fixed function. The callbacks exist because the LED function
belongs to the PHY, while the pad-enable and polarity registers are
reached through the AC200 I2C regmap rather than the PHY=E2=80=99s MDIO
registers.

>
> > +static int ac200_ephy_ctl_power_off_locked(struct ac200_ephy_ctl *priv=
)
> > +{
> > +}
> > +
> > +static int ac200_ephy_ctl_power_off(struct acx00_ephy_control *control=
)
> > +{
>
> > +}
> > +
> > +static int ac200_ephy_ctl_power_on(struct acx00_ephy_control *control,
> > +                                unsigned int phy_addr)
> > +{
> > +}
>
> These look like a regulator? The phylib core has support for
> regulators.

The external supplies are already represented as regulators. These callback=
s
do more than enable a supply: they sequence the package clock, reset and
shutdown controls, then program the PHY address, calibration and interface
state required before the normal Clause 22 endpoint becomes usable.

> Maybe take a step back and look at the overall architecture, and how
> Linux can represent these blocks.
>
>         Andrew
