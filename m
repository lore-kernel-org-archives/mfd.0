Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76142382F10;
	Wed,  5 Aug 2026 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917953; cv=none; b=f/2+XrjJLsTFpRM/6sKYP2E7ajpq1qGjuPDDLLWlJzTfZWra075QTrU3SKFcCl8Mre0Y+DItmzleYzysQIV5HR1mpyQRsHDaDPkccj36HNxRwLQGb4NO1j3hoWRPZAlhe8XYRBEo1QxX5UVABDRYj1uZxQ3QqysYHBueUYYyOaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917953; c=relaxed/simple;
	bh=xlCeiBA8B3/9KcYlbAMuVv0s/6CSS9fcZEZjCE8/Q74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=npGNKLp3wI3bjBqdXmC5cM9wKr211PWxmJQjef50ziBrPZXgPbM/adPyeeclJtE1sBbiK47HiwA3OBnP8KDIQwJdlHcuDcvEhQFqAR9UzWveXGH+dEn2ytB3bLaQyjfjh8osAkSC9jLpxFltePCq6TboUkrvwmLIuJ+YfCEWbsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEsjfuR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEsjfuR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA191F000E9;
	Wed,  5 Aug 2026 08:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917952;
	bh=WK3HmUvmI+y9AHpi33CZewfXQVMhHBdGBBUSF7w9gE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KEsjfuR3+pqwUKBD71+TnwjNhksxEAHsXlBdNdTENkk0y+QJw+LaORiFYSHek4Imt
	 7oK4HwC4qkhFmVxpmtuRhTTRl/luwSiD6tFu7GW9F9STU9bjdnwqpwsU6kxFb2QUGp
	 4dfnCtNakfIYWS4X2+Uuw253P+nS5pycG6ta7eljjU5iJgakPRoT/NTT22iyRcvAHj
	 wxfZPlTmb7rMoXCBiwR0TZeJUvIZOzJsdS6QPGjst3qKK+XpCtCvt1EQUaAm9TrGz+
	 OLqrBoy0rB846fTClBL4g1uwsiy0XwD4coBP9KOCkUtwf3MKiiQLxZ+NihamFG2uHy
	 mR+6iXYSHrrmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/6] arm64: dts: amlogic: t7: Add i2c controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-amlogic@lists.infradead.org, lee@kernel.org
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-5-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-5-75df78710b9e@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:19:10 +0000
Message-Id: <20260805081910.DBA191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Probe fails for generic Khadas MCU devices because match data eval=
uates to NULL.
- [Medium] The fan regulator is leaked on probe error and driver unbind.
--

--- Patch [5]: [PATCH v9 5/6] arm64: dts: amlogic: t7: Add i2c controller n=
ode ---
commit b6b3cf68d983172e0dc3e121aff82af7de674ddb
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

arm64: dts: amlogic: t7: Add i2c controller node

Add the T7 i2c controller node used by the Khadas VIM4 for MCU communicatio=
n.
Use amlogic,meson-axg-i2c as fallback compatible.

> diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> index ba981a7886921..4cb305ac915e1 100644
> --- a/drivers/mfd/khadas-mcu.c
> +++ b/drivers/mfd/khadas-mcu.c
[ ... ]
> @@ -75,47 +75,138 @@ static const struct regmap_config khadas_mcu_regmap_=
config =3D {
[ ... ]
>  static int khadas_mcu_probe(struct i2c_client *client)
>  {
> +	const struct mfd_cell *cells, *fan_cells;
> +	const struct regmap_config *regmap_cfg;
>  	struct device *dev =3D &client->dev;
> +	int ncells, nfan_cells, ret;
>  	struct khadas_mcu *ddata;
> -	int ret;
> +	const void *match;
> =20
>  	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
>  	if (!ddata)
>  		return -ENOMEM;
> =20
> +	match =3D i2c_get_match_data(client);
> +	if (!match)
> +		return -ENODEV;
> +
> +	switch ((uintptr_t)match) {
> +	case KHADAS_MCU_GENERIC:

[Severity: High]
Does this check unintentionally abort probe for generic Khadas MCU devices?

Because KHADAS_MCU_GENERIC is 0, the data field in the match table is
effectively a null pointer:

    { .compatible =3D "khadas,mcu", .data =3D (void *)KHADAS_MCU_GENERIC }

When khadas_mcu_probe() is called for a generic device, i2c_get_match_data()
returns NULL. The check for (!match) is met, and the driver unconditionally
returns -ENODEV. This causes a regression for all generic Khadas MCU boards.

[ ... ]
> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mc=
u_fan.c
> index 21b3d0a71bd0d..c7f74394b823f 100644
> --- a/drivers/thermal/khadas_mcu_fan.c
> +++ b/drivers/thermal/khadas_mcu_fan.c
[ ... ]
> @@ -78,6 +81,7 @@ static const struct thermal_cooling_device_ops khadas_m=
cu_fan_cooling_ops =3D {
[ ... ]
>  static int khadas_mcu_fan_probe(struct platform_device *pdev)
>  {
> +	const struct khadas_mcu_fan_pdata *pdata =3D dev_get_platdata(&pdev->de=
v);
>  	struct khadas_mcu *mcu =3D dev_get_drvdata(pdev->dev.parent);
>  	struct thermal_cooling_device *cdev;
>  	struct device *dev =3D &pdev->dev;
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

[Severity: Medium]
Could this leak the regulator on probe error or driver unbind?

If devm_thermal_of_child_cooling_device_register() fails later in
khadas_mcu_fan_probe(), the function returns without calling
regulator_disable().

Additionally, there is no remove callback in khadas_mcu_fan_driver:

static struct platform_driver khadas_mcu_fan_driver =3D {
    .probe      =3D khadas_mcu_fan_probe,
    .shutdown   =3D khadas_mcu_fan_shutdown,
    .driver =3D { ...

This means the regulator is not cleanly disabled when the driver is unbound,
which could leave the reference leaked and prevent the regulator from ever
being powered down.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-add-mcu-fa=
n-khadas-vim4-v9-0-75df78710b9e@aliel.fr?part=3D5
