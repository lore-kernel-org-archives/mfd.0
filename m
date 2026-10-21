Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591170;
	b=Wb7HJK/DUZjs2+7IQO0FhCWxJTj/o3OEBQaDEB95cWUvQQ6cwQNY722cgPnb9KYnxMsG
	 UDyy/vab0DqA8Tb269oIqml0uit7F6+9gE4xTIwQn5uw4G8ng5oaBKVZ6YVrvDcV8Gpem
	 sRx49Kk8IfcYnrXppMTiKFBYCWQXAesvX04p06DGW/Wm9OeU40x4a1LRDVcCvk0praW3U
	 sZU6SLcyq3Qd4Ry9QxwXmomr7eCsnjIo8aqSyse+U6ExyGhol/s/FM6P9mS+49j/GJqIa
	 j1GehCGMBazDyg0+aiLRqw/a1utgRhnCVDEZrKl1vs7rw71APqM90TnpVVo3mi3tn4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591170;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=vSQoDagxyihYP1vKF332R0mDWULHguDgjqStaVIqJ2A=;
	b=Z30MVKXb/ItZhB/YdbrdZhg1ZMFdX64Pq02e7pFX77bDUvAJ+taiAL6BTCijeB2oby9a
	 FdwLqnstv+IdmVRH0CKHNqOhuWhmraIUSXfHvxL2zrwVcN1/tYXfy+Ug2+pHSVlxGghFY
	 SmzceQQI72aqpmWIcjCXUwiZLzh3IdCDYfV20GqjJbQQbEVA8p4+wdzsLa7PoEGjEvJTa
	 dcDfsPS6/iJVOMckOlG130x0pumgm6A4PCjlqNWY3dh9IZE7pVD9wAuOgfUbV87sOVWo/
	 I8bdEb/KsUhKGY03MR947tnTm0GVZqejBhYPAmWF3Kjt0rhM28orFQr7ZYeXzSqIxxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jlaWwBHT;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8983606A320
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 13:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8983606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jlaWwBHT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792591170; x=1824127170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cSJg9Z7Z5EWOwDOoxGRpkWaMzNjsyTtcg8uwY5IxO9Q=;
  b=jlaWwBHTrBbBF16DdnZ/NfHf2+jAziWQr4/5u3asI/AW5RWKSdAJdOmi
   zFHIqWYN7+F5UyYq3mAW/CPckXAts9a6v2Ju3CBV6c12D+EV1+dMxfVOX
   KolxDyzQy345TPyfWOqqjAQuUZhvkb4fG6pK9daanK0qiemaENmAMhQx1
   QhbLrT2WGRTMf6AtHoJ66c9USN4PqvsOCHQLB7fLmv5UbWk9rS9ddhjV5
   YYJTKhPl92dGGGHw6XNDkBwLTr2RHxZpXPgMW0EsvEO6zPUz0YBaiocmd
   bRCYu4C2HNZ0WztVUIv2J84CBJODAnJy1I8f0xYKVNO4sRdPot9QR1s47
   A==;
X-CSE-ConnectionGUID: wb/oOyjTRKefbRqRJNYi5Q==
X-CSE-MsgGUID: ZNaOu1RcQsSeNV/fP/pI3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1213467"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1213467"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:59:30 -0700
X-CSE-ConnectionGUID: ciTB+8E+R0qbpDgaesEwxQ==
X-CSE-MsgGUID: HsysuqszQaWK8Bv8PtdAXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4897123"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 06:59:27 -0700
Date: Wed, 21 Oct 2026 16:59:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Corey Minyard <corey@minyard.net>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 03/28] mfd: ls2kbmc: Cancel reset work on teardown via
 devm_work_autocancel()
Message-ID: <atjFPeEWbPT6SnUr@ashevche-desk.local>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-3-lee@kernel.org>
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
In-Reply-To: <20261021121245.3111563-3-lee@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 21, 2026 at 12:09:25PM +0000, Lee Jones wrote:
> ls2k_bmc_init() initialises bmc_reset_work with INIT_WORK() and
> immediately requests the PCIe and GPIO interrupts via devm_request_irq().
> If an interrupt fires and schedules bmc_reset_work before a subsequent
> step in ls2k_bmc_probe() fails, or when the device is unbound, devres
> frees ddata whilst bmc_reset_work remains queued, leading to a
> use-after-free in ls2k_bmc_events_fn().
> 
> Initialise bmc_reset_work with devm_work_autocancel() before requesting
> the interrupts so that devres cancels any pending work after the
> interrupts are freed and before ddata is released.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
assuming you will add Reported-by: Sashiko...

-- 
With Best Regards,
Andy Shevchenko


