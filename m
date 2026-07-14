Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C371B2D0C92;
	Tue, 14 Jul 2026 17:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050239; cv=none; b=JwyZJFc7XN1OS2TdF8xu537mkkBbveCvXJpsPYk2wBkoNdOk9voq9VNBBLyv7J1YhjleJyld8IksFisw3X3CuhzNzNKlYGW9HxGjNKWgjWcix4qeVzK8tLs3vZqGCU/G411dJQPeueGWFdkDy85k74AEh6h000WlxdL30a/QF9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050239; c=relaxed/simple;
	bh=sWl2td+hZTlIhzOI0fZkicZxGb90GB6nYrpn31udlJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h1W6yU4khlVbBkVdDCzEZe6bcQm3txgggY4o/j6XH5JneDjHEM0a0BQMwZrTaCf/Nrdoze9rW1QuKVdanexkiSRD8Hv0Zn6ydyKSoWb3DgDAwoU6v0PDguDFJPenbj5erTUMoADq8qtIxc19ad2rMqdYjNWKsMbHA7mJbIzt8bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEu+6Jy9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEu+6Jy9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B121F00A3A;
	Tue, 14 Jul 2026 17:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050238;
	bh=76WBpyVu0rfK7lpfBCQzIrSvE/6auMaPSRzdWGhrn0U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cEu+6Jy9ugEy0RqcVWQvaeWD3Lw09JA6Yt8JnNwonh2qbMrnzoBw6W8Y1n9BmLYY8
	 98GUbSDuiSwyKmPIHbPQ/mI66PlyR4uQAOmsE1gluGJy/7ZjNRmx2JyO5X2cHCiDEk
	 n66U9st7RLC31EAr59tZXJe3hwvZKWVBnj1kWDgrEvCUXzwLb1fImLfc8cDLwyoWbB
	 1SR6Drqsn1c/a6aBXU6v7eE3rsk9nIOLsA+pIBgWvBxcPlp39hbrVj9t5QqT96Hbdy
	 VAQcygPXNnnYtOv2Eh4cCGpEUXh4wCCBVY9iHDcAIoYEMMKdz5F7pkyfvdOrlVDk/B
	 7pQPlAkSxf46A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-7-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:30:37 +0000
Message-Id: <20260714173038.50B121F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `psci-reboot-mode` platform driver is completely unreachable d=
ead code because it lacks an `of_match_table` and is never instantiated as =
a child device by the parent PSCI or MFD driver.
- [High] Lockless read of `reset_cmd` in `psci_sys_reset()` can race with c=
oncurrent updates via `psci_set_reset_cmd()`.
- [Medium] The `PSCI_REBOOT_MODE` config is set to `bool`, which forces the=
 `REBOOT_MODE` framework to be built-in.
--

--- Patch [7]: [PATCH v23 07/13] power: reset: Add psci-reboot-mode driver =
---
commit 05cd2956034a357b1e7d5eab96bdce4575604285
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

power: reset: Add psci-reboot-mode driver

Add a psci-reboot-mode driver to handle different types of PSCI resets,
including predefined and vendor-specific resets, at one place. It registers
with the reboot-mode framework to interface these resets to userspace and
passes arguments to the PSCI driver for command-based reset.

> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 124afb99febe9..93e4029d95060 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -348,6 +348,16 @@ config NVMEM_REBOOT_MODE
>  	  then the bootloader can read it and take different
>  	  action according to the mode.
> =20
> +config PSCI_REBOOT_MODE
> +	bool "PSCI reboot mode driver"
> +	depends on OF && (ARM_PSCI_FW || COMPILE_TEST)
> +	select REBOOT_MODE

[Severity: Medium]
Will this force the REBOOT_MODE framework to always be built-in?

Since PSCI_REBOOT_MODE is defined as a bool, selecting the REBOOT_MODE
tristate will forcefully upgrade the entire reboot-mode framework to built-=
in
(=3Dy), which overrides user configurations that might prefer it as a modul=
e.

Also, since the driver source uses module_platform_driver and MODULE_LICENS=
E,
it appears designed to be built as a module. Should this be a tristate inst=
ead?

> +	help
> +	  Say y here will enable PSCI reboot mode driver. This gets
> +	  the PSCI reboot mode arguments and passes them to psci
> +	  driver. psci driver uses these arguments for issuing
> +	  device reset into different boot states.
> +
>  config POWER_MLXBF
>  	tristate "Mellanox BlueField power handling driver"
>  	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI

[ ... ]

> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset=
/psci-reboot-mode.c
> new file mode 100644
> index 0000000000000..955ed68f14026
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c

[ ... ]

> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
> +				  u32 *magic, int count)
> +{
> +	if (count < 1 || count > 3)
> +		return -EINVAL;
> +
> +	return psci_set_reset_cmd(magic[0], psci_reboot_mode_get_cookie(magic, =
count));

[Severity: High]
Can this call to psci_set_reset_cmd() race with the atomic restart handler?

Looking at drivers/firmware/psci/psci.c, psci_sys_reset() evaluates reset_c=
md
locklessly:

	if ((reset_cmd.reset_type || reset_cmd.cookie) && !panic_in_progress())
		psci_handle_reset_cmd();

And psci_set_reset_cmd() protects writes using a mutex:

	reset_cmd.reset_type =3D reset_type;
	reset_cmd.cookie =3D cookie;

If an atomic restart handler like psci_sys_reset() executes during a SysRq-B
emergency restart and interrupts a CPU executing psci_set_reset_cmd(), it c=
ould
observe a partially updated state.

Since the 64-bit cookie may be written via multiple instructions on 32-bit =
ARM,
could this lead to torn reads and mismatched reset types, causing the syste=
m to
hang during emergency restarts?

> +}

[ ... ]

> +static struct platform_driver psci_reboot_mode_driver =3D {
> +	.probe  =3D psci_reboot_mode_probe,
> +	.driver =3D {
> +		.name	=3D "psci-reboot-mode",
> +	},
> +};

[Severity: High]
Is this platform driver able to probe?

The driver lacks an of_match_table and is not instantiated as a child device
by any parent PSCI or MFD driver.

A platform driver without an of_match_table must be manually instantiated
(e.g., via mfd_add_devices in an MFD parent like psci-mfd.c). However,
psci_reboot_mode is not listed in psci_cells in drivers/mfd/psci-mfd.c, nor
does any code call of_platform_populate() on the PSCI node.

Does this make the newly introduced psci-reboot-mode functionality unreacha=
ble
dead code?

> +module_platform_driver(psci_reboot_mode_driver);
> +
> +MODULE_DESCRIPTION("PSCI reboot mode driver");
> +MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D7
