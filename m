Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210020;
	b=J3H9gAF9yU51C0L1WpPa7xJU30nExIDNGyQt5moVhTggvN++qXywjoS66PZCUuUM8aIB
	 l6CxH1gZVXqP0Uw1z7MwcxyoO75nomK1gEKxvnow4wQBRRSF+M4IP5CVQO3k+iX/Ynlrk
	 LFfDHKd6loprjRRFA3otC/h7u0ta6sciq6xggv0PcWR9gfyOrlpxyMUt0udqNmWSM5tsA
	 gtijCbdeyhN/GXQnfdREPojEBTOcAmMM9Dgu2FXdZy3amJx0qy9SUfUxTqv97zKK5bFPO
	 T2bUXRNqe6oxC++LZIkcKMNSwFrryx/T3pFqMxufJEsLFy2T2zjyLEG/IgHqlZdLPIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=GLv9LHupOPBkR4LBtoc9yVOSJ2Z9STPpOpVAh31whd6lHcvTajUrvqpgyh4Ppp47tIdo
	 2wbPcbHGHeZqBzUxlMSdfm2M6eWu6hu11nFWV2JAqm9f0zG8dcW0cxkRiwRWc7KkzjMBe
	 9276ZYOQW7pjOoEOgHo6znbxHUZ1slmKUnjVeoD783O+nwQcGdCaNvrt39Sx4vniYt5+U
	 WtCG5imfxQe+gvxFnjbGTRY1mz6Zrtzy2NAxmpZ+RgX2B07DWrvl+YggJV7tdIk8MUcht
	 hMChSHjtpmKjkOeqUMnzEZ+AfD+GNR05SHXj5PHNlzHmcVOEfX61wX/yXuUOU9AMeQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moLMZJYa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A914606A326
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A914606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moLMZJYa
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso294151a91.1
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=s9kqoPLzcr2mdPNMofrLZuWtuOrNQ/sgMvKraOgdE8M8dJUWrls6yQuNuesU2U01Si
         Ayokag9iW4LM2hz8azLyyFuehwJWDrFZv/bCsHKawNs1SUdPLPHcKx3mQ2qsSmCN8joH
         N8sc6Ih2zYK0M3zkLHstzXYffW9ZvFkZ87FgKYL6v/IM9j9ApKWKxHyEyp/eA0OemDkH
         N2aIiTxoRTx0OkwTRsc5F69gA2muGxZZVSp3mp7DLW+McMSMUMn6KWT66CKzYJ86Qn1b
         PiRq9fh6m4V6G6VgmSBTauT/c3vv8hJMnUqSOyephDE82jfPCp02TA8fXyhNqmafL8RU
         Pm2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=JBpxN2/SOVN6WYUvJSDg6cwcABP/lJ64nSlfHrQvgf0=;
        b=jkElGWjEUWuCOKxMIg6YXLX7AzrqAFcvIzhAcvvzHEz+OtCxHPQYA1R8fgL/805ih8
         1PzoePyUjyEqLe+dNcZwFoIAWIhWowG/yp3GuEEdcLisMkW0YjiyZWc2/iAoKVpgnnbN
         kZxrlg+eJuBf1kUDYvTgXhcyajJhlNdXZXUs5So1XbJ5GAva9CYVNrmfhUR0rxfvMn+J
         L/7gmMR5FR3XI0oC2evdPY7tAT63dCBDQgjoZXJdjTBICu7i3hmcoDtU7jxGaKiQkJRq
         JTDNTH4zh/l4eshdKKnaxYxBHDnPKMdk1mPyBb9XIWrjyBBJpEm4WX708trx0va4vY3Y
         yeGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=moLMZJYatz9T+7XUTnn117JVrQGiNU2XzHCLKLoGltw3BQHMiSekbDsHI4RFRAlBEm
         mAYZ3QP1b7Z+JHge8gs3oxVCUloGoox3ez+b/xOD6XnSs1gjDDeqXlqU+y9D67EpLyb5
         ufbd13tvUtCwQhL5CwgVwtKuMrCBjqAVrZuxSDZZatN7YvmQd2BCVSOXkjTuLnU8FLoq
         K4p7gDl4dQTVQFA52Es3b9AISXDFIZekAHLyRAFeg9LeiXuwKr1pWV8L1wHqpFdccv1z
         u4ctAMqIMeNG6ctgrCbFlISFqLvCgHU8VY4sB1fPdb4EO9PR7OJhYPe7zq534DZSaC82
         aSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=vaI9VcWz4RWgRR3ITni7PgyKBH44CY1DvJpXPVo+yLcvSj19+6CZtQc9I58ZqMGTfb
         2OiTROmPPVwuuv0Nb1qehLw/R1plyNaH5Ua+SWROkNLM4GQwcZ8stllcjYLqEjek+dX+
         CI3TFkw/1JGXCDZfJaBPTb4jxTcKqI8manbUpCfZddK37rsHsADK8VZyhXxqOiRSHxSw
         VZf4yN2yYZDEuyHYA9KnqETixqk9CwwGtuhbO5zflR/hOpMVK8/qfyP7kbrWTDLX5RyR
         IxJ22FanH67qaG+prn515+EtIJZPyMSA/JGW/J6aHpqZdOc643qEVAerekHerHcZ8b1D
         wlAw==
X-Forwarded-Encrypted: i=1; AL+hErE/CnjnPK94jRPjLT6qYgcgFdVJrFtwal8alQENYvpeTwxJNzyg94NCHiSkFCt6rghwRyk=@lists.linux.dev
X-Gm-Message-State: APuU4Z92iQ5rlIce2y5N6rQKpCP7NY2ak3nd5e+faXlQs2wxJfCghZ0e
	iaYXwbXuoFVTLZhl6WSL+7f1Q0QvKKbwCXuQIlHRMEBpE8/wW5siPNjbC04viP3PtV3Ky4hlNHI
	80eEBMBy4K2XJU63NSY0uT9KuTtAnfTk=
X-Gm-Gg: AYBFou3Rus4FWhfVUwRJH7DtXR2nM/ctr+CsIrA+dqNpixzOs14H2GlPFL9JFsybKsi
	MLarMH7r+4HBPcO4okviLTQzpB0oaTBm/Lc/WTRQ6lk98pVlHV/nD/81U9mOrWM/pD6ykC31/Cy
	FI05MnNEFNiCIKGhVeS6ILtry7v91NEWZy8b+W2eouEWGRP9TKFDC+ReQ5nBYlp4Rl1vkkMxT1b
	NE3WqslD2SbAk3LY56JjqHsV5c5u4bj4WlyHCkJeSvKDyNP8tmiLzJkfAOGRhZiN7DaTp2GQUB9
	Jo/plhmLYPlRp6LbqW4fapNhdrdpuGW4urdbSqiCSg1/RA5syt3tRhR4GEWG3HHtEEB3uSbJ0sQ
	VbrlpWuC2GZqrHadtmkYx2BFiLc1/WszjeO8=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
