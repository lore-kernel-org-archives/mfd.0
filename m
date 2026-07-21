Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEC66DCE1;
	Tue, 21 Jul 2026 12:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637390; cv=none; b=U53xr0TU6oUyT2sYPE3cMTw2oiAHmXSJA6XRctlLh6YdcOnzscfUoZlV5W4pYF46PVLCT8HmUlzXkrg7IHIUkQXDG7oFAx4mqnGLPySkv4SVYmGoFlDu+5BkCMd5mu8gbAg34Nex92eNEYaKIUrqTBhmzMvEeV1dpBLkNV4eexg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637390; c=relaxed/simple;
	bh=M8w7sVctAZ75SGSvaSvPpecwClAU1AGETQ7L/yeBK9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B3DNsV8mL6gEGNxoP/8/kLjs2Glq4K1jKdi3N0euah3rEhVSXFQmIX3r6TBDkw5murJzDIVhJ651LLmOMt+yY3g5FDhuIEVvGW8pJiojLTJsAffjVBcbc5nahFXgoxa7jsfqQM3P8BPSs1fzlNZ3PkjVFvGvfsU7e7Nae+hNxIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkawSVVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkawSVVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C988B1F000E9;
	Tue, 21 Jul 2026 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637389;
	bh=GW0PYCM+lo7Nz0aQOwQrRb6lVj4CkfShgErf/vgAzfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FkawSVVagAv5A9m8X1J/3GuJmi2BNWaAdv2D0mDgWqN6PmQvvXDzco9pZkyG+KDz6
	 esjFlSVYxr/Yfsu+vjjawYmhw/QCn6OnWaps4JKlzUVQfo14xhmPEczqTCYhPwkSX1
	 fvfmG5I+mEHnj7D2cqfeSUtYJDmioPrIYSvUEq7V8COe7Wvv50jbhHEUWZxLLJNtB5
	 j87Vj3DWGXrVLFgw7iiNg/5+zuappeWVanhyYT6qtPaxvs9MtLH7yy+8HAm4kEQYYR
	 aOvExqAy+0IVZBe2LX8eUwuYFsRDVpAz7z7xZiu3NSDtrK8fyh7lyRQF9YHDtyd4aO
	 BXh6g3GeI3Nmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] thermal/drivers/loongson2: Correct thermal
 sensor registration loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <38116cb29537aecc7ae88a6e4c2916f1a7966c4f.1784619512.git.zhoubinbin@loongson.cn>
References: <cover.1784619512.git.zhoubinbin@loongson.cn>
 <38116cb29537aecc7ae88a6e4c2916f1a7966c4f.1784619512.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 12:36:28 +0000
Message-Id: <20260721123628.C988B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] NULL Pointer Dereference via sysfs bind
- [Medium] Hardware Configuration Mismatch
- [Medium] Missing Teardown / Resource Leak
--

--- Patch [1]: [PATCH v2 1/4] thermal/drivers/loongson2: Correct thermal se=
nsor registration loop ---
commit 381cd9ed04934716b53c8748d5c522210d6b54ff
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Correct thermal sensor registration loop

The registration loop in loongson2_thermal_probe() incorrectly uses
dev_err_probe() when the sensor is not present (-ENODEV). Fix this by
correctly handling -ENODEV and only returning on other errors.

Closes: https://sashiko.dev/#/patchset/cover.1783670011.git.zhoubinbin@loon=
gson.cn?part=3D2

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index ea4dd2fb1f473..d7d221c3136d4 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
> @@ -161,16 +161,18 @@ static int loongson2_thermal_probe(struct platform_=
device *pdev)

[Severity: High]
This is a pre-existing issue, but does device_get_match_data() return NULL
when binding the driver via sysfs to a platform device that lacks OF match
data?

In loongson2_thermal_probe(), data->chip_data is assigned from
device_get_match_data(dev) and then immediately dereferenced:

    data->chip_data =3D device_get_match_data(dev);
    ...
    if (data->chip_data->flags & LS2K2000_THSENS_OUT_FLAG) {

Could this cause a NULL pointer dereference crash if bound by name via sysf=
s?

> =20
>  	for (i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_NUM; i++) {
>  		tzd =3D devm_thermal_of_zone_register(dev, i, data, thermal_ops);
> -
>  		if (!IS_ERR(tzd))
>  			break;

[Severity: Medium]
This is a pre-existing issue, but does this code properly save the
discovered sensor index?

If the device tree specifies a non-zero sensor index, the actual sensor
index is discovered here but then discarded instead of being saved to
the instance data.

Later in loongson2_set_ctrl_regs(), the hardware register offset is
calculated using the hardcoded static match data rather than the index
actually discovered:

    int reg_off  =3D data->chip_data->thermal_sensor_sel * 2;

Could this cause the driver to report temperatures or configure thresholds
for the wrong hardware sensor (sensor 0) if the device tree specifies a
different index?

[ ... ]

> +	if (IS_ERR(tzd))
> +		return dev_err_probe(dev, -ENODEV, "No thermal sensor registered\n");
> +
>  	ret =3D devm_request_threaded_irq(dev, irq, NULL, loongson2_thermal_irq=
_thread,
>  					IRQF_ONESHOT, "loongson2_thermal", tzd);

[Severity: Medium]
This is a pre-existing issue, but is there a missing teardown for the
hardware interrupt state?

The probe function relies solely on devres for cleanup, but it does not
register a devm action to revert the hardware interrupt state initialized
by the thermal core:

    loongson2_thermal_set(data, 0, 0, false);

If the driver is manually unbound via sysfs or the module is unloaded, could
this leave the device actively asserting its interrupt line?

>  	if (ret < 0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784619512.gi=
t.zhoubinbin@loongson.cn?part=3D1
