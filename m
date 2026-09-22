Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A73939C9;
	Tue, 22 Sep 2026 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074518; cv=none; b=U+v1J0J9GHT+kqFv0vZoJ3bIeWVBFTIkXblIm32AziaeKoEejyrt6zyq7gt2Ggz4XhjCjCXgV4O2HB2etIi6IvK3X7GPA/HZMtc5djS78POQluft0xAXktPgB4/tKWOzRTTJJOhN0EfUYBAfzFmFZ6CVzlMHNzUEdgndBF6B1MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074518; c=relaxed/simple;
	bh=qo9THL6VKsT/lL5P22xZ9s6iyQubCi4QytGRN/QPJF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CKyBDbTU8DKkK3ud0lA79UO/eK+8H2rZ6sASBlEtXcPBxfv545XfudYafQcxuzDGFrZZt7s0f2c0R0+zI9XBHfhd8qKSUy8BRxFmZ2LSFKTdqrObinNiBqpeCEiSVIZMgKrhEHcxiH8dagtoHUNKAS3z/eKRV5YE2+hXRGwxdDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mf9m3cXB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mf9m3cXB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D811F000FF;
	Tue, 22 Sep 2026 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074510;
	bh=s/+QYMob5+87WiegSIyEa79IoXlYo95rJzrQ1G3FftY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mf9m3cXBnrivcj+3uhYb2gw+lRy12PHKU/CD6qXTKQ+KjBesvuX23lptmMf4MgLXD
	 GF96MJR1PQgMFS8FjDkWNFc+JneBve0WC7cDNfQALYCFZThNwrHxOHjP3D+3UiQ/kl
	 3op3FD5LTjwbcEyb0JnDe16St4Nqkf0d460G0b1unK5lJNhY5TuSX98NNEocH1FSAH
	 CHFGA2LM+uS4dB4FykHEWYY2liehqnKdB1uPw1axYgdIs4Lra6zjxsuonKYhKtUlZI
	 U+Pak5xw9fASmCznT59HA+elvFOkz4yb2kBS3jBz67ilUvY4c7UNVsgsgXgMMeiX9B
	 fMJKLPgzbCjcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 7/8] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, lee@kernel.org, linux-i3c@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, mfd@lists.linux.dev
In-Reply-To: <20260922103551.2754613-8-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-8-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:55:09 +0000
Message-Id: <20260922105509.C3D811F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] i3c: hub: TOCTOU race and disconnect during I3C master registration
- [Medium] i3c: hub: inconsistent DT child parsing allows port usurpation
--

commit 0eedb3548ed97f556aa49d9f3afacf2b02004acb
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality

This commit adds I3C hub functionality for the NXP P3H2x4x family. It
enables I3C/I2C communication between host and hub, transparent communicati=
on
with downstream devices, and target port configuration.

> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p=
3h2840_i3c_hub_common.c
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
[ ... ]
> +static void p3h2x4x_get_target_port_dt_conf(struct device *dev,
> +					    const struct device_node *node)
> +{
> +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub =3D dev_get_drvdata(dev);
> +	struct p3h2x4x *p3h2x4x =3D dev_get_drvdata(dev->parent);
> +	u64 tp_port;
> +
> +	for_each_available_child_of_node_scoped(node, dev_node) {
> +		if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
> +			continue;

[Severity: Medium]
Does this loop potentially capture unrelated nodes with a "reg" property?

Unlike p3h2x4x_parse_tp_dt_settings() below which checks if the node name is
"i3c" or "smbus", this loop iterates over all children of the MFD node with=
out
checking the node name. If an unrelated child has a "reg" property, it might
usurp a valid target port slot and incorrectly default to P3H2X4X_TP_MODE_I=
3C.

[ ... ]
> +static int p3h2x4x_parse_tp_dt_settings(struct device *dev,
> +					const struct device_node *node,
> +					struct tp_configuration tp_config[])
> +{
> +	struct p3h2x4x *p3h2x4x =3D dev_get_drvdata(dev->parent);
> +	u64 id;
> +	int ret;
> +
> +	for_each_available_child_of_node_scoped(node, tp_node) {
> +		enum p3h2x4x_tp_mode mode;
> +
> +		/*
> +		 * Only "i3c" and "smbus" children describe target ports. Skip any
> +		 * other child (for example the MFD "regulators" container), which
> +		 * has no "reg" property.
> +		 */
> +		if (of_node_name_eq(tp_node, "i3c"))
> +			mode =3D P3H2X4X_TP_MODE_I3C;
> +		else if (of_node_name_eq(tp_node, "smbus"))
> +			mode =3D P3H2X4X_TP_MODE_SMBUS;
> +		else
> +			continue;

[ ... ]
> diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2=
840_i3c_hub_i3c.c
> --- /dev/null
> +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
[ ... ]
> +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
> +{
[ ... ]
> +		ret =3D i3c_master_register_fwnode(controller,
> +						 p3h2x4x_hub->dev,
> +						 of_fwnode_handle(p3h2x4x_hub->tp_bus[tp].of_node),
> +						 &i3c_hub_master_ops,
> +						 false);

[Severity: High]
Could this lead to a physical port disconnection and subsequent transfer
failures?

When i3c_master_register_fwnode() is called here, it triggers DAA. At this
time, the always_enable flag is false, meaning p3h2x4x_hub_enable_port() and
p3h2x4x_hub_disable_port() will actively manipulate P3H2X4X_TP_NET_CON_CONF.
After DAA completes, the port is left physically disconnected.

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
> +		p3h2x4x_hub->hub_config.tp_config[tp].always_enable =3D true;
> +	}
> +	return regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_=
mask);

[Severity: High]
Because always_enable is set to true in the loop, subsequent port enable and
disable callbacks become no-ops. However, the hardware register
P3H2X4X_TP_NET_CON_CONF isn't actually written until the very end of the lo=
op.

Does this leave a window where the port is exposed but physically
disconnected? If an I3C transfer is initiated concurrently before the loop
finishes, won't it fail due to the software assuming the port is always
enabled while the hardware hasn't been updated yet?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922103551.2754=
613-1-lakshay.piplani@nxp.com?part=3D7
