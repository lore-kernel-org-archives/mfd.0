Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602898;
	b=wTiLv0IG9havDoc7O/3I6qc0ZuIv3g/txCfAGJD+IZTrFc9ThfyKfW/fvZCplhfd5QJV
	 2q70P9iw9paL6rggxOIfDraU5v354DgiURlMdkOe9L5ljBaNRg3fo6inpScNHGLL2hI42
	 97CLMmYD96t/fokT2rATEjip0q5KQ2AY7q2NZrH3QSs9RNnzTgpu6h03KmLhV1Pcvye9/
	 BTxXvtQTxzROpBEt6OiMORr30kmOrb/xtu2PzrssNL9+EdPjqdLLRNRpboR8fverE7l8v
	 1TJG2trrszdMtwBKvqHGz61y4MPtz6kOP0Vv6hU+pUrcsi0Mu+8c9HFIGNnEbEPvrqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602898;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=oqEN7wXVMuC9p1NAc8NM204rxrPwPlxsYIh7S0flO4U=;
	b=QSlREzD/MUpdysXTMKAkHvtfQP756kJeUJnQQxl7yHFrVRRiGDStMsrtjUDtMi6SwZyw
	 Lb2us7WZLGoaQiONX51MZ7Dxd5QrWiJ3Gc/BsqSDhybZ5BroqMUVpveItmymyQnCh39Ek
	 wOzWdIzKDBgUYb0BbScu+2qdw2v3zPL4fb6JMwgCC/6fbG7jRFKY/vf6os4qyy5RcQk62
	 V38H5//YUmbBihP9v+VB34nIU1X6Hc0ttsGAnq6kHpSmr3pzChtPBtx+iZlPI2p8DDkgB
	 PAtl9+GGdGPKn2snUIcJ2RFdtkEhm1u+aHFknZoJrCCiYbofAeB/JhVMTIQz9Bka7SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1oPkO0c;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3AD606A32C
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 17:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC3AD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1oPkO0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792602898; x=1824138898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ya5g/tIN6ysAP53ekfsK/5OkuvzSCZq7YB0H/WaB3uk=;
  b=E1oPkO0cm614pK5PinuJBaSRvzWlI5iDa1W81P3WKgzORkhLRxbq9pDc
   SpCckYMMQGlATi8tg0gOTazWa75xPgpCDgPBGGmAbM/BAXIUcChTmrveI
   nSjVssdyJrvS408FuSUwu1I7HByUKurtmY3uWfXserUceapFEkzL9dD6E
   xjstmQw3ybvZmUql8/Leb9OnbQ89ywwxwdt8DA/wU4hGBfj6jS+oJx5ZJ
   MzHmsPWI7lzv+lP5Mszr4DrI95rmtcZ6uNhJrRs/viDMYlEn31nf2VVPY
   OW2BF8TndNNPR90E/lTnOj9FxHJbIyY9a9cbHwx5CVzW0fjeyf6A0cgpq
   w==;
X-CSE-ConnectionGUID: daRy72zLQ7iQmxiRFmvo7g==
X-CSE-MsgGUID: gnir9EetT3aeH1m+tUPwgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1209280"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1209280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 10:14:58 -0700
X-CSE-ConnectionGUID: KxLzjQiZRLWliU+BbE7j/g==
X-CSE-MsgGUID: n7YYPDLAQ7GQenc8n/NJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3134530"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 10:14:56 -0700
Date: Wed, 21 Oct 2026 20:14:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Navon John Lukose <navonjohnlukose@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mfd: intel-lpss: Set d3hot_delay to 0
Message-ID: <atjzDQGgsp1A6cDQ@ashevche-desk.local>
References: <20261016114347.23633-1-navonjohnlukose@gmail.com>
 <atIjpJn1Y0GPmQbP@ashevche-desk.local>
 <20261019043437.GY176164@black.igk.intel.com>
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
In-Reply-To: <20261019043437.GY176164@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 19, 2026 at 06:34:37AM +0200, Mika Westerberg wrote:
> On Fri, Oct 16, 2026 at 04:16:20PM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 16, 2026 at 05:13:47PM +0530, Navon John Lukose wrote:
> > > intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
> > > LPSS controller still sleeps the default 10 ms d3hot_delay in
> > > pci_power_up().
> > > 
> > > On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the delay costs 8-16 ms per
> > > resume of the touchpad's I2C controller, which lands on the first
> > > touchpad report after each 1 s autosuspend. With d3hot_delay set to 0 the
> > > power-up takes 64-256 us and the I2C transfers that follow complete
> > > without errors.
> > 
> > So, do you state that this patch fixes some bad touchpad behaviour? If so,
> > please, provide some logs.
> > 
> > > Commit 815b4448198f ("i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel
> > > controllers") does the same for the Intel I3C controllers.
> > 
> > Okay, it means they were tested.

...

> > > Notes:
> > >     RFC because I could only test Arrow Lake-H, and this applies to every LPSS
> > >     generation the driver handles, back to Sunrise Point. Andy, do any of the
> > >     older ones need the D3hot->D0 delay? If so I can limit it to newer IDs
> > >     through the driver data.
> > 
> > AFAIK 10 ms for D3hot delay is in accordance with PCI specification.
> > Yes, we use quirk_remove_d3hot_delay() for very old Intel Atom SoCs,
> > but I have no idea about Skylake line of products.
> > 
> > Mika, Ilpo, do you have any ideas or comments on this?
> 
> Like you say it's requirement of the PCI spec. However, since these are
> really not PCI connected devices the delay likely is not needed as seen
> here. No objections from my side.

Okay, thanks.

Navon, please, issue a new version with the summary of this discussion being
embedded into the commit message.

-- 
With Best Regards,
Andy Shevchenko


