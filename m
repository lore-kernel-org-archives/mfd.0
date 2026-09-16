Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4253849B46A
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573570; cv=none; b=eUwiegi1m/7DlTly7CMiQz+yPRo1YroXPE5TSRfjngKM/VP2HvbSNur2DIfEDUZ4a9kRd7NseZDv80+xxnMwlJ9E4ywDxcmP0xfA2AlnGLxobjNuruLIk6wztEJabMIDz8vy44TcR27jLDRiFh44gdKxOhYxNR920F/a8UJn2WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573570; c=relaxed/simple;
	bh=5uKyglGe3ZnLYyMIvNdfqXCAfiZMkQlN6vOESCSsJmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXiXU9lzkfy3aAoA9t5qe0yDWJ7xdah4Sd5jx80+vzgijuSiWr6dMbR9xl1gLLMUyJZtNqBGfSZ5S/vF1s4EYD3i5GbFrBlgiLZz7FNq3+oPwTitVxu0nz8POEyKLvuhRSye8igHkd/BucbWyPP57fXzwc3+C7a2DRNeN9HEGPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUuqW7+6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUuqW7+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789573569; x=1821109569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5uKyglGe3ZnLYyMIvNdfqXCAfiZMkQlN6vOESCSsJmQ=;
  b=MUuqW7+6cDfRlLGkp+6/P/1mgtpAzxeU2nbXIadxNunHvnjwnUEGW6PB
   l39kcLSoeAtHl/9Y55XI5dE35Tp/eStQMzpoGSSQB/XkxFYgS4oD+NvEQ
   2kMEgUnVXHdpp13d9Pu+NZNJ91KK1NfQkYIeJXmaoQstthXg2QEk0JcJW
   5z6COUVHL5mC/5z463gMXU6nEhFLC512Nys2KaHtw4R4cfoDNNcVTpmiS
   /KB03iaBpv7MirSmJ8C6aT0v0ACoh4JOfT6nU52PuQIrLs550PN1spTS0
   56BGjhsysZD+eBuebvVAbzL0Uo5KST2w2OMp8GOHBUm1DIuzuExiiZeDa
   w==;
X-CSE-ConnectionGUID: FmKuK4edSIOJ+VvCA7Hupw==
X-CSE-MsgGUID: sGRpetrqR+K0PfjjxaFRLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100618172"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100618172"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:46:09 -0700
X-CSE-ConnectionGUID: lKsd4L1PSvS/GcIdusBAbg==
X-CSE-MsgGUID: 5EvdPaZnTg+0VIvy2JtXwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273350420"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:46:07 -0700
Date: Wed, 16 Sep 2026 18:46:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] mfd: intel-lpss: Use plain octal values for file
 permissions
Message-ID: <aqq5vFAf1GoPjYme@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
 <20260916-intel-lpss-debugfs-v6-2-5c118ac430ed@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-intel-lpss-debugfs-v6-2-5c118ac430ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 07:36:40PM +0500, Maria Lisina wrote:
> S_IRUGO macro is obsoleted and not recommended to use,
> therefore replace it with plain octal values.

Yep, octal permissions much easier to get without looking aside!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


