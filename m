Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38254E1C68;
	Wed, 14 Oct 2026 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974701; cv=none; b=cxP7QebThgc5tFrmNX4e8WkxGYVzW2nlUEgtNqmZY04rBMBt0FsNQ/d7taNOK8c3zZdG3PiyC9RE4Yiun/GaaBpCILKZHy9WIHMV+olxkndbEVSbCxljsRm2mLnQvIDQyc8h6MJZq58/pbXTwptGu7FH+7+jT3XpFZ7c1DKqdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974701; c=relaxed/simple;
	bh=F2ty96oJh+xskgN3Y8MGK9I+gom2li5FTKYa2mmGlR0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VIvhiAsGV0BgcWmXhhowCSI+lx0ZEDn+pWv9JKNmuhl3nnFJx8Yg4RzpHRG7haxHFb9HmQWgYQ6ZwRSzuFpKmFHY+Y9BGHmbzjxH4nyfGt5RW/1dTUsjHC1SUblaRTUtwYPwE01oNySaoU/APMqyiGZ3DcVEzQlwLQgRv5JmCec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcCyksNE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcCyksNE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEC31F00899;
	Wed, 14 Oct 2026 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974700;
	bh=vL15jv8k4a2QXM9QJXmuO2X2hbYOa8Jw0zCtvQsqmXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KcCyksNEJzjsa2E5ysnTz1gVW+YPm05qd5D1ZuLjFFfX9ZJUwfOTMe6Taoy9C7HtV
	 n9kzht0FC0Hw37h+gqITvPJBY3ylg4/q70KGKB1Q+2Qm5FzZ1iPUxbnTYDEm5dYjYq
	 CcEW49mSquB5UeWADJ6zj0DVZKZxtH185yb2innYTy5v9oOFl2xE4AnLH/TV0ryKsL
	 5uj3CPwB/OqSCGFULPJnPlRRzbEkA8hnve+aqSUwIh8Y2dA6QjeCTcYj817apqgGR2
	 nkox6LY7GO5M1SuxGlBJ/2IN7wg5SAJMskj/432l5qapQ4TF5qvHxdz06I2aePiN3K
	 QBz8StJT0LLGg==
Message-ID: <sashiko-outbox-171155@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:44:59 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mfd: silent fallback to PM8008 on non-DT PM8010 instances
--

commit 4e77301709b8663667033b7dfed82cf937a2d7c5
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

mfd: qcom-pm8008: Add PM8010 support

This commit adds support for the PM8010 to the qcom-pm8008 driver. It
incorporates PM8010 specific IRQs, MFD cells, and match data to support the
new device type via I2C.

> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 2d6c01cf54f32..4179427f38911 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
[ ... ]
> @@ -180,14 +218,36 @@ static void devm_irq_domain_fwnode_release(void *da=
ta)
>  static int pm8008_probe(struct i2c_client *client)
>  {
>  	struct regmap_irq_chip_data *irq_data;
> +	const struct regmap_irq_chip *irq_chip_desc;
>  	struct device *dev =3D &client->dev;
> +	const struct mfd_cell *mfd_cells;
>  	struct regmap *regmap, *regmap2;
>  	struct fwnode_handle *fwnode;
>  	struct i2c_client *dummy;
>  	struct gpio_desc *reset;
> +	unsigned long pmic_type;
> +	int num_mfd_cells;
>  	char *name;
>  	int ret;
> =20
> +	pmic_type =3D (unsigned long)of_device_get_match_data(dev);

[Severity: Medium]
Will this silently fall back to TYPE_PM8008 for non-DT devices?

of_device_get_match_data() explicitly checks for dev->of_node and returns
NULL when it isn't present (such as devices instantiated via ACPI PRP0001
or swnodes). A NULL return evaluates to 0, which matches TYPE_PM8008 in
the switch below.

This means a valid qcom,pm8010-i2c device instantiated via ACPI or swnodes
will be misidentified as TYPE_PM8008 instead of TYPE_PM8010.

Could this use i2c_get_match_data() or device_get_match_data() to ensure
device variants are correctly extracted regardless of the underlying
firmware representation?

> +
> +	switch (pmic_type) {
> +	case TYPE_PM8008:
> +		irq_chip_desc =3D &pm8008_irq_chip;
> +		mfd_cells =3D pm8008_cells;
> +		num_mfd_cells =3D ARRAY_SIZE(pm8008_cells);
> +		break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-pm8010_i2c=
_support-v2-0-b395d2b3f668@oss.qualcomm.com?part=3D5
