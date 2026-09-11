Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F8136894D
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152997; cv=none; b=mLg+TF9d98/mLiZELyH577KX3va7MsN1+BMRr6MmGXAonbPoo5g1tx1iGHfNVxrQ+x6KW3VDeuYz6N7+xZoWZgntepPFDjxC1mGVmx0R1N5Erq4qFiwJWeAQUi7mX+ow9m6URcmfZfJa+jiXTv7zykwEtmCWwMczweI9Msmfa1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152997; c=relaxed/simple;
	bh=gg52gPBn+Jua79dOCs3oHuWjen41G02p/MZQxDB83pw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vhtoa/GperrUYvBAZkXeBvB/VFZ5n4abQZiXGb36lgMsLRy9kghaFvPffE72RwtOwK8qo6nO5KcVP5gKxM3C5PJ2sYZGCucS+sTG+bu7EmQsO7uZFcjywh3YEQd3otcZ4lKiSvM601trp6WCvFPBAJM41xHNy1jwc9iiKS+P6Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBBBZGNP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBBBZGNP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E821F000FF;
	Fri, 11 Sep 2026 18:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789152993;
	bh=qe+X/qIlxhBDtaLKCsU9/NN3/QuZXKZMAe3Hp6X0ltI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cBBBZGNP0W3t8rw7HuBjyxLrS1QEg/Mt9IwxPCNxpzigyEzxkYLfzkn9f/vAF+yoH
	 z07LBsbi0hkDV3oVrj1fTl2z8CQq6sRh3loN6mTd0BfboiDd4cPFGuXlWOSAr5PVZ3
	 cxf8k8CBUckPFNPhZeRGXkCGi0H/tsJSRqHyrb1KXPQIv5TUo5PPwZZlqbFlH7JY05
	 ktaFjXwXoE4NEzgC8AcIJCRTFT6REw2XBEbF74PmEfNb/RTwg+xb9MO6LsSJz1X8dD
	 11HHUeSaRtIwaf3T1pBce612LwGrVhO1OfVnL+vmZSKbWFER/lNyFVUmEG72ym9CuP
	 AERNBdyDUFs3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/9] i2c: cgbc: Add support for fixed frequency buses
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-6-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-6-594b53fbc5ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 18:56:32 +0000
Message-Id: <20260911185632.E6E821F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized stack variable `data` or a hardware-reported frequen=
cy of 0 leads to a kernel panic via division by zero when calculating `read=
_maxtime_us`.
--

commit a5aecc6c875f05c7505536612661e80e88abe3e8
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

i2c: cgbc: Add support for fixed frequency buses

This commit adds support for I2C buses running at a fixed frequency by
introducing a fixed_freq flag in cgbc_i2c_platform_data. It splits the
frequency configuration into two functions, cgbc_i2c_set_frequency() and
cgbc_i2c_get_frequency(), to skip setting the frequency for fixed buses
while still computing read_maxtime_us.

> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
> index d388e07aad84a..cb0435b3cc5f9 100644
> --- a/drivers/i2c/busses/i2c-cgbc.c
> +++ b/drivers/i2c/busses/i2c-cgbc.c
[ ... ]
> @@ -140,18 +139,21 @@ static int cgbc_i2c_set_frequency(struct i2c_adapte=
r *adap,
>  	cmd[0] =3D CGBC_I2C_CMD_SPEED | i2c->bus_id;
>  	cmd[1] =3D cgbc_i2c_freq_to_reg(bus_frequency);
> =20
> -	ret =3D cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
> -	if (ret)
> -		return dev_err_probe(i2c->dev, ret,
> -				     "Failed to initialize I2C bus %s",
> -				     adap->name);
> +	return cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
> +}
> =20
> -	cmd[1] =3D 0x00;
> +static int cgbc_i2c_get_frequency(struct i2c_adapter *adap)
> +{
> +	struct cgbc_i2c_data *i2c =3D i2c_get_adapdata(adap);
> +	struct cgbc_device_data *cgbc =3D i2c->cgbc;
> +	u8 cmd[2] =3D { CGBC_I2C_CMD_SPEED | i2c->bus_id };
> +	unsigned int bus_frequency;
> +	u8 data;
> +	int ret;
> =20
>  	ret =3D cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>  	if (ret)
> -		return dev_err_probe(i2c->dev, ret,
> -				     "Failed to get I2C bus frequency");
> +		return ret;
> =20
>  	bus_frequency =3D cgbc_i2c_reg_to_freq(data);

[Severity: High]
This is a pre-existing issue, but can this lead to a division by zero panic?

In drivers/i2c/busses/i2c-cgbc.c:cgbc_i2c_get_frequency(), the output buffer
variable data is declared on the stack without initialization. It is passed
to cgbc_command() which, under certain hardware conditions (like returning
CGBC_STATUS_CMD_READY in drivers/mfd/cgbc-core.c), can succeed while
skipping the read loop, leaving data completely untouched.

If data remains uninitialized garbage that evaluates to 0, or if the hardwa=
re
legitimately returns a value that parses as 0 for an uninitialized
fixed-frequency bus, cgbc_i2c_reg_to_freq() will return 0 for bus_frequency.

The unvalidated bus_frequency is then used as a divisor when calculating
read_maxtime_us a few lines later:

i2c->read_maxtime_us =3D (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_LEN
        * USEC_PER_SEC / bus_frequency;

Could we initialize data and check if bus_frequency is valid before dividin=
g?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-i2c-s=
torage-devices-support-v3-0-594b53fbc5ea@bootlin.com?part=3D6
