Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601444;
	b=fjpqoKyutwfLJ6MKCnxz8LhqMq8I4N6Ao+usUA5H4vYX9ySea3MlFEFPNDTz7rRIpBTt
	 oNe1PNegBWjayHrefL4pup1rPXSMXXQKCKfPMM9bwOCu0uk/cPbd8dMasiB3QDB7pJpA0
	 RYE7ToHr5f1viMbs0h/t/OFkOkgPbKk4oKz2sCy/4IQy14CcekkuYloAjb3NMaljlVeKj
	 umYbHvsHyvj0OzynCsOr6q/pURwqHDHTSwQyUUIms3q99FtuNK3WJXtMNW5+XSgtgqvrA
	 YVzg653RMZl1qERLEgZukLs9Tg0OQ0uVHKSHGpM8gFaAZimjmF11KP8FINREzrQxvlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601444;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=2I12zZUGi8IkHCfLoLBXgmvmIv1jBPZyRGr1hwDC/1M=;
	b=1p8kX18v183MAKGiV1dT89gwPBq9Yt+e7qawv0//JyEnmh573HShaLfM0L6kiIy4JZh2
	 JW/hNAz7YteaaMig0Id2BmJGXP8My89vtuQPhixDONNnIOAbNrixyYfOH+fU96GtECevC
	 WSxqik+UOSVh7SA/ekTMcG/p7Rdej/D1AsKpIZS5DQHWyKOjHGmRGiY4e+Vmz8WYLeDEj
	 1Zdpaz7UqMyrS4UkKISX4SFi+ePvF0ULTfgoQ/kezyr/9OEmhQYzsZa2/EzS5yxxto0kv
	 XwaKxh93D1CFX4J8hS+n1CnhsXW9/QfOiGB7kgzK34TeS0tDdwIaaPwjj6y5tKuNPKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hnq2Gate;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD18606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 16:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD18606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hnq2Gate
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792601443; x=1824137443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yYMKKIdbV7b3eMCMI7dG8r4taU6rDDpjImRye20+01Y=;
  b=hnq2Gate9vgpvKI3bDiBhy77pOa8rzeEQSPfh+NlEAEyLVvbDS9lL7lK
   gu84MTI7F/15XEB4rbBoh8NGDOyRXavgGtSPdc7ikO4PhuBdxhk6oYHE0
   P2GGI+Q7PQuvjJ6neC69IsPBZZmUyt/BOLAlevYRzbhI+cqtQvMTVAEAG
   J9kQGLh5minksMf+Kw2VtcyNb4RYqLp8PdA03snIpRbj0a8dTFaLm0eFL
   T5Gm6iaVO1Sk3K4FN1LJGPsfZ63Q5LV0Lr6hSAjwRcrSX2IeOw1K2Vr+v
   IT5rRsmQWj1uqXYYAORfPghg8we75bQvN6GHqGHFhYVSYmRBw/kQZPbg6
   w==;
X-CSE-ConnectionGUID: 0mSRDRN5Rc+KQUI4yEQIUQ==
X-CSE-MsgGUID: 9gPt4YPiQACeu4yJ47Sj+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1332833"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1332833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 09:50:43 -0700
X-CSE-ConnectionGUID: peRzz2TRTBKdGuhrylrvnw==
X-CSE-MsgGUID: YUpkw5GUQLKjy80JhRLG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3457978"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 09:50:40 -0700
Date: Wed, 21 Oct 2026 19:50:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>,
	Corey Minyard <corey@minyard.net>,
	Huacai Chen <chenhuacai@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 02/28] mfd: ls2kbmc: Unregister GPIO GSI via
 devm_add_action_or_reset()
Message-ID: <atjtXj50zqeBzfGH@ashevche-desk.local>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-2-lee@kernel.org>
 <atjEyo2VkaJuecMh@ashevche-desk.local>
 <20261021163405.GI1795367@google.com>
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
In-Reply-To: <20261021163405.GI1795367@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 05:34:05PM +0100, Lee Jones wrote:
> On Wed, 21 Oct 2026, Andy Shevchenko wrote:
> > On Wed, Oct 21, 2026 at 12:09:24PM +0000, Lee Jones wrote:

...

> > > Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function support")
> > > Closes: https://sashiko.dev/#/bug/linux-cab8bfb6-4077-46f3-a173-ac2e2042cf66
> > 
> > Don't we use the official Sachiko's email in Reported-by tag?
> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> 
> Roman suggested Closes: when I reached out.

Same answer is in the previous reply.

-- 
With Best Regards,
Andy Shevchenko


