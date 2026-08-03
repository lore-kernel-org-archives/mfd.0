Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050EC39EF24
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741763; cv=pass; b=rBEQntpjsT21SgbIWWxowjKiuGPt70qw2aJMGAdcRq0YS+WhCdgpGndVPgso5bcqvqPq4uZTBSTEXhQ18cxEUZ+DVw5oljJct1lju2x6tN3sNWI9I37TlAxJyXuGmehRdKzuSQm6+xYy1gNzn+D3/tQx3uIRMFvH7njZvE3VRj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741763; c=relaxed/simple;
	bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Znrd47hFIP/e/aq8FdI9jj4m1Y6rnrAI+/mDACzNiQbAi8g7sdm7EPBjZXwn5tahu+u7fvvod8w+ulfCccqEakT2pFzWQwW/M4xogIMSvZu2w7QtphcddGmhvAzxRKC/2PSOFHQC174cD5y7W56bPir+XKmuSLowglehQ9ZbYtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUJzTaJi; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUJzTaJi"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-73791ee3612so1654894137.1
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 00:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785741761; cv=none;
        d=google.com; s=arc-20260327;
        b=nXlrskhcpN58NcGfP6sDbx3EWP8avr8be6KUBTa86tdaM5gGkaku3woE9KMYar5P/e
         LmbMePXxAqjl/9I2KAr/WxwGvAQcHIXwZ6690/JM+9otqbocRzpxMekH2cSqA21cd4ie
         LZGaKWZu6EoFuxX3ZBX8qChdV/De/Y9Z5r0uccSLhFuZ9i4d9bWhF4X60FVxbvxmWGTT
         bKeK4uKKCuVrndlKcUK8SZwVRscvGyT7OpUutEVPGEFc52EaAVtDtOJk7ZfRsbPmkHNb
         riN2vakp7xSaoh2legIv1qItwLPC/dSpYX/5LzmSr1AcrslleaWyZw0Fc4tg/hJnaAnU
         NJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        fh=k6Z/lKqWwsygimmMlXF156rkazCo4MFn2KmAZYQyDQQ=;
        b=sKuhl4pA9GewjKlXxH0/6Ue5h8uNLlVvShvgy5LE2mPNJasQJjvhgfe8KDnrvX44eB
         4GpifgSoQbliUbhwsFA2yDQzpL74kwXn0g/XphIyyBjmAMc10QUT5fPKvYb6NMFVlLrL
         XFHIAIdZF5fx3NC7ffqdnFR5zk+QoYQ4MTfU8HizmPlinQQ8X/OMAQEJB0Vty5DN7lTi
         AwL0L27okrd/x13+zZElGz637UpGywLoJ//3gyxqVjlNhaoPU0VQ/sltpNrK3vTmlY7i
         npY4ZrV2ptCOQLX9KaZw/SI2zKSXWYs2LaNCuN/MbHJoNiGFfgBwezxEIDobUCldxwkV
         6QvQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785741761; x=1786346561; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        b=TUJzTaJi66PK7YPLnKDUu/SApTP+Lty6a52BncCYzVeqebQBzJETk9sl9xSIUiKryQ
         pI1CLruiXxVRXRADWEBOIOhLMK8mpDZl5cqiDIWtoPg8ydaL0jzg5cUpvrx54JISNWNO
         8h1MAnHSHIoXHsLG6wxGetFfyJEJDRqQMSQzNJfXjcTxL5n5UOUiXK6eBe1cRBjBKQPK
         R9gS7CRZFb0Dbg7bgBzQlVNxoDAYVYxGZnKaJMPlHBUHMKfMyRDQFkuTqCsiRdJ/vMRh
         kr2KemtvcTcQDpz86CoDdnBGOmXjYuug6I6dAU1LTdCi0jgVmyuNca8C17zwylJ2LaFt
         fHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741761; x=1786346561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8u5ujOdUQWybgJKMqWZVqAeP8c+v+cuw6pgGBdqcGA=;
        b=FkvI2A+wc+1umme/wBa5e8yXtTBzfPlgSCrbg9isW3s57nD4NwidRSdBSlFqUZR6vl
         CD2HUqrOprbm6uOpk7QEFLE4Mevi+Lud8XCGRF+BqXryC+sEtjsEoGp6N+UnWt2CLeSS
         8BCTcRtWNWhshXUW4vO5gwGT+2ukCSFMNgYamOwbLMjhDEOSMRFmXn5RYdt4kJKnpaJ2
         ZTsVidsQNcowlP9mp6SP5pu0/2BDUvrdIF/zBwYft+x5Vsq17JMGdcQ2OL+ulPlO8XAO
         H/h0ATa/uQ9XXpm/b0ilpjuPrCwKoHzwlnP8HTriendsI+69Z7dbenWXpiz9AO2ahsmY
         58Gw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/UfrHjtLRb0q5XMsWm1VXfzpN+/sMTOaApcPfqgKsolcjJ0y2lLgbXQsb4eV+DZ06KhE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVXO/Q75hHMenBKI2Ab4JBf0ASjY9vDAlpDy1611Q1epGAfScG
	khNkEMNE9koWvSm8k1YdaKamk1TrXOuNOG+irx6q6McK3Z3EUbckZN3o6a/hxG4IelSnP+AkERh
	LVh2TuUE9WUbX0NxfiCu1TIaQt1gmkzE=
X-Gm-Gg: AR+sD12yy3juMsw5v7LVedMtRRLC0VPLKJUOmLJsn657CCJK42U9O+cxJ0sXkzqvJ5N
	DJ5MhexPokXmTRjOzCiUWDqBxgqAL7V6Dx5t09CMd321CZKjeaYDYUglag8MWWhtxo8q07M7/4W
	KbCylamf5YTJLEgB3sC/H10OnxcSASJmUoULF3FRPLwzlvrfQT6BLa4/T9mJeYy3+fdAOk9hA6c
	NdgRBE+0TEBYUP4unCODaKmj1s7gvUaTOgV3M0FffWXRfwi4hoRqqFXoiZDTHVg/LWf2+IhaT68
	w45xPq7aWKzCU+zBUVAbOAk167SRLgkbI4mCYfNWT5rP+hdn0o/LC1RcZ8h/z2V7JexCSq4I9L9
	24SN1HjH9ojh3teQF+JlMl5XgCpureOQCdNseMxrIMF0AY+XG30rrktuzwbNgdPccLP7OSgARNd
	jGqOAJrbNiqy+XtmHT2s8SL7KWhqh7m43jzyEU
X-Received: by 2002:a05:6102:441a:b0:738:1ef6:51b9 with SMTP id
 ada2fe7eead31-75b22260dffmr6459811137.5.1785741760783; Mon, 03 Aug 2026
 00:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-21-0a53cd9e21cc@gmail.com> <c3171c59-bc83-4be5-beb4-e93bfb4d05a2@kernel.org>
In-Reply-To: <c3171c59-bc83-4be5-beb4-e93bfb4d05a2@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 01:22:29 -0600
X-Gm-Features: AUfX_my5qRz2h8yblU9_NUKeJ1t5ekFC9VrjQ-ysDEg0WGg4G6m5XNTvE_CWbqw
Message-ID: <CADvTj4qg8Yjwr=6KVO_J+r+tEC=6TDrU3o_8YG7vuEdDA0ZpTQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] arm64: defconfig: enable X-Powers ACx00 Ethernet support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 1:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 07:14, James Hilliard wrote:
> > Build the H616 PWM clock provider, AC200 MFD, both variant-specific
>
> Use full names. Is it Samsung H616 PWM clock controller?

It's the Allwinner H616 PWM.

>
> > EPHY control drivers and the shared link-PHY driver as modules. Enable =
the
> > netdev LED trigger as a module so DT-described PHY LEDs can use hardwar=
e
> > offload.
>
> Why? IOW, which upstream board needs all of these?

The Orange Pi Zero 2W for example would use this along with
any other boards using this copackaged x-powers ephy.

>
>
> Best regards,
> Krzysztof
