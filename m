Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D03241F5E6;
	Thu,  3 Sep 2026 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435676; cv=none; b=shcq/fJH1ZBX3AkMlAZ7uXtmitRgaw1uuiQcSD33FtJ62zDHMZg+j2Cc/HaLGeCAN29I4YCqg0/uvYojmcgFNS71SF2ANQPYu1nwAP9MD8aDs3OfxplSjIXFBWJmR/WnBOdXbs7m4bxbxcDspWFpKenf8uI2u5KL+kyItOnslrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435676; c=relaxed/simple;
	bh=JSuJrngTC4olOG03288V/nmLwz2wwieT77d/P4LnfNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1iCleGE1GLQjU8/lQ/4U6BYbSN7o+AtVK2UMRCRPC+bgaGThdCFv6gDwLanc51gGhrRAHzSyG1NkSEoNJSMVDLG5FweWtNfG7uidwlirfX+SIyQJT95LKqjybNFeEnmEip4hLjgYZ+mIiCeeTS8iCsnsB1BZu6v3ztOS76lhGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eG3y6EKC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eG3y6EKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788435666; x=1819971666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JSuJrngTC4olOG03288V/nmLwz2wwieT77d/P4LnfNw=;
  b=eG3y6EKCLPXilQMr5ClufImzbMiwhJZ/GifwKxi4WoK4t4Y7gag0CA7Z
   D5rxP4kh4UqL+qdoty0G2d9I8r5OEPpVdcbDj+C3c1aBb4ShmX5Mq6Y15
   2Ls+A5xk9Nkc5PcsZNrVDO3RwnI0KniXqOWy3TqcqvnnbOTW7+9SzYGHo
   RfBxJweFDhnJzFM9GFD7XyGC3tWPUvUSSdVw0vBtR50zMHihzsvQ5WQ09
   Ozi3BLo3L1oSCuCK4Wvqkfr5aLt+qqrlWLFCBsleRWZk4mS9zXMtQQ5ya
   HqLNEKBso2vQ4UmPsF/BfkYXiYOiddozOX2Zr80SNua5teRYbcz8YOr/9
   g==;
X-CSE-ConnectionGUID: L3O4a2LKS7yj/Id3y7g67A==
X-CSE-MsgGUID: Z6J+0FauRNm/1mEFehy/Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88762629"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="88762629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:41:03 -0700
X-CSE-ConnectionGUID: q2c9BakcQlmPlwKURwZPPg==
X-CSE-MsgGUID: IwhtTsApS+ukKqW3wbyOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="265355126"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:40:57 -0700
Date: Thu, 3 Sep 2026 14:40:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: zl020895 <zl020895@163.com>
Cc: longzhao <longzhao@ambarella.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc <soc@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-gpio <linux-gpio@vger.kernel.org>,
	linux-serial <linux-serial@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>,
	mfd <mfd@lists.linux.dev>
Subject: Re: Re: [PATCH v5 10/12] serial: 8250: add Ambarella UART driver
Message-ID: <aplcxoINt0YAjvxL@ashevche-desk.local>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-10-7bbb12f0360f@ambarella.com>
 <aoRpc2RK2_X3CdAi@ashevche-desk.local>
 <162c0385.2c076.1a018b82fa7.Coremail.zl020895@163.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162c0385.2c076.1a018b82fa7.Coremail.zl020895@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 19, 2026 at 02:31:59PM +0800, zl020895 wrote:
> 
> Thanks for the review.

> This is Ambarella 8250-compatible IP, not Synopsys DesignWare. We
> first tried 8250_dw after Linus asked us to move to the 8250 library;
> you then told us not to touch 8250_dw and to use 8250_ambarella
> instead. That is what this patch is.
> Background:
> https://lore.kernel.org/r/CAD++jLm6HzEU1TM-c=Vtjv3FJEBecVP7TyxSgq_Q0zF-YwT6NA@mail.gmail.com/
> https://lore.kernel.org/linux-serial/an8KvvHWX0naH3Xw@ashevche-desk.local/
> https://lore.kernel.org/linux-serial/7E774305-3920-4BB7-BA46-E0772D6BED84@ambarella.com/
> I will also switch to uart_read_port_properties() and trim the
> 8250_dw-derived boilerplate.

Thanks for the register descriptions, it was helpful. After going through them
it seems the v3 as you made it is good enough (sorry for going back and forth).
What it needs is better commit message explaining that while it's not a Synopsys
DW IP, it was made to be quite compatible with that (on register level) and hence
no new driver is required, just a small quirk.

-- 
With Best Regards,
Andy Shevchenko


