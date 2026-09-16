Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837B44AF9F3
	for <mfd@lists.linux.dev>; Wed, 16 Sep 2026 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552274; cv=none; b=kazs43twbRgbEa+vz2cgJWDZAYw/nD11iaj/mL377Myw/F9h5TgGV8A9/V28HBqPX2Ug7+TXhXvI+aPZ3kaED6CTpAgj+W5/0+o35+na//GdeKuaSO/mr61Jhnv8YQWAiKJl4aly53PhmZUn6032PJLO21a4hSKLlLiW+PRQGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552274; c=relaxed/simple;
	bh=UIwWPNKRQ8FW7Bu3jbEPy9yWyv1Y+CRFZBuPobR95d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaSdzcr4fk+k0E78y/Voa6mr0sT9cY5iP6Ji0go5yuqwzquZJmwZ0+cyCopfffGw2mz/PY0J7FDSJIYUYeFMG3F/kHphsNl5HH9E+wHylO9ebHV5/sMQ9TKIhC8r3/6Zyur9fW7WauxAsqdtfUWlxnX3HDTgJW4yDeeH6TFD00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpN3keqc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpN3keqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789552271; x=1821088271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UIwWPNKRQ8FW7Bu3jbEPy9yWyv1Y+CRFZBuPobR95d0=;
  b=lpN3keqc2doZES6wZDzdAlMJKCSI696tBsXtGmYCb7NSkavDArNWFw2a
   m7CvquFXHraOjMB2NvMLteYf6JiPd2AnCKx91SXFaE0UYecnPsCpCfnIP
   ri9mZ8a4qJhKMTdkFK9gtaOg0CX3sKm1VroE/lNHege178ppONxVKEkJ+
   TZWTgf50fvbl+KJMYl481C0/C5ACaEG7hpivrf7FWh4RCh047rS/xKeBS
   TkmCTe1ighf3WnpASLtpoX4z4l7r6Ki9QsuJWho5hN1oQYZL6lQ+ovwB2
   GzWsqDvMxBiKnLsrenOP9QgtC/0RgvipadGeAiH7AbkaQRFNONCF2t3Gu
   Q==;
X-CSE-ConnectionGUID: 5Uyr0kjYRKeF0GmwlAoxmw==
X-CSE-MsgGUID: 9ciaoX3GRe2U+N7i7qaSOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101270146"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101270146"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:51:06 -0700
X-CSE-ConnectionGUID: KfvqFqviTauBpXirtJ5MXw==
X-CSE-MsgGUID: RK56W2AkRI2hfojlaoS2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267080866"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:51:01 -0700
Date: Wed, 16 Sep 2026 12:50:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, mfd@lists.linux.dev,
	Roman Vivchar <rva333@protonmail.com>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>
Subject: Re: [PATCH 0/3] iio: adc: add mt6397 PMIC AUXADC support
Message-ID: <aqpmgliQW7FW53o5@ashevche-desk.local>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 15, 2026 at 11:15:25PM -0500, Ryan Brue wrote:
> The MediaTek mt6397 PMIC has a 10-bit AUXADC that nothing in-tree can
> reach. On boards built around it that ADC is the only path to the battery:
> the SoC's AUXADC is wired to board thermistors, and the charger ICs these
> boards use have no ADC at all, so without it there is no pack voltage and
> no state of charge.

This doesn't explain why a brand new driver? Perhaps we have existing code that
may be updated to support this device?

-- 
With Best Regards,
Andy Shevchenko


