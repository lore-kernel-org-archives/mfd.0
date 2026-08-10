Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC063D9DD4
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365365; cv=none; b=Dj6q2rNEAUC4ulgsngIWE7z64Nohgz5lIb7ES8isSPlkraSRop0DXrKMcvVudMMXLbprU4eQlCN39hvvGZ6EF+5Ax+sRe3i3MXFUIPzrxMeH+w0LgtNmHfr8hC96QnDUW0P9EeRIiMm0ldia9Wb9vhuR3uk3YXALK/cFsg0YSgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365365; c=relaxed/simple;
	bh=+BgqLSP6gAGVGodZUkY5jO46bw7kWnqDldXmNEtbPyQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ius4C3jDZZlrti5BIFD6nXIMX+1cOXgVWfOwmFM7kM2e0HFwO4alIiFx/WYe9icNgOHVvY6v2ia7nw7oggOf9r6eSazHNTbbVaDM4ItjVDYO89YkARI6OnM10Gk+mLYwB+QPZqYEzQsd8fGG6K0OXPqLXLrPlQC24Z2EPlTEoZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amn9vzjH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amn9vzjH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7084D1F00A3A;
	Mon, 10 Aug 2026 12:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786365363;
	bh=HY1h7bYLITFTOJJ/el0xjf7YACcGDuJL3vDl+YDH0v8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=amn9vzjHnmXSoFfYx92yW+LMi1t+pcjHwib+HpyfHTkR+UJC9u9RJkBJSMMfxKcUo
	 OTe/sXxMNXRLEBEVwcA7qduNb7vpky3okorVcjjoHn0jveG0x9B2KX+31Hy08p8v+2
	 b1IbVv3jIrhxOYGDbwpCboUaNOp3fdSqyw1Rj+O6cAoGtwgxpvYfgvYtJqvh4NwYVW
	 WTsqoaRWGi9c5LqC7QCMu6s91/Dr0HsjgY08XecFR2y3gO/p0afmhiiTCwiZIdPxlh
	 Pe3yqzYE+Zvw4rkUxDQmHFvNGKQZMo9hpGmw0LLz4Ao4U7LtuuQ1gnBm9/yH523Dhd
	 M3x/4nBatecjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 6/8] mfd: ls2kbmc: Able to be compiled as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260810-ls2kbmc-mod-v7-6-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
 <20260810-ls2kbmc-mod-v7-6-8aa0fb5a5462@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:36:02 +0000
Message-Id: <20260810123603.7084D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Making the driver a loadable module exposes a missing hardware int=
errupt teardown on module unload, risking spurious interrupt storms.
- [Low] The commit message violates MFD subsystem formatting and naming rul=
es.

Pre-existing issues:
- [Critical] The driver invokes `stop_machine()` to execute a 10-second blo=
cking delay and perform `ioremap()` (via `pci_iomap()`), leading to guarant=
eed NMI watchdogs, deadlocks, and system stalls.
- [High] The driver modifies a global static `mfd_cell` array during probe =
with a pointer to a stack-allocated variable, violating the MFD `static con=
st` rule and creating a race condition.
- [High] The driver unconditionally destroys its GSI interrupt mapping imme=
diately after successfully requesting it, breaking BMC reset detection.
- [High] A generic PCI driver bypasses resource discovery to hardcode a SoC=
 physical MMIO address.
--

--- Patch [6]: [PATCH RFC v7 6/8] mfd: ls2kbmc: Able to be compiled as a mo=
dule ---
commit e0d6c702d53af0c3fc808b9dac2ceb61eef6aaf1
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Able to be compiled as a module
   =20
Make ls2kmc able to be compiled as a module

> mfd: ls2kbmc: Able to be compiled as a module
>=20
> Make ls2kmc able to be compiled as a module

[Severity: Low]
This isn't a bug introduced by this patch, but there is a typo (ls2kmc) in
the commit body, and the prefix uses a mismatched driver name (ls2kbmc
instead of ls2k-bmc).

Does it make sense to update this to strictly follow the MFD subsystem Git
history categorization rules?

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
Does making this driver a loadable module expose a missing hardware
interrupt teardown?

Looking at drivers/mfd/ls2k-bmc-core.c, ls2k_bmc_init() explicitly enables
the hardware GPIO interrupt:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    writel(val | BIT(LS2K_BMC_RESET_GPIO), gpio_base + LOONGSON_GPIO_INTEN);
    ...
}

However, the driver lacks a .remove callback to clean up the hardware state
when the module is unloaded:

static struct pci_driver ls2k_bmc_driver =3D {
    ...
};

If the module is unloaded, could the hardware remain armed and lead to
spurious interrupt storms if a BMC reset occurs subsequently?


[Severity: Critical]
This is a pre-existing issue, but could this driver cause system deadlocks
by invoking stop_machine() to execute a blocking delay and perform ioremap(=
)?

Looking at ls2k_bmc_events_fn(), it calls stop_machine():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

Inside ls2k_bmc_recover_pci_data(), it performs a 10-second busy wait:

    mdelay(LS2K_BMC_RESET_WAIT_TIME);

Additionally, in the same atomic context, it calls pci_iomap() which invokes
ioremap() inside ls2k_bmc_pcie_is_connected():

    base =3D pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);

Could calling a 10-second delay and ioremap() (which might send IPIs for
TLB shootdowns) inside a stop_machine() context cause NMI watchdogs and
system deadlocks?


[Severity: High]
This isn't a bug introduced by this patch, but is it safe to modify a global
static mfd_cell array during probe with a pointer to a stack-allocated
variable?

The MFD subsystem requires mfd_cell arrays to be static const, but it is
defined as mutable:

static struct mfd_cell ls2k_bmc_cells[] =3D {

During ls2k_bmc_probe(), it dynamically assigns the address of a local stack
variable pd:

    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;

When probe() returns, does this leave a dangling pointer in the global arra=
y,
potentially causing a data race if concurrent probes occur?


[Severity: High]
This is a pre-existing issue, but does the initialization sequence
unconditionally destroy its GSI interrupt mapping after successfully
requesting it?

In ls2k_bmc_init(), it calls acpi_unregister_gsi() in the success path:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    ...
}

Will this completely dispose of the IRQ mapping, preventing BMC reset
interrupts from being routed?


[Severity: High]
This isn't a bug introduced by this patch, but shouldn't a generic PCI
driver rely on standard resource discovery instead of hardcoding a physical
MMIO address?

In ls2k_bmc_init(), it calls ioremap() on a hardcoded constant:

    gpio_base =3D ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);

Could this cause resource conflicts and break platform portability by bypas=
sing
mechanisms like PCI BARs?

>  	depends on PCI && ACPI_GENERIC_GSI
>  	select MFD_CORE
>  	help

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v7-0-8aa0fb5a5462@gmail.com?part=3D6
