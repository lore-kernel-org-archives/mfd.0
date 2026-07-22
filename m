Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443F40626C;
	Wed, 22 Jul 2026 10:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717761; cv=none; b=er8oBC6q7vtFmZT4unwtGJLfGdSSyGrXI5eO42waaslyPGaI2E6X7HAHh8jdzfcaN3qgEd9s2v32pal2bqCJym/DDZ/OkGFqEvARcdfqG4c2o1xNt3ru3/4AgRbbOKhjmM6wCQCEKU1Kj8Q/3be/6xiQn6XFMvzxAa5+V6NQ7Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717761; c=relaxed/simple;
	bh=NardIEQGvaoTfdvLrJO0EpMczWgQCXLDXqAsCGEeSrU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sw1fv8rwSBrwmYYaBDUk8DVdkj04+hvjXVyslKoN3/6aLfUBhBT8q308lzsCxAbVijLE943aXWz5WpMEc+zasQshE7jm+/1m0en78B05ekmLOKNVJ1OqBxwO/0tIfjAVB6eM0cqyLq5cXnP92cYGPVeWCQp7e6JfFD3pp5Ehtk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6QFvDc0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6QFvDc0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9841F00A3F;
	Wed, 22 Jul 2026 10:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784717759;
	bh=lhCkcAA1Q+HdmYah6v727ZcKeA8LK8x7+fZSle6wqOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R6QFvDc0zHb8nbuX8dxLcIa0K249ox3TRzvb4o/C/eAPex6j0GV6pejmBKdJlceww
	 6eRaSeHVjrBoS7AZd9Z7ofmst76ZnYCIi7eHdCk7A+8n2lXH1OssOvfkxI9bAeOC4O
	 ZU4VkR7dDw34kqbNp4iLsoC/YqTTFCtSkYGZRuluOf0ae4/7RWAv0us4chTiIKGoRU
	 84vbSHLm+n/69tfZJqSqs5GnHCXpIEQ15VzQ+ME+N/M8fTSxtySxZgMPRkUA36Wl6R
	 wUCEph59Cqc69LuuyABkLdOC2XSZNNDMojqA+4Jid8+WafDWuAPAxPJApSe9Nb9JK6
	 6v6iZXlGQpoTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] thermal: qcom: Add support for Qualcomm MBG
 thermal monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sachin Gupta" <sachin.gupta@oss.qualcomm.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260722-spmi-mbg-driver-v3-2-ef73064f2789@oss.qualcomm.com>
References: <20260722-spmi-mbg-driver-v3-0-ef73064f2789@oss.qualcomm.com>
 <20260722-spmi-mbg-driver-v3-2-ef73064f2789@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 10:55:58 +0000
Message-Id: <20260722105559.5E9841F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Concurrent sysfs temperature reads consume the faked thermal trip =
state, preventing the thermal core from mitigating threshold violations.
- [Medium] The driver logs a dev_err and returns -ERANGE when the thermal f=
ramework attempts to disable a trip point by passing INT_MAX.
--

--- Patch [2]: [PATCH v3 2/2] thermal: qcom: Add support for Qualcomm MBG t=
hermal monitoring ---
commit 9dc7e944c7be51e8b177c47f01252fb99daf9ee2
Author: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>

thermal: qcom: Add support for Qualcomm MBG thermal monitoring

Add a driver for the Qualcomm MBG (Master Bandgap) thermal monitoring
device. It monitors PMIC die temperature in hardware and raises an
interrupt when a programmed threshold is crossed.

> diff --git a/drivers/thermal/qcom/qcom-spmi-mbg-tm.c b/drivers/thermal/qc=
om/qcom-spmi-mbg-tm.c
> new file mode 100644
> index 0000000000000..fa2f10002253f
> --- /dev/null
> +++ b/drivers/thermal/qcom/qcom-spmi-mbg-tm.c

[ ... ]

> +static int mbg_tm_set_trip_temp(struct thermal_zone_device *tz, int low_=
temp,
> +				int temp)
> +{
> +	struct mbg_tm_chip *chip =3D thermal_zone_device_priv(tz);
> +	int ret =3D 0;
> +
> +	guard(mutex)(&chip->lock);
> +
> +	/* The HW has a limitation that the trip set must be above 25C */
> +	if (temp > MBG_MIN_TRIP_TEMP && temp < MBG_MAX_SUPPORTED_TEMP) {
> +		ret =3D regmap_write(chip->map, chip->base + MON2_LVL1_UP_THRESH,
> +				   temp_to_vtemp_mv(temp));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D regmap_set_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_CFG,
> +				      MON2_UP_THRESH_EN);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		dev_err(chip->dev, "Set trip b/w 25C and 160C\n");
> +		ret =3D regmap_clear_bits(chip->map, chip->base + MBG_TEMP_MON2_MISC_C=
FG,
> +					MON2_UP_THRESH_EN);
> +		return -ERANGE;
> +	}

[Severity: Medium]
Will this log a spurious error when the thermal framework attempts to disab=
le
a trip point?

The thermal framework uses INT_MAX to disable the high trip point (e.g., wh=
en
the temperature drops below all trips). When mbg_tm_set_trip_temp() receives
INT_MAX, it correctly clears the MON2_UP_THRESH_EN bit, but also logs an
error and returns -ERANGE.

Because thermal zones can be polled frequently, could this result in severe
kernel log spam and cause the thermal core to log failure messages during
normal operation?

[ ... ]

> +static irqreturn_t mbg_tm_isr(int irq, void *data)
> +{
> +	struct mbg_tm_chip *chip =3D data;
> +	int ret, val;
> +
> +	scoped_guard(mutex, &chip->lock) {
> +		ret =3D regmap_read(chip->map, chip->base + MBG_TEMP_MON2_FAULT_STATUS=
, &val);
> +		if (ret < 0)
> +			return IRQ_HANDLED;
> +		if (FIELD_GET(MON_FAULT_STATUS_MASK, val) =3D=3D MON_FAULT_LVL1_UPR)
> +			chip->last_thres_crossed =3D true;
> +	}
> +
> +	if (FIELD_GET(MON_FAULT_STATUS_MASK, val) =3D=3D MON_FAULT_LVL1_UPR) {
> +		dev_dbg(chip->dev, "Notifying Thermal, fault status=3D%d\n", val);
> +		thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);

[Severity: High]
Could a concurrent sysfs read consume the faked thermal trip state and
prevent thermal mitigation?

In mbg_tm_isr(), the lock is dropped before calling
thermal_zone_device_update():

CPU1 (mbg_tm_isr):
	scoped_guard(mutex, &chip->lock) {
		...
		if (FIELD_GET(MON_FAULT_STATUS_MASK, val) =3D=3D MON_FAULT_LVL1_UPR)
			chip->last_thres_crossed =3D true;
	} // lock dropped

CPU2 (userspace sysfs read of temp file):
	mbg_tm_get_temp()
		scoped_guard(mutex, &chip->lock) {
			if (chip->last_thres_crossed) {
				chip->last_thres_crossed =3D false; // consumed
				*temp =3D chip->last_temp;
				return 0;
			}
		}

CPU1:
	thermal_zone_device_update(chip->tz_dev, THERMAL_TRIP_VIOLATED);

When thermal_zone_device_update() subsequently reads the temperature, it wi=
ll
see last_thres_crossed =3D false, read the raw ADC value (which might be be=
low
the threshold due to conversion inaccuracies), and potentially skip thermal
mitigation.

> +	} else {
> +		dev_dbg(chip->dev, "Lvl1 upper threshold not violated, ignoring interr=
upt\n");
> +	}
> +
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-spmi-mbg-d=
river-v3-0-ef73064f2789@oss.qualcomm.com?part=3D2
