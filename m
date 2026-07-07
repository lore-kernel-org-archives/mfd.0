Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFEE21ABBD
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459895; cv=none; b=fVeGuNfKClGX7+DMufXL369tP3qFh8KEEPahMG4NIA250bso9DboeJ8Ez6KrzsDKbOyEJqRiz/6pvoxIvl09mwzQwxZYqO8FXd507ifLGdTRF3RhH5ySl92sS/ocOUgMkO7mcRQCxRT/g0QEfv9KgIIKTceo57BEaBnHEa8cN/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459895; c=relaxed/simple;
	bh=yQm1Z0S/bKXn+Y8bKc4mpLWpk9pnjNpVuSGhFko3B90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bPP9OBpU75gTz1dWz5FesgYLM1Z+c1ZDMO7emnE+x5QXcZVui+IJGZ4VMgPE5yJC4JaALMIOieW4eVQWku5WFsY96i/9pNR9kqYCUJc5R2c1BpmGPKG+phHP5Rf+obA2RWwSNPT1C2NVAuVZJtWMFng+KnYAnudp6K1KKcxxkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFIwdxPN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFIwdxPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16FE1F000E9;
	Tue,  7 Jul 2026 21:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783459894;
	bh=25Xj7d2C3HA6kWDj0tDvEIdzBBCcpznbH5SWdl68mjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFIwdxPNks6myTRl3IXg9AlIEgbCE6Gv0HzMxCSxNjkL45AfbWeklgJ8GbKb0ogA2
	 8hg8CSH+oPjnHOa+chUgf+hJpB2AhZxvhegRylvxeWX35L7uCe3DMqTFGpLiQ+mSnN
	 U3GNT+493y5qxvsWhNx37mSUfsOyBlar4vzdoD/ormWkwAGurc4GhGgW6gxvNAJbTX
	 dMV5kNmcfNDt3+iHFNIQ7JnDXKJxDOBxD6seAmNsWtrUg7KNQklqFKA0owgYY7fSwy
	 9RuDUmK0XVmqNBgjwd9F6eXYbtHBr/eSwSb3sJGiIc9+42qzimSDbTRif/PHFDXRLR
	 l2f3/zRqdJ1kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miao Wang" <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 21:31:33 +0000
Message-Id: <20260707213133.B16FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] TOCTOU race and API misuse in edge-triggered GPIO interrupt handle=
r.

Pre-existing issues:
- [High] Unconditional return of IRQ_HANDLED in shared PCI interrupt handle=
r breaks interrupt sharing.
- [High] Executing a 10-second busy-wait inside a stop_machine() callback t=
riggers hard lockups.
- [High] jiffies wraparound bug in rate-limiting ignores interrupts for the=
 first 6 minutes of uptime.
--

--- Patch [7]: [PATCH RFC v2 7/7] mfd: ls2kbmc: Capture the reset event of =
BMC through GPIO ---
commit 4fddebf5ba83cb02d076dd7162e7b2b6d2116f26
Author: Miao Wang <shankerwangmiao@gmail.com>

mfd: ls2kbmc: Capture the reset event of BMC through GPIO

This patch updates the driver to capture BMC reset events using the standard
GPIO framework rather than directly accessing fixed memory-mapped registers.
It attempts to find the GPIO from ACPI _CRS resources and falls back to a
fixed address if unavailable.

> diff --git a/drivers/mfd/ls2k-bmc-core.c b/drivers/mfd/ls2k-bmc-core.c
> index f87224105b372..7187b2dfddc3a 100644
> --- a/drivers/mfd/ls2k-bmc-core.c
> +++ b/drivers/mfd/ls2k-bmc-core.c
[ ... ]
> @@ -334,6 +326,22 @@ static irqreturn_t ls2k_bmc_interrupt(int irq, void =
*arg)
>  	return IRQ_HANDLED;
>  }

[Severity: High]
This is a pre-existing issue, but does ls2k_bmc_interrupt unconditionally
return IRQ_HANDLED without checking hardware registers?

The PCI interrupt is requested with IRQF_SHARED. If another device sharing
the IRQ line fires an interrupt, will this unconditionally claim it and fal=
sely
trigger the BMC recovery process?

[Severity: High]
This is a pre-existing issue, but does the rate-limiting in
ls2k_bmc_interrupt drop interrupts during the first 6 minutes of uptime?

Because last_jiffies is statically initialized to 0, and jiffies starts at
INITIAL_JIFFIES (typically -300 * HZ), time_after(jiffies, last_jiffies +
LS2K_BMC_INT_INTERVAL) evaluates to false until jiffies wraps around zero.

[Severity: High]
This is a pre-existing issue, but will ls2k_bmc_events_fn trigger a hard
lockup by calling stop_machine()?

ls2k_bmc_events_fn registers ls2k_bmc_recover_pci_data to run under
stop_machine, where it executes a 10-second busy wait
(mdelay(LS2K_BMC_RESET_WAIT_TIME)) with local interrupts disabled on all CP=
Us.

> +static irqreturn_t ls2k_bmc_gpio_interrupt(int irq, void *arg)
> +{
> +	struct ls2k_bmc_ddata *ddata =3D arg;
> +
> +	int val =3D gpiod_get_raw_value(ddata->reset_gpio);
> +
> +	/*
> +	 * The GPIO is active low, so when the value is 0,
> +	 * it indicates a reset event.
> +	 */
> +	if (val =3D=3D 0)
> +		return ls2k_bmc_interrupt(irq, arg);

[Severity: High]
Is there a race condition here that might miss reset events?

Since the interrupt is requested as edge-triggered (IRQF_TRIGGER_FALLING),
could the physical line have already returned to a high state by the time
this handler executes? If gpiod_get_raw_value sees a high level, the
handler returns IRQ_NONE, which could cause the spurious interrupt
detector to permanently disable the shared IRQ line.

Also, does using gpiod_get_raw_value instead of gpiod_get_value
bypass gpiolib logical polarity abstractions (like ActiveLow from ACPI),
potentially breaking active-high reset configurations?

> +
> +	return IRQ_NONE;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-ls2kbmc-mo=
d-v2-0-2afdd1741766@gmail.com?part=3D7
