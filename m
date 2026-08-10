Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295B3ADBA2
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368027; cv=none; b=uRLQ/a6iRDuDCfwK/bp742onwDA8ah7Ke3HZAxI98q4IeIiBztyAuoNnPoi98xyoHHuhMz697A8wNNLO50yJF2YL/BfHQz3hqZxveJSGafh9WEIwEYickvn338KnZgryOz1RvCGzrKGxyLUd39MpvWvgH9fbpCBTE23dSzuhzRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368027; c=relaxed/simple;
	bh=3pd0tKQhrmtXi2yV8m7kB+KmkhZ14hJIS4Wy3bF7eTw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j1AZ9Pfog8ryJdr6CDMHTrQ4FWFjhefhGy4UjkQ5d+a0eHHUUtvA3j5vfapDy+MELMNoBiFSJTwtAIw4Jeq6CeOC/6wCBJTvj63u0H1hyonsOJwZfd4bc3J/QAwYTDRY5gDhdprdJNwWMtmG/vNKDoGVD+ZZu1a4XX/l4IkWTfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=By9HN5P7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="By9HN5P7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD131F000E9;
	Mon, 10 Aug 2026 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786368025;
	bh=jp/ee3nZL0Xzo/vXQml7t5np2yIL+WR9IYySJ6H527Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=By9HN5P7T/6ITCB/EVNyMKGKeNkd3EFAunZoU5uecNCWchiCtbCWwVrnMiZfa+gD5
	 fFUhjWDY5HXrQDwClVhdxVkahiUd9PAV6k2dg0S2EbUVYp+2laY6AcpS3j+P1Andmv
	 a+q46Q3hICbB2fr4sEQOp526lRglqyGOTw3f4NjbJDYlnFU1UDQiA1mwNeieWGZuS/
	 h1wkCo+hdC7dNTLxu1vZ1L+9oSwaboYpab4ihVhbm1oKxwNXaHgq/r44jZXBCEqso/
	 xeyo1DBE9+OMid8P0DjIiQhpL9c2X6Rk0NtjHSl7hBIr5p87+TufYVCRwqb30pnW+F
	 OdaL1sMlzYkGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v8 1/8] mfd: ls2kbmc: Make a copy when parsing mode
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260810-ls2kbmc-mod-v8-1-16e44f7322f4@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <20260810-ls2kbmc-mod-v8-1-16e44f7322f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 13:20:24 +0000
Message-Id: <20260810132025.5DD131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The global `ls2k_bmc_cells` array is mutated during probe to pass =
a pointer to a stack-allocated variable (`&pd`), causing an MFD subsystem v=
iolation and a stack use-after-free race condition.
- [High] Missing bounds check in `ls2k_bmc_parse_mode` allows the calculate=
d framebuffer size to exceed the fixed 4MB hardware resource.
- [High] The interrupt handler uses a `static unsigned long last_jiffies` f=
or rate-limiting, sharing state across all devices and breaking interrupts =
for the first 5 minutes of system uptime due to integer underflow.
- [High] The `ls2k_bmc_init` function unconditionally calls `acpi_unregiste=
r_gsi()` on the success path, leading to an IRQ mapping use-after-free and =
silencing hardware interrupts.
--

--- Patch [1]: [PATCH RFC v8 1/8] mfd: ls2kbmc: Make a copy when parsing mo=
de string ---
commit bb986d2e7f482a92c234ff015a64e640a621dc2d
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Make a copy when parsing mode string

When parsing the mode string from BMC, the string is manipulated
in-place with strsep(), preventing from parsing it again. Make a copy of
the original string and manipulate the copy instead to fix this.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..335590392240b 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -427,34 +427,67 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_pla=
tform_data *pd)
>  {
[ ... ]
> +	if (depth <=3D 0) {
> +		ret =3D -EINVAL;
> +		goto invalid_mode;
> +	}
> +	if (pd->width > U32_MAX / depth) {
> +		ret =3D -EOVERFLOW;
> +		goto invalid_mode;
> +	}
> =20
>  	pd->stride =3D pd->width * depth / 8;
>  	pd->format =3D depth =3D=3D 32 ? "a8r8g8b8" : "r5g6b5";

[Severity: High]
This is a pre-existing issue, but is there a missing bounds check against
the maximum framebuffer size?

The framebuffer resource ls2k_display_resources is statically defined with
a size of SZ_4M. While the code checks for integer overflow of width * dept=
h,
could a compromised or misconfigured BMC provide a mode string that results
in a stride * height exceeding the 4MB limit?

If simple-framebuffer maps this region restricted to 4MB, fbcon might rely
on this geometry and attempt out-of-bounds writes beyond the 4MB ioremap
boundary, which could trigger a page fault and panic.

[ ... ]

While reviewing this file, I also noticed a few other pre-existing issues
outside of the modified lines:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does the global
ls2k_bmc_cells array have a race condition during probe?

Mutating a shared static global array during probe causes data races if
multiple devices are probed concurrently.

Also, storing a pointer to a local stack variable (pd) in a global array
means a concurrent probe could dereference a dangling stack pointer. The MFD
subsystem requires cell arrays to be static const to prevent this.


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    static unsigned long last_jiffies;
    ...
    if (system_state !=3D SYSTEM_RUNNING)
        return IRQ_HANDLED;

    /* Skip interrupt in LS2K_BMC_INT_INTERVAL */
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        ...
    }
}

[Severity: High]
This is a pre-existing issue, but does the interrupt rate-limiting logic
fail during early boot?

Using a static variable inside an ISR incorrectly shares the debounce state
across all instances of the device.

Additionally, last_jiffies implicitly initializes to 0. Since the system
jiffies counter starts at a large negative value during early boot,
time_after() will evaluate to false until jiffies wraps around past 0.

Could this cause BMC reset interrupts to be completely ignored for the first
5 minutes of system uptime?


drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
                           IRQF_SHARED | IRQF_TRIGGER_FALLING,
                           "ls2kbmc gpio", ddata);
    if (ret)
        dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n",
                gpio_irq);

    acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
    return ret;
}

[Severity: High]
This is a pre-existing issue, but does ls2k_bmc_init() accidentally destroy
the active IRQ mapping on the success path?

Calling acpi_unregister_gsi() on the success path disposes of the mapping
between the hardware GSI and the assigned Linux IRQ number.

Since the domain mapping is destroyed, will the interrupt controller fail
to deliver interrupts to the driver, breaking the BMC reset functionality?

Furthermore, when the device is removed, the managed IRQ framework will
attempt to free the disposed IRQ mapping, which could lead to use-after-free
warnings in the irqdomain code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-ls2kbmc-mo=
d-v8-0-16e44f7322f4@gmail.com?part=3D1
