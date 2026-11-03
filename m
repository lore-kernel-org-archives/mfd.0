Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701707;
	b=M11leiWQrpcKP4nHXaAfwWWIs53928wqR0lZJU8NvdSCTh4F/d1Ewqqy84N6GYQitujg
	 SFct1LhfhOzjM2Um7+wzcFQbMXiNUCoF3NYq2up8zkQuf//335Gy52m/l31lmX5Tt4DD5
	 hXXt4Mai8TuEKzRv8gg2tLt5kQrpA0umTLnHm+XUFALeFrOic39syWM4nBLvf5UC9DnPT
	 194uPSNZjtEUiy2jcPr9kzv5XBRTcEbWx/qOQuGMkV6pIrddBmUBY6V577DVrmfYktjYS
	 mngksdcAKzvlzZ+EVfd8WhVzJn/yaCydUn+J6QeLdX1WJbvKizFYwPyX2vGk83ppOHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701707;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=brI27/R3evN0ktEK8A0I0W9UNIMPS/xp4y6+g+aCaBo=;
	b=3kXpODwzADZ9dNfhqUUo6qTunfEbi42D08GkxVWqtGnFJBzqktUtblQpUCMHzUzyX8fB
	 xs8iLQgXY6Lb5jM4Zw6s29YrOOXy2A9GPsTDORJ0qJ6ITL+reOj78ZVLTS9zN6sIRQLAB
	 TtjaOSQqJAWuqwQl5omh4hnIdJdEynPOT1TOEcVwjh60aoMFyLUa1ckATlxYhFl5PDoTE
	 SySOx//gLQGpYZzjkLGgxCmSJWucvIPPNMKkuEsc8ZxBzTt2qpOpx1So7nzIIUS06NnSi
	 iL9Mj+4RXpdvi5AUDhidtWr+9hP3Hr7reGqm/xAW/28xKvajtte8E3rPsrK1pMFPkfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I+7E1g4J;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E44606FAEE
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 10:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E44606FAEE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I+7E1g4J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793701707; x=1825237707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/azmaKzOQApHWRANZvyKMDE5eR/p+FiNIyfzDv8GWBc=;
  b=I+7E1g4JHJecLkpIciu5oeD36dnuzruzJCqWeQVAwUzwY0RTZB6go0fJ
   ewYkGD2V03kW5UvP57iXn6MyQ9GKKrt0O7tteHHRgOdW+R5hoOnLaUh/M
   AWb1o1Mg5tKQh2BlQ9GVZFTgzCADCzV+kg5fV201ZKYQfeZU5nAjDCWhK
   85nEEUON+8s7lWbW2+/WxQoeovXatOckRV/UT3r5I/3pDcQE06qmxyqhe
   /41C9gXhqWXZMfyvkWOzh5uQcXy1R8E9q6VktKDjTtCQrX2gtzOYZeJ88
   1NFCm9Q7NNQuxWyYjjVSzwS09qPBO6BDtHp//gHhixfNy/ukFQ7atP/PL
   w==;
X-CSE-ConnectionGUID: reDfNyq0SmGfN451iQbGHA==
X-CSE-MsgGUID: xqdLp+zQRfKXnTzc8pPdiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2310416"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2310416"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:28:26 -0800
X-CSE-ConnectionGUID: 1bIC71+GRU+9xXUc9Jx1pA==
X-CSE-MsgGUID: V2qjLPU4SH2zD8mLISaVAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6387021"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:28:22 -0800
Date: Tue, 3 Nov 2026 12:28:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Thomas Richard <thomas.richard@bootlin.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-crypto@vger.kernel.org
Subject: Re: [PATCH] mfd: Use named initializers for acpi_device_id
Message-ID: <aum3RLDLDa1gllge@ashevche-desk.local>
References: <20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk>
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
In-Reply-To: <20261102-acpi-mfd-v1-1-d61029971be8@thegoodpenguin.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 02, 2026 at 12:25:14PM +0000, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.

Can you split Intel LPSS to a separate patch? It will help reviewing both parts.

-- 
With Best Regards,
Andy Shevchenko


