Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887769;
	b=5dsK9fS7X83KRjkkQ8b1Nhep519zIOR21v+bAZHY+Ti7tJn8qjqSDHnbzBTAeH2cBYU8
	 zivjhYfYou8YQnNen9a7/r09y12Hm/RrqW46e6Pi9f+DT8trXskPwm5T+dNScz/SWXHLI
	 Gq8+/0sblBiteZCsh3gXgnNGWBb5yH7aXnvYj1umpFmtL5W9N2W1ck8DdIeVaTAdROjCg
	 vQsJOkf2/wKeoRNq0p8oSb2BqkhE0zf98NkHNGZ1v/suOWmFeLKrnj7hrz3LpyB83TmSL
	 9m2ZZjDQbucqp516Jfig7xc44O+v1GBOGHPIk0YTvmMAv70En5r5bGAwafHtcGRo/Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887769;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uWZDC+jKR50KkuL/m90FaOZS23uCXLeIovjpwO7U69c=;
	b=fLbm9XmGjOG6aQ9b/H7qCUdE7VtZWJYPpO/NjY+MXLi4+q5UCqOEm/iTyASNBrPPBjsN
	 JcW6I/b/IKpFJO/PAwFxQqBP4a15a9QvnKc0tnCAWo1j8hbcwQEldmGBnUzuqSTV02Q/I
	 3kWdtUBaAd6a7Dh3fyUMg/hE1MkwM9JLda1UtOAdGQWOM8hcnZEMwG8GS33GldrqtfMwU
	 TmXZIROfO6KE0XfuTtPpEmHX/n1UpiOfA8oFNBdoHaZpRNO2gx5C5Z8xdgUAzc3nJVAX1
	 FYCPy6rWYXRjmvwuD/z0en/LOQk1FAza3tz60FQ1YpZo/BC1TVwu7Z3NKFAxlquSgbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEIc2vgX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260AC606A32F
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 14:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gEIc2vgX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044241F00A15
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887769;
	bh=uWZDC+jKR50KkuL/m90FaOZS23uCXLeIovjpwO7U69c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gEIc2vgXojaI7fLQe2A1eMM5vENRX6IJ9jAXk4+aXPqJGYuaF7IslkQbHL19df884
	 ogA2YlzVBJKq2xnUxIwT1vmileZSCUoP1Nb4OgxAHNwO2RzJsk9lTMbvDwDc5fgHQl
	 ZiHGw3Z578ERPzNkl7ZstfGTIRDC1lITQD9Z7NoTSmkKtWwmz76no80L39/9Tdn4fH
	 CE3/T5QKcatW/sO/NVg2JBzw13sqs0aJxutYOy0W7YD7OcZUXpXGOATS397JiaKLRj
	 5Zw+lrJk41UK6dR4VxKg6dzeNJFlI9s+G+G5QwR7JUL2GXg4d3Iw2VVKl9RlldTTqF
	 OFNr/26fZ/2Tg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ac91f5aa89so17166361fa.1
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 06:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByWP43+EiF9fsneAroX2DaGGi5RkZUq6Dn09f6mhyYDKICiDWMkvlGvf7hiVPnStiCRw1o=@lists.linux.dev
X-Gm-Message-State: APuU4Z8J/9w3ch6W3JO5zvPQC2DoUAhCLUGVN7vF3MMO6cUgDTJuWPDJ
	aBnaWiL5MQEkSmWn6ahHaCzvr1CKRaSaKiApRn+iyptHyiP3x7LbX3A60RvpFADl+YsBuyIbpcz
	JS0G2vHU8oS/mPF32afpPqaLMTv1OAbA=
X-Received: by 2002:a05:6512:688b:20b0:5bf:e4e6:7f78 with SMTP id
 2adb3069b0e04-5bfe4e68c03mr2949831e87.39.1793887767615; Thu, 05 Nov 2026
 06:09:27 -0800 (PST)
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
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-4-455fe9eed5ee@kernel.org> <340843f896db387a7c3ff4d6a06ef7c2155d1f98.camel@pengutronix.de>
In-Reply-To: <340843f896db387a7c3ff4d6a06ef7c2155d1f98.camel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 15:09:14 +0100
X-Gmail-Original-Message-ID: <CAD++jL=sYc2_Pj5k-5d4QqcqNpFjQkcTKJFv4oDhXCHo9kymSw@mail.gmail.com>
X-Gm-Features: AclHuK-xb4f0QrVUB5hiQs77kNWFtdOJD63XyBZhuUtDoapdcW_U4E9f6qqA4pg
Message-ID: <CAD++jL=sYc2_Pj5k-5d4QqcqNpFjQkcTKJFv4oDhXCHo9kymSw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] reset: Add BCMBCA block resets through the PMB
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:28=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:

> > +     unsigned int i, zone;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(power); i++) {
> > +             for (zone =3D 0; zone < power[i].zones; zone++) {
> > +                     ret =3D bcm6846_power_on_zone(rst, power[i].devic=
e, zone);
> > +                     if (ret) {
> > +                             dev_err(rst->rcdev.dev,
> > +                                     "XRDP power-up failed at PMB bus =
1 device %u zone %u: %d\n",
> > +                                     power[i].device, zone, ret);
> > +                             bcmbca_pmb_reset_cleanup(rst, group);
> > +                             return ret;
> > +                     }
> > +             }
> > +     }
>
> This doesn't look like it belongs in the reset controller driver.
> Are these power domains?

Indeed.

I was trying several times to restrict the scope of the MFD subdrivers
but they have this tendency to all require each other so I'll just bite the
bullet and implement the power domains too :D

I'll fix the rest of the review comments.

Yours,
Linus Walleij
