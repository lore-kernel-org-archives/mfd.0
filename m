Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AAA3B47EF;
	Fri, 18 Sep 2026 02:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789698442; cv=none; b=kLGtNWaQtG7JechXZ6UOWcL19D2UoGGyrBDoEatJhKVNJdpi5v9rTIFwoX1CY4Qwi4RwUCmxOCRNdmoMZ3+he7fZAIOHyrZVqW/0v3fW9cAbe+4IJdXXw1CWR+FTgyHNJUb6sABmAVtJ+3iaZoMyu7Hxesxami/5MrW+qVgWbng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789698442; c=relaxed/simple;
	bh=c3uVfy2ApsBrLKN1DOMFpQgt0SZ7XTgxUOGvcaYKu98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QKJ2E6TfnUE+CnuuZDHzxMNmQDXP4gSqjNo4rS9NcbEejyI9IPaJ9sfIBq5xmZc0NkgNbvplM074UwLGV3+RS6cC99VBX6zpDHSp/oxoADEstqzRveRvfYOiOKVn4HDLzKSlTDZscWlJfkcIcRX74iEYFpuMZXW8mW7Si/jriww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ht/V+PJo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ht/V+PJo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1591F00893;
	Fri, 18 Sep 2026 02:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789698434;
	bh=rqMmbHadDJdwqVkyHr1mr7KsPRlrKtgCZwROmsUz3PM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ht/V+PJomKlsX7+la/DKFJZJ0zUTkUeu8MZD7Vw03IrGBxXaR/iqx67ticDRCqZfN
	 iWQuo19pwqZPDqsJ2YDfisws44iWrQNmtbMbjo5Lh3FsqQ3jH9FtbiC7WcWtyjELs6
	 HHdTZ/yradDUs7323Le1Z0fXKeg2+ANPC1t5tl2Y7jeWNh9bcBXrhTbCvmf6ujt+aJ
	 fC7thCim1Dtn8iOFiXbvq0PyghcIdqeDtuOWetfQESwM20pPLj9QeJd9W86IvP1TZM
	 Kd3zN0u8EoPD04t/XEgDCXtXx7iSXHH4+ervhAnfXTQX+GqXW3I3VxvZWEXLNte5et
	 pwVVPGsyrg/ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-2-db35882a6080@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-2-db35882a6080@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 02:27:13 +0000
Message-Id: <20260918022714.1B1591F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] cleanup: mixing guard() with goto-based error handling
--

commit 87915e91ec3452c12fe08ad4408b6e74876dc5ef
Author: Ryan Brue <ryanbrue.dev@gmail.com>

iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC driver

This commit introduces a new driver for the mt6397 PMIC AUXADC, exposing the
battery voltage and temperature channels. It implements custom software
averaging and handles the specific channel selection and start requirements
for this PMIC variant.

> diff --git a/drivers/iio/adc/mt6397-auxadc.c b/drivers/iio/adc/mt6397-aux=
adc.c
> new file mode 100644
> index 0000000000000..2f602e16e4f0f
> --- /dev/null
> +++ b/drivers/iio/adc/mt6397-auxadc.c

[ ... ]

> +static int mt6397_auxadc_read_channel(struct mt6397_auxadc *adc,
> +				      const struct iio_chan_spec *chan,
> +				      int *val)
> +{
> +	bool isense =3D chan->channel =3D=3D MT6397_AUXADC_ISENSE;
> +	unsigned int sum =3D 0;
> +	int sample;
> +	int ret;
> +
> +	/* Held across the whole burst: the channel select is shared state. */
> +	guard(mutex)(&adc->lock);
> +
> +	/*
> +	 * Once any part of the per-channel setup has been written, the
> +	 * teardown has to run, so every exit below goes through it.
> +	 */
> +	if (isense) {
> +		ret =3D mt6397_auxadc_isense_enable(adc);
> +		if (ret)
> +			goto out_teardown;

[Severity: Low]
Does this mix scope-based guard() for locking with goto-based error handling
in mt6397_auxadc_read_channel()?

While this might not cause a direct functional bug in this exact instance=20
since the lock is held across the entire function scope and released
correctly, it explicitly violates the kernel cleanup subsystem rules in
include/linux/cleanup.h.

The cleanup guidelines mandate that goto and cleanup helpers should never be
mixed in the same function to avoid introducing an anti-pattern that creates
confusing ownership semantics.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-rbrue-suez=
-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com?part=3D2
