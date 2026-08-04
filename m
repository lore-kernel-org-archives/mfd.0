Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ACD46D2BA
	for <mfd@lists.linux.dev>; Tue,  4 Aug 2026 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785858201; cv=none; b=hCW9d+QAegN9i8FM/zeIzePWxdvXHbExfFhErTxb0+BgDVLeFK1Uy2XZi/jNJQyYxskoMdxehn332Vl4oZC2pIxIp3xUiajMpXC5N2jhEr25jTn1ftO5rE2bm2OPgqkYbKxHX1SAMBEsmrlfwbUwxx0+1+fiGWGfJAWk6plz5M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785858201; c=relaxed/simple;
	bh=a07Uz3uYLxSL2PZPbbedQIJOA0tSgsF7DD3OOoHwIbk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kmQnsSy0hru/tmG6bTPkgAtc4FAoMtyj+HICOvi83d+0HnSbAseyR/zjOanXd/KfuBRyJT5jMa9c6NQ7kKFS4Mho0SZh7wKnbMUnjoe4ArF+0NOJgOuINUZg38cN9oHfESq12q3f5WbPwmU+rAghGRYGtCHjwgYp1/O/HBkSaYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=im3LXzMo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="im3LXzMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5766E1F000E9;
	Tue,  4 Aug 2026 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785858197;
	bh=4NolDWOTQrEluPMjs9TqNdETOudx+MYX/SoimvuHsv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=im3LXzMoKwLlzJgDw3h1LuT+ZEf15R7kYt1GRTxQa6W6Qzwd+qSutpymRqoVi26hC
	 Qev5dOM+ojxvC0y98TAvUEOUOj93+0HOY5am8nk89Atf0R/hn/QrNgplKhz9iJ719Q
	 tm6HCG+U8gc1NptQuzvrg1NwLT7nQJmLToG82Ow/Je9Qi1IS5ejdszhGCxi8wk7gp4
	 Ybrelm8TMC2XXFQcBco0M0dbxB1QydA4ahqZEZz90rTm3E5BovROFtLNHSAl8rt7MX
	 ylvVXk9dJW7H/Ayh/hwJ7IgvB/BEfb5MH77kwDZEd5zMps0N159HB52SXVbMFVkpfm
	 lkfVwfbywvWCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] i2c: cgbc: Add virtual I2C bus support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260804-cgbc-i2c-storage-devices-support-v1-2-fed38510671c@bootlin.com>
References: <20260804-cgbc-i2c-storage-devices-support-v1-0-fed38510671c@bootlin.com>
 <20260804-cgbc-i2c-storage-devices-support-v1-2-fed38510671c@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 15:43:16 +0000
Message-Id: <20260804154317.5766E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized stack variable `data` used as a denominator, leading=
 to a potential division by zero panic.
--

--- Patch [2]: [PATCH 2/4] i2c: cgbc: Add virtual I2C bus support ---
commit 68db5c3b940f7f50540127b0266b86e6b3d69b22
Author: Thomas Richard <thomas.richard@bootlin.com>

i2c: cgbc: Add virtual I2C bus support

Internally the Board Controller has a virtual I2C bus with some virtual
storage devices on it. Add support for it by defining a i2c_adapter entry.
This virtual bus has a fixed frequency that cannot be changed.

> diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
> index 25a74fa51aa00..c3f1c83b105a8 100644
> --- a/drivers/i2c/busses/i2c-cgbc.c
> +++ b/drivers/i2c/busses/i2c-cgbc.c

[ ... ]

> @@ -147,11 +148,14 @@ static int cgbc_i2c_set_frequency(struct i2c_adapte=
r *adap,
>  	cmd[0] =3D CGBC_I2C_CMD_SPEED | algo_data->bus_id;
>  	cmd[1] =3D cgbc_i2c_freq_to_reg(bus_frequency);
> =20
> -	ret =3D cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
> -	if (ret)
> -		return dev_err_probe(i2c->dev, ret,
> -				     "Failed to initialize I2C bus %s",
> -				     adap->name);
> +	/* Virtual bus has a fixed frequency */
> +	if (algo_data->bus_id !=3D CGBC_I2C_VIRTUAL_BUS_ID) {
> +		ret =3D cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
> +		if (ret)
> +			return dev_err_probe(i2c->dev, ret,
> +					     "Failed to initialize I2C bus %s",
> +					     adap->name);
> +	}
> =20
>  	cmd[1] =3D 0x00;

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in how
cgbc_i2c_set_frequency() handles the data variable.

Could this lead to a division by zero panic? The data variable is allocated=
 on
the stack uninitialized:

drivers/i2c/busses/i2c-cgbc.c:cgbc_i2c_set_frequency() {
    ...
    u8 cmd[2], data;
    ...
}

When passed to cgbc_command(), if the board controller firmware returns a
successful status but provides a zero byte count, cgbc_command() skips read=
ing
into data and returns 0:

drivers/mfd/cgbc-core.c:cgbc_command() {
    ...
    case CGBC_STATUS_DATA_READY:
        if (istatus > data_size)
            istatus =3D data_size;
        for (i =3D 0; i < istatus; i++) {
            _data[i] =3D ioread8(cgbc->io_cmd + CGBC_CMD_DATA + ((i + 1) % =
4));
    ...
}

If istatus is 0, the loop is skipped and data remains untouched.

When execution continues in cgbc_i2c_set_frequency(), this uninitialized
value is converted to a frequency:

drivers/i2c/busses/i2c-cgbc.c:cgbc_i2c_set_frequency() {
    ...
    ret =3D cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
    if (ret)
        return dev_err_probe(...);

    bus_frequency =3D cgbc_i2c_reg_to_freq(data);
    ...
    algo_data->read_maxtime_us =3D (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_=
LEN
        * USEC_PER_SEC / bus_frequency;
    ...
}

If the uninitialized stack memory evaluates to 0, or if the hardware
explicitly returns a frequency of 0, would this result in a division by zero
during the read_maxtime_us calculation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-cgbc-i2c-s=
torage-devices-support-v1-0-fed38510671c@bootlin.com?part=3D2
