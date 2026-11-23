Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460474;
	b=iMhtnyeKuUzWwFrCt5vbt96UFYTRDhk+8+cfRVQSLAn82sXRD1ubp//zUqgJS1SQ7M8d
	 I0njuAgbec5Mx9yZ7ttY3KugiYhkQay2O/aWe6gNCoFkOYjqiWt4vy0OAMdql0cMrJ0yW
	 h/r6nOsznobXoEAYFVYMO6kAZc6DaJU3vNouhsNh+wK8ZeK+ibHdfqSSt/wufSx/LN0Ct
	 tBcne27kP234+iOOJgNLrvahzmPNgAXK7I/byWKfKhTfNFnrQqQGyvjP68bb2atLNFs5E
	 TDKT2eSE8bqapcSQQpQ8D0891Tw6X+FbBYKQZDBs2LXzO2IF7HXpPePOYko30xaLjww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460474;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=OM1l1a6MaFYM6UQWajjylj0wSszPBen8KKq+VqeSNlI=;
	b=CY0RFG2u6Yv18dZ7EdunJcFrO01prqawipsN5DATk92Wshfmp8+u02Yy8PEA4upQiL30
	 571yHS1zl8gu60/jnnx7h8Nsnj8R9/ffrSv4LPlyRCnfA6q6CHOSYzIadbTdyACfk+Jef
	 4tlqb6xzwttBJznetuYNNhDov9d35R8pgKXu8rMtojcKVi33ADz/v33DAI2RH3JeqyVVp
	 7Ftvq+XNlasEhU2rkO9z+qopvoWyJTe74BSYhkQz8NVtuaxFbA3cmWr2H0FLRv7S7JEHx
	 5mndstcGYsoVnR8e8msiziCAnFzgTo4Z6U/CaGGSfSB8R3mqnW2gaizHLs04ZDOdIEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DiBe3VvV;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1109606A32D
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 19:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1109606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DiBe3VvV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795460474; x=1826996474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ecKjDsDaB9Pn4lvanWhrhh0Qxeke2fq2ZAe/eYi4PXo=;
  b=DiBe3VvVG7srBP1kmI64jQzLN11oIfsvo+7qlscq389MXYcmmkzYx2MF
   CUjb1lR8o9jmowsjY7tbzh2ZA2jk7m+T+lF+l8WYt3djUOX7IFAKNpBX3
   aphHvpXA59thJIKetjtPcsr4uM1zT6SQBIxOvFn2Cv2hycb4He782jvZF
   XjljfAhaOn9j/MCoEo+SoHRECd8MweVjBOp4kdXU3ekCq5GQSWJ9YTYIo
   gbLijRUkg8Z/rt2RaE1nblEEp+hwcCT/nz5YUs/+iD0HQopo2nDXkm67r
   pZr0D8uVHWDP5TOvyPZTjzwBKErv//24DGJMA6Rn0PGsQNfgTABCgAo+i
   w==;
X-CSE-ConnectionGUID: 7ilpYDueR8+aS2l64a5b8w==
X-CSE-MsgGUID: YccGdgZ2Si6rYCFfEq3Kgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4173905"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4173905"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 11:01:14 -0800
X-CSE-ConnectionGUID: gJ6pmc+hSe22J6YUqkmvXw==
X-CSE-MsgGUID: vMGGdCEiS1SWS+p5o9xSzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11142338"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 11:01:09 -0800
Date: Mon, 23 Nov 2026 21:01:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v3 3/4] iio: adc: Add support for MAX8907 ADC cell
Message-ID: <awSNc2piI26LgyAU@ashevche-desk.local>
References: <20261123150725.212836-1-clamor95@gmail.com>
 <20261123150725.212836-4-clamor95@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123150725.212836-4-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 05:07:24PM +0200, Svyatoslav Ryhel wrote:
> The MAX8907 PMIC has a dedicated ADC cell, which provides 8 ADC channels
> with information about different parts of the power system, including the
> battery, charger/plug, jack and thermal readings.

...

> +#define MAX8907_CHAN(_type, _idname, _datasheet_name) {		\
> +	.type = (_type),					\
> +	.address = MAX8907_REG_##_idname##_MSB |		\
> +		   MAX8907_REG_##_idname##_MEASURE << 8,	\
> +	.indexed = 1,						\
> +	.channel = (_idname),					\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |		\
> +			      BIT(IIO_CHAN_INFO_SCALE),		\
> +	.scan_index = (_idname),				\

Using () means that you expect an expression as a possible input. In such
a case the macro is buggy as it will evaluate it twice for _idname. The
simple solution is to drop these parentheses and expect that this macro
won't ever be used with the expressions in the parameters.

> +	.scan_type = {						\
> +		.format = IIO_SCAN_FORMAT_UNSIGNED_INT,		\
> +		.realbits = 12,					\
> +		.storagebits = 16,				\
> +		.endianness = IIO_CPU,				\
> +	},							\
> +	.datasheet_name = (_datasheet_name),			\
> +}

...

> +static int max8907_adc_read(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	struct regmap **regmap = iio_priv(indio_dev);

Then logically better to go further and have

	struct regmap *map = *regmap;

> +	__be16 data;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = regmap_write(*regmap, MAX8907_TO_MEASURE(chan->address), 0);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_bulk_read(*regmap, MAX8907_TO_REG(chan->address), &data, sizeof(data));

This is a bit too long.

		ret = regmap_bulk_read(map, MAX8907_TO_REG(chan->address),
				       &data, sizeof(data));

> +		if (ret)
> +			return ret;
> +
> +		*val = be16_to_cpu(data) >> 4;
> +
> +		return IIO_VAL_INT;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		*val = max8907_default_ref[chan->channel];
> +		*val2 = chan->scan_type.realbits;
> +
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

...

> +static int max8907_adc_init(struct regmap *regmap)

Why not name it 'map'?

> +{
> +	u32 value;
> +	int ret;
> +
> +	/* Enable internal voltage reference. Exact purpose of bits is not known. */
> +	ret = regmap_update_bits(regmap, MAX8907_REG_TSC_CNFG1, GENMASK(1, 0), BIT(1));

	ret = regmap_update_bits(map, MAX8907_REG_TSC_CNFG1, GENMASK(1, 0), BIT(1));

> +	if (ret)
> +		return ret;
> +
> +	/* Check for internal reference IRQ */

Please, make style of one-line comments consistent ("all or none" are with or
without period, same for the first letter — capital or small).

> +	ret = regmap_read_poll_timeout(regmap, MAX8907_REG_TSC_STA_INT, value,
> +				       !(value & MAX8907_MASK_NREF_OK), 10, 1000);

	ret = regmap_read_poll_timeout(map, MAX8907_REG_TSC_STA_INT, value,
				       !(value & MAX8907_MASK_NREF_OK),
				       10, 1 * USEC_PER_MSEC);

> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(regmap, MAX8907_REG_ADC_SCHED,
> +				  MAX8907_ADC_SCHED_AUTOSCH_ENABLE |
> +				  MAX8907_ADC_SCHED_AUTOSCH_TIME,
> +				  MAX8907_ADC_SCHED_AUTOSCH_ENABLE);
> +}

-- 
With Best Regards,
Andy Shevchenko


