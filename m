Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732348;
	b=12rzbqNwrUxhv0BzJ6T6UTJGXG/sDJ3eONCeS0l/mzjKXwTmfDspve0poJh+FDLq/Q95
	 Pn06WpyMK5upB//tuU79SGsCv8uGMCopAf/Fal4h63DDHUKR3ANOOuYY7LuU4TruP3V5N
	 UI/7GHzykiabgUoDbjvGWzolfSdN/f4RHQDw01VwKkyFx6YbqNNCo4qTGH9H6Ioawob6t
	 RBE7nQpIt6QTki6NMCo+fmzfGDkbtq6gQXBnAmwgW4gQRhfWYtvDHfPKkn+oXwodXWhUm
	 qwdTei8GWogS8s0aLGOBREs11CKjVPm2qH7LXh+5R7ucaesFVCmnJLu9AM7jFDy4zNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
	b=0DK4MwfiL+JG69qMNef7AoWGIBoh81qXDQ3TW9J2L7GU8wVNy7hwKSXZFWHy/GWf+ncn
	 9D2Tt1csjMg4thhZYxzyWdkNZkwHAZPzC2E94RJvYcgVxRTIKaW3rniOI51F3VzOysMds
	 5O0y0nB7bPYijWi+49OzkYbq/1hAMGsRE6tvzkyIrhZSAeHARjAZwag1O6s1JGaaTl9/y
	 DO+s1OvdeQ3XaDWCVE0DqeSQt8JlKiDpJIxCbyFWu2SKf2yY6rhmbFXAyxjKZjVScwD6e
	 z7n3a0Ys9PyNmYNiVvtgwiOLGnCVKJUdcrrUiBaWrzJWwoh3uHSVU3pDzT5NMN3Eepw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXYDOqR3;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177E606A335
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 18:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1177E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXYDOqR3
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso7522366eec.0
        for <mfd@lists.linux.dev>; Tue, 03 Nov 2026 10:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732347; x=1794337147; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=YXYDOqR3YTdWjVjMiPqhMmCqYc/01K0PVfuT0MGChqZe9l7AweO69fkSNMx/9KMTE3
         KDn90CTQ8H/P3GB0Nw8wvWWu18E1L1kbeanSnVSOjen1TLCZGEfpt/8cCBR6DfejvXKD
         y6syQk1Le3oFzhMwsJwPM5RHAosnmsomfnPRXyCKE06jn2LBpK++90DvFyqZLROXzyJI
         FDBGusogPlLdXGGYNa0wxHPIenvxGmSJMLkQEV/Lf3Dlnp/Cg1MrDkjgdnVNYTf8f62N
         OHWgJgqg2+c98A67ynn60QZve8Fwy9qy94fJMCSqRQTKf1aee9h77hegeiwBGwaIhAJb
         Fnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732347; x=1794337147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=Re6b6v65J6Y1GtZeQf3XgfncNWOiQlI1baoD2O4x/PVNUNbBmtF4JeRl6O3E+oUtPN
         44F6rFc5Y8XRmIlc5MFIVmroMND6FxNpvgVcB6m2oMWe4aSAjDF3h0mpfaPzSZUwRz0Z
         Y9Z7D8T4D4tstabtsor3j1KX+sa0BpSUg7m0xi71EASXZV+eMtoh7AihfSy5o2Hhdduv
         zOAd17hYkrf2tsQ3MRqWurA1uUYDtG8Fx/h2mM2euP0VCmVl3FcAl98Hfh/VwOwdcmph
         TbnyrCCJkBinBeVtGpXZY2ftyA5T3rfgwCODsMk4L6Oe06prEi9jjqA0IMK2JBCqrpLN
         YOWg==
X-Forwarded-Encrypted: i=1; AKwUvBzhV+Rbau+7vSJY+Gr8SBCGz781kiiULijbC5F1tOOsIxHjYT55I9UeSfhP+xh5PwXk53s=@lists.linux.dev
X-Gm-Message-State: APuU4Z9zOrIIG5Pd3ULlYI+LdTPZ9rtFL+SPvzs62mMJ/qtcNAt46Fdf
	56Z6o5k3TuWsvjOW56Y+vWLzKAex+uRLtgFrmJ9AmZ8PhuHpjOM708h/
X-Gm-Gg: AYBFou2vVeP7ap5rIn3wTA5vfLhgpcms4X/gxQSyJmWHlC81a9zinXWaeQghOc4lged
	Ug+TbQkrFwWEcGNfF7uvPVX4zmn7v0UB9bzSyjuf8euVKCcznZNa74PbZjNXu7ImtKp6Xs4QBGH
	lSfkI5jI0zrh6pyM0Gg+iCOEtmewujl4bBlxioM0MI65APGjZ/QsxAVldEYHeqj51k7MugZgG0X
	23duKAsF2zgItBUHhnIWmk1yt2aBgqGbMc1A/uIHpeRwfrJcWKZNDyrg8SGgHEnn+xkA/5LRO8l
	TIEVJk7KL1HT8lArfkBvTw5LNHZ/GqqkcDpbDdz81M00UETb1RSwZs74HQ/ACBmaxFKn7oUXvNG
	ICQGKyjqpYVSjyXmkOj0aVKtFC5kY6GGD6Q088hd1DXhEqlEcEHRTE31wUSO3guQn3ZSzvxoBjQ
	GGngqOmfhKZr7caznnm1QUQ3ihh9Ny7k4qqOeieQgAJS3446bofaor9ez2BE3HI4usAenPauMC0
	qWRkgNt7FsLNzLP1rhsXpXYIut6nmnq6ZALZEE6YoBk0Ecye/FzM+zyPL9g8oCgHmsL4KhxHo4O
	lh3oZ/IeVa+RXZGff5RgIs83I1nEEFzzC5oT+IqBwWkYC31J8WuJ/KeJhTqw+4seWVPZ
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr30787340eec.28.1793732346941;
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm49159eec.28.2026.11.03.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Date: Tue, 3 Nov 2026 10:58:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-tegra@vger.kernel.org, mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
Message-ID: <auou2CBiiR6zA0G0@google.com>
References: <20261102135330.2493332-1-robh@kernel.org>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>

On Mon, Nov 02, 2026 at 07:53:22AM -0600, Rob Herring (Arm) wrote:
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/display/xylon,logicvc-display.yaml      |  2 +-
>  .../devicetree/bindings/dpll/dpll-device.yaml        |  2 +-
>  .../bindings/embedded-controller/google,cros-ec.yaml |  4 ++--
>  .../intel,ixp4xx-network-processing-engine.yaml      |  2 +-
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml |  4 ++--
>  .../devicetree/bindings/hwmon/maxim,max31790.yaml    |  2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml    |  2 +-
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml         |  6 +++---
>  .../bindings/input/touchscreen/cypress,tt21000.yaml  |  2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
