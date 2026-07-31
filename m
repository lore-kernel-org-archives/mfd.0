Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED03D7D67;
	Fri, 31 Jul 2026 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491652; cv=none; b=SoFcycAB46+JWHpNde//TvYIWc0Bc+szaH6G9TTtSOcL9L1QTHj0mxJSHZ1UbpY8XkLOGbPpcO32fEZIJq0UFbxeKyiiXZilM2rV2se0pYMTcfmN1J9I+DZE1DsdXNe4DrD4V0VPY5Xx4k3OrtVMj6lc3ED39L+1NHjmOP5Vy2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491652; c=relaxed/simple;
	bh=Fq1jVsQ89ryFe8TGbFuLDipyQd5vDDxRMbiKepfXEEw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uidPEuCm8jXy2EKB7FNPmcb0j86BGvrNK82CVNXL9tp5ua5a5OXf+vLCXUfbXQf24lU4IF9lr2ui3xno2C13HylwhCR04jgxPiYci77pG+DhWosa3xXwNFjOEMO9kUC7rieacYBi6DynoQNjDppbz2oZx05SitUp5xaYIOrk1rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2ThmdkL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2ThmdkL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABA61F000E9;
	Fri, 31 Jul 2026 09:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491640;
	bh=XMa2YAe0fT2N6aoKwY2dK2WRvY7nxwF2jnYEpfKUH88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D2ThmdkLOP8o2wF9VznSrmwgiy/qyDXcRLza4MnctIOXhd9Y+rj6tWYQi+GYB580o
	 981Btyf+UK0pqbpiF8ven6YHLcUm1XLF/mmGuXBvdAkgD4ZGQUdbAHZay4b2JtzKLX
	 IU6Kh8/9YmpFOML3ukwB8ojCZ8J0Fe/FqXTDsw9RfBkEdbDOxg1aPUeU5HiefrTu2e
	 dyBxXLatQW+ODzLNzyG8UXw+4nB1MAMFtphKdFIV1ZYX24aFtMCgePt69K7CtePK0c
	 I22ihmM3H0Qgqj1KEV8+7WJcmew+H7b7ccsh1Yxitqo+RsggMHkstuh1GvQ4jLaOoW
	 avQ1+aTOL8WSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] thermal/drivers/loongson2: Add support for
 Loongson-2K0300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <15540a92207b3897b4be5725199dc375b23b2351.1785480242.git.zhoubinbin@loongson.cn>
References: <cover.1785480242.git.zhoubinbin@loongson.cn>
 <15540a92207b3897b4be5725199dc375b23b2351.1785480242.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 09:53:58 +0000
Message-Id: <20260731095359.1ABA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware Logic Bug: Incorrect hardware trip point thresholds progr=
ammed for Loongson-2K0300.
- [High] Logic Error: Asymmetric handling and missing sign check for chip_i=
d0 calibration data.
- [Medium] Logic Error: Off-by-one bitmask creates an 11-bit mask for a 10-=
bit ADC.
- [Medium] Performance Regression: Inefficient polling of static hardware c=
alibration fuses.
- [Medium] Missing Error Handling: Ignored regmap_read return values silent=
ly use default zero offset.
--

--- Patch [5]: [PATCH v3 5/5] thermal/drivers/loongson2: Add support for Lo=
ongson-2K0300 ---
commit c989d07a95637f605eb53c63ff3b7f9dca11196a
Author: Binbin Zhou <zhoubinbin@loongson.cn>
Subject: thermal/drivers/loongson2: Add support for Loongson-2K0300

Add support for the thermal sensor found on the Loongson-2K0300 SoC.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index 1a8ca2cd06f1b..51b29b60372a5 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
[ ... ]
> @@ -23,18 +28,34 @@
>  #define LOONGSON2_THSENS_CTRL_LOW_REG	0x8
>  #define LOONGSON2_THSENS_STATUS_REG	0x10
>  #define LOONGSON2_THSENS_OUT_REG	0x14
> +#define LOONGSON2_THSENS_CFG_REG	0x18
> =20
>  #define LOONGSON2_THSENS_INT_LO		BIT(0)
>  #define LOONGSON2_THSENS_INT_HIGH	BIT(1)
>  #define LOONGSON2_THSENS_INT_EN		(LOONGSON2_THSENS_INT_LO | \
>  					 LOONGSON2_THSENS_INT_HIGH)
> -#define LOONGSON2_THSENS_OUT_MASK	0xFF
> +#define LOONGSON2_THSENS_OUT_8B_MASK	0xFF
> +#define LOONGSON2_THSENS_OUT_11B_MASK	GENMASK(10, 0)

[Severity: Medium]
The commit message states the thermal sensor uses a 10-bit ADC, but this ma=
cro
creates an 11-bit mask. Does applying this 11-bit mask risk pulling in adja=
cent
status bits and corrupting the raw_adc value?

> +
> +#define LS2K0300_CHIP_ID0		0x10
> +#define LS2K0300_CHIP_ID1		0x14
> +#define LS2K0300_EXTERN_ID		BIT(4)
> +#define LS2K0300_ID0_VAL_MASK		GENMASK(31, 20)

[Severity: High]
Does this 12-bit extraction mask incorrectly truncate the data if ID0 was
intended to hold 16 bits like ID1?

> +#define LS2K0300_ID1_VAL_MASK		GENMASK(15, 0)
> +
> +#define LS2K0300_COMP_VAL_MASK		GENMASK(14, 0)
> +#define LS2K0300_COMP_SIGN_BIT		BIT(15)
> +
> +#define LS2K0300_LOWEST_VALID_TEMP	(-55000)
> +#define LS2K0300_HIGHEST_VALID_TEMP	(125000)
[ ... ]
> @@ -72,13 +96,54 @@ static int loongson2_thermal_set(struct loongson2_the=
rmal_data *data,
>  	return 0;
>  }
> =20
> +static int loongson2_2k0300_get_temp(struct thermal_zone_device *tz, int=
 *temp)
> +{
> +	struct loongson2_thermal_data *tdata =3D thermal_zone_device_priv(tz);
> +	int calib_data, calib_offset, temp_mc, raw_adc;
> +	u32 chip_id0 =3D 0, chip_id1 =3D 0;
> +
> +	writel(0xff03, tdata->ctrl_reg + LOONGSON2_THSENS_CFG_REG);
> +	raw_adc =3D FIELD_GET(LOONGSON2_THSENS_OUT_11B_MASK,
> +			    readl(tdata->ctrl_reg + LOONGSON2_THSENS_OUT_REG));
> +
> +	if (tdata->flags & LS2K0300_OLD_FUSE_FLAG) {
> +		*temp =3D raw_adc * 569 - 394700;
> +		return 0;
> +	}
> +
> +	regmap_read(tdata->regmap_cfg, LS2K0300_CHIP_ID0, &chip_id0);
> +	regmap_read(tdata->regmap_cfg, LS2K0300_CHIP_ID1, &chip_id1);

[Severity: Medium]
Do we need to re-read the static calibration fuses on every temperature pol=
l?

Since chip_id0 and chip_id1 don't change at runtime, does polling them
continuously introduce unnecessary MMIO read overhead and lock contention on
the shared syscon regmap?

[Severity: Medium]
Is it safe to ignore the return values of regmap_read() here?

If the reads fail, chip_id0 and chip_id1 will remain 0, leading to a silent
uncalibrated calculation. If the resulting temperature falls within the -55C
to 125C range, will this silently return inaccurate temperature data without
triggering the fallback mechanism or reporting the error?

> +
> +	if (chip_id0 & LS2K0300_EXTERN_ID) {
> +		calib_data =3D FIELD_GET(LS2K0300_ID1_VAL_MASK, chip_id1);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +		if (calib_data & LS2K0300_COMP_SIGN_BIT)
> +			calib_offset =3D -calib_offset;
> +	} else {
> +		calib_data =3D FIELD_GET(LS2K0300_ID0_VAL_MASK, chip_id0);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);

[Severity: High]
When extracting calibration data from chip_id0, are we incorrectly applying=
 a
15-bit mask to a 12-bit value and omitting the sign bit check?

If ID0 contains signed offsets similar to ID1, will negative offsets be
treated as large positive values?

> +	}
> +
[ ... ]
> @@ -113,6 +178,11 @@ static int loongson2_thermal_set_trips(struct therma=
l_zone_device *tz, int low,
>  	return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
>  }
> =20
> +static const struct thermal_zone_device_ops loongson2_2k0300_of_thermal_=
ops =3D {
> +	.get_temp =3D loongson2_2k0300_get_temp,
> +	.set_trips =3D loongson2_thermal_set_trips,

[Severity: High]
Does assigning the legacy loongson2_thermal_set_trips function to the 2K0300
ops structure program the hardware comparators with the wrong values?

loongson2_thermal_set_trips() calls loongson2_set_ctrl_regs() which uses the
legacy formula:
    reg_ctrl =3D ctrl_data + HECTO;

But the 2K0300 uses a different formula:
    temp =3D (raw_adc + calib_offset) * 570 - 394700;

Will this cause the hardware interrupts to trigger at incorrect ADC values =
and
break thermal protection for the new SoC?

> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785480242.gi=
t.zhoubinbin@loongson.cn?part=3D5
