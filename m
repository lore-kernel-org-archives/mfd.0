Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43F6412C14
	for <mfd@lists.linux.dev>; Mon,  7 Sep 2026 08:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769430; cv=none; b=EKzAaD4/5wVd1BGqjgQkV8CZUskSWo866iXr+PvBPXvl+JAgGYTFgScknZkbpTfaLusMJdHj2yWEohwtVpTrKerU0O7ZINBSVW8e8MvQUyiR73fOOxip8kvO2zuarhERwah1H4sayZyVn7l8FSEgghNrF/JbkGf1bFgujsM6j1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769430; c=relaxed/simple;
	bh=toPH+1ZArk/DDhOFULiU+peDd7xkrEZ/LBY2wlar/aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0KNwmwd8u4S8Rphg1yBxdZsV4lMXzEfnxYcEAosKmEZRtw+OIxICBFlNHBaiFpJDp36maKE/bfAjaPgC9TngkFEZbNn/jna3gTafvrrveo4ZctGwzXANjoh9LtWnaEvPGwJ32+qEtnpFCEmS61lf/nq94lZ9CVGFHw5fzAf30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hMACBa7Q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hMACBa7Q"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12737675e9.2
        for <mfd@lists.linux.dev>; Mon, 07 Sep 2026 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788769427; x=1789374227; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=toPH+1ZArk/DDhOFULiU+peDd7xkrEZ/LBY2wlar/aY=;
        b=hMACBa7Qyue+Jb1ezpYQSU1Q5JpTzMjeoW7jRs67pH0B5B2vq1ezNclJSjXa64xpEY
         Yfm+GIL1ms6ky1kb0y/yIHZxsGeBSNpbkpdaNE5G/lbZ3LVuNcUHB1ZcDfJ+Vstw9caZ
         L9vrLPL9kb0MZoMbukT+a1VoA6vZ8ZBEGtLbIK0lobqqHkTO4Q+5gkjDs5hcanGVf8p0
         CcXwSkZ6PvTy99dNd+8bCxJB5kiMHHLuICiF7O2PX9rxG71ar5g4GeC0qN+tUE8fVD3p
         pqzUAZEIOMdrj37NZg0fSmOxs2jAE2mIqljZ+kVi9gG8b0WsR92iqk/ciRMCp5d+wIcg
         RIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769427; x=1789374227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toPH+1ZArk/DDhOFULiU+peDd7xkrEZ/LBY2wlar/aY=;
        b=NOiJmFJiL4Gng6Csr5mZEKSepi0tnf6+sheoC+veFs+EuqNPwHpUsieloXBeFTrJ1N
         bRoatUF/d2qMeDlb24TvPWLI2Wi3o12vFsobg8sFSO/mf8denvcieViIDdrhPFQWWDEt
         okqxaZGKKpXMdTFbjexWCGy0io6EBij8RlyXXKJtv24m7Iq1JxOmIotFJ79WliIrgcLR
         R79JN8YEKsyKWnhc4AavyYGW2N7oUd7v8LNMesxiLjdXyP5Yzz+lgdvh2lFHfzqWvVyg
         qNoS06Tbyyaz2B2nEyiBXr4BeOVRA8hGSScJYxlMgjUwd6Cz8cCPal0X5943aSM26tzX
         zJmw==
X-Forwarded-Encrypted: i=1; AKwUvBzDG91fatVQJcnujUVaaWnC6sHkfuPvDw1TRlTgu67fKjjkOapAMwIk7h/OuDBgeb/apW4=@lists.linux.dev
X-Gm-Message-State: AFuF++llWWAY6P1vbaPwVf4L0lV3ED0sIWDyQ2InvAaBZcPgn3LXyDMn
	CWDM7JdeRGzmfv7AfHnoEH3+Rp3xjh9MLOhEjRvD1YzW8VhbHX0fkrcs3NhE+vsIXqk=
X-Gm-Gg: AYBFou1NPO+IUkxiNcuEX+BA0TbzQo9JgAUQpa+0D6ayigX9IS5EdfuUvJdrzfVO9yQ
	03KkII/53cHQVx6osdwb74frjRnFR2pMnrgHyJchgRn/dUMX66AMx5f0JieznF1kL/uqfZONxW0
	WgZXJom2r7lmgs3RJIDtTf6EQJ7NL98hQlo6vArT6T6X/lNwUsV3JL+YFCqHjizxwfwc5AIlhI3
	q/1Tv9q7wsWNqpEw9IyI0ngQC/g1T9bQ4++oFZ+C8c7UOB+ctrm+kwhQr5iaYtByxxfN9U3qXjh
	WxVavnvxTj3mFDe/442UEJ3ZtbhrOwOCbBiFURRe4wNTr8zS3aOqF8Qsw0Ihr4v2R3bwN3uqtOJ
	LPjHhlyjC802fUBl6xTaEfFyWfYgnIo3PNhxFRioztjVVr2++xOWwvD7rHlglznPCKC81UOwle7
	iPWAlwZGWs7XB1vp9K0raPBFKFWb1nb02i1joRZtfi7xs66MrI0gDRsPvMA4kv44KpjiSGktUlK
	13KaUabLwimrzfDwDL8V2JPuVFgqtk85Q3RtL80IjOkhtrZboAa2lFEETAnUw==
X-Received: by 2002:a05:600c:348e:b0:49d:622:df25 with SMTP id 5b1f17b1804b1-49d0622dff1mr104970285e9.1.1788769427009;
        Mon, 07 Sep 2026 01:23:47 -0700 (PDT)
Received: from localhost (p200300f65f19a9047ae53bb37ada872a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7ae5:3bb3:7ada:872a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-485883953cfsm22327326f8f.13.2026.09.07.01.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:23:46 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:23:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 11/19] soc: starfive: Add jh7110-hdmi-subsystem driver
Message-ID: <ap50F4QOw7jbcvI6@monoceros>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dohx7bkeczkqrdqr"
Content-Disposition: inline
In-Reply-To: <20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>


--dohx7bkeczkqrdqr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 11/19] soc: starfive: Add jh7110-hdmi-subsystem driver
MIME-Version: 1.0

Hello Michael,

On Fri, Sep 04, 2026 at 03:27:12PM +0200, Michal Wilczynski wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't add includes for <linux/mod_devicetable.h> as it introduces
many unneeded build dependencies. Either rely on
<linux/platform_device.h> providing of_device_id (IMHO preferred), or
include <linux/device-id/of.h> directly.

The same applies to two more patches in this series.

Best regards
Uwe

--dohx7bkeczkqrdqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqedI8ACgkQj4D7WH0S
/k4SQAf+JxaOkTt0KXEdMeiFgnBOg/VvLQ2tgwyYbYV25ymCW6f+E/Oz3WAI4IDD
S5sDwYSMfEN2g+u3IdIzE3kZhVEAdkv+iyA6MExPzaVz9qaS/A5RwGIGRO8EtmbY
OnW/GTowIQWQH8Fs2w7pe+ITRAhjl+9OOwdM2Y5h4x+EZD4CUz4apRozxIz62mu0
rv5S6v/JdJiz/WNpikSdNzKKIKdq56RUI2KHXKfjqnvCkAHwAVnPfgCH+HNcpJSX
wljKv3FOemKlAJV4uNgIjZs2QqmcGZbZ0acdyNWZ++YujYR8wLjOkQ0loi8lNg/x
i6GGu8ylq1Jcpp7HF98D268WTb+1Fg==
=jV7I
-----END PGP SIGNATURE-----

--dohx7bkeczkqrdqr--
