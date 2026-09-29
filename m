Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0248C3D9543
	for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 15:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696097; cv=none; b=PYllowAOieE8ZgDuEKhjYPqaca7pbYolZYbqVzm61xc+oKmw4Q5PzS34rdMeD4Bg4T0Zef72FE5tvns38qZ2pFfpMYId25CVRXN9niuBHvzVjaoWoRVg0AbOdO2yb3tBMfKJ4RSiPowzQfmWFoh5l4TlYDmKZK07nwWiF932Dt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696097; c=relaxed/simple;
	bh=CSu1cXiqbY/jfZtGsZTi+5MN622ll/b5t0C05YWaEAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcKIZMzQD75J4/6V1RGyurY0mo7N16kaKehJu28yN99WiRsjSIKIAA7p3a2/z5NxvU/pRrXMsOL0nfMllJUzBYsP51qbRLusw+IvXsYMQL8lUZOY7dQSuI5aAQQ1n1heu1EZMXvrXk06/IgiueDuUauJrldGmOwtpFJ0MjpGYLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=m7YIY0Ua; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="m7YIY0Ua"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so23960655e9.0
        for <mfd@lists.linux.dev>; Tue, 29 Sep 2026 08:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790696094; x=1791300894; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bK1kRsPsOXdZFtj24JVUR5GYlNpzvwaq05tohnScRrQ=;
        b=m7YIY0UaVeIifUkOlLLn7pZa4pFC5wN0+Q5kflGbYZdpGweEVDhwVXj/bN7XVlJv0e
         VV66WO+ffLKBK3YC6q5DexCUUz2XMmQQWLybw3Q2OA+xAoRtN0k+f10skeTPLVfXGC5d
         rVZnkcXYZalJGg3XdWw6ba7lVy4hqj7HgmIyrhUAt34uA3/JWOBWLSgX2oMsVaBX/zun
         LJ3DmCikOz1jBBqQn7OfW1LGwvhZJjOu4H4/bcyEA9iEpIIBLX/RiZOjh9iZJu/N8u9M
         edwZHHtKEkOoWI4maHw3rcnSpWzXYi9VjZxZBzqjyE8mAZn1KBeQXU3GslNuePTYT8uG
         sUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696094; x=1791300894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bK1kRsPsOXdZFtj24JVUR5GYlNpzvwaq05tohnScRrQ=;
        b=nfAfpAk9P/jKAR5X5fqi5sZizSQR/NrJr9lr+i/7WCEY0bRJYfHY4HEGmD5lMoMIb0
         IEmVwxxHxzKymh40cHFiBqbm+Mk9m4NkJ4p8ZZn8jj5UXngkvDupq60XDUdOeRP6AU1V
         nWZgWUAonBZuOlV8cjzGSH0lOsOZIVabe9bBgwUVIfPIRfARszMFdAof2F61tIxsUqJO
         cEKfc7f/pEaoZ2elKv+ANHK+jExZguxkacgpdPwxnfuLoszgQ9msxvbhqWpdpr7d9euM
         KSbrCc4ibjcoKmflEIOjaD7aJKi5rJFCVU1M5YLzwgUk+eVv+EMM/k6WmeQg6Qd3HK9L
         LgNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwncK+fupgu/kA6i96Nz3g2aMpviK+J2AF1kUo2w9oTjq/HuzZfRfSJKSqFceYrCOYRymA=@lists.linux.dev
X-Gm-Message-State: AFuF++nEjPHEKoQYn8ZNxr5WD3jJtuukpHDp70JSYzrAVdGmqQGV1JnG
	mnMpp/nLvMHyng5Mre29pZVm0Af2z+LI2sLBodJO+/sjNyFl0s06yK5XOOEGC+WNeOU=
X-Gm-Gg: AYBFou1KYW+/pDxS+T/jBl7SIc/vSh1g6wVPe/2CxYaUjuV52/7OAZU9nPspZKeih90
	ZF80PMhHWyrLW1x+lem18kCuxh6gqhTUdCOIYIt+E6D4Bxy1gsnNxJLBzSYNt+2MCGoHWZA6e4p
	ugJdC7M8NKi3NnhRF9avqzmjXxlSi+oq+GYyW3CJXNw1lcuKqsNGqXcRaZxposeLGImuWm7G7hZ
	/BRmlRUDOJHHyVEF2FSKK7Mn+jQQnCAknkgDzJjDhk+gLqzzttAdQpWVcpifmPLirjikBRAiNQk
	NmwNKcE7SLBNz2HN662d6kKDx+z7ZiTjK6TR246jb55eKJPKhNFyH2w7WsylhUGqivWIDrdzZV7
	ALxdJRssA43wTjE2cuZpjTBmyURN9tUGGY8QG+hRWi6klO3z//gMU8ohZFIhNssbp0fQMC3zDYp
	2S/8IuTz2ttFON++uUKrltUiIAcbTaDsr0Z2wvVUrVTDzjsbjdIDU+qzSVDNszMoRCwH4lbSX3h
	yq3Ket8+r8Wh+piNPu0B4W6EQTc6I0fP2p7K++K3x6ins4VUkGPG0H5/prtt45swM9MLJvZ
X-Received: by 2002:a05:600c:8b6c:b0:49f:ffd0:9a9a with SMTP id 5b1f17b1804b1-49fffd09b09mr145822235e9.25.1790696094266;
        Tue, 29 Sep 2026 08:34:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904123cb16e9a8bb736.dip0.t-ipconnect.de. [2003:f6:5f19:a904:123c:b16e:9a8b:b736])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00d0f442dsm81897025e9.13.2026.09.29.08.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:34:53 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:34:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, 
	mfd@lists.linux.dev, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 14/20] pinctrl: berlin: support Synaptics SL261X SoCs
Message-ID: <arvZnEsAdJ5R9mBi@monoceros>
References: <20260929061417.20733-1-jszhang@kernel.org>
 <20260929061417.20733-15-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdr5pu2vmyb2k4sk"
Content-Disposition: inline
In-Reply-To: <20260929061417.20733-15-jszhang@kernel.org>


--qdr5pu2vmyb2k4sk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/20] pinctrl: berlin: support Synaptics SL261X SoCs
MIME-Version: 1.0

Hello,

On Tue, Sep 29, 2026 at 02:14:11PM +0800, Jisheng Zhang wrote:
> +#include <linux/mod_devicetable.h>

Please rely on <linux/platform_device.h> to pull in the definition of
of_device_id and drop the inclusion of <linux/mod_devicetable.h>.=20

Including <linux/mod_devicetable.h> creates a bunch of unneeded
dependencies on subsystems you will never need in this driver.

> [...]
> +static const struct of_device_id sl261x_pinctrl_match[] =3D {
> +	{
> +		.compatible =3D "syna,sl261x-soc-pinctrl",
> +		.data =3D &sl261x_soc_pinctrl_data,
> +	},
> +	{
> +		.compatible =3D "syna,sl261x-system-pinctrl",
> +		.data =3D &sl261x_sysmgr_pinctrl_data,
> +	},
> +	{}

Please use { } (with a space) to match the most common style for these
arrays.

> +};
> +MODULE_DEVICE_TABLE(of, sl261x_pinctrl_match);
> +
> +static int sl261x_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return berlin_pinctrl_probe(pdev, device_get_match_data(&pdev->dev));
> +}
> +
> +static struct platform_driver sl261x_pinctrl_driver =3D {
> +	.probe	=3D sl261x_pinctrl_probe,

Not a fan on aligning the =3D, still more if it's done inconsistently in a
single struct. If you ask me, just use a single space before the =3D.

> +	.driver	=3D {
> +		.name =3D "sl261x-pinctrl",
> +		.of_match_table =3D sl261x_pinctrl_match,
> +	},
> +};
> +module_platform_driver(sl261x_pinctrl_driver);

Best regards
Uwe

--qdr5pu2vmyb2k4sk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq72pkACgkQj4D7WH0S
/k6pzAf+PhNU58V7LTtOu13Q7FpXZuGYfITE5o06ZTODsXEE48OgW8ZdwP7VY1Rr
OASvkk8I0b2igulZlmDQF6y/Uo8vr7BFFtBnDNLOlskSrwtGlRdlA+OxtblggT3/
ZtDs4aXeswkygIA/WvR5ypgSrpFZbf3ulmLpJxoG7wyWd2z20AE0RMgHMxWnRRRK
u1HPQWxqFS3vW0NsDLIGQ8yxAhuvL3DkQrfMVQONTNlqb9YbbJ5Ei9pHPDcYiggC
2NvAR0+Iczq3x7p1plWpq1ism4qNBPatzP3vOw+KMQXMHzNrOEICQ0lR54jlGDtd
U3aErEDsuZZpCY/HwikxQiabfzr3uA==
=ieOW
-----END PGP SIGNATURE-----

--qdr5pu2vmyb2k4sk--
