Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489322;
	b=janmSagvbWemjyDbCQ/qNclaj0PeZ9E2ZU+earJBPawce3WnJbE8A3Nxf7haedIngVfC
	 K2ioWuddk8KeGSketKr+m0lj4SMGr/Sj+HE0wyMr/HXJbJ9ZrmlCJPXE3/sMlywRNXjVh
	 dm1/8kyWiprmr12oUDTP3jC/QJhs27VegmcBLt/axblW3YmgP1cAnJaAaamDjMAYn35Ht
	 v5CZdcvbd1w02rsgQk/KFPGm4BSHPt9j7PnZ7L+pUO8p7VWbDvz72ab/qmPcmr2Oi1EHz
	 OYUTFWxaX4jaFLov6/f5I0EmmTZ876CGYn6lby9r2uSxn+3y55tGT4i4gElRviPzC0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489322;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OpodrxUl4i8c/etqQN9xTTjufn5lj/rJiTJmj17zYNU=;
	b=mzIARTFJoBuZt03sBIp/AHwgHrEtqlrZF1ELarzsfBvnUq+qRF88gE9kPrpePwbOZYPW
	 1xvPCnKlFdtpJeDkJIq3f/aDZGylJ/A2NIOfTP9hbj7zfwkcx1vfh6ev5+jIltI8e+h0l
	 CeYpvmxk8eHG1q5CDRlMeVJhLAL/UqX+5u0uj5nQRN7GCItiWMqALNhjDn/zw8d/5+2FD
	 eywOLkKxy3vTgylig1Fe2jXd2LN0IbzMGMrFMe2n4GIl4aVD7Zfhk5Qe/GrKezJGw8H1A
	 A+qo6/aAlgRW7mgf7+xnzGLKLDQd9JlicOUvTDi9tMELz2hzipvag4u+GHm+4nolipA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JxDc2gE0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4E606A33D
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JxDc2gE0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1064A1F00A05;
	Thu, 12 Nov 2026 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794489322;
	bh=OpodrxUl4i8c/etqQN9xTTjufn5lj/rJiTJmj17zYNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JxDc2gE0Vns9yL1GqjoIttoG8d3wL6Xl2JNN/Ex4Y3gBcXIrIShNOo3aejuEiUThh
	 2o2rzSBE2HTD9I5kCAztWyYSWtwnoVSRFgdKvMx90/+wEnXX2cH8jFR7SbVaSi6mIL
	 Me+e5jeYm5OPu23pOOY1PSxcg6Q5Lg6PWJylKylhBBs2gsNxa8llLNcmWDq3asCCTb
	 clft7JLDfrcJC+67KrdPfkfb0M5rNJO5Pi/fQf3B5AehHLG/2prptQg25uNS0nBh3G
	 z6dRpiTGkNfXQMwDsTkdZP63PqB3Po8jw9vnJ7DksBvvWcg2YIFFuJ+L8Q5QSI/orD
	 MV0uD5DwNtPeQ==
Message-ID: <sashiko-outbox-211154@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 3/4] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org
In-Reply-To: <20261112124437.3367252-4-lakshay.piplani@nxp.com>
References: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
 <20261112124437.3367252-4-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 13:15:21 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] i3c: hub: p3h2x4x: uninitialized P3H2X4X_TP_NET_CON_CONF breaks
  port isolation
- [High] i3c: hub: p3h2x4x: parent DAA reconciler clobbers DT address
  reservations
- [High] i3c: hub: p3h2x4x: broken SMBus functionality in
  p3h2x4x_tp_smbus_funcs()
- [High] i3c: hub: p3h2x4x: ports disconnected during probe in
  p3h2x4x_tp_i3c_algo()
- [Medium] i3c: hub: p3h2x4x: combined transfer check in
  p3h2x4x_tp_i2c_xfer()
--

commit 9562a1f0e3515b7b354e8a193339c5c2e1630c85
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

This commit adds the I3C hub driver for the NXP P3H2x4x family, supporting
downstream target ports configured as virtual I3C buses or SMBus adapters.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> new file mode 100644
> index 0000000000000..a070be32ffed3
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> @@ -0,0 +1,162 @@

[ ... ]

> +static void p3h2x4x_hub_enable_port(struct i3c_master_controller *contro=
ller)
> +{
> +	struct tp_bus *bus =3D p3h2x4x_bus_from_controller(controller);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D bus->p3h2x4x_i3c_hub;
> +
> +	if (p3h2x4x_i3c_hub->hub_config.tp_config[bus->tp_port].always_enable)
> +		return;
> +
> +	regmap_set_bits(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP_NET_CON_CONF, bus->=
tp_mask);
> +}
> +
> +static void p3h2x4x_hub_disable_port(struct i3c_master_controller *contr=
oller)
> +{
> +	struct tp_bus *bus =3D p3h2x4x_bus_from_controller(controller);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D bus->p3h2x4x_i3c_hub;
> +
> +	if (p3h2x4x_i3c_hub->hub_config.tp_config[bus->tp_port].always_enable)
> +		return;
> +
> +	regmap_clear_bits(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP_NET_CON_CONF, bus=
->tp_mask);
> +}

[Severity: High]
Does leaving P3H2X4X_TP_NET_CON_CONF uninitialized before the registration
loop break per-port isolation?

p3h2x4x_hub_enable_port() and p3h2x4x_hub_disable_port() only set and clear
bus->tp_mask, and neither p3h2x4x_configure_tp() nor p3h2x4x_tp_i3c_algo()
clears P3H2X4X_TP_NET_CON_CONF beforehand or on teardown.  If any bits are
already set in P3H2X4X_TP_NET_CON_CONF (for example on driver rebind, or on
P3H2441/P3H2841 where target ports default to connected at power-on),
multiple ports stay bridged onto the internal network during
i3c_master_register_fwnode(), exposing other ports' devices to SETDASA and
ENTDAA meant for a single port.

[ ... ]

> +	for (tp =3D 0; tp < p3h2x4x->num_target_ports; tp++) {
> +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> +		    p3h2x4x_hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_I3=
C)
> +			continue;
> +
> +		struct i3c_hub_controller *hub_controller =3D
> +				&p3h2x4x_hub->tp_bus[tp].hub_controller;
> +		struct i3c_master_controller *controller =3D &hub_controller->controll=
er;
> +
> +		hub_controller->parent =3D parent;
> +		hub_controller->hub =3D p3h2x4x_hub->hub;
> +
> +		dev_set_drvdata(&controller->dev, hub_controller);
> +
> +		ret =3D i3c_hub_reserve_parent_addrslots_from_dt(hub_controller,
> +							       p3h2x4x_hub->tp_bus[tp].of_node);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (tp =3D 0; tp < p3h2x4x->num_target_ports; tp++) {
> +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> +		    p3h2x4x_hub->hub_config.tp_config[tp].mode !=3D P3H2X4X_TP_MODE_I3=
C)
> +			continue;
> +
> +		struct i3c_master_controller *controller =3D
> +				&p3h2x4x_hub->tp_bus[tp].hub_controller.controller;
> +
> +		ret =3D i3c_master_register_fwnode(controller,
> +						 p3h2x4x_hub->dev,
> +						 of_fwnode_handle(p3h2x4x_hub->tp_bus[tp].of_node),
> +						 &i3c_hub_master_ops,
> +						 false);

[Severity: High]
Won't i3c_master_reconcile_dyn_addrs() on the parent bus clobber the
reservations made by i3c_hub_reserve_parent_addrslots_from_dt()?

i3c_hub_reserve_parent_addrslots_from_dt() marks each child's
assigned-address on parent->bus as I3C_ADDR_SLOT_I3C_DEV without a matching
descriptor in parent->bus.devs.i3c.  When the first port runs
i3c_master_register_fwnode() -> ... -> i3c_hub_do_daa() ->
i3c_master_do_daa(parent), i3c_master_reconcile_dyn_addrs(parent) resets
every I3C_ADDR_SLOT_I3C_DEV slot not in parent->bus.devs.i3c to
I3C_ADDR_SLOT_FREE and probes it:

drivers/i3c/master.c:i3c_master_reconcile_dyn_addrs() {
    ...
		if (status !=3D I3C_ADDR_SLOT_I3C_DEV || test_bit(addr, dev_dyn_addrs))
			continue;
		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_FREE);
		/* Try to add the device, but probe to see if it is really present */
		__i3c_master_add_i3c_dev_locked(master, addr, true);
    ...
}

For later ports that are still disconnected, the probe sees no device and
leaves the slot I3C_ADDR_SLOT_FREE, wiping out their reservations.  For
devices on the connected port that already got their address via SETDASA on
controller->bus, the probe succeeds and registers a duplicate i3c_device on
parent->bus.

> +		if (ret)
> +			return ret;
> +
> +		ret =3D devm_add_action_or_reset(p3h2x4x_hub->dev,
> +					       p3h2x4x_unregister_i3c_master,
> +					       controller);
> +		if (ret)
> +			return ret;
> +
> +		ntwk_mask |=3D p3h2x4x_hub->tp_bus[tp].tp_mask;
> +		p3h2x4x_hub->tp_bus[tp].is_registered =3D true;
> +	}
> +
> +	/*
> +	 * Take the routing lock used by the hub callbacks so they cannot
> +	 * observe always_enable before the route is programmed.
> +	 */
> +	mutex_lock(&p3h2x4x_hub->hub->lock);
> +
> +	ret =3D regmap_write(p3h2x4x_hub->regmap,
> +			   P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
> +	if (!ret) {
> +		for (tp =3D 0; tp < p3h2x4x->num_target_ports; tp++) {
> +			if (!(ntwk_mask & p3h2x4x_hub->tp_bus[tp].tp_mask))
> +				continue;
> +
> +			p3h2x4x_hub->hub_config.tp_config[tp].always_enable =3D true;
> +		}
> +	}
> +	mutex_unlock(&p3h2x4x_hub->hub->lock);

[Severity: High]
Does keeping always_enable false until all ports are registered leave target
ports disconnected while downstream device drivers probe?

CPU0                                  kworker (parent->wq)
p3h2x4x_tp_i3c_algo()
  i3c_master_register_fwnode()
    ...
      i3c_hub_do_daa()
        i3c_master_do_daa(parent)
          queue_work(..., &parent->reg_work)
        i3c_hub_disable_port(controller)
          regmap_clear_bits(..., tp_mask)
                                      i3c_master_reg_work_fn()
                                        device_add(&i3cdev->dev)
                                          <target driver probe>
                                            i3c_device_do_priv_xfers()
                                              <-- port is disconnected
  /* next port's i3c_master_register_fwnode() */
  regmap_write(..., P3H2X4X_TP_NET_CON_CONF, ntwk_mask)

Devices discovered via ENTDAA are queued on parent->reg_work and use
parent->ops directly without calling p3h2x4x_hub_enable_port(), so their
probes fail if they run before P3H2X4X_TP_NET_CON_CONF is written at the
end of p3h2x4x_tp_i3c_algo().  Likewise, for statically described devices on
controller->bus that call i3c_device_enable_ibi() during
i3c_master_register_fwnode(), i3c_hub_enable_ibi() disconnects the port on
exit, dropping IBIs until all remaining ports finish registering.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> new file mode 100644
> index 0000000000000..247d0f4883b7c
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> @@ -0,0 +1,352 @@

[ ... ]

> +static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg =
*msgs, int num)
> +{
> +	int ret_sum =3D 0, ret, msg_count;
> +	u8 rw;
> +
> +	struct tp_bus *bus =3D i2c_get_adapdata(adap);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D bus->p3h2x4x_i3c_hub;
> +
> +	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
> +	guard(mutex)(&bus->port_mutex);
> +
> +	for (msg_count =3D 0; msg_count < num; msg_count++) {
> +		rw =3D (msgs[msg_count].flags & I2C_M_RD) ? 1 : 0;
> +		if (!rw) {
> +			/* If a write message is immediately followed by a read message to
> +			 * the same address,  consider combining them into a single transacti=
on.
> +			 */
> +			if (msg_count + 1 < num &&
> +			    msgs[msg_count].addr =3D=3D msgs[msg_count + 1].addr &&
> +			    (msgs[msg_count + 1].flags & I2C_M_RD)) {
> +				if (msgs[msg_count].len + msgs[msg_count + 1].len >
> +				    P3H2X4X_SMBUS_PAYLOAD_SIZE)
> +					return -EINVAL;

[Severity: Medium]
Should this fall back to sending the write and read as separate transactions
(or set max_comb_1st_msg_len and max_comb_2nd_msg_len in
p3h2x4x_tp_i2c_quirks) instead of returning -EINVAL?

Because p3h2x4x_tp_i2c_quirks advertises max_read_len =3D 84 and
max_write_len =3D 84 with no combined limit, callers such as regmap-i2c iss=
ue
a 1- or 2-byte register write followed by an 84-byte read; both messages
pass i2c_check_for_quirks(), but their sum exceeds
P3H2X4X_SMBUS_PAYLOAD_SIZE (84) and fails here with -EINVAL.

> +
> +				rw =3D 2;
> +				msg_count +=3D 1;
> +				ret_sum +=3D 1;
> +			}
> +		}
> +
> +		ret =3D p3h2x4x_tp_i2c_xfer_msg(p3h2x4x_i3c_hub,
> +					      msgs,
> +					      bus->tp_port,
> +					      (rw =3D=3D 2) ? (msg_count - 1) : msg_count,
> +					       rw);
> +		if (ret)
> +			return ret;
> +
> +		ret_sum++;
> +	}
> +	return ret_sum;
> +}
> +
> +static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
> +}

[Severity: High]
Does advertising I2C_FUNC_SMBUS_BLOCK_DATA without handling I2C_M_RECV_LEN
in p3h2x4x_tp_i2c_xfer_msg() corrupt SMBus block reads and leak stack memor=
y?

Because p3h2x4x_tp_i2c_algorithm has no .smbus_xfer callback,
i2c_smbus_read_block_data() and I2C_SMBUS_BLOCK_DATA read ioctls go through
i2c_smbus_xfer_emulated(), which sets msg[1].flags |=3D I2C_M_RECV_LEN and
msg[1].len =3D 1.  p3h2x4x_tp_i2c_xfer_msg() ignores I2C_M_RECV_LEN and rea=
ds
only 1 byte (the block length N) into msg[1].buf[0], after which
i2c_smbus_xfer_emulated() copies N unwritten bytes from msg[1].buf[1..N] to
the caller (zeroes from the bounce buffer, or uninitialized stack bytes from
msgbuf1 if kzalloc() in i2c_smbus_try_get_dmabuf() fails).

Also, omitting I2C_FUNC_SMBUS_EMUL leaves standard byte, word, and I2C-block
SMBus operations unadvertised, preventing SMBus and hwmon drivers from using
the adapter.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112124437.3367=
252-1-lakshay.piplani@nxp.com?part=3D3
