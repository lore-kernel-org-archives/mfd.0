Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2FE35F163
	for <mfd@lists.linux.dev>; Fri, 10 Jul 2026 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679370; cv=none; b=JWV3m8u+jYbbstm2EhiL7ALUSGJ7DFcDKIyb8ovmaGcxvvoBV2B8tHINpeDnaHc+qZ8suyvbwwoGuQ6WmVVbhvPJTn3QB3oa9BY5vkp3SHSZ5dF7DJPAdsP8JxCAhHJLd2eaUFVRe9ozLM3v3t4VPd6Y+zvb0t1aHiMW8AWuqx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679370; c=relaxed/simple;
	bh=8Lu8OMpVPc16MxdZvSkmOEt9Lvt01fn1EVEQixIYHBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3ou/bpa9600wI2xMtllAV6mUDhqEe+IUG2aQJswGy0FplwZtY0F0r1GdYpzCW5R681m7lHVEDIwoxqBJlc1Ix2nCyGu+1mFPi1y0tAeokoefyCl418Z/O7MXLfpLPkYskWN9kokbp3fFT+rtAroDdB8SPw8wON4OXye9bvuJwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-80dc4a68e4aso9193207b3.0
        for <mfd@lists.linux.dev>; Fri, 10 Jul 2026 03:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679367; x=1784284167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsVN2cPDw+/JUxMMLcOD68aRVLlq59TmevfTz9ChQ+g=;
        b=nAylWEohzpgZUF8A8peKgGVqqMztnglrWkKL/PKWSNYf0jOACkP9+2DYQMLt5F9+/T
         pco/WMmwskNhDxK6c5nsqitduvOxNa80D3Fz5qK0sVDhtaAXop/+VdH0M2F/ghoSvBQa
         wfn8+xGiG3f86UxD5KCKolKB3mj+iIJtrFrRdGW7lZH63JU6SBefaeho+tTxdpzXyEJ+
         kZsduOsKr9MafBFjEJka7MSeV/r/AqFOQ+CETt9fOlT4i57+CYzy/WLeeYZij2VxW57X
         W+L+WRQ7xNl9tlowd0xjbtJ7KKAhieyUAK+9TJU+IcAGeSZ60kuA78e2sSPAPBvgW7IC
         390w==
X-Forwarded-Encrypted: i=1; AHgh+RoX+L0EIjMGWmCgl3anZKryvSuEoyuR1ZpxhQ/5/xuwQqaPebk8cDa+FfyVJHRwy2tmFwc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxI/ehcgJz/9F8WyAWm11T5PweEYKOdyBencdj6Nzq/HQazp6xI
	ITnm+O7EZQaWdM3B6xsIQruLH38rf2/keDxHGvtpqox1frkiescV9HKWW2aMWyZip1E=
X-Gm-Gg: AfdE7ckZU22xWd43639CTnlAERBjUegku06PiZO80po8uxRccYvyj+gU0r7MKvU+NP5
	glkPCvJFFFqGXwoA7468B6sr4+YsF5b6T+1Mdl84xyyl42vo/KNnU2M7VkiG9VMGW7AEI93IN3e
	+5KUf5hlgSlpmna9BWQP1x1xhA37seSmXi5sA9U2beCV1UbN4r+vaZdECM2igy1zoUoabm+bRTK
	bByfNmuVi4j3U96VDvAd4uf3Y/M1kFiLYM1k/6sTf0Hkq6gJrfzv9Fq8y36CuHPNEKeUbFiMn/B
	G6af70f1YFkWpRxyNhanYIf2Es9fmcS0g6479zCThPjR+zhCcRWRqh/JglJAGY5gPi7b9iG7CFT
	UpGvRFdEr4E73XCxI86Kcll4thNlkB+Eja9UGOX+vrI42XmL9GnSBa0r1FcwYsCTNGUbUPCUyBQ
	grzuW5pT8QobvRzT+4J+IxYlaK1Sh92Qcwch9ZUmwue/WEW1k23rwzFg==
X-Received: by 2002:a05:690c:dcd:b0:81e:7f6f:e9a2 with SMTP id 00721157ae682-81e7f6fed79mr13845747b3.59.1783679367436;
        Fri, 10 Jul 2026 03:29:27 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c1a32e2sm41154247b3.30.2026.07.10.03.29.27
        for <mfd@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:29:27 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-80cebd41372so10703607b3.3
        for <mfd@lists.linux.dev>; Fri, 10 Jul 2026 03:29:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpPGaLxEtj+AQtukzJcw4kxrV3/v0GFa2dixYyrY0//BdBWbc4Uz3W2mURz+55b1arsAZ8=@lists.linux.dev
X-Received: by 2002:a05:6102:3911:b0:726:e608:6658 with SMTP id
 ada2fe7eead31-744dff43a82mr6415934137.11.1783678885257; Fri, 10 Jul 2026
 03:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com> <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:21:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
X-Gm-Features: AUfX_mxlLApCIjqxIsg4l7Qhe6Rgf_3Xy6YCZC9GZlPPApUQFkmqIVPuBIh_jUI
Message-ID: <CAMuHMdW4Thb0en6jeD23KhDp4pTe2F8o5GcBx4fnB+JAxPG-bQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Chen-Yu Tsai <wens@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, 
	Ben Bright <ben.bright@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tim Harvey <tharvey@gateworks.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jul 2026 at 19:00, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>
> Adapt the offenders accordingly.
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/mfd/rz-mtu3.c          |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
