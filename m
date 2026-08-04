Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C217331ECF
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785818284; cv=pass; b=ZG7in1zFJL/t+uWlxABp786unvs6GPL6ZAXYeYe+uP7TgphYI84MrXyALP2TZrUP8qkW7OH/5jwMcPX7PV/DoFaamVwabfM5HMfQGNHMV3bZpOXGRFNlKirdyJREk3fOmTcPu8o9JY1wmYGIUf/9UkyHuY59dTYeShf+OScCot8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785818284; c=relaxed/simple;
	bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6v19ZryoZnqJdbO0S+Mx+dXO7FskSo5RXJzVVNldt/gPXgRp8zj6HUL1Z36btJPErkSe0uAJ7FPBG40c/35P5O40WzZz7AkXq+7cKeF24OBu2QIi684AIryGZAHA9TMI7KtYDs1g/SxBHhH/lsX/Z7B+ZT+IU8GM4nMxqNrjHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp3SYlrk; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp3SYlrk"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9673385b1efso1434947241.2
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 21:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785818282; cv=none;
        d=google.com; s=arc-20260327;
        b=L7OkVYEnAE7Y2ZY7YdfGOMStLTpPw9aUvs4I8ECaWSI2TQQj4sv0xL3NrRekNXwV7o
         w8RVdZOuLg4QAiJFEaBQjsf+HV5gX9z9UyEvHk/6X7zBmO0BwHbJxSxsZvw8edwvQGwN
         xKetjzmFoE4LXK0kHUY0brD5J7UaiaSvtEtz65UNaNUPFB+qqmE+l0NwyYNGKKGWRyqT
         VdD43OnA3qf3wEcGdkmZMmWUkvty1fseUWhWKiATsl7lKUECedIBYvzsnzULhvVa8b46
         RDl1Q/ryBImTyGctiGrDdZCprFRNHQd+vrtYhNOCE5uTpsIhYb7WpY9YqKnorSRdup5O
         bKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        fh=cYpbdsLrobeTZevRPbikEeESl2DYOUVEVirOliJ2Wmo=;
        b=nCWFVX1Gfh/Z45U2/kPMEhPfK2uxKUyD1cpN1ot5n/8E17XcQBHi/Y2YBZBcaLVQV0
         pLj4GwBHbXTwBOnV4osAKCloukTxEf2LUJg0PCSL9IQS+804OH0bC80TIaflqMAQ8YKg
         xBQzRcjDZJ9QqEaQ48L8QGNFY8TNvpd+NwJNKRdaMl1JNU6CDpHrXoNVRNPTQcZ/+G2I
         e282rJ1HOlLZyJfPzr+5ZdNx8zToLdWEfNrHyzK0og2RBKiZilVV/3mCHGwF0/W1W9Rv
         MVb5akNP09vdeVZgrKeOSQFsjqLQBSqD6wHYVHdZw/8d5/4C73mV/RCJg7+TdkEWsP+a
         zjlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785818282; x=1786423082; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        b=Zp3SYlrkLg6iX4rFr4rjNZ92sRjxketuMKPE57wOOCgpRb2uaSspU9Dol2BvoSyvy9
         FUlv2Ln/Gy7Hy+MgFwiGjxFoAvReu934U7juUJQeo5ZRCChYhu8edyAhY5Jb5B2uhmKk
         zejHop8P/ITyZZHMdqSdncvZtyyNxsu66lUmQYkVxDbJRpRop4VGKeEzkD4XyfOYR2hP
         amo0aGNq9xOVDnMfRjO5xozT8Kt4CqERzxNLe3XQhuwWKd4OR1rHwW0ow3wWziEpchcN
         0CbD3LVf1uiU9gQe7UY/VjbFBHJlRJ6KWfHstI25J6rFjbcwxnZu8Y9Tu8zmdxj3ibLF
         9bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785818282; x=1786423082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCujiFsubPppZdIzZBFgzB0FHL+kaNCYcrxKl9k6kYk=;
        b=YwjPCzTjavL+Nu4SAvznNROwn7HmPINIa89fRqrPpQVOnkT/tjVyuor3kCCzFkPozv
         T03j6Ams/xiMcnh11EpoKIW5LIYMpkuWYeGUJk5ZN5yh7TiYV1Vo7W+oCRv6whVTxzLB
         vFxxkuvw+VqZHt3FzCN8bzcjW3XR8sSpjlNsODqJjO22+EBh4oLhT4osbzQpjwpf8dK8
         t6wcpqMp1gU/ygtlDUypqnIcm6J6xnavLq9jLnDW4Ny94LE9oSmK5nX753E6ldpgD7Du
         3SfJIR04KfsE3uiJsNb3B5/+NvEHCFjHZIc3u/oOIHh/qRRO3/62VS8lHNvlcf4st+Bk
         XbIA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9E799x1md3kvMiaQyTEuecetZwZtFhpozVTZxjh0JlaSW6RbTAzwAZlK9pZV6e6UDMQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVmO7ImYhn8pAellZJDWmXz3nefAG1CbOsEjL7g0xhhOhKf0TL
	P/UKAjyhVdSr50lNPL5RnSuaVtVE+DV4Ql5nVecNIMVNizZW87/wlhL5ycQ2esL2Iu37Mmlj/5o
	WIIK90Y+bE6iEwIMgzvVbfl7a0f6Ru1w=
X-Gm-Gg: AR+sD13yEG8I/nlZVhO9a08kqxsq2DWqy7+mukWfNl69xQsHIhcvrjJPCAgqn1tv0Ww
	ZZEgaMDyuRxz2jYls+e7J1BxIgxxbZN5vBhIEwMwZpE8CcvoqZfi+/BMiSJFDJtD4Sg0pyx737b
	41OmHF+AGszMOhGkJEtwSXRLPJhygQweMIlWTKPpNgAZP+C/zBun7N3rh31J7ZEmu4vJpx+fUXX
	tjea4SWT9k/x2zoUA8ssuy0QQzfuTXCP1mjs/Pt9W4qQePML8/knV9IRbaoK2GAGfWmA4n5O2+Z
	+VgBMkf1weIGKPqSeDpzgG3VX1rXw1J53MhMnbd5sBjoLh+Zfga1JqxYDSZU3TP2EiXL5yFbFAe
	1D7QJwoM8B9W04NJi6zFMmwD7u9B0QMp+tpCRfucuEVegzTHQWNfjHjfPi6wpSxV2TvCC+TbBfZ
	X/lEuDpBu4i6JaxfduN7fdreWjg1lKA+H4Z1jnqmbN+NXkzTrq
X-Received: by 2002:a05:6102:1492:b0:745:78d4:4856 with SMTP id
 ada2fe7eead31-75b2226b36dmr8916982137.7.1785818282020; Mon, 03 Aug 2026
 21:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch> <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
 <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch>
In-Reply-To: <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 22:37:51 -0600
X-Gm-Features: AUfX_my4YsBDZd6K0e5M7YLW68aLI1B4Ub2Wc8OS8k7km2q52f4ciX_OEuUghsE
Message-ID: <CADvTj4qpHU3F0DrEmc0vFi+JiwTNERniiMHKo1LmBd8sg58wJA@mail.gmail.com>
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

On Mon, Aug 3, 2026 at 8:22=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > So what i'm trying to do with both of these is make it look more like
> > > standard Linux building blocks.
> > >
> > > If that is not possible, i would actually put all this code into the
> > > PHY driver. You then have a regmap property to gain access to the I2C
> > > registers.
> >
> > I understand the goal of using standard Linux building blocks where the=
y
> > fit, but I do not think folding these control paths into the common PHY
> > driver gives the right device model here.
> >
> > The AC200 and AC300 expose the same Clause 22 PHY interface, but their
> > control functions are separate devices with different transports and
> > lifetimes. The AC200 control function is an MFD child accessed through
> > the parent I2C regmap. The AC300 control function is a separately
> > addressed non-PHY MDIO device. A regmap reference only describes the
> > AC200 transport; it does not represent the AC300 control device.
> >
> > Folding both implementations into the common PHY driver would make that
> > driver manage AC200 MFD registers and resources as well as an AC300 MDI=
O
> > control endpoint. That would mix the package-specific control transport=
s
> > with the otherwise common Clause 22 implementation.
>
> Given how messy this hardware is, i doubt it is discoverable. We have
> been pushing back on hacks to enable various things before probe in
> order to make it discoverable. So you are going to end up putting IDs
> in DT so that the driver probes without it being discovered. That
> means you can put any ID you want in DT, and the driver. So you have
> two different phy driver structs, two different probe functions, etc.

I agree that the link PHY cannot be identified by reading its
registers before the package control sequence has run. I do not agree
that this means an arbitrary ID should be placed in DT, though.

The Ethernet PHY binding explicitly defines
ethernet-phy-idAAAA.BBBB as the correct contents of the PHY identifier
registers. It also documents using that compatible when clocks,
resets, supplies, or another initialization sequence must be applied
before those registers can be read. That is exactly our situation, so
ethernet-phy-id0044.1400 lets phylib create the phy_device without an
initial MDIO read. Once the selected control provider has powered the
hardware, the driver can read MII_PHYSID1 and MII_PHYSID2 and validate
that ID.

Both AC200 and AC300 expose the same link-side PHY ID and register
layout. The package choice changes how that PHY is initialized, not
the identity of the link PHY itself. Inventing separate IDs would turn
the compatible into a Linux driver selector and would describe values
which the hardware never reports.

The package variant is discoverable independently through the SID
configuration field. Fixed boards can reference one control provider,
while boards shipped with either package can use SID to select between
the AC200 I2C control provider and the AC300 MDIO control provider.

For that reason, I do not think two phy_driver structures and two PHY
probe functions model the hardware correctly. There is one common
link PHY, so its Clause 22 implementation should remain in one PHY
driver. The two different implementations belong at the control
endpoints, where AC200 and AC300 genuinely differ in transport,
resources, and lifetime.
