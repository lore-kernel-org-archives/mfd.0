Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8401C3B8930
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 19:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871464; cv=none; b=KM6utQesOrbLTv+5KNn7TGcsF4DHBv4zsd/fHJDwhKErslFQ0cV3KNkcc7rjueQOFrSyBJ4bb7q6bEEftmbcU7mgs3nHd7tEtVijsuCxvLC+7p4w547qS/TEXzN7MPqG8bvJja3D/5NxFDwzW9hRkz8Vm0RvWpmTMLexT6x0IG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871464; c=relaxed/simple;
	bh=gPOlfY3/RZsvarx4MFL46q5sx5EN4wxHnKBa/8675gg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FsY+oupW+qJA6XXyo9ZeD8Fl2ampEGVN95SxaOCeWpM6kysaXor3VAL/TQ0H0+e2vGYJSD9xrHmXyhf6G10lX1zif6RzhwNSwdLjL1/eC5XmL/TDnLXvkFlIA/rLTiETXGdYvBMBNaEBMd5aKECPXRvTKz3YDq/zRhAieaYWhqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSb3lSom; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSb3lSom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91521F000E9;
	Tue,  4 Aug 2026 19:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785871461;
	bh=ScPMTdQxrSd4VZ2p/lsXl/G6Um4jOuUDehFgB0YliN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hSb3lSomVlBxN5igRDi/VaVGMBX1zq5ZvesEEPgmQ9XZGg5d7qD9DWhx7hrriRIaN
	 NAil7hC4H71AW4IsKO6NX4fxweqB4TRuvpGb3HlX2od947zZCB5pI5mK99UVaVtZst
	 QlUr+n+BTUoKY9NMJf240LDKAToo/QmQ69F3qm4VBFoL+UNaD73SaDiQD61OFaGPbA
	 voFZ1DnTkM75YO6aT9MnNiHk8u3fWAzvwm+Wd8FK05UlHILMuHlpVyaJ2ldOV6RoJ9
	 EXpEXEs9wBFuJLerfGlNp4wkJ1e016kwH5iR/xjdWIIkX3VopCzOZD/cb8/bDstRXk
	 uiFxsBGACkoug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260805-ls2kbmc-mod-v6-1-16ccde412d86@gmail.com>
References: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
 <20260805-ls2kbmc-mod-v6-1-16ccde412d86@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:24:21 +0000
Message-Id: <20260804192421.A91521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:

New issues:
- [Medium] The newly added error path logs the raw resolution string from t=
he BMC without sanitizing it.

Pre-existing issues:
- [Critical] The `stop_machine()` callback `ls2k_bmc_recover_pci_data()` ex=
ecutes an extremely long `mdelay()`, freezing all CPUs.
- [High] The global `ls2k_bmc_cells` array is dynamically mutated during pr=
obe, violating MFD guidelines and creating a data race.
- [High] The shared interrupt handler `ls2k_bmc_interrupt` unconditionally =
returns `IRQ_HANDLED` without checking hardware status.
- [High] Unconditional dereference of `pdev->bus->self` to access the paren=
t bridge could crash the kernel if the device is attached to the root bus.
- [High] The workqueue `bmc_reset_work` is never canceled upon device remov=
al, leading to a Use-After-Free.
- [High] Missing validation of PCI BAR0 length before mapping memory at a 1=
6MB offset.
- [High] Calculating the framebuffer stride can overflow a 32-bit integer, =
leading to out-of-bounds memory accesses.
- [High] The driver assumes its parent PCI bridge is a Loongson LS7A and bl=
indly modifies vendor-specific registers.
--

--- Patch [1]: [PATCH RFC v6 1/7] mfd: ls2kbmc: Make a copy when parsing mo=
de string ---
commit 79e8b832a812c3929b8bad068187bcaad3dc3920
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Make a copy when parsing mode string

When parsing the mode string from BMC, the string is manipulated in-place
with strsep(), preventing from parsing it again. This commit makes a copy
of the original string and manipulates the copy instead.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
> @@ -427,34 +427,54 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *dda=
ta)
>   */
>  static int ls2k_bmc_parse_mode(struct pci_dev *pdev, struct simplefb_pla=
tform_data *pd)
>  {
> -	char *mode;
> +	/* Assume 64 bytes is enough for the resolution string */
> +	char mode_buf[64], mode_buf_orig[64];
> +	char *mode =3D mode_buf;
> +	const void __iomem *mode_base;
>  	int depth, ret;
> =20
>  	/* The last 16M of PCI BAR0 is used to store the resolution string. */
> -	mode =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0) + SZ_16M,=
 SZ_16M);
> -	if (!mode)
> +	mode_base =3D ioremap(pci_resource_start(pdev, 0) + SZ_16M,
> +			    sizeof(mode_buf));

[Severity: High]
This is a pre-existing issue, but does this mapping require a validation ch=
eck
for the PCI BAR0 length?

If a virtual or malformed device advertises a BAR0 smaller than 16MB, could
calling ioremap at this fixed SZ_16M offset lead to a master abort or
unauthorized reads of memory outside the allocated PCI resources?

> +	if (!mode_base)
>  		return -ENOMEM;
[ ... ]
>  	ret =3D kstrtoint(strsep(&mode, "@"), 10, &depth);
>  	if (ret)
> -		return ret;
> +		goto invalid_mode;
> =20
>  	pd->stride =3D pd->width * depth / 8;

[Severity: High]
This is a pre-existing issue, but can this stride calculation overflow a
32-bit integer?

Since width and depth are parsed from device memory, could large values like
width =3D 0x20000001 cause the width * depth / 8 calculation to overflow in=
to
a small stride, potentially causing out-of-bounds memory accesses when pass=
ed
to the framebuffer subsystem?

>  	pd->format =3D depth =3D=3D 32 ? "a8r8g8b8" : "r5g6b5";
> =20
>  	return 0;
> +
> +invalid_mode:
> +	dev_err(&pdev->dev, "Invalid resolution string: %s\n", mode_buf_orig);

[Severity: Medium]
Could this log the raw resolution string from the BMC without escaping it?

If a malformed resolution string contains non-printable characters or ANSI
escape codes in the BMC memory, would printing it directly via %s lead to
terminal escape sequence injection and log spoofing?

> +	return ret;
>  }

While reviewing this file, I also noticed a few other pre-existing issues
outside the patch diff that might need attention:

> static struct mfd_cell ls2k_bmc_cells[] =3D {

[Severity: High]
This is a pre-existing issue, but is it safe to omit the const modifier from
this global mfd_cell array?

In ls2k_bmc_probe(), this array is dynamically mutated:

ls2k_bmc_probe() {
    ...
    ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
    ...
}

Does assigning the address of a local stack variable to this global array
leave a dangling pointer after the probe function returns, potentially lead=
ing
to use-after-free or data corruption if another device is probed? Does this
also violate the MFD subsystem guidelines for static const cell arrays?


> static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
> {
> 	...
> 	return IRQ_HANDLED;
> }

[Severity: High]
This is a pre-existing issue, but does this shared interrupt handler proper=
ly
check hardware status before returning IRQ_HANDLED?

If it unconditionally returns IRQ_HANDLED without verifying if its device
generated the interrupt, will it falsely claim interrupts meant for other
devices sharing the same IRQ line and cause them to malfunction?


> static void ls2k_bmc_events_fn(struct work_struct *work)
> {
> 	...
> 	stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
> 	...
> }

[Severity: Critical]
This is a pre-existing issue, but does ls2k_bmc_recover_pci_data() execute a
long delay inside a stop_machine callback?

ls2k_bmc_recover_pci_data() {
    ...
    mdelay(LS2K_BMC_RESET_WAIT_TIME);
    ...
}

Since stop_machine() runs with local interrupts disabled on all CPUs, will a
10-second mdelay freeze the entire system and trigger the NMI watchdog hard
lockup detector?


> static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc_=
ddata *ddata)
> {
> 	struct pci_dev *parent =3D pdev->bus->self;
> 	...
> 	pci_read_config_dword(parent, PCI_COMMAND, &ddata->bridge_pci_data.pci_c=
ommand);

[Severity: High]
This is a pre-existing issue, but does this code unconditionally dereference
the parent pointer?

If the device is attached to the root bus, such as in a VM passthrough setu=
p,
pdev->bus->self would be NULL. Would passing this NULL pointer directly to
pci_read_config_dword() and other PCI accessors cause a kernel panic?


> static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
> {
> 	...
> 	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);

[Severity: High]
This is a pre-existing issue, but is the bmc_reset_work properly canceled on
device removal?

If the workqueue is initialized but never properly canceled when the driver
is unbound and the ddata structure is freed by devm, could this lead to a
use-after-free if the work is scheduled or running?


> static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc_=
ddata *ddata)
> {
> 	struct pci_dev *parent =3D pdev->bus->self;
> 	...
> 	pci_read_config_dword(parent, LS7A_GEN2_CTL, &ddata->bridge_pci_data.gen=
2_ctrl);

[Severity: High]
This is a pre-existing issue, but does the driver unconditionally assume its
parent bridge is a Loongson LS7A device?

If the device is attached behind a standard PCIe switch or QEMU root port,
will writing to vendor-specific registers like LS7A_GEN2_CTL corrupt standa=
rd
PCI bridge configuration space and potentially break system routing or cras=
h?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ls2kbmc-mo=
d-v6-0-16ccde412d86@gmail.com?part=3D1
