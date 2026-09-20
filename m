Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B8D4825DE
	for <mfd@lists.linux.dev>; Sun, 20 Sep 2026 19:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933187; cv=none; b=hqW49ppeGCPtNSbuZmmug0Kt2S1dH3orYnE+WOJiJiueTaTVYuUk7o9fqG/JjkzAyurNLmjvtoPxUktH3EkI8pfzwkG0wKrMAbiQnrh3QNZwBDdSdjzgFQN/TZa4ZH6juRw2YkCOatqOLcFxafjKPKC/XdM71cuuAEd/pI6JEoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933187; c=relaxed/simple;
	bh=BFGYGg6hFd6brXc8be9Lc+zgUDV/5uBkffDvcSv8+Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0AQwq5Fmhi8vUrdn5bBVRBvoM7V30mTLx63e3Q+prHeDauvm3IZ+h0DK9GpmLWtQ8cwgiyx51nVq7reDoe/1qeb/O9A/706uJrS8n6xNHZbGKmEQpJLp92Pbm8Y7VbyzFlnZLBlWeW0QlYCX4/XbNEjkxcYFf3qUOTt7ReEtkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GlOClK7S; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GlOClK7S"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so13958275e9.1
        for <mfd@lists.linux.dev>; Sun, 20 Sep 2026 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789933183; x=1790537983; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rF0vHV+0AKSYzey1/84t/+UqW00wC12/mV03L9JGZxk=;
        b=GlOClK7SMNf2uTdOQUnSdmYlxf8Vu+gaD1viZ8HnITGDFGdUfRRzfdAUA+nIWqB/bF
         nElZHYBBpcia7Oa3dT06YhLXqkulbumdMsSXCqSQ1a7imOW1im4YysQKUm9xGMx3tEko
         yZGwoxQdOIryYyA/KPWgxQUILt6I4JgPmOwDA5ghVevAWi7VjRyBXhhib2KuB9r4M12h
         P45+tygsZnBUOQdGi7bPYzNZZoTvUZyOe2mAfJaBa9pktVFb3U7horp7ISIIkdqb1vMY
         9olF2KIZMYOnnJPeT/D/GPHAZ5C0DcUbqYtVssnNwdqkRD4iiCJjO6TI9NwnezZ1rGNU
         NKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933183; x=1790537983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rF0vHV+0AKSYzey1/84t/+UqW00wC12/mV03L9JGZxk=;
        b=beF2FZRyzz6gxdng3R3+6c2P13V4bbi0rPqyPrfaW8RQf2TGHvf0TssHm2qgOBbVMe
         6Vk2iFQc3X29YIKj1WKt4dB/9bL/7VaE2qY0g/mDhMV6Z7wOqBokCKQzcU+EUxsYQT07
         ylhqCve/1MW/lGV3MvSFdIH3+FSHzyH63IcCh/ruyXhsIJ9tNItPYLdORAE8vEejLIGY
         3gXCkE3+U99L6g4cWD49oMqbaN6+bWgkgh1yGzNyXa8AyiKE9JG01qO4LD4MqOwVGAQi
         XXbec49+shWpGqtcFqxUdMsNyLX7mmOeTw6vnfyOWA6IqI/ZOst2pblU0wcXOApyTXsV
         NznQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJBc1tA0n6LWwtpENRDSkmhQ/FB6DoFYo9gNgnnea71ZzNOaIoQ6Z5rmn/exkGPFFjcqM=@lists.linux.dev
X-Gm-Message-State: AFuF++lijoDB0tLO9rn2QzoIPac6p/am4uJ6cJ0OLFdRisHpphWwmCwQ
	3kFDTzZa+X4kxDyjK0Uoax2BAfKd3LjJE0FWJ5eGmxxCsBCYUmLoitvGRrGwsC8s7Vs=
X-Gm-Gg: AYBFou27zCMnQsoFLQMdfB3XX3gaX6TckfFwZaygW4nEQFcwGyN2B93Y2mu58Wke1ew
	qjPgFQqJYJtTmYFSEGVWc8f64tR71ZElRkM2S10qaEeAwN90bAF4nP4iUsjk9jzXg83Umdf+xh7
	hdxLD/+cJ6TSmy+u/bHOMWH2l9XE1kDJgDJHW+SL3RuxgIQd6eyCFwNHlRqwJLpZqVF7BFsy0qn
	GooXpe/TmoHTnmMWRgfFhVQNY5PVyBsT518tPCu7T13Qs79f79UGUIQgt/5lTMHIoKAIqfigNh+
	K2PuaxJtaxmtKXzSp+wUMAWMpjam1NQpZMYrRmEFGWbZTaJ13x4CJinGUPlmRf53b/HCb1L0YT3
	4pM9oD9qAyQiXE4kM8SJNBGblPGdLoZvF/FG+TlyA4DGIqjHJ6UFukAIzesTNazHudC3LOXCgWY
	pjOQ+V/PBeENEOpbxtj8CkaTSwltl0xMsNrLQHLTEmD3XuNpqwnLNPgQ9zQwPhN1CItAWIUjT0t
	6I=
X-Received: by 2002:a05:600c:3e19:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-49fc572f27fmr119630965e9.21.1789933183359;
        Sun, 20 Sep 2026 12:39:43 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fcd0ece6esm234353675e9.2.2026.09.20.12.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:39:41 -0700 (PDT)
Date: Sun, 20 Sep 2026 21:39:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, kees@kernel.org, 
	gustavoars@kernel.org, p.zabel@pengutronix.de, daniel@riscstar.com, 
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
Message-ID: <arA1svdQzaj3VanR@monoceros>
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-4-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tk4w7pucaicwka36"
Content-Disposition: inline
In-Reply-To: <20260918165234.687224-4-elder@riscstar.com>


--tk4w7pucaicwka36
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock and reset
 driver
MIME-Version: 1.0

Hello Alex,

On Fri, Sep 18, 2026 at 11:52:32AM -0500, Alex Elder wrote:
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>

Please rely on linux/platform_device.h to provide of_device_id and drop
including <linux/mod_devicetable.h>. (If you want to go full iwyu,
include <linux/device-id/of.h> instead.)

> +static const struct of_device_id tc9564_clk_ids[] = {
> +	{ .compatible = "toshiba,tc9564-clock" },
> +	{ },
> +};

Drop the trailing comma after the list terminator please.

Best regards
Uwe

--tk4w7pucaicwka36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqwNngACgkQj4D7WH0S
/k6pNwf+Lem5dcJHNqZeQwO1vn2EY3m9bTRWfD8WbvhlPJ79o5a3UXt/dBcaMHqJ
RquJw/Iwe5AOARXNI2za1AWXKNpjbTyEXg0PG0/xV0FiyYXR+lz33BXvcKDWPl2S
0SilXiIV0VuCARwFkjcibTk4qZaP5tvRg/cD2nsoiDmMdl/2EbQpD5KqEVu1+v/b
ZPj9we1Tm9elAc76W5CGrKLynb8dLHe5kI7balWhxGgV94XZhJCKLvK7Laa9ucYc
abBaruwJGES79c9Uz6Fkn4CxZIcnhc5DwXHEzoTkQMMPt1u1L9ZaAxpPojFCv+D6
SBroUn8lSetw56k5hBWYPlyq5qgKAw==
=ddJ0
-----END PGP SIGNATURE-----

--tk4w7pucaicwka36--
