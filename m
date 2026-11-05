Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890042;
	b=RgLfB1ePzwHld5AwNMfCDvQHknMdAJKcwe95M8PGin2Ui7dyAaI+NsJKtK4AY3kx7YmL
	 IGMgNgllbrtphOBd7HRfUJccMg/ngODd153n1K6NErBUay0E9Yy61KjEAl0y+fByQagoC
	 S4cXzwaVuwfoHWilnxJuwQtpox+xIpxJqyZrNJ2Hs4SPltUiRT3JkOT5tq/G8s36O4CtA
	 cKevn3FDwRlyEB+yUr29Ui2ePL2u8EfoBJey+qRQUNRr8Ulnmp/jIuozoQIAe1C9fRWiQ
	 8UUJOrzMhIpY+4Fqz6KvDuRi3euEFhEGbIe5x2zNkFL2GRBb5e+1REc1X1CVKfO8LNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
	b=yWOM2zRfGiscpfXIUpO7qQSD8QsXEU2i+X8SSklbxSyFjhZ1QCS36TmNJ7tGHXojZ8UG
	 39S8OZ4R2jRCEE4RIU9OI9bF7ktD7BBDeoLLxUvNCicqqyOjAs40xA1J22GjLJ0y0vLGP
	 x3B+DPf5i7Qm4je3sHbwhlt9aQVwZotHUXkpubDAjIA/EHxDB5PG7+c4tHkoXEBLTDc2k
	 HCdKZ7GX7zO5SdxDFS1IoD8Y7WJ2pQR7Os9XC+E4OV8lM06rb83NBIz8c7sPgJqlNoHP3
	 A4OmJZUht9lMrFb8UQTNxIIlXPrz6cyNI541Xk4I4Na0YhCReX5rb66zvFttVZod8Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kgXO7R8G;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03954606A32F
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 14:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03954606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kgXO7R8G
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so22658365e9.3
        for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 06:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793890039; x=1794494839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=kgXO7R8GvadB9wEx5pbQN3383QdSK1gvIsGfparOEebuWfiY/sHX6REKmNqJrc0Qlk
         spZuZqDuokk8RNE93CkqkottUhzobxtL4s2ojMtv1YBHfHEUCCTDc7k6EEP1tmlfp0uO
         bXi8MPug/qRA7JPE89MHlcw8GPG4cTyLJqYORzsvG3cWJSrvHBbDtCMhKVlrth7NZCae
         XNZJ5/v7OAbINi4Ul8elTnmjuy6MwNhRbxyH/BS1/PM5ChWthM0Uk0WeWlJ+fEDPeRrd
         owErtuelGDA9YxgoLs3myaQM3RT5pkGS+APyIGSduzSAoSExAE9fjG/hIiX6Q2a/hGnL
         lZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890039; x=1794494839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=FydtK5tSjWN2142Cq9WnWp4VycaC7ph5yOWM3IXwrERK7adDnD1nHgvbMOWIvdLaMh
         FNrNaVlUcVwBpds7MP4z1lEe/mpSLzyuqsHSeuNamekqiAfduS53XrPUCefOOBBURKhb
         AESdW1UDGHsWRs6xnkVFzC4ulleVflRQNuqOH+3OVCLjC74QfZfOElUfCVnS0Z2O5TuE
         KTGKQqAfPs5Nd4HusoPbNBGxGSQlka35qCvoo1IvqVAlb65LEXv3Lnvsw/SiPsMNuJXK
         SZtLZtQuo63HqB7PfN2bLQS5ck+spnMy9NDQb+08/74zx52dGNswMOK74UtCcV2D/vxl
         CS1A==
X-Forwarded-Encrypted: i=1; AKwUvBwymxYHyCCDCvRoHHqFKAWLTU53dtQshd2U62ct+WmQl4ceyXqOPdrYohzg+eTPg/P/7rA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/+MDlIY3gFFOmy5UbhL8Vh9Yda9zus6hlYd4sEukhwlgX+9NWD
	+uMH6U6vjp7CghWcBHW/G2GIJKI8Zoki6P5Vr1I805yFmoqYNEWBBNzg3CteHWCEGDU=
X-Gm-Gg: AYBFou0qLb1TvbJQvETAyhob+Jo7LX7zxYM8qvCEZRIPuuRtp2kYnxVfKriCApFtB7K
	ZOAHsx0F8kU4h6kcEqqMEc9PCppciRA/H20yFFkCVn4zmxdVP4/t3bAKwE4JRO9IRVthWvyPJoz
	sgHrJL63QqYiwALmUN4I7hFRZTclQwgObehbiQnud2w5zSeF1U6NZ6/VfIko0YsMR0J6TSQVh83
	+XF8a1h29riS3d5Gl3UfjzLmxScrQOiIJ5DgXBsvc+n78yNKpXOUACVp4h9JIepytUXQLBdvm53
	sZUALr5+mmZzNuxotYhnLEnymPlVXeOTEpuVJ/nnX4msCy1EZ7Dd6USKetCWmJ6CcfmsplzQZrp
	gfZwhLyEM4UZLbDsBSpIBe9O6SjcNms9kD+HTmlWvKo0mrxdZ+0ka/0i66izvVJpodceNKzJLuh
	3K76XFbqsycGD17Hbz4m6yx5hEnJ7Jp4tIChNcczbzkvEiulYwwBNMGhukT0NRZEthe0VjkJgeJ
	gTqB9bb01RI9MDzgelVi2hjHFaWKpFk2vvrBo+YTMLk08f4ZDPWUfZeUGVMuuCjLGJfHP6/ANA7
	2VxyTf+DpTp4nuCRtBQ/4vJtTePOZQ8r1VkYBDQpmfFjT6FsU+gkQ9o=
X-Received: by 2002:a05:600c:3556:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4ac187a80b4mr460893955e9.19.1793890039475;
        Thu, 05 Nov 2026 06:47:19 -0800 (PST)
Received: from localhost (p50915710.dip0.t-ipconnect.de. [80.145.87.16])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56eb4da1esm115774655e9.6.2026.11.05.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:47:18 -0800 (PST)
Date: Thu, 5 Nov 2026 15:42:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
Message-ID: <auyL6UF8WWwXsXrS@monoceros>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mag5oduzqhp4hkyd"
Content-Disposition: inline
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>


--mag5oduzqhp4hkyd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
MIME-Version: 1.0

Hello Linus,

On Sun, Nov 01, 2026 at 11:14:36PM +0100, Linus Walleij wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>.
<linux/platform_device.h> already provides of_device_id. Alternatively
if you insist on full iwyu, include <linux/device-id/of.h> instead.

<linux/mod_devicetable.h> pulls in many definitions that are unused in
this driver and thus introduces unneeded build dependencies.

The same applies to several other patches in this series.

Best regards
Uwe

--mag5oduzqhp4hkyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsle0ACgkQj4D7WH0S
/k4ILwgAu4/aIJ4jmqqXgp8ctE1FUWAaormLaedGkha0tPWWUWZFCWXzzflrAPQp
x3SQdXc7pbe9QPylO/FE1FtFum1V1mELFB8lRrsWaexQxDdOJtfgg9sa2EtNyzON
d0vLNNlqRg+eDysFNiyOOcwYa8AN9IWbE+14HBuzIKAdtfixCwirKoJ07ZKtQEsb
FghiifffoIz93iEIJWklhWkMmMWHCyo7KwUjlW+YCncCdVnLfqR8fbdBo+58IcXx
2dgAHS38lq0GpaZqg7vx8x/QrRgOxOqj6KgK724ffND0DJzxlFGTTLCkDD4AgELB
fCGGyZ3gyhvkLj7YEXBO+Gb9upim6w==
=fVHs
-----END PGP SIGNATURE-----

--mag5oduzqhp4hkyd--
