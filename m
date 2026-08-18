Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67463BCD2E;
	Tue, 18 Aug 2026 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043803; cv=none; b=cQPLNc3Gnozgvo+zzz8IGqV/rqR1cNipwf96A2ZP8F3jqcFaEVR5oFQWq6+NYdyJEBvb4XVEf3YdcHI1tNbnyf/rojL6VFtbJe+W0z7moF63tLtSruSlTRtF+vsno6i78sO8OnOXPTWsnEyYkwVFELhL53cAZrspz6EpC1T7mWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043803; c=relaxed/simple;
	bh=QVeCS9jfhBCDxcjxOFADirqFc3t6y3hjbUQKRGSBpQ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H8ExpvbBHRx162NC8GIW8QQS5KEDWlM5T1SvX9aLL8K3E58QOng4Ixzn9L4NDOX6l9TsSRlsrgpUAACEY0ctmVMRg6u8EpSN6CAmmsvd2nXy2ts13Dpz42fKRtwq2BSo40C6FLiAkF2pf6TMQP2L5m41azx6U+pgqBQ7y6tVe7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTxJWlyD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTxJWlyD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C90F1F00A3A;
	Tue, 18 Aug 2026 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043801;
	bh=XRswMIQRvPTYo14c4jdIGVEiDnpAkqYAobij6Wu5H5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GTxJWlyDnfljPuueoyT+lM51b25zqsOQ5ObvRE9lGDyGGQD9wsKDztG4QuHleQaV/
	 YePITPpFYhmiJCa1dLVBNDnnncgOoTXHPPJ5NSM0iM7U8eaSInOXmDeU54O1fVOehF
	 3PUFj+4jeqh0tpMD3Besky6Q24bc837WLKg6UQj6wJXJgD1Mfra0FnfnDLYlmF+ySm
	 ylA85sXUXOctg8D+B5+fSjR67u6XvidCD56lG7kJFL/I6fEM84KzyxbJwrZM9M76om
	 Qd/8ttjhtTsc6SSBLCAlk2hXv0KTTqpx7LOlRmV4kdrp8+K+CZavgZk5DO9y5nGWvw
	 2uohC28DhFFaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260817082034.20326-5-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
 <20260817082034.20326-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:03:21 +0000
Message-Id: <20260818090321.6C90F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Missing 'select REGMAP' dependency for MDIO_REGMAP and devm_regmap=
_init().
- [High] Incorrect reset GPIO polarity logic actively leaves the switch in =
a reset state.
- [High] PHY page state is corrupted when switch regmap accesses interleave=
 with PHY paged accesses.
- [High] Unprotected call to 'an8855_mii_set_page' in probe triggers a lock=
dep splat and data race.
- [Medium] Signed integer overflow when bit-shifting a 16-bit variable.
- [Medium] Duplicate virtual MII bus IDs if multiple switches exist.
- [Low] Selection of non-existent Kconfig symbol 'MDIO_DEVICE'.
--

--- Patch [4]: [PATCH net-next v20 04/10] mfd: an8855: Add support for Airo=
ha AN8855 Switch MFD ---
commit 302d7f55459ecc6ab21029f136b77629fdc1e7cb
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: mfd: an8855: Add support for Airoha AN8855 Switch MFD

This commit adds core MFD support for the Airoha AN8855 switch, registering=
 a=20
DSA switch and an NVMEM provider. It implements an MDIO regmap driver for
the internal PHYs to handle the dual usage of PHYs as both PHY and switch
accessors.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 763ce6a34782b..4d763ed6e53d5 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -54,6 +54,19 @@ config MFD_ALTERA_SYSMGR
>  	  using regmap_mmio accesses for ARM32 parts and SMC calls to
>  	  EL3 for ARM64 parts.
> =20
> +config MFD_AIROHA_AN8855
> +	tristate "Airoha AN8855 Switch Core"
> +	select MFD_CORE
> +	select MDIO_DEVICE

[Severity: Low]
Is MDIO_DEVICE a valid Kconfig symbol in the tree, or was it intended to be
used as a C macro? Selecting a non-existent symbol has no effect and is
silently ignored by Kconfig.

[Severity: High]
Does this driver also need to select REGMAP?=20

Since the driver relies heavily on the regmap subsystem and explicitly calls
devm_regmap_init(), failing to select it will cause the regmap APIs to
fallback to -EINVAL stubs if CONFIG_REGMAP isn't enabled by another subsyst=
em.

> +	select MDIO_REGMAP
> +	depends on NETDEVICES && OF

[ ... ]

> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 0000000000000..0e8b3550d9e5e
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c

[ ... ]

> +static int an8855_mii_set_page(struct an8855_core_priv *priv, u8 addr,
> +			       u8 page) __must_hold(&priv->bus->mdio_lock)
> +{
> +	struct mii_bus *bus =3D priv->bus;
> +	int ret;
> +
> +	ret =3D __mdiobus_write(bus, addr, AN8855_PHY_SELECT_PAGE, page);

[ ... ]

> +static int an8855_mii_read32(struct mii_bus *bus, u8 phy_id, u32 reg,
> +			     u32 *val) __must_hold(&bus->mdio_lock)
> +{

[ ... ]

> +	lo =3D __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_LOW);
> +	if (lo < 0) {
> +		ret =3D lo;
> +		goto err;
> +	}
> +
> +	*val =3D ((u16)hi << 16) | ((u16)lo & 0xffff);

[Severity: Medium]
Could this bit-shift cause a signed integer overflow? The cast to (u16)
causes integer promotion to a signed int. If the highest bit of 'hi' is
set, shifting it by 16 bits overflows. Casting to u32 before the shift
would avoid this.

> +
> +	return 0;
> +err:

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
> +
> +	/*
> +	 * Restore page to 0, PHY might change page right after but that
> +	 * will be ignored as it won't be a switch page.
> +	 */
> +	return an8855_mii_set_page(priv, phy, AN8855_PHY_PAGE_STANDARD);

[Severity: High]
Could unconditionally restoring the page to STANDARD corrupt the PHY page
state if a switch regmap access interleaves with a PHY paged access?

If the PHY framework locks its virtual MDIO bus to perform a paged
access sequence, a concurrent switch access can interleave since it locks
the parent MDIO bus independently. When the PHY access resumes, forcing
the page to STANDARD here would overwrite the PHY's requested page,
leading to data corruption.

> +}

[ ... ]

> +static int an8855_phy_register(struct device *dev, struct an8855_core_pr=
iv *priv,
> +			       struct device_node *phy_np)
> +{
> +	struct mdio_regmap_config mrc =3D { };

[ ... ]

> +	mrc.regmap =3D regmap;
> +	mrc.parent =3D dev;
> +	mrc.valid_addr =3D addr;
> +	snprintf(mrc.name, MII_BUS_ID_SIZE, "an8855-phy%d-mii", addr);

[Severity: Medium]
Will this naming scheme cause duplicate sysfs MII bus IDs if multiple
switches exist on the system?=20

Generating the ID using only the local MDIO address might lead to collision=
s=20
if there is another switch on a different parent MDIO bus sharing the same=
=20
local address. Incorporating the parent device name would ensure it is glob=
ally
unique.

> +
> +	bus =3D devm_mdio_regmap_register(dev, &mrc);
> +	if (IS_ERR(bus))

[ ... ]

> +static int an8855_core_probe(struct mdio_device *mdiodev)
> +{

[ ... ]

> +	reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(reset_gpio))
> +		return PTR_ERR(reset_gpio);
> +
> +	if (reset_gpio) {
> +		usleep_range(100000, 150000);
> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +		usleep_range(100000, 150000);
> +		gpiod_set_value_cansleep(reset_gpio, 1);

[Severity: High]
Does this sequence actively leave the switch hardware in a reset state?

Since gpiod_set_value_cansleep abstracts polarity (where 1 means asserted
and 0 means deasserted), calling it with 1 right before attempting to
poll the HWTRAP register will likely cause the initialization and subsequent
MDIO poll to fail.

> +
> +		/* Poll HWTRAP reg to wait for Switch to fully Init */
> +		ret =3D regmap_read_poll_timeout(regmap, AN8855_HWTRAP, val,
> +					       val, 20, 200000);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Reset PHY page for switch address */
> +	ret =3D an8855_mii_set_page(priv, priv->switch_addr,
> +				  AN8855_PHY_PAGE_STANDARD);

[Severity: High]
Should we hold the mdio_lock before calling an8855_mii_set_page() here?

an8855_mii_set_page() expects the lock to be held and uses the lockless=20
__mdiobus_write() internal helper. Calling it unprotected in the probe=20
sequence will trigger a lockdep splat and can race with concurrent
accesses on the same parent MDIO bus.

> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082034.2032=
6-1-ansuelsmth@gmail.com?part=3D4
