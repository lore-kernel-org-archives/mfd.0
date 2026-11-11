Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378658;
	b=kyhs0yci1DYOSOtIfG6MmeiNYb6v4oaWWiRoPlhS7HGFSnQJPfg3NgUHS6QfH1f4gZo4
	 qoP5YRI+4DgQ4O3BVfy9Zvh+3Ysme/gwe0MsxTUK82aNStgi/8UEPIJbT3a4MbNCbkTzd
	 HjRUeZHuM0FXpfM426hX8Z1td+9+lt2U7vNCJWkIAx6L5RTMXlExHnG5u1W3uwEujFTm9
	 mz0oabhD71hgyHSOo7huAxpPxBesb0MkKlUPsadYTvh78CkxrVjGuD2CBBuThOx8mxC6P
	 SRi9q9/0E8YFPxqKJu/yJ8MJs8x5wBOWrYDgm4s03Cdxv8Yq5+mv5E8pzeOoXugUbTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
	b=kTdV3cifAq0tK/nAFkohEUw8yjynhZgpuPusa/YApe2TyCQQK1XWBUUiiMl9XxP86ruL
	 a2kiU2gz7xiG/TmLg4ui7bwJEbOpdb/QLjqRfaW4tmXQTQfPYwgnu4FBExnSJ0Ek2z01Q
	 bFcc/SdwCdbXzi3cBMVKDgNFNdaWIZiCroloMgl9zKjWDgCPIau4Uk8neTXoNYzZDF4UN
	 psnIiR6YVYUB7Wjh46cg+726MIhAiXkHoPlM4EUh7EA+AX4gEyvVaKBJzBhDl7lQrByQi
	 g8BJpH6ADTIvgYnPVFny6yWsOgQjxqaOCpneZR9ef5VRh0Pc/Im3tyQYaoGESRbi+/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itVgzFw2;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B294606A332
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 06:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B294606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itVgzFw2
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso3483395e87.0
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378656; x=1794983456; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=itVgzFw2YGR6mlkCiSze60k/QRsT29lzwxytEXtHg/MbD3G+2M3s5jsYlqMN3g7pI0
         QtmRkYbTBMXbcVxSbV6IBxh2zYi5hTbD7LX55QkoQNWuslsGvhTXlM2FWwqcbiCqvK//
         fzwIRbMuJkZQk4bEIXbSMLKg+jurluarMHRrcCwB89+voUv+PenTDqwFSdf1H5Qv7X0l
         daCyEHhkwJZrDHjNZ4NcUj/rxtFhVeHBDzRuFZjd7qwOja09V7DHcHkVuos9UAZBf7xR
         qAVfPAFjJ1lzFWdf6KJ/qAxpWP33Lw+rhLJrZCZCt82SQ/S4VYTxd9MbH1xGgSO79HwR
         3JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378656; x=1794983456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=OB1NRtXlcQHfwVz0m9jQbNgMrhrMtawgPHB0xw0WxGYU9nsQwwAxjooG8/V8KUZnHL
         EFetTDJEJyDpm6NbQqgfTWGQFJMIP7FCGHN34YRgGstYvMYqJ5ersx5/H6DBsd3YPHTt
         kuNlAL7h5tVcTn3vg7TJzEdN5hKCko8cMrLZ7Mwo+BWLQaOwUox5ApVFigwCHtOKu/gd
         A+sUhkZsvzV5oZCIjf5rtME63QhG2V89YWJsiR+j2vmn4wxZsU5X9BN+z6oWrkh2wE3S
         cHRogeifRtV+/LFqFduBiHIzkwdrReb9qb+KmbzfrQjpJmZS8P+8tTsSjwCd0VE3ERqi
         q86Q==
X-Forwarded-Encrypted: i=1; AL+hErEgwuGKpseyRbn8kHbALUd+lPCWCqBALdwzi432QmHgBV01tVqTy8bhU0t+LAGwCUuVZz0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+0SqICoV6FpmUdx2jhvMRyTJMEPtAjveZUBnyI/wPe4D3ME2Dy
	OZ211+labgEb3+yPOCFa/khOgWxtYGWq2W27xUtv1ldARDgAqMiNg7zP
X-Gm-Gg: AYBFou3i97/x5BFjLJQlAhFItYKy785GAKW6NGbpJ8OdT5f7OlmE2GXJS1bYy8TEzYz
	qhzZ6wVvAA2xvKmLCELrTE85XXD3Vd/4as3lhcWTtZJBZuIpxXNGMDrClqgmlabe4USpUnq1dCq
	no6DLv09SNuPgrQxrpGwzRnUqmdmme55IIo9rwbOJxYOumpJdQDZBUbJbiQkI6JtV0DFmMb4LBs
	00+4bdh2UzyH//oJe4jeQ+zea+ZEjC2nLobPxmOPX0y4TwjvOWpeRRQxQ/DRrpcJAZynBygdKtB
	TTAq0NSy6ZYZaU7P+4GixLtdyCWdOtNndsFxmKVNH/NxjsSZJw7mtg8DoEDiNbWzgVOBm55TNPl
	xBGiAf765rC1Y+xIHXU9wOYPXJJX4deP0Dh/Bo9UlPAjbW0qIEHBTvdtJMsoIaMlrws772jiryc
	vtPfN36FJhtnItGBu357qn/J7ICvobmwXnxwxFzwwiy0u6e6gDh1mU+CRWjwWQ8TtnByP0mjF8k
	l0DIGGqR0KqagbMcR/jP2rpOH6L5McHtTR7PpnlPGqfRfOByi8kJE5Og6nm+BP0dyxLlTMRYy3K
	iUxYgQDT4bU1wE3FU4Npx6vEVicLK2EriarBLGKMA7zJ+zzrtq79re2gByo6AfzPvdLoj88GUlu
	sPyF3+Qak3Q==
X-Received: by 2002:ac2:51ce:0:b0:5c1:5974:8a54 with SMTP id 2adb3069b0e04-5c15d545536mr529421e87.5.1794378655623;
        Tue, 10 Nov 2026 22:30:55 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7529sm811767e87.66.2026.11.10.22.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:30:54 -0800 (PST)
Message-ID: <0a520efd-ac3a-47bc-b37b-11df8263fb5f@gmail.com>
Date: Wed, 11 Nov 2026 08:30:51 +0200
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2026 23:54, Uwe Kleine-König (The Capable Hub) wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> 
>   - no comma after the list terminator;
>   - a comma after an initializer if (and only if) the closing } is not
>     directly following;
>   - no explicit zeros in the list terminator;
>   - a space after an opening { and before a closing }, a single space in
>     the list terminator;
> 
> Adapt the offenders accordingly.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org> # for Maxim MAX77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
