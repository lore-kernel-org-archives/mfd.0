Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A343F3264
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 19:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871811; cv=none; b=FBYeULe1/Lms3bFm3n3IsDZe6DzZnNVohyk1SkrLyiptuJ9cvYNr6u+pCKqLUVSVXZHsPsZBAK37Et4f1fFgKPucYR0vcPidgaBc3/peFX+SiAoxZ0VLyTUB3lE262oCOl1oOLWxh+c03li/ggN8zA3Ubq6KiLiRB3txMrw9x0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871811; c=relaxed/simple;
	bh=KiFPHjdzM74XAJNL0/VQvxL7rIc+/WQMfwfVc8mM2L8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JsMWmo1z5DYsndAjrMBoVhxDxGuHDrX5tNrqC4TCOgh7zsjmxw0t7oLur3Rwy41nU6jtCPsQ13cKfkw4vpN98f0lTo0qbDF8pVDDl8qVcTFLVzBh41Zr5BbiVGvRFiKz/Dm7kWCpZ77vRkBAMtMdTIpQaqq3kl4WtuzAlWoLLvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIJ7/qk+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIJ7/qk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658F31F00A3A;
	Tue,  4 Aug 2026 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785871808;
	bh=IU39P80FSZs46Om3cnzAcg+zmZU+V60+IXht4hmHTSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oIJ7/qk+jheq77322szCZAYVjY9qebfIsLXU6mJCvNpP7q62/KpmV7RFwqjMQuzQx
	 kyuJigpRz6eVZ28t1QUhi5JqpVV8TdiaWOzUy23puWCOs3JO14iWH4TFKDYE+aejeu
	 O1EVr0bYu6yD6KsswKmmjLUe9RVrRekEbboTJrDPrq6CoqT9WfZa9ISX29uhhs3J8q
	 oYuoUjtHVfkjGXjf725UjxyDJe+vbKNODhFzu7ufQHSwRDh1aLaYtiAf5a7ckOtXl1
	 e8Unor7/7zvtMhIugOnrPoQ7/fB8MEO9Br8CJclCqaB58gPjFs8xyp5CA6Ix6Tea0E
	 VtFWD+Xa0FBWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260805-ls2kbmc-mod-v6-7-16ccde412d86@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-7-16ccde412d86@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:30:07 +0000
Message-Id: <20260804193008.658F31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Casting phys_addr_t directly to void * causes compiler warnings on =
32-bit builds where phys_addr_t is 64-bit.
- [Low] Inconsistent GPIO polarity configuration using GPIO_ACTIVE_HIGH for=
 an active-low reset signal.

Pre-existing issues:
- [High] The driver mutates a global static `mfd_cell` array in the probe f=
unction, violating MFD subsystem guidelines and causing a data race.
- [High] The shared interrupt handler `ls2k_bmc_interrupt` unconditionally =
returns `IRQ_HANDLED`, defeating spurious interrupt detection.
--

--- Patch [7]: [PATCH RFC v6 7/7] mfd: ls2kbmc: Capture the reset event of =
BMC through GPIO ---
commit 9252e63d105a3c07a23e797a66a7260c9eee7e44
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Capture the reset event of BMC through GPIO

This patch updates the ls2kbmc driver to retrieve the BMC reset GPIO
through the ACPI node's _CRS resources. If no declaration is found, it
falls back to finding the correct GPIO controller and pin using a fixed
address.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -375,6 +368,91 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *p=
dev, struct ls2k_bmc_ddata *
> +static struct gpio_desc *ls2k_bmc_find_gpio(struct ls2k_bmc_ddata *ddata)
> +{
[ ... ]
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
Does casting phys_addr_t directly to a void * cause a truncation warning on
32-bit builds where phys_addr_t is 64-bit?

> +
> +	if (!gdev) {
> +		dev_dbg(ddata->dev, "cannot find GPIO chip at address %pa, deferring\n=
",
> +			&LOONGSON_GPIO_REG_BASE);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	ls2k_bmc_swnode_properties[0] =3D PROPERTY_ENTRY_GPIO("gpio",
> +		gpio_dev_get_fwnode(gdev), LS2K_BMC_RESET_GPIO, GPIO_ACTIVE_HIGH);

[Severity: Low]
Could the fallback software node configure the active polarity inconsistent=
ly
with the hardware?

The ACPI specification and the previous hardware implementation define the =
BMC
reset GPIO as active-low, but it is registered here as GPIO_ACTIVE_HIGH.

> +
> +	ret =3D device_create_managed_software_node(ddata->dev, ls2k_bmc_swnode=
_properties, NULL);
[ ... ]
> @@ -402,44 +479,36 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
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
This is a pre-existing issue, but does unconditionally returning IRQ_HANDLED
in the shared interrupt handler defeat spurious interrupt detection?

The driver requests the PCI and GPIO interrupts with IRQF_SHARED. However,
ls2k_bmc_interrupt() does not verify that the interrupt was generated by the
BMC before claiming it:

static irqreturn_t ls2k_bmc_interrupt(int irq, void *data)
{
        ...
        return IRQ_HANDLED;
}

If another device sharing the IRQ line triggers a spurious interrupt, could
this false claim lead to a system-halting interrupt storm?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does the driver mutate a
global static mfd_cell array in the probe function?

Looking at ls2k_bmc_probe(), it injects a stack pointer into ls2k_bmc_cells:

static struct mfd_cell ls2k_bmc_cells[] =3D {
        ...
};

static int ls2k_bmc_probe(...)
{
        struct ls2k_bmc_display_pdata pd;
        ...
        ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
        ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
}

This violates the MFD subsystem guidelines which require cell arrays to be
static const. If multiple devices are probed concurrently, could this cause=
 a
data race and potential use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ls2kbmc-mo=
d-v6-0-16ccde412d86@gmail.com?part=3D7
