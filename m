Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E345834FF74;
	Tue,  1 Sep 2026 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278326; cv=none; b=pGD9vmYS9Ct5VGuD1lmbH2b2o1e62QZI/FQUMSqH8QsPdkFP8mrXLw0+x5mIDQDol0iPq7XClcWUqu9REHlJHULHuNp6SkioUJHGNMf48iOm3i75m/rN+ADpwB3xkQBptPeK36j0xCEknk7Vf04FmvfAtlv9+Yozf5iZm85lxUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278326; c=relaxed/simple;
	bh=xgUcfwuLD2235xRbvvfCNAwIjpmWobPk2FbgQfVNMKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mQKRUxcGcWkImSK8hJkGD+znPdiyqGbN7cvW90GyBknl3bBqZWH0KCAkgbTL+V18yxRjnAdDHAURtCGRMoXVcqSjoreeDglZm5EwUBUT8xz3isosPku9SdexaBePjVJ7ZAHBqUyrthnrzKLcncOTGCIf9nx0bnHX+vJzE1l3NrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT45qC47; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT45qC47"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B2B1F000E9;
	Tue,  1 Sep 2026 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788278324;
	bh=M43OAN8l1nYO1zD2yvmzenQEcmoNg8EPMdD61wfp1PA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TT45qC47Wa8fvW4pU5u5Vkigw74cs87JU7vD5drs6ndn6ZIPcN2S8mZngbojYYdHP
	 Put2oHSgbsydo8uIO24sAPz+6R9jF+Pua/hlMFSIiVe6AJ+A6dhMMJcv873efyPjMs
	 9UT/m0QeV03up7SfJvKppX5XZO/Be5kbuZawM5hCULZ6/90Rb7y0Bsx0ZZBzN7cGT3
	 cgrbSV2p5QwZ6UYuX5/qJtMZ3jJ0Z5+AUp7/ehdyspH/yaX7Y8ucPjMoFUb0dAjdoi
	 EgEJmSNp4EWFnDZwh+wAIrmN/RLunFs4vF8LrBLo1FHlHfycahFshbwFfQf+1bD1nI
	 FZhDk09yvb4SQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260901-add-mcu-fan-khadas-vim4-v10-4-aecdb9955a30@aliel.fr>
References: <20260901-add-mcu-fan-khadas-vim4-v10-0-aecdb9955a30@aliel.fr>
 <20260901-add-mcu-fan-khadas-vim4-v10-4-aecdb9955a30@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:58:43 +0000
Message-Id: <20260901155844.00B2B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Direct assignment of `dev->of_node` without `of_node_get()` causes=
 a reference count underflow and use-after-free on device removal.
- [Medium] State desynchronization on `khadas_mcu_fan_suspend` error path l=
eaves the fan permanently disabled.
- [Medium] Unchecked platform data pointer dereference causes a potential k=
ernel panic.
- [Medium] Rolling back `regulator_enable` in the `khadas_mcu_fan_resume` e=
rror path causes a regulator enable count underflow on driver unbind.
--

commit 48a15d3c23acef32291aa52062459e22677349e6
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

thermal: khadas-mcu-fan: Add fan config from platform data Add regulator su=
pport

This commit reads the fan register and level table from platform data inste=
ad
of hardcoding them. It also introduces regulator support for the fan's power
supply during probe, resume, and suspend.

> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mc=
u_fan.c
> index 21b3d0a71bd0d..512a6f0ff7c26 100644
> --- a/drivers/thermal/khadas_mcu_fan.c
> +++ b/drivers/thermal/khadas_mcu_fan.c

[ ... ]

> @@ -76,22 +82,53 @@ static const struct thermal_cooling_device_ops khadas=
_mcu_fan_cooling_ops =3D {
>  	.set_cur_state =3D khadas_mcu_fan_set_cur_state,
>  };
> =20
> +static void khadas_mcu_fan_regulator_disable(void *data)
> +{
> +	struct regulator *power =3D data;
> +
> +	regulator_disable(power);
> +}
> +
>  static int khadas_mcu_fan_probe(struct platform_device *pdev)
>  {
> +	const struct khadas_mcu_fan_pdata *pdata =3D dev_get_platdata(&pdev->de=
v);
>  	struct khadas_mcu *mcu =3D dev_get_drvdata(pdev->dev.parent);
>  	struct thermal_cooling_device *cdev;
>  	struct device *dev =3D &pdev->dev;
>  	struct khadas_mcu_fan_ctx *ctx;
>  	int ret;
> =20
> +
> +	if (!dev->of_node)
> +		dev->of_node =3D dev->parent->of_node;

[Severity: High]
Does this code cause a reference count underflow and use-after-free on devi=
ce
removal?  By assigning dev->of_node without incrementing the reference count
via of_node_get(), the driver core's unconditional of_node_put(dev->of_node)
on unbind could underflow the parent's reference count.

> +
>  	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return -ENOMEM;
> +
>  	ctx->mcu =3D mcu;
> +	ctx->fan_reg =3D pdata->fan_reg;

[Severity: Medium]
Could this code cause a NULL pointer dereference?  If the device is manually
instantiated (e.g. via sysfs or a DT overlay) without providing the required
platform data, dev_get_platdata() returns NULL, which is then unconditional=
ly
dereferenced here.

> +	ctx->levels =3D pdata->levels;
> +	ctx->nlevels =3D pdata->nlevels;
> +
> +	ctx->power =3D devm_regulator_get(dev, "fan");
> +	if (IS_ERR(ctx->power))
> +		return PTR_ERR(ctx->power);
> +
> +	ret =3D regulator_enable(ctx->power);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable fan power supply: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D devm_add_action_or_reset(dev, khadas_mcu_fan_regulator_disable,=
 ctx->power);
> +	if (ret)
> +		return ret;
> +
>  	platform_set_drvdata(pdev, ctx);

[ ... ]

>  #ifdef CONFIG_PM_SLEEP
>  static int khadas_mcu_fan_suspend(struct device *dev)
>  {
>  	struct khadas_mcu_fan_ctx *ctx =3D dev_get_drvdata(dev);
> -	unsigned int level_save =3D ctx->level;
>  	int ret;
> =20
> -	ret =3D khadas_mcu_fan_set_level(ctx, 0);
> +	ret =3D khadas_mcu_fan_set_level(ctx, ctx->levels[0]);
>  	if (ret)
>  		return ret;
> =20
> -	ctx->level =3D level_save;
> -
> -	return 0;
> +	return regulator_disable(ctx->power);

[Severity: Medium]
If regulator_disable() fails here, the PM core aborts system suspend, and t=
he
resume callback will not be executed.  Because the fan was successfully tur=
ned
off via khadas_mcu_fan_set_level(), but ctx->level was not updated to refle=
ct
this, will the thermal framework later fail to restore the correct fan state
due to evaluating state =3D=3D ctx->level in khadas_mcu_fan_set_cur_state()?

>  }
> =20
>  static int khadas_mcu_fan_resume(struct device *dev)
>  {
>  	struct khadas_mcu_fan_ctx *ctx =3D dev_get_drvdata(dev);
> +	int ret, ret2;
> +
> +	ret =3D regulator_enable(ctx->power);
> +	if (ret)
> +		return ret;
> =20
> -	return khadas_mcu_fan_set_level(ctx, ctx->level);
> +	ret =3D khadas_mcu_fan_set_level(ctx, ctx->levels[ctx->level]);
> +	if (ret) {
> +		ret2 =3D regulator_disable(ctx->power);

[Severity: Medium]
Does rolling back the regulator state here cause an enable count underflow
on driver unbind?

Because khadas_mcu_fan_probe() registered an unconditional cleanup action
via devm_add_action_or_reset(dev, khadas_mcu_fan_regulator_disable, ctx->po=
wer),
calling regulator_disable() here leaves the regulator disabled while the de=
vice
remains bound.  When the device is later unbound, the devm action will call
regulator_disable() again on the already disabled regulator.

> +		if (ret2)
> +			dev_err(dev, "failed to disable regulator after error %d: %d\n", ret,
> +				ret2);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  #endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-add-mcu-fa=
n-khadas-vim4-v10-0-aecdb9955a30@aliel.fr?part=3D4
