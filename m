Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64CC38236F;
	Sat, 12 Sep 2026 22:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253713; cv=none; b=fOEqfmg+S5mPq/6vDdLNnjI7HeZKoODI4Ofd3YctbTj8ZDaRs4WW2I1W66djeX9Fn+sAuFlt3j7RCS6MBkbK/oP8ZaLsEq3KNc0TXlReVvjwVM3IRS2qKATz5Q33tAShScTbiXgUsDFpVpyglE7OAT6AajYDHMaR+9S/AFfnPgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253713; c=relaxed/simple;
	bh=MsijMyMgDN2JvRJhuwWxUi5HOCcabrCOcaqXnthC4G0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GbAUUKVy/MME66J3cpynzFCRY0inxNBPq04xpwb9JzT/DPIAjIAnLA4wnuHsyvjMvlLuHaFM91njACHSpX6gqaf7R/xM7WsG03KStjlZGWuzpJHDleB8bc/eVtOV+9bIldnS1Ds0Zniczv7WYGtjXBe+jompC/cAXRcaYWSNyJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wls0TRVJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wls0TRVJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757641F00898;
	Sat, 12 Sep 2026 22:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253711;
	bh=QhW1l2fip+kswvPSYzVhiO0FuPbAN8ZuDpG74yc3xRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wls0TRVJi0ugZPdDIyt6nFKi9DhJj2F6EzPhn/Kb/T1kC7awORpzfATIbUXEALSLc
	 9mZslzagE2QdBFp1gAsU3+xO26kWnYIYhs4LXAvwy59r7X3ItBnDZu+GlvvIWqNu3l
	 Y2CIhlK+thRAHMrY2MHwvAKctGhbQ4NCerUgxN7mtXXBUTYlBhIZ/FCdqfRWtYwE/O
	 TSsiZb+G1maqITH/Slo+vCQrEpgC+CwxEoMEZnsC86NOUNLt44MyL6aEsPfGLxRmgj
	 b/E1VpUfrycBTb7Hont7esDpTkPDd1dOKRisdxn9L0UA/2f+Tvp51QbDhCVLFnbNuS
	 fBotHVn5OmVew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 9/9] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260911225414.225980-10-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
 <20260911225414.225980-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:55:11 +0000
Message-Id: <20260912225511.757641F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Integer underflow when disabling or setting a very low MAC ageing =
time causes hardware to be set to maximum ageing time.
- [High] All MIB counters are defined with an invalid msb of 32, causing dr=
iver probe failure.
- [High] MT7530_ATRD_MAC_BYTE_4 is incorrectly mapped to bits 16-31 instead=
 of 24-31, causing FDB MAC address corruption.
- [High] an8855_port_fdb_dump holds a global hardware mutex while sleeping =
for potentially multiple seconds.
- [Medium] Driver duplicates standard uAPI statistics in private ethtool -S=
 strings.
- [Medium] Lockless access to shared per-port state leads to a race conditi=
on when computing the global LPI timer.
--

commit e64866bd0f321d5cfd3313e5e9ee71ed5ae3535d
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver

This commit adds support for the Airoha AN8855 5-Port Gigabit DSA switch.
The switch supports multiple speeds up to 5G (though 5G is currently
disabled).

> diff --git a/drivers/net/dsa/an8855.c b/drivers/net/dsa/an8855.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/dsa/an8855.c
[ ... ]
> +static const struct mt7530_reg_field an8855_fields[] =3D {
[ ... ]
> +	{ MT7530_ATRD_MAC_BYTE_5, REG_FIELD(AN8855_ATRD1, 16, 23), },
> +	{ MT7530_ATRD_MAC_BYTE_4, REG_FIELD(AN8855_ATRD1, 16, 31), },

[Severity: High]
Does this bitmask incorrectly overlap with MT7530_ATRD_MAC_BYTE_5?

By using bits 16 to 31 for MT7530_ATRD_MAC_BYTE_4, the 4th byte of the MAC
address returned in FDB dumps will be overwritten by the 5th byte. Should
this use 24 to 31 instead to prevent corrupting the MAC address reported
to user-space?

[ ... ]
> +	{ MT7530_GMACCR_MAX_RX_PKT_LEN, REG_FIELD(AN8855_GMACCR, 0, 1) },
> +
> +	{ MT7530_MIB_TX_DROP, REG_FIELD_ID(AN8855_PORT_MIB_TX_DROP, 0, 32, AN88=
55_NUM_PORTS, 0x200) },

[Severity: High]
Can this msb value of 32 cause the driver to fail during probe?

The REG_FIELD_ID macro maps the msb argument to the highest bit index,
meaning 32 defines a 33-bit field. Since these are 32-bit registers,
regmap_field_init() will return -EINVAL and reject these fields, causing
probe to fail unconditionally. Should the msb be 31 here and for the rest
of the MIB counters below?

[ ... ]
> +static const struct mt7530_mib_desc an8855_mib[] =3D {
> +	MIB_DESC(MT7530_MIB_TX_DROP, -1, "TxDrop"),
> +	MIB_DESC(MT7530_MIB_TX_CRC_ERR, -1, "TxCrcErr"),
> +	MIB_DESC(MT7530_MIB_TX_COLLISION, -1, "TxCollision"),

[Severity: Medium]
Is it intentional to expose standard uAPI statistics through private
ethtool -S strings here?

Counters such as TxDrop, TxCrcErr, and TxCollision are mapped to standard
interfaces like rtnl_link_stats64 and ethtool_eth_mac_stats. Duplicating
these standard counters in the driver-private ethtool -S output violates
subsystem guidelines and adds unnecessary maintenance burden.

[ ... ]
> +static int an8855_set_ageing_time(struct dsa_switch *ds, unsigned int ms=
ecs)
> +{
> +	struct an8855_priv *priv =3D ds->priv;
> +	u32 age_count, age_unit, val;
> +
> +	/* Convert msec in AN8855_L2_AGING_MS_CONSTANT counter */
> +	val =3D msecs / AN8855_L2_AGING_MS_CONSTANT;
> +
> +	/* Derive the count unit */
> +	age_unit =3D DIV_ROUND_UP(val, FIELD_MAX(AN8855_AGE_CNT) + 1) - 1;

[Severity: High]
Does this subtraction underflow if the requested ageing time is very low
or disabled (msecs < 1024)?

If msecs is less than AN8855_L2_AGING_MS_CONSTANT, val becomes 0.
DIV_ROUND_UP(0, x) evaluates to 0, and subtracting 1 from 0 results in an
unsigned integer underflow to 0xFFFFFFFF.

> +	if (age_unit > FIELD_MAX(AN8855_AGE_UNIT))
> +		age_unit =3D FIELD_MAX(AN8855_AGE_UNIT);
> +
> +	/* Get the count in unit, age_unit is always incremented by 1 internall=
y */
> +	age_count =3D DIV_ROUND_UP(val, age_unit + 1) - 1;

[Severity: High]
Would this second calculation also underflow if val is 0, programming the
hardware to the maximum possible ageing time instead of the minimum when
ageing is disabled?

[ ... ]
> +static int an8855_port_fdb_dump(struct dsa_switch *ds, int port,
> +				dsa_fdb_dump_cb_t *cb, void *data)
> +{
[ ... ]
> +	mutex_lock(&priv->reg_mutex);
> +
> +	/* Load search port */
> +	ret =3D regmap_write(priv->regmap, AN8855_ATWD2,
> +			   FIELD_PREP(AN8855_ATWD2_PORT, BIT(port)));
[ ... ]
> +		/* Each banks have 4 entry */
> +		for (i =3D 0; i < 4; i++) {
[ ... ]
> +			/* Select bank entry index */
> +			ret =3D regmap_write(priv->regmap, AN8855_ATRDS,
> +					   FIELD_PREP(AN8855_ATRD_SEL, i));
> +			if (ret)
> +				break;
> +			/* wait 1ms for the bank entry to be filled */
> +			usleep_range(1000, 1500);

[Severity: High]
Can this loop cause a denial of service on switch control operations?

For up to 2048 FDB entries, the function executes an unconditional
usleep_range(1000, 1500) per populated bank entry. Since the entire
polling loop is protected by priv->reg_mutex, this could stall all other
control requests (link state changes, VLAN config, etc.) that need the
global hardware mutex for over 2 seconds.

[ ... ]
> +static int an8855_phylink_mac_enable_tx_lpi(struct phylink_config *confi=
g,
> +					    u32 timer, bool tx_clock_stop)
> +{
[ ... ]
> +	if (timer) {
> +		int i;
> +
> +		/* Save requested timer and search the highest one */
> +		priv->tx_lpi_timer_ports[dp->index] =3D timer;
> +		for (i =3D 0; i < AN8855_NUM_PORTS; i++) {
> +			if (!priv->ports[i].enable)
> +				continue;
> +
> +			if (i =3D=3D dp->index)
> +				continue;
> +
> +			if (timer < priv->tx_lpi_timer_ports[i])
> +				timer =3D priv->tx_lpi_timer_ports[i];
> +		}

[Severity: Medium]
Does this loop read and write shared per-port state without synchronization?

Because phylink can call this function concurrently for different ports
on multiple CPUs, locklessly accessing priv->tx_lpi_timer_ports could
result in a race condition where CPUs read stale timer states from each
other, leading to a miscalculated global LPI timer being written to the
hardware.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911225414.2259=
80-1-ansuelsmth@gmail.com?part=3D9
