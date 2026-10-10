Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C4735A395;
	Sat, 10 Oct 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648706; cv=none; b=Tw9QfL+qaDE8trrKCYrl8BuUJBprGm36AljXVM9HlxkMjRTxo16RUD9zAUtXDHFswtbrVOcYnCYRs0X3OfaKMLPkAxI7SJttFdf45PSUrHT7GmR94bMK+BK7U3gGndkkWr6berpqxWntXGQFC9xgzjsadMz8dZa4VHEX8C+84go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648706; c=relaxed/simple;
	bh=n4wndukQf2QeGyH+5aNFXasHVU9DIkOT4GcKNV+xRLo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HXcTSuZG4Nt70+ssfoI/DKM57PMh4E+ADBMWDVyeTg5uC1VU5khXRweCCM5A8/El+Yh3IAeqBHoc3wvzDolv8pCvtvcQi4uAYycLAfosSFY6y1xo5eJkBs88KXjGoUo+8NVnDA+jzw4MBy6DeHxku9RmbdQ4dtXv4zxTWxpTp3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1lqXTNT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1lqXTNT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566711F000FF;
	Sat, 10 Oct 2026 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791648704;
	bh=KDgtD9uNFHltL8JB6C+zXySBrayNpiD9/Bp0x6SizDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F1lqXTNTd9Or2JygmrQWhjD6gfmDiUshAvBNWE6IDyEJn6G/P2mw00Ch8zswmbx0d
	 HTxT4T+9LXiePVWsOOB+ajUpwBye9ZbLUlz6mkDb0AZ5TJ4Kc1l+vauDcMXH8B0mP0
	 k6PKQgmyJzi+GKAEt+1hmD8AOBxgSPKufY3h2MSKgutQsz3hMPcSTF38UWXlVOeoKF
	 JOiZFmSiOc6VDfuplA/PBx2+Ey4H/JLjpFW8Y2EcbP6q5XbU6/655MtJ+k/GaBIo0F
	 zE64RBS5y1eS6/ZYnWjJQ/yLQJynMOzqzpYvVuRZcRYEkjzam0R/q/4BtP5wWe3apv
	 H34R0RDySXPtQ==
Message-ID: <sashiko-outbox-166724@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 09/10] net: dsa: mt7530: generalize and
 move common function to lib module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261009161102.38961-10-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:11:43 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: severe MDIO bus performance regression via sequential regmap_=
field accesses
- [Medium] net: dsa: mt7530: stale hardware bits preserved during VLAN setu=
p due to RMW
--

commit 9f9905cb3bdc569b54ef5ded23eb827e6ba6ffc2
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: mt7530: generalize and move common function to lib module

This commit creates a mt7530 library module to share common functions in
preparation for Airoha switch support. The functions are refactored to use
the reg_field regmap API for register access while aiming to preserve the
same logic. Minimum modifications are made to header files to permit reuse
of common macros and enums.

> diff --git a/drivers/net/dsa/mediatek/mt7530-lib.c b/drivers/net/dsa/medi=
atek/mt7530-lib.c
> new file mode 100644
> index 0000000000000..098dd45d3ee9f
> --- /dev/null
> +++ b/drivers/net/dsa/mediatek/mt7530-lib.c

[ ... ]

> +static void mt7530_lib_fdb_write(struct mt7530_lib_priv *priv, u16 vid,
> +				 u8 port_mask, const u8 *mac,
> +				 u8 aging, u8 type)
> +{
> +	/* Clear ATWD registers from previous access */
> +	regmap_field_write(priv->fields[__MT7530_ATWD1], 0);
> +	regmap_field_write(priv->fields[__MT7530_ATWD2], 0);
> +	regmap_field_write(priv->fields[__MT7530_ATWD3], 0);
> +
> +	regmap_field_write(priv->fields[MT7530_ATWD_CVID], vid);
> +	regmap_field_write(priv->fields[MT7530_ATWD_IVL], 1);

[Severity: High]
Does this sequence of regmap_field_write() calls cause a severe performance
regression on the MDIO bus?

Since the MDIO bus is inherently slow, taking around 20 to 30 microseconds
per transaction, replacing a bulk 32-bit regmap_write() with individual
regmap_field_write() operations expands a single register update into
multiple Read-Modify-Write cycles.=20

It looks like this single FDB entry write will now execute up to 15 RMW
operations instead of a single bulk update.

> +	regmap_field_write(priv->fields[MT7530_ATWD_FID], FID_BRIDGED);
> +	regmap_field_write(priv->fields[MT7530_ATWD_AGE_TIMER], aging);
> +	regmap_field_write(priv->fields[MT7530_ATWD_PORT_MAP], port_mask);

[ ... ]

> +void mt7530_lib_fdb_read(struct mt7530_lib_priv *priv, struct mt7530_fdb=
 *fdb)
> +{
> +	u32 val =3D 0;
> +
> +	regmap_field_read(priv->fields[MT7530_ATRD_CVID], &val);
> +	fdb->vid =3D val;
> +	regmap_field_read(priv->fields[MT7530_ATRD_AGE_TIMER], &val);
> +	fdb->aging =3D val;

[Severity: High]
Similarly, does this sequence expand a single 3-register access into 10
separate MDIO read transactions?

If a full FDB dump of 2048 entries is requested, or continuous stat polling
occurs, this could multiply the bus traffic and cause severe latency and
MDIO bus congestion.

> +	regmap_field_read(priv->fields[MT7530_ATRD_PORT_MAP], &val);
> +	fdb->port_mask =3D val;
> +	regmap_field_read(priv->fields[MT7530_ATRD_MAC_BYTE_5], &val);
> +	fdb->mac[5] =3D val;

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
> +	/* Validate the entry with independent learning, create egress tag per
> +	 * VLAN and joining the port as one of the port members.
> +	 */
> +	regmap_field_write(priv->fields[MT7530_VAWD_IVL_MAC], 1);
> +	regmap_field_write(priv->fields[MT7530_VAWD_VTAG_EN], 1);
> +	regmap_field_write(priv->fields[MT7530_VAWD_PORT_MEM],
> +			   new_members);
> +	regmap_field_write(priv->fields[MT7530_VAWD_FID],
> +			   FID_BRIDGED);
> +	regmap_field_write(priv->fields[MT7530_VAWD_VLAN_VALID], 1);

[Severity: Medium]
Can this sequence of regmap_field_write() calls preserve stale hardware bits
and leak them into new VLAN entries?

By using individual regmap_field_write() operations, this performs
Read-Modify-Write cycles on the previously populated hardware register via
RD_VID. The old implementation used a full 32-bit regmap_write() which
safely cleared unspecified bits.

It appears that any leftover hardware bits in MT7530_VAWD1, such as EG_CON
or PORT_STAG from prior usages or bootloader states, will be preserved.

Could this lead to corrupted egress tagging behaviors or STAG attributes on
standard VLANs?

> +
> +	/* Decide whether adding tag or not for those outgoing packets from the
> +	 * port inside the VLAN.
> +	 * CPU port is always taken as a tagged port for serving more than one

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009161102.3896=
1-1-ansuelsmth@gmail.com?part=3D9
