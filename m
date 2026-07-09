Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475A530B517
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617342; cv=none; b=UZ9JrhZ/F82YPxr8iUpr7hd/JCyYWsfkqYx07A8uTZBwWJmn0i8K0ie9L1alwE9gWUUMK0rtUG1W4xvVEib4U6UqADp09/EQw39SfJNu09GrsX/1xCLYkjdBq/9zVYABUcVkGGD0VSbjPH7PleR5gzpOVEJQ7QtP1T1efQVOIMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617342; c=relaxed/simple;
	bh=eHAyVvPx7rCje2c9pEVrD+U8PDdabERRMQnFp7sR+e8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VVxny8yrUohrVIUYSSmCFsxwfwXXNM/7tecTBZGzlrl0TZwT3Yd+IwS3wCduWkOGVrQisorBW4AyXzXc02Fdra7wNguPvHltQCPk1wJG2ttPsxokGOk2MZo+fABWKFPSuxM6GClGLo+p2aNywd5XVA9QkIgBKQ0cq/LeC6xiVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLFc8VMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLFc8VMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B891F000E9;
	Thu,  9 Jul 2026 17:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617341;
	bh=gAyjBJyeyxs7TiW578gS9C8/LIYsCY+Ee8EzyL7MPGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hLFc8VMz0uNd2K0I0G1Gat+/TN5aTLW1k04xyE89/my6iWVgUUZ23bqVXNu9cDT/N
	 Zf/y6f4lZLVsDX0r70AGeMesCUCaqhX1PlFOGBHKQXTcECzsHSEbSFB6ddrjkGxmrp
	 9YsanQIAehPCUfyFyBgDQthqlbkhyMMGS4ly3CzcaN1DsIqZX/NGmVtMP/8FzRS75T
	 SgnBEvS8tXgFP8zgDYRXXM01DwO94T+v/l4Xeh/4K+iI3sSK49IWLmLnIiw0aQKUCo
	 3aIoi/yb6Y8NWOu+YHv76iNIMGv+fexCDv0rHlUPe0DSEd8aSRfR2MzB/FKV7YlHLg
	 JJtwJ/ScKua5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 20/23] mfd: Unify style of i2c_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <a2a2ece7d82cfe644c5c588f84379917790dc923.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <a2a2ece7d82cfe644c5c588f84379917790dc923.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:15:40 +0000
Message-Id: <20260709171540.B8B891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Global pm_power_off function pointer is left dangling on probe fai=
lure.
- [High] Unchecked platform data leads to NULL pointer dereference.
- [High] Modifying static global `mfd_cell` arrays causes race conditions d=
uring concurrent probes.
--

--- Patch [20]: [PATCH v3 20/23] mfd: Unify style of i2c_device_id arrays -=
--
commit ed27c4e578b835bc9b4235fcb8ff1d9a5f055852
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Unify style of i2c_device_id arrays

The patch adapts the styling of i2c_device_id arrays in various MFD drivers=
 to
match the recommended coding style. It ensures consistent spacing and forma=
tting
for list terminators.

> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index 74dc419402f96..fe1017c6234bf 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c

[Severity: High]
This is a pre-existing issue, but modifying static global mfd_cell arrays c=
an
cause race conditions during concurrent probes. In device_rtc_init(), the
driver dynamically modifies the fields of a globally defined static struct
mfd_cell array:

drivers/mfd/88pm800.c:device_rtc_init() {
    ...
    rtc_devs[0].platform_data =3D pdata->rtc;
    ...
}

Modifying shared global state without locks could mean that if two identical
MFD ICs are probed concurrently, their platform data pointers will overwrite
each other. Can we define mfd_cell arrays as static const and avoid local
copies for dynamic amendments?

> @@ -117,7 +117,7 @@ enum {
> =20
>  static const struct i2c_device_id pm80x_id_table[] =3D {
>  	{ .name =3D "88PM800" },
> -	{} /* NULL terminated */
> +	{ } /* NULL terminated */
>  };
>  MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
> =20

[ ... ]

> diff --git a/drivers/mfd/as3711.c b/drivers/mfd/as3711.c
> index eb03b813d58f0..6d2fa63e7f4b1 100644
> --- a/drivers/mfd/as3711.c
> +++ b/drivers/mfd/as3711.c

[Severity: High]
This is a pre-existing issue, but there is a similar data race in
as3711_i2c_probe(). The global as3711_subdevs array is modified directly:

drivers/mfd/as3711.c:as3711_i2c_probe() {
    ...
    as3711_subdevs[AS3711_REGULATOR].platform_data =3D
        &pdata->regulator;
    ...
}

Does this pose a risk of data corruption if two instances are probed at the
same time?

> @@ -193,7 +193,7 @@ static int as3711_i2c_probe(struct i2c_client *client)
> =20
>  static const struct i2c_device_id as3711_i2c_id[] =3D {
>  	{ .name =3D "as3711" },
> -	{}
> +	{ }
>  };
> =20

[ ... ]

> diff --git a/drivers/mfd/da903x.c b/drivers/mfd/da903x.c
> index c949ebc57b182..46d9d823414af 100644
> --- a/drivers/mfd/da903x.c
> +++ b/drivers/mfd/da903x.c

[Severity: High]
This is a pre-existing issue, but does unchecked platform data lead to a NU=
LL
pointer dereference here? In da903x_probe(), dev_get_platdata() is called to
retrieve pdata, which is passed to da903x_add_subdevs() without being check=
ed
for NULL:

drivers/mfd/da903x.c:da903x_add_subdevs() {
    ...
    for (i =3D 0; i < pdata->num_subdevs; i++) {
    ...
}

If the device is instantiated without platform data (e.g., manually via the
I2C sysfs new_device interface), pdata will be NULL. Could this cause an
immediate crash?

> @@ -441,7 +441,7 @@ static const struct da903x_chip_ops da903x_ops[] =3D {
>  static const struct i2c_device_id da903x_id_table[] =3D {
>  	{ .name =3D "da9030", .driver_data =3D 0 },
>  	{ .name =3D "da9034", .driver_data =3D 1 },
> -	{ },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, da903x_id_table);
> =20

[ ... ]

> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> index b0dbee3e6ea2f..d19bd3643591e 100644
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -532,9 +532,9 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)

[Severity: High]
This is a pre-existing issue, but is the global pm_power_off function point=
er
left dangling on probe failure? If devm_mfd_add_devices() fails during
tps65910_i2c_probe():

drivers/mfd/tps65910.c:tps65910_i2c_probe() {
    ...
    if (pmic_plat_data->pm_off && !pm_power_off) {
        ...
        tps65910_i2c_client =3D i2c;
        pm_power_off =3D tps65910_power_off;
    }

    ret =3D devm_mfd_add_devices(...);
    if (ret < 0) {
        dev_err(&i2c->dev, "mfd_add_devices failed: %d\n", ret);
        return ret;
    }
    ...
}

The driver core will release all devm-managed resources, but pm_power_off a=
nd
tps65910_i2c_client remain set. During shutdown, pm_power_off() invokes
tps65910_power_off(), which retrieves the freed tps65910 struct via
dev_get_drvdata() and dereferences it. Could this lead to a use-after-free
and kernel panic?

>  }
> =20
>  static const struct i2c_device_id tps65910_i2c_id[] =3D {
> -       { .name =3D "tps65910", .driver_data =3D TPS65910 },
> -       { .name =3D "tps65911", .driver_data =3D TPS65911 },
> -       { }
> +	{ .name =3D "tps65910", .driver_data =3D TPS65910 },
> +	{ .name =3D "tps65911", .driver_data =3D TPS65911 },
> +	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D20
