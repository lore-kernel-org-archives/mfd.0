Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846392;
	b=uqkAS0/66BMfqPvQMzLmxMnQa3HfhiyfXIW01TqXOJ5+SNS0s/z9WuIQYBdqxfcTJOea
	 1Av9FOKFAeEVxWgQBuFL4S0PxZmhImhKTTFkNvfjqQLKdIstGIPw2+dCW8czmFMkm+sJD
	 GJBrilic907YVPINhywsDr4r21vRXJtwoHr7e0kntxia9Nei1VsH4LaWI2iEhfzy/NtrK
	 fL7OniRouPDmcO1jsmNRtRPZhOp9FU9guZUsooZ/ZZVKJiDqPYZsdvsTmxslMiiUIyGmp
	 AikTVGtdNMMlrPGVRsY/T5RynmNdPoRkvDMrX/NzHnbbBi7KZmbBYtlqDw58U4KLHXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846392;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=qV7xIHjGfWSR9vTDpPLrUsfZERg2gNdOV9LR0yhYUT0I20SXjy2btTlz4YSNBpa1ycYU
	 htVtxeRpVRq+ewM3NMSlY4oqzVxcAtfl2jRSZwDEhJv2YcFHWlSBWAztGZ9v8yBdqTX6g
	 rbO2eZNp2Wyc6zsnXPlHEQuWinbZyncfSEDeFp+cAsltLgC9H31aAevmOsJdCZCE2bxB7
	 KTU59t5dSnyNqFo3l/NsLmV43SfjRKJy0fgENer2MUBCyqejtEJG76xffq2OC7LDJPQl4
	 eKGui3xRsR2y4fgjWBlIqteNm+iuq9sojUcv7AdvhWgVqaJ9s4ux+0vFCJbevm4GgSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A653606A31B
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 02:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A653606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846386;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=Nqz4+xihSRA/SOazc9ytMPaaon6hM2Zpa/k876GDLA/rAvSdmROK7bgusiNH5yJRm
	 MxDa4YviOx4vP5CKZmEuJc3kfvwqLKu/L2OohyPYk21mJnJpm1Y7KU5OpOGkVf3+ti
	 zev+B3KBBNrXf3bQvlO8tLbPTEvcdSoXebx80EGI=
X-QQ-mid: zesmtpsz1t1793846385tf9039f32
X-QQ-Originating-IP: NuSkRErxNaawke/sOT0Nz8LBipBYsz8tQSpp4s6NxUo=
Received: from mail-pj1-f46.google.com ( [209.85.216.46])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <mfd@lists.linux.dev>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10550059537145870058
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso697635a91.1
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByYwnwV4AHATeuPy6MbBz7yb378l2DZmrk1AswafvUC5ccY4Gyu+mz2o3PzIli8G1aXgLQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/NiPr8NQx8U9VOAxd3RT8J/si261+Gdw1VYyg4a/SZPvrPY4KE
	/h0IYyTJctNHK1qje5JI/qJWdR30oJWM3CZfy4bNLwBR3IzgKwB0En3mlzlTtufqEfcwDryaMSm
	He0dEAzZoMudqfMrlbV4HCizvxf7k5eU=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M4JG4cmiaZ8wHeRhItEKQsFXkojEBOawBQoazjirSMN+qRquj1NeGXFr
	UabpMVO0CykgC24HJI0UlpSVC+8/aa3x4NgaiuyhfAwU1i+oYK43NX/IEIXFrPhlmPJ4b8V
	NPj6C27WrNQXPioyuQVHAo6E7TheRAgdk55lxqe/4ClKgIUhwj2PDdAZfd3E7f0pax8EQvX
	EEMYE1JCx+QbfkyLBnRi7S8KZIRAMR+UdPRqhu+GUwTQ3rHXaw94yCmhsluGbIlmm8h8hco
	fvpyJmgaa2puQnzBIxMURG7j4wtygDPRhyzNoEWxfyjaU//Vv85JNVb/kik/pXzgMcjSn5W
	ZCKomawfiu7zTuzs8dULdX1Hpl/bQN8jaWsfkGwSIYVff2MYXPJ0f3lDxT7SOlu82/IikWK
	o9hCzHSezltz/U2bmNY9LPxlz4yUqCl9kMgCcuHC/s+Al8xnndYxa8AeHvjzh6R+DYRe9wX
	ulckctSLIUoYyN9LifJi41j3/FB8bM5Zds2U+sCXdSM3pmv6irZWS8RrlufrB3l6d0tv2JY
	Xko8OOAZOb3et7DTiDTPkHzhW906HskwbHEvckvuzhDN7/CCgwReKVU83ubshnWejLS2N7J
	Rf1+enwqxhXmHjlTKzwyt7Cu7Up1EYVw74KKilNgM1skvFZ8jXJviNDuRAnjn30ID2k/5Qf
	rtDNv482Qim75Z6XVm+L4Pgdt1JBo59u+mZR42E6dmrwAni63Yf//5UH0wJErVmXxPZdjMX
	2f+V0y8yCLct1SKYf5Njh9af1Do+MdD9fPlRD9sfeuz+6cEWeCBiZK0D+03/2XPYZIPXpp0
	EjUDV4BrbZcnuFpvlbXXczhx3iTIzt7HBvyspVtnhsVHyF52NWRqGavNWZlr7T3ekYesGrw
	wYL3UUgWzgKUV9xKLvUOUy2wu/UIGqznVJpP7qrZBWEny1qv1aLe9yiTs9qSmCHxCkPmM4i
	ysRF4zsgsa8W4hgu2kHGIMVO9sFpPqfscuUlqp4i0Dga3jR72TPtQsGTea8mhRI7pZGWBwv
	mpb3it23HSXV5J81+6DFg4/+W0rcptC4GP20H5BQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan
