Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4DC399889
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616986; cv=none; b=o/AKbFDP31nWayGD+2cuMuWYwtbfmkhnsv0nWLYN9hjrZB/DobndoldhcTlehSQ2LQBa0iY9LgQC+ohwUMwCLFzStopd2UdJkjRqZXH2vbQCw84KVcdxvJFlBF8DT/+tTGB9Wg8D51jO/NQtzjORLUiLgO/Np1+coaa2KsUQ5Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616986; c=relaxed/simple;
	bh=hBH7s5tZlSOCTAUE/68W9AsGsBVu9wnvy+GbGEhDlAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YAFDEJ+GaDf1w8tRR1/pdCDJRuw1sCdXYGFw9HCL/oikychGPgS48c4pKipQ7r2ttS2BxMUe3KGni4gHEdf/Qs0GIJiLsEcrNNt211tDgjo49nawrlvkl36dHr+hE61Gt5MTjNCHk7lsEDysqjHrJGDE44GyOzdfXKLmQ/TtV7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nd4AV2yK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nd4AV2yK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3271F000E9;
	Thu,  9 Jul 2026 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616985;
	bh=6CgojAYYnLhS2V63wygyw6u1o15zhbYiIjMVCC93bso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nd4AV2yKLRVfHGQdK+AbewBwuM6mVaRLXzzKE7ku69aEqx6BsWcXIO1BhP0pkWpV8
	 Ranj/r2CPHmJXWX9Evw4KYrz3lfvzAwdcCvTG7de32FHlfwv6pxC2o+j4OdrMYvG0p
	 3/eHZ3KA1Iz6cU7i+YPAi0xG2DvoWkP+yqHw2itQdBMAZQOPgCL0v95/0s6PCkgK8V
	 RR528INeZRFRq+sN4Qj0P/hpSmDbiRP+SDfjtAciXaGQ4/ZUuylUPOXbOpyudlUaqs
	 EgEcJMPHenneSdG9zbafzk1qSx6sqNIOnhiUZKig0LJBi6l/0jSKnlghQsFjft0t3x
	 Xah2elbCkNIaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/23] mfd: loongson-se: Drop unused assignment of
 acpi_device_id driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <8eedf9c9d52ac6a6924655218cd65b4021ce90da.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <8eedf9c9d52ac6a6924655218cd65b4021ce90da.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:09:44 +0000
Message-Id: <20260709170945.5B3271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] loongson_se_probe ignores failures when acquiring and requesting I=
RQs, leading to a permanent hang during probe.
- [High] The driver blindly trusts dmam_size from ACPI and performs no boun=
ds checking before calculating engine command buffer offsets.
- [High] Missing reinit_completion() leads to synchronization loss if wait_=
for_completion_interruptible() is interrupted.
- [High] The interrupt handler calculates an array index from a hardware re=
gister without bounds checking, leading to out-of-bounds memory corruption.
- [High] The driver is missing a `.remove` callback to cleanly shut down th=
e hardware and disable device interrupts upon module unload.
--

--- Patch [7]: [PATCH v3 07/23] mfd: loongson-se: Drop unused assignment of=
 acpi_device_id driver data ---
commit 4b61d5aca25b81bb580341e9657861de846add5b
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: loongson-se: Drop unused assignment of acpi_device_id driver data
   =20
The driver explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop this unused
assignment.

> diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
> index 3902ba377d690..4c668e2d22412 100644
> --- a/drivers/mfd/loongson-se.c
> +++ b/drivers/mfd/loongson-se.c
> @@ -233,7 +233,7 @@ static int loongson_se_probe(struct platform_device *=
pdev)
>  }
> =20
>  static const struct acpi_device_id loongson_se_acpi_match[] =3D {
> -	{ "LOON0011", 0 },
> +	{ "LOON0011" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, loongson_se_acpi_match);

[Severity: High]
This is a pre-existing issue, but looking at loongson_se_probe() in the same
file:

drivers/mfd/loongson-se.c:loongson_se_probe() {
    ...
    for (i =3D 0; i < nr_irq; i++) {
        irq =3D platform_get_irq(pdev, i);
        err =3D devm_request_irq(dev, irq, se_irq_handler, 0, "loongson-se"=
, se);
        if (err)
            dev_err(dev, "failed to request IRQ: %d\n", irq);
    }

    err =3D loongson_se_init(se, paddr, se->dmam_size);
    ...
}

If devm_request_irq() fails and returns an error, the error is merely logge=
d=20
and the loop continues.=20

When loongson_se_init() subsequently sends a start command and waits via
wait_for_completion_interruptible(), could this result in a permanent deadl=
ock=20
since no IRQ handler is registered to call complete()?

[Severity: High]
This isn't a bug introduced by this patch, but reviewing the initialization
path:

drivers/mfd/loongson-se.c:loongson_se_init_engine() {
    ...
    engine->command =3D se->dmam_base + id * (2 * SE_ENGINE_CMD_SIZE);
    engine->command_ret =3D engine->command + SE_ENGINE_CMD_SIZE;
    ...
}

The driver appears to read dmam_size from ACPI and calculate pointer offset=
s=20
without any bounds checking.=20

If a modified or broken ACPI table provides an unexpectedly small dmam_size=
,=20
does this sequence calculate out-of-bounds pointers that will corrupt memor=
y=20
when child drivers write commands?

[Severity: High]
This is a pre-existing issue, but examining the command wait functions:

drivers/mfd/loongson-se.c:loongson_se_send_controller_cmd() {
    ...
    return wait_for_completion_interruptible(&se->cmd_completion);
}

These functions wait for hardware commands using=20
wait_for_completion_interruptible(). If this wait is interrupted by a signa=
l,=20
it returns early while the hardware continues processing.=20

When the hardware finishes later, the IRQ handler will call complete() and=
=20
increment the completion done counter.=20

Because reinit_completion() is not called before sending the next command,=
=20
could a subsequent wait return immediately and cause the driver to read=20
incomplete DMA data?

[Severity: High]
This isn't a bug introduced by this patch, but looking at the interrupt=20
handler:

drivers/mfd/loongson-se.c:se_irq_handler() {
    ...
    id =3D __ffs(int_status);
    complete(&se->engines[id].completion);
    ...
}

The interrupt handler calculates an array index directly from a hardware=20
register.=20

If a PCIe surprise removal or hardware error occurs and the register read=20
returns 0xFFFFFFFF, could this loop process bits 16-31 and cause an=20
out-of-bounds write past the end of the engines array?

[Severity: High]
This is a pre-existing issue, but I noticed the platform driver definition:

drivers/mfd/loongson-se.c:loongson_se_driver
static struct platform_driver loongson_se_driver =3D {
    .probe   =3D loongson_se_probe,
    .driver  =3D {
        ...
    },
};

The driver lacks a .remove callback to cleanly shut down the hardware.=20

When the module is removed, devres will automatically free the IRQ handler=
=20
and unmap the DMA memory. Since the hardware is never instructed to stop,=20
will it continue performing DMA writes into the freed memory region and=20
trigger an unhandled IRQ storm?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D7
