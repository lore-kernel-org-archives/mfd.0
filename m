Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2E38236F;
	Sat, 12 Sep 2026 22:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253711; cv=none; b=qS/rSxGfjuWOc02WWY1qMsAfTPAzI2GnSX5YIw1fXo68jFZB3v5SVlJvNraab1Dv8eLR4uy+8Vpmy2EbQrTbpAnnCPULDu9pG4k9UrXWWTUz6IiFgsBA2muKfIm7DnT/Nhe/kdqYCo8SBxPXERH9L1+vhQlciJ3GImwnJHhFE+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253711; c=relaxed/simple;
	bh=ZUnMWaPDR71GcLp7QGSvXcORo1ikp/JXq3w4WAuP0Vc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DrXHrXNPpNdPU3LEC2L/j9bxExCXYiLLESx4drUc+QHnNBROJ1xULznKEAjTyrAeu5kBJncTdEtS2S/4ibUUUvvhIt/6hEbrCJupWtjyIO4Hd1x/ksWagVuc5lha2t6BUAdLYfhYdErtgPU4Cv/3lDwK9GvJjpAIK9tTj7+lOTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXmqF28o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXmqF28o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1AB41F000FF;
	Sat, 12 Sep 2026 22:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253710;
	bh=kSoEwmaZYha5WO9IysG+/76X+8+s0ybB8WfnxQFqeSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lXmqF28oPx5E/CCTgIL+7wMruci7ZRnVFnW722Yef0Oxckw02h89nHiHnVSiHqXkh
	 5jx16b1SDkTtKK8dR77rddGWyxbxBVp0PqNcEY+o79prktVH6PD7RcopTUCxElyzhS
	 nyuXXmZm2VY9JKecqNDZqQq151fi+db0O9C2v75Kny1nv/uK8632Zi6UTQNPCuk8cs
	 As9L27tDgP2M4VsNZ6zKhJS23xwY6SUR45BSd9BqcTwZhwT4jg4EVxFVL3RHhkS85i
	 upwCiU0/qypTXcIY7wjwa4X47owZRnEGo6cowG6MgxOPgo1MWznPB8zjSPFmhKUFrv
	 OxAQ62nU0Uzzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911225414.225980-5-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
 <20260911225414.225980-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:55:09 +0000
Message-Id: <20260912225509.B1AB41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Integer truncation of u32 address difference to u8 allows bypassin=
g bounds check, leading to out-of-bounds heap accesses.
- [High] Unprotected concurrent access to `priv->phy_bus` causes unbalanced=
 mutex unlocks, and Devres LIFO cleanup creates a Use-After-Free window.
- [Low] Selecting MDIO_REGMAP without inheriting its dependency on PHYLIB c=
auses Kconfig unmet direct dependencies warning.
- [Low] Incorrect usage of FIELD_GET for PHY page comparison against a prep=
ared constant.
--

commit 93cf16801f16f118e3a22ae17f7d80b0cc1d49bc
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: mfd: an8855: Add support for Airoha AN8855 Switch

This commit introduces core support for the Airoha AN8855 Switch.
It provides a DSA switch and an NVMEM provider, and utilizes the
mdio-regmap driver to handle the PHYs.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e4fd4572472f9..614b39a538fc8 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
[ ... ]
> @@ -54,6 +54,19 @@ config MFD_ALTERA_SYSMGR
>  	  using regmap_mmio accesses for ARM32 parts and SMC calls to
>  	  EL3 for ARM64 parts.
> =20
> +config MFD_AIROHA_AN8855
> +	tristate "Airoha AN8855 Switch Core"
> +	select MFD_CORE
> +	select REGMAP
> +	select MDIO_REGMAP
> +	depends on NETDEVICES && OF

[Severity: Low]
Does this configuration correctly inherit dependencies? Selecting MDIO_REGM=
AP
without also inheriting its dependency on PHYLIB can trigger a Kconfig warn=
ing
for unmet direct dependencies, which might lead to build failures if the
selected infrastructure isn't actually available.

> +	help
> +	  Support for the Airoha AN8855 Switch Core. This is an SoC
> +	  that provides various peripherals, to count, i2c, an Ethrnet
> +	  Switch, a CPU timer, GPIO, eFUSE.
> +
> +	  Currently it provides a DSA switch and a NVMEM provider.
> +
>  config MFD_ACT8945A
>  	tristate "Active-semi ACT8945A"
>  	select MFD_CORE
> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 0000000000000..01f33293a9018
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c
[ ... ]
> +static void an8855_regmap_lock(struct an8855_core_priv *priv)
> +{
> +	if (priv->phy_bus)
> +		mutex_lock(&priv->phy_bus->mdio_lock);
> +	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
> +}
> +
> +static void an8855_regmap_unlock(struct an8855_core_priv *priv)
> +{
> +	mutex_unlock(&priv->bus->mdio_lock);
> +	if (priv->phy_bus)
> +		mutex_unlock(&priv->phy_bus->mdio_lock);
> +}

[Severity: High]
Could these unlocked reads of priv->phy_bus cause unbalanced locking or a
use-after-free?

Since the regmap is created earlier in probe (via devm_regmap_init), it mig=
ht
be accessible concurrently before priv->phy_bus is initialized. If a
concurrent access evaluates if (priv->phy_bus) as false here, it will skip
locking. If the probe thread then assigns priv->phy_bus before
an8855_regmap_unlock() executes, the unlock path could evaluate true and
release a mutex it never acquired.

Additionally, if probe fails later at devm_mfd_add_devices(), devres unwinds
in LIFO order. This would unregister and free phy_bus, but the regmap remai=
ns
accessible until its own cleanup. During this window, an8855_regmap_lock()
could attempt to lock a freed priv->phy_bus->mdio_lock.

[ ... ]
> +static int an8855_regmap_phy_reset_page(struct an8855_core_priv *priv,
> +					int phy) __must_hold(&priv->bus->mdio_lock)
> +{
> +	/* Check PHY page only for addr shared with switch */
> +	if (phy !=3D priv->switch_addr)
> +		return 0;
> +
> +	/* Don't restore page if it's not set to Switch page */
> +	if (priv->current_page !=3D FIELD_GET(AN8855_PHY_PAGE,
> +					    AN8855_PHY_PAGE_EXTENDED_4))
> +		return 0;

[Severity: Low]
Is this the intended usage of FIELD_GET()? The macro extracts an unshifted
value, but it is being compared against AN8855_PHY_PAGE_EXTENDED_4, which is
already shifted via FIELD_PREP_CONST. While this works out safely today
because the mask GENMASK(2, 0) has a shift of zero, a future change to the
mask could silently break this comparison logic.

[ ... ]
> +static int an8855_phy_register(struct device *dev, struct an8855_core_pr=
iv *priv,
> +			       struct device_node *phy_np)
> +{
> +	struct mdio_regmap_config mrc =3D { };
> +	struct an8855_phy_priv *phy_priv;
> +	struct regmap *regmap;
> +	struct mii_bus *bus;
> +	u8 phy_offset;
> +	u32 addr;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(phy_np, "reg", &addr);
> +	if (ret)
> +		return ret;
> +
> +	phy_offset =3D addr - priv->switch_addr;
> +	if (phy_offset >=3D AN8855_MAX_PHY_PORT)
> +		return -EINVAL;

[Severity: High]
Could this lead to an out-of-bounds heap access?

The variable phy_offset is declared as a u8, but it is calculated from a u32
addr which comes from the device tree. If the device tree provides an
arbitrarily large reg value (such as priv->switch_addr + 256), the math
modulo 256 wraps the u8 value to 0.

This would bypass the bounds check against AN8855_MAX_PHY_PORT. The
unchecked addr would then be passed into fwnode_mdiobus_register_phy(),
eventually reaching mdiobus_register_device() which attempts to access
mdiodev->bus->mdio_map[mdiodev->addr] using the unbounded value.

[ ... ]
> +	bus =3D devm_mdio_regmap_register(dev, &mrc);
> +	if (IS_ERR(bus))
> +		return PTR_ERR(bus);
> +
> +	if (addr =3D=3D priv->switch_addr)
> +		priv->phy_bus =3D bus;

[Severity: High]
This is where priv->phy_bus is initialized. Because the switch regmap is
already fully registered and accessible prior to this, any concurrent access
can race with this assignment, triggering the unbalanced lock or
use-after-free issues mentioned earlier.

> +
> +	return fwnode_mdiobus_register_phy(bus, of_fwnode_handle(phy_np), addr);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911225414.2259=
80-1-ansuelsmth@gmail.com?part=3D4
