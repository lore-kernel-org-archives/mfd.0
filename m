Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA32773E5;
	Tue,  4 Aug 2026 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848508; cv=none; b=pxXMCaxRTDui8FiCPRMkfNZsIPwz7N1OouQVzXAnQ/BwQ6uHrn4x1OX1L5N1oF8uo8cFjbP+Q3lZ05x6hP8nsWdJ9WZ7X641dZg5ozhqumW3d/HUxaFmDpcBOjiWRMaHkIcLWjj83sdcpoGEnrYY6vnr62hnG5Me9GuSyi0xC+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848508; c=relaxed/simple;
	bh=he/JpJb9Z6y2PxKsBM6H2BxNiKYfH27bYmthRdrFggk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IP2L97bMMKJqrNoAS9hWy0LiegVVjO2vY00Bp1z2SwYf6JmA1sk+Rspw70Zu/4oNhoK1RmvyWCGGxHgae/COyXF55VxZ/e9UVGwjm5ZAzxC7XFSR84FOvvGHyxsDZsJD/gCdP8cXk3wlOszhYpif90r57LpY4A6heH5q/UL5ITQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=laSINq5y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="laSINq5y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548AE1F000E9;
	Tue,  4 Aug 2026 13:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785848506;
	bh=RNOXbEGgGATzZmpwYiqFmZ/wcpMk0E2/mRBWTYI9GUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=laSINq5y9j55p0rCmhpREFgmOMLJ8Q4+t1g1G9GjxkJQC9Ztf8Fy2tMkGdTWOEdxd
	 u3IXUubHwubOBNql4kfdHR2WK02C89xi5ifBcy+iAFvbMTxR6ELDp57yOVPaeyPgZr
	 NSUj69DFNrdT/BteFlazB3KH4HPiPEUF3rcDiOl+HGegrCvg+fQUkbEYFjvV0mmdYi
	 ZCGSB796ZioMBsY+aKhhBOsfs1VKF+BNYgdHjFkDJNm7iXCG+oY9qbswkM5QYPNvPr
	 E2dsAmDR+aOMX0C0kLv6X9aj9utdt6wAz8qehBZA7Dw9tlw4c++WiWOyaSOkIGXiBe
	 IG7kzcbiqT1bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] thermal/drivers/loongson2: Correct thermal
 sensor registration loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1c0f32f83a43a11a35e151fe97e9b5d4b21ea459.1785829933.git.zhoubinbin@loongson.cn>
References: <cover.1785829933.git.zhoubinbin@loongson.cn>
 <1c0f32f83a43a11a35e151fe97e9b5d4b21ea459.1785829933.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 13:01:45 +0000
Message-Id: <20260804130146.548AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver allows registering any sensor ID from 0 to 3 but uncond=
itionally configures hardware registers for sensor 0.
- [High] The device's hardware interrupt is left enabled when probe fails o=
r the driver is unbound.
- [High] Potential NULL pointer dereference if `device_get_match_data()` re=
turns NULL.
--

--- Patch [1]: [PATCH v4 1/5] thermal/drivers/loongson2: Correct thermal se=
nsor registration loop ---
commit 04ee4726d4d6013e77a52a26bf79466c2069029a
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Correct thermal sensor registration loop

This commit fixes the registration loop in loongson2_thermal_probe() by
correctly handling -ENODEV and only aborting on fatal errors. It also
ensures at least one thermal zone is registered before proceeding.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index ea4dd2fb1f473..5f47fa51fb907 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
> @@ -161,16 +161,18 @@ static int loongson2_thermal_probe(struct platform_=
device *pdev)

[Severity: High]
This is a pre-existing issue, but if device_get_match_data() returns NULL
(for example, via manual sysfs binding), can this cause a NULL pointer
dereference earlier in this function?

drivers/thermal/loongson2_thermal.c:loongson2_thermal_probe() {
	...
	data->chip_data =3D device_get_match_data(dev);
	...
	if (data->chip_data->flags & LS2K2000_THSENS_OUT_FLAG) {
	...
}

> =20
>  	for (i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
>  		tzd =3D devm_thermal_of_zone_register(dev, i, data, thermal_ops);

[Severity: High]
This isn't a bug introduced by this patch, but does this leave the hardware
interrupt enabled if probe fails later or the driver is unbound?

During devm_thermal_of_zone_register(), the thermal core registers the zone
and invokes tz->ops->set_trips(). This calls
loongson2_thermal_set(..., enable=3Dtrue), which enables the hardware inter=
rupt.

However, there appears to be no corresponding remove function in
loongson2_thermal_driver, nor a devm_add_action_or_reset() callback to
disable the interrupt if devm_request_threaded_irq() fails or the driver is
unbound.

[Severity: High]
This is also a pre-existing issue, but if the device tree specifies a therm=
al
zone for a sensor ID other than 0, will the hardware configuration match the
intended sensor?

The probe loop registers the zone for sensor index i and breaks, but
loongson2_set_ctrl_regs() uses a statically defined thermal_sensor_sel:

drivers/thermal/loongson2_thermal.c:loongson2_set_ctrl_regs() {
	int reg_off =3D data->chip_data->thermal_sensor_sel * 2;
	...
}

It seems this calculates the register offset ignoring the actually register=
ed
sensor ID, potentially resulting in reading from and writing limits to the
hardware registers of sensor 0 instead.

>  		if (!IS_ERR(tzd))
>  			break;
> =20
> -		if (PTR_ERR(tzd) !=3D -ENODEV)
> +		if (PTR_ERR(tzd) =3D=3D -ENODEV)
>  			continue;
> =20
> -		return dev_err_probe(dev, PTR_ERR(tzd), "failed to register");
> +		return dev_err_probe(dev, PTR_ERR(tzd), "failed to register sensor %d\=
n", i);
>  	}
> =20
> +	if (IS_ERR(tzd))
> +		return dev_err_probe(dev, -ENODEV, "No thermal sensor registered\n");
> +
>  	ret =3D devm_request_threaded_irq(dev, irq, NULL, loongson2_thermal_irq=
_thread,
>  					IRQF_ONESHOT, "loongson2_thermal", tzd);
>  	if (ret < 0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785829933.gi=
t.zhoubinbin@loongson.cn?part=3D1
