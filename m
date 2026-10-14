Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F954EFFA6;
	Wed, 14 Oct 2026 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974722; cv=none; b=HB20zDMfhnFMNnreppytxp5qK7u+AjzSnkUlKUdtrOyp6rwR6KPlRfX5JeB30tJHMKGe/kpmAclzmWZnWpJhG2EuwsgS7NAp0kMbk7pq6hugWpdDI8Uy4q3viUBnpOXmBKE3lscE+kiGDxkh32DuTYYDm+TPH6J+g4ynAdbRb6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974722; c=relaxed/simple;
	bh=W4hNgElgsYtKmoRAKgFFKimUatv3KA7ij525dLm0j3k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MseRDgVL/BN2U3Ki0QMXMf3/rd6foli5S4RTDRvUdOBRj0uo2DinUBO98MYZlSGWT4qrjcN48gTNbvE90R/K6W2eofCIhUNr1G37RB/ersu9r4xi0S2U1ueX1WtW1CgIQ5I4IbNK76cdMls4m6E20lgiildChlsOPevcWhuRW28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2uggl73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2uggl73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB5B1F00893;
	Wed, 14 Oct 2026 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974721;
	bh=iwTbpISbW86MPd9/KVxdDn/6VUX8ilLTvF0YgtlqPtY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2uggl73MKA5dC3Pp3EK0GR4xXXobGb4fVcR5RZfMlsxDjn6wcRWlh2OpPieE60RY
	 rftNHwKdPnSgbe1V8SFpgTU+lWyC4Zfr7BTtFMQ4OSzd8QLfj/Gp+Fmr04PTqfxY5x
	 9uofLt/8/QTwBXpV8FWOSZ0129loaFVwzEbd3w/fqj2fG3TYOPRA1CoSsQL9F8vhRY
	 EbxHdxz3GBGvClanpHoXzVkb4hK6wdnQq988gNam26zichT5mhEtvX/fN1S+HG0h+g
	 f4xyH8beS1z5g8OPI7k3/JiRD0jxhpD7WpxIvUZtdt+fZHnLBrmT03/74V/SZ6fn+q
	 /wWKcQY82fezQ==
Message-ID: <sashiko-outbox-171156@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:45:20 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] regulator: qcom-pm8008: get_mode() reads status instead of contr=
ol reg
--

commit b99c63e4d74725e0e0de61987ec984083cab186f
Author: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

regulator: qcom-pm8008: Add PM8010 mode support

This commit implements set_mode and get_mode support for PM8010 LDOs using
the mode control and status registers. It allows clients to vote for LDO
modes, a feature that is not supported in the PM8008 LDOs.

> diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulato=
r/qcom-pm8008-regulator.c
> index b484c0f73eeac..ae5370770b2fc 100644
> --- a/drivers/regulator/qcom-pm8008-regulator.c
> +++ b/drivers/regulator/qcom-pm8008-regulator.c
[ ... ]
> @@ -134,6 +145,51 @@ static int pm8008_regulator_get_voltage_sel(struct r=
egulator_dev *rdev)
>  	return regulator_map_voltage_linear_range(rdev, uV, INT_MAX);
>  }
> =20
[ ... ]
> +static unsigned int pm8010_regulator_get_mode(struct regulator_dev *rdev)
> +{
> +	struct pm8008_regulator *preg =3D rdev_get_drvdata(rdev);
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(preg->regmap, preg->base + LDO_STATUS1_REG, &val);
> +	if (ret < 0)
> +		return REGULATOR_MODE_INVALID;
> +
> +	return (val & MODE_STATE_MASK) =3D=3D MODE_STATE_NPM ?
> +		REGULATOR_MODE_NORMAL : REGULATOR_MODE_IDLE;
> +}

[Severity: Medium]
Does reading LDO_STATUS1_REG instead of the control register
(LDO_MODE_CTL1_REG) here break the regulator core's set_mode optimization
when the LDO is disabled?

When the LDO is disabled, the physical status register indicates an OFF sta=
te
(evaluating to 0), which incorrectly falls through to return
REGULATOR_MODE_IDLE.

If a consumer calls regulator_set_mode() with REGULATOR_MODE_IDLE while the
regulator is disabled, the core compares the requested mode with the return=
ed
get_mode() value. Seeing a match, it skips writing the new mode to the cont=
rol
register. Later, when the regulator is enabled, it powers up using the stale
mode in LDO_MODE_CTL1_REG (e.g., REGULATOR_MODE_NORMAL), completely ignoring
the consumer's earlier REGULATOR_MODE_IDLE request.

Should pm8010_regulator_get_mode() read LDO_MODE_CTL1_REG instead to
accurately reflect the configured state rather than the dynamic physical
status?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-pm8010_i2c=
_support-v2-0-b395d2b3f668@oss.qualcomm.com?part=3D3
