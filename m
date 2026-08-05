Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FCD3E4C61;
	Wed,  5 Aug 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918093; cv=none; b=gTQe0MarVWW7Ze1AAjaCmXhvMopma6e85q8I+++Xj9OKzDZT8Qq5pUI6DMWDbD2qKi544giPqdJRtErhDv1HSu7C94wOw2BrXr2GeIBmn11EfWzI3xFzNh8ncYUZgezQEqZMKJ/Eo5wE488QBnRBTqT3WrK2hteqE+NAfonNEmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918093; c=relaxed/simple;
	bh=LqbBCVKVu42WvTCPOZUJK/LCzgH8kbq2R1/Zl2ONs/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rZoFVJGuJYkN9FIgdiYjcdW1LRFCMKgR+zjAvMsqKhdWFMEbqP1Ai/7p/S0Sy7qE7O8Af24pwozg0Q9pl4itdXT7QeGIrW+jUXa73gRm0OJYofvbkwBzR5AyG1j1vgEZurpV37rjOsmimCW5gRmnvPv6cO9y515uHLeOp5kDSg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rk36UKP9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rk36UKP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73A51F00A3A;
	Wed,  5 Aug 2026 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785918092;
	bh=NbdiyeFS/os8W5Sf7jTHUQgF8FEYgvVNvYBcPApQ6WQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rk36UKP9+JUmB5iPaiyvYL3BBTit7Fmc+OVjvANuWJrgFk/hVF0GbIWCB6rbUZ0EN
	 t1NbHedSI3JfFV7XhWUn2iDFOarpW3Rz7vOb+kF9OqKM9D5b4WrP5GeT4IaXQk+fz6
	 hl5bzYMgPcJdEXIVLwTG8tvie3u8GUVs0p9IMtjsEmq5kVxebyop7+FBr+RwWiLeor
	 Jg9ENN9ZOsmrTz//2rvFPdAx8pLkaEbE57Rh8HxyzKfTmD1wYZ1x1SitKIZgRS1tpy
	 +egiiGtOujbSJqs8AXBGKpw7A8bAThmMNHw/DTfIeNh9q+z+BPXnPAUWyy/rcwZYrp
	 6B4fBomy4Rogw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:21:31 +0000
Message-Id: <20260805082131.D73A51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing regulator_disable() in error paths and on driver unbind.
- [High] Regulator devres allocation is incorrectly attached to the parent =
device.
- [Medium] In suspend and shutdown, the code bypasses the newly introduced =
`levels` abstraction and contains dead state-saving logic.

Pre-existing issues:
- [Critical] Thermal cooling device devres allocation is incorrectly attach=
ed to the parent device, leading to UAF on child unbind.
--

--- Patch [4]: [PATCH v9 4/6] thermal: khadas-mcu-fan: Add fan config from =
platform data Add regulator support ---
commit cdd1fb53966220cb2785c705c998afe04ac55405
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

thermal: khadas-mcu-fan: Add fan config from platform data Add regulator su=
pport

This commit updates the khadas-mcu-fan driver to read fan configuration
(register and levels) from platform data instead of using hardcoded values.
The cooling device's state is stored as an index into levels[]. It also
optionally acquires and enables a "fan" regulator supply during probe and
resume.

> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mc=
u_fan.c
> index 21b3d0a71bd0d..c7f74394b823f 100644
> --- a/drivers/thermal/khadas_mcu_fan.c
> +++ b/drivers/thermal/khadas_mcu_fan.c
> @@ -13,34 +13,30 @@
>  static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>  				    unsigned int level)
>  {
> -	int ret;
> -
> -	ret =3D regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_R=
EG,
> -			   level);
> -	if (ret)
> -		return ret;
> -
> -	ctx->level =3D level;
> -
> -	return 0;
> +	return regmap_write(ctx->mcu->regmap, ctx->fan_reg, level);
>  }

[Severity: Medium]
Since this function no longer updates ctx->level and now takes a raw regist=
er
value instead of a state index, does this break khadas_mcu_fan_suspend() and
khadas_mcu_fan_shutdown()?

Both functions still call khadas_mcu_fan_set_level(ctx, 0), which now write=
s a
raw 0 to the hardware instead of ctx->levels[0]. Additionally, the state-sa=
ving
logic in suspend is now dead code since khadas_mcu_fan_set_level() no longer
mutates ctx->level.

[ ... ]

> @@ -87,7 +91,22 @@ static int khadas_mcu_fan_probe(struct platform_device=
 *pdev)
>  	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return -ENOMEM;
> +
>  	ctx->mcu =3D mcu;
> +	ctx->fan_reg =3D pdata->fan_reg;
> +	ctx->levels =3D pdata->levels;
> +	ctx->nlevels =3D pdata->nlevels;
> +
> +	ctx->power =3D devm_regulator_get(dev->parent, "fan");

[Severity: High]
Does devm_regulator_get() incorrectly attach the devres release action to
the parent device instead of the child device?

If the child driver is unbound or probe defers repeatedly, the memory and
regulator handle could be permanently leaked on the parent device's devres
list. Should this use dev instead of dev->parent?

> +	if (IS_ERR(ctx->power))
> +		return PTR_ERR(ctx->power);
> +
> +	ret =3D regulator_enable(ctx->power);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable fan power supply: %d\n", ret);
> +		return ret;
> +	}
> +
>  	platform_set_drvdata(pdev, ctx);
> =20
>  	cdev =3D devm_thermal_of_child_cooling_device_register(dev->parent,

[Severity: Critical]
This is a pre-existing issue, but does using dev->parent for the thermal
cooling device devres allocation mean the cooling device will outlive the
child device?

If the child driver is unbound via sysfs, ctx is freed, but the cooling
device remains active on the parent. Could reading the cooling device state
via sysfs then cause a use-after-free by dereferencing the freed ctx pointe=
r?

>  							     dev->parent->of_node,
>  							     "khadas-mcu-fan", ctx,
>  							     &khadas_mcu_fan_cooling_ops);
>  	if (IS_ERR(cdev)) {
>  		ret =3D PTR_ERR(cdev);
>  		dev_err(dev, "Failed to register khadas-mcu-fan as cooling device: %d\=
n",
>  			ret);
>  		return ret;

[Severity: High]
If devm_thermal_of_child_cooling_device_register() fails here, does the
probe function return without disabling the manually enabled regulator?

>  	}

[ ... ]

> @@ -125,14 +144,19 @@ static int khadas_mcu_fan_suspend(struct device *de=
v)
>  static int khadas_mcu_fan_resume(struct device *dev)
>  {
>  	struct khadas_mcu_fan_ctx *ctx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D regulator_enable(ctx->power);
> +	if (ret)
> +		return ret;
> =20
> -	return khadas_mcu_fan_set_level(ctx, ctx->level);
> +	return khadas_mcu_fan_set_level(ctx, ctx->levels[ctx->level]);
>  }

[Severity: High]
If khadas_mcu_fan_set_level() fails here and returns an error to the PM cor=
e,
does the regulator remain permanently enabled?

Additionally, it appears the driver is missing a .remove callback in the
platform_driver definition to symmetrically disable the regulator on unbind.
Could this lead to a leak of the regulator enable count?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-add-mcu-fa=
n-khadas-vim4-v9-0-75df78710b9e@aliel.fr?part=3D4
