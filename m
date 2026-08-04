Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A050723BD1B;
	Tue,  4 Aug 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848368; cv=none; b=JKnKM0CXV37f2jhCHwPO8VKZTCmswYp0bQe6GXp7K/6VjlnEfD8zS3wEDGkCkorKls9WHJ1ugVhxB57d8o79dUkHxthU5iB2TnfUfK7inhUOumwAgEdQIYkWdfdRRVNhNPjJhHtEg8EKRQtqvmXHUFNsOqDqCKD3/XEjrPFJKCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848368; c=relaxed/simple;
	bh=ve1K+iUSPeFmO1XfuPGB6+L3+NV1E8+eXhzGOpPu+JI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TRnXpcWVWuUsicDCCZVLUDACLTugXdga169J4WlmACxkFp0fzeeeFM9YsFhCuSoqCZ1DqJKIQ2jZioSeEpVcYFxQOpMRkIBNyzJY8r85pkxBYdzWhkO5wGXyrWtSJUUYXuMfy0FOgsrktIM5wSlJsEfzHVxmFCXOon79++SBN14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5GbCoWn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5GbCoWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9EC1F00A3A;
	Tue,  4 Aug 2026 12:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785848367;
	bh=9ZGB8/UWvh6L1fVmEZiC/zozBpAuILOLK25J1iPQIf4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I5GbCoWnoxBKvKlVuxf0Er5imr5zz2Uht3ijmuiC3HJhsO7mQK5Cmnk1NQ73T9a0w
	 vqki4XNnDMuAcJyeiA8Kn0coCtmQADQPD/mcXHw2BH3gqmhHwjT1ccZnbXx3GU6qY6
	 TEMSR+bnF/38b5c4FFf9ZfbeJUHjDJlfnBCUB6fNxqdQdPFCPct/4wOkngMeS2+5fR
	 wx9chgRkXA+4OAcz4gJaPJOtN2Zm1J0fWZclTgp2Tn3INJ6IOwLZpcciQbnjd8lGxP
	 8adlRA3q6IlfJbxCj9NqVmPk7l9E9s8sLUdQePBkSn/isMA9eUrpjK19toV5G6qaId
	 FHeTTrOuLDmyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] thermal/drivers/loongson2: Add support for
 Loongson-2K0300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <0c2af3251d520ab04d18c14fce0a825e7b171ca5.1785829933.git.zhoubinbin@loongson.cn>
References: <cover.1785829933.git.zhoubinbin@loongson.cn>
 <0c2af3251d520ab04d18c14fce0a825e7b171ca5.1785829933.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 12:59:26 +0000
Message-Id: <20260804125926.DE9EC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The 'old fuse' validity check uses legitimate dynamic temperature =
bounds, which will permanently disable sensor calibration during real therm=
al emergencies.
- [Medium] The return values of `regmap_read()` for chip ID registers are i=
gnored, potentially leading to silent failures and miscalculation of temper=
atures.
- [Medium] Suspicious manual sign-magnitude parsing and missing sign handli=
ng for `chip_id0` calibration data.
--

--- Patch [5]: [PATCH v4 5/5] thermal/drivers/loongson2: Add support for Lo=
ongson-2K0300 ---
commit 3e3a89cf673b3132da6f690e9200a7140d2ed6ae
Author: Binbin Zhou <zhoubinbin@loongson.cn>

thermal/drivers/loongson2: Add support for Loongson-2K0300

This commit adds support for the thermal sensor on the Loongson-2K0300 SoC.
The sensor uses a 10-bit ADC and requires per-chip calibration offsets read
from syscon CHIP ID registers. A fallback formula and validity check are
included for older fuse versions.

> diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongs=
on2_thermal.c
> index 1a8ca2cd06f1b..51b29b60372a5 100644
> --- a/drivers/thermal/loongson2_thermal.c
> +++ b/drivers/thermal/loongson2_thermal.c

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
Is it safe to ignore the return values of these regmap_read() calls?

If regmap_read() fails due to an underlying bus or configuration error, it
will not modify chip_id0 or chip_id1, leaving them at 0. This could cause
the driver to silently compute an uncalibrated temperature without reporting
the read error.

> +
> +	if (chip_id0 & LS2K0300_EXTERN_ID) {
> +		calib_data =3D FIELD_GET(LS2K0300_ID1_VAL_MASK, chip_id1);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);
> +		if (calib_data & LS2K0300_COMP_SIGN_BIT)
> +			calib_offset =3D -calib_offset;
> +	} else {
> +		calib_data =3D FIELD_GET(LS2K0300_ID0_VAL_MASK, chip_id0);
> +		calib_offset =3D FIELD_GET(LS2K0300_COMP_VAL_MASK, calib_data);

[Severity: Medium]
Does the chip_id0 fallback path have a missing sign bit check?

The code extracts a 12-bit value into calib_data using a 12-bit mask
(LS2K0300_ID0_VAL_MASK is GENMASK(31, 20)). It then immediately applies a
15-bit mask (LS2K0300_COMP_VAL_MASK is GENMASK(14, 0)) to that 12-bit value,
which appears redundant.

Additionally, unlike the chip_id1 branch above which explicitly checks for a
sign bit and negates the offset, this branch lacks sign handling. If the
12-bit fuse data uses a sign bit, interpreting a negative value as a large
positive integer could skew the temperature calculation significantly.

> +	}
> +
> +	temp_mc =3D (raw_adc + calib_offset) * 570 - 394700;
> +
> +	/* For old fuse which can not read right thermal data */
> +	if (temp_mc < LS2K0300_LOWEST_VALID_TEMP || temp_mc > LS2K0300_HIGHEST_=
VALID_TEMP) {

[Severity: High]
Could this logic permanently disable sensor calibration during a real overh=
eat?

If the physical CPU temperature genuinely exceeds 125 degrees Celsius during
a thermal emergency, this check will incorrectly flag the valid hardware fu=
se
as invalid.

It then sets the LS2K0300_OLD_FUSE_FLAG, permanently disabling calibration
for all future reads, which causes the sensor to report lower uncalibrated
temperatures exactly when accurate readings are needed to trigger a shutdow=
n.

> +		dev_warn_once(tdata->dev, "It's an old fuse, thermal %d is not right\n=
", temp_mc);
> +		tdata->flags |=3D LS2K0300_OLD_FUSE_FLAG;
> +		temp_mc =3D raw_adc * 569 - 394700;
> +	}
> +	*temp =3D temp_mc;
> +
> +	return 0;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785829933.gi=
t.zhoubinbin@loongson.cn?part=3D5
