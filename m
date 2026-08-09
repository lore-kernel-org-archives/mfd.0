Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C123D667F
	for <mfd@lists.linux.dev>; Sun,  9 Aug 2026 20:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307359; cv=pass; b=U8XSl1+mYq49Qnb3dGqBC7vPQtbjK4elWUN/RLbT4z20L77H1oWfMuEqhviVYvaHUAb2W1iAWITg4syAk8G37ViqmQIndePGGABRxLImjQ4/uEed1Ox3Zh1fTCqPrLtQUdt26DFaOfgR1A8bqVyMMB4T7+N97EXLwErrhwn74Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307359; c=relaxed/simple;
	bh=BgtaVTkKYB9i7M+jdhZZfelgFvXF+mEulzCdgRhnacw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVDxwJQMaQHQQNWbb8wnaLKTl4uGCD5k7Z+A68GDBjCv9TMqcCDac6PYYroLC2H7K2E9LetJptRaJlZS9z+gZIelYRQGEpydeOKwCEDHFTYqY3GNDYWsB3wTyP+VhX5I1EyRBP6vaeeE4Ki0mh2X4js/waKaKjnvGyzWn+CZnkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN2zzrWr; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN2zzrWr"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-74ae4c75b20so761168137.1
        for <mfd@lists.linux.dev>; Sun, 09 Aug 2026 13:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786307356; cv=none;
        d=google.com; s=arc-20260327;
        b=TX+tC4CcDgzsB16ZdzmBU8fRXFOtat4cO6v0D4cp54kBsgyL2k1AmNtiVZqdzoGtMH
         octmFFjRQBipz70CGl3sHajDlQ1KSZ3IMfWm4OilOsGlwYRZbCDVp4oZIoPvZrJDcpl8
         FguFqoAlzp/HDNJ3Y2CN1+ylZyizPrgEw/oPdQFuHXr5jQduaIvZbpB46cLHkUP+BXhw
         L4TWBBsLivvpyFYVWv0gT3PyiBzRFUbdlICTBOAQNa+oaegcmRGhiU+UjHc8jNH+NGm1
         AK+SnIf9PchB4W0/jqLZ9+NNyxBa5SQAlg2TBih31jYYznrJaQPDnKFvQg4cEHpQosjU
         iwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lqI6t42BdKQforakdSoj5zqucwIqAbx3+vYL6ZUGAQM=;
        fh=l9IFr7iL4s2xroD4BSi/RR4rHuvu/nXEl0VjCj307H4=;
        b=ZoZZjCwPRQf3qqncLyxJs00L9xD8z9gn5tD2Fu+EFTboCsnsr+uGLCzceoR3mL7963
         Qi+U4B5UjAgGmCiN36d1+yoQWlaWdjXgt3BwYI+/gFSqs6pykbXYblT8SKG1rBqu2NAw
         kPIDGBE9N1goUJ0UfGaDEIvG8mQc/GUB4Q30jozQQLaXq/TVL0jGtyxqbjHyEO7RbiZb
         Nv44spYtodkfAQxM/Io4zjzGylFeFZWRDLVC9hqF8jZoQdVjfJlOFhnq7Lu5f6jAh4yO
         AftmXGWgwzxV1GHBRrL7ynQog4iTkUGBKjH1dKqGkKUf3jmAbSturIhmLDJPqxAzulEt
         gt/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307356; x=1786912156; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lqI6t42BdKQforakdSoj5zqucwIqAbx3+vYL6ZUGAQM=;
        b=ZN2zzrWrt3MpWVVrcIm5Z6UbudXVR54afL3hCxJL3wMqdJMy8F9eH99aiDzq32Em2W
         9vUvc/5QaiQeshuZvoEoTafYc7wP/weDh/U0E9Ynbwr/5QavCAMootfsg/WHcpsdddqa
         HpK9REUbsQmU/xOotJO8ySkxUf0aDQy4dQ8xPlqf8CB6suRl2V5K0CVL1Rukb5hKjlHo
         hu2X0FWPTFYR8ziHGIqfpTwLnZN0mME14Sz1R+CYEg9fFD/5LZyeqRCS3PotRULFeCID
         r3cihBevMjpU4BmA6bydOF97N0gxZu/pr13YZHVqF8FNPmvZsngu51sUv4LjZwG0xmCw
         F6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307356; x=1786912156;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqI6t42BdKQforakdSoj5zqucwIqAbx3+vYL6ZUGAQM=;
        b=DstVla1ceriP77haoC8qa93tEEBztpgWK8qFjUYxb7WQB0r298SkYY3DrTFUXPweDs
         WzD0y32sijpmaJTSKu9knA8AN1m8ESYWwyBvx+rVdRjlmwNzufkCoiWaMTMjdaDbqxLb
         a3ayBRE2A5txFq/1gr4zPBa+LoeXDPr7neUqlK1r0ZJFhuzteOuzPWeV5h0/EdDzvDPd
         nuMNm77vrvJ4VnMAILF1BsA9i56KCMhkCd1wVQysQfbBomWs8bu62gyrpmC4sgjy1+yi
         JDlgLX7geda1Uld7ig5erB9CVcuBMVoQYUVuI97/OfucbNw3xmlD1An4MN4NZeAcADZ0
         JLhw==
X-Forwarded-Encrypted: i=1; AHgh+RqW08HZdR+MutxXUfnUh9dwpkf+um3ho8E/+aeQmmFoyvIx1v0PEhMbI7AJdapJ8mEF7Dk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz+HT57ser01LW2B7JCyv+cx3pfZztpSrOdEtuoaqL1toQUTjK
	tm6r2eWPxKJjqwAJR5Rh1PsXKEWl//W07E90uK8e4Ff1Y//16PZ2boASX9B5048aeNcV630yCvY
	k13ujTRapCMGTzK6nEyWDmFJ14y6Zktc=
X-Gm-Gg: AR+sD11ToT79xObIdNeKSmaizGneHc/liQweDSP7HzKWdQz6fBb52lnhYSlrEjtYFCu
	xHbVMfhzLkOe8ZvaxOzTQRKb25zG6ZqqbZfYMtDrXzp8+Xp/Drk9MPR62JxtGzxFxuxaoAJcGH2
	o1XhPPKLxu+3DX3NAcc9RGKGfquBdBfUjLBlbs/ktU6YVCB5nZ24llYJLx22Zti5ILeYfUjFMvF
	a1xvkqoq+dgDxaBnyZAMhOdoLqj1XMetdbc32AEPL+dhahuEHWn4PF7o9yiVcQPrT66M6LiTLIN
	3oeUJ0GS6TwWrQytQI673bU3yUUdwHpNq/lWDn3va+VLPxsdIKVout072MoHxRwuI6UYwMIIawF
	otGv97YaE1bU22Fl74LEzSS1nNjrydZnmWnyrUhHfI55XC52Im6asiGu2be+uqES+XsjzelXHob
	pdg/51oVsHehLPPLXOM6MPPhcY+1+46dvE2KT2FQ==
X-Received: by 2002:a05:6102:1510:b0:738:89ca:65a0 with SMTP id
 ada2fe7eead31-765213c1716mr1391331137.9.1786307356117; Sun, 09 Aug 2026
 13:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
 <20260806-submit-acx00-of-dynamic-v1-v4-4-9bf2f7441632@gmail.com> <c78c2c35-52e7-4393-9714-06039d8a3f28@lunn.ch>
In-Reply-To: <c78c2c35-52e7-4393-9714-06039d8a3f28@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 9 Aug 2026 14:29:04 -0600
X-Gm-Features: AUfX_myH4wks2-Q5Fk66AAdiXlKqq3NVL2fkKURJiEoPFq00IVVGviYpLv4QDTk
Message-ID: <CADvTj4q0=aBf=V=rXyKeVcR1ZZtBsTkkDZ58qLLbhkunsCzpKw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] net: phy: add X-Powers AC200/AC300 EPHY driver
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

On Sun, Aug 9, 2026 at 9:51=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Aug 06, 2026 at 10:51:29PM -0600, James Hilliard wrote:
> > The AC200 and AC300 contain compatible Fast Ethernet link PHYs, but the
> > link endpoint is inaccessible until package-specific control registers
> > have powered and configured it.
> >
> > Add one PHY driver which binds the link child and joins its parent
> > Ethernet PHY package. Fixed package compatibles select the correspondin=
g
> > backend. The generic ACx00 compatible reads one packed configuration fi=
eld
> > and selects the backend before touching backend-specific resources. The
> > AC300 path therefore does not resolve or enable the candidate AC200 I2C
> > device.
> >
> > AC200 obtains the regmap of the referenced I2C MFD and keeps it bound
> > with a device link. If CONFIG_OF_DYNAMIC is available
>
> Please drop all the CONFIG_OF_DYNAMIC code.

Removed in v5.

>
> >  drivers/net/phy/Kconfig               |  11 +
> >  drivers/net/phy/Makefile              |   3 +
> >  drivers/net/phy/xpowers-acx00-ac200.c | 388 ++++++++++++++++++++++++
> >  drivers/net/phy/xpowers-acx00-ac300.c | 404 +++++++++++++++++++++++++
> >  drivers/net/phy/xpowers-acx00-main.c  | 536 ++++++++++++++++++++++++++=
++++++++
> >  drivers/net/phy/xpowers-acx00.h       |  28 ++
>
> Since there are 4 files, i would suggest a subdirectory.

Moved to xpowers subdirectory in v5.

>
> > +struct ac200_ephy_ctl {
> > +     struct acx00_ephy_control control;
> > +     struct regmap *regmap;
> > +     struct device *dev;
> > +     struct mutex lock; /* Serializes power sequencing and state. */
> > +     u16 ephy_ctl;
>
> What is this locking against?

In v2, the AC200 backend was a separate control device. The PHY driver
obtained its callback table from the supplier and invoked power,
interface, and LED operations from probe, reset, PM, and LED paths. The
control driver could independently invoke power_off() from its remove
and shutdown callbacks.

The mutex therefore serialized calls crossing those two driver
lifecycles. It prevented, for example, supplier shutdown from running
power_off() halfway through a PHY power_on() sequence, and protected
cached state such as powered, phy_addr, interface, and LED
configuration. The device link protected lifetime and removal ordering,
but did not serialize every callback.

When v3 removed the standalone control devices and made each backend
private to its PHY instance, that second entry domain disappeared. The
mutex then became an unnecessary carryover through v3/v4 and has been
removed in v5.

>
> > +     client =3D of_find_i2c_device_by_node(ac200_node);
> > +     of_node_put(ac200_node);
> > +     if (!client) {
> > +             ret =3D IS_ENABLED(CONFIG_I2C) ? -EPROBE_DEFER : -ENODEV;
> > +             return ERR_PTR(dev_err_probe(dev, ret,
> > +                                          "AC200 device is not registe=
red\n"));
> > +     }
> > +
> > +     if (!device_link_add(dev, &client->dev,
> > +                          DL_FLAG_AUTOREMOVE_CONSUMER)) {
> > +             ret =3D dev_err_probe(dev, -EINVAL,
> > +                                 "failed to link AC200 device\n");
> > +             goto out_put_client;
> > +     }
> > +
> > +     if (!device_trylock(&client->dev)) {
> > +             ret =3D dev_err_probe(dev, -EPROBE_DEFER,
> > +                                 "AC200 driver is not ready\n");
> > +             goto out_put_client;
> > +     }
> > +
> > +     if (device_is_bound(&client->dev))
> > +             priv->regmap =3D dev_get_regmap(&client->dev, NULL);
> > +     device_unlock(&client->dev);
> > +     if (!priv->regmap) {
> > +             ret =3D dev_err_probe(dev, -EPROBE_DEFER,
> > +                                 "AC200 driver is not ready\n");
> > +             goto out_error;
> > +     }
>
> Please take a look at syscon, and syscon_regmap_lookup_by_phandle().
> I think it will make this code a lot simpler.

That does simplify the consumer. I have converted the AC200 path to use
syscon in v5. The AC200 I2C driver creates its paged regmap as before and
publishes it for the AC200 OF node. The PHY resolves x-powers,ac200
with syscon_regmap_lookup_by_phandle(), so the device_trylock(),
device_is_bound() and dev_get_regmap() sequence is gone. The lookup
returns -EPROBE_DEFER until the provider has published its regmap.

Since this is an I2C-backed regmap rather than a generic MMIO syscon, and
the AC200 driver can be unbound, I added managed registration for
externally created syscon regmaps. It removes the syscon entry before
devres releases the regmap, avoiding a stale global entry after provider
removal.

The PHY still resolves the I2C device to establish a device link and
obtain the chip-wide input clock. The device link provides supplier
lifetime and teardown ordering; syscon is now used for the regmap lookup.

>
>     Andrew
>
> ---
> pw-bot: cr
