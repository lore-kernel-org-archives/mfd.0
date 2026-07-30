Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB640E8C5
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 17:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431567; cv=none; b=Hoj+zB7kiDJbs/Nqf7/oSDaYKYuYHkZg+8Jxh09LXN9jCS8nULxoPD1iXvNEsMQnQYP0gB9fSlra+XSZiH+VqyySaF2yk27ltoMUyZUdABD26c+Y0ynZNcTJ7mrgnegVMxmvrkuMnhCDnMhQlZGpGLC/+OR6CdS1IXw5HItk4R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431567; c=relaxed/simple;
	bh=DV3CvuYpkA1d98YW+wk+pdhCo1fma292S9u8KogjRHM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lQXd5v5FAub4xSZPsPkr6fph6Z5yMLerFWzs56JboWdUXZlsKqz/LFDPjYFBESqfdCSM//XUXU2xTHFSc3fa7o6+zmJd1mrxcbpjKAdlnTGOKax0SW7FnQSz8/9HrR5lqvM2Bi+Pt2MO0y97wq8WVokNX4v1pGxkXkHNoedcHUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+4ihHJy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+4ihHJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85911F000E9;
	Thu, 30 Jul 2026 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785431565;
	bh=XL6Y0gKojgasemu7Kogn50euvhKrjFzKVi/dDBEwRhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S+4ihHJy8XZmb1QA6tFJSUogZx2thO5Ten+MZTHUkJ0pXs6yaTkFp1gJknlwu/YHe
	 WdKkvP1+vUp8311KlMOd/jV+zCJArH/hPiypsewmmCCRBJ3jqs9Ub7i+fVoY1FUyHd
	 oPNdxkVqqQwoEjhZw+nNfcCet4c6PihBwiOS/17nsdsJ2wFAI4iaXahF7W79/7Yv3K
	 OgckdEeiuUo/GDqs4PWCFdMNQny077gZiyeXAbjDGaxd8VNM09VYTkCwZK6U5+Mjfo
	 wEE26bCUh9kRk271SgZZ7alocAqJJJuyg565OvEPgHcJm97ZO1wkaDUkvbKpl4UH/E
	 cgiT4WFOq9XwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 4/7] mfd: ls2kbmc: Cancel the work queue on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260731-ls2kbmc-mod-v4-4-d201502ba239@gmail.com>
References: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
 <20260731-ls2kbmc-mod-v4-4-d201502ba239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 17:12:45 +0000
Message-Id: <20260730171245.A85911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver mutates a global static `mfd_cell` array with a stack-a=
llocated platform data pointer, violating MFD rules and causing a race cond=
ition and potential use-after-free.
- [High] `acpi_unregister_gsi()` is unconditionally called immediately afte=
r successfully requesting the GPIO interrupt, destroying the active IRQ map=
ping.
- [High] A 10-second busy-wait (`mdelay`) is executed inside `stop_machine(=
)`, which will reliably trigger the NMI watchdog and panic or freeze the sy=
stem.
--

--- Patch [4]: [PATCH RFC v4 4/7] mfd: ls2kbmc: Cancel the work queue on re=
moval ---
commit c84fa18464ab08c1c1ddbc9fda0a717e97dc86d4
Author: Miao Wang <shankerwangmiao@gmail.com>
Subject: mfd: ls2kbmc: Cancel the work queue on removal

When the device is being removed, the work queue should be canceled to
avoid any pending work to be executed after the device is removed.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index a5465c42a77b8..1466b314fc4e5 100644
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

[Severity: High]
This isn't a bug introduced by this patch, but looking at
ls2k_bmc_events_fn():

	stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);

Which then initiates a highly atomic context where all CPUs are halted, and
ls2k_bmc_recover_pci_data() executes:

	mdelay(LS2K_BMC_RESET_WAIT_TIME);

Does a 10-second busy-wait inside stop_machine() trigger the NMI watchdog
and freeze the system, since it spins with local interrupts disabled on all
CPUs?

> =20
> +	ret =3D devm_add_action_or_reset(ddata->dev, ls2k_bmc_cancel_wq, ddata);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
>  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);
>  	if (ret) {

[Severity: High]
This isn't a bug introduced by this patch, but later in ls2k_bmc_init(),
acpi_unregister_gsi() is unconditionally called:

	ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
			       IRQF_SHARED | IRQF_TRIGGER_FALLING,
			       "ls2kbmc gpio", ddata);
	if (ret)
		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n",
			gpio_irq);

	acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
	return ret;
}

Since this executes unconditionally on the success path after requesting
the IRQ, does it destroy the active IRQ mapping? When the driver is
unbound, will devm's automated free_irq() then operate on a disposed IRQ
descriptor?

[Severity: High]
This isn't a bug introduced by this patch, but looking at
ls2k_bmc_probe():

	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
	ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);

Does mutating the global static ls2k_bmc_cells array with a
stack-allocated platform data pointer (&pd) leave a dangling pointer in
global state after the probe returns?

Could this also cause a data race if multiple device instances probe
concurrently? MFD subsystem rules require mfd_cell arrays to be static
const, and dynamic platform data should not be passed this way.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ls2kbmc-mo=
d-v4-0-d201502ba239@gmail.com?part=3D4
