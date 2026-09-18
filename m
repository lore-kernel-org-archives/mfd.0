Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC50033F58D
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 07:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715794; cv=none; b=J0HsBlbf8Ih3NJG09H12Z0Z3eJt/q2BpvJRcQ/c0z8oBHqrOpvstm5q2vN3LLr3z2Dfh+JvaJEgZXRs3PL3BNnHaIaDPSpdhDJWaIbp7xffXtc4r8k2fCMSB4E2yMtk7DluHOJWWHi1WRn+rWRKUmR6kqbJRQRBBdX5kK+qPVBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715794; c=relaxed/simple;
	bh=fA7/UnaYykb1NNCMAnNibkhBBnsqLfyGWvbdfXT2bdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZN9QqgF+Izf0kCOkYLcLH4jZlAmTpQ+/fAhdxId5ArzJMPQM9bWOMSnhV/eBnbI6ucMA2YdF2ZO9DntIo7ciKkIndlqsfBZNEucuqqX1oVMUn5OP7rBrAGMLjaHmHb3OkWsNsVBbHC4Jm26Goo7dzYI8Dhkl8n4hNlIP3iE0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoGxW1Qe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoGxW1Qe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789715792; x=1821251792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fA7/UnaYykb1NNCMAnNibkhBBnsqLfyGWvbdfXT2bdI=;
  b=EoGxW1QeL0k4NMQVIvQY+WGTURG4eJH8hh0r1GJiKvjXbZH3shrAdvLH
   87HGNo4VjqblEeLZ3HjFiwZmGk/jVtvbLRMvf7ADAUzhLgD8rf7w53wbD
   E2fdLgvC5ooWuEZQFPNT7ohr59DHLCFpfjcO+XJim8h4AoPnPch7FhQIZ
   58xDTpT54BfW7gaTSZzB6kyGXKawnlTLdtqdBCjgj49b88/jpLcsaqp+q
   SyA5WJ7JvM/H2cj4O3x4+YwSkcdLsFGllwPvzqUzH3f1WmmPHtvesfHmj
   yM2pEY6ApAdX0XNCOpMfFJZLYU1hNqcytpAcRvXRtIF2WYdkZVyZGF+OO
   Q==;
X-CSE-ConnectionGUID: 3G5j4K5cSwSOv2TB8wlrQw==
X-CSE-MsgGUID: bkJLctLrQqKOyZBXsNBB/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92712720"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92712720"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:16:29 -0700
X-CSE-ConnectionGUID: 6oed3UO/SEGyBQJ/nUa00g==
X-CSE-MsgGUID: Y7eNRWi0Q5uM79fpfqC0Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="299360210"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 00:16:27 -0700
Date: Fri, 18 Sep 2026 10:16:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v3] mfd: intel_soc_pmic_crc: Balance IRQ wake enable
Message-ID: <aqzlSd5moyLIhLbG@ashevche-desk.local>
References: <CAGEsz8GN7XObjqzMZ1KcghAKH8anMsYSU30PUJ_YXY-zDsvcpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEsz8GN7XObjqzMZ1KcghAKH8anMsYSU30PUJ_YXY-zDsvcpA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 01:36:25PM -0500, Myeonghun Pak wrote:
> The INT33FD Crystal Cove driver enables the parent IRQ as a wake source
> after registering its regmap IRQ chip. When that succeeds, a later
> mfd_add_devices() failure or driver removal leaves the wake enable
> unbalanced.
> 
> Record whether enable_irq_wake() succeeded and disable IRQ wake on a
> subsequent mfd_add_devices() failure or driver removal. On removal, do
> this after removing the MFD children and before the managed regmap IRQ
> chip is released. Keep warning and continuing when enable_irq_wake()
> itself fails, without attempting to disable wake in that case.
> 
> This is limited to the Bay Trail and Cherry Trail Crystal Cove PMIC
> variants using the INT33FD ACPI ID.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.

...

>  	ret = enable_irq_wake(pmic->irq);
>  	if (ret)
>  		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);

> +	else
> +		pmic->irq_wake_enabled = true;

No need. Hint: we have irqd_is_wakeup_set().

...

>  			      config->n_cell_devs, NULL, 0,
>  			      regmap_irq_get_domain(pmic->irq_chip_data));
> -	if (ret)
> +	if (ret) {
>  		pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
> +		if (pmic->irq_wake_enabled)
> +			disable_irq_wake(pmic->irq);
> +	}
> 
>  	return ret;
>  }
> 
>  static void crystal_cove_i2c_remove(struct i2c_client *i2c)
>  {
> +	struct intel_soc_pmic *pmic = i2c_get_clientdata(i2c);
> +
>  	/* remove crc-pwm lookup table */
>  	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
> 
>  	mfd_remove_devices(&i2c->dev);
> +	if (pmic->irq_wake_enabled)
> +		disable_irq_wake(pmic->irq);

Hmm... This looks like another possible bug as we remove table before removing
the MFD devices. Not sure if this is okay. Can you check that as well? Perhaps
we would need another fix-patch.

>  }

-- 
With Best Regards,
Andy Shevchenko


