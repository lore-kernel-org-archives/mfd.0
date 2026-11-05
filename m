Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868986;
	b=BP0bLa2CTWI35nRQy4qzDWw2FrF+P+YW7wi1aeCIu2dqjrYz4PcWzEAaHQoW03ocUBLi
	 6kEqqg7Uk8jq4bsSg1M/oQyiEAfARlapihJ6DzgFkbqMkujYiZRVfugAtK2pAwsPhZrFO
	 QFiKMXDRQ5n7yl0ze1PtvU6ASAMg4WxYv872bw6OtIyHVz9lhn1PglLVtUY5FPZHcJ/TW
	 w5hJ/aBCaVB83IZrF4LXqabATA7NrSO9zR8+Zv2DN4o1020HQn3Nf1kKfwsNjV3mM52kM
	 HP9xT3W0TPxC0CTuPDzh0Va9LQY518sE+tfTMlVVtCaeWWzs8OK3LX0Dgo1Op1IKBFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868986;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=hF8aR+ceDc/gKzLZnmcGniPWDw9DlnkfN+kVIbdix2U=;
	b=FHteCCgJSOJTyushQSHqq4DUHQPY3nnSvZnoNrl2rRpZ7aLXWH1gKn/5vyP3OdKGdLMc
	 24tq6nbWYyYKct8w6T6Xce0WO79kCcXJjNP40uLh4f+toSEubwCGBkw4I9JhnOxDj6O4+
	 NNUQopSb0GsDtl74nsf14s8N6XIZRQuHBsc7Dchm8Cbxi3K7Jdho8n+fMql+WlHJo6uN8
	 fZ7eQJN/nu3ppgXNAUCOEX3lCI5aOYSC9k/PRrAJPSYYtUo9813wdVHd86ocfky7cV1xq
	 gc3QVQh19xXntdusWER6a2415bPMDMJj7DIycheQzqDqiOWWektjrt8FM+wVmqT/7QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="UHSJ1p/I";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A7606A329
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 08:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6A7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UHSJ1p/I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793868985; x=1825404985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xE1RMlqplpoS5C4PuOLgUp+fQ5GX1Jx6Krf8S0Zsj4Y=;
  b=UHSJ1p/IO5wg/foDttTeOeAiBKyNCEQyccTnEO4CIQ1QWlvmgxninc4O
   Jiog6m8yVwHMVZalmUpZId18wdcBDtY3HseMAHwr/SajCLCGm2UJwQ1Zz
   8YcpX9e96QZH1/n3KTzB5pP0UsH8tRjSsqoEJOn7GG4yWNLTtOA77qDaj
   qyus7E9JrD8vvO0or+awDEt/SbHfEzKkfWMJisraj/vDcHKFLotTfu+wp
   Kka9S1/wJ/ckpfe6sJ/iE7c75DVt8NUPZufSEnWuAB7+sIFJ2MuCAwjwo
   5OyOsFAL6VAFzDhyJVJfqc5mdfP5fl1dZIaykhomN34LFetH3zU7b40RZ
   g==;
X-CSE-ConnectionGUID: 3h1bhGt+TU2nFuCSubrJ7A==
X-CSE-MsgGUID: LQI6PtNNQQeWbB3GaWgEVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2536223"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2536223"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 00:56:25 -0800
X-CSE-ConnectionGUID: 53KO9pz8QuaXznjENnCiQw==
X-CSE-MsgGUID: mg/oL9UJT6yxATcwEAC1Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7081224"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 00:56:20 -0800
Date: Thu, 5 Nov 2026 10:56:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-crypto@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 2/2] mfd: Use named initializers for acpi_device_id
Message-ID: <auxEss5ZSi5cAWW6@ashevche-desk.local>
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
 <20261104-acpi-mfd-v2-2-64b9dee3baaf@thegoodpenguin.co.uk>
 <auulmL-HXdzcdM2V@ashevche-desk.local>
 <CAA6zWZKk9C_PnZKZueYYCT=XHcQA7r4SPM4MK8zWHLyYuxS=Uw@mail.gmail.com>
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
In-Reply-To: <CAA6zWZKk9C_PnZKZueYYCT=XHcQA7r4SPM4MK8zWHLyYuxS=Uw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 07:52:21AM +0000, Pawel Zalewski wrote:
> > Haven't I given the tag for Intel PMIC drivers?
> No I do not see it, the only reply on lore and in my inbox from you on
> V1 is re splitting the Intel LPSS.

Oh, here we are then

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # Intel PMIC

-- 
With Best Regards,
Andy Shevchenko


