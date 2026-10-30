Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336075;
	b=2Ozrl5o+m9lGmHlKFRs/DHqzTOI/THC2BCwKh8yDnNo6SCm/xzbHUAJtthk335IMYcPC
	 xI0Il5GSdajjt1SAZV4lxwYlPP9j9l/mvBSXSSWByZJSaonFrp4qpdmAqrsAAWezXBrMb
	 lJHZduMmygy2cPslhOOpGNtYw/aaHkM8pJJQvMDgR0JhGMCPeqyTj7gCt4zIjAc56O+VU
	 Wjdokz9Fsnbj8l9p96GSDowVYzp4faIag2rJxX+OXgojBLmbQOvYJ8ErwjvxxwvZpbjry
	 6vuQ18JEgvws9pAItKUKY+cXpQD5RfMGpXOVndXgY3vIBCsTTyC8vsy3OiqvPJJNogw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336075;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7+Jz593Q6OH3Hhe+kVDMJztSDofMLamphTdc8et2aXI=;
	b=m3DiU0PVipESwaJ02W1jaVzA3hwpmU5Nf7RmZSm6wRwSptqXmBOt/LEPJblocQA+2D+E
	 rNAStlONO87G9lx9SHb1t9a1myEf5NtwSz3/3rpkWg5zU/YgWLpVbVg62DJ4af+KNuD5z
	 OIBxYB7RbE9TmjcRtIOeyOh+ZulDIKDmHJ6fXB3/dpVg607joeN5QVzSi8joa5Amh5+HP
	 27rQZmJi0DknkxhtiAOA2hpXjkJN4r5RmqqP6Xbbp/mZv7JlHmEL9Xec4cgkRucIvapHD
	 Mtg2h9PcX+M30qL+3XDkCbbxCkfXIEqDhRZk180GY0AJgbp38YUmQz1Ofgsq0hCpUcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mh3qUWxi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A810606A320;
	Fri, 30 Oct 2026 04:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mh3qUWxi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAE51F000C1;
	Fri, 30 Oct 2026 04:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336075;
	bh=7+Jz593Q6OH3Hhe+kVDMJztSDofMLamphTdc8et2aXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mh3qUWxiNZYqRmWVbbzls/G/MK9HU3uV/QaMpDrqOjNjqeLIk7NEHVtDegfVe4goM
	 bzCcIAf3RS54KAVLQAqB+E8Nq7n+cihHjdvOqD/dbz4QPeMeUbolJWNr4AYDefC7NK
	 CKAW9/iZyX3yes47Na8DA1Xbh1bJK46ttkjFtCOSzUATlQIXKbu1n2YCGjGj+nOMmr
	 4uvybiJlhAPUYJto73K7mLOYUtM1tdj7ozLrqpJRGyNCM2YgdaLlP6IfdXiR+K5eDH
	 YOczH6w2W1DBAiAurRuWKeG4lbWOlzwlC7s2JfBLxhXJF1umKVnmjgqcKi5V6DaaXI
	 0DS2meLolcc0Q==
Message-ID: <sashiko-outbox-190512@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260915123812.14747-5-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
 <20260915123812.14747-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:34 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mfd: airoha-an8855: use-after-free of phy_np fwnode handle
- [Medium] mfd: airoha-an8855: memory leak of mdio_np on error path
--

commit 1917f4cbbcfe1c5b1f8816f88eed9bb439f23478
Author: Christian Marangi <ansuelsmth@gmail.com>

mfd: an8855: Add support for Airoha AN8855 Switch

This commit adds support for the Airoha AN8855 switch, which provides a DSA=
=20
switch and an NVMEM provider. It introduces MDIO-based regmaps for each=20
internal PHY, allowing them to act as both standard PHYs and access points=
=20
for the switch fabric.

> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 0000000000000..2b3b5f4a5a21e
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c
[ ... ]
> +static int an8855_phy_bus_register(struct device *dev, struct an8855_cor=
e_priv *priv,
> +				   struct device_node *phy_np,
> +				   struct an8855_phy_bus *phy_bus_info)
> +{
[ ... ]
> +	phy_bus_info->bus =3D bus;
> +	phy_bus_info->addr =3D addr;
> +	phy_bus_info->node =3D of_fwnode_handle(phy_np);

[Severity: High]
Does this leave the fwnode handle without an active reference?

The device node phy_np is supplied by a scoped iterator in
an8855_mdio_register(), which automatically drops the reference on each
iteration or loop exit.

Because of_node_get() is not used here to acquire an additional reference, =
the
node is saved without incrementing the reference count. This can lead to a
use-after-free later in an8855_core_probe() when the stale fwnode pointer is
passed to fwnode_mdiobus_register_phy().

> +
> +	return 0;
> +}
> +
> +static int an8855_mdio_register(struct device *dev, struct an8855_core_p=
riv *priv,
> +				struct an8855_phy_bus *phy_bus_infos)
> +{
> +	struct device_node *mdio_np;
> +	int ret =3D 0;
> +	int i =3D 0;
> +
> +	mdio_np =3D of_get_child_by_name(dev->of_node, "mdio");
> +	if (!mdio_np)
> +		return -ENODEV;
> +
> +	for_each_available_child_of_node_scoped(mdio_np, phy_np) {
> +		if (i >=3D AN8855_MAX_PHY_PORT)
> +			return -EINVAL;

[Severity: Medium]
Does this early return leak the mdio_np reference?

When returning -EINVAL directly, the function bypasses the of_node_put(mdio=
_np)
cleanup at the end of the function. This permanently leaks the device node
reference that was acquired by of_get_child_by_name() before the loop.

> +
> +		ret =3D an8855_phy_bus_register(dev, priv, phy_np,
> +					      &phy_bus_infos[i]);
> +		if (ret)
> +			break;
> +
> +		i++;
> +	}
> +
> +	of_node_put(mdio_np);
> +	return ret ? ret : i;
> +}
[ ... ]
> +static int an8855_core_probe(struct mdio_device *mdiodev)
> +{
[ ... ]
> +	/* Register virtual MDIO for each PHY */
> +	num_phys =3D an8855_mdio_register(dev, priv, phy_bus_infos);
> +	if (num_phys < 0)
> +		return num_phys;
[ ... ]
> +	/* Register PHYs */
> +	for (i =3D 0; i < num_phys; i++) {
> +		ret =3D fwnode_mdiobus_register_phy(phy_bus_infos[i].bus,
> +						  phy_bus_infos[i].node,
> +						  phy_bus_infos[i].addr);
> +		if (ret)
> +			return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123812.1474=
7-1-ansuelsmth@gmail.com?part=3D4
