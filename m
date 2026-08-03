Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290362147E6
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777357; cv=none; b=oMmBvcWX4NOekU8FT68CyoHyckh08qgWCWPKR75IWfPsYLybD7DiOj4z2yDCRfbqzJwhBwlxafbIKD7ydK0hJlve1fCUN1+2jatao+YY/2GPWMImKzmRloaD4/f7ZZoUcoUbtmG0989n5SEqJd0dVpHT7/TkwYSA9fVm3Gfm+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777357; c=relaxed/simple;
	bh=ntBLxP2m1TqUnO1PfkVqoAvP/CktSMvomKXwB0H/PT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mte6V8SvImZ4S0947/qxn+A6TfD+Xccubi0Bra2dP4UDJW1cDIqzseyx/iUz5dfFuv4n4HNEcwPZCcSs7gthBfYtlm9N92myJfvIFvsSbHqwS10o6Zvr6aJY2xTCW1JX4q5vKMwJAgI23kHFhtahOSkgY2CdtW+lhjOh1gHmDV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpKamWPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpKamWPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951F81F000E9;
	Mon,  3 Aug 2026 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777355;
	bh=35KDuF7K/l2AGvsIK5E//IIaoylKVYDTJt+G7LMbEVQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CpKamWPcb/fSoo/jiUwVsaPf/ax6MKnnFw66K1a2K3O2cMRcaG8NVjAYPfl9/eNwa
	 fLROWZYYhNIYu4ThD8WtVxlNzj7lUCRsqM2Tn20ScTkmnQhEE8ZMaH1XPjp7pxkIIz
	 tmHGz8Ur3U2YFIO5mvGkMQL8zXCr4SxAt7RCj+7ddLdhOLKOnI5Tn3qmTqoRiY1L/9
	 UevHljBUZcltAO1Apyyfby2IBY8IqNWx02rn/m/PesmI8SecF3YrUkJrXuXSeNOZUk
	 bRK2Lh7+j7JAxxDQAEvxik70frdf/A7P8+OK9hF4ydPe/V8FwGcw0Gs430HlLh9fy+
	 brE1f5R9S6Y/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260804-ls2kbmc-mod-v5-7-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-7-e6bc5cdd9a93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 17:15:55 +0000
Message-Id: <20260803171555.951F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Casting between `phys_addr_t` and `void *` causes compiler warnings=
 and potential data truncation on 32-bit platforms.

Pre-existing issues:
- [High] The driver dynamically modifies the global `ls2k_bmc_cells` array =
during probe, violating the `static const` requirement and creating a race =
condition.
--

--- Patch [7]: [PATCH RFC v5 7/7] mfd: ls2kbmc: Capture the reset event of =
BMC through GPIO ---
commit 535a8683905c93577231c2208f8f76431cb9049d
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Capture the reset event of BMC through GPIO

This patch modifies the driver to capture the BMC reset event through the
GPIO framework rather than directly accessing the controller via a fixed
address. It attempts to find the GPIO pin via ACPI _CRS resources, falling
back to a fixed address and pin number if not found. This helps prevent
conflicts when the same GPIO controller is probed by an ACPI GPIO driver.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index e7bebfe696ac4..97a666a136fe4 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> @@ -375,6 +368,91 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *p=
dev, struct ls2k_bmc_ddata *
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &ddata->bmc_pci_data.in=
terrupt_line);
>  }
> =20
> +static struct fwnode_handle *gpio_dev_get_fwnode(struct gpio_device *gde=
v)
> +{
> +	struct device *gdev_dev;
> +
> +	gdev_dev =3D gpio_device_to_device(gdev);
> +	return dev_fwnode(gdev_dev);
> +}
> +
> +static int ls2k_bmc_gpiochip_find(struct gpio_chip *gc, const void *data)
> +{
> +	struct acpi_device *adev;
> +	struct list_head resource_list;
> +	struct resource_entry *rentry;
> +	struct fwnode_handle *fwnode =3D gpio_dev_get_fwnode(gc->gpiodev);
> +	phys_addr_t start_addr =3D (phys_addr_t) data;

[Severity: Low]
Does casting data from a void pointer back to a phys_addr_t cause data
truncation on 32-bit platforms where phys_addr_t is a 64-bit type?

Can this also trigger pointer-to-int cast warnings during compilation?

> +	int ret, found =3D 0;
> +

[ ... ]

> +static struct gpio_desc *ls2k_bmc_find_gpio(struct ls2k_bmc_ddata *ddata)
> +{
> +	/*
> +	 * In conventional way, the GPIO should be obtained through ACPI or
> +	 * device tree. However, when the information is not available,
> +	 * we should find the GPIO according to the convention of the server
> +	 * boards with LS2K BMC, the gpio signal reflecting the reset event
> +	 * of the BMC should be connected to pin 14 of the GPIO input of
> +	 * the first CPU node. The address of that GPIO controller is fixed.
> +	 */
> +	static const phys_addr_t LOONGSON_GPIO_REG_BASE =3D 0x1FE00500;
> +	static const unsigned int LS2K_BMC_RESET_GPIO =3D 14;
> +	int ret;
> +	struct gpio_device *gdev __free(gpio_device_put) =3D NULL;
> +	struct property_entry ls2k_bmc_swnode_properties[2] =3D { 0 };
> +
> +	dev_dbg(ddata->dev, "Searching for GPIO chip at address %pa\n", &LOONGS=
ON_GPIO_REG_BASE);
> +
> +	gdev =3D gpio_device_find((void *)LOONGSON_GPIO_REG_BASE, ls2k_bmc_gpio=
chip_find);

[Severity: Low]
Can passing the 64-bit LOONGSON_GPIO_REG_BASE by casting it to a void point=
er
truncate the upper 32 bits on 32-bit architectures?

Does this also trigger int-to-pointer cast warnings during the build?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does ls2k_bmc_probe()
dynamically modify the global ls2k_bmc_cells array during probe?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

The MFD subsystem guide requires mfd_cell arrays to be static const.

Does this assignment create a race condition on concurrent probes (if multi=
ple
PCI devices were present) since instances would overwrite the shared
platform_data pointer?

Additionally, since pd is a stack variable, does this leave a dangling poin=
ter
in the global array after ls2k_bmc_probe() returns?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-ls2kbmc-mo=
d-v5-0-e6bc5cdd9a93@gmail.com?part=3D7
