Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0877A4BD370;
	Wed, 14 Oct 2026 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980714; cv=none; b=pT/+sGFkDCgMdTxuR9hAd4KSqR1W5UmQdERIIM8OqjPAgHT4sX33PuYJgwbYX29FM3lwftn8vOdUM4ufzbmhg1Zb+BO6CW0EGGSufqeL4p3QKuntWM7ZT8DLGBDxgNmBF3LowFyFTrz5+BKeDud7K0WBFMtOJdzsw+9e3PmzCNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980714; c=relaxed/simple;
	bh=jbWhlhq7XDAQR8TndOhpYpwYC9W4fJVTUdvOYd2QnTo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=O9MSDf+lRr79hr7SvFn2ktQzgiMRnkgGUdzD7fBI00f97dOXkzWTt7rH7wz0dGb6mmo98MYFp9bL0MsQu4cl0VJ2pVaMK5OAe8IPMc/9gSRx/f+ARQpLzPEvaeTbmP1W5/RQFvSHt0GzMbo0L3B4gk2nkMg+9bY0IeiVujOlKLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Voc/cZH/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Voc/cZH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8967C1F000FF;
	Wed, 14 Oct 2026 12:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791980711;
	bh=4tJK3Ja6yFuD15xGvwfL7N7QaVABv3U/G5A8GWe5v64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Voc/cZH/0JJJKHPlVhD/mTPdIxPXaPzv0Z6rSQSQ/Pp7kNGup03+vrZH2rscTKlD8
	 SrbS1ksg0O1xCcF5OcEeIqGzbMWOGjipqE7A9+SlgwvMcTaL3tw4HbtiTYhT6hEJIx
	 8SoMvjmGWpHHc8vA6yA+fnq97cOwm4U9wQPOXAjWZ8Hi369c5TERQ4XochvMqP4ls+
	 2UA4NYdLcFlY0pA18N/y2CaC2XesCd0In+F7mdQ5mYQD1EFMEg5oKAxJ3v4mbeS1MT
	 lQcF8kXsXV92RGeUtd1cM+wk5c7FsueB5eZUw0X23FEqHrqTbT/hwEduNsmTKYLTC+
	 4WZmFiEeeh0GA==
Message-ID: <sashiko-outbox-171274@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3 RESEND] mfd: max8907: Convert to use device
 managed poweroff handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261014121544.138958-4-clamor95@gmail.com>
References: <20261014121544.138958-1-clamor95@gmail.com>
 <20261014121544.138958-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:25:11 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] mfd: max8907: regmap mutex deadlock and sleep in atomic power-off
- [Low] mfd: max8907: missing <linux/property.h> for device_property_read_b=
ool()
- [Low] mfd: max8907: misleading error message in power-off handler
--

commit 5506b550cb60d6cb6be8b862f1268bdb1e810f08
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: max8907: Convert to use device managed poweroff handler

Replace the legacy global 'pm_power_off' function pointer assignment with
the devm_register_sys_off_handler() helper.

> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index 363ac80c0593b..9c40f0551a8ce 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c
[ ... ]
> -static struct max8907 *max8907_pm_off;
> -static void max8907_power_off(void)
> +static int max8907_power_off(struct sys_off_data *data)
>  {
> -	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
> -			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
> +	struct max8907 *max8907 =3D data->cb_data;
> +	int ret;
> +
> +	ret =3D regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
> +				 MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);

[Severity: High]
Does this code risk a deadlock or sleep in an atomic context?

The handler max8907_power_off() is registered with SYS_OFF_MODE_POWER_OFF.
This means it will be called via an atomic notifier chain during system
shutdown, after machine_power_off() stops CPUs and disables interrupts.
However, regmap_update_bits() acquires a mutex and invokes I2C transfers
that can sleep.

Should this use SYS_OFF_MODE_POWER_OFF_PREPARE instead? That mode uses a
blocking notifier chain and runs in process context before CPUs are stopped.

> +	if (ret)
> +		dev_err(max8907->dev, "failed to restart device!\n");

[Severity: Low]
Is this error message accurate?

This error path logs a failure to "restart device", but max8907_power_off()
is explicitly used for powering off the device, not restarting it.

> +
> +	return NOTIFY_DONE;
>  }
> =20
>  static int max8907_i2c_probe(struct i2c_client *i2c)
>  {
>  	struct max8907 *max8907;
>  	int ret;
[ ... ]
> @@ -204,6 +209,16 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
>  		goto err_regmap_gen;
>  	}
> =20
> +	if (device_property_read_bool(&i2c->dev, "system-power-controller") ||
> +	    device_property_read_bool(&i2c->dev, "maxim,system-power-controller=
")) {

[Severity: Low]
Could this lead to a build failure due to a missing header?

The patch replaces of_property_read_bool() with device_property_read_bool()
in max8907_i2c_probe(). The new function is defined in <linux/property.h>,
but that header is not explicitly included in this file. Relying on implicit
transitive headers might break builds on some architectures or
configurations.

> +		ret =3D devm_register_sys_off_handler(&i2c->dev, SYS_OFF_MODE_POWER_OF=
F,
> +						    SYS_OFF_PRIO_DEFAULT,
> +						    &max8907_power_off, max8907);
> +		if (ret)
> +			return dev_err_probe(&i2c->dev, ret,
> +					     "failed to register poweroff handler\n");
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014121544.1389=
58-1-clamor95@gmail.com?part=3D3
