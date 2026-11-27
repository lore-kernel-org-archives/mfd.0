Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798579;
	b=CMApl9rYzh8z2obqPpCep3FIiukp4CWJgYwqGFDfnHw+Yp4EZE6tpAVr1iLlKvDwSVNf
	 JRebZZq02PSql5cQ5uIYoCWrXv+wlqHIol5DYzAMsUk5pEOl7TjSukqfhJNjxqNlEiFVQ
	 kK1nHEd7rswOxFLq+LGGWbKLTY2zOwQ7nElj0q4vTQA/jxKUIUZpNMi6ELaSwWC+r3gVb
	 DOo4BrQacZNQMrM95SxFSwH5kMGy6SHUqA5BmDBuzImitUH6JBvE48NSRsQ3aboBU7RZP
	 RYVC/8Q5VEMYg85bAZRimhFEKfiRY4s83sF/dAYzTMNFLd0a3tpg3QbrYMiRMWHacOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798579;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1pQgpxaWYbPnarEfBpaSEryrLbP7GILPym45C5mOhxc=;
	b=RruVkJrMY4yVvc+BErJNIeS75lbdQY8IzfxzKF65HFFI6RkkgqgdFya9yPhJgIwh1K9b
	 g+jjYr6u8PiLgsPsVqZmfMBzOu9wXJwxGXcMaC9HVaiP0QIdaOBNyft1k2nAJBD5xxSj1
	 m3uOZZgyxFR0LS3pSk/yddAcDFQL7xz2XOOCk8LgSS3aucqyxqtjgvOY+0K7/coXHR5qa
	 qTTWO423EamEr++wc8fXb0wRRsoL6YKWBmKQ2YUiNxpTs7NL0Vxq5cJHAiws8cOEWXjvx
	 X1q5jhJTJN5Y35lG7V3DzqGH3lAiRw1D3DgzeuWmdYjeNn4brWpEONkVpkCVGPge+Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9rhTEPT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB53F606A31C
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9rhTEPT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8671F00897;
	Fri, 27 Nov 2026 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798578;
	bh=1pQgpxaWYbPnarEfBpaSEryrLbP7GILPym45C5mOhxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i9rhTEPTZKzooFmNUecFusXiIgpx/CtqoqKMpnsfQafQfn8BAAN4A4x4FVLuo+iQe
	 TWZohKFpdG5zo9D+vq3VGD+0A1FLvdWxEvjq4kxPau1y7zfRWOJJaZYOzjogxiUHYG
	 PDF+rBVXOd+h4nXMsjfAf6sBTCgdnw0ruLAD+bRbIgrklxv4NOLZmqpwHY4SdW+Ik/
	 TEr9Hy9aLacd0g5+3BmAayKWJkSaclfvcWYXOcx8rydafJ4pSv/n4H4Cuu0AWUd8Ar
	 3ucSRnjGzK2Ht+P7NiYn2LrDf48jkVedDY91Pz6Ifdt+xFDvJ3y+mqk2w1EeKnrKGY
	 OpQBLLiBeoPVQ==
Message-ID: <sashiko-outbox-237950@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/6] mfd: max8907: Add ADC client support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127164044.285910-6-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
 <20261127164044.285910-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 16:56:18 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] mfd: max8907: missing TSC result registers in
  max8907_adc_is_volatile_reg()
--

commit 95f9130d9b22203166a62ce2610b261784729ba5
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: max8907: Add ADC client support

This commit adds I2C dummy client, regmap, and interrupt controller support
for the MAX8907 ADC and touchscreen controller.

> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index b511c57026188..103294c76b97d 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c
> @@ -113,6 +113,48 @@ static const struct regmap_config max8907_regmap_rtc=
_config =3D {
>  	.cache_type =3D REGCACHE_MAPLE,
>  };
> =20
> +static bool max8907_adc_is_volatile_reg(struct device *dev, unsigned int=
 reg)
> +{
> +	switch (reg) {
> +	case MAX8907_REG_TSC_STA_INT:
> +	case MAX8907_REG_AUX1_MSB ... MAX8907_REG_TDIE_LSB:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool max8907_adc_is_precious_reg(struct device *dev, unsigned int=
 reg)
> +{
> +	switch (reg) {
> +	case MAX8907_REG_TSC_STA_INT:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool max8907_adc_is_writeable_reg(struct device *dev, unsigned in=
t reg)
> +{
> +	switch (reg) {
> +	case MAX8907_REG_TSC_STA_INT:
> +	case MAX8907_REG_AUX1_MSB ... MAX8907_REG_TDIE_LSB:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}

[Severity: Medium]
Should the touchscreen conversion result registers (MAX8907_REG_X_MSB ...
MAX8907_REG_Z2_LSB) also be marked volatile in max8907_adc_is_volatile_reg()
and non-writeable in max8907_adc_is_writeable_reg()?  With REGCACHE_MAPLE
enabled, reading any of those result registers caches the first sample and
returns stale values on subsequent reads instead of querying the hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127164044.2859=
10-1-clamor95@gmail.com?part=3D5
