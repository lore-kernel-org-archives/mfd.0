Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ED030567C
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618530; cv=none; b=QdXXmCHWZKGKW4rJk4wFmfBf4LvLfTsqWq6AH+4jYW89GzKbH3M1VgfYzw+7xMGtXKDGTlTZIRaiNTtclGWBFIkDwRq2eZ389ApifkOyPpIaFClY4lh7ONA6I3jDh1PyxMVpLU6wXeWKZ3UOAqZE2yJUOzmu3MsmgNetUjfq36Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618530; c=relaxed/simple;
	bh=tS5uTAB0nWR7t4RLjRE2i2CALDvi4Ze3WvPdcMQW87k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mmLUO8xu42YHJ4AHmYSYjkOqbeIz07nh8bLfG/Muln6iUpanUpicBCEjZM1eSi0M/LqQBvgMXO9zjimQazU91L4vBA3baNw+vcby9Xy7t5pJ0jGa60z4YtYddDqmBYoaI24iWsJTL64doWpIiG/qhBtOjRkAzY4kjpH6tojujM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ChEvGaZN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ChEvGaZN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631DC1F000E9;
	Thu,  9 Jul 2026 17:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618529;
	bh=toVO8l+Ms9ZCHvMowiaZQKghLwYxD0kBBS9bOeZjla8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ChEvGaZNueUWQqT7wmrx5JV/C8MXnh1jL5ESJmCQDbwad9+ZJFOnh1E70jE4eFBvd
	 ka6o6EzQHqhgxXdn//rU7tTHmF/2eL1PiAPn8NnosV2eAXiPdaoPJ7C+x0TcdfDf6s
	 SAJL+6H3uInhIvK5nckFGSF40TI5bp5PABSSV5G8t11mn+HCWz7JP1b7MZi5D28aS0
	 ZsK+7tkyH4NUcOgGovkIOqGueaJXh+S6w70kdTGQuf7F2Tdd8sg7pk3QwxNJ+IDZwF
	 9U+/8Mr9fZMGLIzg8eo5bIbQAx/KKyYs03ISty3Xj6o80EoWslEKwYWgUNhpwsPMEz
	 c6gpXDmt6+dhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 6/7] mfd: ls2kbmc: Able to be compiled as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260710-ls2kbmc-mod-v3-6-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-6-ef718636e78e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:35:28 +0000
Message-Id: <20260709173529.631DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] An explicit 10-second delay is executed inside a stop_machine(=
) context, halting the system and triggering the hard lockup detector.
- [High] Dynamic amendment of a global static, non-const mfd_cell array wit=
h a stack-allocated variable leaves a dangling pointer.
- [High] Premature disposal of the GPIO IRQ mapping by calling acpi_unregis=
ter_gsi() immediately after requesting it.
--

--- Patch [6]: [PATCH RFC v3 6/7] mfd: ls2kbmc: Able to be compiled as a mo=
dule ---
commit d873614dbdbdbcb510f15d96f0137b762016fd6d
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Able to be compiled as a module

This commit changes the MFD_LS2K_BMC_CORE Kconfig option from a boolean
to a tristate. This allows the Loongson-2K Board Management Controller
driver to be built and loaded dynamically as a kernel module.

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
>  	depends on PCI && ACPI_GENERIC_GSI
>  	select MFD_CORE
>  	help

Since this patch enables module unloading for the ls2k-bmc driver, I review=
ed
the existing driver code and found a few pre-existing regressions that are
impacted by or related to this change.

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does this dynamically amend a
global non-const mfd_cell array with a stack-allocated variable?

Because ls2k_bmc_cells is a shared global static array, if two BMC devices
are probed concurrently, thread A and thread B could race to write their lo=
cal
stack pointers into this global array. Thread A might pass thread B's stack
pointer to devm_mfd_add_devices().=20

If thread B has already returned, could thread A read from a popped stack
frame and yield garbage resolution data?

Does this also violate the MFD subsystem rule that mfd_cell arrays must be
static const?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    ...
}

[Severity: High]
This is a pre-existing issue, but does this prematurely dispose of the GPIO
IRQ mapping?

In ls2k_bmc_init(), acpi_register_gsi() maps an IRQ and devm_request_irq()
requests it. Immediately after, acpi_unregister_gsi() is called on the exact
same IRQ number. This invokes irq_dispose_mapping(), which tears down the
IRQ descriptor while the action is still linked.

Since this patch turns the driver into a module, module unloading is now
possible. When the module is unloaded, devm_irq_release() will fire on the
disposed IRQ.=20

Could this lead to a use-after-free or inadvertently free an unrelated IRQ
that reused the same descriptor?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

[Severity: Critical]
This is a pre-existing issue, but does this execute a 10-second delay inside
a stop_machine() context?

The stop_machine() function halts all CPUs in the system with local interru=
pts
disabled to serialize execution. Inside ls2k_bmc_recover_pci_data(), there =
is
an unconditional mdelay() for 10 seconds.

Could spinning a CPU with interrupts disabled for over 10 seconds trigger a
hard lockup panic and disrupt system timekeeping and networking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-ls2kbmc-mo=
d-v3-0-ef718636e78e@gmail.com?part=3D6
