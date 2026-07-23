Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3F9417BD7
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784806148; cv=none; b=TJr5JnxniJe/jM+DAr3Dx9IC3vE5/WslVDLxNjZX4orZR1zx1C6D+gggBoG/wRLFKTA2YJM+JxQgzrhXIpymr/iN6LPMpY/lOYDA8PwTRICZ5atUNtswYeFtSLDcMsxhcvtKG3OYO+XIzUtv6Yln7wqDgpcZFZtKqYY53lK0VMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784806148; c=relaxed/simple;
	bh=ZPLnXdzbN8Bq7e0ewSLV80RFyl13425l9mxaI+qYCU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiuzUHu/YxZZsUh468UCKoOCAjCekedItZGZUZbT8bKK7tDp8kn5739WVhyl7gWafh9IxtrHC+dplBdMCGak0E5RnNb4iG1XNpZGsLEmLwPdbMscxOl8cbNDzGKnlYEdt5ifdJxOa3LTBTV6cIELFr5ZlGQPYqJiGPnXkxhH2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlIDb9kO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlIDb9kO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4031F000E9;
	Thu, 23 Jul 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784806147;
	bh=FrKFWj/lwxsdh+/CphITXID6rDqUBOREnv2NqN7Y++I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dlIDb9kOBaj47EFiehX3lrpUzc8AwNPDd02iKqadQynEb5/4X1acvKeTWzuafLgSW
	 w719nOcAVXZscO5m0jGOTvuzxIgZEyHb4NfYMmiGvejT9pe756CQZZk5m1xdRCQkM8
	 qtGTQ69cv/spmVLLuYJI84YcXPMUi4CjT1MJ7ycl0JYnbTzL1GkvZCK0lkef6mvQ+T
	 32WqC5KG/hiwssmxgGcyAN1o6Iny1WU9o8rsaeRJ2bmRUC2cNgqNohzqjBhtKgpYkE
	 V3x/TaO8/td9yHi12/o2lLA67PL4l/KL8Py/tLoBiAuVbIfXNAQMVj5BP16bLJqAzm
	 BO2DUssHRBSig==
Date: Thu, 23 Jul 2026 12:29:03 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-bot@kernel.org
Cc: Miao Wang <shankerwangmiao@gmail.com>, mfd@lists.linux.dev
Subject: Re: [PATCH RFC v3 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Message-ID: <20260723112903.GB3363113@google.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-7-ef718636e78e@gmail.com>
 <20260709174055.D25E71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709174055.D25E71F00A3A@smtp.kernel.org>

On Thu, 09 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Unprotected access to `gpio_chip` without a NULL check leads to a potential NULL pointer dereference or use-after-free.
> - [Medium] The ACPI memory resource search for the GPIO controller only checks the first memory descriptor, ignoring any subsequent ones.

Looks like there are a few of these to consider.

I'm unmarking this for review for now.

> Pre-existing issues:
> - [High] The shared interrupt handler unconditionally returns IRQ_HANDLED without checking the hardware status, violating shared IRQ semantics.
> --
> 
> --- Patch [7]: [PATCH RFC v3 7/7] mfd: ls2kbmc: Capture the reset event of BMC through GPIO ---
> commit a2c13d408a04d53aa90ec63a2b31ea6450fb493e
> Author: Miao Wang <shankerwangmiao@gmail.com>
> 
> mfd: ls2kbmc: Capture the reset event of BMC through GPIO
>     
> This patch modifies the driver to find its reset GPIO via ACPI or a fallback 
> software node, rather than directly accessing the GPIO registers.
> 
> > diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> > index 1466b314fc4e5..5a2644ff07fee 100644
> > --- a/drivers/mfd/ls2k-bmc-core.c
> > +++ b/drivers/mfd/ls2k-bmc-core.c
> 
> [ ... ]
> 
> > +static int ls2k_bmc_gpiochip_find(struct gpio_chip *gc, const void *data)
> > +{
> > +	struct acpi_device *adev;
> > +	struct list_head resource_list;
> > +	struct resource_entry *rentry;
> > +	struct fwnode_handle *fwnode = gpio_chip_get_fwnode(gc);
> > +	phys_addr_t start_addr = (phys_addr_t) data;
> > +	int ret, found = 0;
> > +
> > +	if (!is_acpi_node(fwnode))
> > +		goto out;
> > +
> > +	adev = to_acpi_device_node(fwnode);
> > +	if (!adev)
> > +		goto out;
> > +
> > +	INIT_LIST_HEAD(&resource_list);
> > +
> > +	ret = acpi_dev_get_memory_resources(adev, &resource_list);
> > +	if (ret < 0)
> > +		goto out;
> > +	rentry = list_first_entry_or_null(&resource_list, struct resource_entry, node);
> > +	if (!rentry)
> > +		goto free_resource_list;
> > +	if (rentry->res->start == start_addr)
> > +		found = 1;
> 
> [Severity: Medium]
> Will this correctly identify the GPIO controller if the register base is
> defined as the second or later memory resource in the ACPI DSDT?
> 
> The list of memory resources is queried, but only the first element is
> evaluated with list_first_entry_or_null() instead of iterating through the
> entire list with list_for_each_entry().
> 
> > +
> > +free_resource_list:
> > +	acpi_dev_free_resource_list(&resource_list);
> > +out:
> > +	return found;
> > +}
> > +
> > +static struct gpio_desc *ls2k_bmc_find_gpio(struct ls2k_bmc_ddata *ddata)
> > +{
> 
> [ ... ]
> 
> > +	gc = gpio_device_get_chip(gdev);
> > +
> > +	ls2k_bmc_swnode_properties[0] = PROPERTY_ENTRY_GPIO("gpio",
> > +		gpio_chip_get_fwnode(gc), LS2K_BMC_RESET_GPIO, GPIO_ACTIVE_HIGH);
> 
> [Severity: High]
> Does this code risk a NULL pointer dereference?
> 
> gpio_device_get_chip() can return NULL if the underlying GPIO controller is
> concurrently unregistered.
> 
> Passing this potentially NULL gc pointer to gpio_chip_get_fwnode() results in
> an immediate unconditional dereference of chip->fwnode inside that function.
> 
> > +
> > +	ret = device_create_managed_software_node(ddata->dev, ls2k_bmc_swnode_properties, NULL);
> > +	if (ret) {
> > +		dev_err(ddata->dev, "Failed to create software node for GPIO reset: %d\n", ret);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	return devm_gpiod_get_index(ddata->dev, NULL, 0, GPIOD_IN);
> > +}
> 
> [ ... ]
> 
> > @@ -402,44 +478,32 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
> 
> [ ... ]
> 
> > -	ret = devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
> > -			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
> > -	if (ret)
> > -		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpio_irq);
> > +	ret = devm_request_irq(&pdev->dev, gpio_irq, ls2k_bmc_interrupt,
> > +			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc reset", ddata);
> 
> [Severity: High]
> This is a pre-existing issue, but does ls2k_bmc_interrupt() properly handle
> being shared?
> 
> The interrupt is requested with IRQF_SHARED, but ls2k_bmc_interrupt()
> unconditionally returns IRQ_HANDLED and schedules its work without reading
> a hardware register to verify it was the actual source of the interrupt.
> 
> When another device sharing this IRQ line fires an interrupt, wouldn't this
> erroneously reset the BMC and suppress spurious interrupt detection for the
> other devices?
> 
> > +
> > +	if (ret != 0)
> > +		return dev_err_probe(ddata->dev, ret, "Failed to request IRQ %d for GPIO reset signal input.\n", gpio_irq);
> >  
> > -	acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
> >  	return ret;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com?part=7

-- 
Lee Jones
