Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DED382295
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 05:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401230; cv=none; b=ZwUEeGwMyQ4PYClZgTJekU7h9juSOwj3uX29BZf7VHixbx8hYIyvBDd+vFH69wY83wLtBSemi1J44nVegZRnkP31zt1PYvvApbDE+xCsJeIj64pXQbN66Hq7X9VbDpnthbJbo0isdHQvIsFq8HOf4R93C5U+i984r7nRd9cfhT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401230; c=relaxed/simple;
	bh=uY8a+UoeRb3HE+00uO9SFYHNW8rCwPphXzdtYPJAM88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FN9mj93FxTW1nSKAZNdDUwHSq3qbMPNi5PfT0+X/dMjZvBCQlAJ9p6UfFRWgABRGPY/UhWOA+TFhMjFNw0C4khsRpUdfU9lVYaZiSwp0A0Gr6e8mHCj/G/aVu0ROYrHET8zSC0Nwuzm1PijRndMt6dLRKf3ioxIzYF0uvl47Ceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAPYWkzL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAPYWkzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1A11F000E9;
	Tue,  7 Jul 2026 05:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783401229;
	bh=89xHOrxTemt4y0wHiRDYGatETok44s65vuyHRm6zg+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TAPYWkzLiktxf2nodIednu1hJ2//S4L/1rDooErJmkQ/Fs++4MIHFayJWYyteGY8e
	 85nwIvplgeOqsBfP5g3DnLv28BRAiEJ03M0mCE898zDJlUdOJGOS5urekO90oEE/q3
	 ip9H2UlFlqUwwgh88vr4/HjHKBW8/DY9avs8jFB/LqIIZ1bq7e+JsK9Vf/gcrCxmqM
	 9z9J31qThytHqcNNJUxKR+l+aVfWthSkSF/pis5flZVT9iWsKeI5Yx6bLVaGaWIQLv
	 WJ0iofgKTeGjp2lRWQIw83XMjTPWb5YDS7x+7lIKlNgBoy9TzFiR6noebrrZ05XejG
	 pBuOEJvUSpYyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] mfd: ucb1x00: Register software node for GPIO
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 05:13:48 +0000
Message-Id: <20260707051348.BF1A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Exporting a static software node from a tristate driver for use by=
 built-in machine code causes a kernel link error.
- [Medium] Using a shared software node with a hardcoded device name causes=
 sysfs symlink creation to fail for multiple instances.
--

--- Patch [1]: [PATCH v2 1/2] mfd: ucb1x00: Register software node for GPIO=
 controller ---
commit 6cf6836b6a52552aa56909a595a799506d47b253
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

mfd: ucb1x00: Register software node for GPIO controller

This commit defines a static software node for the UCB1x00 GPIO controller =
and
attaches it to the core MFD device during probe. This allows machine subdri=
vers
to reference the GPIO controller in property entries.

> diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
> index 16f64e2b2f77c..90edf0352d053 100644
> --- a/drivers/mfd/ucb1x00-core.c
> +++ b/drivers/mfd/ucb1x00-core.c

[ ... ]

> @@ -492,6 +493,11 @@ static struct class ucb1x00_class =3D {
>  	.dev_release	=3D ucb1x00_release,
>  };
> =20
> +const struct software_node ucb1x00_gpiochip_node =3D {
> +	.name =3D "ucb1x00-gpio",
> +};
> +EXPORT_SYMBOL_GPL(ucb1x00_gpiochip_node);

[Severity: High]
If this driver is configured as a loadable module, will built-in machine
code (like the Assabet board support) fail to link due to an undefined
reference to ucb1x00_gpiochip_node?

> +
>  static int ucb1x00_probe(struct mcp *mcp)
>  {
>  	struct ucb1x00_plat_data *pdata =3D mcp->attached_device.platform_data;

[ ... ]

> @@ -530,6 +536,10 @@ static int ucb1x00_probe(struct mcp *mcp)
>  	ucb->id  =3D id;
>  	ucb->mcp =3D mcp;
> =20
> +	ret =3D device_add_software_node(&ucb->dev, &ucb1x00_gpiochip_node);

[Severity: Medium]
If multiple instances of the ucb1x00 device are probed, will they share the
same hardcoded device name and software node?

Earlier in ucb1x00_probe(), the name is hardcoded:

    dev_set_name(&ucb->dev, "ucb1x00");

Since software_node_notify() attempts to create a bidirectional sysfs symli=
nk
using the device name in the shared software node directory, will probing a
second instance fail with -EEXIST?

> +	if (ret)
> +		goto err_swnode_add;
> +
>  	ret =3D device_add(&ucb->dev);
>  	if (ret)
>  		goto err_dev_add;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-ucb1x00-as=
sabet-swnode-v2-0-e6271ea3d3dc@gmail.com?part=3D1
