Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C474B346A1D
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 19:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453051; cv=none; b=a9f5Ng+eTasvGrAX6dXTuHV/4iwZ98NGXM1rSxbWijKCCCKqmpN+oNsExGtrgkXI0bRcHCjDLlwWAvStHKFJe2HW3eqHFuxlKBXy7VyZCb9urs8dyTX/yi2LfFw+KcoIO1w2xcQYY2cj1DkZraqNTFRf12J8DG8ldiD1SmdYU2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453051; c=relaxed/simple;
	bh=3ZiL6Zan2UR3dQJ0PvyGl9CJmLKhEvGeWUogodhJ69Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sd13hRF5SDjyOifb4l5Q9l0djEdEGkIfWZTS5zqoDxQzpKPt/332zVInQ71p7y4fP5vmXmPFlUv2vkLvx1gnWZhp2MHx82Sx6Y44dq43e1kw4zveec/HVumGrhPeCQTdwCGKlGFm3njb+Az/zCKRdy4GgqxDgX1qMsjB6VuJZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoIrj8EU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoIrj8EU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CF31F000E9;
	Tue,  7 Jul 2026 19:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783453049;
	bh=K7CdAXtAzv5sY2wulz3TFz3DqOaiWXSCRLyk2F8s+gA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LoIrj8EU9PJ+e25hvTpPIhhs/fMlnnLlqrPd7TfrjsT5H6oDlmjZMin1sJ9CVtYUc
	 bxXSviWsmIpp6TzBiUR3cX92ohnsydma3VRtwimGngJNkN0fXK7xDipFi17eFtxn+f
	 EZ7CbOtVUYy6leIQ7N9+XtJcErtZtxqu6NfYS/ZAxBvolUDmyQpiBnhWysqu7Kq+v8
	 U++uDBoH/T2wYG7m1+Dv2rI+t2LW7FX8HVF8BSrWY3oPUripXzNPjtzndXP09qDseU
	 Q0owb8uKb3swLU+Ag3fQDAd72HA3vIINOVfEBbozG6h8Wktc0UdJRxpNBsP0lsqZNO
	 ZlijXp5yo02jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/5] mfd: ls2kbmc: sanity check for the connected
 pci port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260708-ls2kbmc-mod-v1-2-c344bf5defa3@gmail.com>
References: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
 <20260708-ls2kbmc-mod-v1-2-c344bf5defa3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 19:37:28 +0000
Message-Id: <20260707193729.47CF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] The newly added `ls2k_check_parent` function dereferences a potent=
ially NULL parent pointer, leading to a kernel panic during device probe.
- [Low] The `ls7a_ports` device ID array is not marked `const`.
- [Low] The commit message description is not capitalized, violating MFD su=
bsystem guidelines.

Pre-existing issues:
- [High] Pending `bmc_reset_work` is not canceled on probe failure or devic=
e unbind, leading to a Use-After-Free.
- [High] Dynamically modifying the global `ls2k_bmc_cells` array with a sta=
ck pointer violates MFD standards and creates a data race with a dangling p=
ointer.
- [High] Standard memcpy is used to read from I/O memory instead of memcpy_=
fromio.
- [High] The interrupt handler unconditionally claims the interrupt without=
 checking hardware status, breaking shared IRQ lines.
- [High] The driver maps and reads memory from PCI BAR0 without validating =
the size of the BAR, potentially leaking arbitrary physical memory to the k=
ernel log.
--

--- Patch [2]: [PATCH RFC 2/5] mfd: ls2kbmc: sanity check for the connected=
 pci port ---
commit cc352456f3958fb7d41378df0f417c2526354011
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: sanity check for the connected pci port

When the bmc resets, the recovery procedure require to reconfigure the
parent device. The driver assumes that the parent device should be LS7A.
Add a sanity check on initialization to ensure this and prevent from
accidentally operating on non-LS7A ports.

> mfd: ls2kbmc: sanity check for the connected pci port

[Severity: Low]
Does the commit message description need to be capitalized to match MFD
subsystem guidelines?

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 30b275bc48794..39ce5e55ffd6d 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> @@ -476,6 +485,24 @@ static int ls2k_bmc_parse_mode(struct pci_dev *pdev,=
 struct simplefb_platform_da
>  	return -EINVAL;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but looking at ls2k_bmc_parse_mo=
de()
just above this diff:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_parse_mode() {
    ...
    mode_base =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ=
_16M,
                             sizeof(mode_buf));
    ...
    memcpy(mode_buf, mode_base, sizeof(mode_buf) - 1);
    ...
}

Does this code map and read memory from PCI BAR0 without validating the siz=
e of
the BAR via pci_resource_len(), potentially leaking arbitrary physical memo=
ry to
the kernel log if a malformed PCIe device provides a small BAR0?

Also, is it safe to use the standard memcpy() to read from an I/O memory re=
gion
instead of using memcpy_fromio()?

[Severity: High]
This is a pre-existing issue, but does the interrupt handler unconditionally
claim a shared interrupt without checking the hardware status?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
        last_jiffies =3D jiffies;
    }
    return IRQ_HANDLED;
}

If the interrupt is requested with IRQF_SHARED, could this break interrupt
sharing and cause spurious device resets when another device on the same li=
ne
triggers an interrupt?

[Severity: High]
This is another pre-existing issue, but it looks like the driver initializes
bmc_reset_work and requests an interrupt in ls2k_bmc_init(), but doesn't ca=
ncel
the work on probe failure or device unbind:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
    ...
    INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);
    ret =3D devm_request_irq(...);
    ...
}

Since there is no .remove callback in the ls2k_bmc_driver pci_driver struct=
 to
cancel the work, could a late interrupt scheduled by this work execute after
ddata is freed by devres, leading to a use-after-free?

> +static struct pci_device_id ls7a_ports[] =3D {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT0) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT1) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A1K_PCIE_PORT2) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT0) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT1) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT2) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, DEV_LS7A2K_PCIE_PORT3) },
> +	{ }
> +};

[Severity: Low]
Can this array be marked const to avoid it being placed in the read-write
data section?

> +
> +static bool ls2k_check_parent(struct pci_dev *dev)
> +{
> +	struct pci_dev *parent =3D dev->bus->self;
> +
> +	return pci_match_id(ls7a_ports, parent) !=3D NULL;

[Severity: High]
If the device is attached to a topology without a parent bridge (such as
directly to a PCIe root complex in a virtualized environment), could
dev->bus->self be NULL? Passing a NULL parent to pci_match_id() would lead =
to
a kernel panic.

> +}
> +
>  static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_i=
d *id)
>  {
>  	struct simplefb_platform_data pd;

[Severity: High]
This isn't a bug introduced by this patch, but does ls2k_bmc_probe()
dynamically modify the global ls2k_bmc_cells array with a stack pointer?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    struct simplefb_platform_data pd;
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

Could this cause stack memory corruption and data races if two devices are
probed concurrently, leaving a dangling pointer to a destroyed stack frame?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v1-0-c344bf5defa3@gmail.com?part=3D2
