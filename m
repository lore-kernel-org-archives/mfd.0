Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802721;
	b=nDYdW7Z7jjjCvnKWPmBIMWe9GOhzS3Xbft/ROQIRMcLtRlk6JQYzF6BxotHeWZNRWg9O
	 +9sUfX7Vm2vPTInVzyQVJP4ETiELNGYS8/Q3+xwzMUxAyTUO16/f81fW1RxmoUXfyKLaw
	 ljMwJYBR58+JSwLnjvp7ATg8GYJIOCZ8Arr9d6URnEiWGZQt3PlvNLJZJs+UKqCyw62Ba
	 XrZvTCDicfUESx3c77XWHGnZ76b8a/W9MR4YorxjUKj9S+2T02MbHE1OE0g+dMT+sLtpj
	 al06wf4QVV/SFNJZh8eIh6rIKZsEIoA2zKj5yuDlog7M797MFDJc1tyT4RGJvABIoIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802721;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=phhd/npU1lhHPxPB7FouqLAJZQihBFGXoRy7gzmW9RA=;
	b=25k8P1HeMLAZbKu3DXFMZpg14WtkpYl8ZBEbY2Z6ORPfP0QUxO6nndX2Hrwx8FQEC1SN
	 jaU9GFVK7Bu9qn3wLbOrTjIoq2H6A9AGlkos3PYG3Aoxr713d0Td1cXFloumFrqZoD5t2
	 QJGtlP53Zf4tMjCnJbXx2BXCCiVQUI6/Vw8cGat2uxkl/0dvPJzrhOs6J7iJlt986KMFL
	 yHaM2ua7Ip5rZxWMBN12X2vQAFPUDtmnAmWktPQnPbmPf0/WbNoKrudXahe+du8lJOUWj
	 aY3VCAiP4eT+wGaFkIA0j8QmtNz8ewZE+lzqW9TRj5lc0mura6WfQ4kAwu46dbuW/Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dd54I323;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACF2606A321
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 18:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dd54I323
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7185F1F00899;
	Fri, 27 Nov 2026 18:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802720;
	bh=phhd/npU1lhHPxPB7FouqLAJZQihBFGXoRy7gzmW9RA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dd54I323nmard164RtH6WR54jIhEOIzuJ9XAwPeIJLv+usC06RJYLXzJ0fuFcRSwt
	 Bchir6SF2H1m9Lg0BJ5yeInydSOnUeWxaRbMMPn7XpdamuxwHRbt/WDqxOzs1q8O25
	 OpzUnn5fOjKNRtaNb0ZosKgd9FhlS3C3/LDleL24qOzQ3ympI+SY/5h49PhDqQvVtA
	 BANMNZwUpTVqwqft9QWPZiZ8gOE9drrbya+ED9exG7RqaLhXiNN/Bg+m4YEfvhqK4h
	 gGf+fIyK9rb8u7gDkpTFwhYSB3CgPrtRZx7HDV2rPToqGjJ3GVBzzhV4iuA1LRx/1U
	 yYYWqmavm8QUw==
Message-ID: <sashiko-outbox-238034@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/11] i2c: cgbc: Add support for fixed frequency
 buses
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127-cgbc-i2c-storage-devices-support-v7-7-d0e70fc57879@bootlin.com>
References: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
 <20261127-cgbc-i2c-storage-devices-support-v7-7-d0e70fc57879@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 18:05:20 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] i2c: cgbc: division by zero in cgbc_i2c_get_frequency() on zero
  freq field
--

commit d95d796e831a81afb0ee29f103c5479fbfc45e3b
Author: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

i2c: cgbc: Add support for fixed frequency buses

This commit adds a fixed_freq flag to struct cgbc_i2c_platform_data and
splits cgbc_i2c_set_frequency() into cgbc_i2c_set_frequency() and
cgbc_i2c_get_frequency() so fixed-frequency buses can compute
read_maxtime_us without setting the bus speed.

> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
> index 50483bdc67307..85cbe709bcde9 100644
> --- a/drivers/i2c/busses/i2c-cgbc.c
> +++ b/drivers/i2c/busses/i2c-cgbc.c
> @@ -128,7 +128,6 @@ static int cgbc_i2c_set_frequency(struct i2c_adapter =
*adap,
>  	struct cgbc_i2c_data *i2c =3D i2c_get_adapdata(adap);
>  	struct cgbc_device_data *cgbc =3D i2c->cgbc;
>  	u8 cmd[2], data;
> -	int ret;
> =20
>  	if (bus_frequency > CGBC_I2C_FREQ_MAX_HZ ||
>  	    bus_frequency < CGBC_I2C_FREQ_MIN_HZ) {
> @@ -139,18 +138,29 @@ static int cgbc_i2c_set_frequency(struct i2c_adapte=
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
> +	u8 data =3D 0;
> +	int ret;
> =20
>  	ret =3D cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
>  	if (ret)
> -		return dev_err_probe(i2c->dev, ret,
> -				     "Failed to get I2C bus frequency");
> +		return ret;
> +
> +	/*
> +	 * The BC should never return a zero value; if it does, the resulting b=
us
> +	 * frequency is 0 Hz, causing a division by zero when computing
> +	 * read_maxtime_us.
> +	 */
> +	if (!data)
> +		return -EIO;
> =20
>  	bus_frequency =3D cgbc_i2c_reg_to_freq(data);

[Severity: Low]
As reported by Andi Shyti on v6 [1], can cgbc_i2c_get_frequency() still
divide by zero when computing i2c->read_maxtime_us if data has non-zero
unit bits in CGBC_I2C_FREQ_UNIT_MASK (0x40, 0x80, or 0xC0) and a zero
frequency field in CGBC_I2C_FREQ_VALUE_MASK?

cgbc_i2c_reg_to_freq() masks off the upper unit bits and multiplies only
data & CGBC_I2C_FREQ_VALUE_MASK, so checking !bus_frequency after
cgbc_i2c_reg_to_freq() (or checking !(data & CGBC_I2C_FREQ_VALUE_MASK))
would catch all encodings that evaluate to 0 Hz.

[1] https://lore.kernel.org/r/awhXXeFy-9vuqseH@zenone.zhora.eu

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-cgbc-i2c-s=
torage-devices-support-v7-0-d0e70fc57879@bootlin.com?part=3D7
