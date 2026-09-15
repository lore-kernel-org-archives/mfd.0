Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF83DC4CF;
	Tue, 15 Sep 2026 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484851; cv=none; b=mChXcIyuNudQAC6DNbT+aPC/PtFI0klapZsJ3FC6JAs3mBxJJvUsM6oF7wazCacvyAAC+TXuxPJ5Fg7LmeisqsDNp6pBSQ91eg4R0WO1ifPTfs9As4dfSBUOyhxwGraHGitDZmSS6Vg+blVqm+1e4uNEu6rmxVHbUrWDb8EAnpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484851; c=relaxed/simple;
	bh=EW0qRFGFljFTOmx6/2DP3eUwDe1LgFNPcQdwJlKSirI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=On80rRmLIS/lbGr+D7nuT0r3LE9rGeYPap2QSfNSp7/E4jXCpHB4Gq9kvS4wTbeez8wfrkTG65lgRC7NS98jZdMadoimwageeC/FLhc1a8Tql8ccP7brh1/pFnmsV6FYWLhwExiYwSkWHfXo41wxsTnKUtzG6DsAjn/Jy7yJPhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcsTXDEa; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcsTXDEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789484848; x=1821020848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EW0qRFGFljFTOmx6/2DP3eUwDe1LgFNPcQdwJlKSirI=;
  b=PcsTXDEaeBweo0sTYeHdIS76Mu0wuUjhbdclL6C/Ba+XN9EcFc/8fo3Z
   PtAnuqiUSdpeKJT9BUJ+ruAJf3lml14Q0f8soI6B3znURqPqWeF2GkoAK
   OPZYFEmpd/3+ZO8zoPdMotKt1NmRwXSJc49FBOmwNtMhT1+v0CiS+4u3B
   vLKiXdVLoew0uz897vm5MEq5qQM454yF5HheOhvp/73FN0j03cWP/LfyC
   dXmxaIrw+Xq1w8qs1JuaJN+Wk6D0EJuriXD4D66adrtQDngkl7H9uE3O5
   F7kwnvYozrVZTwUHymRwvusq20MpgX+8QJBGiH08wRs4f2TiCzwr7Fooe
   A==;
X-CSE-ConnectionGUID: KHpbiD0AQZSQJbp+H5tARg==
X-CSE-MsgGUID: tJOQljnLR/a1Pw818ihq4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="361053"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="361053"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:07:28 -0700
X-CSE-ConnectionGUID: qGvx8WAqSlmM63A4mIdOJQ==
X-CSE-MsgGUID: Lf22iUCBQe6YEuM+0Lg/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271603122"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.57])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 08:07:22 -0700
Date: Tue, 15 Sep 2026 18:07:19 +0300
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
Subject: Re: [PATCH v7 08/15] gpiolib: regmap: add write_data_after_dir quirk
Message-ID: <aqlfJ3PnFib1smnV@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 07:15:38PM +0800, Long Zhao via B4 Relay wrote:

> Some controllers ignore data-register writes while a line is still an
> input. Optionally write the output value again after switching the
> direction, matching the existing PL061 behaviour.

...

> -	gpio_regmap_set(chip, offset, value);
> +	ret = gpio_regmap_set(chip, offset, value);
> +	if (ret)
> +		return ret;

I think that this might lead to regressions when the end driver just leaves
the output in the previous state in case of errors. In any case, even if this
is a correct update, it needs to be done separately with the justification
that shows that all current users won't have regressions or the regression is
actually a fix of the behaviour.

> +	ret = gpio_regmap_set_direction(chip, offset, true);
> +	if (ret)
> +		return ret;
>  
> -	return gpio_regmap_set_direction(chip, offset, true);
> +	/*
> +	 * gpio value is set again, because pl061 doesn't allow to set value of
> +	 * a gpio pin before configuring it in OUT mode.
> +	 */
> +	if (gpio->write_data_after_dir)
> +		return gpio_regmap_set(chip, offset, value);

Taking the above into account I'm not sure if we want the inconsistency with
the above. Perhaps also ignore the returned value for now?

> +	return 0;

-- 
With Best Regards,
Andy Shevchenko


