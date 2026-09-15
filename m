Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C93C819E
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478659; cv=none; b=eHtczPbWmhDDm8F3mb6G25iRzzIn0iO42HznNWEUzF4reKDWlsMKF4Wo8bL9QKqGNKtNKIHqPcmFV679npYaqwydSFu8/IDCYA7/ZMiNyaGO4zFmZpIgS8hg4EVWgMWldnKBG6mEKEptb5/QO/o57svTMeYpa+XnrbmiVkxNnSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478659; c=relaxed/simple;
	bh=aA8HIE4OkVPxxf973WYk9EE9na++A+vaxUiINuobCAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=On/VICANMEq5xMiQoDxuOmGWCCU60C1OMBzEz/41HCuehEwwlYQLxC3nsndbO01N9gTb9oxpNGAuzaplVkOebOOzX86CEc8e7eEHib6d4wb8rw3cqhxbULOhgyeejEI98vj/TbzJ6GPwOC0Nrp1lmC93UGVIlNhZF2+AtVa1vd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hqgWj7L7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hqgWj7L7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso10462115e9.2
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789478655; x=1790083455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aA8HIE4OkVPxxf973WYk9EE9na++A+vaxUiINuobCAE=;
        b=hqgWj7L7aaohq8wOeQTqDypbZfJ9hhl+EDzqjC/671uFqghFYEe8IeSte7LKUTM1sY
         lpn3OGiXissOa9fXNc9SVSkeygmCudU/j98s8+F0y753aG9FRxbwJFpDx3pSJh7tVXUr
         7crLbbnQeXvL2vJh0JRGPS3J/Yvi6EWcjMDRrSXRCUb4ZnLEDhV/ihHnJsKQ9INIwVFs
         BjAGv2K+Pho8CQnswNZvrCWiEF3pGpqscJtxa4ZQ6tLTWeAiC2NrQ51lLuyOfX0dz/0B
         NBP3PeSbJAYIiGD7Z2xM6xgug2oyRbzf9vCa3FFRe+186Fha5UZKS0zO36HNFzuCW2fP
         Eq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478655; x=1790083455;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aA8HIE4OkVPxxf973WYk9EE9na++A+vaxUiINuobCAE=;
        b=fcOYkiHK5/ucfYV4dsBUu//YXd8wXPhvbC/ITyM/YzbI074PMzB65EZC2cIbQw6XOU
         m8eEE1rYU2mbSQ+hrMVuZdBWedB4d8UYJT5jXawr7RjkAYPULHW2hPH877+b8m76S2YD
         h2z+oUc4aa52w054UOsdAS+4gLBAVrqOJb3hThhqRDa0bTj2kutxvlu0VZY+5L11LSDf
         dvJT5uK/X0Z0q7Dc0Zf1hQwVnkAY9GfUT7M+UWIsT78X1xFolcQmEKGD8+pZobfw5TNh
         mmgVYwe/HjI4LGJjVgNTmeYONnsVFaAws7uEwh7JNEzKD96EKUdotjTphuInkjBI1Yev
         fkGg==
X-Forwarded-Encrypted: i=1; AKwUvBzcs4tTM7bkBd30HLbJr9JlZ7q7SsMedNWXErZAR5lPnRHpw4m4CIZFtEpmgYzzWMfJr0s=@lists.linux.dev
X-Gm-Message-State: AFuF++m7CtQYI4WL9Yt/NlDL8ePwweXC8Z7V0+J4wdfNSWSGeoySZdie
	5lkmo3DRKLuFpzDpM1Mj3CooE4YW/EGhRWHmZx9NXvuvMdVfuUJdJyq0imprgCB3ics=
X-Gm-Gg: AYBFou2TcIuPo+w9aHYxQcAuTNJ8MY8nmALqsBua84bprYczSvuCIsz5KdvRwYMO74V
	9eWZd3zZg2E5+t07ZMxsyRA+J59P7CHl4lqpMBxr1O75hiyqG7SYnO393/W8d18tVgaeeFIUOzd
	TatbrbNkR+KsyQQsLkYUQ6GAsNAjYR4ZXhm5Aw9wqDLUuyBJuE+yyOH8kyceE9js1hyP6llYXuQ
	hawoKPKz8esJzD7sYBbYsjhG5eXPnWkoxHbmBKHsIcKMsl4jUCD9HHUqrs3GZHfwr6q7cqT15jE
	GCItCtXZoBX28b24mNsIw3o7qPNk7bMWyVyhlikca5fdP2dzRu7XqD8k1/k0DpEfK3vBWHkryag
	v0ANWZNft4G1tv05uQWosYf+w5vn5ptcIKF5YRzZythyphNrkiRcHi8JegLci1iLFfW68GR5og1
	to8JEe4F4LnLlGR0ywRnKOliWuVywkTJKZR8oC14mm/APy316Mkx+g8MiMm8Xp3iiNlUD6q1kvS
	qXkDQEnrkVH/bKpT4qK6CFqFL2ewuPiQamJHsmSlHlrhwJBvhKZs61dKpVXRfNQ2oDWxg/A
X-Received: by 2002:a05:600c:c059:20b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-49e817a0dccmr16959515e9.8.1789478655048;
        Tue, 15 Sep 2026 06:24:15 -0700 (PDT)
Received: from localhost (p200300f65f19a904c2a77868dcbef2f0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c2a7:7868:dcbe:f2f0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49e7ef8b519sm59911725e9.14.2026.09.15.06.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:24:13 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:24:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 07/15] clk: ambarella: add CV75 RCT clock controller
Message-ID: <aqlGg09RrztSwoOz@monoceros>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-7-3297d3fbc9c0@ambarella.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnlmyx6x4vbf5kjt"
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-7-3297d3fbc9c0@ambarella.com>


--xnlmyx6x4vbf5kjt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 07/15] clk: ambarella: add CV75 RCT clock controller
MIME-Version: 1.0

On Tue, Sep 15, 2026 at 07:15:37PM +0800, Long Zhao wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. That's a hog for
unneeded dependencies and I'm working on getting rid of it.

> [...]
> +#include <linux/platform_device.h>

You can rely on <linux/platform_device.h> to pull in the definition of
of_device_id. (If you want to go full iwyu, include
<linux/device-id/of.h> instead.)

Best regards
Uwe

--xnlmyx6x4vbf5kjt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqpRvkACgkQj4D7WH0S
/k5CVAgAlhnKI89Q33xfBbRky4EOs4jdP9vW1frAnR1bLzOUf6Brat/wp0lHDYiH
dfHIXOR7HFn85CjFb+Nt4HZmCZvg9IWa3FZUojS/qPfNofim2sdbViVVUyrwBouC
RlC5OARb4l9uiJrgaJO2AMv7yNoI78GUthqDgXrDRgQoxTQgWISpDddD1O6XPI7J
ZTQ08V7I4M3DOPziACXuOd0xr5qUrLO/25fcNlQA8pjPzY4u2tAGBeF9yDFtfQT5
U1/YP9Y7TjOF/IfD3GOzrFJ0uAE6tHNXV7Xvi8Qz3CJXQkiW6noaXsS77gf9XaiE
ZaeuPEwNDSCEJvnkBG9Em1YObYs18w==
=V85c
-----END PGP SIGNATURE-----

--xnlmyx6x4vbf5kjt--
