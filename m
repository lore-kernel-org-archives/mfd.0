Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367CA1EB5C2
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 21:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459530; cv=none; b=TeNRWeuFFHPegX0W56Q9JtnID3OkTdGJ8H5Evi1qPBEHLAoUoCsYf0vcvQjNoiEU1yGwE1ieoW130DU3fZFTtrsThL6PbLyZrKU02N5NA3emoGpnzcAwh07ezrQ68Xq6gKdPBqbn69nPf7MOz3aE5OxuQHz2Tk/EdP9YLZiiSNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459530; c=relaxed/simple;
	bh=462JW7tUmUbc6tzQsa8MyjBajJWzGgk8qAh+VHG5rbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GANIrK2ntChhjYVbkIIbegk4O41Pf80gP4C0IX4AuBHHhtaq0GQcXp52QXX7h0+xE3bR3SdFGywNvfDzXPpgxxIK+4A1nTtxXBgKC6tBIyt2TyI/FkBzWQCtJ4G2Si/A3/6SApXh4wWDUIv5g/lYeVcIRfVo20aeE6N4cLGZKF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxDqbKop; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxDqbKop"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9CA1F000E9;
	Tue,  7 Jul 2026 21:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783459528;
	bh=2Z6M7mycgbdEgjKTfnpPS1m5fCezKN/FQSJXwr9HKPM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RxDqbKoplV01O1H2YMcMKMmi0wGQafkOKjcRIt2vSHxNzTSQHmd719f6sr2gM+1X8
	 xyl7UfDh9Th5dXzr4SLILNQbDdjpx7EViNza3BPyYxR5bqlHgzkdgGdJfyYBT9ScOh
	 b4rV4NzIr7N7mQXNmUH7xGLgu7qAaDRPer7QT1y4aZ000D8jNih61l86k9pP7WdPiJ
	 tsv7Tg+zobL/80jRp2RCrhki72eapNOMxW8D1oA4I+BAKwr9wfxq5A0Sn3tNTtYwXW
	 f7QhkZJQHDlbciLtBt9ol1yEAsxAcQRuw3cIgssjynhNo9lw+VtSo9qnEe2ygL6Ap9
	 nRFt3wwhvuyqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 4/7] mfd: ls2kbmc: Cancel the work queue on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260708-ls2kbmc-mod-v2-4-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-4-2afdd1741766@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 21:25:27 +0000
Message-Id: <20260707212528.5A9CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Missing check of `devm_add_action_or_reset()` return value leads t=
o use-after-free on device unbind.

Pre-existing issues:
- [Critical] The driver requests a shared IRQ (`IRQF_SHARED`) but does not =
verify the hardware interrupt status, causing unrelated interrupts to trigg=
er system-wide lockups.
- [High] Executing an extreme delay (`mdelay()` for 10+ seconds) inside a `=
stop_machine()` callback will trigger the NMI watchdog and cause a system p=
anic.
- [High] Dynamic mutation of a global, non-const `mfd_cell` array using a p=
ointer to a stack-allocated variable.
- [High] Premature unregistration of the ACPI GSI-to-IRQ mapping while the =
IRQ is actively requested.
- [High] A `static` variable is used for rate-limiting inside the interrupt=
 handler, ignoring all interrupts for the first 6 minutes of system uptime =
and causing data races.
--

--- Patch [4]: [PATCH RFC v2 4/7] mfd: ls2kbmc: Cancel the work queue on re=
moval ---
commit 99a0d7b57f4c27f804053725b5bbccb398931b78
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Cancel the work queue on removal
   =20
When the device is being removeed, the work queue should be canceled to
avoid any pending work to be executed after the device is removed.
   =20
Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function supp=
ort")
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index a5465c42a77b8..f87224105b372 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c

[ ... ]

> @@ -385,6 +391,8 @@ static int ls2k_bmc_init(struct ls2k_bmc_ddata *ddata)
> =20
>  	INIT_WORK(&ddata->bmc_reset_work, ls2k_bmc_events_fn);

[Severity: High]
This is a pre-existing issue, but can the delay in this work item trigger t=
he
NMI watchdog?

Looking at ls2k_bmc_events_fn(), it initiates a stop_machine() context which
halts all CPUs and disables interrupts globally:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_events_fn() {
        ...
        stop_machine(ls2k_bmc_recover_pci_data, ddata, NULL);
        ...
}

Inside the callback, it busy-waits for 10 seconds:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_recover_pci_data() {
        ...
        mdelay(LS2K_BMC_RESET_WAIT_TIME);
        ...
}

Halting all CPUs with interrupts disabled for this long seems like it would
cause a system panic.

> =20
> +	devm_add_action_or_reset(ddata->dev, ls2k_bmc_cancel_wq, ddata);

[Severity: High]
Does the return value of devm_add_action_or_reset() need to be checked here?

If devm_add_action_or_reset() fails due to memory pressure, it immediately
executes the cleanup action and returns an error. Because this error is
ignored, probe continues successfully and the workqueue becomes active.

When the device is later unbound, the action is missing from the devres
list, so the workqueue is not canceled before its ddata structure is freed,
which could lead to a use-after-free regression.

> +
>  	ret =3D devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
>  			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", ddata);

[Severity: Critical]
This is a pre-existing issue, but does this shared IRQ handler verify its
hardware interrupt status before scheduling work?

Since this IRQ is requested with IRQF_SHARED, the interrupt line could be
shared with an unrelated device. The handler currently schedules the reset
work unconditionally:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
        ...
        schedule_work(&ddata->bmc_reset_work);
        ...
        return IRQ_HANDLED;
}

Because bmc_reset_work triggers a 10-second stop_machine() halt, normal
activity on any unrelated device sharing this interrupt line could
repeatedly freeze the entire system.

[Severity: High]
This is another pre-existing issue, but will this interrupt handler fail to
process interrupts for the first 6 minutes of system uptime?

The handler relies on a static variable for rate-limiting:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_interrupt() {
        static unsigned long last_jiffies;
        ...
        if (time_after(jiffies, last_jiffies + LS2K_BMC_INT_INTERVAL)) {
        ...
}

Linux initializes jiffies to a negative value to detect wrap-around
conditions. Because last_jiffies defaults to 0, this check evaluates to fal=
se
until jiffies becomes sufficiently positive, silently dropping interrupts f=
or
the first ~360 seconds. Being static, this variable is also unprotected and
improperly shared across all device instances.

[ ... ]

While reviewing the above changes, I also noticed a few other pre-existing
issues in the driver that might need attention:

[Severity: High]
This is a pre-existing issue, but is the GSI unregistered prematurely during
initialization?

Later in ls2k_bmc_init(), the GSI is unregistered immediately on the
successful probe path:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_init() {
        ...
        acpi_unregister_gsi(LS2K_BMC_RESET_GPIO_GSI);
        ...
}

This tears down and invalidates the IRQ descriptor while the handler remains
registered, which instantly destroys the mapping and renders the GPIO
interrupt dysfunctional.

[Severity: High]
This is a pre-existing issue, but does this code dynamically mutate a
global, non-const array with a stack pointer?

In ls2k_bmc_probe(), the address of a local stack variable is assigned to
the global ls2k_bmc_cells array:

drivers/mfd/ls2k-bmc-core.c:ls2k_bmc_probe() {
        struct ls2k_bmc_platform_data pd;
        ...
        ls2k_bmc_cells[LS2K_BMC_DISPLAY].platform_data =3D &pd;
        ls2k_bmc_cells[LS2K_BMC_DISPLAY].pdata_size =3D sizeof(pd);
        ...
}

If multiple instances of this device probe concurrently, they could race to
write to the shared global array. Furthermore, the global array retains a
dangling pointer to the popped stack frame after probe returns.

According to the MFD subsystem guidelines, mfd_cell arrays should be static
const to prevent these kinds of regressions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v2-0-2afdd1741766@gmail.com?part=3D4
