Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C640D59E
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432029; cv=none; b=P1DDGHjbmYGT/FYri6iSz4IeUWGJzu6SlsO1/Lr5r3Pcqv43HcajcSo9GzmjAQT6WayFoMs/csSMv1W0VlGuhNMPn6vNayDiq3F95GVW/FfM+Cxp8UywZCjgRCUu+7Y7G/cQ3NTtFLTBiuA3uMY/XXrpGfZBRVQuWnz5hIxSqV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432029; c=relaxed/simple;
	bh=rtHdRjWkt3EqBYkN7FDkyW/ZCTKcNspptPPTq8tNvp4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ifu7s/4i6SPE40jG7s7fiqjT6ql5Cj78Dsi/UYPIjRNx0YtdgsOI3s3WJaHm1bBie1ZlhMBg2umGha1lGFjnV49lYqd61Ih7R9VqWmJtzejYzym6l5xNt1h8MAx4bLL697JludpVz+bGRYJvY12ekRq9Hoxi4h2NXXv4FhNJ4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=sO89DPoU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X7X11yU0; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="sO89DPoU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X7X11yU0"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 171861400042;
	Tue,  7 Jul 2026 09:47:07 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 07 Jul 2026 09:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783432027;
	 x=1783518427; bh=JyKgGQQGq0xs8DpIasqn9usj3ldFk5PseIAObq/8Yss=; b=
	sO89DPoU3x3K3ZqAzsPwhJRnFLvPrpnYWRlnkn1AlgHrr+4yC2ZZfEkPrvne03O1
	673ws6zXCgI1Lk50DFkB2pmvQbxGoWEXP9G0f/5aaOFKhCHiLfvr8sn3kQalfQrp
	2mHFQuJevwspVP5kZZ5CBF2ut3vV0eYZTIyzpIE0XJAQNAuDYKoxdx46ygZqNYR/
	l3lSf+XPSa65waVvVChZefbkGLGwoYLc6fCAGej865WwQ8YjUYq35U+tARud0S39
	+YPZ8TX40JDBC1AJmQRmAFtnJl6YT2tzd9SbUTEirgA3GjAvySZCBro4l7pRMfuW
	wYVkmZuQuxlgb8yMlv1S0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783432027; x=
	1783518427; bh=JyKgGQQGq0xs8DpIasqn9usj3ldFk5PseIAObq/8Yss=; b=X
	7X11yU0yHeQAZu4MjvCyUxQuxFAY1O1pwkrCRedzirFAJRsuJb8G3NQZLh1m1hDT
	Z62UwSqJwjX1kq0MrqAKbumTGj4gWAMhVenjHUBUY1IIimikoYBVJR8BZsLP7qrg
	mHCcnc7wXAHaG06xyoRUxpCHINYJAHSSFlHjetkDR/pT6mR9nIgk4REmAQAtgo2/
	6sf6wcdrz9p3D+ImMMEkWT/HhcXPwY0+RcBk9nMkwZtubD4PdfLtdLxWlS1FxPkt
	9qNS51BniK/x/mqmTFVWlRCC4wAcefDoPcdZY04F89iNfDFjHakNeV+Cv/C3bUH3
	K/DzAK1uD9hJH3Ef9x1nw==
X-ME-Sender: <xms:WgNNamaaxkPwifYLVAf5fE6jaUfW2qDH9Ptbm3083ww_68UElgZv5g>
    <xme:WgNNakM13u_nOojQhyvn6FD95sSs1WvoyKjtlb0DQ8O4NkMq1bANjNmgw7hM57B7F
    vE673dFNRYmdXuI_HB96WtE4D1QZbpoSfkf0hXgEVF13-jfSuRr5A>
X-ME-Proxy-Cause: dmFkZTEN2jQ1M7Dz1AomzzmVNtoS9FSmY2tOLJhlOmyF39+JhJGpkbqpxwLkfETh8h46xo
    R75+GB3cVpfV1bZuSWWbLp/kNkklfXK+lgdCU7CI0v1DYmlo5YKHosrOC8ztwuSV9PpZi8
    HXFBAnxZWdrbbLGI6OZEQhkDXnyEakSPu0ErnPy/OOtv/svaYsZF3CrTKATBgffapyZd83
    hjDs283UxWzZ+Jk4IYngnv2x46+r2fEdwJQr8Yrr7287krwArz2t+IrzKBGBWLY1YYZUHV
    i3TTJnaTwLkBBsZN5wzW6U83q1qugpmzczTOVSHOPQphTULmlBGsJjnu0VFF1y3qMA5ZTj
    UmEpfNQIJY5W5xiuZfpfhgtGAdtcR9qAIZlDqTbuwRaZ7I5bCi84w107Z92y8Su+Sgqr/4
    gfYwqXkaNQ9YmihIdKk64UHgqjGdUjtPltYR0rBN3hi54UCu33sRyR2ZZWQl9rP3bgDJvY
    uY0rYDPaN8qtme9+YTNrfepqbeThDPzA8RLin1HzdvBovYdTh6He6Mxvm2YTJx9OhiCAmT
    v6zgNWB01QNEQjK4VlG13VtEbX89bW9ELVJDXdZKUWxz/VWnoA0eOwCgnBBdRSZ8cQC58i
    HtLbGDmEi1sVzXJt5oaDJqnmpNr+bERsvlHGW1GiwbApwE0gaxt7efshAwrg
X-ME-Proxy: <xmx:WgNNajlX7zYazBpHkQfzA7PAQ5wWjh_B04SLRBemEdQiOi37LzYySA>
    <xmx:WgNNavyyzUZIMQQb8pQpvZPOBhncW5d4V3xSNQ_pIWkzZLRKcl1lng>
    <xmx:WgNNalPl7NJldHtvCHQrTCodP5rY7t8V1KSOtKrLsXsdS06o7Ntryw>
    <xmx:WgNNarp32_7IekhAk_7p-pSovwWTKgf3FNfuvzNhWr3Ul3m22tl3fA>
    <xmx:WwNNapz66JJE87swn5tHAFYuDnyCzQuDUKOwLLCEngPZ8AjiE3JEtyRG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BA88B182007E; Tue,  7 Jul 2026 09:47:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A5QiBhWMDcTZ
Date: Tue, 07 Jul 2026 15:46:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Lee Jones" <lee@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <48adc770-9d55-47a7-a779-cad73b587b83@app.fastmail.com>
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
Subject: Re: [PATCH v2 1/2] mfd: ucb1x00: Register software node for GPIO controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 7, 2026, at 07:01, Dmitry Torokhov wrote:
> Define a static software node for the UCB1x00 GPIO controller and attach
> it to the core MFD device in ucb1x00_probe(). This node will also be
> used by the created GPIO chip.
>
> This allows machine subdrivers (such as Assabet evaluation board
> support) to reference the UCB1x00 GPIO controller in property entries
> when converting legacy platform data to software nodes, resolving pin
> bindings directly via the attached firmware node without relying on
> name matching.
>
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Assabet should be going away soon, so it really doesn't
matter much.

> +const struct software_node ucb1x00_gpiochip_node = {
> +	.name = "ucb1x00-gpio",
> +};
> +EXPORT_SYMBOL_GPL(ucb1x00_gpiochip_node);

It does feel a bit counterproductive if you have to add more
exported symbols.

> index ede237384723..214c71a12e84 100644
> --- a/include/linux/mfd/ucb1x00.h
> +++ b/include/linux/mfd/ucb1x00.h
> @@ -103,6 +103,9 @@
>  #define UCB_MODE_DYN_VFLAG_ENA	(1 << 12)
>  #define UCB_MODE_AUD_OFF_CAN	(1 << 13)
> 
> +struct software_node;
> +extern const struct software_node ucb1x00_gpiochip_node;

No need for the seperate declaration of the struct tag,
you only need this if the first user is in the argument
list of a function, but not for a global variable.

     Arnd
