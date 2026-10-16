Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCAD313267
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135220; cv=none; b=P6UiA3rvli6m3I9vZ1NZkOreukb+MPBYLnr+3+fSxAGRyJtpncuLS5oYcTN4SQtNKR31OKArO4G9LXL4Or9E3UkLAgVdWygM+Pny4U0MOmbH9Vf08FRH6ebor6Qf83C1g8NBTCMAUzrmaLBJiUhm/W6davNUE9qCCEwLBbJhOvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135220; c=relaxed/simple;
	bh=rRdkht83PecwdZYGF4/EuY654Yjjl+PVaSprnxYvdgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjLdV+oycqhkIeycQynj1ytZqv91ooLvB5l1TCyZ/ZUBfzHghN4dl9DSQfwKvgvdR58BcU+aMC5KEsBMVA364cKKndBOz76+jRZYIY0pA7kNY8CMLhphTTmb81FOL29gJXzvsE0+g+7Hadkl0Y3Mdf2acx0HZwV3x71HK6tulfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eeafm8+u; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eeafm8+u"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so437386f8f.1
        for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 00:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135217; x=1792740017; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRdkht83PecwdZYGF4/EuY654Yjjl+PVaSprnxYvdgs=;
        b=Eeafm8+uyZ70IeRdHBwED7giH0Tj6PeL23jGGE1cmeGeJtbyyWJe+hSmf/1rdnaZ09
         kRbp3BrAg8vlPUBQJuwciiVviYXT2CMn9m/EVUpumJiYVGEoR4ruQym6Qt4CZiB70o+z
         eOmxyC95dVXcx9DjezFc8DJuTb3E5lkp7xVpxV3Kyx+wZdbIKcn8YqQ7IAdDQyMjbptP
         gk4ssJCYJDj+0U/KjPcSudh6zC84viLoSy6CJwl04Ibmuf3riy/hv1tjv3iGS7qXVgy8
         GYl+a/XyDwZGmabOBThLoKs9uew0zkJEbvq4m3PLrRD8t4ksLiMZ32ngGzPhtlYi8jtu
         +keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135217; x=1792740017;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rRdkht83PecwdZYGF4/EuY654Yjjl+PVaSprnxYvdgs=;
        b=sdx8mxLfCbJ+Me7DK6/90zSrclNZHG6nJQ2qXjrEh8K7JxppHDI8JVlSSPxY3/DCN7
         YVKLyp2sGGPwNIC1dAX3mEdCvbPqMyITzC6c742dOrSO8kiiYisa/jFVIjVwwP4GBLCr
         lpdTYjfdZrClDd3Sn5fWwhUf6PA+eMMYQdrcY9TsxFS5mHOnGk2qgw1mPPcUxU7JrXC9
         xm/xZxnnpJD2M2P8a3UBUKXsMa3GOp3PBtXuv9OE7chqHXv72bZa9PcFtoDOItfD66l/
         LvFMjwqMm6CXHbpiPr1/VA8maDrZy/4x2mOW7FZqzfFMTSj+HvOCSw/qtatITag3Rppr
         VSdQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+7wkWdJ0E9KTiN7v/wMERm70yXq27ZR+0dr1sL+NWFLlBCjKqMNnEXJtlyfXrD2ArVU0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIoaylNKJgmn7GWiFzBtRtfLWj61WwkThS9j5lYnQ/OcIYvEPkc
	9t0PR0JwdBy48dogoCeS/jIoT7kRZbP0Jot5A6a7Y+7I24/VdbkV34GK
X-Gm-Gg: AYBFou0T3zhf8L4tWf59N2vxI6vPcAP5RfY2XeDUU1A2B0os9WCF2+LbDxj3GZA7fOW
	YS9ZQ/3u9fUOdW+yZUWa/H/QQB8zVqBhjbrUnvbEEoUytvU0Uuw12bFo+2VfO7HjH78zrUE6uD0
	Cc3BoBYoKtx7lBQKhJnFFWKuvUnHIumO4Fb7K0eduCZUwFs3VSBFUEO3+1dUSCVw9JRBcBJQanr
	K90aY0wCoh1DrUmizDmJB/KVFuRw7n990n6g8ntIpn11boDEUP16+cXLLPaY+NUPuQTVBlgZtSZ
	cou0YSHjyxt94WUMQkpNY5lsjlsOU87/YI8Sx1qWSM5ygpPJTzhUU0tHhwTqlMTlqxcXKbUWhDI
	5ofjsunzQedyYc6VVy9Sbn7RdUXcd3kQia/djWced4Xik/B4QUGBppjS80B9XwwyqxUl/F/oGru
	25RSoniZ9YAj5U8qNLBXa1u9PlXFTyRI8U/w8O1uhDESv8xZ1DWZ67JyfstQw8j6wcjUSu+sGQe
	ZX/hgPVchFNO+9MRIhTnKtvW+vKfonRRYayAXQfi/4M34RB01xK3hCh
X-Received: by 2002:adf:e194:0:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48ddb77d4ccmr30168211f8f.6.1792135216962;
        Fri, 16 Oct 2026 00:20:16 -0700 (PDT)
Received: from silicon.doe.home (194-118-146-41.hdsl.highway.telekom.at. [194.118.146.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8d12sm3220071f8f.36.2026.10.16.00.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:20:15 -0700 (PDT)
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
 Re: [PATCH v13 04/13] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Fri, 16 Oct 2026 09:20:09 +0200
Message-ID: <D_WXy70pRh6G3mLeAQ5LsQ@gmail.com>
In-Reply-To: <179198492486.839288.18023026004912443161@kernel.org>
References:
 <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-4-70d8f673386c@gmail.com>
 <179198492486.839288.18023026004912443161@kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartSBEYK6dqR3etXguuqPrywA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartSBEYK6dqR3etXguuqPrywA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Fri, 16 Oct 2026 09:20:09 +0200
Message-ID: <D_WXy70pRh6G3mLeAQ5LsQ@gmail.com>
In-Reply-To: <179198492486.839288.18023026004912443161@kernel.org>
MIME-Version: 1.0

Am Donnerstag, 15. Oktober 2026, 17:34:06 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb=20
Lee Jones:
> --- checkpatch.pl (3 issues) ---
> Line 227: WARNING: DT compatible string "zte,zx297520v3-topcrm" appears
> un-documented -- check ./Documentation/devicetree/bindings/ Line 228:
> WARNING: DT compatible string "zte,zx297520v3-matrixcrm" appears
> un-documented -- check ./Documentation/devicetree/bindings/ Line 229:
> WARNING: DT compatible string "zte,zx297520v3-lspcrm" appears un-document=
ed
> -- check ./Documentation/devicetree/bindings/
> ----------------------------------
>=20
> Is Checkpatch right?

No and yes - the bindings were the first 3 patches of my series. Since you =
are=20
cherry-picking the mfd patch only, the bindings will obviously be missing.

The bindings got merged into the clk tree and made their way into Linux-nex=
t=20
already. I guess we can either ignore checkpatch and the issue will resolve=
=20
itself when the trees are merged together or I resubmit the mfd patch when =
the=20
bindings made their way into kernel/git/lee/mfd.git . At that point I can a=
lso=20
re-add the MAINTAINERS change and it should apply without conflict.

I am still fairly new to this - is there an option or issue I missed?

--nextPartSBEYK6dqR3etXguuqPrywA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrR0CkbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoivEIP/0vSfR3/njgy0m1LUgVO
q+5cFYUtXHEkTjMCC9Q+aMIgABBs0SuqM6RR5Rl3VJe5Mv7oqMFg9y8bAu+8+fxn
wc20CEh9mqrONVRIpI9XleietOAuGLQiOEA7TMLpBJUZcGgAbmmrWR5RFIbff7AX
xTD2LumJqjHDxvFgzTpZCotBjcRdXbz9OdGDZktoolRSX7ytW0EpCMIbtMxHgjVp
kXQs03o4E6LjFU5d72FpIFR2wKLMRah37age3BllAZt/34RtVjPb/KZtARSMAOGZ
rpvXE6CjYhZ336gPYfcqEOFGcrix7X4krLw9HDCukXILHtMIcDAy/9d+42yL3gXf
yqcQ9w9o8BBNpWoLM5FttbLXu+YgkAkdd4nLCnrZDRseJ+EeBRYM38ARM09q5yie
GorF56gygRU5iua1+FzC/cPOsynDoXErJVeqf7uF5kmLjEDkW0HnWRTd4hMJ7GMI
lb61VJSbCft1qkWXgwRbkOKAfjcW8F3oTWfKJmNJV/e/rTlfgiNAxoKjtfQ+SDNG
BYcy06GCOI3ec0pSeGp6wJDr5/+/ULQr04Vm9t0CGvZXXhCy+r+jVa9gpT82iRbZ
f9RTyjHnhjnsH4PZVOyqWQvE2zvimN7AwLp9LjFZosE5vyNOUHSaopJBzLy2En7T
3XFhbOb1zyS57Sj8yBtDKIF2
=pb5+
-----END PGP SIGNATURE-----

--nextPartSBEYK6dqR3etXguuqPrywA--



