Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92223DD852
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372207; cv=none; b=EClNz0QW/N56K7EmTO0oK8DcgkMolmTKNUFrmXom/cBs0rFO7dxwr2CpmpP+BSqWr3H3NLEHCKmv4xCU67mY2u+DAKVmxsoQ5R4dTO/XJGN02w4oZQszjkVQ1K7nWw9tjkMpnI/aIHHtmiddNK6d7p5AoSfmPk3znnwWhGREWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372207; c=relaxed/simple;
	bh=itipeNbtOM/4kZ+xC7JWfdK8Dz0HBayzRebqpZlXNtc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QhxstiWYtRSeigHl1aXHLOBywkaGjiW7PML7k/1YmB8rttVruy0609g2mSQn2Wo0D+gQv4iqPhPaDHAjBMN9KABBBpWFkmSs680g2Eg+wXz1LVVUQeRR3KYN3xwNmWgGvmx4iE2DBvWTQD5PVoqZksTSMupHb5kA1G6LAj0EZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej0PP4hy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej0PP4hy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403311F000E9;
	Mon, 10 Aug 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786372205;
	bh=EM/SeGLcGyXBSp+rmy0jHgn2ZMiFOmjsPO7YSrsfeRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ej0PP4hyQoQsyHRU0KaPkLXoDAK0O79mD8JuEHOs1j1Xic55BSs8vrHmg/ew5YrwK
	 Bussz7CoCjwg5TcBURl0QTpfn+HZYUKWwbaCCljgUWF9p/chomJhJ3+hlBS4J3pHoc
	 8X9fkMMR22IYCAVskuJDqDBaiHTgLI7oeF/m28R4kM9yypvAzBWH7jjIrP08ugy693
	 dHQ9TSXo7JkmMQgTzRb0Ctao5RCODV3luuDiVpusI3LobapxdVLcgJLXbihrtDKksZ
	 ve9CAIhuty96hL6pByUOoRrNxbjQ6BdVy5piN4bfTvczx3u6kOHqAJMyrvo+6Wfc8M
	 I3h0LImo7x3hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v8 7/8] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260810-ls2kbmc-mod-v8-7-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <20260810-ls2kbmc-mod-v8-7-16e44f7322f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:30:04 +0000
Message-Id: <20260810143005.403311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The fallback path will likely fail at `gpiod_to_irq()` on older fi=
rmware, causing the driver probe to fail.
- [Low] Casting `phys_addr_t` to `void *` and back causes compiler warnings=
 and potential truncation on 32-bit architectures with 64-bit physical addr=
esses.

Pre-existing issues:
- [High] The probe function assigns a pointer to a local stack variable dir=
ectly to the global `ls2k_bmc_cells` array, violating MFD subsystem guideli=
nes and creating a concurrency vulnerability.
- [High] The interrupt handler unconditionally returns `IRQ_HANDLED` withou=
t checking hardware registers to verify if the interrupt originated from th=
e device, despite being registered with `IRQF_SHARED`.
--

--- Patch [7]: [PATCH RFC v8 7/8] mfd: ls2kbmc: Capture the reset event of =
BMC through GPIO ---
commit 0a3e35583f83690aea838854a1f8bc9d3f258974
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Capture the reset event of BMC through GPIO

This commit updates the ls2kbmc driver to retrieve the BMC reset GPIO
from the ACPI node instead of using a hardcoded address. If the ACPI
node lacks the GPIO declaration, it falls back to searching for the
GPIO controller using a fixed address.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 5eea53f134215..f52f0b772f6e9 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> @@ -375,6 +368,82 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *p=
dev, struct ls2k_bmc_ddata *
[ ... ]
> +static int ls2k_bmc_gpiochip_find(struct gpio_chip *gc, const void *data)
> +{
[ ... ]
> +	phys_addr_t start_addr =3D (phys_addr_t) data;

[Severity: Low]
Could this cast from a void pointer back to phys_addr_t cause truncation or
compiler warnings on 32-bit architectures that use 64-bit physical
addresses?

[ ... ]

> +static struct gpio_desc *ls2k_bmc_find_gpio(struct ls2k_bmc_ddata *ddata)
> +{
[ ... ]
> +	struct gpio_device *gdev __free(gpio_device_put) =3D
> +		gpio_device_find((void *)LOONGSON_GPIO_REG_BASE, ls2k_bmc_gpiochip_fin=
d);

[Severity: Low]
This is the other side of the cast mentioned above. Can we avoid casting a
physical address integer directly to a void pointer?

[ ... ]

> @@ -402,44 +470,31 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
[ ... ]
> +	ddata->reset_gpio =3D devm_gpiod_get_index_optional(&pdev->dev, NULL, 0=
, GPIOD_IN);
> +	if (IS_ERR(ddata->reset_gpio))
> +		return dev_err_probe(ddata->dev, PTR_ERR(ddata->reset_gpio),
> +				     "Failed to get GPIO pin for reset signal\n");
> +	if (ddata->reset_gpio =3D=3D NULL) {
> +		ddata->reset_gpio =3D ls2k_bmc_find_gpio(ddata);
> +		if (IS_ERR(ddata->reset_gpio))
> +			return dev_err_probe(ddata->dev, PTR_ERR(ddata->reset_gpio),
> +					     "Failed to find GPIO pin for reset signal\n");
> +	}
> =20
> -	iounmap(gpio_base);
> +	gpio_irq =3D gpiod_to_irq(ddata->reset_gpio);

[Severity: High]
Might this gpiod_to_irq() call fail on older firmware?

The previous implementation used acpi_register_gsi() directly because the
GPIO controller's ACPI node on older firmware lacked comprehensive IRQ
resource definitions.

If the fallback path triggers on this older firmware, gpiod_to_irq() will
eventually call platform_get_irq(), which relies on those ACPI IRQ
resources.

If they are missing, it might return -ENXIO and cause the entire driver
probe to abort.

>  	if (gpio_irq < 0)
> -		return gpio_irq;
> +		return dev_err_probe(ddata->dev, gpio_irq,
> +				     "Failed to get IRQ for GPIO reset signal input\n");
> =20
> -	ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
> -			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
> -	if (ret)
> -		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpio_i=
rq);
> +	ret =3D devm_request_irq(&pdev->dev, gpio_irq, ls2k_bmc_interrupt,
> +			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc reset", ddata);

[Severity: High]
This is a pre-existing issue, but while we are looking at the IRQ
registration, does ls2k_bmc_interrupt() need to check hardware registers to
verify if the interrupt actually originated from this device?

Since it is registered with IRQF_SHARED, but unconditionally returns
IRQ_HANDLED:

static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
{
    ...
    return IRQ_HANDLED;
}

Could this bypass the kernel's spurious interrupt detection and lead to an
interrupt storm if another device sharing the line generates an interrupt?

[ ... ]

[Severity: High]
This is a pre-existing issue, but I noticed a potential concurrency issue in
ls2k_bmc_probe() regarding the global mfd_cell array:

static int ls2k_bmc_probe(struct platform_device *pdev)
{
    ...
    struct ls2k_bmc_pci_data pd;
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

Is it safe to assign a pointer to a local stack variable to the global
ls2k_bmc_cells array?

In a multi-probe scenario, multiple threads could concurrently modify
ls2k_bmc_cells. If one thread overwrites the pointer with its own stack
address, could another thread dereference a dangling stack pointer?

The MFD subsystem guidelines typically require mfd_cell arrays to be static
const.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v8-0-16e44f7322f4@gmail.com?part=3D7
