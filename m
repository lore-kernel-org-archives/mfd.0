Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A03AFCE2
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197267; cv=none; b=Afbp1INxbw2lB8Z8n1H+ebjC0NGPjnjHMC0z15OlGfgswUDfviYf3hkzhPMptfmz36SYsxAXdj25Nj2YDJ086EW7oKYSRBAuq60iwpsc5H86Khca8jEcMZfslU1eSPYmvPz4gv2pCLx4eiLOhcsWhCg2nFzzfaV7Rsdpswvrhck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197267; c=relaxed/simple;
	bh=XqpqZlTInduldJGK/k9p45wY9O0vx4/ZLKo6TIPnC6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov8OYpFfWB8updfiHgerl+QmfOoLHdAs0+tpx6a6HQulwXGAdjC4DrjI798CD8aqe9J0LpdCe8sm4sdOqoNQ3bCH+xEt84QzrrYITMrfU0GdaOcR6miBeB3PjFwuClem1gihdZ3QG6zOA5unHnOPqN8iFXv4p6uRvS9FlV37Bzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/YepFpg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/YepFpg"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so843330a91.0
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 14:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790197263; x=1790802063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Bd6czkO45GCnh+x0rZQde+5ow2qqkq1hEyPhw5kvHI=;
        b=f/YepFpgG6PW24ExNw4Im42WdTwya53CYt2ZqcZC7hHYpxjgB4NYrqnRDlllo7E//5
         EB1zYnIja3d0UQhxj5A2ThIkAsUvNuziYPJXvSkGvb6387hnQZQZ7t1RIPvwMoKXptIs
         XrtCKnoGQKbFao5uS7g2QfeoiFvuFFci7+ZqWE+JFwMYW2VbjBa92TCvGYMmj8bV1G+a
         EoZR5oAs8nJqJWuLz24BPDX6d/zWvymt+3LRk1xAfzpPafdDNWkD2a9wfJ4nMZVYc5In
         B0w6lKmGFdtY1OFpfei2lCb8UWhr6lezcRkjXUPsiniv06/LUHk8aTyNPHRHachqjVJJ
         vTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197263; x=1790802063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Bd6czkO45GCnh+x0rZQde+5ow2qqkq1hEyPhw5kvHI=;
        b=wAzk/gKqWOKNwgKlXwxj/v3VxvApDxGsrp3ef4ED6brElEJ8pW842IQjs9MOV51ZVY
         Xb2uLb1eY+E+iKSrxADX9f95DfkZsuGFiKg8JziRKFnZAz7rEXJhVo/0ftEya1X5pmpl
         0di1OzthY48EHcO9n8kRbz/zfEWDkTsvbVz/8N7v8+xyk5sGgRsGgdfjUPwLgX+iEe3g
         2OsUsm5ocu78exUts5VfY+QRhtf5bvq1RyH4vSeEL0/9eDtoiR69rPdKll3U3HkFNndw
         WNA88mtTSYRehdxS6zlgl+3L5V6bJ64kW27dENBWFyxqfS1qD0RMpkHM7aMSkGk8vD/r
         /OLA==
X-Forwarded-Encrypted: i=1; AKwUvBwGfJR22kUldBqCVL2vKRUr7YoVI8jXH9cgh4PWUDebYbpl1e3cmaLW5j+36EdxGJO8zTw=@lists.linux.dev
X-Gm-Message-State: AFuF++l6YDUW4Wn1jrRwcnMngFHSqq1er7+S88pv+obWpQIxOIglhe4f
	GtyxYSskCd3BllYILuhYC08JlsxMXNy9hlycP1uhNd+b0r0sjcNvYoQg
X-Gm-Gg: AYBFou1MQG+R71bxemiCctHzbdqT2iow5VZGsVdix/SIVFaJ1TTV/bu3FB4m5Okt8pb
	4/qWAVp+Uze5Ik+m22v2CTLZH/6w4PXL/IJfDJaHB+KD4i+g/9cOwuV/aZjwADwqF9KxOTQbI3S
	eZoNRelshxWwHk9X3WvFbK2aohX9Wak4VMNwVsxRFpz/IOPs7r+T9Sm0Tg7aE+/+QP6Btpz36DI
	CLLxYPfus1QBIB/yKZ0iBuUStrlpjPEFoxCGzomU6VDE18ulaI20wd77vMe/pbngvUcxIU3LvHH
	xaeCxjT/FMHd7sNo58jnI5RRwiExr/Jz7sbbJ7wXylSEKt4v9I3JvMbIFwPb6HRuaSWxevG1taq
	eH49owklp5QxapT9MhXDkLQsimOYFiQeRUph6yKCv40aqzWzwDelg54/K4Sbh7ovfUAS6Wso8Mj
	wa2ugcNrqp3S6PZNpB4MEIo9h7M1EkUozFibfKhoMv429263vqpSp331J9rRIsPsjvQRR+dE13k
	ZgYQS9UeB+F
X-Received: by 2002:a17:90a:d406:b0:39e:6a81:c922 with SMTP id 98e67ed59e1d1-3a09872c528mr260420a91.21.1790197263197;
        Wed, 23 Sep 2026 14:01:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097344841sm850282a91.10.2026.09.23.14.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:01:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Sep 2026 14:01:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 3/4] watchdog: da9062: reset board on watchdog timeout
Message-ID: <146c3502-3205-43ce-9d1c-c58b936d160e@roeck-us.net>
References: <20260923111719.2032012-1-primoz.fiser@norik.com>
 <20260923111719.2032012-4-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923111719.2032012-4-primoz.fiser@norik.com>

On Wed, Sep 23, 2026 at 01:17:18PM +0200, Primoz Fiser wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Implement a method to change watchdog timeout configuration based on DT
> binding ("dlg,wdt-sd"). There is a possibility to change the behaviour
> of watchdog reset. Setting WATCHDOG_SD bit enables SHUTDOWN mode, and
> clearing it enables POWERDOWN mode on watchdog timeout.
> 
> If no DT binding is specified the WATCHDOG_SD bit stays in default
> configuration, not breaking behaviour of devices which might depend on
> default fuse configuration.
> 
> Note: This patch requires that the config register CONFIG_I is
> configured as writable in the da9061/2 multi function device.
> 

Please reword to something like:

Implement a method to change watchdog timeout configuration based on the
"dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog timeout.

If no devicetree property is specified, the WATCHDOG_SD bit stays in default
configuration, not breaking behaviour of devices which might depend on
default fuse configuration.

Specifically, "There is a possibility ..." should not be part of the
description at all, and "Note:" should not be part of the description
and be moved below "---".

> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  drivers/watchdog/da9062_wdt.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
> index 3d7bf2f351db..7ceef8cd7425 100644
> --- a/drivers/watchdog/da9062_wdt.c
> +++ b/drivers/watchdog/da9062_wdt.c
> @@ -204,8 +204,11 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	unsigned int timeout;
> +	unsigned int mask;
>  	struct da9062 *chip;
>  	struct da9062_watchdog *wdt;
> +	int ret;
> +	u32 val;
>  
>  	chip = dev_get_drvdata(dev->parent);
>  	if (!chip)
> @@ -245,6 +248,30 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
>  	}
>  
> +	/*
> +	 * Configure what happens on watchdog timeout. Can be specified with
> +	 * "dlg,wdt-sd" dt-binding (0 -> POWERDOWN, 1 -> SHUTDOWN).
> +	 * If "dlg,wdt-sd" dt-binding is NOT set use the default.

This is not really what he code below does.
It sets the mode to shutdown if val is != 0, not if it is 1.

> +	 */
> +	ret = device_property_read_u32(dev, "dlg,wdt-sd", &val);
> +	if (!ret) {
> +		if (val)
> +			/* Use da9062's SHUTDOWN mode */
> +			mask = DA9062AA_WATCHDOG_SD_MASK;
> +		else
> +			/* Use da9062's POWERDOWN mode. */
> +			mask = 0x0;
> +
> +		ret = regmap_update_bits(wdt->hw->regmap,
> +						DA9062AA_CONFIG_I,
> +						DA9062AA_WATCHDOG_SD_MASK,
> +						mask);

CHECK: Alignment should match open parenthesis
#157: FILE: drivers/watchdog/da9062_wdt.c:266:
+               ret = regmap_update_bits(wdt->hw->regmap,
+                                               DA9062AA_CONFIG_I,

Also, this does not require an additional variable.

		ret = regmap_update_bits(wdt->hw->regmap,
					 DA9062AA_CONFIG_I,
					 DA9062AA_WATCHDOG_SD_MASK,
					 val ? DA9062AA_WATCHDOG_SD_MASK : 0);

> +
> +		if (ret)
> +			dev_err(dev, "failed to set wdt reset mode: %d\n",
> +				ret);

			return dev_err_probe(dev, ret,
					     "failed to set wdt reset mode\n");

Thanks,
Guenter
