Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460051;
	b=XHf/16IC+GMKgYT8r9SRQvvm7w0PodE472RjAuUvtELVGGzUlvU3YfINdDl+MYXRMo5T
	 5HTZXTnbdPnVeQCUoMv3lqg/4ZChotRDbUPbEOjHI+iQyHTsEpaa+oHQeutsZIpBDG1Rg
	 T1/ALLZbpG3epV1i7mXWMqheBW6maJQRCcntZS4YzgCVl6gynk0JLg1rUkB4Q6QB+adG+
	 F6qvvAkujMStsd4svVbYG8waxtITHXB6SLPuEZD1l2q0ZewdNB/II/s6x95vQE14mUpym
	 5zvfkKVvq1Z3EBViDaMoQil7tlVHjMAewho7cFWLI6KChMGVqdzXEAEd4M8BqM0q/oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460051;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=n8eQg2VWTFkHRh6nWKvn0g7mBpUZuTIVj5vM3Ba8/NA=;
	b=5WoTk9UpBbBwd28AVUlbFkNYZ6r7vQNDnBAUlnt/nC+azPhnuYzmseeXNHBcuIuzFY5Z
	 ZxBgj874QuZBZi3roSEs2Kd4yYyLDKEzd4TIwqnjx4nZbCxUsQJCIDPWbElrcrHCsnkxj
	 sMLGRbom2KAhMXy9Qw9DBID/ANaGoLVjKhS49qszh79O44CyN5NbEIFOLlKWbOS8Z2+6B
	 sMhFB9RpGnRaaXs2tcXnnpKGdxi/k7lA/fTgn/lFnMFVnfrl8kheD1XvayODgmZEIt5gR
	 0JgNd2Txf6XTp3BESCzccXZqSoaaPksHasAfeS5dvV4vMPb16MN7NZq20S00Tpi6Gtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l4QQaynp;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961DB606A32A
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 18:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961DB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l4QQaynp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795460051; x=1826996051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AqLoSY+uMHaQijDdZjXL3V2+Q61y+Y4AyaStKFNQjIQ=;
  b=l4QQaynpElxci8Q/JnGLIJN4bWIecfB0w7xfgyfqtBPI0JXitBEHFxUx
   zTWT6cNA6AHwhnrhYp1CNA94O0V/RK4XSM+2qdQ7sXtwOfQ0akpV95/yT
   uGWyIAakBPu0Q5YzmySH53D2XuckGTmeJstOrfua8Ya2inuMQcWh0F2ep
   PMHS2j4SFiUzIMhuUyFjN1tE3+YlqX2UEQIpxw4ZhW+tWZ7L52442XgrK
   UGMjGC1KmcDK20GeUPBJ76T4cYYdz5kJZs6NLXkAaCkmTIakviqsiHXQv
   pka9sJ9TmPq/fF6ntnfvz07/xODfE2tIosodyQ8Rv8ke2/kgV/SsfSwvN
   g==;
X-CSE-ConnectionGUID: ORKdUGWRR/e6RemYrwW4uw==
X-CSE-MsgGUID: kOhjRbdxRC6FJwXztOjDSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4257309"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4257309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:54:10 -0800
X-CSE-ConnectionGUID: XKzp2d0yTnKmegeO65Prmg==
X-CSE-MsgGUID: 5cslLiyvRKm5/g9Euq76bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11576350"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:54:06 -0800
Date: Mon, 23 Nov 2026 20:54:04 +0200
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
Subject: Re: [PATCH v3 2/4] mfd: max8907: Add ADC client support
Message-ID: <awSLzG6IxXjKLBCx@ashevche-desk.local>
References: <20261123150725.212836-1-clamor95@gmail.com>
 <20261123150725.212836-3-clamor95@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123150725.212836-3-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 05:07:23PM +0200, Svyatoslav Ryhel wrote:
> The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
> support for it along with its regmap and interrupts.

...

> +static const struct regmap_irq max8907_adc_irqs[] = {
> +	{ .reg_offset = 0, .mask = BIT(0), },
> +	{ .reg_offset = 0, .mask = BIT(1), },

When {} on the same line, the inner trailing comma is not needed (if we ever
need to extend this we would need to change a line anyway, so there is no
benefit of having a trailing comma).

If it's just this, no need to resend. Just a hint for the future.

> +};

-- 
With Best Regards,
Andy Shevchenko


