Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62433B8D70
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784143866; cv=none; b=B995oduEiPCEfR4QxDO6gADIGk2xZy8cDQaDTyjgKEZPARfolQAqKA3+wBfAv7R+Mqj8SwxxNLtMnspFOW9r+yVGr3oPpwKDKTOu37DhTzpdBGlYb4c+A1xKowve3+c3erhx8Lo6OhU6ymMlF7zY7j43uhjW6gGbNOG2NJGcY28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784143866; c=relaxed/simple;
	bh=lHIJCwk+qO+Ej0M6RLzaWiIdmmpD49lPAgiNroGaKfM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TxB4V493JSDXDzN4QjnYwPDyflL1okPe6ApVRuY2aDVNfdgOAURw18ZcmX2TpXZVKKjqbQcXnj5D0js4Bn0xtaW7WCIyzKVo/f9K7SXA2a6Cdh0XEShkLo4S81ItCLM8qq0TUCiPeHIF5c/bkdQCIcrXGl4SPWHZXDpxzcmPtKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVN7utMe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVN7utMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D4E1F00A3E;
	Wed, 15 Jul 2026 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784143861;
	bh=AZEVo9xUzxDkJvRR/5UUXc44XV0j4TcDi5UbcKCqPIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VVN7utMeGgIi/gdKeN8UYb04rQ1/bcpSZoCjACHnsE6VRAxzRC69vwoA1E1kalEL6
	 pfwoECIJB3DDJv5Dv7LLLZzxJ9Ib6jmjCHq339h+CbHt3zdseCEqoI2bRgSo0oHr2n
	 0ZQLhpwZmzpdpJ0gJtDHxMKyFhukbOfIBq/i4ki1B0M3rZq1eMIdTE5zJ1QqNptJOU
	 eRYM8UjJQFRN3Up2620VVEA4eW0kVHDJio1p5BvzWHEzBHjfghFc+6H7AZiTnDTRoW
	 KGWAbjDMsvP2RmZViODm2NdY4QojA9y/NzN5VWbMeXsYqRCSX1FC6gS9Md846+eP1Z
	 oXcZ1ZKX0Al+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] mfd: si476x-i2c: Get rid of duplicate NULL
 checks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260715191603.1325479-1-andriy.shevchenko@linux.intel.com>
References: <20260715191603.1325479-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:31:00 +0000
Message-Id: <20260715193100.D6D4E1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free of the `core` structure and `rds_fifo` buffer due t=
o uncancelled `rds_fifo_drainer` work.
- [High] Shared static variable `io_errors_count` creates a concurrency rac=
e and cross-device contamination.
- [High] Premature termination of the polling loop causes the power-down co=
mmand to reliably timeout.
- [Medium] Dynamic mutation of `mfd_cell` array violates MFD subsystem guid=
elines.
- [Medium] Usage of bespoke parent-child data accessor function bypasses st=
andard device APIs.
- [Medium] Manual computation of cell IDs instead of using `PLATFORM_DEVID_=
AUTO`.
- [Medium] Unintended hardware reset asserted during a soft-start error pat=
h.
--

--- Patch [1]: [PATCH v1 1/1] mfd: si476x-i2c: Get rid of duplicate NULL ch=
ecks ---
commit ed17e6e9e7ceb43eb92448b1c1f64b14a925bc07
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

mfd: si476x-i2c: Get rid of duplicate NULL checks

GPIO descriptor APIs are NULL-aware and since the requested line is optional
we don't need to have an additional check each time we want to toggle GPIO.

Get rid of duplicate NULL checks.

> diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
> index 55700ce711f49..9bce720a0a082 100644
> --- a/drivers/mfd/si476x-i2c.c
> +++ b/drivers/mfd/si476x-i2c.c

[ ... ]

> @@ -197,8 +196,7 @@ int si476x_core_start(struct si476x_core *core, bool =
soft)
>  	else
>  		cancel_delayed_work_sync(&core->status_monitor);
> =20
> -	if (core->reset)
> -		gpiod_set_value_cansleep(core->reset, 1);
> +	gpiod_set_value_cansleep(core->reset, 1);

[Severity: Medium]
This is a pre-existing issue, but doesn't this unconditionally assert the
hardware reset during a soft-start error path?

If si476x_core_start() is called with soft =3D true (to avoid toggling the =
reset
line), but an intermediate initialization step fails, the function jumps to
the disable_irq label and unconditionally calls
gpiod_set_value_cansleep(core->reset, 1).  Could this assert a hardware res=
et
against the caller's request?

> =20
>  	return err;
>  }
> @@ -242,10 +240,9 @@ int si476x_core_stop(struct si476x_core *core, bool =
soft)
>  	else
>  		cancel_delayed_work_sync(&core->status_monitor);
> =20
> -	if (!soft) {
> -		if (core->reset)
> -			gpiod_set_value_cansleep(core->reset, 1);
> -	}
> +	if (!soft)
> +		gpiod_set_value_cansleep(core->reset, 1);
> +
>  	return err;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does premature termination of
the polling loop cause the power-down command to reliably timeout?

In si476x_core_stop(), when called with soft=3Dtrue:

drivers/mfd/si476x-i2c.c:si476x_core_stop() {
    ...
    atomic_set(&core->is_alive, 0);

    if (soft) {
        ...
        err =3D si476x_core_cmd_power_down(core, &args);
    }
    ...
}

Because is_alive is cleared immediately, the polling loop stops:

drivers/mfd/si476x-i2c.c:si476x_core_poll_loop() {
    ...
    if (atomic_read(&core->is_alive))
        si476x_core_schedule_polling_work(core);
}

When si476x_core_cmd_power_down() is called, it waits for the CTS flag, but
without the polling loop, is the CTS never checked or signaled, guaranteeing
a timeout?

[Severity: High]
This is a pre-existing issue, but could the driver use a freed FIFO buffer
when unloading?

In si476x_core_remove(), the rds_fifo is freed without canceling the
rds_fifo_drainer worker:

drivers/mfd/si476x-i2c.c:si476x_core_remove() {
    ...
    if (client->irq)
        disable_irq(client->irq);
    else
        cancel_delayed_work_sync(&core->status_monitor);

    kfifo_free(&core->rds_fifo);
}

If an RDS interrupt fires or the polling loop queues rds_fifo_drainer just =
as
the driver is being removed, the worker will write to the freed FIFO:

drivers/mfd/si476x-i2c.c:si476x_core_drain_rds_fifo() {
    ...
    kfifo_in(&core->rds_fifo, report.rds, sizeof(report.rds));
    ...
}

Can this lead to memory corruption and a use-after-free panic?

[Severity: High]
This isn't a bug introduced by this patch, but does the shared static varia=
ble
io_errors_count create a concurrency race and cross-device contamination?

drivers/mfd/si476x-i2c.c:si476x_core_i2c_xfer() {
    ...
    static int io_errors_count;
    ...
}

If multiple Si476x chips exist on the system, any I2C transfer failure
increments this global counter.  Would this artificially inflate errors for
healthy chips and potentially cause incorrect device death pronunciation?

[Severity: Medium]
This is a pre-existing issue, but is the dynamic mutation of the mfd_cell
array violating MFD subsystem guidelines?

drivers/mfd/si476x-i2c.c:si476x_core_probe() {
    ...
    cell =3D &core->cells[SI476X_RADIO_CELL];
    cell->name =3D "si476x-radio";
    ...
}

The MFD subsystem guidelines require all mfd_cell arrays to be defined as
static const to prevent initialization ordering races and memory safety
hazards.  Is it safe to create a mutable copy here?

[Severity: Medium]
This isn't a bug introduced by this patch, but does the usage of a bespoke
parent-child data accessor function bypass standard device APIs?

include/linux/mfd/si476x-core.h:
static inline struct si476x_core *i2c_mfd_cell_to_core(struct device *dev)
{
    ...
}

MFD guidelines strictly prohibit bespoke accessors and require child drivers
to use standard APIs like dev_get_drvdata(pdev->dev.parent).  Might this
introduce tight coupling between parent and child drivers?

[Severity: Medium]
This is a pre-existing issue, but should the driver manually compute cell I=
Ds
instead of using PLATFORM_DEVID_AUTO?

drivers/mfd/si476x-i2c.c:si476x_core_probe() {
    ...
    rval =3D mfd_add_devices(&client->dev,
                           (client->adapter->nr << 8) + client->addr,
                           core->cells, cell_num,
                           NULL, 0, NULL);
    ...
}

The driver manually maps cell IDs to instance numbers.  Doesn't the MFD
subsystem require using PLATFORM_DEVID_AUTO to avoid device naming collisio=
ns
in sysfs and load failures if hardware ID formulas overlap?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715191603.1325=
479-1-andriy.shevchenko@linux.intel.com?part=3D1
