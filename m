Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD452EA172
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510033; cv=none; b=XUmd6sLVNy+IksYeID1oW4QpB4Tig5a3n9xyo+enGQ0QTT475mGTLM3kB/cTT5p74H5jPS4Ib0if6vM7inwZ3A1EMpF7DB13jvDVjfPiINYL5IGFxjvy/n0aL/XQAbDt/MJYhMjTSOt8nOfwJ+RRxpI+2cW22W6qXFdv+3LJ/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510033; c=relaxed/simple;
	bh=TzlXFnZfIJBtSxw41ultL3I0AGjP767XkbeSr95ujfs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HkekpU3nqNmF9JMfYoiQW4vrbcOCWtZlyjIy664sB0tI4h23wu0w0W+DasHtJLMvkZiGSnTcI6ch0XKar4t7vNTxFmOjBE7efkTA+zbjG7pVBWmUlbSiVbKKA5sJK9FZ2dkXL0k/JMjdmCirX5L2LfGVX83mGo5jowoMWDa+7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhf+ffOp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhf+ffOp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2721F00A3D;
	Wed,  8 Jul 2026 11:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510032;
	bh=4rS46ZXZTOGSQhmO/Ygp2xIrfPRa1fyLDAkaMUsNGZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jhf+ffOpA36GP0kXST1NwFeW+ryIkO86WrD28fxhZWESIq4yVxSvGojX9Bqfc96hy
	 e57ZxmsmXkZYsCuilbRSNbaBVTqligBKqkc01YMMAtt2R0Bsq95TpqKQkycscSDMFb
	 2AHT0zvPr4A71/U18ZWPecIxrNxSc6+0FoYBRLyooY3lNC3HuDUYbAQDoeszMqDN8s
	 /HNxfb/qn6mUX7yubNhhN35AzNLPKTh7pF7v4vRKuava9H5CHnHlwmXaOZZi3YROCC
	 l152k21tIDLUHBqFkKZXAx9caXDg14HaHi8ihWU1KbD4FYBzdAZpg3+cpDZZlPfSCn
	 9NR60b6y6IRmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/23] mfd: twl6030: Use named initializers for
 of_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <3286c57c088c69d4c9296f66bb8e17bae8824b93.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <3286c57c088c69d4c9296f66bb8e17bae8824b93.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:27:11 +0000
Message-Id: <20260708112712.0B2721F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe error path for `devm_mfd_add_devices()` skips `twl_remove()`=
, leaking I2C dummy devices and causing use-after-free crashes in IRQ/PM ha=
ndlers.
--

--- Patch [14]: [PATCH v2 14/23] mfd: twl6030: Use named initializers for o=
f_device_id ---
commit b98ced8719cc69d2b021a8dc33d71bce99241fa4
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: twl6030: Use named initializers for of_device_id

This commit updates the of_device_id struct initialization to use a named=20
initializer for the .data member, matching the .compatible member. This=20
improves readability and makes it more robust against future struct changes.

> diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
> index 0ca00f618d4d4..4303fb288dd5a 100644
> --- a/drivers/mfd/twl6030-irq.c
> +++ b/drivers/mfd/twl6030-irq.c
> @@ -283,8 +283,8 @@ static const struct irq_domain_ops twl6030_irq_domain=
_ops =3D {
>  };
> =20
>  static const struct of_device_id twl6030_of_match[] __maybe_unused =3D {
> -	{.compatible =3D "ti,twl6030", &twl6030_interrupt_mapping},
> -	{.compatible =3D "ti,twl6032", &twl6032_interrupt_mapping},
> +	{ .compatible =3D "ti,twl6030", .data =3D &twl6030_interrupt_mapping },
> +	{ .compatible =3D "ti,twl6032", .data =3D &twl6032_interrupt_mapping },
>  	{ },
>  };
> =20

[Severity: High]
This is a pre-existing issue, but while reviewing this code I noticed a=20
potential use-after-free issue in the error path.

In drivers/mfd/twl-core.c:twl_probe(), if devm_mfd_add_devices() fails, the=
=20
error path jumps to free:

drivers/mfd/twl-core.c:twl_probe() {
    ...
		status =3D devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
					      cells, num_cells, NULL, 0, NULL);
		if (status < 0)
			goto free;
    ...
fail:
	if (status < 0)
		twl_remove(client);
free:
	if (status < 0)
    ...
}

This skips the fail block and the twl_remove() unwinding step.=20

Meanwhile, earlier in the probe sequence, twl6030_init_irq() explicitly=20
registers a threaded IRQ and PM notifier without devres management:

drivers/mfd/twl6030-irq.c:twl6030_init_irq() {
    ...
	status =3D request_threaded_irq(irq_num, NULL, twl6030_irq_thread,
				      IRQF_ONESHOT, "TWL6030-PIH", twl6030_irq);
    ...
	twl6030_irq->twl_irq =3D irq_num;
	register_pm_notifier(&twl6030_irq->pm_nb);
    ...
}

Because twl_remove() is skipped on this failure path, does this leak the I2=
C=20
dummy devices and leave the interrupt handler and PM notifier active?=20

Since the twl6030_irq structure is managed by devres (devm_kzalloc), it wil=
l=20
be freed upon probe failure. Would this cause a use-after-free if an=20
interrupt triggers or a PM event occurs after the probe fails?=20

Should the error path for devm_mfd_add_devices() jump to fail instead of=20
free to ensure proper cleanup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D14
