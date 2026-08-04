Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC8382F23
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 19:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871653; cv=none; b=KnZK8/tdd6hTNfyJLpxqjJ7nv239/bS2AMYZqo8W6XMbY68WMVYCgk353O/Yg4hJyf/FwI7PhgFJhADjj+4sOOQ0p8w3tf0FYfFcV+LUQcXWHz3k3IYiv7q0EVU//vp9bnEdQIpzCGli5n1tv6rbdw+tobY+DKb/PMvPyCgvbUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871653; c=relaxed/simple;
	bh=IGri+OLu/3xeIm+8WAJIUR4qn+F+giM6gn6gwRl9fVw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KxGDB33eQVOB+Qkhih5dlx5qJO4jzS+lYT1YdwaGQ5DQxe82jQMv/86uxockmg8OjGF+kz2ls+MDz97P153QWk2xTlkGqHnu5XbFwjDwDnm+1uFLY7rQOPk8j+nNIp9/AE2woq4hkNerEuHHpb0RE6GmiKXXgfOI80XlRvl+7sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlNXORR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlNXORR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715581F000E9;
	Tue,  4 Aug 2026 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785871650;
	bh=R7eLlcV1he+vz3ATitP7Q9PSd+IKEg4bfE2LgsUGXWA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RlNXORR3TOvKkgvTfZf+4bzBEfWeICiNooemU5nNcljYWyw5EXexGLSMGAo8I1gf9
	 dOYoAfeYg9/z9GNMJp237t60eWrdIToqcYwpDE/zlMa2vSmxIKSzj+sXwP/knLWkVe
	 XC4Nbd7lHqr0lsjO/D929DZtMrYY2PRG3iiue1EWR4wR6iFCmpW4E9wuItdQaTtJJP
	 lEMh4jtgoLaobELNrVYbaFxazWNVYnL0MOgWDX9N13gNggXUkEsdbnh1d42F6IJ9vG
	 ObndpmSd5/Foje9dHeXYJ/y2E1qIZu9ZSeFAq7DfU4TDYZy0PcYH0FWFD3huYmzg+h
	 ZXanxZMTGV5AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 6/7] mfd: ls2kbmc: Able to be compiled as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260805-ls2kbmc-mod-v6-6-16ccde412d86@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-6-16ccde412d86@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:27:29 +0000
Message-Id: <20260804192730.715581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Immediate disposal of IRQ mapping breaks GPIO interrupt and causes=
 panic on module unload.
- [High] Dynamic mutation of global MFD cell array with a local stack point=
er violates MFD API rules.
- [High] System-wide 13-second stall with interrupts disabled inside stop_m=
achine() callback.
--

--- Patch [6]: [PATCH RFC v6 6/7] mfd: ls2kbmc: Able to be compiled as a mo=
dule ---
commit 9c6121767eaa76246cc34b4848b6602e7e2a88b2
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Able to be compiled as a module

Make ls2kmc able to be compiled as a module

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782b..a7a9f97af248c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2494,7 +2494,7 @@ config MFD_LOONGSON_SE
>  	  which will forward them to the corresponding engine.
> =20
>  config MFD_LS2K_BMC_CORE
> -	bool "Loongson-2K Board Management Controller Support"
> +	tristate "Loongson-2K Board Management Controller Support"

[Severity: High]
This isn't a bug introduced by this patch, but by allowing this driver to
be built as a module, it exposes an unbind and unload crash path.

In drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init(), the code unregisters the
GSI immediately after requesting the IRQ:

    ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
                           IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpi=
o", ddata);
    if (ret)
        dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpi=
o_irq);

    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    return ret;

Does this unconditional call to acpi_unregister_gsi() free the IRQ
descriptor while the interrupt is still actively requested? If the module
is unloaded, will the devres cleanup call free_irq() on a destroyed IRQ
descriptor and cause a kernel panic?

[Severity: High]
This is also a pre-existing issue, but it violates MFD subsystem rules
regarding static const cell arrays.

In drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe(), the driver mutates the
global ls2k_bmc_cells array:

    struct simplefb_platform_data pd;
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);

Since ls2k_bmc_cells is not declared const, does mutating this global
array with a local stack pointer leave a dangling pointer once the probe
function returns? Would concurrent probes of multiple BMC PCI devices
result in a structural data race?

[Severity: High]
This is another pre-existing issue that might cause severe instability.

In drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn(), the driver calls
stop_machine():

    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);

Inside the callback ls2k_bmc_recover_pci_data(), the code performs a long
delay:

    /* Waiting for U-Boot and DDR ready */
    mdelay(LS2K_BMC_RESET_WAIT_TIME);

Since stop_machine() halts all CPUs and disables local interrupts, will
delaying for 10+ seconds inside this callback trigger the NMI hard lockup
watchdog and panic the host kernel?

>  	depends on PCI && ACPI_GENERIC_GSI
>  	select MFD_CORE
>  	help

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ls2kbmc-mo=
d-v6-0-16ccde412d86@gmail.com?part=3D6
