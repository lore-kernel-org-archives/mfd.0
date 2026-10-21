Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584057;
	b=4Ip4eSXsO9sv2t2wNzJNZC7B3DnzcSCvmw2J8u05i+MEbcdyCCsVqiu/azecInDMTZQ0
	 0XVzdKJuOABjC/zcehmgnl8/gAjFf/6psAv1ZsoTg8B/X5nBTqsL8Y7TLZ20DbhmMOzHO
	 EoZZTLyemwYQZEZbOmS/nP7NSgLN0pAs2NBo59RZykWNKlT5AspbzQ3qF+CmNCxOHCJFn
	 jJtCa77EjXyd+4xRtJeaU9KUrcEtS4TsY/JrQ9/7TwrTE3bw1eyO+EcEgbF2FC9KcoTpG
	 Vwv1xRv4fg3BA4wopD1zdZh+TiPWtSgaPVec0B0WwvqERzcRKQOIpwl7OIzLdA055Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584057;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WG1izNJxdPYBR/AIRdSpRjLUMRkZFgk5V07n7hEry7U=;
	b=QxMLV0p0jeWkOJldkqv7rqEZunQN6WvKDy2w0vYL5Irul2HJg26N7PBLgZK2a8/1+FCH
	 4s93zulOFv7fQ1msIAljQDHwAdV7JPCCFLVgMdvKQhQZQ2pxBTb3iJqnhRuKwx4vm1+y2
	 MCKo1V85e0Tx5nHvLQ/on/OIls0wd8ObaOeoU7FLPuUlZ/Eu610CBUpPmY3ISV4FyuCLH
	 57oZ2dXBIi7xEa8SvF+ypdDdhjQUnbfPBRimbTBCDhGgRwv+piXoWxoJORCh7kL3aE3dp
	 zcvC23quLFyTJC57RHHkVU1nEtCumisCr+/cAN/tDnMLrcJRIBDkPLfRyWKc5SXiang==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B8/RpBz4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C2606A31E;
	Wed, 21 Oct 2026 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B8/RpBz4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F521F000C4;
	Wed, 21 Oct 2026 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584056;
	bh=WG1izNJxdPYBR/AIRdSpRjLUMRkZFgk5V07n7hEry7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B8/RpBz4SxfcOAmmCDSBzR2bd5qJeQTI2sPqykqMPCUKFsA6uH1Zar0OgvuRzSDYz
	 pqH9RizNrAW1Wveh7YCEOqUi3oA9s3iKF3GXglQim2Hla6x3qRcN3k31t1TYTkMmMT
	 llJ1VT4RSaKjAtJSlALqpQuU3/RrgtPpb/gjkdPApzwhsZDC1Vr2u67K6C1ZbstOFp
	 6xl6Qv7xF2pLIa6m+6nUpHsZtiiqICPlr5lJRq2wlWxbG0wWu7l5UgWRpn8jWw7ha0
	 ArsgIscuE5OSKiyhIU/9TTH/snofbMsmgbvsrZJRZKUjxBBbVWZMkvAdauY7I47tnz
	 TZ8azFJ+Eh8MQ==
Message-ID: <sashiko-outbox-180199@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RESEND PATCH 2/2] mfd: an8855: Add support for Airoha AN8855
 Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261021113419.283015-3-ansuelsmth@gmail.com>
References: <20261021113419.283015-1-ansuelsmth@gmail.com>
 <20261021113419.283015-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:00:55 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] mfd: an8855: missing reset-gpios handling in an8855_probe()
- [Medium] mfd: an8855: missing MFD_AIROHA_AN8855 dependency on NVMEM_AN885=
5_EFUSE
- [Low] mfd: an8855: mixing __free() and goto cleanup in an8855_mdio_regist=
er()
--

commit f927c03e4e8ef367f1a168337fd8954240810d42
Author: Christian Marangi <ansuelsmth@gmail.com>

mfd: an8855: Add support for Airoha AN8855 Switch

This commit adds the core driver for the Airoha an8855 switch, registering
virtual mdio buses via mdio-regmap for the internal phys along with child
devices for the nvmem efuse provider and dsa switch.

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e4fd4572472f9..afbdcec0fce8f 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -54,6 +54,20 @@ config MFD_ALTERA_SYSMGR
>  	  using regmap_mmio accesses for ARM32 parts and SMC calls to
>  	  EL3 for ARM64 parts.
> =20
> +config MFD_AIROHA_AN8855
> +	tristate "Airoha AN8855 Switch Core"
> +	select MFD_CORE
> +	select REGMAP
> +	select PHYLIB
> +	select MDIO_REGMAP
> +	depends on NETDEVICES && OF
> +	help
> +	  Support for the Airoha AN8855 Switch Core. This is an SoC
> +	  that provides various peripherals, to count, i2c, an Ethrnet
> +	  Switch, a CPU timer, GPIO, eFUSE.
> +
> +	  Currently it provides a DSA switch and a NVMEM provider.
> +

[Severity: Medium]
Should drivers/nvmem/Kconfig also be updated so NVMEM_AN8855_EFUSE depends =
on
MFD_AIROHA_AN8855 || COMPILE_TEST?

When drivers/nvmem/an8855-efuse.c was added in commit e2258cfd9b98 ("nvmem:
an8855: Add support for Airoha AN8855 Switch EFUSE"), NVMEM_AN8855_EFUSE had
depends on MFD_AIROHA_AN8855 || COMPILE_TEST, which was later narrowed by
commit 4796eaafd6a1 ("nvmem: an8855: drop an unused Kconfig symbol") to:

drivers/nvmem/Kconfig:
config NVMEM_AN8855_EFUSE
	tristate "Airoha AN8855 eFuse support"
	depends on COMPILE_TEST

Without restoring MFD_AIROHA_AN8855 in that dependency, NVMEM_AN8855_EFUSE
cannot be enabled in non-COMPILE_TEST builds for the an8855-efuse cell
registered in an8855_cells.

[ ... ]

> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 0000000000000..6a270555db5cf
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c
> @@ -0,0 +1,579 @@

[ ... ]

> +static int an8855_mdio_register(struct device *dev, struct an8855 *ddata,
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
> +		if (i >=3D AN8855_MAX_PHY_PORT) {
> +			ret =3D -EINVAL;
> +			goto exit;
> +		}
> +
> +		ret =3D an8855_phy_bus_register(dev, ddata, phy_np,
> +					      &phy_bus_infos[i]);
> +		if (ret)
> +			goto exit;
> +
> +		i++;
> +	}
> +
> +exit:
> +	of_node_put(mdio_np);

[Severity: Low]
Could mdio_np be declared with __free(device_node) or should the loop avoid
mixing for_each_available_child_of_node_scoped() with goto cleanup labels?

an8855_mdio_register() uses for_each_available_child_of_node_scoped(), which
declares phy_np with __free(device_node), while also jumping to the exit la=
bel
with goto to clean up mdio_np and phy_bus_infos[i].node, which goes against=
 the
cleanup helper guidelines in include/linux/cleanup.h against mixing __free()
and goto in the same function.

> +	if (ret) {
> +		while (i--)
> +			fwnode_handle_put(phy_bus_infos[i].node);
> +
> +		return ret;
> +	}
> +
> +	return i;
> +}
> +
> +static int an8855_probe(struct mdio_device *mdiodev)
> +{
> +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] =3D { };
> +	struct device *dev =3D &mdiodev->dev;
> +	struct regmap *regmap;
> +	struct an8855 *ddata;
> +	int num_phys;
> +	int i, ret;
> +
> +	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->bus =3D mdiodev->bus;
> +	ddata->switch_addr =3D mdiodev->addr;
> +	/* No DMA for mdiobus, mute warning for DMA mask not set */
> +	dev->dma_mask =3D &dev->coherent_dma_mask;
> +
> +	/* Register virtual MDIO for each PHY */
> +	num_phys =3D an8855_mdio_register(dev, ddata, phy_bus_infos);
> +	if (num_phys < 0)
> +		return num_phys;
> +
> +	regmap =3D devm_regmap_init(dev, NULL, ddata, &an8855_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		ret =3D PTR_ERR(regmap);
> +		dev_err_probe(dev, ret, "regmap initialization failed\n");
> +		goto err_put_fwnodes;
> +	}
> +
> +	/* Reset PHY page for switch address */
> +	mutex_lock_nested(&ddata->bus->mdio_lock, MDIO_MUTEX_NESTED);
> +	ret =3D an8855_mii_set_page(ddata, ddata->switch_addr,
> +				  AN8855_PHY_PAGE_STANDARD);
> +	mutex_unlock(&ddata->bus->mdio_lock);
> +	if (ret)
> +		goto err_put_fwnodes;
> +
> +	ret =3D an8855_read_switch_id(dev, regmap);
> +	if (ret)
> +		goto err_put_fwnodes;
> +
> +	/* Release global PHY power down */
> +	ret =3D regmap_write(regmap, AN8855_RG_GPHY_AFE_PWD, 0x0);
> +	if (ret)
> +		goto err_put_fwnodes;

[Severity: High]
How is reset-gpios deasserted before accessing the switch registers in
an8855_probe()?

Documentation/devicetree/bindings/mfd/airoha,an8855.yaml defines reset-gpio=
s on
the top-level airoha,an8855 node, and drivers/mfd/airoha-an8855.c includes
linux/gpio/consumer.h, but an8855_probe() never requests or deasserts the
reset gpio.

Because airoha,an8855 is registered as a non-phy mdio_device without
MDIO_DEVICE_FLAG_PHY, mdiobus_register_device() in
drivers/net/phy/mdio_device.c skips mdio_device_register_reset():

	if (mdiodev->flags & MDIO_DEVICE_FLAG_PHY) {
		err =3D mdio_device_register_reset(mdiodev);
		if (err)
			return err;

		/* Assert the reset signal */
		mdio_device_reset(mdiodev, 1);
	}

If reset-gpios is asserted at boot, won't an8855_mii_set_page() and
an8855_read_switch_id() fail to read AN8855_ID over mdio and cause
an8855_probe() to fail with -ENODEV?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021113419.2830=
15-1-ansuelsmth@gmail.com?part=3D2
