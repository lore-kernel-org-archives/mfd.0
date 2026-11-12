Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488049;
	b=Re5nuBbtaWKfML+mBcWC+36HUGyytlTx18DyS4lYMR7cZfXLlh46NYEStrk73GBRvUvY
	 ljPElizrSQPxSCicfMhy1LbFLOv3NL66lH26//5GlznkVFWtOzRUfKWdHr8psggPPwjKl
	 lAX+5iA3GLPms/w6RO1s44mTPvHbtQvQTLMupVZFqcbY/uSGh5hk5Q9R/XRN/xzqbuMVM
	 mpX+HXw9ljfyGzEH6HE/vrC41htNx5SHjzSEkHW8exyNXVx8ihvnWMAIif48ssg7sQ4kM
	 j5AAfuscAtmOdcmYr7GzIeCstyZe1WD8UE4YNLE/0yPKOmnm23QwkRnUByJudaVp3Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488049;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SK39DjHY/7ayNkOaPOD1KDfFy8vOW+PD9SYaUj7HteQ=;
	b=eYBUwGFhicbrIkOAKKXh661qYTk0kOjb/kUierItjwKPXz1wIT5UobgH25HTIp2t2yMM
	 l6rSFGYBm6Q8Rma3y27EmOlBtcD0PXqjp7D64cTGUqGKLMlHaNRvh1MhSxJH5KehBa4gX
	 2Qg1i6MJkIakrjE5Z1TBTHbB3miprqWDWeqtevDibwdG9DJlfosXbFttU8HPHUFN07qMQ
	 X0cfxbffuUQRtzYIYhgBdhbyiTcO0liJfgyaE9vXPPJfSYDQL19e2Xpvj19ygR2LceP9o
	 Qi0P/Ouxsb3vuSuBT3qQBYfVIEaM1wUJwl0Lm2Hx/zPNIXrlL7CxoP1CUC+whkndyJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrVqMMQ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00B606A330
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrVqMMQ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53C51F00A05;
	Thu, 12 Nov 2026 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488049;
	bh=SK39DjHY/7ayNkOaPOD1KDfFy8vOW+PD9SYaUj7HteQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QrVqMMQ9qDiePqFG67stPyPX+M034WiICjbO1/XcOokKnTmpac3hcJofpghkBTyny
	 U/xgVMUct/0Tz2EH7/nu8C0DBnWUZTCgcSxVn45ipGS0vtbkW9Oy8K1N1JXJgnMSc4
	 TJY4WjwjztPzr1d4xR0hinQSVKudbZGhBnb0DmSuU2eoAVn3nQPe0hT9OZj6/15vXD
	 UoRufyxoBm16CRvRt0a0CkQLx/WSRF5pmQ+m56ZPBXbWAwSiUxNltDesFVkOTeHzcq
	 B1iLtvJfzKIGNYTftp3X3vcUilunc/chFkij43MrMozOdNZ/EVcYrmlK5TmW5Sq2Rl
	 IzTlXhdCVTFMw==
Message-ID: <sashiko-outbox-211119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 1/4] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org
In-Reply-To: <20261112124437.3367252-2-lakshay.piplani@nxp.com>
References: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
 <20261112124437.3367252-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:54:08 +0000
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
- [Low] mfd: p3h2x4x: duplicated probe logic and unaddressed naming
  feedback
--

commit dafcc1e1067d996fcab7a86770124695c8bbf434
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub and on-die regulator

This commit adds core MFD support for the NXP P3H2x4x family of multiport
I3C hub devices over I3C and I2C.

> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 0000000000000..c489844821487
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c

[ ... ]

> +static int p3h2x4x_device_probe_i3c(struct i3c_device *i3cdev)
> +{
> +	struct device *dev =3D i3cdev_to_dev(i3cdev);
> +	struct i3c_device_info devinfo;
> +	struct p3h2x4x *ddata;
> +	int ret;
> +
> +	i3c_device_get_info(i3cdev, &devinfo);
> +	if (I3C_PID_MANUF_ID(devinfo.pid) !=3D I3C_MANUF_ID_NXP)
> +		return -ENODEV;
> +
> +	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ret =3D devm_mutex_init(dev, &ddata->protected_reg_lock);
> +	if (ret)
> +		return ret;
> +
> +	i3cdev_set_drvdata(i3cdev, ddata);
> +
> +	ddata->regmap =3D devm_regmap_init_i3c(i3cdev, &p3h2x4x_regmap_config);
> +	if (IS_ERR(ddata->regmap))
> +		return dev_err_probe(dev, PTR_ERR(ddata->regmap),
> +				     "Failed to register HUB regmap\n");
> +
> +	/* The hub child driver retrieves information from i3cdev. */
> +	ddata->i3cdev =3D i3cdev;
> +
> +	ret =3D p3h2x4x_read_num_target_ports(dev, ddata);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add sub devices\n");
> +
> +	return 0;
> +}
> +
> +static int p3h2x4x_device_probe_i2c(struct i2c_client *client)
> +{
> +	struct p3h2x4x *ddata;
> +	int ret;
> +
> +	ddata =3D devm_kzalloc(&client->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ret =3D devm_mutex_init(&client->dev, &ddata->protected_reg_lock);
> +	if (ret)
> +		return ret;
> +
> +	i2c_set_clientdata(client, ddata);
> +
> +	ddata->regmap =3D devm_regmap_init_i2c(client, &p3h2x4x_regmap_config);
> +	if (IS_ERR(ddata->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(ddata->regmap),
> +				     "Failed to register HUB regmap\n");
> +
> +	ddata->i3cdev =3D NULL;
> +
> +	ret =3D p3h2x4x_read_num_target_ports(&client->dev, ddata);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> +				   p3h2x4x_devs, ARRAY_SIZE(p3h2x4x_devs),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to add sub devices\n");
> +
> +	return 0;
> +}
> +
> +static const struct i3c_device_id p3h2x4x_i3c_ids[] =3D {
> +	I3C_CLASS(I3C_DCR_HUB, NULL),
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(i3c, p3h2x4x_i3c_ids);
> +
> +static const struct i2c_device_id p3h2x4x_i2c_id_table[] =3D {
> +	{ .name =3D "nxp-i3c-hub" },
> +	{ /* sentinel */ }
> +};

[ ... ]

> +MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB multi function driver");
> +MODULE_LICENSE("GPL");

[Severity: Low]
As reported by Lee Jones on v7 [1], could the common initialization sequence
in p3h2x4x_device_probe_i3c() and p3h2x4x_device_probe_i2c() be factored in=
to
a shared helper function so the bus-specific probe functions only handle bus
validation and regmap initialization?

In addition, p3h2x4x_i2c_id_table uses the generic name "nxp-i3c-hub" inste=
ad
of a device-specific name, MODULE_DESCRIPTION still refers to a "multi
function driver", and the file names p3h2840.c and p3h2840.h do not match
CONFIG_MFD_P3H2X4X and the p3h2x4x symbol prefix.

[1] https://lore.kernel.org/r/20260326115848.GL1141718@google.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112124437.3367=
252-1-lakshay.piplani@nxp.com?part=3D1
