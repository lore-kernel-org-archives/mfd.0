Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC3D3CC330;
	Tue, 15 Sep 2026 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486256; cv=none; b=N9RlWk1VXh6VahOTyMCGHzWa/xpftQpmXMnRu3zSU4A4HeEkAj5I6lv00LC7WyBMLUdv+u2lkR2LmXTUdHSXWw9itjR7OIDrtBzGy20oFbeasEsr5NRU4LAwYVLuAVitSh92foe+eqy+52D4YaCqLRLe5mrIe20fSXGmS41jj7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486256; c=relaxed/simple;
	bh=g8LXI+FLmIC86HxvAHNU7lIP6/5lrj8l5npIS9TK1TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcC5GMCnxXp6lX0R2mFtN6Ch+rmgxsM8ysUNLqp7oNT1pTZcePJaqluq4fX3sgJKVYuuHvFfRupSFGCSfnVwCUSTkLuVN+xYwTl60J5+7yFsYB0ag04CTqj2YO/IWfTh6geJvNwJK7JJxexg4FbsnsLNQJ1+e8Th6uG4ojKtpEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpwlUX5I; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpwlUX5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789486251; x=1821022251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g8LXI+FLmIC86HxvAHNU7lIP6/5lrj8l5npIS9TK1TE=;
  b=VpwlUX5Ihv90xjGsQ/CpceULAPWPvxMEZzVZ5w6YuiL2tvJBi+DBy1Uw
   gp7C8uCtW8ZDypwRjcETjC9hvHWscakedkKigN/tkJs9OexWmUKAIodrq
   7Sh/DsTN+K+FdU9jh41lwklCB3Tk1nb3hYfnoBZC7z5JXn+04l1enicJQ
   Qu2Hzn/CXUe8Iir+mXle02zHy7eG193qr7R3grK3zbkbDN/dTPtdDU5u+
   C+0KlCW4osoWGADQpQFcs5SD5t19Kwr4QctLZIFKsteL9fjdMKgXqfOFN
   mluS7gsIdeRwU8C51W9725oxG62EflEyN9YJIxHsvZf7uOdGkOMrkh6p1
   A==;
X-CSE-ConnectionGUID: RUJJc+7dShSn5bumHPJ+cQ==
X-CSE-MsgGUID: wDy5I5ZVQe2qi/vEFhjvsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101202663"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101202663"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:30:47 -0700
X-CSE-ConnectionGUID: 6C7AqoZuRhSZQAKatvE9Iw==
X-CSE-MsgGUID: L/Rwoq4CRxqPHw3+KDO9Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="302924565"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:30:41 -0700
Date: Tue, 15 Sep 2026 18:30:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 09/15] gpiolib: regmap: add gpio_regmap_get_chip()
Message-ID: <aqlknvOejkE5zutq@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-9-3297d3fbc9c0@ambarella.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-9-3297d3fbc9c0@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 07:15:39PM +0800, Long Zhao via B4 Relay wrote:

> Let drivers that implement a custom irqchip retrieve the gpio_chip
> after registration. Attach a caller-provided irq_domain only when it
> is present.

...

>  struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config)
>  {
> -	struct irq_domain *irq_domain;
>  	struct gpio_regmap *gpio;
>  	struct gpio_chip *chip;
>  	int ret;

>  #ifdef CONFIG_REGMAP_IRQ
>  	if (config->regmap_irq_chip) {
> +		struct irq_domain *irq_domain;
> +
>  		gpio->regmap_irq_line = config->regmap_irq_line;
>  		ret = regmap_add_irq_chip_fwnode(dev_fwnode(config->parent), config->regmap,
>  						 config->regmap_irq_line, config->regmap_irq_flags,
> @@ -420,12 +427,15 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
>  			goto err_remove_gpiochip;
>  
>  		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
> +		if (irq_domain) {
> +			ret = gpiochip_irqchip_add_domain(chip, irq_domain);
> +			if (ret)
> +				goto err_remove_gpiochip;
> +		}
>  	} else
>  #endif
> -	irq_domain = config->irq_domain;
> -
> -	if (irq_domain) {
> -		ret = gpiochip_irqchip_add_domain(chip, irq_domain);
> +	if (config->irq_domain) {
> +		ret = gpiochip_irqchip_add_domain(chip, config->irq_domain);
>  		if (ret)
>  			goto err_remove_gpiochip;
>  	}

I do not understand how it's different from the original one. Can you elaborate?

-- 
With Best Regards,
Andy Shevchenko


