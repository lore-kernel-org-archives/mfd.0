Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F0C488211
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988722; cv=none; b=lZjIbKnOQNTy/egmn5JcvYIYy2QzGCr2nRXDUgiDrkeWu+jmC5tllJRO8J+HU6IzvtDfhAFIaH3SXLSer+6WHbF2l2/BmfHvRuuJ6jhou4vdaw8CpuvuP+Llfj2cG/1IV/EDty0Hp/MFCLdCkPdsbpEVo9Ra0/VsHnsKO1G0dno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988722; c=relaxed/simple;
	bh=qLPP3i3QZKEJaRBsoBTTq9gGZE1U11jdY6+r+SxdhKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLsn2R9pPsYQ6BNF1L8wvV4XMDy5APKTpQJ097pecp/RQbZVovuZeBZj6ibqG0r2VzAF8d/OFhHZYYUBSuEJW8aLXbtJi6d2emPfsNF4GqHzobYvrnLfiLdP98hgAH40HbJZUBUVBiL1bNzcrpGl24yu2UmHl27i5EfYdqtA8KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FClgJk9V; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FClgJk9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789988719; x=1821524719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qLPP3i3QZKEJaRBsoBTTq9gGZE1U11jdY6+r+SxdhKU=;
  b=FClgJk9VzoIfauc2a/0j9fX3aNqDthESOckcsFlNghyNm8JVjH1o7CSf
   lg7MmPB1TGoJzELi+jxVIjJTPukYOM/jkvSj8uGf0y4qBRektMEpbYwdx
   Wbz7wgPf8chOwWM32x3IfK6bbMO4tDivgvld8LzmmU9udzEq7Kkv4sP2E
   XxK73mAZgbJ9JDvdPnvMMK928qjsd/PQoj1enub/0Y7Vld5ALQ3LHoN6t
   NEBCRJdJhx3YGC2c9bJt2ljiDmzNAwzx5ZSQvsJOomMRAsUtkjLbkD/6K
   tpfluh6QXGPeFqB6Q3wJ/UZLCJE1k+CbP168SCdxnMBfmw6dGwsrO44Ps
   A==;
X-CSE-ConnectionGUID: cN1Sl+5ZSTaSsFrb39Jn+A==
X-CSE-MsgGUID: auoig9T3SUePzDdWoH97lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="998219"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="998219"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 04:05:15 -0700
X-CSE-ConnectionGUID: LPFxbG/VQfmpHLJsSmJzig==
X-CSE-MsgGUID: rZoRl1K6QoSJ3rAi5rCgGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3910502"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 21 Sep 2026 04:05:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1371799; Mon, 21 Sep 2026 13:05:12 +0200 (CEST)
Date: Mon, 21 Sep 2026 13:05:12 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mfd: intel-lpss: fix iDMA device leak on probe failure
Message-ID: <20260921110512.GS106095@black.igk.intel.com>
References: <20260921104058.353748-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921104058.353748-1-lgs201920130244@gmail.com>

Hi,

On Mon, Sep 21, 2026 at 06:40:58PM +0800, Guangshuo Li wrote:
> intel_lpss_probe() may register an iDMA MFD child before registering
> the main controller cell. If the iDMA child is registered successfully
> but the subsequent mfd_add_devices() call for the main cell fails, the
> probe error path returns without removing the already registered iDMA
> device.
> 
> Since the normal remove callback is not called after a failed probe,
> the iDMA platform device remains registered and is never released.
> 
> Call mfd_remove_devices() on the probe error path to remove any MFD
> children that were successfully registered before the main cell
> registration failed.

I think this could use devm_mfd_add_devices() instead.

> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
> 
> Fixes: 4b45efe85263 ("mfd: Add support for Intel Sunrisepoint LPSS devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/mfd/intel-lpss.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
> index 63d6694f7145..657b1e3fb896 100644
> --- a/drivers/mfd/intel-lpss.c
> +++ b/drivers/mfd/intel-lpss.c
> @@ -455,6 +455,7 @@ int intel_lpss_probe(struct device *dev,
>  	return 0;
>  
>  err_remove_ltr:
> +	mfd_remove_devices(dev);
>  	intel_lpss_debugfs_remove(lpss);
>  	intel_lpss_ltr_hide(lpss);
>  	intel_lpss_unregister_clock(lpss);
> -- 
> 2.43.0
