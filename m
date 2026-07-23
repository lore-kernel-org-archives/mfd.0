Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37792384CD8
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 04:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784780953; cv=none; b=Irr1smCZTgr/kCuQwkNZvtuZFnYXeKyRm/sMSXGEMZQsSD7klI32I4vz/nJHpv7blsQDVJkphSrNUyF1SVK7Ub7XkGJmlbA9Q8DhlMCNwKgDSl3S8+ScJPfDZqNOdBe3ae2aRXzMYNEXg8AvGLEsqSq1adSDPq3OC6HFU6knOS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784780953; c=relaxed/simple;
	bh=ZatVT0U1yCXOrhRsxoQTAwBUf9NEIaFUpxntGK4qsWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfbXIjp7jc5D1Os2oWkNqVsuyhdkGP5aI857JwJdSQ5QH7QUndsbyEKJOQ6sX4ezPqRKV/ElYDNb4EZprziosAxMGo0/mujdz8gjymm0Vb6HB2Eyzef4Yh9FME2+7Bn0abnCo/Nk6gpzGNMsUvP7gBPixbz5LAgNcHWR0N+v0ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aj0UK/Yx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aj0UK/Yx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784780940; x=1816316940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZatVT0U1yCXOrhRsxoQTAwBUf9NEIaFUpxntGK4qsWs=;
  b=aj0UK/YxYmFNvZnvmqLiUGwzxtW6QKCBLUIhhp/pwUTdHltg9/nVUHDt
   30xyryffWej5Mw7fojmUzz0kvW7CLNUdGHb6nUeZ7cEiibmZj5Dt0rJh5
   MYWaKsd3JfrqMCDQTyOsJOUaXsHc6ZN0c0il0WDlB4OSI7iDF2970K58B
   evA0keIpOUkYxmXUIcfEx/8H61uH1+3ZR6qqwxD+OfX+gv7nPXo9rP+Np
   E+9sL/rWS2WC3pCJUW7CwCLmvszctShh2wRYF/3VQ7Np3DfyBBFZPhWoQ
   ZJBw46nHm7uXMsFjhr3tX7U1RIY3tXUolTA/wXQXJaFL1qgNzDaiNrk6n
   g==;
X-CSE-ConnectionGUID: uTE0o2KgSDOLQxlA+Zdjfw==
X-CSE-MsgGUID: KyUl77ssSJyF9mp0SmYabg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84404262"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="84404262"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 21:28:56 -0700
X-CSE-ConnectionGUID: w5mTDfR1RLqLcJ2VHZtE1w==
X-CSE-MsgGUID: EV1QK4HtQcifRv9c/3V1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="262616913"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2026 21:28:54 -0700
Date: Thu, 23 Jul 2026 12:28:52 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>
Cc: Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Moritz Fischer <mdf@kernel.org>, Lee Jones <lee@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	linux-fpga@vger.kernel.org, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/1] fpga: m10bmc-sec: add image_load sysfs for
 N3000/D5005
Message-ID: <amGYhCKpesGH/yLB@yilunxu-OptiPlex-7050>
References: <20260715073854.26117-1-ionut.nechita@windriver.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715073854.26117-1-ionut.nechita@windriver.com>

On Wed, Jul 15, 2026 at 10:38:53AM +0300, Ionut Nechita (Wind River) wrote:
> From: Ionut Nechita <ionut.nechita@windriver.com>
> 
> The mainline Intel MAX10 BMC secure-update driver can stage and flash a
> new image through the firmware-upload ABI, but it has no way to trigger a
> reload of an image that is already resident in FLASH or EEPROM. OPAE

The concern is, what's the impact to the system and the bmc driver.

And this is the FPGA re-programing, I don't want specific FPGA
re-programing interfaces per device. Let's figure out a meaningful
set of interfaces and a graceful flow for FPGA re-programing.
