Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C404F3876CD;
	Sat, 26 Sep 2026 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447119; cv=none; b=bEnR3q+Kqzi0sLKEWNS19EJ6kbODgrJqQA/cTVEl5uvKsqCpLYGdLF6JK1d6yt+b/mS4XK9DZa4L+QiZ3uXEjYW1u8yrMLvJhCYXi+imK54lLM99riBOnapnNldQjpMcGfYVQXu1qxzSZyEj+cgtGmqSE4xz9t3WhJjziQFg4+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447119; c=relaxed/simple;
	bh=Mvg9IUyaJIVJWiQ6fdmEqaHeqohfg8IMawm8LXDgIak=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rq4O8Mvnc+tfFvKOhTA+vNfNnTIojuCA9bJMyWjM/+NrkhIZ70/KuU2JdwbHLjgOLyHXGKG6W3kKcvcwhz7ACnY+g6dlDqzl37x4oGveLGbnWK40iihQKZKWWyUA+yJ5+wrGQCdu7N84+o8wWzg63zxvZ44Jnfu1cexvCTbf6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNcOLwOL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNcOLwOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2601F0089A;
	Sat, 26 Sep 2026 18:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790447118;
	bh=TZ0MkNa8Ic1fIj176djFwYRj+DX9VRrxELOTf87lbHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kNcOLwOLVsoG1AdSxDdhiDjpHmOXh5daQ+7JAHUEvI02dmVQh/xCnHQbE4Kv2+wRy
	 Vc/SvATKC3M5y3BOFpU4rJ0b9JNOlmHK1gpRYd4Lk04j5kqOF6LXW77/AC2MPPHTxX
	 RePcsMjYdGZ/DlJH12aZZeV5gQnQpgfdcG0NXifuRUS50SzBs9GMsRWrzjk0njjTWS
	 1p75DnKC5YojIuCPBS8Q/Zz3gsw+o7qsVwFaUoSks6UdmV5lJ1LIuem/DAnYQISAss
	 RUnQnxH4Kyoqhwf5JafU1AvF8I54ydiGriIG65A/8O+tS1q7kRuLuR1JDA6/M7LSrp
	 /QQ3ItxKOgDhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260925182435.21207-5-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 18:25:17 +0000
Message-Id: <20260926182518.3A2601F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] of: memory leak of mdio_np in an8855_mdio_register error path
- [Medium] mfd: sysfs naming collision for virtual MDIO bus with multiple s=
witches
--

commit 802b31a10a6859408359f548c9b38d422fd3e7dc
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: mfd: an8855: Add support for Airoha AN8855 Switch

Add support for Airoha AN8855 Switch that provide support for a DSA
switch and a NVMEM provider. Also make use of the mdio-regmap driver
and register a regmap for each internal PHY of the switch.

> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 0000000000000..a2a36704a9fca
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c
[ ... ]
> +static int an8855_phy_bus_register(struct device *dev, struct an8855_cor=
e_priv *priv,
> +				   struct device_node *phy_np,
> +				   struct an8855_phy_bus *phy_bus_info)
> +{
[ ... ]
> +	mrc.regmap =3D regmap;
> +	mrc.parent =3D dev;
> +	mrc.valid_addr =3D addr;
> +	snprintf(mrc.name, MII_BUS_ID_SIZE, "an8855:%u-phy%u", priv->switch_add=
r,
> +		 phy_offset);

[Severity: Medium]
Will this static naming scheme fail to disambiguate virtual buses across
multiple independent parent devices?

If a system contains multiple AN8855 switches on different MDIO buses but
configured at the same MDIO address (e.g., address 0), priv->switch_addr
will be identical for both.

Since devm_mdio_regmap_register attempts to register both virtual buses with
the exact same name (e.g., an8855:0-phy0), would this lead to a sysfs naming
collision and cause the second switch to fail probe? A parent device
identifier like dev_name(dev) might be needed to ensure uniqueness.

> +
> +	bus =3D devm_mdio_regmap_register(dev, &mrc);
[ ... ]
> +static int an8855_mdio_register(struct device *dev, struct an8855_core_p=
riv *priv,
> +				struct an8855_phy_bus *phy_bus_infos)
> +{
> +	struct device_node *mdio_np;
> +	int ret =3D 0;
> +	int i =3D 0;
> +
> +	mdio_np =3D of_get_child_by_name(dev->of_node, "mdio");

[Severity: Medium]
Does this code leak the mdio_np device node on the error path?

of_get_child_by_name dynamically acquires and increments the reference
count of the returned device node mdio_np.

> +	if (!mdio_np)
> +		return -ENODEV;
> +
> +	for_each_available_child_of_node_scoped(mdio_np, phy_np) {
> +		if (i >=3D AN8855_MAX_PHY_PORT) {
> +			ret =3D -EINVAL;
> +			goto exit;
> +		}
> +
> +		ret =3D an8855_phy_bus_register(dev, priv, phy_np,
> +					      &phy_bus_infos[i]);
> +		if (ret)
> +			goto exit;
> +
> +		i++;
> +	}
> +
> +	of_node_put(mdio_np);
> +exit:

In the normal execution path, of_node_put(mdio_np) is correctly called.
However, if an error occurs during child node iteration, the code executes
goto exit, which jumps directly to the cleanup block and bypasses
of_node_put(mdio_np), leaving the reference count incremented.

> +	if (ret) {
> +		while (i--)
> +			fwnode_handle_put(phy_bus_infos[i].node);
> +
> +		return ret;
> +	}
> +
> +	return i;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925182435.2120=
7-1-ansuelsmth@gmail.com?part=3D4
