Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794443119;
	b=EZOpqUa0pDyr+M47M55fm5ldjR5cvb+8HgkBIDbk5oc9EnQolZOMpSJUmgrD5HrKRdNd
	 FBkqfisWqykZ2DfHG9YM4LZiCFUjSOFNevL1RvAB7+dpAHkVD6KriMhuz6UFL5GEvw4+s
	 BM8gNq9Tf6QDxbKTtCsStRXUkD/7PvVPdW8sgs84o4Fe5jYmpxpWVWxLz633BlpaMQhq2
	 M4l5LlDOyq3QfCC7eUUO3fmRaPUzW7rByQ641jCiGFB/E59sv4WCt9LrvMsD0pokZ9P05
	 4wDMGgokWZcMwu7f7/J6iWyi/IEobHOZny/E60X6mXpQ49g2C1QjZDwRavD/GFU3Tjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WmDxcQotq3NgeobvzOlqzwVczvRUhsveENxWAqE5LCM=;
	b=SE6hrPwEE1eLBUi2y7VTvrDyiJ84DmiWRTc1V+atm0YH1ppTy+3sx5kQQOgun35Ip+ja
	 DLo6ItC+HaSPvcCrfU00JGENndA84rLpmyzD2tFc7n7LhTThQ0upce1mYbFAjLwUc2ZN7
	 41nkBQYiJ+mWSJQn2A8NUEibkZXDB2NmvLfY7u5V64RNM2XfSy1Z5jWQ32YM/+BVY2mwC
	 gPMww2Jki/ZSSurBQnsL+vAkPFo+2F/vhwt536vNXMoYmMoz2XqCvMCpK/iJD2rgd8afb
	 mirxdaqL2KIkJuqkgAFZnkNb72gsLlqj9emhfmSJ1Hs2NWBwjR9Ct0mCidPXeDe8yWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7ZFMl5j;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A8606A31C
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 00:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7ZFMl5j
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso6358080eec.0
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 16:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794443117; x=1795047917; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmDxcQotq3NgeobvzOlqzwVczvRUhsveENxWAqE5LCM=;
        b=O7ZFMl5j4fvFHcJfMbYgOMmhksN4IobfOdAwZOtB990g+noS0Ut0g7zoZzaHVMLE7f
         0vCXeULktImSFWeXaiCm2oHUOpo4+Uc5ntshXsA+Ce0F6yd56+oR21v8uCiDR/XrTNLM
         uKZx9nm6B2dRZjM3u4r4ICE1Z8i3M6ECEmQYVxxJNqBPRQI1kmUiT412CGO4YAtwMJqg
         g1eOYazRosV8XDC1GqkfRpaUSJ1iWd0UCpLpnlA8b1Zz1JMdDEzV64GJKLdMO8EG01DZ
         Kk1ibH6A9k5E3oyUUmqfJWa44pXUC8oZlwHseZ555Rof0kI+VpAFbPQ9nes0bfIWS4fW
         ofkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794443117; x=1795047917;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmDxcQotq3NgeobvzOlqzwVczvRUhsveENxWAqE5LCM=;
        b=IRnixNgbVqliS8lgP5MOBvVwMN1Fqf+ADbAgsUPmKGfQVOJnGziejuXUPNuMYei5yJ
         AtNmKGojnpAoaXKSqMGS37aGONPaNXV/rIeCOlGKfJFmwTMKb4yYvdj7qg6QIyZ/Se9Y
         3BJmdtoYbMc+q13cQZzTZ+YXTYW0kwbhyqfVa70VF0SBaP6uZZK8J5UI/tcuWiDZpoXo
         UKPesXWmZLpn2SH7u80paxCMJdWM5kwi8s2UVnirQlYGZjYhDUjp5erKjR95TfE1K5Bo
         jHVJawk8FHWjdUh2UvrXanVFvnf16Ny0vN6it8XWAtsw5XUSeY9lQ+QHUeMcekT9Orv+
         KTBw==
X-Forwarded-Encrypted: i=1; AL+hErGpCeIxHdnI68qBNwOsvQEb6PWLqqoNhs4LnLtp8MFlVCFKrMdbc2d47N5EFmcv6CLH0ic=@lists.linux.dev
X-Gm-Message-State: APuU4Z8KgUVfu/ThTnPVtjxFKUFjggeCn9bGGON/DC6EL7+M9CFOrWnQ
	BOkEdP8qqdQlE5s6TlfisMWJ6xzieinwvtHjKzi+J52HVF8Y7EJEgLgh
X-Gm-Gg: AYBFou0FPBchU4ZXIV5HKnODdaqiw+sq98Gruz1dKWkFep5q1veQqRIgEc7qIFI1GWP
	Yydf99yV8VAhQEE6gLBNXxsu90WzdEswG3WIyTZofPABVZiVB3e8ffUD19Iwfw+/gsAVHqUzfHI
	FnLMXVXDbREf4tJKZdVcP8lkkNGfd4X8KZx4GGu6k0aOvAkLaHqmrq0uq9CLjyyffXSCRu6gxc/
	cttqtI87tnBvZUZ0o/l9tKm4CHOV10FlcekTxDEiza04BB6HaWX6e+OdfKP0Y05+QYxmPu7Vhd8
	Bl8p3W7afzfHMJt2UBpEevO9yCH3E3V6b0coxXUn1eLvyRb3/4Cwn81wr+gmV3mWpDQG6OoTXo0
	gh2FXs35iz55owgxFkzDsVLDZZRrwsQIps6s3CLpnIEtDVMkMNfR78mmzjiYMLbXvHY2JeUhfHw
	f78lrP4ASZBmyzM31FDCQ3wQ6JwaxCsVkOuA+hoJxIkX99H/ZUgWHlTkmRHpi9jedzSnBo2E1Vp
	jSNxsfzpmL1MVJL6k/IKsqG867vfP+pxYLiK6P9udz3p8Ly2uZHr98FM9Y74OUgif1gN9j2URyo
	lzHauWCHvUVog1ED4+IuwrIczk4EiBp2R7GrrjBfgIpc9aTJIhWnUMSI7US66eD45R6pJw==
X-Received: by 2002:a05:7301:d807:b0:378:2e89:3958 with SMTP id 5a478bee46e88-3782e893b15mr345363eec.19.1794443117438;
        Wed, 11 Nov 2026 16:25:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm12082193eec.1.2026.11.11.16.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 16:25:15 -0800 (PST)
Date: Wed, 11 Nov 2026 16:25:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jakob Unterwurzacher <jakobunt@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Subject: Re: [PATCH 1/4] Input: rk805-pwrkey - enable the wakeup interrupt
 during system suspend
Message-ID: <avUGEQhSKlko0Fm9@google.com>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
 <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de>
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
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de>

Hi Jakob,

On Thu, Oct 29, 2026 at 11:06:23AM +0100, Jakob Unterwurzacher wrote:
> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
> 
> The driver marks the device as wakeup capable, but never enables the
> power key interrupt as a wakeup interrupt. As a consequence, the PMIC
> interrupt line is masked during system suspend and the power key cannot
> wake up the system, e.g. from suspend-to-ram on RK3588 with an RK806.
> 
> Enable the interrupt as wakeup interrupt in the suspend callback if the
> device may wake up the system, and disable it again on resume.
> 
> This is done in the regular suspend phase on purpose, rather than with
> dev_pm_set_wake_irq(), which arms the wakeup in the noirq phase: there,
> enabling it updates the PMIC's interrupt registers through regmap-irq,
> which fails when the PMIC is connected via SPI:
> 
>   spi_master spi2: Failed to power device: -13
>   rk8xx-spi spi2.0: Failed to sync masks in 7a

Sounds like this needs to be solved in PM core rather than hacked around
in individual driver? Let's CC Tony and Rafael.

> 
> Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC")
> ---
>  drivers/input/misc/rk805-pwrkey.c | 42 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/rk805-pwrkey.c b/drivers/input/misc/rk805-pwrkey.c
> index 76873aa005b41..9b64ec7463c62 100644
> --- a/drivers/input/misc/rk805-pwrkey.c
> +++ b/drivers/input/misc/rk805-pwrkey.c
> @@ -15,6 +15,10 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  
> +struct rk805_pwrkey {
> +	int irq;
> +};
> +
>  static irqreturn_t pwrkey_fall_irq(int irq, void *_pwr)
>  {
>  	struct input_dev *pwr = _pwr;
> @@ -37,10 +41,15 @@ static irqreturn_t pwrkey_rise_irq(int irq, void *_pwr)
>  
>  static int rk805_pwrkey_probe(struct platform_device *pdev)
>  {
> +	struct rk805_pwrkey *priv;
>  	struct input_dev *pwr;
>  	int fall_irq, rise_irq;
>  	int err;
>  
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
>  	pwr = devm_input_allocate_device(&pdev->dev);
>  	if (!pwr) {
>  		dev_err(&pdev->dev, "Can't allocate power button\n");
> @@ -84,16 +93,47 @@ static int rk805_pwrkey_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	platform_set_drvdata(pdev, pwr);
> +	priv->irq = fall_irq;
> +	platform_set_drvdata(pdev, priv);
>  	device_init_wakeup(&pdev->dev, true);
>  
>  	return 0;
>  }
>  
> +/*
> + * Arm the wakeup in the regular suspend phase rather than with
> + * dev_pm_set_wake_irq(), which does it in the noirq phase: enabling the
> + * wakeup updates the PMIC's interrupt registers, which is no longer
> + * possible once the bus to the PMIC (e.g. SPI on RK806) is suspended.
> + */
> +static int rk805_pwrkey_suspend(struct device *dev)
> +{
> +	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(priv->irq);
> +
> +	return 0;
> +}
> +
> +static int rk805_pwrkey_resume(struct device *dev)
> +{
> +	struct rk805_pwrkey *priv = dev_get_drvdata(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(priv->irq);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(rk805_pwrkey_pm_ops, rk805_pwrkey_suspend,
> +				rk805_pwrkey_resume);
> +
>  static struct platform_driver rk805_pwrkey_driver = {
>  	.probe	= rk805_pwrkey_probe,
>  	.driver	= {
>  		.name = "rk805-pwrkey",
> +		.pm = pm_sleep_ptr(&rk805_pwrkey_pm_ops),
>  	},
>  };
>  module_platform_driver(rk805_pwrkey_driver);
> 

Thanks.

-- 
Dmitry
