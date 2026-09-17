Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12C034D3BE
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 05:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789623283; cv=none; b=kgczADee2hjVZUpxFSueI61JhVqTBaKUSOQfT6UOFl454R9PfzuEXHOrv3RnHrx4ywFavVKk9JerXUM3EoTPEsIrC7iGWbi3RKjx1v+SG+feAm69BorAMLPReWm5k0B1v4ulkOpnGllDef9OvZwKuZ43C8wdAH6ryw7oEwqCSWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789623283; c=relaxed/simple;
	bh=s9jMr4RE4MtMwzFs8m0X1J0xrdOxY4NLkJsIJOiLyTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KV7hCkbsmkCfjEmgJTW3LKB/F9WSfIg28+X7kNsbCvq7jg/qW8rmcuLueWRi1h3pXMeqIqQrRA6UTrpV/FbmaU+GOEmOGmWf4cNG4UnckKWhzuC/otJXINBMAEY7dJCgvWuE0wNs4VUNxT4C5cxhEWSwd1OUn9ZnTZQ8Bc/sJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWjcg8oi; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWjcg8oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789623282; x=1821159282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s9jMr4RE4MtMwzFs8m0X1J0xrdOxY4NLkJsIJOiLyTU=;
  b=LWjcg8oivxbAORogn9DppfNzjC6tBS2rX5sF+9Zq5HG0lnZVmPd48sZh
   7ANkqIl+DBeH78dUpFtUaqUfCaRG/hOtX8p6XuXa9gjuAeEqcQWqS5Fmd
   yNYoFGEyT4BjNy2cOgNjeCK1XtNItQyC/ZjGbgBTLJiFqqurZujHVXGI4
   KRm6MhuVYyL+cvzhFRwJboyevOZAZSVzFQbZflRlmtPENcAd0Cb5ABv2m
   65nx7XXjmhLC9fQfllF8DjaZAZ/NmDhkzYxU1HgjH2sbktvIep7w0qJEt
   pP1Z015lo+mj3hLvEyNGIeyE07/Aaq7v+VZjSw+P2Zf3TQeivj7vXvZFB
   A==;
X-CSE-ConnectionGUID: RbLNq+eoTP+NSOEZJ9BUGQ==
X-CSE-MsgGUID: sII561jnTWesBhNb1hPREA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="518769"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="518769"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 22:34:41 -0700
X-CSE-ConnectionGUID: Tp1ko1bNQxK5k1hhbAe9ww==
X-CSE-MsgGUID: fsCHY03cTEqxPHDoeguR+A==
X-ExtLoop1: 1
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 22:34:40 -0700
Date: Thu, 17 Sep 2026 08:34:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/4] mfd: intel-lpss: Clean up and modernize DebugFS
 usage
Message-ID: <aqt77bXKuXhsyQ3o@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-intel-lpss-debugfs-v7-0-eb51d41f55e0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 09:23:46PM +0500, Maria Lisina wrote:
> This series cleans up DebugFS code, modernizes it by replacing
> obsoleted macros and removes redundant error checking.

> Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
> ---
> Changes in v7:
> - The final corrections after review.
> - Link to v6: https://lore.kernel.org/r/20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com

Great! Thanks for the clean up mini-series!

-- 
With Best Regards,
Andy Shevchenko


