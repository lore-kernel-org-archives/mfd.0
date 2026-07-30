Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C640A38B150
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431826; cv=none; b=dTkpCA66WyaWk0U6bQhmDjDtDBtSoBBFQ1HzgnuNPJPyhkt3ElnzSBpEUtwhAcC5g8N4jENomRJdB0q36zralg53Xl9sg4zI3LxAv7/UoLZIIsfs1V9R14uZ6Yxq0/WEPRN7JPrDtAjyd0Y3d6yTKnzpmaPZF4XyBjMXZvL9XIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431826; c=relaxed/simple;
	bh=oLLoXpdHT97o+SoJS5933mqIxSKVM1p7DvEHwtOO//c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JeRSJpazXsKRPbrBZXMpb1PkkTAlaVwdBk8qVGhcD+LkihPnI/1+YHstQsWBTKRFISDKRPRZ7CaQhaJlVEO3onEeGqg9Jsr25b1Rjo/Fasvl/4hJMImTjMHecNFN6Hvd98vSBbYDU6lClzvUpEGchSZ6vU7c4YDm3KWjshlVIEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TL2puKl7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TL2puKl7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216CD1F000E9;
	Thu, 30 Jul 2026 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785431825;
	bh=YcEL3RwYiJ2eZxo2exAghO7J7yYUvy/MevhIDyqTSOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TL2puKl7q3USe245Omy17ZqpLzSMO06FZhRqO6yPBN3zvze23OXgs+38iPtg+nRLY
	 wsZtCIJIN5gg1PBwrHGDCZr0jNF4usMo+i5WM+kA6i/kuv4wLIvtktoyAUeATFhMcr
	 EBKmL9lKVZ3wnYNiR5aBLQompT/4EV+XD38J5Tsb0rpWI0YLpVDREJLpyacWRgbTn8
	 oUTNqUfLr/q6gryZsHfpb/yWJHW9FcTr4JpcxoNagW/p01D0sCGjB6+htYeDWeftO+
	 pVHAcVE5ZCXhDF+OYkr3YSGDqGIZBkxO2ms+JEo/FDfYeFpGpcgS07woZttCOXvhz9
	 7PH9y3qGuaNgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 6/7] mfd: ls2kbmc: Able to be compiled as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260731-ls2kbmc-mod-v4-6-d201502ba239@gmail.com>
References: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
 <20260731-ls2kbmc-mod-v4-6-d201502ba239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 17:17:04 +0000
Message-Id: <20260730171705.216CD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] System Hang / Watchdog Panic due to 13+ second mdelay() in stop_ma=
chine()
- [High] Broken hardware interrupt due to immediate GSI unregistration
- [Medium] MFD Subsystem Violation: Dynamic modification of a global static=
 MFD cell array
- [Medium] Concurrency Bug: Interrupt handler uses a static local variable =
for rate-limiting
--

--- Patch [6]: [PATCH RFC v4 6/7] mfd: ls2kbmc: Able to be compiled as a mo=
dule ---
commit 25dc6cbaebb11df8a5a5578847da95bd91aa28f3
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Able to be compiled as a module
   =20
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
>  	depends on PCI && ACPI_GENERIC_GSI
>  	select MFD_CORE
>  	help

Since this patch allows the driver to be compiled as a module, it exposes
several pre-existing issues in drivers/mfd/ls2k-bmc-core.c.

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

[Severity: High]
This is a pre-existing issue, but does this trigger a watchdog panic?
Calling mdelay() for a long time inside a stop_machine() callback halts all
CPUs with local interrupts disabled. Can this destroy system latency, RCU
state, and inevitably trigger a kernel panic due to the Hard Lockup Detecto=
r?

drivers/mfd/ls2k-bmc-core.c:
    ...
static struct mfd_cell ls2k_bmc_cells[] =3D {
	[LS2K_BMC_DISPLAY] =3D {
    ...

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

[Severity: Medium]
This isn't a bug introduced by this patch, but does this dynamically modify=
 a
global static array using a local stack variable? The MFD subsystem mandate=
s=20
that mfd_cell arrays must be static const.

Modifying the global array with a stack pointer leaves a dangling pointer
after the probe returns, and introduces a race condition if multiple devices
are probed concurrently.

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
	ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
	if (ret)
		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpio_irq);

	acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
	return ret;
}

[Severity: High]
This is a pre-existing issue, but does this immediately tear down the hardw=
are
interrupt mapping on the success path? Unregistering the GSI calls
irq_dispose_mapping(), which destroys the mapping between the hardware
interrupt and the Linux IRQ number.

Will this prevent the interrupt from ever firing?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
	struct ls2k_bmc_ddata *ddata =3D arg;
	static unsigned long last_jiffies;

	if (system_state !=3D SYSTEM_RUNNING)
		return IRQ_HANDLED;

	/* Skip interrupt in LS2K_BMC_INT_INTERVAL */
	if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
		schedule_work(&ddata->bmc_reset_work);
		last_jiffies =3D jiffies;
	}
    ...
}

[Severity: Medium]
This is a pre-existing issue, but does this use shared state across all dev=
ice
instances to rate-limit interrupts globally instead of per-device?

If multiple BMC devices exist in a system, an interrupt on one device will
erroneously lock out interrupt handling on all other BMC devices for the
interval. Can this state be tracked within the device-specific private
structure instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ls2kbmc-mo=
d-v4-0-d201502ba239@gmail.com?part=3D6
