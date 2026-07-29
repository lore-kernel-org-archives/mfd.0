Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F74230EF63;
	Wed, 29 Jul 2026 17:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345402; cv=none; b=qX7qVCbWFD33mbd5RmCJ9pSxAwDSoabYhT+QoGJXQa4UHuVn+8F5OIkmZnKNZndcw5sLgIm3Og5XpjeyRp1p/XSf70s8U46Y4Ou7u/AKb4kZDjYAVnD/h9K5I3ZwwNagSsFSfy8CIFiyeq1kpjIMDhZibQ2D53TYO+HBYFJzPJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345402; c=relaxed/simple;
	bh=+DyPWtzcfFmutcETAYhRCtDUzvvYcefQY4P4lwl+otM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nedQoNAX+ZWSios12xyRjAdcaACW4knU9a0V2+f+xl/fVj8x7MblG45BJQENfnJGWW0LbUl/OfftSuF9JrIu3WOvP+KCAa4f27gSmEwwZdh4Obu7A9sW9O7bnXlRdYjvJNcuIDL5Wy3bsvwAhY9Lc7ti88aVxtatwQSNVpYlo+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ib/zV6Z9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ib/zV6Z9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39ADD1F000E9;
	Wed, 29 Jul 2026 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345400;
	bh=dN4mPGOUzHtLyvZ88KmPDKB07gSlBUBbIWLbOSZi64A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ib/zV6Z94d6gdS++s4swz9cJNqIMxvIpqvizmPEPUdTrMCcjyhbZUQmUvukVwnJ4E
	 nc7cJd5jLxz5txHrpst2GaRcf33q2O5Yn4x6VDSTRLmtMXoBx1bu9gsFTWqQ1nWL+S
	 Uh3d28VzjsAyztnTnDenPrkUEgF2kHlt7RYb+lL6gW7itS0GIByhPTTZn0I/wf7g6f
	 zIGUZZeGgUFwRykFZNcsC4cQgamWFUdmp1IRaEKI65Oiikfr/5sSZCTqA7h1nce4ZN
	 0MYd3NXAXQQ2/U5uwjBvQVplY0hgEiI4vZqcIrix2OwDjZHsnoxAgB6IYBOijKkQFf
	 gi9Eq0nNpeRog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 10/10] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728154846.1828945-11-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:16:39 +0000
Message-Id: <20260729171640.39ADD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Unprotected access to `dev->phydev` and inverted logic in `an8855_=
phylink_mac_enable_tx_lpi`.
- [High] FDB flush operations run without the required register mutex, raci=
ng with concurrent FDB interactions.
- [High] Incorrect maths logic in `an8855_set_ageing_time` leads to registe=
r field overflow and heavily misconfigured switch aging time.
- [High] Failure to propagate the error code in `an8855_port_fdb_dump()` le=
ads to silent dump truncations and spurious infinite looping.
- [High] Missing and incorrectly mapped `regmap_field` entries lead to unin=
itialized pointers, causing a kernel crash when configuring port mirroring =
or reading statistics.
- [High] Ignoring the return value of `regmap_read()` leads to using uninit=
ialized stack variables.
- [High] Torn updates on the PMCR register due to bypassed regmap locking.
- [Medium] TX flow control enablement incorrectly checks `rx_pause` instead=
 of `tx_pause`.
- [Medium] The driver duplicates standard UAPI networking statistics into d=
river-private `ethtool -S` strings.
- [Medium] Writing an undocumented, invalid Jumbo Frame register value for =
MTUs larger than 12K.
--

--- Patch [10]: [PATCH net-next v19 10/10] net: dsa: Add Airoha AN8855 5-Po=
rt Gigabit DSA Switch driver ---
commit 95a1bba0a8e59d58da6f98ffbe49372121797adc
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver

Add Airoha AN8855 5-Port Gigabit DSA switch. Switch can support
10M, 100M, 1Gb, 2.5G and 5G Ethernet Speed but 5G is currently error out
as it's not currently supported as requires additional configuration for
the PCS.

> diff --git a/drivers/net/dsa/an8855.c b/drivers/net/dsa/an8855.c
> new file mode 100644
> index 0000000000000..be4d78fa278fa
> --- /dev/null
> +++ b/drivers/net/dsa/an8855.c
> @@ -0,0 +1,1682 @@
[ ... ]
> +static const struct mt7530_reg_field an8855_fields[] =3D {
[ ... ]
> +	{ MT7530_MIB_TX_PKT_SZ_512_TO_1023, REG_FIELD_ID(AN8855_PORT_MIB_TX_PKT=
_SZ_512_TO_1023, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ AN8855_MIB_TX_PKT_SZ_1024_TO_1518, REG_FIELD_ID(AN8855_PORT_MIB_TX_PK=
T_SZ_1024_TO_1518, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ AN8855_MIB_TX_PKT_SZ_1519_TO_MAX, REG_FIELD_ID(AN8855_PORT_MIB_TX_PKT=
_SZ_1519_TO_MAX, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ MT7530_MIB_TX_BYTES_LOW, REG_FIELD_ID(AN8855_PORT_MIB_TX_BYTES_LOW, 0=
, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ MT7530_MIB_TX_BYTES_HIGH, REG_FIELD_ID(AN8855_PORT_MIB_TX_BYTES_HIGH,=
 0, 32, AN8855_NUM_PORTS, 0x200) },
[ ... ]
> +	{ MT7530_MIB_RX_PKT_SZ_256_TO_511, REG_FIELD_ID(AN8855_PORT_MIB_RX_PKT_=
SZ_256_TO_511, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ MT7530_MIB_RX_PKT_SZ_512_TO_1023, REG_FIELD_ID(AN8855_PORT_MIB_RX_PKT=
_SZ_512_TO_1023, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ AN8855_MIB_TX_PKT_SZ_1024_TO_1518, REG_FIELD_ID(AN8855_PORT_MIB_RX_PK=
T_SZ_1024_TO_1518, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ AN8855_MIB_TX_PKT_SZ_1519_TO_MAX, REG_FIELD_ID(AN8855_PORT_MIB_RX_PKT=
_SZ_1519_TO_MAX, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ MT7530_MIB_RX_BYTES_LOW, REG_FIELD_ID(AN8855_PORT_MIB_RX_BYTES_LOW, 0=
, 32, AN8855_NUM_PORTS, 0x200) },

[Severity: High]
Are there missing or incorrectly mapped regmap_field entries here?

The array omits required mappings for MT7530_MIRROR_EN and MT7530_MIRROR_PO=
RT.
Also, it looks like AN8855_MIB_TX_PKT_SZ_1024_TO_1518 is mapped twice, once
here to an RX register, leaving the corresponding RX slot uninitialized.

Could this result in a NULL pointer dereference when userspace queries
ethtool/RMON statistics or configures mirroring?

> +	{ MT7530_MIB_RX_BYTES_HIGH, REG_FIELD_ID(AN8855_PORT_MIB_RX_BYTES_HIGH,=
 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ MT7530_MIB_RX_CTRL_DROP, REG_FIELD_ID(AN8855_PORT_MIB_RX_CTRL_DROP, 0=
, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ MT7530_MIB_RX_INGRESS_DROP, REG_FIELD_ID(AN8855_PORT_MIB_RX_INGRESS_D=
ROP, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ MT7530_MIB_RX_ARL_DROP, REG_FIELD_ID(AN8855_PORT_MIB_RX_ARL_DROP, 0, =
32, AN8855_NUM_PORTS, 0x200) },
> +};
> +
> +static const struct mt7530_mib_desc an8855_mib[] =3D {
> +	MIB_DESC(MT7530_MIB_TX_DROP, -1, "TxDrop"),
> +	MIB_DESC(MT7530_MIB_TX_CRC_ERR, -1, "TxCrcErr"),
> +	MIB_DESC(MT7530_MIB_TX_COLLISION, -1, "TxCollision"),
> +	MIB_DESC(AN8855_MIB_TX_OVERSIZE_DROP, -1, "TxOversizeDrop"),

[Severity: Medium]
Does this array duplicate standard UAPI networking statistics into driver
private ethtool strings?

Standard practice suggests that statistics with existing standard UAPIs
(like TxDrop, TxCrcErr, etc.) should use standard interfaces instead of
being manually exposed via ethtool -S.

Could these standard counters be removed to prevent bloating the ethtool
interface?

[ ... ]
> +static void an8855_port_fast_age(struct dsa_switch *ds, int port)
> +{
> +	struct an8855_priv *priv =3D ds->priv;
> +	int ret;
> +
> +	/* Set to clean Dynamic entry */
> +	ret =3D regmap_write(priv->regmap, AN8855_ATA2, AN8855_ATA2_TYPE);
> +	if (ret) {
> +		dev_err(priv->ds->dev, "failed to update ATA2 reg: %d\n", ret);
> +		return;
> +	}
> +
> +	/* Set Port */
> +	ret =3D regmap_write(priv->regmap, AN8855_ATWD2,
> +			   FIELD_PREP(AN8855_ATWD2_PORT, BIT(port)));
> +	if (ret) {
> +		dev_err(priv->ds->dev, "failed to update ATWD2 reg: %d\n", ret);
> +		return;
> +	}
> +
> +	/* Flush Dynamic entry at port */
> +	ret =3D mt7530_lib_fdb_cmd(&priv->lib_priv, MT7530_FDB_FLUSH,
> +				 AN8855_FDB_MAT_MAC_TYPE_PORT, NULL);

[Severity: High]
Are these indirect FDB register writes vulnerable to concurrent access?

We modify shared indirect FDB registers (AN8855_ATA2 and AN8855_ATWD2) and
then trigger mt7530_lib_fdb_cmd without holding the priv->reg_mutex
synchronization lock here.

Could concurrent FDB reads or writes from other CPU threads overwrite these
indirect registers mid-flight?

> +	if (ret)
> +		dev_err(priv->ds->dev, "failed to send FDB cmd: %d\n", ret);
> +}
> +
[ ... ]
> +static int an8855_set_ageing_time(struct dsa_switch *ds, unsigned int ms=
ecs)
> +{
> +	struct an8855_priv *priv =3D ds->priv;
> +	u32 age_count, age_unit, val;
> +
> +	/* Convert msec in AN8855_L2_AGING_MS_CONSTANT counter */
> +	val =3D msecs / AN8855_L2_AGING_MS_CONSTANT;
> +	/* Derive the count unit */
> +	age_unit =3D val / FIELD_MAX(AN8855_AGE_UNIT);
> +	/* Get the count in unit, age_unit is always incremented by 1 internall=
y */
> +	age_count =3D val / (age_unit + 1);
> +
> +	return regmap_update_bits(priv->regmap, AN8855_AAC,
> +				  AN8855_AGE_CNT | AN8855_AGE_UNIT,
> +				  FIELD_PREP(AN8855_AGE_CNT, age_count) |

[Severity: High]
Is the mathematical logic deriving age_unit and age_count correct?

By dividing val by FIELD_MAX(AN8855_AGE_UNIT), age_count can reach around
2042. However, AN8855_AGE_CNT is a 9-bit field with a maximum of 511.

Did you intend to swap the target division boundaries, dividing by
FIELD_MAX(AN8855_AGE_CNT) instead, to prevent register field overflow during
FIELD_PREP?

> +				  FIELD_PREP(AN8855_AGE_UNIT, age_unit));
> +}
> +
[ ... ]
> +static int an8855_port_fdb_dump(struct dsa_switch *ds, int port,
> +				dsa_fdb_dump_cb_t *cb, void *data)
> +{
[ ... ]
> +	do {
> +		/* From response get the number of banks to read, exit if 0 */
> +		banks =3D FIELD_GET(AN8855_ATC_HIT, rsp);
> +		if (!banks)
> +			break;
> +
> +		/* Each banks have 4 entry */
> +		for (i =3D 0; i < 4; i++) {
> +			struct mt7530_fdb _fdb =3D {  };
> +
> +			count++;
> +
> +			/* Check if bank is present */
> +			if (!(banks & BIT(i)))
> +				continue;
> +
> +			/* Select bank entry index */
> +			ret =3D regmap_write(priv->regmap, AN8855_ATRDS,
> +					   FIELD_PREP(AN8855_ATRD_SEL, i));
> +			if (ret)
> +				break;
> +			/* wait 1ms for the bank entry to be filled */
> +			usleep_range(1000, 1500);
> +			mt7530_lib_fdb_read(&priv->lib_priv, &_fdb);
> +
> +			ret =3D cb(_fdb.mac, _fdb.vid, _fdb.noarp, data);
> +			if (ret < 0)
> +				break;

[Severity: High]
Does this inner loop break correctly handle error propagation?

If the userspace netlink buffer fills, cb() returns a negative error code
and breaks the inner loop.

However, the outer loop fails to check this error, and calls
mt7530_lib_fdb_cmd() which overwrites ret with 0. Will this cause the
driver to spin endlessly until AN8855_NUM_FDB_RECORDS is reached and
silently return 0, truncating the FDB dump?

> +		}
> +
> +		/* Stop if reached max FDB number */
> +		if (count >=3D AN8855_NUM_FDB_RECORDS)
> +			break;
> +
> +		/* Read next bank */
> +		ret =3D mt7530_lib_fdb_cmd(&priv->lib_priv, MT7530_FDB_NEXT,
> +					 AN8855_FDB_MAT_MAC_PORT, &rsp);
> +		if (ret < 0)
> +			break;
> +	} while (true);
[ ... ]
> +static int an8855_port_change_mtu(struct dsa_switch *ds, int port,
> +				  int new_mtu)
> +{
> +	struct an8855_priv *priv =3D ds->priv;
> +
> +	return mt7530_lib_port_change_mtu(&priv->lib_priv, port, new_mtu);

[Severity: Medium]
Can this MT7530 library function safely handle AN8855 jumbo frame
configuration?

The mt7530_lib_port_change_mtu function calculates Jumbo codes using a
linear formula. However, for the AN8855, the jumbo mapping is non-linear
past 9K according to the header definitions (e.g., 12K is 0xa, 15K is 0xb).

If a user configures an MTU larger than 12K, could this write an
undocumented, invalid Jumbo Frame register value?

> +}
> +
[ ... ]
> +static void an8855_phylink_get_caps(struct dsa_switch *ds, int port,
> +				    struct phylink_config *config)
> +{
> +	struct an8855_priv *priv =3D ds->priv;
> +	u32 reg;
> +	int ret;
> +
> +	switch (port) {
[ ... ]
> +	config->mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> +				   MAC_10 | MAC_100 | MAC_1000FD | MAC_2500FD;
> +
> +	ret =3D regmap_read(priv->regmap, AN8855_CKGCR, &reg);
> +	if (ret)
> +		dev_err(ds->dev, "failed to read EEE LPI timer\n");
> +
> +	memcpy(config->lpi_interfaces, config->supported_interfaces,
> +	       sizeof(config->lpi_interfaces));
> +	config->lpi_capabilities =3D MAC_100FD | MAC_1000FD;
> +	/* Global LPI TXIDLE Threshold, default 60ms (unit 2us) */
> +	config->lpi_timer_default =3D FIELD_GET(AN8855_LPI_TXIDLE_THD_MASK, reg=
) *

[Severity: High]
Is the uninitialized stack variable reg used if the regmap_read above fails?

The code logs an error but does not return early. Could this result in
configuring the LPI timers with uninitialized stack garbage?

> +				    AN8855_TX_LPI_UNIT;
> +
> +	config->eee_enabled_default =3D true;
> +}
> +
[ ... ]
> +static void an8855_phylink_mac_link_up(struct phylink_config *config,
> +				       struct phy_device *phydev, unsigned int mode,
> +				       phy_interface_t interface, int speed,
> +				       int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct dsa_port *dp =3D dsa_phylink_to_port(config);
> +	struct an8855_priv *priv =3D dp->ds->priv;
> +	int port =3D dp->index;
> +	u32 reg;
> +
> +	regmap_read(priv->regmap, AN8855_PMCR_P(port), &reg);

[Severity: High]
What happens if this regmap_read fails?

The return value is completely ignored. If it fails, the uninitialized reg
variable will be bitwise-modified and written directly back into the MAC
control register.

> +	if (phylink_autoneg_inband(mode)) {
> +		reg &=3D ~AN8855_PMCR_FORCE_MODE;
> +	} else {
> +		reg |=3D AN8855_PMCR_FORCE_MODE | AN8855_PMCR_FORCE_LNK;
> +
> +		reg &=3D ~AN8855_PMCR_FORCE_SPEED;
> +		switch (speed) {
[ ... ]
> +		reg &=3D ~AN8855_PMCR_FORCE_FDX;
> +		if (duplex =3D=3D DUPLEX_FULL)
> +			reg |=3D AN8855_PMCR_FORCE_FDX;
> +
> +		reg &=3D ~AN8855_PMCR_RX_FC_EN;
> +		if (rx_pause || dsa_port_is_cpu(dp))
> +			reg |=3D AN8855_PMCR_RX_FC_EN;
> +
> +		reg &=3D ~AN8855_PMCR_TX_FC_EN;
> +		if (rx_pause || dsa_port_is_cpu(dp))

[Severity: Medium]
Should this condition check tx_pause instead of rx_pause?

When enabling AN8855_PMCR_TX_FC_EN, the code ignores the tx_pause argument
provided by phylink, which might break TX flow control in asymmetric pause
setups.

> +			reg |=3D AN8855_PMCR_TX_FC_EN;
> +	}
> +
> +	reg |=3D AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN;
> +
> +	regmap_write(priv->regmap, AN8855_PMCR_P(port), reg);

[Severity: High]
Does this read-modify-write sequence bypass regmap locking?

Because the atomic regmap lock is dropped between the regmap_read at the
start of the function and this regmap_write, could concurrent modifications
(like an8855_phylink_mac_enable_tx_lpi using regmap_set_bits) be
irreversibly overwritten?

> +}
> +
[ ... ]
> +static int an8855_phylink_mac_enable_tx_lpi(struct phylink_config *confi=
g,
> +					    u32 timer, bool tx_clock_stop)
> +{
> +	struct dsa_port *dp, *other_dp;
> +	struct an8855_priv *priv;
> +	struct dsa_switch *ds;
> +	int port;
> +	u32 val;
> +	int ret;
> +
> +	dp =3D dsa_phylink_to_port(config);
> +	port =3D dp->index;
> +	ds =3D dp->ds;
> +	priv =3D ds->priv;
> +
> +	/* TX LPI timer is global, find the highest timer
> +	 * across all port.
> +	 * If requested timer is 0, set to enter LPI immediately
> +	 * for the single port.
> +	 */
> +	if (timer) {
> +		dsa_switch_for_each_user_port(other_dp, ds) {
> +			struct phy_device *phydev;
> +			struct net_device *dev;
> +
> +			if (other_dp =3D=3D dp)
> +				continue;
> +
> +			dev =3D other_dp->user;
> +			phydev =3D dev->phydev;
> +
> +			if (timer > phydev->eee_cfg.tx_lpi_timer)

[Severity: High]
Can this lead to a NULL pointer dereference?

The code unconditionally dereferences dev and phydev without checking if
the port is bound to a network device or if a PHY is attached (e.g.,
fixed-link or disabled ports).

Additionally, does the condition timer > phydev->eee_cfg.tx_lpi_timer use
inverted logic? It replaces timer when it is strictly greater, finding the
lowest timer across ports instead of the highest as documented.

> +				timer =3D phydev->eee_cfg.tx_lpi_timer;
> +		}
> +
> +		timer /=3D AN8855_TX_LPI_UNIT;
> +		if (FIELD_FIT(AN8855_LPI_TXIDLE_THD_MASK, timer))
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728154846.1828=
945-1-ansuelsmth@gmail.com?part=3D10
