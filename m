Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB4595732
	for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 19:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067712; cv=none; b=H/9rn7QBmNFjl64vMhOMgwh92C9NtOqYjKht2wtmNQ2GdL1NgzZijtYc0ZxIGm/BrCu3UvC9GrCpgyzulVbOnnAoENwTfzh2aZxl3WrI15e73IFQxVPHPduOwQob4ZKw89xmsxW19jYPxYJrfhXHkJUvFpQkHXPDAuaO8GYFK1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067712; c=relaxed/simple;
	bh=SIjCw6vu2Nolc5BGLxkzrlpiPylpl82CNVXXbYaAcVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aOyy9e4EXbxChG0l9BdA8KCi/Hao/dFFJrxC9ZVQgAdLZ3q8t83080UwRaROD6PTc/hr+u22qJgdsP5Pq8zlJU28vJyy0405dOc1DQBjhMHcTMskT2JMQ35Kg0GZmAhIEwf/Vz8eJnfYb84KpQjzjYt/ZEDm1WxSjvXKPsz7K78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ/KvyAt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ/KvyAt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so105942f8f.1
        for <mfd@lists.linux.dev>; Thu, 10 Sep 2026 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789067708; x=1789672508; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fbV+eT9jOuG2Qn7UfINqLkpoy41J2mIUSyeK6YfW10=;
        b=cJ/KvyAtyfVBV3H+5tayoHauKoPgAoS6SM1ABpgBOLvIy53MgIhZpVd+E3oOqvSbfw
         VwM6lOYunxhKLa8HkN1IkHk1JqNHWHMteRUpjyOGP1EXMgxABvp9MnOB95DUZfwkWAhA
         8xaNVJJ2+nKoDGJiLLqpmf8tUs9TJAfG4PciM2tv+6sFOqOP1fKpG1oDjhUrCnIF+JKm
         r+4PzhWjEk9Y6+rki92ylpI7JeUi1UwvtfRO5ngbcIHkNO6vbNkmkDpHTCib1StYYBsN
         9iYy9vNCtSnR694nuF6o5+z8KarWIQ3g+nCn0eyBd5ibINoBy88NcUHVehlQvGCi7Cr6
         N1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067708; x=1789672508;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4fbV+eT9jOuG2Qn7UfINqLkpoy41J2mIUSyeK6YfW10=;
        b=IKLjT/o2gKOMy488oIlwgcQvHMGHbZrRn3DdhjQlbKsPDFD1I8pibRmZSNfkL09uDo
         KoDGdocQdpWoJZnZ2oc5l9wUfK3qHsy5/aWE0qOFDSl65FvFqLiTCnFvUIyMBXx4rhZ7
         k8O3fQWOwgESKKZshxUrDNwtojYvgfwKZWV6sMicEhpDTc4kMpSgk4uoXp/2UztQ9cZD
         ySK1uci+ZwkyXeImSnj9imosTUdylbG4qzt6mlJ+M4fYJCaSsAdq2b+hN8zJdGrwhbqp
         XBd6EE5SY5x0b3kifNHpkxk+7xm0WcGyViJw4i9Ii6MxQfCcloVa6U//uCswdY6z6Gxw
         SIwA==
X-Forwarded-Encrypted: i=1; AKwUvByrlw5hHZre7w9p7g4aaSQVV5UaP9J/aVvP4rHxWUU2b2W3a+uOr8DjSKLFJwSS0rwcMRc=@lists.linux.dev
X-Gm-Message-State: AFuF++lOSp5bFG4+kDSGbXnw/fE8vbi8Haht7dDXdxn0JQF2D7DL8q6y
	FT9PFz38xNcjOxfmZnZ/hMr0A/pg2jJZG5bWMrA7h9Xgu5nfIsnp/MlR
X-Gm-Gg: AYBFou2zgIRBieG+oS8jafEMk/Z/6+0eWgBaPbZQu05gnnSqQWaULjY25PMchS5xRDp
	IvztmcR+3tiLJUJrLAPAt2AfBikcaUjhDRq/+/sUZlpE/YFI35w+/fGU4yu1e/fSqnFQ+0X/jZB
	qImxvOpWcZeQGhgW6fF1lx6JxfAAZpN9hrtkjoU/gAR6KIzmMDhSP1kRv1fzpcQkaOYsOfduW+S
	KReYlFkzu8ZOZnT60h+FMipgBQD3cSidcMF/I2E0WOqjsnExJvkZXHLR9Md+zg83MuuOygsnTUK
	+AYTbuDTAPxQaHQW/2HkRmFcJZ45s+YkdrD0TnmQDOB3DQLqm+H3L8tGIWX1DgAHxHWLw+Ukxhk
	tdinUEbnLuewVNF3m5Jj3wVQMeoXP/rzi0Swfvr96ZczmCX4rGeFv/HGkfHf5zoFMUdux5VhNtW
	U47AAdbSlI6CAb0FcAlup1f4KdGxC4IEn74gBlQ3H6kj0WQ5iSKlPV0lfWUiVTArhERJjmIrybl
	ea11Y+Ivg==
X-Received: by 2002:a05:600c:a07:b0:49c:fc6c:be0d with SMTP id 5b1f17b1804b1-49e619bd19cmr5097405e9.19.1789067707645;
        Thu, 10 Sep 2026 12:15:07 -0700 (PDT)
Received: from strix.localnet ([197.250.227.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a33d72sm4385485e9.2.2026.09.10.12.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:15:06 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject:
 Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 10 Sep 2026 22:14:54 +0300
Message-ID: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
In-Reply-To: <20260910161711.GK1051768@google.com>
References:
 <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-5-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartKW3nFVAkQr2M_09ZHSiKcQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartKW3nFVAkQr2M_09ZHSiKcQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Thu, 10 Sep 2026 22:14:54 +0300
Message-ID: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
In-Reply-To: <20260910161711.GK1051768@google.com>
MIME-Version: 1.0

Hi Lee,

Thanks again for your review!

Am Donnerstag, 10. September 2026, 19:17:11 Ostafrikanische Zeit schrieb Le=
e=20
Jones:
> On Wed, 26 Aug 2026, Stefan D=C3=B6singer wrote:

> If you use of_platform_populate() there is no issue with this living in
> soc/.
>=20
> You cannot use the MFD API outside of drivers/mfd though.

I'll keep it in drivers/mfd. of_platform_populate would force me to expose =
the=20
inner split of the CRM devices in the DT, which Conor and Krzysztof advised=
=20
against.

> > + * Copyright (C) 2026 Stefan D=C3=B6singer
>=20
> Are you sure ZTE are okay with you Copywriting a driver for their IP?

This is my free time work reverse engineering work, not something I did in=
=20
coordination with ZTE or payment from them. I only took information about t=
he=20
hardware from their GPL dumps and not code. In my understanding the copyrig=
ht=20
of this code should be mine, and putting (c) ZTE would even be misleading.

ZTE provided U-Boot sources on request. Their kernel sources were already=20
public before. Sadly they provided no material on their LTE components.

I didn't explicitly ask them for permission to upstream self-written driver=
s=20
for their platform because I don't think I need it and I'd just expect a=20
request like this to languish in their legal department.

The kernel once had support for a related zx296702 and zx296718 support tha=
t=20
was removed in 89d4f98ae90d ("ARM: remove zte zx platform"). This code was=
=20
written by Linaro and I believe commissioned by ZTE, so I don't think they =
are=20
upset about me doing their work for free. At some point I'll resurrect some=
 of=20
the drivers from back then, which will then of course carry the appropriate=
=20
Linaro and ZTE copyright notices.

> > +enum zx_device_type {
> > +	TYPE_INVALID =3D 0,
> > +	TYPE_TOPCRM,
> > +	TYPE_MATRIXCRM,
> > +	TYPE_LSPCRM,
> > +};
>=20
> What do each of these mean?
>=20
> Is the nomenclature taken from the datasheet?
>=20
> If not, can we improve it to make them easier to read for humans?
>=20
> Failing that, more comments would be helpful.
>=20
> > +
> > +static const struct mfd_cell zx297520v3_topcrm_cells[] =3D {
> > +	MFD_CELL_NAME("zx297520v3-topclk"),
> > +	MFD_CELL_NAME("zx297520v3-topreset"),
>=20
> Why are these works concatenated together like this?
>=20
> Same with zx_device_type above?

I don't have datasheets. The names are from ZTE's mmio defines, which I exp=
ect=20
to match whatever is in the datasheet.

zx297520v3 is the name ZTE gave that SoC (printed on the chip, in their ker=
nel=20
sources and boot messages). Yeah I wish it were less of a random string of=
=20
letters and numbers. I believe it should be in the MFD cell name as a kind =
of=20
namespacing. In the (unlikely) event hat support for a different ZX SoC is=
=20
added some day it will bring similarly named "top"/"matrix"/"lsp" controlle=
rs

topcrm / matrixcrm / lspcrm are the names ZTE gave the 3 clock/reset/misc=20
controllers. The DT binding docs in patches 1-3 elaborate on the respective=
=20
roles of these controllers (although that understanding is based on reverse=
=20
engineering, so it might be wrong)

=46inally, "clk", "reset" are the names I gave the child nodes.

Rather than write zx297520v3-topcrm-clk, zx297520v3-matrixcrm-reset I cut o=
ut=20
the "crm-" part.

Can you think of better names? Are you OK with the names if I add the above=
=20
explanation as a comment - a little bit shortened, and making sure I don't=
=20
repeat information that's in the bindings more than necessary?

Cheers,
Stefan

--nextPartKW3nFVAkQr2M_09ZHSiKcQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmqjAa4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi1l4P/j2RW0zmocuD81Wb5sZv
znns4ujhGapOszlboqNQmeHKggVJawfrXfzWDfrJjPPoh/CtxKqMnktV0jNxud+F
2epOFBD7UpM75AM6FVhx++ol5zDBVsuGFUjJMTmJ8m9jji4bNEuZcD2mTtlAt9Hr
E19NYXZLQ1QsWdUi05+JaAx40GfP3swda/sENz78aOm4KNkcbbnE9OGaG4JaTbb5
xfNh3OZ5AlBeIKlfsZFdtJSKsb/iBpEIc24hMHVaWm+h+KjbFKpP4034lGwshYzT
tB1BoP+jJ+ebVTKzKTpT3xiuW+cLQDegDAyKhzYZulk4ILuzIq7JomMVn4P8UzHR
3YNTu8DdCEZbAqDDMNlWWTkpYRPTSvYtSbivB6DeCM6oO46o7WvlnFqcjWRqN4/z
j0s062KBfAkiodcaVaeLCjmg6aPqYKf0/yjhDTsjZRiDSn6nIs58JPh8PNhfgNhw
4XHOVKRhzTYxOrOJxP33xgwbQf9IeJQT6n3UFqw62ieLCpR5uFd31vIHHS+bH2kd
dAv3ER5fhNZcladCb4H4Nbx4TwiQ+ry3+KIPEJWre3zFNW0F79AGo1yz21/Buy6h
NBjFRtosY8KazSjZqVHFdCn9N6N0X+1x3R79gJgTRSXrCbk/icBx9pACGfOb0pET
wvukjxM7IWssDtOA0cwG+zAr
=PTj7
-----END PGP SIGNATURE-----

--nextPartKW3nFVAkQr2M_09ZHSiKcQ--



