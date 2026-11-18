Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020131;
	b=bL6vM8uGFm7bpSwR2Afm8389oqvOHccUHcIjFTLlDIcXGmXp4k1uBR26JoKW+mX6Whwg
	 leUttOyzR/lpNBOMkG3+D2dwmh+fHe8bbfcfoNfuGjWBUi9Ph+gEedGbl76HhQw8sC6uT
	 lC0Jk6BCb1u+gkCoC33V1E6feNgl+rsxzvp4R8zY1kOhkiPyrZWYxt+utN9CwmmlaOCKE
	 MrDydb5PDRorKWviynNXJDn04bW33nggylkITw2QQMEX4KD0MN3SoI0ODAN+OlfvTlKlx
	 DyHIL1m1U+VaZVk0eThB9NSsjzssxg0HJj6rRL49Q6bVfYRjCrsTAQ59BA2eaekX2Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020131;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c1CNlt6Whg7o1xncC8HDcboi8I71F7hTNlFT6RnLs3I=;
	b=sPAke2Q+/O5vPsiJ+PkoBQx8kJ2jvBKGb9sA+e4jleYHUMT/sZUeR4iszEGBJU7eUhpa
	 2fIoGDmYQXxaVL0zeHP3vWvmha5JXrSHOnsDundiVBkSlgGYBf651IiHiiUfqh7nLCzef
	 Kmsfz69pFg1cz/KI6LWdxGIPkiyg++/+Pi/rqLmybQp1sccftgFACzyCHfP753kqFcLoW
	 STQeCjRCOjD3ThsZ79+PquKfIJUdXx8JCOK5ywtfhtP2AspKjxx798MwJbs/Z8nSGTBrn
	 hEFBHKoBWiowhQplPFUriTrkuF08q69+NzjNut1vGnbyJtodTBmZWKgW4NB3sFJIa4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lcQDYF+C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B18D606A32C;
	Wed, 18 Nov 2026 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lcQDYF+C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891B01F000C4;
	Wed, 18 Nov 2026 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795020130;
	bh=c1CNlt6Whg7o1xncC8HDcboi8I71F7hTNlFT6RnLs3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lcQDYF+C7NO73ETGRmv9aWnsB4FMtVxgphZSDseeByividYDyYQCC0sZzUGaWgDPI
	 98pz1znmJAcQNJLrGUQLAPJJrQDPyDoZ4mc+p2V1qI5EEvA1ORqWVK3rdpvJz1+1Sq
	 dzlbwqfHZnLBeMBv3QWZZkFpjymKTsDduPcQpIQlVINJ+Cdfcvywq+5WBqeZnZ63ww
	 oXS+9r0YMaifxpagwBE03HvPWueKt9LsSfngL2A+ssKbo8M9WIc6PgdWybtBO/9Lpl
	 DX0TRXpAOaTVZCHgrrxF2lTTCqHnbUkJIlDUledXLeDJpGeEbD4okRYYnXLZjTPA9/
	 NTlmkRHaKm3Yw==
Message-ID: <sashiko-outbox-221533@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] mfd: an8855: Add support for Airoha AN8855
 Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261117164132.47167-5-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
 <20261117164132.47167-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 16:42:10 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] mfd: an8855: missing reset-gpios handling in an8855_probe()
- [Medium] mfd: an8855: missing PHY_MAX_ADDR check in
  an8855_phy_bus_register()
- [Medium] mfd: an8855: PHY registration before efuse MFD cell in
  an8855_probe()
- [Low] mfd: an8855: cleanup helper and goto mixing in
  an8855_mdio_register()
--

commit b4187acae4b9834706a08e5702a986758362581b
Author: Christian Marangi <ansuelsmth@gmail.com>

mfd: an8855: Add support for Airoha AN8855 Switch

This commit adds the core MFD driver for the Airoha AN8855 switch,
providing regmap access over MDIO, virtual MDIO buses for the internal
PHYs, and MFD cells for the efuse NVMEM provider and DSA switch.

> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 0000000000000..908b2676e35a6
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c

[ ... ]

> +static int an8855_phy_bus_register(struct device *dev, struct an8855 *dd=
ata,
> +				   struct fwnode_handle *phy_np,
> +				   struct an8855_phy_bus *phy_bus_info)
> +{
> +	struct mdio_regmap_config mrc =3D { };
> +	struct an8855_phy *phy_ddata;
> +	struct regmap *regmap;
> +	u32 addr, phy_offset;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	ret =3D fwnode_property_read_u32(phy_np, "reg", &addr);
> +	if (ret)
> +		return ret;
> +
> +	phy_offset =3D addr - ddata->switch_addr;
> +	if (phy_offset >=3D AN8855_MAX_PHY_PORT)
> +		return -EINVAL;

[Severity: Medium]
Can addr exceed PHY_MAX_ADDR - 1 here when ddata->switch_addr is 28..31?

If a child PHY node specifies reg >=3D 32 while addr - ddata->switch_addr is
still less than AN8855_MAX_PHY_PORT (5), an8855_probe() passes addr to
fwnode_mdiobus_register_phy() -> fwnode_mdiobus_phy_device_register() ->
phy_device_register() -> mdiobus_register_device(), which indexes
mdio->irq[addr] and mdiodev->bus->mdio_map[addr] (both sized PHY_MAX_ADDR =
=3D
32) out of bounds and shifts 1 << addr.

[ ... ]

> +static int an8855_mdio_register(struct device *dev, struct an8855 *ddata,
> +				struct an8855_phy_bus *phy_bus_infos)
> +{
> +	struct fwnode_handle *mdio_np __free(fwnode_handle) =3D NULL;
> +	int phy =3D 0;
> +	int ret =3D 0;
> +
> +	mdio_np =3D fwnode_get_named_child_node(dev_fwnode(dev), "mdio");
> +	if (!mdio_np)
> +		return -ENODEV;
> +
> +	fwnode_for_each_available_child_node_scoped(mdio_np, phy_np) {
> +		if (phy >=3D AN8855_MAX_PHY_PORT) {
> +			ret =3D -EINVAL;
> +			goto exit;
> +		}
> +
> +		ret =3D an8855_phy_bus_register(dev, ddata, phy_np,
> +					      &phy_bus_infos[phy]);
> +		if (ret)
> +			goto exit;
> +
> +		phy++;
> +	}
> +
> +exit:
> +	if (ret) {
> +		while (phy--)
> +			fwnode_handle_put(phy_bus_infos[phy].node);
> +
> +		return ret;
> +	}
> +
> +	return phy;
> +}

[Severity: Low]
This isn't a bug, but an8855_mdio_register() mixes scope-based cleanup
helpers (__free(fwnode_handle) and
fwnode_for_each_available_child_node_scoped()) with goto error handling,
and declares mdio_np =3D NULL at the top of the function instead of defining
and initializing it in one statement.

> +
> +static int an8855_probe(struct mdio_device *mdiodev)
> +{

[ ... ]

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
Should an8855_probe() acquire and deassert reset-gpios before accessing the
switch over MDIO?

The airoha,an8855 binding places reset-gpios on this MFD node, and the MDIO
core only handles reset-gpios for PHY devices:

drivers/net/phy/mdio_device.c:mdiobus_register_device() {
    ...
	if (mdiodev->flags & MDIO_DEVICE_FLAG_PHY) {
		err =3D mdio_device_register_reset(mdiodev);
		if (err)
			return err;

		/* Assert the reset signal */
		mdio_device_reset(mdiodev, 1);
	}
    ...
}

On boards where reset-gpios is asserted at boot, an8855_mii_set_page() or
an8855_read_switch_id() will read 0xffff while the SoC is held in reset and
fail probe with -ENODEV.  Conversely, if a child driver resets the chip
later during devm_mfd_add_devices(), it will wipe out the
AN8855_RG_GPHY_AFE_PWD write and internal PHY state configured here.
Also, <linux/gpio/consumer.h> and AN8855_HWTRAP at the top of the file are
currently unused.

> +
> +	/* Register PHYs */
> +	for (phy =3D 0; phy < num_phys; phy++) {
> +		ret =3D fwnode_mdiobus_register_phy(phy_bus_infos[phy].bus,
> +						  phy_bus_infos[phy].node,
> +						  phy_bus_infos[phy].addr);
> +		fwnode_handle_put(phy_bus_infos[phy].node);
> +		phy_bus_infos[phy].node =3D NULL;
> +
> +		if (ret)
> +			goto err_put_fwnodes;
> +	}
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, an8855_cells,
> +				    ARRAY_SIZE(an8855_cells), NULL, 0,
> +				    NULL);

[Severity: Medium]
Does registering the internal PHYs before an8855-efuse cause them to defer
probe and risk binding to genphy_driver?

The internal ethernet-phy nodes consume nvmem-cells from an8855-efuse, so
fw_devlink defers each PHY probe during fwnode_mdiobus_register_phy()
because an8855-efuse has not been registered yet.  When
devm_mfd_add_devices() then registers an8855-efuse and immediately probes
an8855-switch in the same loop, an8855-switch can call phy_attach_direct()
before deferred_probe_work runs on the workqueue; phy_attach_direct() sees
!d->driver on the deferred PHY and binds genphy_driver instead of the
AN8855 PHY driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117164132.4716=
7-1-ansuelsmth@gmail.com?part=3D4
