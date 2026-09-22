Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1BD3B6359
	for <mfd@lists.linux.dev>; Tue, 22 Sep 2026 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080176; cv=none; b=b9w3fcIcjWImC+4lMIvbiYUHoGD0N6BLOO5Cb5g4MjGTdAtdIt2JJM8+9TA6QRPPMrIUHe5sLKh7mo62vKR3BfslAE9OLmFzoYCD3JbQGAtYrQfe0jjpXvVLIkzJ3QAo4EvGwDqhqls/EoWM+Tbys6+c3TSd+5S3zjSk7I9YVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080176; c=relaxed/simple;
	bh=pqD36nJS2t/GmEx9i84xJKll99YBX8VLzR/Coeg3uWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy1Sh9UPo5ePLkA6Yq2IZqwhcQifFbZHJ1BI1sev9Y7TA1f8AyWoVcWwxr1UM9szpdgooDKBeg3ZVM213QmCBMlExxwWdzpVw8CCKRzP1cLDqwuBqkHkGiVz1lgyvgWzY+2UdVVMz1aISnungmkG+ml+NR7iwrobhVtRoZvxNcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMjlYMCo; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMjlYMCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790080175; x=1821616175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pqD36nJS2t/GmEx9i84xJKll99YBX8VLzR/Coeg3uWw=;
  b=VMjlYMCoOHyh5PCJT48nmh9Vl+cXpd+nw6p2ldWXBsLlX9VODrA+Mrug
   xbYiDsm+EPmXCRTw+arwh31aC9vMPNENKspUPGR/j6WQ2UtAyTAe6lZDI
   CJP/ByX08ZAapVUY9gQmOocVb3NCN9j44KbYgq3Z7LoSXx18I6ED6xczr
   DFN8Y72Db9GJ2pyBZaA4qI3/isTtmHTMCT3PWLMeCd9Wj8zR+xRj55rXW
   71Wsd1WWLR1dXaTmETrFFjNvYNacH7wiUOi7p1rulW5fyqLXAWkvqdSx9
   o8r9rC3NvOh9/SAWL9VxwD5Wl7J0LEpVE9w+bDrfhNvGpq+4UEmDDe9+a
   w==;
X-CSE-ConnectionGUID: i5cAYyJUQH6KPS43WtkvOw==
X-CSE-MsgGUID: E+6rU9mCQeGcFTpgn1J4rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1179528"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1179528"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:29:28 -0700
X-CSE-ConnectionGUID: u5rgthFRRceF6JOgL9hxFg==
X-CSE-MsgGUID: D1/+FC9OQ4qRh3912qp6/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="299350500"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:29:27 -0700
Date: Tue, 22 Sep 2026 15:29:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: fix iDMA device leak on probe failure
Message-ID: <arJ0pDlXpdlsF0sT@ashevche-desk.local>
References: <20260921104058.353748-1-lgs201920130244@gmail.com>
 <20260921110512.GS106095@black.igk.intel.com>
 <CANUHTR9gA-mKn8Y496Pty4_Fhu3BSSyhXWrmiod1WvuVdQjkag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANUHTR9gA-mKn8Y496Pty4_Fhu3BSSyhXWrmiod1WvuVdQjkag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 22, 2026 at 03:59:32PM +0800, Guangshuo Li wrote:
> On Mon, 21 Sept 2026 at 19:05, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Mon, Sep 21, 2026 at 06:40:58PM +0800, Guangshuo Li wrote:

> > I think this could use devm_mfd_add_devices() instead.
> >
> > > The issue was identified by a static analysis tool I developed and
> > > confirmed by manual review.

> Do you mean converting both MFD registrations to devm_mfd_add_devices()
> and dropping the explicit mfd_remove_devices() from the remove path, like
> this?

Won't work properly. The rule of thumb, it should be no 'goto' after devm_*() call.

> Would this be the preferred change?

-- 
With Best Regards,
Andy Shevchenko


