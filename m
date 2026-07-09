Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E12E40B6E4
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618602; cv=none; b=iW8Je8/9WWaCHceSubvV/iT+jGDxTdTnMGzDjJSN/gkP+/Da5CRoGUMEPPqWyjl5ViB96JaTitMiMRu8sZ+kYbcuuBZwf2oP05P6BuqzoIEo56DpEPoLGmGdia1CmuCmbTnbiphWqaqRRErmDkUgsFiT0AfEHjDP62L5JRyzVdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618602; c=relaxed/simple;
	bh=T5cqnFPOpaGc/UJuEPsauirjL9k9GyuM1QPBlG5J6QE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kFcJggUyyu2stILtMxfwhZWM0nrYgZaxcjGMEtZKVDioeFL0l+cOLL1N5bp1+VQbdfa6welODOZ461AP4KTkdNGgkFVUWXrKuSNYKdnLLKPIxXCKRF2DLSjAXPg/0o5/oJZMrkqDd3tb3JfPs1zjntuvPaughLfbwi/d7nodW/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbrbwvAq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbrbwvAq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134D61F000E9;
	Thu,  9 Jul 2026 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618601;
	bh=I7suwPJHrmg5ckWPMDJLBzUAz9e+4qhxI2+nwxFrGlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HbrbwvAqdXj1Ne0CeGuxX2eTegPLxHXEuw+AFOcRGNHcvJt2/cV3Uk0ufNpFBlrvs
	 C6fkJUdZB+8f5dR2MnAXA1KtUt9bpuQEq+RYS/VvYz4GdDFNEQ31eYZXRLHnmyIwdT
	 57L5KMKEILrbX464Eyyu9Is/KKB7UKceXHZKJXvpcfbBzcGWCH0gvdQpg94M0xbK/g
	 PL0DgLbQLqAQ7zY0LmYgmB0c+EOkGdCZzNyitR0QzxcIvq/fxX5KMMJb2buOP67Avk
	 9MYjFr26waIW9lb4M5V6H9D/d4oOAef6fhpJE/YOCSR8gr8nE3nWW7U8rKdSDnvoP8
	 ncNqMFBo4dG6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:36:40 +0000
Message-Id: <20260709173641.134D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] The newly added `mode =3D=3D NULL` check for the depth token stric=
tly rejects valid mode strings that do not contain an `@` character (refres=
h rate).

Pre-existing issues:
- [High] The static global `mfd_cell` array is dynamically mutated during p=
robe using a local stack pointer, causing a data race and violating MFD gui=
delines.
- [High] Missing NULL check for the parent PCI device leads to a guaranteed=
 kernel crash on VM passthrough or root bus topologies.
- [High] Integer overflow during framebuffer stride calculation allows a ma=
liciously crafted stride of zero.
- [High] The shared interrupt handler unconditionally returns `IRQ_HANDLED`=
 without checking if the interrupt actually originated from its device.
- [High] The driver executes extremely long busy-waits (e.g., `mdelay(10000=
)`) inside a `stop_machine()` callback, which runs in an atomic context wit=
h interrupts disabled on all CPUs.
--

--- Patch [1]: [PATCH RFC v3 1/7] mfd: ls2kbmc: Make a copy when parsing mo=
de string ---
commit 84c24ac01fbdd9a196a1f9f0c91b270f741fb568
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Make a copy when parsing mode string

When parsing the mode string from BMC, the string is manipulated
in-place with strsep(), preventing from parsing it again. Make a copy of
the original string and manipulate the copy instead to fix this.

Fixes: 0d64f6d1ffe9 ("mfd: ls2kbmc: Introduce Loongson-2K BMC core driver")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index 408056bfb2fe7..27f6e096404d6 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -427,34 +427,54 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
[ ... ]
>  	ret =3D kstrtoint(strsep(&mode, "@"), 10, &depth);
>  	if (ret)
>  		return ret;
> +	if (mode =3D=3D NULL)
> +		goto invalid_mode;

[Severity: High]
Does this new check break backward compatibility?

If the resolution string doesn't contain a refresh rate (e.g.
"video=3D1920x1080-32"), strsep() will return the remaining string for dept=
h,
and set mode to NULL.

The kstrtoint() succeeds, but then the new "if (mode =3D=3D NULL)" check wi=
ll
trigger, unconditionally rejecting valid mode strings without an explicit
refresh rate.

> =20
>  	pd->stride =3D pd->width * depth / 8;

[Severity: High]
This is a pre-existing issue, but does this calculation check for integer
overflow?

If a compromised BMC hardware endpoint supplies maliciously large values
(e.g., width =3D 0x40000000 and depth =3D 8), this calculation could wrap
around to 0, resulting in a zero-size framebuffer mapping.


I also noticed some pre-existing issues in other parts of the driver:

[Severity: High]
This is a pre-existing issue, but does ls2k_bmc_probe() dynamically mutate a
global static array during probe?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
    ...
}

Assigning a local stack pointer to a mutable global static MFD cell array
creates a data race and a use-after-free hazard if multiple instances of
this driver probe concurrently.


[Severity: High]
This is a pre-existing issue, but is it possible for the parent pointer to
be NULL in ls2k_bmc_save_pci_data()?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_save_pci_data() {
    struct pci_dev *parent =3D pdev->bus->self;
    ...
    pci_read_config_dword(parent, PCI_COMMAND, &ddata->bridge_pci_data.pci_=
command);
    ...
}

If the device is connected directly to a root bus (e.g., passed through via
VFIO to a VM), pdev->bus->self will be NULL, which would cause a kernel
panic due to a NULL pointer dereference.


[Severity: High]
This is a pre-existing issue, but does the shared interrupt handler check
the hardware to confirm the interrupt's provenance?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
    ...
    if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        schedule_work(&ddata->bmc_reset_work);
    ...
    return IRQ_HANDLED;
}

Because it is registered with IRQF_SHARED, if another device on the same
PCI IRQ line fires an interrupt, the kernel assumes this driver handled it,
potentially starving the other device and spuriously triggering a BMC reset.


[Severity: High]
This is a pre-existing issue, but does this code execute an extremely long
busy-wait in an atomic context?

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
    ...
    /* Waiting for U-Boot and DDR ready */
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

The BMC reset workqueue calls stop_machine(ls2k_bmc_recover_pci_data, ...).
Inside this callback, mdelay() busy-waits for 10 seconds. Since
stop_machine() runs in an atomic context with interrupts disabled on all
CPUs, this can cause a system freeze and a hard lockup/NMI watchdog panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-ls2kbmc-mo=
d-v3-0-ef718636e78e@gmail.com?part=3D1
