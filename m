Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D95F3C3C0E
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776868; cv=none; b=Q7r4jpBsGFjnOaixwVR4XMqLDMFMrHqKaprs+AJ6BLj/KBq7QaQnjXDT+Ieg9tiTPWeAlnMrQypW4kk9EWQ+MgmUbXO/N5eLWW+0wttsMLGjLZ4fMk7t/zzV5PIr76vzSy6Uq9Aga/CPcqu3iydQvSMsNHeHfYToNEzm4DG2gPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776868; c=relaxed/simple;
	bh=63rMJGesZ+2F/2HJmbxN/jsvNkmHrYkvdISwWbBth+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pYT+I3URGI4HYz/z44EiAkOKy9Mt2Xr0cn+MwHYemfik8bJc58Lpbd737tPLh2HHzZmqAohEvRzLUIsCz3s9aYSRQGOqRQV6fDXDWZRcgiZaa0OZjm8yE60K8JQk7wwCDObCbAJjrn5RlVajBxDocqySEVJQcMcjojfUmRJUkU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeE16n87; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeE16n87"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622D21F000E9;
	Mon,  3 Aug 2026 17:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776866;
	bh=wQZ/1JEPcrfOEws2OBBzzBO271aVSlt2BHvaJRtLXbo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IeE16n87wb9TLmjtXooB7BENS80T64qfnNk9NkqcHH3nv3outmy1MUWGB8SrXnlby
	 ByagtDrJqIucUGgNePxHOw+67zzk35QVpofXejU5KNyOI9SfHCWpaXhdnKztPTZ6MW
	 DITCgT0qQBhlevPSo54QU9tetH9aT7seNxY/jqBTq8lpo/vh87+AxLsu0ahycgxFv/
	 W6OazPFU/1DaC2ik0szsoxCdi+n0uqKJISYwe98lLE0iqrjGsq9Qcw8RmJ2yIFG6d2
	 6H/e2qoyZXzwjLiMwtTbLlV06DR+FOBToI+V4KY6EsTTdZRQONKNfJVy1GyrMF7Kur
	 kESqXUBBhsfUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 6/7] mfd: ls2kbmc: Able to be compiled as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260804-ls2kbmc-mod-v5-6-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-6-e6bc5cdd9a93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 17:07:45 +0000
Message-Id: <20260803170746.622D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The driver executes a 10+ second busy-wait and a sleeping func=
tion inside a `stop_machine()` context, severely stalling the entire system.
- [High] `acpi_unregister_gsi()` is erroneously called immediately after re=
questing the IRQ, destroying the mapping and breaking interrupt delivery.
- [Medium] The global `mfd_cell` array is dynamically modified using a stac=
k-allocated pointer and lacks the `const` qualifier, violating MFD subsyste=
m guidelines.
--

--- Patch [6]: [PATCH RFC v5 6/7] mfd: ls2kbmc: Able to be compiled as a mo=
dule ---
commit 998b814232bcf86316d4b7feaee8e3da166c0a9e
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Able to be compiled as a module

Make ls2kmc able to be compiled as a module by changing the Kconfig option
from bool to tristate.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782b..a7a9f97af248c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
[ ... ]
> @@ -2494,7 +2494,7 @@ config MFD_LOONGSON_SE
>  	  which will forward them to the corresponding engine.
> =20
>  config MFD_LS2K_BMC_CORE
> -	bool "Loongson-2K Board Management Controller Support"
> +	tristate "Loongson-2K Board Management Controller Support"

[Severity: High]
This is a pre-existing issue, but enabling this driver to be built as a
module exposes it during module unload or driver unbind.

Does this code in ls2k_bmc_init() destroy the GSI mapping while the IRQ
is still in use?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    ...
}

Calling acpi_unregister_gsi() unconditionally right after devm_request_irq()
succeeds disposes of the mapping. Hardware interrupts will never reach the
registered handler. Furthermore, during module unload or driver unbind,
devm_free_irq() will attempt to free an IRQ whose mapping and descriptor
have already been disposed, potentially causing a use-after-free or kernel
warning.

[Severity: Medium]
This is a pre-existing issue, but unbinding and rebinding the module could
trigger a race condition here.

Does this assign the address of a local stack variable to a global array?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

Once probe returns, the platform_data pointer points to freed stack memory.
If another instance of the device binds, or if the driver unbinds and
rebinds, this dangling pointer could be used or overwritten concurrently.
Additionally, modifying a global mfd_cell array dynamically violates MFD
subsystem guidelines which require it to be static const.

[Severity: Critical]
This isn't a bug introduced by this patch, but there is a severe system
stall issue in the event handler.

Does this sequence execute a 10,000ms delay and call a sleeping function
inside an atomic context?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

Inside the callback, it invokes a 10-second busy wait:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

It also calls a function that can sleep:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_pcie_is_connected() {
    ...
    base =3D pci_iomap(parent, 0, LS7A_PCI_CFG_SIZE);
    ...
}

The workqueue handler ls2k_bmc_events_fn() calls stop_machine(), which
runs ls2k_bmc_recover_pci_data() while all other CPUs spin with local
interrupts disabled. Stalling the entire system with interrupts disabled
for over 10 seconds can lead to system-wide lockups, RCU stalls, and NMI
watchdog panics. Also, pci_iomap() can acquire locks and sleep, which is
unsafe inside stop_machine().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-ls2kbmc-mo=
d-v5-0-e6bc5cdd9a93@gmail.com?part=3D6
