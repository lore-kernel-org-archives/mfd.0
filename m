Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9993FE35A
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373214; cv=none; b=OD2dEO6OBR7EtMyH6lk19bl9g8urpy4L6kAXTL2PbW15vkfsVyVWW0S3x9Gch5hPuVa+gNSsrj+j5W2rMDvvyWEdPCU3lu0UENZs2pPsCeNN0v3wYsNx3JpbQWlxls5RYEwptuj7d/H76Leleu4uPM+pfcaRHumDBcxU1eyZzis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373214; c=relaxed/simple;
	bh=oKY53E/zITkKK7IyTILSqvLF229Ju0fgKqQPDBbuLi0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=twBI50Bblr9lLxvO4H4QhKJ2Fn0yEOoXzoagHJnd70yKutyaykUStAqOcIKqHgSiz99fr8EsUFK3ucrUYeHpzEjnYhfOeKNg83mNgTn8aQCXw62fRnbYK1t46RNoxU9cua3IxZ+T/RyI32HRbxk9648G9V8LqltcUYY8a+21KPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpUGV9Tb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpUGV9Tb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BF81F00A3A;
	Mon, 10 Aug 2026 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786373212;
	bh=PqucGAYpJyue2jpy7q0s5pEPEmL7vj/b5hNmq6kykfU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hpUGV9TbH5CDdIwMuUl5XK/O7lZknC7f3R4DaLOCSTqpGK+/db11Lhh1R18rsRiXP
	 MAgpPobU2Uf7Eofoyy+NHJjhw1vOGUCV+aMMxC87BDWfB1ZQ4qS9dItdy203FcjoT6
	 oxUkIWwhcNX5iSDqlIU1NtuI9NuatJOBxpgH5mMU2z3ev9zlO+bC3MZswkR6Mmn/z2
	 QdwxmJtB2X30s1/IaSGusqoxIrPtI2JWMwiZwwryvOv+DIgPZC86rRW6OfWOWZa4mt
	 QOqmTExTUyrlOSY6pXtirEJPRUpFIzfvSyHw6RW28u+2vOuhCOzYOERRIAe3JqmL+v
	 U28Vz1T6dcc+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v8 8/8] mfd: ls2kbmc: Able to be compiled as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260810-ls2kbmc-mod-v8-8-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <20260810-ls2kbmc-mod-v8-8-16e44f7322f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 14:46:51 +0000
Message-Id: <20260810144651.D5BF81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] System panic/freeze due to >10 seconds delay inside `stop_mach=
ine` context.
- [High] Dangling pointer in global state and MFD guideline violation due t=
o dynamic modification of `mfd_cell` array.
--

--- Patch [8]: [PATCH RFC v8 8/8] mfd: ls2kbmc: Able to be compiled as a mo=
dule ---
commit 3dfba1198ec7bd502a9fc1a937060e6136a907cd
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Able to be compiled as a module
   =20
Make ls2kbmc able to be compiled as a module.

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

[Severity: Critical]
This is a pre-existing issue, but will using stop_machine() with long delays
cause system freezes?

When the driver is built as a module, or even built-in, ls2k_bmc_events_fn()
invokes stop_machine():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
	stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

The callback ls2k_bmc_recover_pci_data() executes a loop with mdelay(1) up =
to
2000 times, and later calls mdelay(LS2K_BMC_RESET_WAIT_TIME) which is
10000 ms:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
	for (i =3D LS7A_BAR0_CHECK_MAX_TIMES; i > 0 ; i--) {
		if (!ls2k_bmc_bar0_addr_is_set(parent))
			break;
		mdelay(1);
	}
    ...
	/* Waiting for U-Boot and DDR ready */
	mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

stop_machine() disables local interrupts and halts all online CPUs to run t=
he
provided callback. Busy-waiting for over 10 seconds with interrupts globally
disabled could consistently trigger a kernel panic via the NMI watchdog or
hard lockup detector, causing severe RCU stalls and dropped hardware events.

Is it possible to handle this PCI recovery without halting the entire machi=
ne
for 10 seconds?

[Severity: High]
This is a pre-existing issue, but could this code leave a dangling pointer =
in
the global MFD cell array?

Now that the driver can be compiled as a module, it can be unloaded and
reloaded, making this more likely to cause issues.

drivers/mfd/ls2k-bmc-core.c:
static struct mfd_cell ls2k_bmc_cells[] =3D {
    ...
};

In ls2k_bmc_probe(), the driver dynamically mutates this global array to
store a pointer to a local stack variable pd:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
	struct simplefb_platform_data pd;
    ...
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

After ls2k_bmc_probe() returns, the global array retains a dangling pointer
to a freed stack frame. If the driver is unbound and bound again, or if
multiple instances exist, subsequent probes might race or potentially reuse
this stale pointer before it gets overwritten, leading to a stack
use-after-free vulnerability.

Additionally, MFD subsystem guidelines require cell arrays to be static con=
st.

Can this be refactored to avoid mutating the global mfd_cell array with sta=
ck
addresses?

>  	depends on PCI && ACPI_GENERIC_GSI
>  	select MFD_CORE
>  	help

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v8-0-16e44f7322f4@gmail.com?part=3D8
