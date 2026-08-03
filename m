Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E5E3C3C0E
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 17:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776787; cv=none; b=Xkedesd1uS6pTmlNjprfKeFsxmy4Tgl8kmUSNZ01TiYMyijQpgS77RaFG5TVa8ya786q1qb0BGI6g6elu200pO2zDPBCQNoUJbIg3wsIrVdeGgcyaBWPhUBj1K7sEvfyM4gd1tHSKBW1WQ4X7g6Zq0xPzYWKQTkct3Wcnnq6HLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776787; c=relaxed/simple;
	bh=M1Y93DjY6HpIBz8kPiVy1F76RlUV0fJ/+sCtUC9quec=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FeYGLs4/r3YeEncV0HuCSWlyCdkPD3wXOvYJmgQ8GIYLyU164VBoTrQAKEsh7m4cVnRuunaDcaSPQoETq0FWjB5A9sagKEEZz1BWGKbkUlw9QQ8aDDimdsiRRbYhuooolJymaPCmH+qOg4mcOgJtkmo2k8G8AwHJAYoyLcDUdoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRnDtKNm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRnDtKNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC911F000E9;
	Mon,  3 Aug 2026 17:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776785;
	bh=2CvLHbb/T0DV4ckUp0EL2lSa8dHVoarHdPKrVzKFx6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iRnDtKNmf/gDFPonUQz9tqaTq2SFJXDgMkcHYgfIShyW1N6k59Erw8XF9iR6pBqje
	 IWlJsLjpOaJY2dWSrdeul5NGcVX7tieIzCoqS6TbD3/DJJKWoRwuu3KbrjXOI2YuPN
	 KP0QAIdTgG4JUD9MBGmz9OwxZmEEVtQko9Nq6dZZBI5G4460i3OnQm4A/KQTsgAz1X
	 7cbiDohodPPQrdxdfE8jWcxc5r33opF8YRKjHI9F4sxQRwROiM/AuG1jydh008K8zm
	 suNSo965n6RuJmRIgAiUNbi4/rt7LjhpLesrYvqLmJCEPVAHx0Ndl4xuoN9VDdb2a4
	 W5VrDFbEpu06Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 4/7] mfd: ls2kbmc: Cancel the work queue on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260804-ls2kbmc-mod-v5-4-e6bc5cdd9a93@gmail.com>
References: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
 <20260804-ls2kbmc-mod-v5-4-e6bc5cdd9a93@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 17:06:24 +0000
Message-Id: <20260803170625.6DC911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dynamic amendment of the global `mfd_cell` array using a stack var=
iable, violating MFD subsystem guidelines and risking data races.
- [High] Premature unregistration of the ACPI GSI mapping immediately after=
 requesting the IRQ, effectively destroying the mapping while in use.
- [High] The BMC recovery function executes inside `stop_machine()` causing=
 a 10-second hard stall and attempting to sleep via `pci_iomap()`.
- [Medium] Rate-limiting in IRQ handler uses a global static variable inste=
ad of per-device state, causing cross-device interference and unprotected d=
ata races.
--

--- Patch [4]: [PATCH RFC v5 4/7] mfd: ls2kbmc: Cancel the work queue on re=
moval ---
commit 65ab5d9b597ea3db5f87628df49d0fa3a7bc805f
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Cancel the work queue on removal

This commit cancels the BMC reset work queue upon device removal. It uses
devm_add_action_or_reset() to ensure any pending reset work is aborted
before the device goes away, avoiding use-after-free or execution after
removal.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index e12f2ca2fbef3..e7bebfe696ac4 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -385,6 +391,10 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddat=
a)
> =20
>  	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);

[Severity: High]
This is a pre-existing issue, but does scheduling ls2k_bmc_events_fn()
lead to a hard stall and attempt to sleep in an atomic context?

Looking at the work handler, it executes the recovery function inside
stop_machine():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
}

Because stop_machine() executes with local interrupts strictly disabled
on all CPUs, the 10-second delay in ls2k_bmc_recover_pci_data():

    mdelay(LS2K_BMC_RESET_WAIT_TIME);

could trigger NMI watchdogs and hard lockups. Additionally, it calls
ls2k_bmc_pcie_is_connected(), which uses pci_iomap() and ioremap(). Does
calling blocking memory allocation and mutex functions in this atomic conte=
xt
trigger a scheduling while atomic bug?

> =20
> +	ret =3D devm_add_action_or_reset(ddata->dev, ls2k_bmc_cancel_wq, ddata);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
>  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);

[Severity: Medium]
This is a pre-existing issue, but does the rate-limiting inside this shared
interrupt handler cause cross-device interference and unprotected data race=
s?

The handler locklessly checks and updates a static variable:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    static unsigned long last_jiffies;
    ...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }
}

If multiple devices exist, they share the same rate-limit state. Since both=
 a
PCI IRQ and a GPIO IRQ share this handler, can concurrent firings on differ=
ent
CPUs race to read and update this static variable? Should this state be mov=
ed
to the per-device ls2k_bmc_ddata structure and protected by a spinlock?

[Severity: High]
This isn't a bug introduced by this patch, but does the initialization
unconditionally destroy the GSI mapping while the IRQ is actively armed?

Looking further down in ls2k_bmc_init(), right after the IRQ is successfully
requested via devm_request_irq(), the GSI is unregistered:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    return ret;
}

Because acpi_unregister_gsi() calls irq_dispose_mapping(), does this destroy
the IRQ descriptor and break interrupt delivery, potentially causing crashe=
s if
the IRQ fires?

[Severity: High]
This is a pre-existing issue, but does ls2k_bmc_probe() violate the MFD
subsystem guidelines by mutating a global mfd_cell array and leaving a
dangling pointer?

The global array is defined as a mutable array instead of static const:

drivers/mfd/ls2k-bmc-core.c:
static struct mfd_cell ls2k_bmc_cells[] =3D { ... };

In the probe function, the address of a local stack variable is assigned to
this global array:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    struct ls2k_bmc_platform_data pd;
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
}

Because this modifies a shared global array, can probing multiple devices
concurrently cause a data race? Also, does assigning a stack-allocated
pointer leave a dangling pointer after the probe completes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-ls2kbmc-mo=
d-v5-0-e6bc5cdd9a93@gmail.com?part=3D4
