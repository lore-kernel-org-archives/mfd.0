Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88EA3AC0FE
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510619; cv=none; b=mcQGwAysYcowIZwqrSCgLq/RbvOM/GPz9gMyCfNe1GSi227E8Hm8VYs/YOli6KniKW/mizEPk5FEQIBgK3K7n4WnxlWmQUjGy17QJeXFSfk+aeAWF8DQMXKx3fPIOgE5PgF+5ik19nooZFT7TEAGCxQZg0Djg7RyaGFsWWmbDJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510619; c=relaxed/simple;
	bh=wF9JmPAYGL5usJ0FFarxPuDkHLXTNK+VXwRP9Bk0SbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lVeAAKQBdaBJ2G1e7W0e6+Av3hL4doZ/rxbKfewDER8NG28yJlfJiggsLTzfjPtzzACLT9GXOi8BnCdrY1/rBvJTHTLN8TDOvda8MQsSDKBdITwa0HfH397go7k++GZvMX9dUOA8SPqX81YS8SS+Kw4cYcHlllmGCHFYBDzJhoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbPFzpWo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbPFzpWo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CD21F00A3A;
	Wed,  8 Jul 2026 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510617;
	bh=w2HskxtdXbY0NkLwOi2auY+I0VD8NNfnKLQlC+hYEms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cbPFzpWoTbnFnET//CHPZrTiyD5+1ziDAitgKjpcaeekkx725sUUMaysHoaj45m7l
	 8v++bP9G2lKhPZveIC27MteJRfEArA6UR+bVFOFFXkziQXi9rngiS2HDFFoG2kl+fE
	 RiqMTtN5yYpXOyfpsF3myeCAHh4Vtyw6ktIqxIU3YbEfcaZnOvnXGg7GH+1pzJcVgC
	 8UPioJL/93wQ7L+hib+YyrRTBvejxQ9RpFj9qu0X73i5mIe/ZXh6K7njuy5gJp/jUw
	 Ewg+WGnWa2NWcbFrJbA+sNCPIYfXz4Lb9IONrp1ugKQvUVQzRJqBtCW7nNypifiWQx
	 VqACRTLF5tFPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 20/23] mfd: Unify style of i2c_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <9c8fe48a1f971d75191c636f2b6d3ef1c68a26e2.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <9c8fe48a1f971d75191c636f2b6d3ef1c68a26e2.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:36:56 +0000
Message-Id: <20260708113657.12CD21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Shallow copying of the entire parent context via platform_data in =
wm8400_register_codec.
- [High] Potential NULL pointer dereference of I2C device ID during probe.
- [Medium] Local/stack-allocated mfd_cell structure in wm8400_register_code=
c.
- [Medium] Dynamic amendment of mfd_cell arrays in si476x_core_probe.
- [Medium] Manual cell ID mapping instead of using PLATFORM_DEVID_AUTO in s=
i476x_core_probe.
--

--- Patch [20]: [PATCH v2 20/23] mfd: Unify style of i2c_device_id arrays -=
--
commit 6a5d15234f3fcc68bbda3db02225f521d1961fe2
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Unify style of i2c_device_id arrays

Most of these arrays already mostly match the most used and
generally recommended coding style. That is:
 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

> diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
> index f25a4b60071bf..30e545cd08896 100644
> --- a/drivers/mfd/si476x-i2c.c
> +++ b/drivers/mfd/si476x-i2c.c
[ ... ]
> @@ -844,7 +844,7 @@ static const struct i2c_device_id si476x_id[] =3D {
>  	{ .name =3D "si4761", .driver_data =3D SI476X_CHIP_SI4761 },
>  	{ .name =3D "si4764", .driver_data =3D SI476X_CHIP_SI4764 },
>  	{ .name =3D "si4768", .driver_data =3D SI476X_CHIP_SI4768 },
> -	{ },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, si476x_id);

[Severity: High]
This is a pre-existing issue, but since we are looking at this driver, coul=
d a
user-space process force-binding the driver trigger a NULL dereference?

In si476x_core_probe(), the driver immediately dereferences the ID without
checking if it is NULL:

si476x-i2c.c:si476x_core_probe() {
    ...
    const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
    ...
    core->chip_id =3D id->driver_data;
    ...
}

If force-bound to a device using sysfs (e.g. driver_override),
i2c_client_get_device_id() will return NULL, causing a panic.

[Severity: Medium]
This isn't a bug introduced by this patch, but does the dynamic amendment of
the mfd_cell array in si476x_core_probe() violate MFD subsystem guidelines?

si476x-i2c.c:si476x_core_probe() {
    ...
    cell =3D &core->cells[SI476X_RADIO_CELL];
    cell->name =3D "si476x-radio";
    ...
}

The guidelines state: "Define mfd_cell arrays as static const. For mfd_cell=
s,
do not create local copies for dynamic amendments; always use static
references."

[Severity: Medium]
This is also a pre-existing issue, but is it safe to use a manually calcula=
ted
cell ID in si476x_core_probe()?

si476x-i2c.c:si476x_core_probe() {
    ...
    err =3D mfd_add_devices(&client->dev,
                          (client->adapter->nr << 8) + client->addr,
                          core->cells, cell_num,
                          ...);
    ...
}

The MFD guidelines recommend using PLATFORM_DEVID_AUTO instead of hard-coded
or mathematically mapped IDs, as they can lead to device naming collisions =
in
sysfs.

> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> index b0dbee3e6ea2f..d19bd3643591e 100644
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
[ ... ]
> @@ -532,9 +532,9 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
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

[Severity: High]
This is a pre-existing issue, but does tps65910_i2c_probe() have the same
potential NULL pointer dereference risk?

tps65910.c:tps65910_i2c_probe() {
    ...
    const struct i2c_device_id *id =3D i2c_client_get_device_id(i2c);
    ...
    unsigned long chip_id =3D id->driver_data;
    ...
}

If a privileged user force-binds the driver via sysfs, id will be NULL, whi=
ch
results in an immediate crash upon dereference.

> diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
> index 1c0ba450ef9b6..d3180aa44e1a1 100644
> --- a/drivers/mfd/wm8400-core.c
> +++ b/drivers/mfd/wm8400-core.c
[ ... ]
> @@ -135,8 +135,8 @@ static int wm8400_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct i2c_device_id wm8400_i2c_id[] =3D {
> -       { .name =3D "wm8400" },
> -       { }
> +	{ .name =3D "wm8400" },
> +	{ }
>  };

[Severity: High]
This isn't a bug introduced by this patch, but does the shallow copying of =
the
entire parent context via platform_data in wm8400_register_codec() pose a
memory safety hazard?

wm8400-core.c:wm8400_register_codec() {
    ...
    const struct mfd_cell cell =3D {
        .name =3D "wm8400-codec",
        .platform_data =3D wm8400,
        .pdata_size =3D sizeof(*wm8400),
    };
    ...
}

By passing the entire parent struct wm8400 by value, mfd_add_devices() copi=
es
the embedded structures (like struct device, containing kobject and mutex).
Duplicating embedded struct devices by value usually leads to duplicate loc=
ks
and undefined behavior. MFD rules require child drivers to retrieve parent
data using standard APIs like dev_get_drvdata(pdev->dev.parent) instead.

[Severity: Medium]
This is also a pre-existing issue, but does the stack-allocated local
mfd_cell in wm8400_register_codec() violate MFD guidelines?

wm8400-core.c:wm8400_register_codec() {
    ...
    const struct mfd_cell cell =3D {
        .name =3D "wm8400-codec",
        ...
    };
    ...
}

The MFD guidelines require that mfd_cell arrays are defined as static const,
and explicitly state not to create local copies for dynamic amendments.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D20
