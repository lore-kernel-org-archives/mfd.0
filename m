Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488834;
	b=LzzFVn7ke6jiNjbevuynZAkSI7izmOOSmGYf9pZSkjbzjO0Aq+rWRjxnkGXLwPAPIDB0
	 HLK11w2Io+JrOpBxQ+sWDxgYGa8/iaexm0HcQvqP99h6R1YSQQD+5xsS3zszc9T5IKKc7
	 EOJa6AK09gX/lVKGK75/FJZXFCG05Tlf7PcImz+Wy3EO0wswjaYIJQZ6jAnf29mlb4+oy
	 Tmec3GK9ZcdsDHt1gnVR6qc7d7YmDziHQnNZ+oCttmgUd96EEMB6/NQ/hndkQxg+r8fxw
	 m88njdH9jDPn4Jra8/hAv45eaDT9vKkDMktdecVQFQZpiAwWHvJrq8xyqBwIA9JLJ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488834;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IO8mblBXP1RWSPo9tFYz5CS4BOTa6XyJvVMZkiXIqsg=;
	b=PdwWC+9KyvdoArL/qc+F+RfngVG/M6PyWxVLRD7bVFcFaxqzkqBy9WqgzQMxyllPQfnB
	 arsmJwLMA8BXjzivcxUhfZ8Lv5HNSPAvYny+bf8F7vzr4t4IGBGW/TVvkNYoIGNYheUJi
	 3VGK9x2ol5xerKey8qUNKPp2lJIjzbxYQM5Y9QyskRHuxNXdI02mT7x4vZusOrVnJN9pg
	 wwLiHc0IyfJBh9GHtp2VQOBLvKqO+ERo4QofZ49XEl0GZAt/QY39VkaoNeWGc9kmQ8j6O
	 h6iVK+kLCyWqKI8zTyyudcErcnpcgSxttceD5JrC8n67UCfm3GAmTiQnyb4wm35jXEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqnwkytp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F77606A327
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqnwkytp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCD11F00A06;
	Thu, 12 Nov 2026 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794488833;
	bh=IO8mblBXP1RWSPo9tFYz5CS4BOTa6XyJvVMZkiXIqsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bqnwkytpmBP4Pk73TCfPwytXlOzYLwiiheUj7SfviAJKgbR/bkl2S7mXapSMAIZYb
	 dS4/kWBcrfwkxLRvSEvWoHP4CRMQOcJOpOId00yeEcnEyQS82JwtMZDXLGGa2flKbe
	 3/YdpYrfy9mWkeH+ZVDITqxA6DemQhgJR1LT+5wQpttySBv82jp50kguqJVWefha5a
	 xl/LQv5dE0I36Kv9L7x4lsXIffj6D3dXIAW2nnhO11mgAjycktpIgL1Rkhe3rzVpEq
	 Bb5+t/LeyQOs4ralXk91lVvuGhqg0Sq+d5DhdK4MPNe6TUjYR2l6e1XFGIfAj2UaOf
	 jUxcTzSDw/PaQ==
Message-ID: <sashiko-outbox-211140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v21 4/4] i3c: hub: p3h2x4x: Add SMBus slave mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev
Cc: Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, lee@kernel.org
In-Reply-To: <20261112124437.3367252-5-lakshay.piplani@nxp.com>
References: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
 <20261112124437.3367252-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 13:07:13 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] i3c: hub: p3h2x4x: empty rx buffer not rejected in
  p3h2x4x_read_smbus_agent_rx_buf()
- [Medium] i3c: hub: p3h2x4x: stale rx flags not cleared in
  p3h2x4x_tp_i2c_reg_slave()
- [Low] i3c: hub: p3h2x4x: missing I2C_CLIENT_TEN check in
  p3h2x4x_tp_i2c_reg_slave()
--

commit c82ca6aaf774f0de048a84b1a2c414e57c266eef
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: p3h2x4x: Add SMBus slave mode support

This commit adds SMBus slave mode support for the P3H2x4x hub target ports,
handling receive events via I3C IBI and forwarding received payloads to
registered I2C slave clients.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3=
h2840_i3c_hub_smbus.c
> index 247d0f4883b7c..02b50d1eb938d 100644
> --- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> @@ -3,6 +3,7 @@
>   * Copyright 2025-2026 NXP
>   * This P3H2X4X driver file contain functions for SMBus/I2C virtual Bus =
creation and read/write.
>   */
> +#include <linux/i3c/device.h>
>  #include <linux/mfd/p3h2840.h>
>  #include <linux/regmap.h>
> =20
> @@ -15,6 +16,171 @@ enum p3h2x4x_smbus_desc_idx {
>  	P3H2X4X_DESC_READ_LEN,
>  };
> =20
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, e=
num p3h2x4x_rcv_buf rfbuf,
> +					    enum p3h2x4x_tp tp)
> +{
> +	struct p3h2x4x *p3h2x4x =3D i3cdev_get_drvdata(i3cdev);
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
> +	u8 target_buffer_page, flag_clear, temp =3D 0, i, addr;
> +	u32 packet_len, slave_address;
> +	struct i2c_client *client;
> +	u8 *slave_rx_buffer;
> +	int ret;
> +
> +	if (!p3h2x4x || !p3h2x4x->i3c_hub_priv)
> +		return;
> +
> +	p3h2x4x_i3c_hub =3D p3h2x4x->i3c_hub_priv;
> +	slave_rx_buffer =3D p3h2x4x_i3c_hub->slave_rx_buffer;
> +
> +	switch (rfbuf) {
> +	case RCV_BUF_0:
> +		target_buffer_page =3D P3H2X4X_TARGET_BUFF_0_PAGE;
> +		flag_clear =3D P3H2X4X_TARGET_BUF_0_RECEIVE;
> +		break;
> +	case RCV_BUF_1:
> +		target_buffer_page =3D P3H2X4X_TARGET_BUFF_1_PAGE;
> +		flag_clear =3D P3H2X4X_TARGET_BUF_1_RECEIVE;
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	target_buffer_page +=3D P3H2X4X_NO_PAGE_PER_TP * tp;
> +
> +	ret =3D regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, target_=
buffer_page);
> +	if (ret)
> +		goto ibi_err;
> +
> +	/* read buffer length */
> +	ret =3D regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_LENGTH=
, &packet_len);
> +	if (ret)
> +		goto ibi_err;
> +
> +	if (packet_len)
> +		packet_len =3D packet_len - 1;

[Severity: Medium]
Should p3h2x4x_read_smbus_agent_rx_buf() jump to ibi_err when packet_len is
0?

P3H2X4X_TARGET_BUFF_LENGTH includes the 1-byte target address, so a valid
zero-payload transfer has length 1 before decrementing.  When
P3H2X4X_TARGET_BUFF_LENGTH reads as 0 (for example, on an aborted transfer
or empty buffer), falling through with packet_len =3D=3D 0 reads a stale
P3H2X4X_TARGET_BUFF_ADDRESS from a prior transaction and delivers spurious
I2C_SLAVE_WRITE_REQUESTED and I2C_SLAVE_STOP events to the slave client.

[ ... ]

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
> +{
> +	struct tp_bus *bus =3D i2c_get_adapdata(slave->adapter);
> +	struct p3h2x4x_i3c_hub_dev *hub =3D bus->p3h2x4x_i3c_hub;
> +	struct p3h2x4x *p3h2x4x =3D dev_get_drvdata(hub->dev->parent);
> +	int relock_ret =3D 0;
> +	int ret =3D 0;
> +
> +	guard(mutex)(&hub->etx_mutex);
> +
> +	if (!hub->i3cdev || !hub->ibi_ready)
> +		return -EOPNOTSUPP;
> +
> +	if (bus->tp_smbus_client)
> +		return -EBUSY;

[Severity: Low]
Should p3h2x4x_tp_i2c_reg_slave() reject 10-bit addressed clients
(slave->flags & I2C_CLIENT_TEN) with -EAFNOSUPPORT?

i2c_slave_register() skips 7-bit address validation when I2C_CLIENT_TEN is
set and delegates the check to reg_slave().  Without it, registration
succeeds and p3h2x4x_read_smbus_agent_rx_buf() truncates client->addr to its
low 7 bits when matching against P3H2X4X_TARGET_BUFF_ADDRESS.

> +
> +	scoped_guard(mutex, &p3h2x4x->protected_reg_lock) {
> +		/* Unlock access to protected registers */
> +		ret =3D regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
> +				   P3H2X4X_REGISTERS_UNLOCK_CODE);
> +		if (ret)
> +			break;
> +
> +		ret =3D regmap_set_bits(hub->regmap,
> +				      P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
> +				      bus->tp_mask);
> +
> +		/* Lock access to protected registers */
> +		relock_ret =3D regmap_write(hub->regmap,
> +					  P3H2X4X_DEV_REG_PROTECTION_CODE,
> +					  P3H2X4X_REGISTERS_LOCK_CODE);
> +	}

[Severity: Medium]
Does p3h2x4x_tp_i2c_reg_slave() need to clear BUF_RECEIVED_FLAG_MASK in
P3H2X4X_TP0_SMBUS_AGNT_STS + bus->tp_port before enabling the port IBI?

p3h2x4x_configure_tp() enables P3H2X4X_TP_SMBUS_AGNT_EN at probe time, and
p3h2x4x_tp_i2c_unreg_slave() only masks the port bit in
P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG.  Any SMBus write arriving on the port
while no slave is registered fills the target buffers and sets the receive
and overflow status flags without triggering p3h2x4x_ibi_handler().  Leaving
those flags set across registration either delivers stale payloads to the
new slave client or leaves both target buffers permanently occupied if an
IBI requires a fresh status transition.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112124437.3367=
252-1-lakshay.piplani@nxp.com?part=3D4
