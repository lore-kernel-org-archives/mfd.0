Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E283B994A
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552572; cv=none; b=MkDoEtkHdhjuEDuq7VTpeVJSoVD/b4oorcFsJt1g3P6skJfkOaxynMJ9UgVjDI1ZfcUEiA3Z+sdjOAeyfr4lH0+prblzdtFHEPa3yjevFE3I3ke68v5jrBYpD/3YnWidLWDnHeEMhl88fqqxag90RTbS0EmaZN4qAyfI8trDbjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552572; c=relaxed/simple;
	bh=iAHJd4eqBM8b6hwbrA5kr1yWGb3u2TqN8211KLrRBwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwY3zsqxtqV7fRzxXZNyoEDYMGbx/DDogNv7jGyJ75YEZoyFsAVoIrOwS6va+amlbx5cQqlWbJLV44/leOHHB0/Ql9WKOElpwYD5DKOirFn5Q98m5+JKitPYbX7LO8rifWojbIoBPd+Cw0Tao434bf3wEFBUG2DpBhLnD+2kPuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQR1GIEx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQR1GIEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789552560; x=1821088560;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iAHJd4eqBM8b6hwbrA5kr1yWGb3u2TqN8211KLrRBwk=;
  b=kQR1GIExeBPnIKfN7wr5uwGwYYh+jg7FImiS04RsToM+QQ1XKzJUXHya
   xBwCWuF7MpWNwM97QNURHCCvZPh1Na0Uv0HmcOQPe+sLHYGQQ6VWlTenC
   Dw4RRbSfDd8pYd2clczb8Y88ep1z77QT6OhTrPvkHRUBgJhz0aDLNtBy2
   4IX727/YvcntAGwUkCH5U4Zrh4DB/3f/GNJAQwW1L6GCF3FdIGn7h1udg
   p0Z1Ys9KYu68wiNWwNsvNKtG3Y+EZuP/jvjitxwLGkLhdpXgUIVWlBiWw
   UOoiT0avLQCHsCWZxmAsI5U1O8B8R/zZmKG2HPxgyCNo5jN5TxwOLmkmQ
   w==;
X-CSE-ConnectionGUID: mskYfKRCRy++5Ki60Mv1CA==
X-CSE-MsgGUID: V6jv7XZiTz6K0/xG+DI3cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77486938"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77486938"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:55:56 -0700
X-CSE-ConnectionGUID: CMf+pV8wSQO9PkbimfunmA==
X-CSE-MsgGUID: 1AA1bSyoS7mKuAtJD4vrvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311564651"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:55:52 -0700
Date: Wed, 16 Sep 2026 12:55:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, mfd@lists.linux.dev,
	Roman Vivchar <rva333@protonmail.com>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: Re: [PATCH 2/3] iio: adc: mt6397-auxadc: add mt6397 PMIC AUXADC
 driver
Message-ID: <aqpnpT6hU5Z0s1TZ@ashevche-desk.local>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-2-d35d2ac3d6f0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 11:15:27PM -0500, Ryan Brue wrote:
> The mt6397 AUXADC is a 10-bit ADC behind the SoC's PMIC wrapper. On boards
> built around this PMIC it is the only way to read the battery: the SoC's
> AUXADC is wired to board thermistors and the charger ICs these boards use
> have no ADC of their own.
> 
> Add a driver exposing the battery voltage and battery temperature
> channels. Only those two are described, so a channel ID in the device tree
> is an index into the driver's channel array rather than the PMIC's channel
> number, as mt6323-auxadc does. The ready bit lives in a channel's raw
> result register, but the value comes from the chip's trimmed copy of it,
> which is what the vendor driver reads for a measurement.
> 
> Both channels need more than that, as the vendor programs them. The
> battery voltage is measured through ISENSE, because a board with a
> switching charger in the power path leaves BATSNS on the charger's system
> rail instead of on the pack. The thermistor only reads correctly with the
> PMIC's battery-detect bias and input buffer enabled, which take 20 ms to
> settle. Both are switched back off afterwards.
> 
> Reads average sixteen conversions in software; the chip's sample
> accumulator makes no measurable difference at any setting, so it is left
> at one sample per conversion.

...

> +/*
> + * MediaTek MT6397 PMIC AUXADC IIO driver
> + *
> + * Copyright (c) 2026 Ryan Brue <ryanbrue.dev@gmail.com>
> + *
> + * Based on drivers/iio/adc/mt6323-auxadc.c

Why not add this device support into that driver?

> + */

...

> +#define MT6397_AUXADC_ISENSE_SETTLE_US	USEC_PER_MSEC

(1 * USEC_PER_MSEC)

...

> +static const struct iio_chan_spec mt6397_auxadc_channels[] = {
> +	MTK_PMIC_IIO_CHAN(isense,   MT6397_AUXADC_ISENSE,

One space too many.

> +			  MT6397_AUXADC_HWCHAN_BATSNS),
> +	MTK_PMIC_IIO_CHAN(bat_temp, MT6397_AUXADC_BAT_TEMP,
> +			  MT6397_AUXADC_HWCHAN_BAT_TEMP),
> +};

...

> +static int mt6397_auxadc_battemp_bias(struct mt6397_auxadc *adc, bool on)
> +{
> +	struct regmap *map = adc->regmap;
> +	int ret;
> +
> +	if (on) {
> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> +				      MT6397_AUXADC_CON0_BUF_PWD_ON);
> +		if (ret)
> +			return ret;
> +		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> +				      MT6397_AUXADC_CON0_BUF_PWD_B);
> +		if (ret)
> +			return ret;
> +		return regmap_set_bits(map, MT6397_CHR_CON7,
> +				       MT6397_CHR_CON7_BATON_TDET_EN);
> +	}
> +
> +	ret = regmap_clear_bits(map, MT6397_CHR_CON7,
> +				MT6397_CHR_CON7_BATON_TDET_EN);
> +	ret = ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
> +				       MT6397_AUXADC_CON0_BUF_PWD_B);
> +	return ret ?: regmap_clear_bits(map, MT6397_AUXADC_CON0,
> +					MT6397_AUXADC_CON0_BUF_PWD_ON);

Huh?! Please, use standard pattern with 'if (ret) return ret;'.
Ditto for other weird cases like this.

> +}

...

> +{
> +	unsigned int i, sum = 0;
> +	int ret, sample;

It's preferred not to mix ret with other semantically different variables.

> +	/* Held across the whole burst: the channel select is shared state. */
> +	guard(mutex)(&adc->lock);
> +
> +	if (chan->channel == MT6397_AUXADC_ISENSE) {
> +		ret = mt6397_auxadc_isense_enable(adc);
> +		if (ret)
> +			return ret;
> +		fsleep(MT6397_AUXADC_ISENSE_SETTLE_US);
> +	} else {
> +		ret = mt6397_auxadc_battemp_bias(adc, true);
> +		if (ret)
> +			return ret;
> +		fsleep(MT6397_AUXADC_BATTEMP_SETTLE_US);
> +	}

> +	for (i = 0; i < MT6397_AUXADC_SAMPLES; i++) {

	for (unsigned int i = 0; i < MT6397_AUXADC_SAMPLES; i++) {


> +		ret = mt6397_auxadc_read_once(adc, chan, &sample);
> +		if (ret)
> +			break;
> +
> +		sum += sample;
> +	}
> +
> +	/* Lower START so the converter is not left armed between reads. */
> +	regmap_clear_bits(adc->regmap, MT6397_AUXADC_CON1,
> +			  MT6397_AUXADC_CON1_START);
> +
> +	if (chan->channel == MT6397_AUXADC_ISENSE)
> +		mt6397_auxadc_isense_disable(adc);
> +	else
> +		mt6397_auxadc_battemp_bias(adc, false);
> +
> +	if (ret)
> +		return ret;
> +
> +	*val = DIV_ROUND_CLOSEST(sum, MT6397_AUXADC_SAMPLES);
> +
> +	return 0;
> +}

...

Otherwise nice and small driver.

-- 
With Best Regards,
Andy Shevchenko


