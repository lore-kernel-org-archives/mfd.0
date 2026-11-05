Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919993;
	b=wmATwWoHpT6N3y+eRxawZC0Kt1HBxRSaZSvmNTJRPtp4Plzv7xuJIKh5822ckkXre+KV
	 xC8ALip9EPVK4bYxMwIBjzo/CgqjWoDwhUI90mQUSPICbL6UOy1TPpmivmYy76vjIJ+6V
	 XOUWNIKipSZcNs+4JNccxRO8K7JkpOPgmkx+WgFiTcnaCLqimLCw9CB09cA3k7VEpVHth
	 XeqVRaGKeqwl2AmgdMEo2glfy2Wam0n4QBZftWw44ef1kvsPAHjzSVvQJ0FjjAuVzfh44
	 gzFvRrxCcuQsk4c5Fn5qGI8LVMOULuwcLpqLPGhf2qmWIZMQguRo9nNr7o363K07+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919993;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YaBcuTS2/J1mzNJ1LILtsklT83XrE9jGAVFB2V2Mc28=;
	b=0eDKKiUwLTxi66JKlz+2VuWBD+FZOSj0iERy2xjCs4rAxnoJrR1400PGc1FxifPRrDj8
	 3CcHRA8PZcvKCYPzAPrgTVxOuAqPQBdnfkderJApwB6Z5wmshtHD5jc7Nh/69rDCs+8Vc
	 ykZZpVzCwEA9jdgyvRvN0I1uQCdb31GEO/ZaSiHRGLnKnci3QJsJBOm5HDrnKCXJcW+/O
	 l3JigQFKZkMCFRu3aHuCmopHJz2MdVCyiQIk/w/rIDoFsy48yCo4mKyRwdMSlFHpw5w/W
	 HlhRZ4hLq0Sml0ePFbXPyXTA8a/HQpWRcQGI/DeQzZXAqy9P9BZcAlezXkZWdDLmg3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfCU20bl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D94C606A329
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 23:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfCU20bl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4151F008A6
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 23:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793919993;
	bh=YaBcuTS2/J1mzNJ1LILtsklT83XrE9jGAVFB2V2Mc28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YfCU20bl5BO8wiSlNqEOUlaPEOjSEKdEZ1tP0SQeC+sbSm8Ylz2A1J83L573TwGJj
	 LRYptvU5PS1s7p/S6vUmxHEC9jOz8zU9563xmG8dDB7Kq4PrSzY+aKwvPaeXADd7xT
	 ytS9Hh08EYRFfPsRu6Tt7NLI137BqSqFSx9hSQVq6cHyV8xdTDK21jPBCR2/IquQWQ
	 JbxDbaTwHWnmcDr/Tw3W7JSEieJIFbr9m4JV8+k41O8TPbUVNCS33PnKEbuTZm2gOl
	 O5kuf4FmNB4pUYdjvsKOTXBO89ukTb26mXnqfzrlrGm8vv9daUIlIVQikqiN9a4gsK
	 yZduW67QlWtQg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bff8fc7cf2so55791e87.3
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 15:06:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBymBTnYxi1Ph/nOm95SrB0aXTZU7exBUUMUn8VgIrNthdLsh5tg3bIVqNlrYoVQS8nDsT8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/0QIk1lQqC5Wwe4MhHIbnX0pIfsbAN0RvxwURqzEsHc+sfL5kl
	nPhpwqZ88L3iDGKuIvMm4egPATmQn2tL+MmoDixQDEHkk77Ei0IMrFe/jqaZHwmWg6/giJt0zbf
	l93XY68i64lvX+n18UPTH6f6HYsc1Xb8=
X-Received: by 2002:a05:6512:12d6:b0:5bf:d072:fa3f with SMTP id
 2adb3069b0e04-5c003aedaf5mr130898e87.54.1793919991966; Thu, 05 Nov 2026
 15:06:31 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-5-455fe9eed5ee@kernel.org> <179383086680.620422.9240673673295480953.b4-review@b4>
In-Reply-To: <179383086680.620422.9240673673295480953.b4-review@b4>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 00:06:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKQof8mO1KNRvZxE6Tin65w8jdSaZT5OqV_O7pwVD_8g@mail.gmail.com>
X-Gm-Features: AclHuK9TCTCv47BMRDRzDvAaOOJPAOA3SDISY1H9ALtJZ7Baq-LrE9h49u9eXP8
Message-ID: <CAD++jLnKQof8mO1KNRvZxE6Tin65w8jdSaZT5OqV_O7pwVD_8g@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] clk: bcm: Add BCMBCA PMB clocks
To: Brian Masney <masneyb@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

thanks for reviewing!

On Wed, Nov 4, 2026 at 11:21=E2=80=AFPM Brian Masney <masneyb@kernel.org> w=
rote:

> > +static int bcmbca_pmb_clock_prepare(struct clk_hw *hw)
> > +{
> > +     struct bcmbca_pmb_clock *clock =3D to_pmb_clock(hw);
> > +     const struct bcmbca_pmb_clock_desc *desc =3D clock->desc;
> > +     unsigned int shift =3D (desc->channel % 2) * 16;
> > +     unsigned int reg =3D BCMBCA_PMB_REG(desc->bus, desc->device, desc=
->reg);
> > +     u32 value;
> > +     int ret;
> > +
> > +     switch (desc->type) {
> > +     case PMB_PLL_CHANNEL: {
> > +             unsigned int regs[] =3D {
> > +                     BCMBCA_PMB_REG(desc->bus, desc->device, desc->pll=
->status),
> > +                     BCMBCA_PMB_REG(desc->bus, desc->device,
> > +                                    desc->pll->ch01 + desc->channel / =
2),
> > +             };
> > +             u32 values[ARRAY_SIZE(regs)];
> > +
> > +             ret =3D regmap_multi_reg_read(clock->regmap, regs, values=
, ARRAY_SIZE(regs));
> > +             if (ret)
> > +                     return ret;
> > +             /* Firmware owns PLL power and reset. */
> > +             if (!(values[0] & PLL_LOCK))
> > +                     return -EAGAIN;
>
> Should this be -EPROBE_DEFER instead?

Not here since it is a .prepare() callback which is called at runtime,
it would be weird to get this return code from preparing a clock?

> > +static int bcmbca_pmb_clock_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct regmap *regmap =3D dev_get_regmap(dev->parent, NULL);
> > +     struct clk_hw_onecell_data *data;
> > +     struct bcmbca_pmb_clock *clocks;
> > +     struct clk *ref;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     if (!regmap)
> > +             return -ENODEV;
> > +
> > +     ref =3D devm_clk_get(dev, "ref");
>
> This is never used. Is this to defer probe until the ref exists?

Yep.

> > +     for (i =3D 0; i < data->num; i++) {
> > +             const struct bcmbca_pmb_clock_desc *desc =3D &bcm6846_clo=
cks[i];
> > +             struct clk_parent_data parent =3D {};
> > +             struct clk_init_data init =3D {
> > +                     .ops =3D &bcmbca_pmb_clock_ops,
> > +                     .flags =3D CLK_GET_RATE_NOCACHE | CLK_IGNORE_UNUS=
ED,
>
> The CLK_IGNORE_UNUSED has no effect since there's no disable /
> disable_unused ops.
>
> Also why CLK_GET_RATE_NOCACHE on all clocks?

The latter is only needed on PLL outputs as they need to read
the state of some hardware dividers. I'll restrict it to those.

I fixed the rest!

Yours,
Linus Walleij
