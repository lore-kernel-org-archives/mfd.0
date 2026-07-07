Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0773ACF00
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 19:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453122; cv=none; b=s/udoBNaDNQlmPD9QKh6sllMPGcSqqnN0gGzxMEpo/zTARGaKFjZIOOQBRo4vSjUGzewjdRWRzZrTO3WGPqGoyNGgfuaRhiGfqTFA7MAllsFZFIM/uQ5e7P2ELUUwwAQ6ea4BJjq/ptWmLe2iYA0jAFYtCynx+GhuaIySWQaSfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453122; c=relaxed/simple;
	bh=7eHTTzAIn8si0s5RMTrL9GWSZ3AAH2ARyzbKAzij2lk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O95O8FbFvTRxvjWu1U4yCifaCjN/i0+SA8B0JLLCAcX7rElWeuVCIlKmU4UkxKuzgL7m93hscYJyjATnIx0scexPLGCEt19Ekwh7rwg/Zyb1B3eYBJkfgsp/nKzsUqWSfW7uBhcT3QGEVDcUwI+918/s938ajWT2hyETQInWeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iySndMus; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iySndMus"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109EF1F000E9;
	Tue,  7 Jul 2026 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783453118;
	bh=NFi54sYJFWwmMhWlEic7hCAEqrPkdWw2inrGcS2ZKuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iySndMusmqfS+tCejeDfGvY8a5+C2iYO8NH9GvhK1eBzCrxNicqYs1/N4/+dyL+mY
	 AozFnDhsyM4VYmFfMmiB4g0+21e6CsA4f/Gvg7L57on1aIrnOaU9n7WqdZkg9dPeUE
	 JHklSIP0978Qp7y2+sXAW9vTfK+58hpBQ17VW+bhkTglDubN9xaXTkWahn8WouoH6f
	 rz55e3nYtqGZsSUo3QLzsSTH9x9YOd20hmGMXDBhf8PcAT8yen4BcR4ExJdpwoJ8KP
	 LL4PABuuHBqbiBf47jZAa7KBuNNjV3knj54ZtEVOeUWXfQ0yyUoaIAjfxiBFVyQJ6R
	 TV9gkXnSwYCnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 5/5] mfd: ls2kbmc: capture the reset event of BMC
 through GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260708-ls2kbmc-mod-v1-5-c344bf5defa3@gmail.com>
References: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
 <20260708-ls2kbmc-mod-v1-5-c344bf5defa3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 19:38:37 +0000
Message-Id: <20260707193838.109EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] Unchecked dereference of `gc->parent` in `ls2k_bmc_gpiochip_find` =
causes a kernel crash if any GPIO chip lacks a parent.
- [High] Reading the instantaneous GPIO line state in an edge-triggered sha=
red interrupt handler causes valid pulse interrupts to be missed and the IR=
Q to be disabled.
- [Medium] Bypassing logical polarity abstraction by using `gpiod_get_raw_v=
alue` hardcodes physical logic levels.
- [Medium] Calling `gpiod_get_raw_value()` from a hardirq context may sleep=
 if the GPIO controller is sleepable.
- [Low] The commit message prefix violates MFD subsystem capitalization gui=
delines.

Pre-existing issues:
- [High] Missing `cancel_work_sync()` for `bmc_reset_work` leads to a Use-A=
fter-Free during driver unbind or probe failure.
- [High] MFD cell array is dynamically modified and not declared as `static=
 const`.
--

--- Patch [5]: [PATCH RFC 5/5] mfd: ls2kbmc: capture the reset event of BMC=
 through GPIO ---
commit f9d0fc327645db53505282b9d08103e16c85472d
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: capture the reset event of BMC through GPIO

This commit updates the ls2kbmc driver to capture the BMC reset event
using the GPIO framework rather than bypassing it via fixed memory addresse=
s.
It attempts to find the GPIO pin via ACPI _CRS resources, falling back to
a hardcoded GPIO controller address if not found.

> mfd: ls2kbmc: capture the reset event of BMC through GPIO

[Severity: Low]
Is the subsystem prefix capitalization correct here? The MFD subsystem
guidelines require capitalizing the description after the subsystem prefix.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 4ceae6c70fb27..5005908802766 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> @@ -334,6 +326,22 @@ static irqreturn_t ls2k_bmc_interrupt(int irq, void =
*arg)
>  	return IRQ_HANDLED;
>  }
> =20
> +static irqreturn_t ls2k_bmc_gpio_interrupt(int irq, void *arg)
> +{
> +	struct ls2k_bmc_ddata *ddata =3D arg;
> +
> +	int val =3D gpiod_get_raw_value(ddata->reset_gpio);

[Severity: Medium]
Could this sleep in atomic context? Since this interrupt is requested via
devm_request_irq() without a thread function, it runs in hardirq context.
If the ACPI-provided GPIO is backed by a sleepable controller like an I2C
expander, calling gpiod_get_raw_value() here might trigger a gpiolib warning
and sleep.

> +
> +	/*
> +	 * The GPIO is active low, so when the value is 0,
> +	 * it indicates a reset event.
> +	 */
> +	if (val =3D=3D 0)

[Severity: Medium]
Does using gpiod_get_raw_value() bypass the logical polarity abstraction?
If the hardware revision has different active polarities or the firmware
declares it as ActiveLow, hardcoding a check for physical 0 ignores the
gpiolib abstraction.

[Severity: High]
Could this miss valid interrupts and cause the IRQ line to be disabled?
The interrupt is configured as edge-triggered (IRQF_TRIGGER_FALLING). If the
reset is a short pulse, the line might return high by the time this hardirq
handler reads the instantaneous value. Returning IRQ_NONE for valid latched
events could trigger the kernel's spurious interrupt detection and disable
the IRQ.

> +		return ls2k_bmc_interrupt(irq, arg);
> +
> +	return IRQ_NONE;
> +}

[ ... ]

> @@ -375,11 +383,83 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *=
pdev, struct ls2k_bmc_ddata *
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &ddata->bmc_pci_data.in=
terrupt_line);
>  }
> =20
> +static int ls2k_bmc_gpiochip_find(struct gpio_chip *gc, const void *data)
> +{
> +	struct acpi_device *adev;
> +	struct list_head resource_list;
> +	struct resource_entry *rentry;
> +	struct fwnode_handle *fwnode =3D gc->fwnode ?: gc->parent->fwnode;

[Severity: High]
Could this cause a NULL pointer dereference? This callback is executed glob=
ally
over all registered GPIO chips by gpio_device_find(). If any GPIO chip in t=
he
system lacks both a fwnode and a parent, evaluating gc->parent->fwnode will
crash the kernel.

> +	phys_addr_t start_addr =3D (phys_addr_t) data;
> +	int ret, found =3D 0;

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for
bmc_reset_work to cause a use-after-free?

The work is initialized in ls2k_bmc_init() and queued in the interrupt hand=
lers,
but it doesn't appear to be canceled with cancel_work_sync() during driver
unbind or probe failure. If an interrupt fires right before unbind, devres =
will
free ddata, leaving the pending work to access freed memory when it execute=
s.

[Severity: High]
This is a pre-existing issue, but does ls2k_bmc_probe() modify the global
ls2k_bmc_cells array using a stack variable?

ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;

If multiple devices probe concurrently, they could overwrite each other's
pointers. This also violates the MFD subsystem rule that cell arrays must
be static const to prevent race conditions and dangling pointers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v1-0-c344bf5defa3@gmail.com?part=3D5
