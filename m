Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7837637CD28
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 02:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304826; cv=none; b=ZLDttriQWZ8GImB2IECOANAa6Fqrh1WLIr1tsfyDKvENU+Zy5HTp/h209NWE8lgDXZehLPFgvr5ZziYlfgxxP7hVZW3LCF1Pfh5m7rux+dNqLU54bIKVS/Ir4SBjjlgtrsZ+kZlF3n/ykLO+e919uXwOo4BO8XZ5GqA1Z4BpoNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304826; c=relaxed/simple;
	bh=eJnrpldktT722qo7yMpqV9rJfWEdBVTW8r7E1Wpw4pE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fypH/DmjriFN+cgntj94SSJx6l1n2ug4HSTIaybzJq9/Ll5zmMqdbLUYLYFo/YjbE6vCdPl0l+hLNLh9SHDBSF9C7pwQDFNwXAZNBKRbaH3obK0sgf47v4rQ31zwFmOpdJp+T4rksJE9n6l6BtStpukOrl6kqdWR8oRQzvTvejw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHWkLWKe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHWkLWKe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3481F000E9;
	Mon,  6 Jul 2026 02:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783304825;
	bh=azMOYbVzZE6/Gl8Q7df6AJ2dN0eqbd7bf72b9LKiIxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JHWkLWKer6rJNuyIyY4wTQgWXFh3Itx/gT2cNecIBU83SsMFOgnp47/Yn7UHt2/qk
	 yNdHoigdJQ4j4NoiKrzKqNaeawIPMvP0igNic9i0WUvAJJjM8rqx4tpTljda/wFapD
	 YYBRvff5s3RzBVcMhTBsloIfKbIrUC6TjtDZVEzYZUB1VrzUZrodowI/KiQ4MbATfp
	 UZEw3cjesNxL2KFSfSshvqT1Tqpm82JlstvX89kHftWsjYtTKYfa2vWw90pbuGlR0A
	 oJrvTBPa2hRtVYvjhOx0y9T3wFFS7oeStS4k/qnONMMQqF/tC8yKnjRyik1nI0a05R
	 rk4AL8FSWchtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: ls2kbmc: mfd: ls2kbmc: Fix iomem pointer
 handling in video mode parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260706021909.2346535-1-zhoubinbin@loongson.cn>
References: <20260706021909.2346535-1-zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 02:27:03 +0000
Message-Id: <20260706022704.CA3481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Out-of-bounds read and write due to missing null termination on km=
alloc buffer.
- [Medium] Implicit breakage of backwards compatibility by strictly requiri=
ng 'video=3D' prefix.

Pre-existing issues:
- [High] NULL pointer dereference in resolution string parsing.
- [High] 10-second busy-wait inside stop_machine() callback.
- [High] Use-after-free of ddata on probe failure or device unbind.
- [High] Shared interrupt handler unconditionally returns IRQ_HANDLED.
--

commit 6f5ec8b16462761d3de782394ef96b6a09a36913
Author: Binbin Zhou <zhoubinbin@loongson.cn>

mfd: ls2kbmc: mfd: ls2kbmc: Fix iomem pointer handling in video mode parsing

This commit fixes iomem pointer handling in the video mode parsing logic.
It uses __iomem annotated pointers for all iomem map calls and creates a
local copy of the mapped IO memory using memcpy_fromio() and memcpy_toio().

Closes: https://lore.kernel.org/oe-kbuild-all/202603021730.Yy3QXYTw-lkp@int=
el.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202606120639.WG6eb8VU-lkp@int=
el.com/

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..a2aee21315292 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -427,27 +430,39 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_pla=
tform_data *pd)
>  {
> -	char *mode;
> +	char *mode __free(kfree) =3D NULL;
> +	void __iomem *base;
> +	char *pos =3D NULL;
>  	int depth, ret;
> =20
>  	/* The last 16M of PCI BAR0 is used to store the resolution string. */
> -	mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M,=
 SZ_16M);
> +	base =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M,
> +			    LS2K_RESOLUTION_STR_LEN);
> +	if (!base)
> +		return -ENOMEM;
> +
> +	mode =3D kmalloc(LS2K_RESOLUTION_STR_LEN, GFP_KERNEL);
>  	if (!mode)
>  		return -ENOMEM;
> =20
> +	memcpy_fromio(mode, base, LS2K_RESOLUTION_STR_LEN);
> +
>  	/* The resolution field starts with the flag "video=3D". */
> -	if (!strncmp(mode, "video=3D", 6))
> -		mode =3D mode + 6;
> +	if (strncmp(mode, "video=3D", 6)) {
> +		dev_err(&pdev->dev, "Simpledrm resolution missing or corrupt!\n");
> +		return -EINVAL;
> +	}

[Severity: Medium]
Does this explicit failure break compatibility with older firmware?

Previously, the code bypassed advancing the pointer but didn't return -EINV=
AL
if the raw resolution string was provided without the "video=3D" prefix.

> =20
> -	ret =3D kstrtoint(strsep(&mode, "x"), 10, &pd->width);
> +	pos =3D mode + 6;
> +	ret =3D kstrtoint(strsep(&pos, "x"), 10, &pd->width);

[Severity: High]
Since mode is allocated via kmalloc() and not zeroed, and memcpy_fromio()
doesn't guarantee a null terminator, could strsep() scan past the end of the
allocation if the hardware string lacks delimiters?

>  	if (ret)
>  		return ret;
> =20
> -	ret =3D kstrtoint(strsep(&mode, "-"), 10, &pd->height);
> +	ret =3D kstrtoint(strsep(&pos, "-"), 10, &pd->height);

[Severity: High]
This is a pre-existing issue, but if the resolution string lacks an expected
delimiter (like "x"), strsep() will return the remaining string and set pos
to NULL.

Will the subsequent call to strsep(&pos, "-") then return NULL, causing
kstrtoint() to unconditionally dereference a NULL pointer?


I also noticed a few other pre-existing issues in this driver that might ne=
ed
attention:

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to execute a 10
second mdelay() in ls2k_bmc_recover_pci_data()?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    /* Waiting for U-Boot and DDR ready */
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    if (!ls2k_bmc_bar0_addr_is_set(parent))
        return false;
    ...
}

Because this is called from a stop_machine() callback, does this freeze the
entire system for 10 seconds with interrupts globally disabled on all CPUs,
potentially triggering hardware watchdogs and soft lockups?


[Severity: High]
This is a pre-existing issue, but does probe failure or device unbind leave=
 a
use-after-free window for the ddata structure?

In ls2k_bmc_probe(), if ls2k_bmc_parse_mode() fails after ls2k_bmc_init() h=
as
already requested the IRQ:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ret =3D ls2k_bmc_init(ddata);
    if (ret)
        return ret;

    ret =3D ls2k_bmc_parse_mode(dev, &pd);
    if (ret)
        return ret;
    ...
}

If the IRQ fires and schedules bmc_reset_work, devres will free the IRQ and=
 the
ddata structure on failure, but the workqueue is not canceled.

Will ls2k_bmc_events_fn() then execute and access the freed ddata?


[Severity: High]
This isn't a bug introduced by this patch, but does the shared interrupt
handler mask spurious interrupts or break other devices sharing the same PCI
IRQ line?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    /* Skip interrupt in LS2K_BMC_INT_INTERVAL */
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }

    return IRQ_HANDLED;
}

Since this handler is registered with IRQF_SHARED, unconditionally returning
IRQ_HANDLED without checking hardware registers tricks the kernel into assu=
ming
the interrupt was successfully handled.

Does this deprive other devices on the shared line from processing their
interrupts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706021909.2346=
535-1-zhoubinbin@loongson.cn?part=3D1
