Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591171;
	b=Rc0t6dC7jicv2SZdgGqhbUIIqWvsVZ8TXxRT9cCuRwcaabt9w0O+6wH0Adz8RqGWvD36
	 gZVIxI2U3p+SkOUlZgpQEFBpPxEuRDT4GpCdhVuaGi28dP33ubmu8RdJopM0SOYeZBXmy
	 AwtZWJ9ncUvjL5WHQWjYLdx4jSsBd8DzfvlfsV+SSFKDaYiubqUsO1m0wywZlwvVLD+hi
	 r+ToQ4ROHF4luQj7jeOgsvDEhPybCgY9OtwaPvFivmbyqGtsnacbvE0nob0mIDf8/cOEh
	 VUKqyZcmwJw8pQFRq4W+2ocl2UiF2Y9yP/jFQFO9bbGlYh/M+AU0NArE75DMWiH3AIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591171;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=UE2jAlTYEq+YwHW+pSln9hYyMLJjzucBmaYDCqdkEk0=;
	b=Jf/DK9OCV7WZfqcTOEK4Px02eEtcIzDkvJJyj8cBzGyLcxWMyDwNHNfCplsag7o2hnGh
	 Jpt+s+W3mNl+pAwiOOgcAjai22AZICxCglWDQb/ioDDkdpU87mUZrM19aCO+MXu1AlFR6
	 D6Q+ZXOP9J+oFEuXkJ0Dm4FYrNFkdHGpLlKyqsCKLE9UYbtxHRiVj3J8kO5FJFxu2Xqmn
	 VBK1t955fxptovc96aFjCFRIRiBj8OCiy4YTGEEfHiW2Xz8bPZl52eieI4KIlyOhk7cAo
	 hCIIRZd2JAZcHKUleSvAZnkmeQLXsQA7h7nmDXNmqmI5w0K0p46ufSDfKaLg7rZE0VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCvV4YYK;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB26606A337
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 13:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB26606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCvV4YYK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792591170; x=1824127170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M9ma1PfVa4eoTZ1+X/BoZc4yKj+bFJpViB/TmVSBVto=;
  b=OCvV4YYKGzpE6dAESTmOcVIBAfSlCVeu2NmyJ04H7prPLIRixDVTFUL5
   mdkvV83+PvG0cwjVhQk14zvIpgQdn8Qj4DmHrl8AoGd5z43X3vPfBT3+C
   AEEtwoeDIXmY9iAvmMKyskYAXuNygNwoU6Xi/32/V+f3pjqUVLF7ttb8w
   2HT6vUeK3QgEWwoNaZo09kQ1Q84lZ26KfeWojY5ULJKF382j3k19qkRpj
   FhslqCB6kJ7+DD8YYQJhCaBHPMaDIkeNP3XCGWliqcZdx++XT3cqsf/l5
   rO/ftA6Y0c9q5sy5N48eq9/dGEqNGd7C0EUvpegWGp9Nq/o8OnBN4FvhP
   Q==;
X-CSE-ConnectionGUID: ErhdSRGSQEqgKlG0zKR4og==
X-CSE-MsgGUID: /aFt2tvYR1W11fDCXHDC4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1203628"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1203628"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:59:03 -0700
X-CSE-ConnectionGUID: 48h6JtW3QuWQOPaAujilUw==
X-CSE-MsgGUID: 5isEUzeEQj6JXLOxkkNt2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3155684"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:59:01 -0700
Date: Wed, 21 Oct 2026 16:58:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/28] mfd: ls2kbmc: Allocate simplefb platform_data on
 the heap
Message-ID: <atjFI4h-82VXY0Vj@ashevche-desk.local>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-4-lee@kernel.org>
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
In-Reply-To: <20261021121245.3111563-4-lee@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 12:09:26PM +0000, Lee Jones wrote:
> ls2k_bmc_probe() declares struct simplefb_platform_data on the stack and
> assigns its address to the display MFD cell.  Although mfd_add_device()
> deep-copies platform_data via platform_device_add_data() before
> ls2k_bmc_probe() returns, the shallow mfd_cell copy attached to the
> child platform device retains a stale pointer to the expired stack
> frame.
> 
> Allocate the simplefb_platform_data structure on the heap via
> devm_kzalloc() prior to devm_mfd_add_devices() so the pointer remains
> valid for the lifetime of the child platform device.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
assuming you will add Reported-by: Sashiko...

-- 
With Best Regards,
Andy Shevchenko


