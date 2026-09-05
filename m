Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3197378833
	for <mfd@lists.linux.dev>; Sat,  5 Sep 2026 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616285; cv=none; b=Q6GoFppC0CoK67TBP/ot3AsRzXFHrFSuHqBk7KQ3Cgg5M9QB3Et8MaWvJtJJnigOSwH9VRyewjg0pYcq9+6BA5ceTl0D0s5ACdWTX5FM0kXbEkt5HPv69OfTpNMjch2V5wvQVPN11Cqp3f65O16U01k/oV54XGagaMv5i6qY89M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616285; c=relaxed/simple;
	bh=RYgbwYHMBdNznzCwtoSVPia/4BNXPzppUMqhmbeoyvY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wm4+n2e4SMe8mGsvy07Yh/a3X3Aog7TXECv1Oz87yV1ijrStaxd7neo+Ogcpfw1mk2Y9bHoqggjz+kBFTl+PqYFltPDFZfagLSfu5TdNeVafYAuMJivPLgUUsIFV9tr87KGthjnMtp/LlvCLYrmtKtspNVqaWj1TVYAngdEhhpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DX7+fWSQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DX7+fWSQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8811F00A3D;
	Sat,  5 Sep 2026 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788616283;
	bh=yIRlkt7Ken6wBc+tesJKxmS+0S0Pf4G0BnIBbrKwmso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DX7+fWSQBdC/kG3MxeV8ySmASIi0NnIekGVZtVx+FBuhC/jwn70Q5YvxNPbNLuQ5y
	 aOazwFmTxzszcxB3I6eLyoqy6P+t4bGK0+ysBOFpiGbR/TpBPa0gFVwVAXzMr2wnpB
	 wEDcR4H2+D3/Vk/HOj1PYKhTl4AfaVkt6UgGa8Gk2XtJL8p+vLAGYBdiT+TF/FMnw/
	 ZQxjrx5vDNMrHKJebTE6k5FyXUiEFzU6Yrt6rp1yrGPLYqCtbzMh3cD0BkCDK1jo6x
	 PFep9dQ8UF9wqJl/G/zcF19sE5h4zMAuHzRer0s96PwSzTFsuF6B1ZZqD8VhfnmjHr
	 QOOtk2bDbWGFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: max77620: publish I2C and OF module aliases
Reply-To: sashiko-reviews@lists.linux.dev
To: hpp.iscas <hppiscas@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260905134051.66545-1-hppiscas@163.com>
References: <20260905134051.66545-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 13:51:22 +0000
Message-Id: <20260905135123.4E8811F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding an `of_match_table` without migrating device matching logic=
 causes a NULL pointer dereference when binding via OF fallback compatibles.
--

commit d8b3d136289436a8115d93de5fbb49572114282f
Author: hpp.iscas <hppiscas@163.com>

mfd: max77620: publish I2C and OF module aliases

This commit publishes the I2C module alias and adds an OF match table to
support device enumeration. The patch intentionally leaves the existing
i2c_client_get_device_id() call as the source of chip data.

> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> index c4f89a9681f34..6a624e691fe83 100644
> --- a/drivers/mfd/max77620.c
> +++ b/drivers/mfd/max77620.c
> @@ -699,6 +699,15 @@ static const struct i2c_device_id max77620_id[] =3D {
>  	{"max77663", MAX77663},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(i2c, max77620_id);
> +
> +static const struct of_device_id max77620_of_match[] =3D {
> +	{ .compatible =3D "maxim,max77620" },
> +	{ .compatible =3D "maxim,max20024" },
> +	{ .compatible =3D "maxim,max77663" },
> +	{ }
> +};

[Severity: High]
Does adding this OF match table without populating the .data fields and
migrating the matching logic to i2c_get_match_data() introduce a NULL point=
er
dereference during probe?

If a device tree uses a fallback compatible string not present in the I2C ID
table (e.g., compatible =3D "maxim,future-chip", "maxim,max77620";), the
device will bind successfully due to this new OF match table. However, the =
I2C
core sets client->name to the first string ("future-chip").

Because max77620_probe() still relies on i2c_client_get_device_id() to obta=
in
chip data:

drivers/mfd/max77620.c:max77620_probe() {
    ...
    const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
    ...
    chip->chip_id =3D (enum max77620_chip_id)id->driver_data;
    ...
}

Will i2c_client_get_device_id() return NULL since the fallback name isn't in
the I2C table, leading to a kernel panic when dereferencing id->driver_data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905134051.6654=
5-1-hppiscas@163.com?part=3D1
