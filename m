Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BEA415F0B
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871452; cv=none; b=fOINbxYxhiD2HT1uYZnkfYVPl6qPA2D+8Y390oaKfFzSrQ+rDlyZEfcwgHpNQxFb5nRTDha6WQw4cn8488ib0BxHge/IU6b0YRNHiSRJPAyCYrT1da8aWReQWZ2SbdYDaeMyIXz0/Csk2A60GoI/gpzrZE3c5IErMxYgE5aCraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871452; c=relaxed/simple;
	bh=snkrM5N9hy9MrM5yPnRaIpy8zBC7cBR4bSOebJ8QxnA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RlfjI6JKOihi4p8GvPw7DZGC8gO/ecca7BZ6yIazmvCQr9pgBU9KjGhtkvIDow2jmCnwg0WMnZiGPRXCmgpV/ImbVGgloNZ8nrQKA/EeJG/HYHA/BA0HPZ9vdo0rq+GWMPaJj9wtnbcAGSeW0p8AgzHIwGADh3pZJnMmxEMegYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ME87uUgn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ME87uUgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7008D1F000E9;
	Tue,  4 Aug 2026 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785871450;
	bh=yRonKfHjgm2kEDrJVMdw3Z023TW2C5DFT//dywiInmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ME87uUgnWQpRxjDfkdslf8TGiH6MNl3rlWJrfZ1QQnGMAIuyeYOyjEBNuuqC8JLCZ
	 0mlvKtqYKck5+3zpNava1Ms7xF4iG3u4MgbM9mtNRuumYITstsxCEvkKDg4eVCLFES
	 4HR40HPZlDuZeIV8GiTjNkK3FhGN39s2rONdBOEdOtpEjtBHPkFuz3XXf6oAMgNgo8
	 hu/VD4AMJO4vDiXHEkeeIikoJsHsRSyyFJJi3h4Jo6JsFFtFvS+klLGKbco+18+tgl
	 Y/4VZlNlXbHYToPQ36EuoPD76HCSNl8gB2DDi/VU2jRb2NIkVSjSG25PgOTWPjtFwx
	 qXp5334r6t1ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 4/7] mfd: ls2kbmc: Cancel the work queue on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260805-ls2kbmc-mod-v6-4-16ccde412d86@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-4-16ccde412d86@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:24:09 +0000
Message-Id: <20260804192410.7008D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The work queue callback executes a prolonged 10-second busy-wa=
it delay (`mdelay(10000)`) inside `stop_machine`, triggering an immediate N=
MI watchdog panic.
- [High] Calling `acpi_unregister_gsi` immediately after requesting the IRQ=
 destroys the IRQ mapping while it is actively in use.
- [High] Dynamically modifying the global `mfd_cell` array with a stack-all=
ocated platform data pointer violates MFD guidelines and creates a race con=
dition and use-after-free vulnerability.
- [High] The interrupt rate-limiting logic uses a 0-initialized shared stat=
ic variable, causing global cross-device interference and silently ignoring=
 all interrupts for the first ~6 minutes of system uptime.
--

--- Patch [4]: [PATCH RFC v6 4/7] mfd: ls2kbmc: Cancel the work queue on re=
moval ---
commit fad0e9633fb652b609b571c7eefab49f76d46696
Author: Miao Wang <shankerwangmiao@gmail.com>

    mfd: ls2kbmc: Cancel the work queue on removal
   =20
    When the device is being removeed, the work queue should be canceled to
    avoid any pending work to be executed after the device is removed.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index e12f2ca2fbef3..e7bebfe696ac4 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but does this destroy the IRQ mapping while
it is still actively in use?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
...
	gpio_irq =3D acpi_register_gsi(NULL, LS2K_BMC_RESET_GPIO_GSI, ACPI_EDGE_SE=
NSITIVE,
				     ACPI_ACTIVE_LOW);
	if (gpio_irq < 0)
		return gpio_irq;

	ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
	if (ret)
		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpio_irq);

	acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	return ret;
}

Calling acpi_unregister_gsi() immediately after requesting the IRQ destroys
the mapping via irq_dispose_mapping(), which permanently breaks the BMC
reset GPIO interrupt handler on every initialization.

[Severity: High]
This is a pre-existing issue, but does this create a use-after-free by savi=
ng
a stack pointer into a global array?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
	struct simplefb_platform_data pd;
...
	ret =3D ls2k_bmc_parse_mode(dev, &pd);
	if (ret)
		return ret;

	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Writing the stack-allocated &pd pointer to the global ls2k_bmc_cells array
leaves a dangling pointer once probe() returns. Furthermore, modifying a
global mfd_cell array at runtime violates MFD subsystem rules, which require
cell arrays to be static const.

[Severity: High]
This is a pre-existing issue, but will this silently drop interrupts for
the first several minutes of system uptime?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
	struct ls2k_bmc_ddata *ddata =3D arg;
	static unsigned long last_jiffies;

	if (system_state !=3D SYSTEM_RUNNING)
		return IRQ_HANDLED;

	/* Skip interrupt in LS2K_BMC_INT_INTERVAL */
	if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Since jiffies is initialized to -300 * HZ at boot and the shared static
last_jiffies is 0, time_after() evaluates to false until jiffies crosses
the positive threshold. Doesn't this result in all hardware interrupts being
ignored for approximately the first 6 minutes of system uptime? Also, using
a shared static state causes interference if there are multiple device
instances.

[Severity: Critical]
This is a pre-existing issue, but does this cause an NMI watchdog panic?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
...
	/*
	 * The PCI-E is lost when the BMC resets, at which point access to the PCI=
-E
	 * from other CPUs is suspended to prevent a crash.
	 */
	stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
        ^^^^^^^^^^^^

Which executes ls2k_bmc_recover_pci_data() on all CPUs with local interrupts
disabled:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
...
	/* Check if PCI-E is connected */
	if (!ls2k_bmc_pcie_is_connected(parent, ddata))
		return false;

	/* Waiting for U-Boot and DDR ready */
	mdelay(LS2K_BMC_RESET_WAIT_TIME);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

LS2K_BMC_RESET_WAIT_TIME is 10000. Invoking mdelay(10000) inside
stop_machine() forces the entire system to stall with interrupts disabled f=
or
10 seconds. Will this trigger the NMI watchdog hard lockup detector and
result in a kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ls2kbmc-mo=
d-v6-0-16ccde412d86@gmail.com?part=3D4
