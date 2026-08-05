Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F13DDAEC;
	Wed,  5 Aug 2026 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918259; cv=none; b=SHRYewmlkp4xTHujALwBh3O7CvwrdI/J8oznMYniYBb3cxzB5G7NcANbcq/Sc4Z8KoAKNIgcdK553qLwYdw4taAjvZL0Y5C5b6RlvMzHK6LeizL1LS/qIKl0IKUwf+RoRewalcVARgfoy83ziW92u8sgV8MbgjCgFmider9mWDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918259; c=relaxed/simple;
	bh=EUjYTwtZmE7hh8Q8l73SoVGocXzri3IrlRnWe3NCPtQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VQYVNlpS/oVTCTyrrhmsE20vA3OUhhrKVpVGqX+O42+fpTGUYhZ3RnPwaKEckMMrOeT3igkA2H8/Eq8OAxh3CG5ml16Dh81nSUakpqyw2kDnXxOH9ZfqGyXlPo/yVOb5+10TixleMR4n7oje6TuUu+TKwb27fKixfOJzWwbebvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mV/YHnqW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mV/YHnqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884591F000E9;
	Wed,  5 Aug 2026 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785918257;
	bh=wPXum4rRsqI3wrxTxVfvisoC2MnoQCPXd7IvHdeqxuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mV/YHnqW2CslUh4q4vQcrTJiclkNqIBbaS0DrxEtru0deO9rw4t+U9VmOR07Q1bfc
	 ETezp7KMktsz+D7MmtAXYkYgoFMdj+POkcFY75FDRbKgOTKvj3/PH7s9uiphy6mj+0
	 yv7nW9MgiuZSfY6XgchSMLl18fecanusbRx4c5uTZZCvJQyZ1RcENGmLIGSdmTVQLU
	 X+SH4LHBv4T0Ztzb5J67RHfRNH1XMPsTQVR3ufQcRiTO2DfmaKkBUpmteLVQbzz3p8
	 KdytSoMDynYRqksxI2PhD7S+SwVgaYxXyH9mlMKgdDbCgCUNBFnlxOuDkNayveEzk1
	 qC8EbCaSMPPtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c
 MCU fan node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, lee@kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-6-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-6-75df78710b9e@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:24:15 +0000
Message-Id: <20260805082416.884591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The khadas-mcu-fan driver leaks regulator references and enable co=
unts due to binding devres to the parent device and missing cleanup paths.
--

--- Patch [6]: [PATCH v9 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c=
 MCU fan node ---
commit 69aa0768107f9fa2d0c3f9c0b9a761cb13f3890b
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU fan node
   =20
Enable and configure i2c MCU node to get fan working on Khadas VIM4.
   =20
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dt=
s b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index c41525a34b721..7d95aadcf6a66 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -167,6 +167,19 @@ xtal: xtal-clk {
>  	};
>  };
> =20
> +&i2c_m_ao_a {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&i2c0_ao_d_pins>;
> +	pinctrl-names =3D "default";
> +
> +	khadas_mcu: system-controller@18 {
> +		compatible =3D "khadas,vim4-mcu";
> +		reg =3D <0x18>;
> +		fan-supply =3D <&vcc5v>;

[Severity: High]
Does enabling this fan node expose a regulator leak in the khadas-mcu-fan
driver?

When the driver probes, it appears to attach the regulator resource
lifecycle to the parent device rather than the child:

drivers/thermal/khadas_mcu_fan.c:khadas_mcu_fan_probe() {
    ...
    ctx->power =3D devm_regulator_get(dev->parent, "fan");
    ...
}

If devm_thermal_of_child_cooling_device_register() fails, the probe
function returns without calling regulator_disable():

drivers/thermal/khadas_mcu_fan.c:khadas_mcu_fan_probe() {
    ...
    return ret;
}

Furthermore, the driver struct lacks a .remove callback entirely:

drivers/thermal/khadas_mcu_fan.c:
static struct platform_driver khadas_mcu_fan_driver =3D {
    .probe      =3D khadas_mcu_fan_probe,
    .shutdown   =3D khadas_mcu_fan_shutdown,
    .driver =3D {
        .name       =3D "khadas-mcu-fan-ctrl",
        .pm         =3D &khadas_mcu_fan_pm,
    },
    .id_table   =3D khadas_mcu_fan_id_table,
};

Since devres is attached to dev->parent, the driver core will not
automatically clean up the regulator when the child device probe fails or
when the child driver is unbound.=20

Will this cause a monotonically increasing enable count and memory leak
on the parent device during unbind/rebind cycles?

> +		#cooling-cells =3D <2>;
> +	};
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-add-mcu-fa=
n-khadas-vim4-v9-0-75df78710b9e@aliel.fr?part=3D6
