Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5A4E8E03;
	Wed, 16 Sep 2026 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555901; cv=none; b=pssTXSEdNKGVM8FV/Qs2OLi0l3Ivbzu2nL64hRDmiyv5j1BMC4Nb44VcEedyPYqrgpF170yokiSvH0bpTIkMfjwetDo+MXDAFO+GFc/enhhVRQHffq/3nUUhrH6IH7AJjQ8WT+cN1P+NLCfuzgSVFpnZ0qJ9ygpgHu6Lc0rLdvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555901; c=relaxed/simple;
	bh=3dnspZBBhdBbFMeM0WCDXZI0ml0DomVOCTSEv9AUE24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1DSYJ0JFEkbUi2HUGYdWzTNebFExXZgyOXx4miLMJraus6yqHkYXDdz84vrGbsL2GTQfgU+HZAYc1H3jMX0dtnM/dQKFPORWNNnbRKDLWTNE0P0199b+ABhbUaS3Xcfbk0ojDBxUxFIkoBGSIAr6CwHZV4S0DQRD8sYqKaIeaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnsRlF+V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnsRlF+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789555889; x=1821091889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3dnspZBBhdBbFMeM0WCDXZI0ml0DomVOCTSEv9AUE24=;
  b=WnsRlF+VYGjh53QrLYBEl+pBbUNNanHfwVnw74J00nJ7hsSPy7ZabPRR
   IdvxF28drHOAWKdg4S6sctlVH3zv1w/pfJ3PNENgJCsOMiw4qH4X1qAhd
   qdgJImE5d+EOde72qsezweX+5FP5aUM2jh3p3iYbg2w2J/IRTsL4njZay
   xFfkQ9t/n6LsfB+sIhWslutJqu9qfvolV4MU6t7l83zjT3GPrG4jEdXzH
   hci5c+T6BTxJt8hEn4BgG1JR1ER7c7bW+VaSP4J7litW8mwJ0joE01ObX
   OouAYd2hQlFr/TJhHDxvq0TAp9MPpZGJUZTQDVu9ld6od0F/n84ubb17A
   A==;
X-CSE-ConnectionGUID: catShVuRTqCCOvwmIxIPiA==
X-CSE-MsgGUID: 5lewrY6PQrWSvw3fgku4ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90063473"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90063473"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:51:27 -0700
X-CSE-ConnectionGUID: f53uaTkgRHSVd4aHVEbG+w==
X-CSE-MsgGUID: siQuExozT/yqdlSyeZN/dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296795155"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:51:21 -0700
Date: Wed, 16 Sep 2026 13:51:19 +0300
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
Subject: Re: [PATCH v7 11/15] gpio: pl061: add Ambarella register-layout
 variant
Message-ID: <aqp0pxBOc-amrmCz@ashevche-desk.local>
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-11-3297d3fbc9c0@ambarella.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-cv75-v5-v7-11-3297d3fbc9c0@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 07:15:41PM +0800, Long Zhao via B4 Relay wrote:

> Add a 32-bit, 32-line layout with DAT/DIR/IS/IBE/IEV/IE/MIS/IC plus
> MASK and ENABLE. Probe unmasks the bank and enables the controller.
> IRQ type changes also clear the pending bit. This derivative does not
> need write-after-direction or system suspend save/restore.
> 
> Match the part with designer AMBA_VENDOR_AMBARELLA (JEP106 identity
> 0x68, bit 7 set) and part number 0x061.

Yep, this one looks nice now!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


