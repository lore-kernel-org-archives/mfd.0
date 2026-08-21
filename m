Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257FA282F1E
	for <mfd@lists.linux.dev>; Fri, 21 Aug 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316567; cv=none; b=metvCThl5c2QQggBKzIZ/DJe99XsrRo4dTXUTgVhr3HoeMwhHxED0bQIMzFKIvFPr2+XRt3fYRyxlAkUUfNrB1txBy5Kouu6+b40IYdK7uf3N8oEvLm0HPBO5DF403+ekNNeIwdZSkygbAlPQcJVhzpUAUxk169gB34x9NxXyyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316567; c=relaxed/simple;
	bh=8FXpNBecW8rNB+chHy9lPnuPcIl8q9hG4U2fW8qF5KI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RWvCAqfj9kSo6EmTG5ChAjmovATimWag9osjOTnJpSARwUcgaVvKtnMAiwFRou1N4QfOSqwKCc07l2VQRtaNNHCihlDzUyWWqZPIyHdgI/iy7G+VXokAt7nsYEw+w4RyhgK9oUJ7m/XBx2IpRXs/Pe/oxBtF+LqM5m8g/B5nk6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eimw87O/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eimw87O/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380861F000E9;
	Fri, 21 Aug 2026 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787316562;
	bh=KJCDyC6UNXarXAFAGIlRqJRkw3H6DCi8cPehPYJbOSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eimw87O/aGLf0dK9uxCiiDmDj1BAwW/pwX5SVkzFEezCgqZe2RpQEMEGqiy8kUvWt
	 8HpjFgp8VvWHyAIFgvqWlbZCf8lOh2O7JEgtPb4hNES2eDUBcfzs/mi7LSAvOOdNex
	 NCFlYlQgKP2cNsbIL98K4xYW8yML7KnyQCd8sGo69tv1BU2dI2cTdXEb0fMedt/YHw
	 Gv+y9fGFScZrUvgBl3r+IPRBbqZ5R0TTpykII2+xVvSdvu2y8NYFXuSe4NTL1lkBkL
	 v0qHKyyY3nExxLBbuYOEdv446ioEumJ6+bEVhCiZR4PxpCL8gUsoFfsMAMwKJstzCG
	 tQZDYtmHeS7eQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] mfd: tps65217: Fix NULL pointer dereference on
 IRQ init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260821123712.260443-2-r.zhambakiev@prosoftsystems.ru>
References: <20260821123712.260443-1-r.zhambakiev@prosoftsystems.ru>
 <20260821123712.260443-2-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:49:21 +0000
Message-Id: <20260821124922.380861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `tps65217s` mfd_cell array is a mutable static array globally =
shared across instances, and its elements are permanently modified during p=
robe.
- [High] Missing zero check on the return value of `irq_find_mapping()` lea=
ds to a potential NULL pointer dereference in the interrupt handler.
- [High] Time-Of-Check to Time-Of-Use (TOCTOU) race condition in unprotecte=
d read-modify-write and password-protected register sequences.
--

--- Patch [1]: [PATCH v2 1/4] mfd: tps65217: Fix NULL pointer dereference o=
n IRQ init failure ---
commit 0c3c0828f7215d1d780ea170098321e2547d6b88
Author: =D0=96=D0=B0=D0=BC=D0=B1=D0=B0=D0=BA=D0=B8=D0=B5=D0=B2 =D0=A0=D0=B0=
=D0=B4=D0=B8=D0=B9 =D0=A0=D0=B8=D0=BA=D0=B0=D1=80=D0=B4=D0=B8=D0=BD=D0=BE=
=D0=B2=D0=B8=D1=87 <r.zhambakiev@prosoftsystems.ru>

mfd: tps65217: Fix NULL pointer dereference on IRQ init failure
   =20
tps65217_probe() ignores the return value of tps65217_irq_init(), so
when the irq domain creation fails the probe still completes and the
driver ends up bound with a NULL tps->irq_domain. Unloading the
module then makes tps65217_remove() call irq_domain_remove() on the
NULL pointer and oops the kernel. On top of that, irq_find_mapping()
may fall back to the default irq domain and dispose of mappings that
belong to other interrupt controllers.
   =20
Check the return value and abort the probe on failure so the error
is reported and no inconsistent state is left for removal.

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index c240fac0ede76..2d04d9e0ae29c 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -83,8 +83,8 @@ static struct irq_chip tps65217_irq_chip =3D {
>  	.irq_enable		=3D tps65217_irq_enable,
>  	.irq_disable		=3D tps65217_irq_disable,
>  };
> =20
>  static struct mfd_cell tps65217s[] =3D {

[Severity: High]
This isn't a bug introduced by this patch, but should the tps65217s
mfd_cell array be defined as static const?

Because it is a mutable static array globally shared across instances,
if one PMIC instance is probed without an IRQ, the driver modifies the
global static array in tps65217_probe():

	} else {
		int i;

		/* Don't tell children about IRQ resources which won't fire */
		for (i =3D 0; i < ARRAY_SIZE(tps65217s); i++)
			tps65217s[i].num_resources =3D 0;
	}

Could this permanently zero out the resources for all future instances of
the PMIC driver on the system, breaking subsequent instances that do possess
an IRQ?

[ ... ]

> @@ -121,8 +121,8 @@ static irqreturn_t tps65217_irq_thread(int irq, void =
*data)
>  	}
> =20
>  	for (i =3D 0; i < TPS65217_NUM_IRQ; i++) {
>  		if (status & BIT(i)) {
>  			handle_nested_irq(irq_find_mapping(tps->irq_domain, i));

[Severity: High]
This is a pre-existing issue, but could this cause a NULL pointer
dereference?

If a spurious interrupt or an unmapped interrupt triggers,
irq_find_mapping() will return 0.

Would passing 0 directly to handle_nested_irq() lead to a panic?

[ ... ]

> @@ -218,12 +218,12 @@ int tps65217_reg_write(struct tps65217 *tps, unsign=
ed int reg,
> =20
>  		return regmap_write(tps->regmap, reg, val);
>  	case TPS65217_PROTECT_L2:
>  		xor_reg_val =3D reg ^ TPS65217_PASSWORD_REGS_UNLOCK;
>  		ret =3D regmap_write(tps->regmap, TPS65217_REG_PASSWORD,
>  							xor_reg_val);
>  		if (ret < 0)
>  			return ret;
>  		ret =3D regmap_write(tps->regmap, reg, val);

[Severity: High]
This isn't a bug introduced by this patch, but does the multi-step password
unlock sequence lack driver-level locking?

If concurrent threads (e.g. from regulator and charger child drivers) write
to a password-protected register, could their I2C transactions interleave
and break the PMIC unlock state machine?

[ ... ]

> @@ -248,8 +248,8 @@ static int tps65217_update_bits(struct tps65217 *tps,=
 unsigned int reg,
>  		unsigned int mask, unsigned int val, unsigned int level)
>  {
>  	int ret;
>  	unsigned int data;
> =20
>  	ret =3D tps65217_reg_read(tps, reg, &data);

[Severity: High]
This is a pre-existing issue, but does this function have a Time-Of-Check
to Time-Of-Use (TOCTOU) race condition?

Because the read and write operations are separate regmap calls without a
lock, could concurrent updates interleave and result in lost register
updates or data corruption?

[ ... ]

> @@ -333,7 +333,9 @@ static int tps65217_probe(struct i2c_client *client)
>  	}
> =20
>  	if (client->irq) {
> -		tps65217_irq_init(tps, client->irq);
> +		ret =3D tps65217_irq_init(tps, client->irq);
> +		if (ret)
> +			return ret;
>  	} else {
>  		int i;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821123712.2604=
43-1-r.zhambakiev@prosoftsystems.ru?part=3D1
