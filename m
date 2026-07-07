Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F0237647E
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459598; cv=none; b=Im6sMaSUm/k4xAvzLtDUt2gp/x3g0rCht5sc+PUS4Vc4mOOE7ZyPicm9LFlcpeEssMa4cLFt3YPDgiO3uh3YTRTqdAhI2JCMLSjOtzdnPaPOHGiMClDjWS6JN0iK7U2DR0rgKQACCFEud97uildTY5NUgcNnQUCv7+Ye2rXWoCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459598; c=relaxed/simple;
	bh=tUe91ESfmXstSIEwJbnYaWTkujpnfOtt/BffjIf6h2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DnwIyuotqk/ws4Zjm8DOHwXaRrDZTANxARDlD1oVj25pJ7l/5KnUsu56S+WLaZ6gkXX+XmjsUcENT7sIj/xT46ZfwWL/UjKYEWKA0Lv7JRlUPQLV2xLxY0Cr7q7FCtAeWJlTl3/Iz14xYkORk9csafwQBU0WXg4l1UJe3pKOp14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fl/cHtz6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl/cHtz6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E576A1F000E9;
	Tue,  7 Jul 2026 21:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783459597;
	bh=2G+KcDdvN2sQExbv4pXUtpBTr+pKLhgjuHLSdd8GY6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fl/cHtz6gD/Jnh4jPS8l6bHvbA3RAHLefnEQr7m24FtOxLZXBiCCy0tTp5St1iAVa
	 euq+qdIpBpx9gBcV/odAijTbdFV0IgwDi6bXowtjcstcDZe+8KQivTDcFqzpCw3oBA
	 ccqBuuTSQf8/m4g+nw/KWOTToHssgaqB/MpCtDZNUfmno5h3KeyDKjDFtwu8RIt9d6
	 L0De5SAkm85wYVi4pwDoU6DRAFjHi+NJcnhm10TaIZfc+bHEbQO6AQ3TOxDBeBM25G
	 zBNBiUS6RwNj7u7iVuWJ1ROVOoS38TzYo8ezVvXpwEUcULYgcBHXYIqlpkCJedE7/X
	 ldtxf/AyAnLjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 6/7] mfd: ls2kbmc: Able to be compiled as a
 module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260708-ls2kbmc-mod-v2-6-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-6-2afdd1741766@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 21:26:36 +0000
Message-Id: <20260707212636.E576A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Executing an unbounded and extremely long busy-wait (10+ secon=
ds) inside a `stop_machine` callback, which will cause a hard lockup.
- [High] Dynamically modifying a global static `mfd_cell` array with a poin=
ter to a stack-allocated variable, causing a data race and leaving a dangli=
ng pointer.
- [High] The GPIO GSI-to-IRQ mapping is unconditionally unregistered immedi=
ately after being successfully requested, breaking the interrupt handler.
- [High] The IRQ handler uses a static rate-limiting variable that drops in=
terrupts during the first ~5 minutes of system uptime and improperly shares=
 state across device instances.
--

--- Patch [6]: [PATCH RFC v2 6/7] mfd: ls2kbmc: Able to be compiled as a mo=
dule ---
commit f6dafc2cbabb3cc03d44c55be366eadc27bca60c
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Able to be compiled as a module
   =20
Make ls2kmc able to be compiled as a module

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782b..a7a9f97af248c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2494,7 +2494,7 @@ config MFD_LOONGSON_SE
>  	  which will forward them to the corresponding engine.
> =20
>  config MFD_LS2K_BMC_CORE
> -	bool "Loongson-2K Board Management Controller Support"
> +	tristate "Loongson-2K Board Management Controller Support"
>  	depends on PCI && ACPI_GENERIC_GSI
>  	select MFD_CORE
>  	help

This isn't a bug introduced by this patch, but while reviewing this I notic=
ed a few pre-existing issues in drivers/mfd/ls2k-bmc-core.c:

> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> static struct mfd_cell ls2k_bmc_cells[] =3D {

[Severity: High]
This is a pre-existing issue, but shouldn't this array be defined as
static const to comply with MFD subsystem guidelines?

[ ... ]

> static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id=
 *id)
> {
> 	struct simplefb_platform_data pd;
[ ... ]
> 	ret =3D ls2k_bmc_parse_mode(dev, &pd);
> 	if (ret)
> 		return ret;
>=20
> 	ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;

[Severity: High]
This is a pre-existing issue, but does this leave a dangling pointer to
the local stack variable pd in the global array?  Could this also cause
a data race if multiple instances of this driver probe concurrently?

[ ... ]

> static void ls2k_bmc_events_fn(struct work_struct *work)
> {
[ ... ]
> 	/*
> 	 * The PCI-E is lost when the BMC resets, at which point access to the P=
CI-E
> 	 * from other CPUs is suspended to prevent a crash.
> 	 */
> 	stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);

[ ... ]

> static int ls2k_bmc_recover_pci_data(void *data)
> {
[ ... ]
> 	/* Waiting for U-Boot and DDR ready */
> 	mdelay(LS2K_BMC_RESET_WAIT_TIME);

[Severity: Critical]
This is a pre-existing issue, but does this execute a 10 second busy-wait
while running in the stop_machine() callback?  Since stop_machine() halts
all other CPUs with local interrupts disabled, will this cause a hard
lockup?

[ ... ]

> static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
> {
[ ... ]
> 	ret =3D devm_request_irq(ddata->dev, gpio_irq, ls2k_bmc_interrupt,
> 			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", ddata);
> 	if (ret)
> 		dev_err(ddata->dev, "Failed to request LS2KBMC GPIO IRQ %d.\n", gpio_ir=
q);
>=20
> 	acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);

[Severity: High]
This is a pre-existing issue, but does this unconditionally unregister and
dispose of the IRQ mapping immediately after it was successfully requested?
Could this leave an orphaned irqaction and break the GPIO interrupts?

[ ... ]

> static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
> {
> 	struct ls2k_bmc_ddata *ddata =3D arg;
> 	static unsigned long last_jiffies;

[Severity: High]
This is a pre-existing issue, but does this improperly share the rate
limiting state across all device instances?

>=20
> 	if (system_state !=3D SYSTEM_RUNNING)
> 		return IRQ_HANDLED;
>=20
> 	/* Skip interrupt in LS2K_BMC_INT_INTERVAL */
> 	if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {

[Severity: High]
This is a pre-existing issue, but because last_jiffies initializes to 0 and
jiffies starts at INITIAL_JIFFIES (usually a large unsigned value near wrap
around), will this block all valid hardware interrupts for the first ~5
minutes of system uptime?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v2-0-2afdd1741766@gmail.com?part=3D6
