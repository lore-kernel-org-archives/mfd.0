Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14B23839A3
	for <mfd@lists.linux.dev>; Thu, 30 Jul 2026 17:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432370; cv=none; b=MHO6qdX4sVjoJjdzMyofGjStzhwTFmyLE1ovcMqRiPu2q/QQG9rRGrQkTt+1L2/h1w8NAentLwwtUqRYioysqYNVcjdJlPqniKxH3GXHJ9ZXkawLdnlhD8vCB/rYFx+CVZA1k4oteMSurOCsT78f97s7E7FYXCi/9l7Ce+Uf+lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432370; c=relaxed/simple;
	bh=o0a6/5AJ4C2AwKbaUZI32D1+B86MaiaWVO6Zrql+NPA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cyUXoNT1spWijWIlwLUdlmGAum79XGWCndyEdrkGN9wn02tc6zCt+Q/0DqSCtsgR1VrFwBOLupmGKRWF7YO0bJx63AnfruSoGXnN/bZxjtWaZzMrT3l9tjyrZfFLEl5dHxXfLpuyN4g5K4wMkO5saUk+TQWLwFXtHBH+HJEPEaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCUhuQ90; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCUhuQ90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077D31F000E9;
	Thu, 30 Jul 2026 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785432368;
	bh=8ixCkEg1v+/YHzMJrgIV6VMc4ycMZPi0c0ZTDEQWWX4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VCUhuQ90bQhWQlRPuX4xvt2PCxqIiH+omGndVHwM9dY7hHAAK94XObZH7QV6gk1SG
	 gq6z9QXqimycGNJ+alG9hCcBG5guewcxTWiucwr3y9bSyTvHr1YrI0mZ5/NX9uk+Oe
	 0NvcY7ZZVFcgU90ovlLZEd9IbwvxR3wAzsp6TCHomDYOMV3FXiH1JGNjKmoF30rt1W
	 aRfL+IN0hkRIIrmjMLo55PC8EHV97iVg2ZldHoqPLlOBGMEQi6DH+Cs8+djd6y0A0/
	 XfNObU0YYFoeGBuO+Iz4oSqCSQYhwPOF3wwyPCeEZkQ5VSp2qxa+az86rz/eeKA3Ru
	 jyBCRA0k/OSew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260731-ls2kbmc-mod-v4-1-d201502ba239@gmail.com>
References: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
 <20260731-ls2kbmc-mod-v4-1-d201502ba239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 17:26:07 +0000
Message-Id: <20260730172608.077D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The patch introduces unintentional strict validation on the BMC mo=
de string format, breaking backward compatibility for previously valid stri=
ngs.

Pre-existing issues:
- [Critical] Massive busy-wait delays inside atomic stop_machine context.
- [High] The ACPI GSI mapping is destroyed immediately after being requeste=
d, breaking the interrupt and creating an unbalanced lifecycle.
- [High] The driver modifies a global `static struct mfd_cell` array during=
 probe, violating MFD subsystem guidelines and creating a concurrency race =
condition.
- [High] Unconditional IRQ_HANDLED in shared interrupt handler breaks inter=
rupt sharing.
--

--- Patch [1]: [PATCH RFC v4 1/7] mfd: ls2kbmc: Make a copy when parsing mo=
de string ---
commit 08b5951096b7b6051b970b868f431e24b8983d1a
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Make a copy when parsing mode string

When parsing the mode string from BMC, the string is manipulated
in-place with strsep(), preventing from parsing it again. Make a copy of
the original string and manipulate the copy instead to fix this.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..27f6e096404d6 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -427,34 +427,54 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_pla=
tform_data *pd)
>  {
[ ... ]
>  	/* The resolution field starts with the flag "video=3D". */
>  	if (!strncmp(mode, "video=3D", 6))
>  		mode =3D mode + 6;
> +	else
> +		goto invalid_mode;

[Severity: High]
Will this make the "video=3D" prefix mandatory, causing valid strings that
previously worked without this prefix to be rejected?

> =20
> -	ret =3D kstrtoint(strsep(&mode, "x"), 10, &pd->width);
> +	ret =3D kstrtouint(strsep(&mode, "x"), 10, &pd->width);
>  	if (ret)
>  		return ret;
> +	if (mode =3D=3D NULL)
> +		goto invalid_mode;
> =20
> -	ret =3D kstrtoint(strsep(&mode, "-"), 10, &pd->height);
> +	ret =3D kstrtouint(strsep(&mode, "-"), 10, &pd->height);
>  	if (ret)
>  		return ret;
> +	if (mode =3D=3D NULL)
> +		goto invalid_mode;
> =20
>  	ret =3D kstrtoint(strsep(&mode, "@"), 10, &depth);
>  	if (ret)
>  		return ret;
> +	if (mode =3D=3D NULL)
> +		goto invalid_mode;

[Severity: High]
Is it possible that this rejects strings missing an explicit refresh rate
(e.g., "@60")?=20

Since strsep() sets mode to NULL when the delimiter is absent, these new
checks could force the string to have an "@", rejecting valid fbdev
configurations that worked previously.

[ ... ]

[Severity: High]
This is a pre-existing issue, but the ACPI GSI mapping appears to be destro=
yed
immediately after being requested in ls2k_bmc_init():

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    return ret;
}

Can this unconditional unregistration break the hardware interrupt mapping =
just
acquired, preventing the interrupt from ever reaching the driver handler?


[Severity: High]
This isn't a bug introduced by this patch, but the driver modifies a shared
static array during probe:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

Could writing a stack pointer (&pd) to a global variable violate MFD subsys=
tem
guidelines?=20

If multiple instances of this driver were probed concurrently, they might r=
ace
to overwrite the shared .platform_data pointer, causing a use-after-free
during platform device registration.


[Severity: High]
This is a pre-existing issue, but the shared interrupt handler seems to
unconditionally return IRQ_HANDLED:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    return IRQ_HANDLED;
}

Since the driver requests its interrupts with the IRQF_SHARED flag, does
returning IRQ_HANDLED without verifying interrupt ownership break interrupt
sharing and unconditionally claim all interrupts on the shared line?


[Severity: Critical]
This is a pre-existing issue, but there appear to be massive busy-wait dela=
ys
inside an atomic stop_machine context:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
    ...
    stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
    ...
}

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    /* Waiting for U-Boot and DDR ready */
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

Stop_machine() freezes all CPUs and disables interrupts globally.=20

Could spinning for 10 seconds inside ls2k_bmc_recover_pci_data() cause syst=
em
lockups and trigger NMI watchdogs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ls2kbmc-mo=
d-v4-0-d201502ba239@gmail.com?part=3D1
