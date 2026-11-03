Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739649;
	b=q+II2yCLdyuT+mghe7fOXBjO0OHE6skXleHfkBp4kFD4meMQp17ZN2uVxAfNq9m+GCOn
	 E7HWAKbZAgXkEq2jdHFw2vQN+LqnChhplHV2/NxD5fRIi6hvfyZ7yXdMCIQ+pbjOfIXif
	 uQV6PUID45JZhIhkpatjvu/YN9U2L666Ka87SM552QHEjnyz8ScK//neC1/DpRlw8R0PN
	 0abKiBmf/k+8opzXS0WgYg+WKuQImgYpJJPS6UoevxujiuBweSThEwHF5uKcp6UrwQo/+
	 jN7a3tV9vRQDI7p7x3UezrGBVaeJ3W00WIdmMha+buuigm3cwS8x9IomwteLQToFHuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739649;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/nxwRG5rAZoL/7GtvzUCB0RYpU9Jmn6Vvd+h+u+iHz4=;
	b=dWHJ9nPYGQRamU8TlUCeA1BOJx0VWcK4x0AQ8IRFLvglSDDIrxoubCIikuURD8MVyRNn
	 trPjgG0EppQtj9/LUeKh7vVzwF6+I+xT4DrFssSi6G7In4cFWSUPXqpyvsqvfvBFBJLyD
	 2l9Esl4dv/2VwV78gawvQ8P/i6nVlBzvrjJl+RuPF1zSNOQe0kvHU1lq99e70OEAe9+yD
	 VXP+WR1ovMo/PW6y//sJ8ODfjs+bgqjKM+3vI9B1hKQ5axNpyg95Wsq7Zveo6wItiapYA
	 xUmHJug7WmZ0OatIdjlguEjgQAKFFkMWr+KD3PMd+pFqkaZvxHqsFRIW+phK6maCwZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVGRMX7V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213C606A324;
	Tue,  3 Nov 2026 21:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVGRMX7V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7DD1F00A02;
	Tue,  3 Nov 2026 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793739648;
	bh=/nxwRG5rAZoL/7GtvzUCB0RYpU9Jmn6Vvd+h+u+iHz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WVGRMX7V9YGoWJkAZ8/gfbD7GbXcyYYqTX8sTAlc3DVE7zDRTPeKfrFiQX9BgEz57
	 mAqIAIi+vpm3SpjrJPdcQrPuXJE0erDnov//fMaQxQOWia9+qzkPVWQw1QyBx5N3SQ
	 Zpi3hGTHisfS4eVIVqqYI4yqNV9f/ULxJW8kZKzH8wJpBJ8Rlb5RqfhDEBcVJ8ryUW
	 xqXF9xzxYyYyP9py/KBZCM8aXJzFXeuWpsuH4dOBZv8ls3Paz5NbGiLzpBLgbb+7fb
	 Uca6w9W/LP/+EbCjKU8J2Gjke7z6zf/Bs+NOQFA6zxEeCMVs1c3nlgm/W7Qf/6zp+B
	 MSbaTaYX1096A==
Message-ID: <sashiko-outbox-196023@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mfd: an8855: Add support for Airoha AN8855
 Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261103203034.12869-3-ansuelsmth@gmail.com>
References: <20261103203034.12869-1-ansuelsmth@gmail.com>
 <20261103203034.12869-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 21:00:46 +0000
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
- [High] mfd: an8855: missing PHY_MAX_ADDR check in an8855_phy_bus_register=
()
- [Medium] mfd: an8855: register internal PHYs after an8855-efuse to avoid =
genphy fallback
--

commit b751ed12fefc10d7bebaac0f5731b709d5c0d2bd
Author: Christian Marangi <ansuelsmth@gmail.com>

mfd: an8855: Add support for Airoha AN8855 Switch

This commit adds an MFD core driver for the Airoha AN8855 switch, registeri=
ng
virtual MDIO buses via mdio-regmap for the internal PHYs and MFD cells for =
the
DSA switch and NVMEM provider.

> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 0000000000000..6a270555db5cf
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c
> @@ -0,0 +1,579 @@

[ ... ]

> +#include <linux/bitfield.h>
> +#include <linux/fwnode_mdio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mfd/core.h>

[ ... ]

> +static int an8855_phy_bus_register(struct device *dev, struct an8855 *dd=
ata,
> +				   struct device_node *phy_np,
> +				   struct an8855_phy_bus *phy_bus_info)
> +{
> +	struct mdio_regmap_config mrc =3D { };
> +	struct an8855_phy *phy_ddata;
> +	struct regmap *regmap;
> +	u32 addr, phy_offset;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(phy_np, "reg", &addr);
> +	if (ret)
> +		return ret;
> +
> +	phy_offset =3D addr - ddata->switch_addr;
> +	if (phy_offset >=3D AN8855_MAX_PHY_PORT)
> +		return -EINVAL;

[Severity: High]
Can this cause out-of-bounds accesses on bus->irq[] and bus->mdio_map[] if
ddata->switch_addr is between 28 and 31 and a child PHY node specifies a reg
value >=3D 32 (PHY_MAX_ADDR)?

In drivers/mfd/airoha-an8855.c, an8855_phy_bus_register() reads addr via
of_property_read_u32() and only checks that addr - ddata->switch_addr is le=
ss
than AN8855_MAX_PHY_PORT (5), without checking that addr < PHY_MAX_ADDR (32)
or using of_mdio_parse_addr().

When an8855_probe() subsequently passes phy_bus_infos[i].addr to
fwnode_mdiobus_register_phy() for a node with an ethernet-phy-id compatible
string, the call chain:

  an8855_probe()
    fwnode_mdiobus_register_phy()
      fwnode_mdiobus_phy_device_register()
        phy_device_register()
          mdiobus_register_device()

indexes mdio->irq[addr] and mdiodev->bus->mdio_map[mdiodev->addr] (both siz=
ed
PHY_MAX_ADDR) and evaluates 1 << addr without bounds checking:

  drivers/net/mdio/fwnode_mdio.c:fwnode_mdiobus_phy_device_register() {
      ...
      if (rc > 0) {
          phy->irq =3D rc;
          mdio->irq[addr] =3D rc;
      } else {
          phy->irq =3D mdio->irq[addr];
      }

      if (fwnode_property_read_bool(child, "broken-turn-around"))
          mdio->phy_ignore_ta_mask |=3D 1 << addr;
      ...
  }

  drivers/net/phy/mdio_device.c:mdiobus_register_device() {
      if (mdiodev->bus->mdio_map[mdiodev->addr])
          return -EBUSY;
      ...
  }

Should an8855_phy_bus_register() also verify that addr < PHY_MAX_ADDR (or u=
se
of_mdio_parse_addr()) before accepting the PHY address?

[ ... ]

> +static int an8855_probe(struct mdio_device *mdiodev)
> +{
> +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] =3D { };
> +	struct device *dev =3D &mdiodev->dev;
> +	struct regmap *regmap;
> +	struct an8855 *ddata;
> +	int num_phys;
> +	int i, ret;

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
Does an8855_probe() need to request and deassert reset-gpios before accessi=
ng
the switch registers over MDIO?

Documentation/devicetree/bindings/mfd/airoha,an8855.yaml defines reset-gpios
on the airoha,an8855 node, and drivers/mfd/airoha-an8855.c includes
linux/gpio/consumer.h, but never requests or deasserts the GPIO.

Because airoha,an8855 is a generic MDIO device rather than a PHY device,
__of_mdiobus_parse_phys() registers it via of_mdiobus_register_device()
without MDIO_DEVICE_FLAG_PHY set. In drivers/net/phy/mdio_device.c,
mdiobus_register_device() only registers reset lines for PHY devices:

  if (mdiodev->flags & MDIO_DEVICE_FLAG_PHY) {
      err =3D mdio_device_register_reset(mdiodev);
      if (err)
          return err;

      /* Assert the reset signal */
      mdio_device_reset(mdiodev, 1);
  }

As a result, the MDIO core does not manage reset-gpios for this device. If =
the
reset line is asserted when an8855_probe() runs, the MDIO accesses in
an8855_mii_set_page() and an8855_read_switch_id() will fail; conversely, if=
 a
child MFD driver toggles reset-gpios later during devm_mfd_add_devices(), it
would reset the switch and wipe out the AN8855_RG_GPHY_AFE_PWD write and
internal PHY state initialized here in an8855_probe().

> +
> +	/* Register PHYs */
> +	for (i =3D 0; i < num_phys; i++) {
> +		ret =3D fwnode_mdiobus_register_phy(phy_bus_infos[i].bus,
> +						  phy_bus_infos[i].node,
> +						  phy_bus_infos[i].addr);
> +		fwnode_handle_put(phy_bus_infos[i].node);
> +		phy_bus_infos[i].node =3D NULL;
> +
> +		if (ret)
> +			goto err_put_fwnodes;
> +	}
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, an8855_cells,
> +				    ARRAY_SIZE(an8855_cells), NULL, 0,
> +				    NULL);

[Severity: Medium]
Can registering the internal PHYs before the an8855-efuse MFD cell cause
phy_attach_direct() to bind the fallback genphy_driver instead of the
dedicated PHY driver?

In Documentation/devicetree/bindings/mfd/airoha,an8855.yaml, each internal
ethernet-phy node consumes nvmem-cells from the an8855-efuse child node, wh=
ich
causes fw_devlink to create supplier links from the efuse node to the PHY
nodes.

In an8855_probe(), fwnode_mdiobus_register_phy() is called for all internal
PHYs before devm_mfd_add_devices() creates the an8855-efuse and an8855-swit=
ch
devices. During fwnode_mdiobus_register_phy() -> phy_device_register() ->
device_add(), each PHY defers probe with -EPROBE_DEFER because its nvmem
supplier (an8855-efuse) has not been registered yet, leaving
phydev->mdio.dev.driver as NULL on deferred_probe_pending_list.

Immediately afterwards, devm_mfd_add_devices() registers an8855-efuse (which
queues deferred_probe_work asynchronously) and then synchronously registers
an8855-switch. Because phy-handle is not tracked by fw_devlink, an8855-swit=
ch
can probe and call dsa_register_switch() -> phylink_of_phy_connect() ->
phy_attach_direct() before deferred_probe_work runs. When phy_attach_direct=
()
sees that d->driver is NULL, it forcibly binds genphy_driver and removes the
PHY from the deferred probe list:

  drivers/net/phy/phy_device.c:phy_attach_direct() {
      ...
      if (!d->driver) {
          if (phydev->is_c45)
              d->driver =3D &genphy_c45_driver.mdiodrv.driver;
          else
              d->driver =3D &genphy_driver.mdiodrv.driver;

          phydev->is_genphy_driven =3D 1;
      }
      ...
  }

Should an8855-efuse be registered before fwnode_mdiobus_register_phy() (or =
the
PHYs registered before an8855-switch after an8855-efuse is available) so the
internal PHYs can bind to their dedicated driver without deferring?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103203034.1286=
9-1-ansuelsmth@gmail.com?part=3D2
