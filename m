Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2153803E1;
	Sat, 12 Sep 2026 22:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253712; cv=none; b=Vyx+tUFUmS/cE8Nim6xYogPJbKw9Qj+m0bek1m7OVAJv1pFMc0UMOaazeZWSpO5Q++A5eYqbTFHAkNDztuIL59Wu3Gr7FwMCAadegxSl8k2sMsYTJ52ESOF0iJxS05nyUxz5r8pH9dti1EqQvv+XvX8X4WQtWPsXQX6GnBfuxPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253712; c=relaxed/simple;
	bh=sZOD7l4Uu/BBu1DYoJjZx0KUD1NZOl8bGpo5ZzgifAI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sSWKb3iAjzbglzJ0JZAVqUrqETLFsXEeu2x4W0uLmk/L44l0z9KDHIYQiZuH2nHzsptJPB3Jz3sd46ApXHYirdC4W3SEwl0rgJVeMGLQHVFyppo4bEoOZUwFGP6C+Dg13CKzo6Zx+nv818IwXAf2+AXb+6OwEJbc1hBzWH4DDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JO8BdJNm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JO8BdJNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F6E1F00893;
	Sat, 12 Sep 2026 22:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253711;
	bh=WqIOG+k8ahdtQf6vSoVP8IMjTuALTgLyhok5VmkAm3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JO8BdJNmYo1Jha/d5hD3h+V+loA8rgTMkCHa2aVDsxeZu70qxtGKM+nCBD5b15piZ
	 ez5/WZANQufPHMS6PgrLxNtGVwOs0+4uNjllnIiKtnFopHWnVYTEKAL7awEwBS5zzu
	 yfGo4J36g4KTKg8TU6zxgnVOUYU/5ozz5G3ZZS7A6AkZKqFY6zo767vaxK00lMUDvZ
	 Djp1wsZNlQRGMkBuoOjVKAZlnZQ2ziX8qVkj3aokukcnVo78kLhh+8mOodih74ouJL
	 tpsGQTZeSXC6U5VYinj2yal1xP5yaNus8MSCVSls3of6SNourj1OaK9FVl0C7u6h2P
	 Eq8xVM5qSpYjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 8/9] net: dsa: mt7530: generalize and move
 common function to lib module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260911225414.225980-9-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
 <20260911225414.225980-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:55:10 +0000
Message-Id: <20260912225510.99F6E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Clearing `__MT7530_VAWD2` in `mt7530_hw_vlan_add()` destroys the e=
gress tag configuration of all other ports in the VLAN.
- [Medium] Missing clearing of the `__MT7530_VAWD1` register before configu=
ring VLAN 0.
- [Low] Passing an `int *` to `regmap_field_read()` triggers an incompatibl=
e pointer types warning.
- [Low] Enabling mirroring before setting the destination port creates a ra=
ce condition.
--

commit df02cf8f99d1289b20bc7e77c9448ff004d35005
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: mt7530: generalize and move common function to lib module

This commit introduces a library module for MT7530 and moves common functio=
ns
into it. The functions are generalized to use the reg_field regmap API while
applying the same logic, and mirror functions are cleaned up.

> diff --git a/drivers/net/dsa/mt7530-lib.c b/drivers/net/dsa/mt7530-lib.c
> --- /dev/null
> +++ b/drivers/net/dsa/mt7530-lib.c

[ ... ]

> +int mt7530_lib_port_mirror_add(struct mt7530_lib_priv *priv, int port,
> +			       struct dsa_mall_mirror_tc_entry *mirror,
> +			       bool ingress, struct netlink_ext_ack *extack)
> +{
> +	int monitor_port =3D -1;
> +	u32 val =3D 0;
> +
> +	/* Check for existent entry */
> +	if ((ingress ? priv->mirror_rx : priv->mirror_tx) & BIT(port))
> +		return -EEXIST;
> +
> +	regmap_field_read(priv->fields[MT7530_MIRROR_EN], &val);
> +	regmap_field_read(priv->fields[MT7530_MIRROR_PORT], &monitor_port);

[Severity: Low]
Does this pass an incompatible pointer type?

The monitor_port variable is declared as an int, but regmap_field_read()
expects an unsigned int * as its second argument. This can trigger a compil=
er
warning for incompatible pointer types, which may cause builds to fail if
configured with -Werror.

> +
> +	/* MT7530 only supports one monitor port */
> +	if (val && monitor_port !=3D mirror->to_local_port)
> +		return -EEXIST;
> +
> +	regmap_field_write(priv->fields[MT7530_MIRROR_EN], 1);
> +	regmap_field_write(priv->fields[MT7530_MIRROR_PORT],
> +			   mirror->to_local_port);

[Severity: Low]
Could this create a race condition where mirroring is enabled before the
destination port is safely updated?

Writing the enable bit before configuring the destination port creates a sm=
all
window where mirroring is active but directed to the old or default destina=
tion
port. This might cause a momentary glitch where packets are mirrored to the
wrong port.

[ ... ]

> +static void mt7530_hw_vlan_add(struct mt7530_lib_priv *priv,
> +			       struct mt7530_hw_vlan_entry *entry)
> +{
> +	struct dsa_port *dp =3D dsa_to_port(priv->ds, entry->port);
> +	u8 new_members;
> +	u32 val;
> +
> +	new_members =3D entry->old_members | BIT(entry->port);
> +
> +	/* Clear VAWD registers from previous access */
> +	regmap_field_write(priv->fields[__MT7530_VAWD1], 0);
> +	regmap_field_write(priv->fields[__MT7530_VAWD2], 0);

[Severity: High]
Can this wipe out the egress tag configuration of all other ports in the VL=
AN?

When adding a port to an existing VLAN, mt7530_hw_vlan_update() copies the
current VLAN entry from hardware into the VAWD1 and VAWD2 registers. By
unconditionally zeroing __MT7530_VAWD2 here, the egress tag settings of all
prior ports in the VLAN are reset to zero (MT7530_VLAN_EGRESS_UNTAG).

Adding a user port to a VLAN could thus strip the CPU port of its required
MT7530_VLAN_EGRESS_STACK tagging, breaking VLAN traffic routing.

[ ... ]

> +int mt7530_lib_setup_vlan0(struct mt7530_lib_priv *priv)
> +{
> +	regmap_field_write(priv->fields[MT7530_VAWD_IVL_MAC], 1);
> +	regmap_field_write(priv->fields[MT7530_VAWD_VTAG_EN], 0);
> +	regmap_field_write(priv->fields[MT7530_VAWD_EG_CON], 1);

[Severity: Medium]
Should this clear the __MT7530_VAWD1 register before configuring VLAN 0?

Unlike mt7530_hw_vlan_add() which clears the register first, this sequence
performs read-modify-write operations on individual fields. Any residual bi=
ts
from previous VLAN or FDB hardware commands (like the PORT_STAG bit or rese=
rved
bits) might leak into the configuration for VLAN 0. This state leak can
misconfigure the switch for VLAN-unaware bridging traffic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911225414.2259=
80-1-ansuelsmth@gmail.com?part=3D8
