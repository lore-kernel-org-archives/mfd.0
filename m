Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71FB3955E3;
	Fri, 18 Sep 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750299; cv=none; b=p8CgxgTZm5cj2xpaGGvYS+TooQouqkI+pov5uaDo73bvVxZ4tb+Ndn8mhIveoM/m356tQ2LAuoGmzrfvLcbOQ8PpF94bQB9XeDS17UC5sYqiS7cbU9wNxnmF2NB7Xcy4t47Em9+L6x5ii8VaAbtg/Nq6Wi+gLFjzK1Mk39vyIzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750299; c=relaxed/simple;
	bh=zC3lCvT5eYOgDFwbtEyHAXwzBpQbMkZpP3+92fcnwag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LB6oatFD7MI1iGaYVHafcOeDnxzjzqlfX6c55Q/bEFrKr/7LkjBf96rXqvg1+9noXU2epEUsvlLSjKaxb7b/EiLP28o4S6qXy4nU6FK1Y9lpipgg0oJL5kBvxuLN2X93N/IGUEU0+O3+aw3eHo9dMY6zIPe/iy0RpWVQ9moxYyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXFX4Qh4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXFX4Qh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302631F000FF;
	Fri, 18 Sep 2026 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750297;
	bh=Ha93TMJ2u0bITBXxW+vfPUHEFtwYA7ghfhz705ogvRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jXFX4Qh44FFMVryomU3OXPSU/6hlrGU/IyzqLOOqKU6f97TwwNEVBkDJAf0HYZ99G
	 6NRYWTZVTiu6mX1L/mKKZfga/JfFzeyXskHnYzJU13H/INUF4v669h+cCddWkHQ8+9
	 0WBye11L+pd9XSrQG302lSnQ8E2CseZS2yQBSegkakKytFLRRPSsTX0zG/ICqmcleY
	 7lZvODS1g293HOsQbPIT58MckSuxKQVOjNYp6AHviHnQZs12MG1owsatFHCqXta5fw
	 tYaqIw/guNIm+EtNtJYPp8BzG3lSCrWOxf8qe9Imlgmra4baJ1Otc8ExhskfUsVmeg
	 KgWevlK9QhtIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] mfd: qcom-pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-4-de33d78fad9d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 16:51:36 +0000
Message-Id: <20260918165137.302631F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mfd: complex data passed via match table .data field
--

commit a6c2d131522cd1b3f195202001e9365b690fa7f6
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

mfd: qcom-pm8008: Add PM8010 support

This commit adds support for the PM8010 device, which is the next
generation of the PM8008. It handles I2C and SPMI communications, plumbing
in the necessary IRQs and MFD cells to support the new device variants.

> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 60204cc9a2dc6..ed656f0d6df25 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
[ ... ]
> @@ -213,6 +213,17 @@ static const struct mfd_cell pm8008_cells[] =3D {
>  	MFD_CELL_NAME("pm8008-gpio"),
>  };
> =20
> +static const struct mfd_cell pm8010_cells[] =3D {
> +	MFD_CELL_NAME("pm8010-regulator"),
> +	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
> +};
> +
> +struct pm8008_match_data {
> +	const struct regmap_irq_chip *irq_chip_desc;
> +	const struct mfd_cell *mfd_cells;
> +	int num_mfd_cells;
> +};
> +

[Severity: Medium]
Does embedding the mfd_cell arrays inside a match data structure violate MFD
subsystem guidelines?

The MFD core documentation specifically requests that platform data for chi=
ld
devices like mfd_cell arrays not be dynamically extracted from device match
tables to avoid memory safety hazards and initialization races.

[ ... ]
> @@ -243,6 +243,10 @@ static int pm8008_probe(struct i2c_client *client)
>  	char *name;
>  	int ret;
> =20
> +	data =3D device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, -ENODATA, "Missing driver match data\n");
> +

[Severity: Medium]
Since passing complex structure pointers via the match table is discouraged,
would it be better to retrieve an integer or enum ID here?

A standard pattern is to use a switch statement on the retrieved ID to sele=
ct
the appropriate static const mfd_cell array directly within the probe funct=
ion
rather than receiving a pointer to it.

[ ... ]
> +static const struct pm8008_match_data pm8008_data =3D {
> +	.irq_chip_desc =3D &pm8008_irq_chip,
> +	.mfd_cells =3D pm8008_cells,
> +	.num_mfd_cells =3D ARRAY_SIZE(pm8008_cells),
> +};
> +
> +static const struct pm8008_match_data pm8010_data =3D {
> +	.irq_chip_desc =3D &pm8010_irq_chip,
> +	.mfd_cells =3D pm8010_cells,
> +	.num_mfd_cells =3D ARRAY_SIZE(pm8010_cells),
> +};
> +
>  static const struct of_device_id pm8008_match[] =3D {
> -	{ .compatible =3D "qcom,pm8008", },
> +	{ .compatible =3D "qcom,pm8008", .data =3D &pm8008_data },
> +	{ .compatible =3D "qcom,pm8010-i2c", .data =3D &pm8010_data },
>  	{ },
>  };

[Severity: Medium]
Does this match table improperly embed complex pointers?

The MFD documentation explicitly flags passing complex pointers via the
.data field of match tables as a pattern to avoid. Using an ID enum
such as (void *)TYPE_PM8008 instead of passing the &pm8008_data pointer
would comply with the core subsystem patterns.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-pm8010_i2c=
_support-v1-0-de33d78fad9d@oss.qualcomm.com?part=3D4
