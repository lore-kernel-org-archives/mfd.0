Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591374;
	b=TDNfJHflcIZ94PM1JhmscNipHb3Okcb3BqjSTHdjrVu19BCdkqWaz1OA7SgEqYkVUTED
	 LLpvwOo10izqCH5umS1y80omhIaxvdX5B/HDZ4DZDUNRXJyxnGpUU1vKREFASEIqiDf2m
	 VRIculY8aGq2oL9F6ad0KGqATdNfGuzQUXu5kWDMliDlwMKV4D41T4wJHjaUl7RXIL6rz
	 NYSZ3Fl10ouGe6I9/Gk15pWU1p6Mrlvf6gFYk2aIbO1k1almRnGAHyb6Rv2ZHWsuq2p58
	 nciuW7bcaT3EH0ZL9t/Ga+hLdX4zpgNpiRboQV+FoOJAriP9TFfeZzXWbkQqgBK2bDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591374;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=fDLM2uSdaow9LokFw0VaDIv/9QOPzVgEmcb//BHgPyM=;
	b=hXDIUrYaHRtiHdrH3BRngvolOaYY/DNY8n5ddeXESRe2T1pQ2X56YNCzbDFGUCz7+zmL
	 vbciaRGkADyEMjJac9R0Bci2/CqA8IQEhlqgcUbrXZ2muiZ14olABazGnNfVj+J1tekBo
	 Rpa9+OZ14dbR8iU0RqrLjxjmJBDQiuRieSvspKkkHbvq/E1RSnGH/ixjyYXzXKepCklvG
	 JRO+JaxknX+w4jN5wmtSj6wGBpLSZGa5tRJnX8qmBYZwLtFlPV1uvDY+O6tyzopMW+0+9
	 Qn6d+6WrDHjmd5GzMglsF3f7ngOCbKvjk09sMNEBL0iDusMnAczzJIpy2yjqJ+s0hOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUA8VE9V;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C57606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 14:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUA8VE9V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792591374; x=1824127374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6TcpUU+U6JP4MXD+j4bO+YP5IabLS7DHZ5gJkyB4Sa4=;
  b=OUA8VE9VlomzQ9ySAxgQDPJtkfHVZW9TwNJXT9Ywx1oiCdAA8Ecd4Aef
   EizK+tZE8RVNa+f5eHjVetBF0m1YWo2r8PtLGDE8r9fjngmRGRgx6nJVN
   uQg90Cn5QIbz60ayEiLGDeTe3VOSGsZKYsvdSPUktNpUoPVY1XOAmdor2
   f/7N4xQO2p3j1prVfWigHu9rbstQgko/xtsShO0qn0iKYPzWFgTbYfVEJ
   RJJkcm19w+Bfp5lKh+4+4/VGWkisQvJ72Oqp8qrPiU58zzKwEZOfnTQLF
   2j98t4c8KmrLk5EFqhEmtsuV5w9hBJS+8OgVAMCktq/Ozfijn0evHAxff
   w==;
X-CSE-ConnectionGUID: 2/TyX8ysRLWT/72e+MopTw==
X-CSE-MsgGUID: O+dqot1GTliEr7eI+E3b9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1214491"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1214491"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:02:51 -0700
X-CSE-ConnectionGUID: JogAVmmJS02mlCCCTu7pTg==
X-CSE-MsgGUID: iwCDsb9RRXOAkFMEYHMsEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3416326"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:02:48 -0700
Date: Wed, 21 Oct 2026 17:02:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shi Hao <i.shihao.999@gmail.com>, Rachna Patil <rachna@ti.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH 28/28] mfd: ti_am335x_tscadc: Remove redundant
 ti_tscadc_dev_get() helper
Message-ID: <atjGBg9IAnPPBRmX@ashevche-desk.local>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-28-lee@kernel.org>
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
In-Reply-To: <20261021121245.3111563-28-lee@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 12:09:50PM +0000, Lee Jones wrote:
> Now that ti_tscadc_dev_get() is a single-line wrapper around
> dev_get_drvdata(p->dev.parent), remove the bespoke helper and retrieve
> the parent driver data directly in the child ADC and touchscreen
> drivers.

I don't see more patches Cc'ed to me, so I don't know if this one makes sense
or not, but OTOH I don't care much, both approaches are fine with me.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


