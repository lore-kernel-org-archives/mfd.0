Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777B04DBD62;
	Thu, 17 Sep 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647764; cv=none; b=KYmsdYJJeFA8FIMVWPV/pKZKMcJ9Jj2vb8LMTyfbBBBpdGn/wWJejz3SE/rwgKIUc02cfov+Dq63oK/xRRzpkJPw+pZ++dOlj/aLyD9+JX0vc350j1LsJHAFAnKuJSP2EYhSzhxt2G2y78qbFVj1xlLHz72BAOBtDRuDdgIgZ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647764; c=relaxed/simple;
	bh=Zo57ptsMztytzJ66q7w7TElsqXFNRm3Xo9NSI9URBfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNP9W8oklhV8d9cU9EOpMpRei4lNVx0IuN3Bx7jlMT7clbzPIbw8NYws146GxNKkZNqs7S+2fABaE3gdxYkgbgM60c7FKolXO5i3wFGQN+UeQfqLkXK96LG+paI1TYuXGV0VzRPzq7CxFJ99On4gvIIHadWGU/MeNqlpfLgsZHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8hWB5fg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8hWB5fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789647756; x=1821183756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zo57ptsMztytzJ66q7w7TElsqXFNRm3Xo9NSI9URBfc=;
  b=R8hWB5fgqbUReZT8dkBMZ2tExWWanOrPNpua3tscfi92Vsr4PcTI5EhT
   Eb2+DGHr8ggFwgOUZ58YdNBxDz15u73KPINYrfT0LR+RFScYPGdaBpV24
   N97b0HBb7L/ooUwT4EF7pRmla7/F/D7trco7ZxEjxo+TgC2pbM71AOwZv
   9WouKexLUPEhjFqyai9h1g60gYh6aa9To58JdwjVrNBQ9nHs4i8u7ul67
   HfEs0bpsFY/MpMd78N06kC00pJ+Ho6DINgK3X7oV46I8Bqgwl7vJ6npBi
   fQq17ueS6IwjmF3fmpyPxNdJiXEJNthKcfRXT8/kAGTTyhWYoiJBvPqCC
   g==;
X-CSE-ConnectionGUID: YfRCgvmGTRal7ytTK03zzg==
X-CSE-MsgGUID: CWth5yloTlyVEu9qzFXDLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107569073"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107569073"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:22:28 -0700
X-CSE-ConnectionGUID: BfjX0q2oSlax1Hx0fa4JPQ==
X-CSE-MsgGUID: C6UIlR4DSgmHmuVzv984bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270450345"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:22:22 -0700
Date: Thu, 17 Sep 2026 15:22:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
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
	Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v7 12/15] pinctrl: ambarella: add CV75 pin controller
Message-ID: <aqvbfCQ6cxfGYJeC@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-12-3297d3fbc9c0@ambarella.com>
 <aqp0VlwWotnuK9t7@ashevche-desk.local>
 <40f1f819.7f85.1a0ae9e4dae.Coremail.zl020895@163.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40f1f819.7f85.1a0ae9e4dae.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 05:06:45PM +0800, zl020895 wrote:
> Thanks for the review. The small comments will be in v8,
> including pinconf set via regmap_assign_bits.
> 
> PINCTRL_PINGROUP does not fit here: groups carry
> AMBA_PINMUX(pin, alt), not a pin-number list, so I will keep
> CV75_GROUP.

I didn't get. It takes a pin as a parameter and adds the function on top
of it. It is a combo, but I think it still fits the purpose. Please, use
existing data structure and a macro.

> At 2026-09-16 18:49:58, "Andy Shevchenko" <andriy.shevchenko@linux.intel.com> wrote:
> >On Tue, Sep 15, 2026 at 07:15:42PM +0800, Long Zhao via B4 Relay wrote:

...

> >> +#define AMBA_PINMUX(pin, alt)		(((alt) << 12) | (pin))
> >> +#define AMBA_PINMUX_TO_PIN(mux)		((mux) & 0xfff)
> >> +#define AMBA_PINMUX_TO_ALT(mux)		(((mux) >> 12) & 0x7)
> >> +
> >> +struct amb_pinmux_group {
> >> +	const char *name;
> >> +	const u32 *mux;
> >> +	unsigned int nmux;
> >> +};

^^^ left for the context.


-- 
With Best Regards,
Andy Shevchenko


