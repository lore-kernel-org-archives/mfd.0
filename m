Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030293;
	b=Dx9QElnbtevopsezdWirJYaoV+yl4iEFF+5DEycGf4MVVaN0AM7IAXjKvMNKsDxrYdy8
	 GIAZKzVuwb71yQw8qvdG/C9Cddjb2Mi3mRBR2Nf52LF71o91g5cGefBw4P7Ln15x1TJTO
	 NDxpiPtERm2PBBMKkBWSEZ2s3DCnvU6DEEOMb3oSGkXvW4YOQeFprVQw+YlGDvFJj4fNa
	 wi51W4VIuYUmc8Ok3MYBi8kWcmVhtjOnkVHuqTZ+iMI80fXlYHGSV2aBWVK8BH1Al66U2
	 tXUI1vSY7Dbh/F/+933dEL8kxZPRtci1rs0AuPu8F6oQONYFIKnHp6YlaJgQqJWwItA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xJX4Na1cyDCpImINIHbohdLaAUbpe+SHEiUcBVTDjp8=;
	b=YzHsVuBUk0AlnC2wuyvcRUsKFNE9HmLobj/wSaD45BTYR5MG8M0uzQFz/BDF3bfSgQia
	 nO9M4XGu8UC15fvO3VQdvhlCkLgUfAB+68XgHCpbOOHMdl0JOdUGPu7Ea9HKwORYYcIwC
	 bDywqE16ILavWf2ydaMgAtLEU+SYnyVDcqHyqlMu7hpd7CfKlSBjkEc4wGPiHcs+gbZ22
	 0HUTZtafSpI2F5N2YWn3Pyb6aKlQdBx+DlU6yxVSmuuWTgMl2avLczRS1ztfNfyY452bR
	 vTr/+a2qDRHQZczfRvVOnFqtML291On3MJrsgf2DZ0/og1wquTQqbGlBKViY71pSzZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WAPXq0XX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4655606A326
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 05:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WAPXq0XX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C7B1F0089F;
	Sat,  7 Nov 2026 05:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794030292;
	bh=xJX4Na1cyDCpImINIHbohdLaAUbpe+SHEiUcBVTDjp8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WAPXq0XXb4hqyQxl1LxS9yybnDWlZ8w8laW5JI08XsKUPCS8ixxG1aJO2xfi2ftYW
	 NrmXX/EbQYAtMXpBpFeuaL7NQ01saysUnJ0NDlRxT9nnTzJ7SCJ3IDxnwMV0QW830j
	 29yHLLctrfyaQcj5aMLnlDg383QQSdHW7LGNF/+wfcCGEkvSZUCLAJPhgkjqyYAkQm
	 ZV2pag0kLcR7QDTSjShyr57n8Ghey1eznfeYXUKVs2hg2vxIiKrjVOURvkOY1DRjrL
	 2CJp3m3IuQXAt1vP+UKnOzv/CbL3CoOs3gJahDqdAH87fOP+h8iXf4gHnWjFcclHVm
	 1gl8VYSeGocig==
Message-ID: <sashiko-outbox-202631@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: ls2kbmc: cancel the reset work before the driver
 data is freed
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261107053218.3326443-1-hj351016@gmail.com>
References: <20261107053218.3326443-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 05:44:51 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mfd: ls2kbmc: uncapitalized commit subject description after
  prefix
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] mfd: ls2kbmc: premature acpi_unregister_gsi() in
  ls2k_bmc_init() [1]
--

commit 9b65d53fe564989b2108b75ef86d6d68901a6034
Author: Hyunjung Ko <hj351016@gmail.com>

mfd: ls2kbmc: cancel the reset work before the driver data is freed

This commit replaces INIT_WORK() with devm_work_autocancel() in
ls2k_bmc_init() so that bmc_reset_work is cancelled before devres frees
ddata on driver unbind.

> mfd: ls2kbmc: cancel the reset work before the driver data is freed

[Severity: Low]
This isn't a bug, but MFD commit subjects capitalize the description after
the prefix (i.e. "mfd: ls2kbmc: Cancel the reset work...").

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..c44291e7c1c21 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> @@ -371,7 +372,10 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddat=
a)
> =20
>  	ls2k_bmc_save_pci_data(pdev, ddata);
> =20
> -	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
> +	ret =3D devm_work_autocancel(ddata->dev, &ddata->bmc_reset_work,
> +				   ls2k_bmc_events_fn);
> +	if (ret)
> +		return ret;
> =20
>  	ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
>  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);

[Severity: Critical]
This problem wasn't introduced by this patch, but in ls2k_bmc_init()
[1], does calling acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI) right
after devm_request_irq() tear down the active GPIO IRQ mapping?

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
	return ret;
}

Unregistering the GSI unconditionally leaves the GPIO watchdog interrupt
non-functional and disposes of the IRQ descriptor while devres still tracks
it, causing a use-after-free when devm_free_irq() runs on unbind or a later
probe failure.

[1] https://sashiko.dev/#/bug/linux-cab8bfb6-4077-46f3-a173-ac2e2042cf66

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107053218.3326=
443-1-hj351016@gmail.com?part=3D1
