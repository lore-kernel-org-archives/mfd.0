Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51194547077
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 03:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948842; cv=none; b=WAJVxAqRIgGj8BjWlerHoXkC06sKG/I0ITm413cYi+LhsFvdN08zLd7KKOK8mqe44ovs7XrSyqca5Ms+LgjBbjdfkQ5JTAJCWNkuBv7qmRAAqN7X2FzosJvCxNoXqyP+ttinIUA0AEeEs30vKP0FCyHCroDU+z/2wcSNrmxZTo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948842; c=relaxed/simple;
	bh=1Mc31f+RIN7cUzut3g/W0QXeiVSr4S++9B/q3uDuvdM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mr2tbz5YfJfnXMWiKxCLtdGD4HoeWbJFEwFzkGgga+gT4hoZ0YC/0F9A6Grd4hNGVvcFNjLUcuByCBFs33ihbHdiTCjsG1oB91oRgtYQHGoVBOabGEmLa+ey+iTm2e2dGZhY/Y64JKd4PGdJcTy+vmKKaW8A3vTJ0jvrVl0a2Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F81umND1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F81umND1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D2A1F000FF;
	Wed, 14 Oct 2026 03:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791948840;
	bh=LVmMAKO5tUKqpsTIq82APodXfqac2skwXUsZUOLxpAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F81umND17KeKsRXHlxWwD0BQgs+5EiqzH8KYdSh1nkfCZ+yw5b7RFXkwaaN4Nm8IP
	 KXTWrvEeVZqWfT6p+pVGD1Xwd7Cb+lkRZHCMn+vWzEB27Ty7Rg8y/PIKHPQiodr321
	 ujzk2MzKDcbWd/aXu0JXAmw3IlPYAuwFL4NLcX8iU/Z1fMfFBDj6yUKRvNEKse6OGB
	 ssqv3sKjhUJN7/oKs0gvDxqQh1GkhduY4/tNCUrrgA8OXQ2TeGHVO+NLcPsNDqAU8+
	 dHCOMamPUaLSwfJVM8/puzNoceMFCNUMSIi6pE53plpp39krJ0oOcvWk3QTR5rJ3XB
	 EcJaPvNsqXuCg==
Message-ID: <sashiko-outbox-170787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: max77620: publish module aliases with variant
 match data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <hppiscas@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014032139.10971-1-hppiscas@163.com>
References: <20261014032139.10971-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 03:34:00 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] mfd: max77620: module locked in memory due to builtin_i2c_driver=
()
- [Low] mfd: commit message capitalization rule violation
- [Low] i2c: i2c_device_id array missing named initializers
--

commit 136798e63ca9dfe05f3e4f123a426fecb599c415
Author: Pengpeng Hou <hppiscas@163.com>

mfd: max77620: publish module aliases with variant match data

This commit publishes both the I2C ID table and the OF match table for the
MAX77620 driver to provide module aliases. It updates both tables to use
pointers to chip IDs and retrieves the variant through i2c_get_match_data(),
ensuring reliable matching.

> mfd: max77620: publish module aliases with variant match data

[Severity: Low]
This isn't a bug, but the MFD subsystem requires the commit message
description to be capitalized after the subsystem prefix. Should "publish" =
be
"Publish" to match the guidelines?

> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> index c4f89a9681f34..4947ee96cc62c 100644
> --- a/drivers/mfd/max77620.c
> +++ b/drivers/mfd/max77620.c

[ ... ]

>  static const struct i2c_device_id max77620_id[] =3D {
> -	{"max77620", MAX77620},
> -	{"max20024", MAX20024},
> -	{"max77663", MAX77663},
> +	{"max77620", (kernel_ulong_t)&max77620_chip_ids[MAX77620]},
> +	{"max20024", (kernel_ulong_t)&max77620_chip_ids[MAX20024]},
> +	{"max77663", (kernel_ulong_t)&max77620_chip_ids[MAX77663]},
>  	{},
>  };

[Severity: Low]
This isn't a bug, but the I2C subsystem guidelines state that initialized
arrays of type struct i2c_device_id must use named initializers.

Could these positional arguments be replaced with C99 designated initialize=
rs
(e.g., .name =3D "max77620")?

> +MODULE_DEVICE_TABLE(i2c, max77620_id);
> +
> +static const struct of_device_id max77620_of_match[] =3D {
> +	{ .compatible =3D "maxim,max77620", .data =3D &max77620_chip_ids[MAX776=
20] },
> +	{ .compatible =3D "maxim,max20024", .data =3D &max77620_chip_ids[MAX200=
24] },
> +	{ .compatible =3D "maxim,max77663", .data =3D &max77620_chip_ids[MAX776=
63] },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max77620_of_match);
> =20
>  static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
>  				max77620_i2c_suspend, max77620_i2c_resume);
> @@ -706,6 +724,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(max77620_pm_ops,
>  static struct i2c_driver max77620_driver =3D {
>  	.driver =3D {
>  		.name =3D "max77620",
> +		.of_match_table =3D max77620_of_match,
>  		.pm =3D pm_sleep_ptr(&max77620_pm_ops),
>  	},
>  	.probe =3D max77620_probe,
>  	.id_table =3D max77620_id,
>  };

[Severity: Medium]
Looking at the driver registration just below this in the source code:

builtin_i2c_driver(max77620_driver);

Since this driver can be built as a module (CONFIG_MFD_MAX77620=3Dm), does =
the
use of builtin_i2c_driver() instead of module_i2c_driver() omit the
unregistration and cleanup paths?

If builtin_i2c_driver() is used, the module could be permanently locked in
memory upon loading (rmmod will return -EBUSY). If forcefully unloaded,
i2c_del_driver() is never called, which leaves the I2C core with a dangling
pointer to freed memory, leading to a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014032139.1097=
1-1-hppiscas@163.com?part=3D1
