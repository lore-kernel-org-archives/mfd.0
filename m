Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E47C21254B;
	Tue, 21 Jul 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637209; cv=none; b=Spsx/XUrf7MUrXXaepKx13aGUPvlwTLQhLwK2ZLpQaD+6cVUh09b1+6yThnDW4jjRriEQMR0kpIiwjWtM4snMG8MQVwMJWvQa/GFsTG+nejk0e4JSJ1ZhcJJ0dsfplD5j64yu8XwSxkCI5seZmF5mOqeLcUt3Di/dFzR4wiJiOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637209; c=relaxed/simple;
	bh=VkcKzg4X/bUHu83TAZ6Zi7xmHQdPW6iN8clkBqASHBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OajF5Mr/99NEaM/jxJtWW8D4G8tBuw4KYGfv2Fi45e7T6B9wbAeIds4Bf96eX9IXoXUt77Y3Satjk4ay/86lZbG4QUZ92F8L0Bt3uh1v9Ia7RVXFRvxt5JMcHQKAe2vtat+1SjWltcr7zybq8lK38Gx9b9AM4sz7dk/Dhoedtu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5VOfKn8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5VOfKn8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5FC1F000E9;
	Tue, 21 Jul 2026 12:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637207;
	bh=ioO+dkNT4rryPro6Q7tdQeexgly9EPeXhPyvtxM3lEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5VOfKn8oZ0KeD2Sv/8WRB3KsMV3vQyIZNmdLisg7HLeBcA7xzeyv8tMHuFqaDf9j
	 BDlJ69gW71zVqQQKxvgJ9K/Mu9R7ykL5sy/65uNswJMZ7eryNJIbSyIh8VpRc8cclg
	 +6HGJAMsa4IxykEseQmX11XiGpSFNm8ZH33tx5zM9Zbu5tk15CFAUR3cWMtuSYR7dM
	 tdMrHe4kpHVcusxV9GmWJSj1OskSlpBI4+WRyPKk2Cn5aodd4U1HDR/Hexy0LMcxoO
	 7X6w+cAj6KNK7L9fKPTxbCh1keGkwdMKskBTXPzFq76qz60xP2YckHcUNpjivL+KRv
	 GrE595Gw/uUPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] thermal/drivers/loongson2: Add support for
 Loongson-2K0300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <25a52158e4281a9ae666f46b840527f78497e95a.1784619512.git.zhoubinbin@loongson.cn>
References: <cover.1784619512.git.zhoubinbin@loongson.cn>
 <25a52158e4281a9ae666f46b840527f78497e95a.1784619512.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 12:33:26 +0000
Message-Id: <20260721123327.6F5FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Global state mutation due to modifying shared match data.
- [High] Uninitialized stack variables used for critical temperature calcul=
ation due to ignored regmap_read() errors.
- [Medium] Off-by-one error in ADC bitmask definition results in an 11-bit =
mask for a 10-bit ADC.
- [Medium] Speculative: ADC configuration write is immediately followed by =
output read without hardware delay.
- [Low] Inefficient repeated fuse parsing and dead store of the calibration=
 offset.
--

--- Patch [4]: [PATCH v2 4/4] thermal/drivers/loongson2: Add support for Lo=
ongson-2K0300 ---
commit 7a3c65aba38521ce4ea3dd10556d3932b4554449
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Add support for Loongson-2K0300
   =20
Add support for the thermal sensor found on the Loongson-2K0300 SoC.
The Loongson-2K0300 thermal sensor uses a 10-bit ADC and requires
per-chip calibration via syscon.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index d7d221c3136d4..e8d11e592a1f2 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c
[ ... ]
> @@ -23,28 +28,48 @@
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
> +#define LOONGSON2_THSENS_OUT_10B_MASK	GENMASK(10, 0)

[Severity: Medium]
The commit message mentions a 10-bit ADC, but doesn't GENMASK(10, 0) define
an 11-bit mask (bits 10 down to 0)? Would GENMASK(9, 0) be the correct mask
for a 10-bit value to avoid including potentially reserved bits in the ADC
output?

[ ... ]
> @@ -71,13 +96,55 @@ static int loongson2_thermal_set(struct loongson2_the=
rmal_data *data,
>  	return 0;
>  }
> =20
> +static int loongson2_2k0300_get_temp(struct thermal_zone_device *tz, int=
 *temp)
> +{
> +	struct loongson2_thermal_data *tdata =3D thermal_zone_device_priv(tz);
> +	int calib_data, calib_offset, temp_mc, raw_adc;
> +	u32 chip_id0, chip_id1;
> +
> +	writel(0xff03, tdata->ctrl_reg + LOONGSON2_THSENS_CFG_REG);
> +	raw_adc =3D FIELD_GET(LOONGSON2_THSENS_OUT_10B_MASK,
> +			    readl(tdata->ctrl_reg + LOONGSON2_THSENS_OUT_REG));

[Severity: Medium]
Is a hardware delay or ready-bit poll needed between configuring the ADC and
reading its output register?=20

Reading the output immediately after the configuration write might return
incomplete or stale conversion data if the hardware requires time to process
the new configuration.

> +
> +	if (tdata->chip_data->flags & LS2K0300_OLD_FUSE_FLAG) {
> +		*temp =3D raw_adc * 569 - 394700;
> +		return 0;
> +	}
> +
> +	regmap_read(tdata->regmap_cfg, LS2K0300_CHIP_ID0, &chip_id0);
> +	regmap_read(tdata->regmap_cfg, LS2K0300_CHIP_ID1, &chip_id1);
> +
> +	if (chip_id0 & LS2K0300_EXTERN_ID) {

[Severity: High]
Can these regmap_read() calls fail? If an I/O error or bus failure causes
regmap_read() to return an error code, chip_id0 and chip_id1 would remain
uninitialized.

Using these uninitialized stack values for bitwise mask operations in the
following checks could cause the driver to compute incorrect calibration
offsets and corrupt temperature readings.

> +		calib_data =3D FIELD_GET(LS2K0300_ID1_VAL_MASK, chip_id1);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +		if (calib_data & LS2K0300_COMP_SIGN_BIT)
> +			calib_offset =3D -calib_offset;
> +	} else {
> +		calib_data =3D FIELD_GET(LS2K0300_ID0_VAL_MASK, chip_id0);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +	}
> +
> +	tdata->calib_offset =3D calib_offset;

[Severity: Low]
It looks like tdata->calib_offset is assigned here but never read anywhere
else in the driver.

Since the calibration data is based on fixed hardware fuses, would it be
better to perform this parsing once during driver probe and store the resul=
t,
rather than re-reading the syscon registers on every temperature poll?

> +	temp_mc =3D (raw_adc + calib_offset) * 570 - 394700;
> +
> +	/* For old fuse which can not read right thermal data */
> +	if (temp_mc < LS2K0300_LOWEST_VALID_TEMP || temp_mc > LS2K0300_HIGHEST_=
VALID_TEMP) {
> +		dev_warn_once(tdata->dev, "It's an old fuse, thermal %d is not right\n=
", temp_mc);
> +		tdata->chip_data->flags |=3D LS2K0300_OLD_FUSE_FLAG;

[Severity: High]
Is it safe to modify the flags field of the statically defined shared match
data?

By forcibly casting away the const qualifier from device_get_match_data() in
loongson2_thermal_probe() and then modifying tdata->chip_data->flags here,
the driver alters the global state for all current and future bound instanc=
es
of this device.

If one thermal sensor encounters an invalid temperature and sets
LS2K0300_OLD_FUSE_FLAG, this flag will be permanently set for all instances
sharing this match data, incorrectly triggering the fallback formula for
healthy sensors.

> +		temp_mc =3D raw_adc * 569 - 394700;
> +	}
> +	*temp =3D temp_mc;
> +
> +	return 0;
> +}

[ ... ]
> @@ -134,7 +205,8 @@ static int loongson2_thermal_probe(struct platform_de=
vice *pdev)
>  	if (!data)
>  		return -ENOMEM;
> =20
> -	data->chip_data =3D device_get_match_data(dev);
> +	data->dev =3D dev;
> +	data->chip_data =3D (struct loongson2_thermal_chip_data *)device_get_ma=
tch_data(dev);

[Severity: High]
This cast drops the const qualifier from the match data, which leads to the
global state modification mentioned in loongson2_2k0300_get_temp().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784619512.gi=
t.zhoubinbin@loongson.cn?part=3D4
