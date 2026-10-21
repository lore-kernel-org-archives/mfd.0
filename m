Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591283;
	b=IJRUzg/4bthW7Fmyyb+Kqsn5ATj7w551pdCa9lMzcmI960TuVkeUbl2oIVjgaiNarStw
	 dsyALJ/GCqtCDsPxO9xaCZIaRgL3HGUOdc50Rh6qj7/FhyVDjWa+eqo5eO6Sbq31S79Sd
	 v0Dwn+2UkLZOTuk3TE1XsxjvOsRgIuG6ltTFXZq9JIlifu46+w8A//Lq+WP1n+w0Lw7GX
	 u77qYFkZVdyWAheeL7NokAOl8UfRQGNvIQA9Lagf6cIJBZN1dllIEn4tE9b42Q8+B2+5J
	 X9jDKODzrVQNg3eASys7dmO9XmBibU3gUqIPIqtGh/qnFEeq8H0XEe16JmM0kiCWuyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591283;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=VoW0QI8hkXkyGQEtNK9VxFVdZVV5lqLanjbqC2O8Y+c=;
	b=rStuO8Z6rR04f/95CUhisOB/sX2Or346otx3cX9/vvGk7pUeaZi48xhogF6v9ek7yUHd
	 qBmzFpU5iw/tJ2etezhDrkywc0bSg5W2hZQYtPDqQhk8zwH4npfLFD8bI6Uo71Uka5NIH
	 AI1WAijEevItQIUCk83UM/l+9Oh8Mg8D+To71mtwgzk/wSs5achZUY1eCJ+yTQGdRoO69
	 IiOqYrwzHFsV0zixjlpofpa4f7nnfPXjm0XwrJ6Gp2htuyAvkdykHVx2YoCEpvMQes85F
	 bRRj9ooRUYCYXqOMaSqbYQrm85mNclV8p3AHC1euJxIMkYaf8+LC4aSxkv0vsPyQIoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CgJARfT6;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA19606A32A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 14:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA19606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CgJARfT6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792591284; x=1824127284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=siTshYTdsj+SHwoheTZV3W1Go3kgTcFmgXq0YtxD4EQ=;
  b=CgJARfT6Ba5YR7vwKUhOYuCPkvRAR1A66gyTX68r++crsZDlL8FZzmnU
   XSoUWOZU1vnmKjUw1qlD6jD1hB1K0Al3U3h1DfN1gnY5ZLyqWkTrjxevj
   SThnR+xQmdgx3rMZdXQodIaDWkpGCT70u2cm1pRVyw2vx0CUWwbrJnRYs
   oVWORgQs6gkIni7MIBicrN/ZDt+vCKQP5s5oYYxsXqw6Ay2/R5o+36f/g
   GBdllcLK3sezZ88ZHz75XAFTIwVpZRH8wfrbFwDKkia2apEwijga7/iw9
   bpr90Wt62A5BCT7pKXcAjKvx3If/gMrZJmNZphLwMpKtZl6x/Py2RoIeW
   A==;
X-CSE-ConnectionGUID: kh2H+k+TQ4iHsbg2zQX5pA==
X-CSE-MsgGUID: rSHjHE0aQ266LXWQczpj/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1328671"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1328671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:01:23 -0700
X-CSE-ConnectionGUID: 9hSW0c7JRr+AYa3s3ruxmg==
X-CSE-MsgGUID: yC7OOVkEShu09IXf5oLMxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3199584"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:01:20 -0700
Date: Wed, 21 Oct 2026 17:01:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 11/28] mfd: intel-lpss: Remove registered MFD child
 devices on probe failure
Message-ID: <atjFroYp0Cp7eN8c@ashevche-desk.local>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-11-lee@kernel.org>
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
In-Reply-To: <20261021121245.3111563-11-lee@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 12:09:33PM +0000, Lee Jones wrote:
> When intel_lpss_has_idma() is true, intel_lpss_probe() registers the
> iDMA64 child device via mfd_add_devices() before registering the host
> controller cell.  If the second mfd_add_devices() call fails, the
> err_remove_ltr error path returns without calling mfd_remove_devices(),
> leaving the iDMA64 child device registered after the parent's
> device-managed resources are freed.
> 
> Call mfd_remove_devices() on the probe error path to clean up any
> previously registered MFD child devices, matching intel_lpss_remove().

Good catch!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
assuming you will add Reported-by: Sashiko...

-- 
With Best Regards,
Andy Shevchenko


