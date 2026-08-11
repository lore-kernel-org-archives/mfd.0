Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51EB43D4EE
	for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467426; cv=pass; b=GZsHsIYJU4A12rRPWpCw1xJgoaQ4sTZQvWjHIXTIP4avkv/HQO+RszMvQsw3H6m6cMpyJIAf8h9HRu/avWGbAQuaP85HZKfZQKJzOBarvGvZ0QFQif1401gqLh11gtHtfYLooRmb3snA4FdTSolvxZWK60/DjzbQRlN2Q8vCXOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467426; c=relaxed/simple;
	bh=WJwVUNGk3840EnYTjL9NZR9Pums0TeyOXrhf1u77duM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ofn/drQ/+N6Hkos1iUY0L9tJaYNmW7Xv41NZKcU9lPXFX40xnJJZSMzd/gabA4yoVSmUnqULuJY9nk6ZyiyMToCKZPgCNdWuQQEnDxYLZBO5DqLAMYloqeeuHacaWlJuhVABM2xJ240aYPawJJArVfgH3clQ88dwdBtsukmv2FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Es021ri6; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Es021ri6"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bf95ade656so1195378e0c.1
        for <mfd@lists.linux.dev>; Tue, 11 Aug 2026 09:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786467423; cv=none;
        d=google.com; s=arc-20260327;
        b=BEosbv+wgT7eCcM0zPtXi0OY/VQr7Tn3Tcsux6qxOfRxf9TgasgJML5MlA7wSA2APF
         Z4jaNiHnpaQyKAH/sH81dyo5AQNPf5l63NZHukgoqqrAy7c/4mODPRm/0E2KmKifVNUB
         EPJ4+jmT9BGKliQinzQQctCtXsuzJPaRwnjkJTbCmTHFbhg93G2UvDaLdr2mMQln4gwF
         6sT0SOEzEgi+UKnD7fCNARDxwS69q0y1qCHZWOAQ8RS+Cxo48c1gesVcRiDZkJIXjJ5w
         +NcJ0ZL8SNOTVCncNqDqNbB54Nbkm4qbQTxPO0qU7acyw05VKdeHn/FVvRN4HBliabTn
         FK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tj/pt5c2Le4XorZBsZ80Bj7mh9gKDUVFZvHXGfPcyVw=;
        fh=AHg81eWWhpaPEC7tQtqsPlF9fI1DYFSrRNHnhAfue0A=;
        b=F/Y9XcYc/kk+p+cc4bQm3hGw0Ve13tq/UPkVvvxQZ9++vjjOkSIlczLZRl9gp9M2HX
         dSm25MPcxsdtRvHQzKttNtYQ6lFjpdU4sfLnmzQnZDZ2LO41a+FpyDaC1yT9Vk9zejn7
         xhG8vs3ex37nRi8f7wwQqfpnHeMoulFDriL3VLs+g9XzRUNh0N9jOgnc7vVztd4eHssa
         BRXlu3626+24nuLHopbkGJwBA5I3Hc2CQWpwZIHg3Glrqj9PLMoGrj+sRtE0jGUeim7L
         VHEydDTNXda8mQZpgJV5LcCAVFekr/fq07uUFuW6gxSEUh8EkJA0wxkVajifgzvXLuEG
         RQSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786467423; x=1787072223; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tj/pt5c2Le4XorZBsZ80Bj7mh9gKDUVFZvHXGfPcyVw=;
        b=Es021ri6K3Gk44dZ8k65ZObAxmr7TGehjA2c7R6zM31fI5B8/AvXZPCfacsSHAkDUj
         xASPSEfZE+Jexmwu/LiU2XkvDrp2qrun9XQs+RIkdwUAEYG48SbynWWITLRrocnQxpTi
         23crl+BjOeycAPn+A/zphVw+4YsskSofRzS4krWYtyARW5Q8GZjPVvx/0qVWJjx/W/+b
         NxMDDVGocADdFtoUyFZmwG4wRs/EIxPrKnf2MNLpxg9RftaEoRmEX4rb8p3Bl7ezpDxr
         BSp5uWDHV4HmgTa+amOUjW29iV3ELuVh+B3cTLzdLzJSGdJVlAAXlWXivBBQXjTS/5Ja
         WtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786467423; x=1787072223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tj/pt5c2Le4XorZBsZ80Bj7mh9gKDUVFZvHXGfPcyVw=;
        b=oOLUpYLrMogwb6xAJZJGCCBHrs69VCudUAEoe9HOG2KO9ePbFN/ct9/i5l2GI2+o80
         kCayHLcVIQFetpsIr0XZvXBAIapzSK55Imwtq5xDCdIXJK3otTvM/yrdAWvWzHWxNj2i
         dWwMUt0WniKTXBXAN46YaB7NxoR9FgixlKbd8ASJp3ftbJarYkh6v3lQIWuKVU5fcccr
         pL9DBq2a/9T6m+D3EMxVOqyGLO6M1P23HzfXIBAmosFEGb8UVpoD9jIOEmo6ws5rE3T+
         6GpiwLKV1LRd8oRCBSoxoviwNVGgFH69+KKwflH3q65IMw0JjUPlWWaRJ//C4C2D1VQw
         wlJw==
X-Forwarded-Encrypted: i=1; AHgh+RpzM3NlkwWNFYyYyXHOaC/pqm4r13e4rLoi2oTD/UlvCtyESqDl2OV6j377tuHF8Rp78Mw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9e+BEUG2H1Tvl6ziWK0DqdY35eyM3Hh42+J1P4HJ7Wbc7Aic/
	+qGI2v/ljP0raENxDOrfZqC7YGgwRQ2Q1y1/NJqzJ6KQ7B61c98Yo6766PIIRypOdTrniX+g/bI
	DyF0EeZOiAFdl/7e1z8np0pDc1MN6DRg=
X-Gm-Gg: AR+sD108JmlvI6i2SLy5VPrFVLiAzwrk9oQKpYzGq4oFbfNFtKD4xp1/WCrxfAQgBJM
	kOzi6m8MPiKaCO3YwoCZgYo0L8GM5K+fC8JqN95uGQoBCKq/X+IDy+/EHJfc+WMu1vSki4N6qb2
	9MNXrfhNfdiTCCIhTkXTYgbIIeeg4SmYGo4C6vJPXBUo2d+YSrcqj2TMYzXLMlgvAIzj0jW2tAc
	DMAFJeQn/VpYBIB8iLtVw4hBKVEZPu/O3Rwhx3iNv/ogp3Pd/+PXICs8oGferOvT+CsQ3RhnlKL
	NtiJ4YtjQPvkXiXTF4tgv7Pxy68JjZ0x0Zp5YjOJYf2TNd3LqRd2Kren3Zp46BfaCbqSU4YiAJI
	z5/au1X0KfvkiDhSyOB5hoifDizS6jNJjGjcflNP7a9CB3Iuf9TBzyHVgMecEYs8zneEtgDWWWt
	aomzn9uJPrcyHjyMxu+0ugHkMQgb29arzhFWPs
X-Received: by 2002:a05:6102:3a06:b0:728:4383:c831 with SMTP id
 ada2fe7eead31-76b56bca401mr1120585137.10.1786467423387; Tue, 11 Aug 2026
 09:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com>
 <20260811-submit-ac200-mfd-v6-2-c5b1292c8498@gmail.com> <159b4ed3-3718-4563-badd-3627bc51a41b@app.fastmail.com>
 <CADvTj4qUEA-ccFj0cSQgHb8+0jB4m6tcpsZZwveZhC_RE8w9vA@mail.gmail.com> <7bfb45da-8b67-4fda-844c-e2608c36d539@app.fastmail.com>
In-Reply-To: <7bfb45da-8b67-4fda-844c-e2608c36d539@app.fastmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 10:56:51 -0600
X-Gm-Features: AUfX_mzQUfFFSUrNJIFNZt3WbhL8KrbabR-b4FGHdTZqhNoiTZjRpswzEiLa-qk
Message-ID: <CADvTj4rLO9SDY1CKef-VpbUVgNxJdtro45z7vY+cc8rB22i-7g@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] mfd: syscon: Add managed registration for external regmaps
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 5:03=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Aug 11, 2026, at 11:17, James Hilliard wrote:
> > On Tue, Aug 11, 2026 at 2:47=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
>
> >> I don't think this is the right way to do it. As far as I can tell,
> >> the device you have here is a generic mfd that uses a regmap, which
> >> is not the same thing we usually call a syscon.
> >>
> >> The of_syscon_register_regmap() code path was added specifically
> >> for chips that have a traditional syscon but depending on the
> >> firmware may have to access this by some other means. This is
> >> already stretching the definition of syscon. I don't think we
> >> should take this further and allow normal device drivers like
> >> yours to register through the syscon framework.
> >
> > This was suggested to me by Andrew:
> > https://lore.kernel.org/all/c78c2c35-52e7-4393-9714-06039d8a3f28@lunn.c=
h/
>
> Maybe Andrew can clarify, but his reply can also be interpreted
> as saying that you should copy syscon_regmap_lookup_by_phandle()
> into your own driver, rather than changing the actual
> syscon code.

A literal copy would still depend on the syscon registry:
syscon_regmap_lookup_by_phandle() parses the phandle and then obtains
the regmap through syscon_node_to_regmap(). It does not find a normal
device associated with the referenced node.

A private AC200 implementation would instead have to find the I2C
device, establish lifetime ordering, verify that its driver is bound
and call dev_get_regmap(). That is effectively the v4 implementation
rather than a copy of the syscon helper.

Is that direct device lookup what you had in mind, or were you
suggesting another way for the private helper to reach the
I2C-created regmap?

> One problem I see with your current approach is that the lifetime of
> the regmap is not the lifetime of the user by the framework.
> Unloading the mfd driver while the phy driver is in use will
> destroy the regmap. This is a direct result of syscon being
> a very special case that must work during early boot instead
> of being a general-purpose abstraction for managing regmaps.

The PHY creates a managed device link to the AC200 I2C device before
obtaining its regmap. The driver core therefore unbinds the PHY consumer
before allowing the AC200 supplier to release its devres-managed regmap.

The PHY also checks under the supplier device lock that the AC200 probe
has completed before using the regmap. This prevents it from observing
the regmap while the supplier is only partially initialized.

See:
https://lore.kernel.org/all/20260811-submit-acx00-of-dynamic-v1-v6-2-0229b9=
9a32f6@gmail.com/

> >> Since you already have a top-level mfd device here, just use
> >> that to pass the regmap to the child devices like we do for
> >> other mfd drivers. You can e.g. do this when populating the child
> >> devices through platform_data, or get the pointer from the
> >> parent drvdata.
> >
> > The EPHY is not an MFD-created platform child. Phylib enumerates it as =
a
> > struct phy_device on the SoC MDIO bus, so its device parent is the
> > struct mii_bus rather than the AC200 I2C device. It therefore cannot
> > directly obtain the AC200 regmap through parent drvdata or MFD child
> > platform data.
>
> I see, so the fundamental problem here is that you have a single
> device that is connected to two buses and both the OF devicetree
> and the Linux driver model are rather bad at handling this.

The link PHY is enumerated by phylib on the MDIO bus, while
its package-control registers are accessed through the separately
enumerated AC200 I2C device.

> I would probably do this in one of two ways:
>
>  a) have a driver module that registers both a phy driver and
>     a platform_driver and figures out the interaction between
>     them internally.

That would require creating a second platform device for the AC200
control side even though the actual PHY is enumerated on MDIO. The two
driver instances would still need explicit instance matching, probe
ordering and removal coordination, presumably using the same firmware
reference or an internal registry.

>  b) have the MFD driver export a private interface that lets
>     the phy_driver interact with the i2c registers and
>     make sure the i2c_driver sets suppress_bind_attrs=3Dtrue
>     to prevent it from being unbound while the phy_driver
>     is loaded. The symbol dependency itself is enough to
>     prevent the mfd driver from being unloaded here.

If the private interface only returns the regmap, it would largely
duplicate dev_get_regmap(). It would also introduce a link-time
dependency from the combined AC200/AC300 PHY module on the AC200 MFD
module, including on AC300-only systems. Avoiding that would require
splitting the PHY module or adding configuration-dependent stubs.

suppress_bind_attrs would prevent manual sysfs unbind, but a managed
device link already provides per-device teardown ordering without
disabling unbind globally.

> In either case, you still have the choice between a proper
> abstraction that can deal with multiple instances of the
> ac200 device, or slightly cheaty but common assumption that
> only one of them can ever be present.

There is also the approach used in v4: resolve the exact AC200 I2C
device from the package phandle, establish the managed device link,
verify that the supplier is bound, and retrieve its attached regmap
with dev_get_regmap().

That uses the existing device and regmap interfaces, retains safe
unbind ordering through the device link, and supports multiple AC200
instances because lookup is keyed by the phandle. It does not require
an additional platform device, a private exported interface, or
disabling manual unbind.

Would that direct device-link and dev_get_regmap() approach be
acceptable?

v4:
https://lore.kernel.org/all/20260806-submit-acx00-of-dynamic-v1-v4-2-9bf2f7=
441632@gmail.com/

>
>       Arnd
