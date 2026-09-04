Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9EC3264CC
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505244; cv=none; b=DqzI5XIwA3Vx/6MeUpPThM2Rqh2+QhlGIFRmXWxDylzH2X/blxsfQPljx2hxSltdDTS8oMZAaqs74nZQI3bSsyWdP3zG35W/5Wq6CVz0dMEBjGoS6M8temKdKRTnCZI7hUgk3ltxl+tr5cRFMGOhF343dULaSlrMcMGpKw+F3jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505244; c=relaxed/simple;
	bh=XZDerz442QdSG/u+OXCpG/H459sgX4aCjdY+15/Sdek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s4cI6J//UvvbEHxndmeAqsm4XOv4NVyJJt1IN+1kw+5ugSXNPnhKh0iS8IPqmyqw7kgDzeIzlNiLQGcF6bU+H0V7eRbbkjINw4zOfUMfErRHw1O2eQjkGIfpfdiqR2GyALFfPfnI5UEuxbbrUB7/Je2Wvw0xPLfcyjE4t2hIVo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2PhFbs5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2PhFbs5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01631F00A3D;
	Fri,  4 Sep 2026 07:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505242;
	bh=RoyfP5mDZ6EMJ/wxQHvbWLCnaP2i4kfSE0Qy5QwJClE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B2PhFbs5pB4/qCtBr5+zqK2jT3fw1aP5nuIJwTYnEsl/EBkfBkBqOCXUHoMkkKXHZ
	 MO+qi9wJzdkfexSlimQJahxnfT+GgOpGDB8tm2dXlyc+BMXPeGptObhJkfxNlsVzIK
	 qoiT9N0KD30Z5RtLsnB4/JiklKZmy0RgGHjDvthqpjpNasL0KNMY6yFSYZOhjkdr5A
	 2eB245N74z6YtQzigyUpdnEyvfYm0JIov82WdHklb0HKqS9gstIY0YHQ9P/2Xs5etw
	 6w/d+swU5ytdEG2IP560WNaI5WxYvLgOlhl+Bet3hQB9mU5swvn8z6VKOmTzxLFBml
	 UllPQBTwsnLSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] mfd: tps65217: Check return value when masking
 interrupt sources
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260904063439.69881-3-r.zhambakiev@prosoftsystems.ru>
References: <20260904063439.69881-1-r.zhambakiev@prosoftsystems.ru>
 <20260904063439.69881-3-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:00:42 +0000
Message-Id: <20260904070042.B01631F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dynamic modification of a shared global mfd_cell array corrupts st=
ate for multiple device instances, violating MFD subsystem guidelines.
- [High] Exported register access helpers perform multi-step non-atomic ope=
rations without locking, risking data corruption and hardware sequence fail=
ures.
--

commit 0a08dce693b0c2fddb33c4fabc4a4eb02027d125
Author: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
mfd: tps65217: Check return value when masking interrupt sources

This commit updates tps65217_irq_init() to check the return value of
tps65217_set_bits() when masking interrupt sources. If the register write
fails, it logs an error and propagates the failure to the caller, preventing
spurious interrupts.

> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index 2d04d9e0ae29c..9a1528456ffc2 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -155,8 +155,13 @@ static int tps65217_irq_init(struct tps65217 *tps, i=
nt irq)
> =20
>  	/* Mask all interrupt sources */
>  	tps->irq_mask =3D TPS65217_INT_MASK;
> -	tps65217_set_bits(tps, TPS65217_REG_INT, TPS65217_INT_MASK,
> -			  TPS65217_INT_MASK, TPS65217_PROTECT_NONE);
> +	ret =3D tps65217_set_bits(tps, TPS65217_REG_INT, TPS65217_INT_MASK,
> +				TPS65217_INT_MASK, TPS65217_PROTECT_NONE);

[Severity: High]
This isn't a regression introduced by this patch, but since we are calling
tps65217_set_bits() here, can concurrent register accesses cause data
corruption?

Looking at tps65217_update_bits() in drivers/mfd/tps65217.c, it performs a
read-modify-write sequence without holding a driver-level mutex:

	ret =3D tps65217_reg_read(tps, reg, &data);
	...
	data &=3D ~mask;
	data |=3D val & mask;

	ret =3D tps65217_reg_write(tps, reg, data, level);

If two concurrent accesses from child drivers (such as regulators accessed
via sysfs) modify the same shared PMIC register, couldn't one of the updates
be overwritten?

Furthermore, tps65217_reg_write() performs multiple consecutive I2C writes
for password protection levels (e.g. L1/L2), which also appear to lack
locking:

	case TPS65217_PROTECT_L1:
		xor_reg_val =3D reg ^ TPS65217_PASSWORD_REGS_UNLOCK;
		ret =3D regmap_write(tps->regmap, TPS65217_REG_PASSWORD,
							xor_reg_val);
		if (ret < 0)
			return ret;

		return regmap_write(tps->regmap, reg, val);

Will concurrent password writes interleave and cause the PMIC I2C password
unlock sequence to fail?

> +	if (ret) {
> +		dev_err(tps->dev, "Failed to mask interrupt sources: %d\n",
> +			ret);
> +		return ret;
> +	}
> =20
>  	tps->irq_domain =3D irq_domain_create_linear(dev_fwnode(tps->dev), TPS6=
5217_NUM_IRQ,
>  						   &tps65217_irq_domain_ops, tps);

[Severity: High]
This isn't a regression introduced by this patch, but does the driver corru=
pt
shared global state during probe?

Looking at drivers/mfd/tps65217.c, the mfd_cell array is defined globally a=
nd
mutably instead of being static const:

static struct mfd_cell tps65217s[] =3D {
	{
		.name =3D "tps65217-pmic",
		...

Then in tps65217_probe(), if a device probes with client->irq =3D=3D 0, the
driver iterates over this global array and mutates it:

	} else {
		int i;

		/* Don't tell children about IRQ resources which won't fire */
		for (i =3D 0; i < ARRAY_SIZE(tps65217s); i++)
			tps65217s[i].num_resources =3D 0;
	}

Doesn't this modification permanently strip IRQ resources from all future
instances of the driver? If a second TPS65217 chip is probed (or the module
is reloaded and the state persists incorrectly), won't it silently lose its
IRQ resources even if it possesses a valid IRQ? This dynamic mutation of
shared global state based on a single instance's properties violates MFD
subsystem guidelines.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904063439.6988=
1-1-r.zhambakiev@prosoftsystems.ru?part=3D2
