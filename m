Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258124195CC
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618857; cv=none; b=G+jgKxRFd1MTVF6eqoYBTov/a/qAJ1JvL2NvE5NscbYEm+1/JXytpSyK6E1seb/Wg/7bNnh/a604aroNWyQ2DVe7Pib/lrMGS30aTd3+DqYx+3BGjubAOkdpftbVZmRByvXMI6G0xsATD/4GillJ9ZRMihXeH4ymWByATPwmZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618857; c=relaxed/simple;
	bh=RxPXG4DKCJu3tWF18jXolKdkJYfSanWO/OBCCSreoMY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GfUnmg6Yj/SpguRwTxldtYyjY3MmAK2G4EV3hSpTHC9hKl9l9R2/JFi8eQod5QA292rqt3RB/BQWiA7eHfbX1v3ztRTD3BehnWourKPaT6mX7uyOxpTHw8pVn9M6aJ1EafL3WGgmacsIlR8evriH5FnfHtYn2/aSM89b1cct+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNwhYP5n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNwhYP5n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25E71F00A3A;
	Thu,  9 Jul 2026 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618856;
	bh=d2dOahwfKd/vCKc2IJKhjbryQjdqYetVxF2Z51Z5nN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aNwhYP5ng5d3lcAm+JKFzqW3H+/h0j0xKFpOx0Vb0jwiNejTgUI1RwPLH3xKI1x/y
	 I2Iy4V4UK6oAsBEbQ/VrlhHoZaNgTsz4pWMEhi/R/sJtexomJ//sQO3uYkMuKYt111
	 f7gdrdo8QCmRoysqs6lBlWehzAGLoZ+e/OFPNbAlF76hk/oGnOLj1uUPRqXA7wEBbm
	 V9S5x7fZL+WZYdnNfwaAguADC3naJnJXHtBuG+dQXa51ye8slcDf3fmrQgyzHHlZqA
	 OvIxhJBrV4LYBSjOvDAvqew1VZb2mbnFC5ke/82LemBaUotgZfhT3HoCiNFtxnq8L9
	 PTqjpe+ifmrEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260710-ls2kbmc-mod-v3-7-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-7-ef718636e78e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:40:55 +0000
Message-Id: <20260709174055.D25E71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unprotected access to `gpio_chip` without a NULL check leads to a =
potential NULL pointer dereference or use-after-free.
- [Medium] The ACPI memory resource search for the GPIO controller only che=
cks the first memory descriptor, ignoring any subsequent ones.

Pre-existing issues:
- [High] The shared interrupt handler unconditionally returns IRQ_HANDLED w=
ithout checking the hardware status, violating shared IRQ semantics.
--

--- Patch [7]: [PATCH RFC v3 7/7] mfd: ls2kbmc: Capture the reset event of =
BMC through GPIO ---
commit a2c13d408a04d53aa90ec63a2b31ea6450fb493e
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Capture the reset event of BMC through GPIO
   =20
This patch modifies the driver to find its reset GPIO via ACPI or a fallbac=
k=20
software node, rather than directly accessing the GPIO registers.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 1466b314fc4e5..5a2644ff07fee 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> +static int ls2k_bmc_gpiochip_find(struct gpio_chip *gc, const void *data)
> +{
> +	struct acpi_device *adev;
> +	struct list_head resource_list;
> +	struct resource_entry *rentry;
> +	struct fwnode_handle *fwnode =3D gpio_chip_get_fwnode(gc);
> +	phys_addr_t start_addr =3D (phys_addr_t) data;
> +	int ret, found =3D 0;
> +
> +	if (!is_acpi_node(fwnode))
> +		goto out;
> +
> +	adev =3D to_acpi_device_node(fwnode);
> +	if (!adev)
> +		goto out;
> +
> +	INIT_LIST_HEAD(&resource_list);
> +
> +	ret =3D acpi_dev_get_memory_resources(adev, &resource_list);
> +	if (ret < 0)
> +		goto out;
> +	rentry =3D list_first_entry_or_null(&resource_list, struct resource_ent=
ry, node);
> +	if (!rentry)
> +		goto free_resource_list;
> +	if (rentry->res->start =3D=3D start_addr)
> +		found =3D 1;

[Severity: Medium]
Will this correctly identify the GPIO controller if the register base is
defined as the second or later memory resource in the ACPI DSDT?

The list of memory resources is queried, but only the first element is
evaluated with list_first_entry_or_null() instead of iterating through the
entire list with list_for_each_entry().

> +
> +free_resource_list:
> +	acpi_dev_free_resource_list(&resource_list);
> +out:
> +	return found;
> +}
> +
> +static struct gpio_desc *ls2k_bmc_find_gpio(struct ls2k_bmc_ddata *ddata)
> +{

[ ... ]

> +	gc =3D gpio_device_get_chip(gdev);
> +
> +	ls2k_bmc_swnode_properties[0] =3D PROPERTY_ENTRY_GPIO("gpio",
> +		gpio_chip_get_fwnode(gc), LS2K_BMC_RESET_GPIO, GPIO_ACTIVE_HIGH);

[Severity: High]
Does this code risk a NULL pointer dereference?

gpio_device_get_chip() can return NULL if the underlying GPIO controller is
concurrently unregistered.

Passing this potentially NULL gc pointer to gpio_chip_get_fwnode() results =
in
an immediate unconditional dereference of chip->fwnode inside that function.

> +
> +	ret =3D device_create_managed_software_node(ddata->dev, ls2k_bmc_swnode=
_properties, NULL);
> +	if (ret) {
> +		dev_err(ddata->dev, "Failed to create software node for GPIO reset: %d=
\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return devm_gpiod_get_index(ddata->dev, NULL, 0, GPIOD_IN);
> +}

[ ... ]

> @@ -402,44 +478,32 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)

[ ... ]

> -	ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
> -			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
> -	if (ret)
> -		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpio_i=
rq);
> +	ret =3D devm_request_irq(&pdev->dev, gpio_irq, ls2k_bmc_interrupt,
> +			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc reset", ddata);

[Severity: High]
This is a pre-existing issue, but does ls2k_bmc_interrupt() properly handle
being shared?

The interrupt is requested with IRQF_SHARED, but ls2k_bmc_interrupt()
unconditionally returns IRQ_HANDLED and schedules its work without reading
a hardware register to verify it was the actual source of the interrupt.

When another device sharing this IRQ line fires an interrupt, wouldn't this
erroneously reset the BMC and suppress spurious interrupt detection for the
other devices?

> +
> +	if (ret !=3D 0)
> +		return dev_err_probe(ddata->dev, ret, "Failed to request IRQ %d for GP=
IO reset signal input.\n", gpio_irq);
> =20
> -	acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-ls2kbmc-mo=
d-v3-0-ef718636e78e@gmail.com?part=3D7
