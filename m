Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386758;
	b=mJfoQWpEr3K3hgtbU1jvEohi4G3iH9bri+MF90H1LQDqDHT7QkuxzKlmEkbMZm0ESnqV
	 jvcHiie3m1AX1TR2aFjG0zDfNAz5S5M+5OJnZyHp50+D71MBRXhZHqZ+LJm7TOqnEclth
	 3rgNUoZIjp0U4E19KXe68yP3y9AGADHCxBkcX/+7XuwnkWffO4kKLStAfUR25M4FV/UXJ
	 jtTU86LNA8AMdnLmqWT9uV2NHYBNl11VMaAFNfjFh7KFFeiSuxMhqpOxzuCWDi+f4XW1/
	 2HkMeBo3rhL2h6wx/em8R0duFQXrFzmoMxzJfOXYfqP9+/rF+dA/xi3cGWJCtGHhldQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=kncqX4lw1YZwjRHTnWDSvhtRyCgunphnrbNs5+1f+kU=;
	b=oanLqvvz5wQW0EJPHRGFhbSCSwJF/goEdT7+99WXJxIqzGqiEYxhGmlxfBn530izZAtf
	 KX8A2rKVyZZYuaH9J3HteumZGCKLXu4vjAACEQqYqINwTbojjWz7qvWV2RSsjZo9H22AT
	 JxDLOEyVuElc5M5+nci0A7ttBuLRHRyzkvIdjfa8sqa1s2ZxJ9S+Rn7y+ovX5Xvbon6Th
	 OwxcYW9ga9T7DJiQXM/rQf/q6FiM5eaPrMlZIIssF8RsOR/DA82iYQCohV8CJ40G234eR
	 d3+8ygiddeoyO0KBnuodc4JoDEUDdw8p2T1dFv/AF4xO2fPjqdV2ULCoKZpYGfzWHYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=APXoZQdi;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4059C606A320
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 08:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4059C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=APXoZQdi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794386758; x=1825922758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WNu/MWKjEWQu9WGprrc9CixlEoX3UeLS/7xFqiNwO6Q=;
  b=APXoZQdicxD+Y1huqUvh58RugUL88W7af38kAg5rFALSscIQ1p0HZdbH
   vqwRVuBat3sjyU2RV60nMGFLp5lXIADtdY65IlY/keCrfoJn11UawRo9b
   xxIgWQEiI3ulHZcG+zefZ1hamVoJ9egPqijCWMnwZki43QT8p7ZF2kU84
   CtdhT0Sd087MKmAQweEFeEJBHOZYz6ReWg3PeMyJy2jh8ev5KPnCAfvAg
   fEBvkjl6zq60tzEP5FNVLNCykcc9X0QuVBLD2wfXdgn1Sdk9WuVZ/2br+
   3iRWBf5zy74JobsU7vLD3RyjgOwrBaAcKX8pqImoDT0rNBM2/wKPkG23m
   A==;
X-CSE-ConnectionGUID: TiomvjcWQL60kLYntnMDyw==
X-CSE-MsgGUID: RyZ0qcDPS0GwlYn4sd+WNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3253974"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3253974"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 00:45:57 -0800
X-CSE-ConnectionGUID: bUxqKsr9T7u440+wBy8DEQ==
X-CSE-MsgGUID: jZDWUL46SBCKWU1u1b0onA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8702945"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.142])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 00:45:50 -0800
Date: Wed, 11 Nov 2026 10:45:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id
 arrays
Message-ID: <avQrO4etMgpOhvwF@ashevche-desk.local>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 10, 2026 at 10:54:35PM +0100, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> acpi_device_id that replaces .driver_data by an anonymous union.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.

I don't know who is the first, you, guys, collaborate together and come up with
a solution, but I have reviewed already this
https://lore.kernel.org/lkml/20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk/

-- 
With Best Regards,
Andy Shevchenko


