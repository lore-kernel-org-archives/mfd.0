Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254F63C1974
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786366087; cv=none; b=F34OYwfCcYDWACG25Zl377ftVunHJuYI0QogF4CdkX+TxqQTwr3Bb4gno6+lNUCbLuX1E85SFEqjMeygEF2JylgUFuBG4urT1eJm58shOgRDa52dO6wXhxMfjig6WMjVI25BxUINnDTK/H8/2Iq36kJ87dwFQ6MciLgj9Ii4Tjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786366087; c=relaxed/simple;
	bh=qcohWEeYOzWUYNEukXbe7L4qe/ZkVW8nhrqE1L6yMXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dzlE04EmSk1PXB8zETcnVpiCnC0iy0Hr0eDb0OxaFLU3bgbfUYzA8ma/K1Hj1UyZl3CHcc1OrwUYzLaFeRkNCC/qKXx2VMMaKeFaNfN3yHgUghH+zkxqz0eS+by/R21owKa3MWSf/vrld8ZgCgd/LwSonB3jzZ6e17xWkMuh7zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFUMNxqW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFUMNxqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C851F000E9;
	Mon, 10 Aug 2026 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786366086;
	bh=UsyLhBR3TfzBdpUDGdLRNLfMjDajA/J1e6/apV29cFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FFUMNxqWmlmLjzY/W0pJ8q7NAMmzAZXurQSsVMSeLou31LlNkvN/ZKAGOM2CJvZph
	 vgLZqyrQqQTbwlMphVvQONP7+z1iOUqHV2x86f1kaABLYBh9vP4CD7nKp3tJ1by9Mz
	 AtUajXUWOnZqVtOTmCF1RP5TwyicIxxRYdzJji2HRO0XqNpjZpxD35AzYXI79s0rKG
	 ugrGxybGGfrCkgyHXXAUUjzpIpB3mYLMnAqpHTpnmlA114gpdeNezwpV0P6gUViLro
	 PVM/7A27xuOstDkT4M+nwHZTGoNI5hMncIM6xp3yCInIINj6ndwFSLWfcMQ/Fcfg02
	 47WTwBfGMIPRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 8/8] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260810-ls2kbmc-mod-v7-8-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
 <20260810-ls2kbmc-mod-v7-8-8aa0fb5a5462@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:48:05 +0000
Message-Id: <20260810124805.C9C851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Overwriting an error pointer with NULL before evaluating PTR_ERR()=
 silently masks probe failures and skips interrupt setup.

Pre-existing issues:
- [High] Dynamic mutation of the global `mfd_cell` array violates MFD guide=
lines and creates race conditions.
- [High] The shared interrupt handler unconditionally returns IRQ_HANDLED w=
ithout hardware verification, defeating spurious interrupt detection.
--

--- Patch [8]: [PATCH RFC v7 8/8] mfd: ls2kbmc: Capture the reset event of =
BMC through GPIO ---
commit 6a359b995e90c1c237ad1e2bbc3df19694c36a32
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Capture the reset event of BMC through GPIO

The reset event of BMC is captured through GPIO. This patch tries to find
the GPIO through declared GPIO pin in the _CRS resources of the ACPI node,
falling back to a fixed address if not found.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 5eea53f134215..fd2142d4991a4 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> @@ -402,44 +470,35 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
>  		return ret;
>  	}
> =20
> -	gpio_base =3D ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);

[ ... ]

> -	/* Enable GPIO interrupts */
> -	val =3D readl(gpio_base + LOONGSON_GPIO_INTEN);
> -	writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTEN);
> +	ddata->reset_gpio =3D devm_gpiod_get_index_optional(&pdev->dev, NULL, 0=
, GPIOD_IN);
> +	if (IS_ERR(ddata->reset_gpio)) {
> +		ddata->reset_gpio =3D NULL;
> +		return dev_err_probe(ddata->dev, PTR_ERR(ddata->reset_gpio),
> +				     "Failed to get GPIO pin for reset signal\n");
> +	}

[Severity: High]
Does this error path unintentionally return 0 (success) on failure?

Because ddata->reset_gpio is explicitly set to NULL right before calling
PTR_ERR(ddata->reset_gpio), the error code passed to dev_err_probe()
evaluates to 0. This masks probe failures (like -EPROBE_DEFER) and causes
ls2k_bmc_init() to succeed without configuring the interrupt.

> +	if (ddata->reset_gpio =3D=3D NULL) {
> +		ddata->reset_gpio =3D ls2k_bmc_find_gpio(ddata);
> +		if (IS_ERR(ddata->reset_gpio)) {
> +			ddata->reset_gpio =3D NULL;
> +			return dev_err_probe(ddata->dev, PTR_ERR(ddata->reset_gpio),
> +					     "Failed to find GPIO pin for reset signal\n");
> +		}
> +	}

[Severity: High]
Is this fallback path subject to the same pointer overwrite issue?

Setting ddata->reset_gpio to NULL before calling PTR_ERR(ddata->reset_gpio)
will also mask the error code returned from ls2k_bmc_find_gpio().

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but looking at ls2k_bmc_probe():

ls2k_bmc_probe() {
    struct simplefb_platform_data pd;
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
}

Does this dynamically mutate the global ls2k_bmc_cells array with a pointer
to a stack-allocated variable?

The MFD subsystem guidelines require mfd_cell arrays to be static const.
Mutating this globally could create a data race if multiple driver instances
probe concurrently, and it leaves a dangling pointer in the global structure
after the probe function returns.

[Severity: High]
This is also a pre-existing issue, but looking at the interrupt handler:

ls2k_bmc_interrupt() {
    ...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }

    return IRQ_HANDLED;
}

Since devm_request_irq() is called with IRQF_SHARED, is it safe to
unconditionally return IRQ_HANDLED without checking hardware registers to
confirm the interrupt actually originated from the BMC?

If another device on the shared IRQ line experiences an unhandled interrupt
storm, this handler will falsely claim it. This prevents the kernel's
spurious interrupt detector from disabling the stuck line, which can lead
to a hard system lockup.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v7-0-8aa0fb5a5462@gmail.com?part=3D8
