Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8EA485CDE
	for <mfd@lists.linux.dev>; Fri, 14 Aug 2026 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786722093; cv=none; b=KIo9a20VXTgvHj0TZTi+TC/pdd7wdayw6NxuRVIUfDo9hWzyCPDQeOlr1kwJWZNzNclBYgJ2GVA90Mw78yfnNZCvd1w/95bfPCv3ztIwgzuKh1gmOI8gQl3WGlIT4hxbC2I5T30Lggc4SHX0qHmmf2XQLn1pE6FSFN96mlrKmkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786722093; c=relaxed/simple;
	bh=bDlqYH/RCJANqVhVuY/4ALE0UPNskHsyZ4kBvcDs7BU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CdsSTVtdF0hkxc2CMUL+tVYgLtj6yEhueZND9hr/SbXJMrD7YlXgU32NIJKWJVuKXeU5gfAzjsrpdJ0Y3e3+813eXvmnDNPR+5y1FL5mE8w9GSLMhu7CEIXCkPcoJQY1e18ZCPkgP74m2oiw2SNhskLo5B8Bzb6MMy8qlS/qz7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qhf7RRKx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qhf7RRKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1302A1F000E9;
	Fri, 14 Aug 2026 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786722091;
	bh=oPb2SWDSEGJwxPlClhFqgbFPeFFKk36pddZnOH01Hzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qhf7RRKxVl6jqQ53tbAxQHzJDgHzltjx0JOSLJVv2O2329otDgHyMwC6ySB20bm0k
	 hKzrgH2G6pJ3viu8uFrHfeW8TL5oE4QwXZ1xRqAty0qwcDaFGvHeApl0VwxLCIELel
	 sWH4ZVbJKqwIvrhksyz91YlOcZCZ93rKVTzzryfe5CwAaov9vjun883hAYc7Vg+rM7
	 txF01PwOr3870DyToz0bj8xjG0NVRWazaDksjgCZzZiedjfQDjud+x1gZCS8DMfDT0
	 TrrOcPZ6I5vOpJ/WNMVRE0uGtCbw70ndEPmA0hgq0d+6UQex1tAnBe9eoHEnOdM5HO
	 bzYmivqbu8Llw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: da903x: cancel IRQ work during teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyan Xu" <getshell@seu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260814153019.1114-1-getshell@seu.edu.cn>
References: <20260814153019.1114-1-getshell@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 15:41:30 +0000
Message-Id: <20260814154131.1302A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description string is not capitalized.

Pre-existing issues:
- [High] Missing NULL check for `pdata` in probe path leads to kernel Oops.
- [High] Data race on `chip->events_mask` leading to lost interrupt masks.
--

--- Patch [1]: [PATCH v3] mfd: da903x: cancel IRQ work during teardown ---
commit d86788370ab7658c6e3b5684327f0a0b0169e280
Author: Hongyan Xu <getshell@seu.edu.cn>

mfd: da903x: cancel IRQ work during teardown

The IRQ handler disables the IRQ and schedules irq_work. Releasing the
IRQ does not drain that work, which can continue to use the devm-allocated
chip and notifier state. Manage both IRQ-work cancellation and subdevice
removal with devres.

> mfd: da903x: cancel IRQ work during teardown

[Severity: Low]
This isn't a bug, but there's a minor formatting issue in the commit messag=
e.
The MFD subsystem guidelines require capitalizing the description after the
subsystem prefix.

Could the commit message be updated to use 'Cancel' instead of 'cancel' to
match these conventions?

> diff --git a/drivers/mfd/da903x.c b/drivers/mfd/da903x.c
> index e86b39de3303a..e4ad48e1f139b 100644
> --- a/drivers/mfd/da903x.c
> +++ b/drivers/mfd/da903x.c
[ ... ]
> @@ -520,6 +534,11 @@ static int da903x_probe(struct i2c_client *client)
>  	chip->ops->mask_events(chip, chip->events_mask);
>  	chip->ops->read_events(chip, &tmp);

[Severity: High]
This is a pre-existing issue, but I noticed a potential data race involving
updates to chip->events_mask.

The exported functions da903x_register_notifier() and
da903x_unregister_notifier() call da9030_unmask_events() and
da9030_mask_events().

These functions perform non-atomic read-modify-write operations without
holding chip->lock:

drivers/mfd/da903x.c:da9030_unmask_events() {
    ...
    chip->events_mask &=3D ~events;
    ...
}

If multiple child drivers (like backlight or regulator) are probed or remov=
ed
concurrently, could these bitwise updates race and overwrite each other's
changes?

Would this lead to lost updates to the interrupt mask, causing some child
devices to permanently miss interrupts?

> +	ret =3D devm_add_action_or_reset(&client->dev,
> +				       da903x_remove_subdevs_action, chip);
> +	if (ret)
> +		return ret;
[ ... ]
> @@ -529,14 +548,12 @@ static int da903x_probe(struct i2c_client *client)
>  		return ret;
>  	}
> =20
> -	return da903x_add_subdevs(chip, pdata);
> -}
> -
> -static void da903x_remove(struct i2c_client *client)
> -{
> -	struct da903x_chip *chip =3D i2c_get_clientdata(client);
> +	ret =3D devm_add_action_or_reset(&client->dev, da903x_cancel_irq_work,
> +				       chip);
> +	if (ret)
> +		return ret;
> =20
> -	da903x_remove_subdevs(chip);
> +	return da903x_add_subdevs(chip, pdata);
>  }

[Severity: High]
This is a pre-existing issue, but I noticed a potential null pointer
dereference when passing pdata here.

If the I2C device is dynamically instantiated via the sysfs new_device
interface or if platform code fails to attach platform data,
dev_get_platdata(&client->dev) returns NULL.

This null pointer is then passed unconditionally to da903x_add_subdevs(),
which dereferences it immediately:

drivers/mfd/da903x.c:da903x_add_subdevs() {
    ...
    for (i =3D 0; i < pdata->num_subdevs; i++) {
        subdev =3D &pdata->subdevs[i];
    ...
}

Could this lead to a kernel oops triggered by privileged userspace interact=
ing
with sysfs?

Should we add a null check for pdata before creating subdevices?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814153019.1114=
-1-getshell@seu.edu.cn?part=3D1
