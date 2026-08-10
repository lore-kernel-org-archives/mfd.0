Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D213AB496
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365472; cv=none; b=YYWMiDbPGlZKMlwLFCDCcDBLrtt02j5/QDvOphsgIcQwqghvPiegGxAtFF4feJr2MjApVPZ7jYK6gXl6fxufFP8Mpwumeb+mCr6gY/WauTgSd/uS23k4rOo3xV6pV0ney6gKbbBD5IAPhAWeu7P5Hc6EeAOV3eEu0YaqtREpeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365472; c=relaxed/simple;
	bh=PlObEQtVa1nErRVQQcyuMceWKXeKVspEPMquumtKrZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iB+ROuNMqcJp42i7dUMaEqZEO0lFPu1rduIjl46uGfvR9zOnOhWO4dQ0rTn9i+B6jn1KoibD3xUXx9TtoPCBimA6mI3EB7BwvrC+zPfsgl5NRLvVi4MIE0Xwo/yf7mbTdsSiRY3eC4dEK5A3D1LqOkkvDWZZz+X9O+/KAf268gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giazGnze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giazGnze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E201F000E9;
	Mon, 10 Aug 2026 12:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786365470;
	bh=z+eQdcn9y2ReN5mc6RPY/4En5D5KNjFJgWv0gLx66dw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=giazGnzeoGAHpCDP/u49Ae+SHTxXOMqNWBKEnLxtjlTIsHTb8ZI25IuaexW8mv55W
	 Ag7Ki0NsQA3GeOcKchz5zOKA2AFajwXExsthI2PJi/hkGMy/TKb/ckND+/7Nc+G9iN
	 ViGLvemdE28giVOp88lA+qt26EctaknShGWpW/d/O/JrjSf19NRvJ+pmTnVUuKUynR
	 1rnC1r0OR12NET48iat0FkBwKnln4zIKnlyW0ntcaRB5EMMXpE0mn0tAQa3+wJK/gT
	 LUZT5DSKgpp4C9zOKAdWZFdrJRsLqo+ClFCcx/1gfI21BAcqIob4XsTS6oi1yGyy/l
	 H86/2hKAwQnSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 4/8] mfd: ls2kbmc: Cancel the work queue on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260810-ls2kbmc-mod-v7-4-8aa0fb5a5462@gmail.com>
References: <20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com>
 <20260810-ls2kbmc-mod-v7-4-8aa0fb5a5462@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 12:37:49 +0000
Message-Id: <20260810123750.93E201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] The reset workqueue runs `stop_machine()` containing a 10-seco=
nd `mdelay()`, freezing the entire system with local interrupts disabled.
- [High] The driver dynamically modifies the global `ls2k_bmc_cells` array =
during `probe()` to set `platform_data` to a stack-allocated pointer, viola=
ting MFD guidelines.
- [High] The shared IRQ handler blindly returns IRQ_HANDLED without verifyi=
ng the interrupt source, preventing spurious interrupt detection.
- [High] The driver unconditionally unregisters the ACPI GSI immediately af=
ter successfully requesting the GPIO IRQ, destroying the active IRQ mapping.
- [Medium] The `last_jiffies` variable in the interrupt handler is declared=
 as `static`, inappropriately sharing rate-limiting state globally across a=
ll devices and interrupt lines.
--

--- Patch [4]: [PATCH RFC v7 4/8] mfd: ls2kbmc: Cancel the work queue on re=
moval ---
commit c07197c793489ef5a3fafe072398e2f5a992c868
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Cancel the work queue on removal

When the device is being removeed, the work queue should be canceled to
avoid any pending work to be executed after the device is removed.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 06ec8143d8cdb..5eea53f134215 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -375,6 +375,12 @@ static void ls2k_bmc_save_pci_data(struct pci_dev *p=
dev, struct ls2k_bmc_ddata *
>  	pci_read_config_dword(pdev, PCI_INTERRUPT_LINE, &ddata->bmc_pci_data.in=
terrupt_line);
>  }
> =20
> +static void ls2k_bmc_cancel_wq(void *data)
> +{
> +	struct ls2k_bmc_ddata *ddata =3D data;
> +	(void) cancel_work_sync(&ddata->bmc_reset_work);
> +}
> +
>  static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(ddata->dev);
> @@ -385,6 +391,10 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddat=
a)
> =20
>  	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
> =20
> +	ret =3D devm_add_action_or_reset(ddata->dev, ls2k_bmc_cancel_wq, ddata);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
>  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
>  	if (ret) {

While reviewing this patch, I noticed a few pre-existing issues in the driv=
er:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    struct simplefb_platform_data pd;
    ...
    ret =3D ls2k_bmc_parse_mode(dev, &pd);
    if (ret)
        return ret;

    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to assign a local
stack variable to a global structure?

The ls2k_bmc_cells array is global, but the platform_data is pointing to pd,
which is allocated on the stack. Once ls2k_bmc_probe() returns, wouldn't th=
is
leave a dangling pointer in the global array?

Also, dynamically modifying global cell arrays appears to violate MFD subsy=
stem
guidelines.


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    /* Waiting for U-Boot and DDR ready */
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    if (!ls2k_bmc_bar0_addr_is_set(parent))
        return false;
    ...
}

[Severity: Critical]
This is a pre-existing issue, but can this 10-second delay cause a system
panic?

Since stop_machine() parks all CPUs and disables local interrupts, won't
executing mdelay(10000) inside ls2k_bmc_recover_pci_data() trigger the NMI
watchdog or cause a hard lockup?


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
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
This isn't a bug introduced by this patch, but should last_jiffies be
declared as static here?

Because the variable is static, its state is shared globally across both the
PCI-E and GPIO IRQ lines, and across all instances of the device. Does this
create a data race if interrupts fire concurrently, or cause one interrupt
line to inappropriately throttle the other?


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    /* Skip interrupt in LS2K_BMC_INT_INTERVAL */
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }

    return IRQ_HANDLED;
}

[Severity: High]
This is a pre-existing issue, but does this handler correctly check if the
hardware actually generated the interrupt?

Both the PCI-E and GPIO IRQs are registered with IRQF_SHARED. Since this
function unconditionally returns IRQ_HANDLED without checking hardware
registers, would it suppress the spurious interrupt detector and cause an
interrupt storm if another device on the same shared IRQ line fires?


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    gpio_irq =3D acpi_register_gsi(NULL, LS2K_BMC_RESET_GPIO_GSI, ACPI_EDGE=
_SENSITIVE,
                                 ACPI_ACTIVE_LOW);
    if (gpio_irq < 0)
        return gpio_irq;

    ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
                           IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpi=
o", ddata);
    if (ret)
        dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpi=
o_irq);

    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    return ret;
}

[Severity: High]
This isn't a bug introduced by this patch, but does acpi_unregister_gsi()
destroy the active IRQ mapping?

If acpi_unregister_gsi() calls irq_dispose_mapping(), won't the underlying
descriptor be freed while the IRQ handler remains registered? Will incoming
hardware interrupts fail to be delivered, or could devm_free_irq() attempt a
double-free during device teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v7-0-8aa0fb5a5462@gmail.com?part=3D4
