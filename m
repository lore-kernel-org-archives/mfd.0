Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6330B1FBC8C
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509863; cv=none; b=epiZ0pzpA3HxWQd35A307Xx9kG9hgfyiriPsZ2LCLsz4w8D0IHSyFh1l92s2QH4VlllkCCL8k6lMFeyherty56kAkGBxc2fkn0+aJvzCCEiVRgtuOdvnOCuWKSL6rOpG3npWAcd3WY3QL3kNy12XnKG9u0txVkHcuj+mZwLEO04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509863; c=relaxed/simple;
	bh=+3gYP9t4JlVZIH93+lbyX2pT9kYX8/bJEl7W9xgORY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FoZDXb4SVPKkFERfRyrdFnhHCHrtHgvplXzRURmvNqGPCfBC6K6+c7hruqIAGvi9CqAC8crOJ9xeiPAKzR9wfrFdjLVB9gBvrfZ7QfAeUQ3GmqnEjU+tS9Y8aEq09zUlN0N16VbDTDwvJmIkRGqYjt31bdHy7v9LjAF5K1fy4kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cw4HeCHS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cw4HeCHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED011F000E9;
	Wed,  8 Jul 2026 11:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509862;
	bh=dtCTtq6GLkkQDpmScSSeL5EUlxMIS+q/gOAkDae6R2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cw4HeCHSj/wV+96WNlbEbIeCQVrwQzntp1afcyK6PeCCcbajwERtWdn7B7NW3jsJt
	 XR/vaRJa0tJWGlJc2KkYb/aj56pwBWhCU3GZt6e/KXsP/8LIxUyvk1cRacVf4JXQtq
	 9mawHN0efNy3f/UTEc5zVlC/NIuP6kP7qKV6Bo4dn88zfODzPVWtk0V/YEhdtGOBQm
	 Wsk55b7mUV8K+Qnm+OBLP5uTArfIuOT8JZKQzN2rfc6VhuZLTIwSWcn6qUVPqTsXi1
	 UyFsLsTPpLlpNwm0Yw9HrykK6CXQrUgscFmrkTfBiu0Ic1MW7WA5CPAsggW3X0y4uy
	 Ye2MFWb0R5C0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/23] mfd: Drop unused assignment of i2c_device_id
 driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <8cbd70006d2b1c4572a3523d05b22c5141ac1095.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <8cbd70006d2b1c4572a3523d05b22c5141ac1095.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:24:21 +0000
Message-Id: <20260708112421.DED011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Manual IRQ descriptors set up in `rc5t583_irq_init` are not unwoun=
d if `devm_mfd_add_devices` fails, leaving dangling pointers in the IRQ dom=
ain.
- [Medium] The `as3711_subdevs` array is declared as `static struct mfd_cel=
l` rather than `static const struct mfd_cell` and is dynamically modified d=
uring the probe sequence to inject platform data. This violates the MFD sub=
system requirement that cell arrays must be constant and exposes the driver=
 to data races.
--

--- Patch [8]: [PATCH v2 08/23] mfd: Drop unused assignment of i2c_device_i=
d driver data ---
commit 8379acaecc9704c9b84d18aac2206438b37018a2
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Drop unused assignment of i2c_device_id driver data
   =20
The drivers explicitly set the .driver_data member of struct
i2c_device_id to zero without relying on that value. Drop these
unused assignments.

> diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
> index 9741977031df0..eb03b813d58f0 100644
> --- a/drivers/mfd/as3711.c
> +++ b/drivers/mfd/as3711.c
> @@ -192,7 +192,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
>  }

[Severity: Medium]
This is a pre-existing issue, but I noticed that the as3711_subdevs
array is dynamically mutated during the probe sequence in
as3711_i2c_probe():

	if (pdata) {
		as3711_subdevs[AS3711_REGULATOR].platform_data =3D
			&pdata->regulator;
		as3711_subdevs[AS3711_REGULATOR].pdata_size =3D
			sizeof(pdata->regulator);
		...
	}

The cell array is incorrectly declared as static struct mfd_cell instead
of static const struct mfd_cell. Could this cause the wrong platform
data to be assigned if multiple instances of the AS3711 PMIC are probed
concurrently on different buses, as they would race to write their
device-specific data into the shared global as3711_subdevs array before
it is copied by devm_mfd_add_devices()?

> =20
>  static const struct i2c_device_id as3711_i2c_id[] =3D {
> -	{.name =3D "as3711", .driver_data =3D 0},
> +	{ .name =3D "as3711" },
>  	{}
>  };

[ ... ]

> diff --git a/drivers/mfd/rc5t583.c b/drivers/mfd/rc5t583.c
> index 2c0e8e9630f74..4ad761fbfab24 100644
> --- a/drivers/mfd/rc5t583.c
> +++ b/drivers/mfd/rc5t583.c
> @@ -280,7 +280,7 @@ static int rc5t583_i2c_probe(struct i2c_client *i2c)
>  }

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be an
error handling issue in rc5t583_i2c_probe(). Manual IRQ descriptors
are set up via rc5t583_irq_init() using irq_set_chip_data() and
irq_set_chip_and_handler(), which point to the devres-managed rc5t583
instance.

If devm_mfd_add_devices() fails, the probe exits:

	ret =3D devm_mfd_add_devices(rc5t583->dev, -1, rc5t583_subdevs,
				   ARRAY_SIZE(rc5t583_subdevs), NULL, 0, NULL);
	if (ret) {
		dev_err(&i2c->dev, "add mfd devices failed: %d\n", ret);
		return ret;
	}

Since these descriptors are not explicitly unwound on this error path, and
devres frees the rc5t583 structure, does this leave dangling pointers in
the IRQ domain? Could this lead to a use-after-free if the IRQ debugfs
interfaces or /proc/interrupts are queried later for those IRQ numbers?

> =20
>  static const struct i2c_device_id rc5t583_i2c_id[] =3D {
> -	{.name =3D "rc5t583", .driver_data =3D 0},
> +	{ .name =3D "rc5t583" },
>  	{}
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D8
