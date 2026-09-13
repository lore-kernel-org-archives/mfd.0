Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884CF285061
	for <mfd@lists.linux.dev>; Sun, 13 Sep 2026 02:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789266167; cv=none; b=J0ZBomOGSAPjazKO4fnUBqPEUQTxlaiGwlah7QtRbST+Ypnq25XsWFb65ydMkHpdGQrxugJDqMW7PXZ1Z+upOo4gDJyHlG4LrotG5qUaks/FAiT5eJsyN2vJKvB1mteObUVXHImSa7H52YNlQqieuyhQ61uk/M5xZebdec3qqPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789266167; c=relaxed/simple;
	bh=22wu3d85jazbKAfsv2+pTlCsMqZpmKb3p9rkB8FsfFg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AuJ2ewP0pb+YoA5JMn9lq6oYKnOR+0M2K1IPi3jzxirzEWzYnPTk1HMyLzOPwfG8vCaqzMD8XcYybOzFYzNh4BD4qQlDyW4Sm8pWRFbI5jJtTSV28AiZHXPWBjTxaJq8vhXX2h+Uf+vjhlczZLYJiIhGjEL8/V4hsFf9mE666ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYpPVYgI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYpPVYgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D802B1F000FF;
	Sun, 13 Sep 2026 02:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789266166;
	bh=Lyqnh9VgfuHS3AhRGiUd7PQo0VezoCv0QYFIZSffeqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FYpPVYgIVWAWNmZV9PW6fqhf4Bgbo6qB/ryHEPQJuKWq6HFawyO+V1Nf1AkufevRH
	 gZ5lnB1eJwlDlmWZ9JKyELi8r898N3e3VCK2Hy8qBNC9kN8bzn87EJm/cfBSSYAeg8
	 wZTnOk7yEP9E46QwKWlWmE9f8rZE0Pl/0MMY9J4Z3K17YSm9QsviAthN1c2RIDpMRO
	 Oanwl5qKZsDHVmj06uhSEYGafJ+JyU9v57c2iAXrCgvqvkw9WbIdAB5XzTkYsgXnwf
	 VGxzYypl3wkDB5sb3Xvofyycf0miAuo5lRXNS0xJlEj5Am7ZsPz18KfGlYlzXQTTHm
	 gedU17Nvz0tsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: da9150: balance IRQ wake on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260913021420.60344-1-mhun512@gmail.com>
References: <20260913021420.60344-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 02:22:45 +0000
Message-Id: <20260913022245.D802B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized, violating the MF=
D subsystem guidelines.

Pre-existing issues:
- [High] The global static mfd_cell array `da9150_devs` is not const and is=
 dynamically modified during probe, violating MFD guidelines and introducin=
g data races/state corruption.
- [High] `da9150_reg_read()` returns an uninitialized value on `regmap_read=
()` failure, which is then used to compute an I2C device address.
--

commit e761f00f1bf078aef3d54fe1deeb793b0138ed73
Author: Myeonghun Pak <mhun512@gmail.com>

mfd: da9150: balance IRQ wake on teardown

This commit ensures that IRQ wake is properly disabled on probe failure or
driver removal if it was successfully enabled. It prevents wake depth
imbalance by tracking the success of enable_irq_wake.

> mfd: da9150: balance IRQ wake on teardown

[Severity: Low]
This isn't a bug, but MFD subsystem guidelines require the commit descripti=
on
to be capitalized. Should the subject line be formatted as mfd: da9150:
Balance IRQ wake on teardown?

> diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
> index 5c59cc869fb3e..d91d419fea663 100644
> --- a/drivers/mfd/da9150-core.c
> +++ b/drivers/mfd/da9150-core.c
> @@ -450,7 +450,8 @@ static int da9150_probe(struct i2c_client *client)
> =20
>  	da9150->irq_base =3D regmap_irq_chip_get_base(da9150->regmap_irq_data);
> =20
> -	enable_irq_wake(da9150->irq);
> +	if (!enable_irq_wake(da9150->irq))
> +		da9150->irq_wake_enabled =3D true;
> =20
>  	ret =3D mfd_add_devices(da9150->dev, -1, da9150_devs,
>  			      ARRAY_SIZE(da9150_devs), NULL,

[Severity: High]
This is a pre-existing issue, but I noticed da9150_devs is a global array
that gets dynamically modified during probe:

drivers/mfd/da9150-core.c:da9150_probe() {
...
		da9150_devs[DA9150_FG_IDX].platform_data =3D pdata->fg_pdata;
...
}

Does modifying a shared global mfd_cell array during probe corrupt the state
for all subsequent instances of the device? If a second da9150 device is
probed without its own platform data, it seems it would incorrectly inherit
the platform_data assigned to the first device, potentially leading to
incorrect hardware configuration or use-after-free conditions.

[Severity: High]
This is also a pre-existing issue, but looking earlier in da9150_probe(), it
uses da9150_reg_read() to get the qif_addr:

drivers/mfd/da9150-core.c:da9150_probe() {
...
	qif_addr =3D da9150_reg_read(da9150, DA9150_CORE2WIRE_CTRL_A);
	qif_addr =3D (qif_addr & DA9150_CORE_BASE_ADDR_MASK) >> 1;
	qif_addr |=3D DA9150_QIF_I2C_ADDR_LSB;
	da9150->core_qif =3D i2c_new_dummy_device(client->adapter, qif_addr);
...
}

If regmap_read() fails inside da9150_reg_read(), it leaves val unassigned:

drivers/mfd/da9150-core.c:da9150_reg_read() {
	int val, ret;

	ret =3D regmap_read(da9150->regmap, reg, &val);
...
	return val;
}

Can this lead to the driver registering a dummy device at an unpredictable
I2C address derived from an uninitialized stack variable? It seems
subsequent reads or writes to the QIF interface could target this random
address, potentially corrupting the state of another hardware device on the
bus.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913021420.6034=
4-1-mhun512@gmail.com?part=3D1
