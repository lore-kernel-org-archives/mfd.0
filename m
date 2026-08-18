Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231BC3C0A0A;
	Tue, 18 Aug 2026 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043812; cv=none; b=Dls5pC8Iu1SpaQAGkE3tyV/yyT2Vk31n/qoX8zU6+FQBroDij+hQz66PURhT+2C5NoKmAVW8s5T8RsyRHY+scjtEJxIm3oh1pqUW6/Ih+rHLD/b7R/S1J73W5adJMPOdXtugdGY+lNPRT4cdmEUHm3bzR+N3pZ0kkVcFvXTDSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043812; c=relaxed/simple;
	bh=QCSzAiduTJ6LygUWkuC4Uvl/wT2UyK9YnHotD0Jx8gc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dNoMm0tzReiQ9t8Z4Bok1NYQmZFYyq/q7omlr00V3uGxdFF3wLMG0/ORjSB+nhX0IRXKhWySpaOMhl34FvIM21JoY7OMxbGd61oPCfkiLocyW37Ng6nL9ImOWre61sMnLgJm9QgD26x+MtAQvvrRu5FPqTjIB7loUTsKP68YIsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAX+3uvK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAX+3uvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F751F00A3D;
	Tue, 18 Aug 2026 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043809;
	bh=BTL2+r4qg3hCbocJK7M771rK2vkHTl8kAb+pCCkUWl4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gAX+3uvKSu/jIp9Cfe+q6VUpWtdBB5OebX30aCPtXcIP08P0EQpvCwF5tZ9k+nn7o
	 Mxe/vuXPMbQ1EikH5EujtdbidanGLkOfpY9pQD1NalBfnwV2tYBKkvwEgSCekP4jRB
	 C4pJYWgexqpHxHfYAdQKvMyXaDb5kGYe+/xdQKTCtkvgrm0Efsxc4/BZx/4Hi/eKxD
	 X150KARKa9bFv8k65HmyPCnilYIm7GWoG/8Qhqia6BGabPzm7AAln34SxMQF6DUHRV
	 UKMlVJlRQjj48/GqWsATNPN/iyWGavl0BRtw1RlF3mG9v82nLD0e50f2dKgTRJeexn
	 qZVpn6dbU5FhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 10/10] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260817082034.20326-12-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
 <20260817082034.20326-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:03:28 +0000
Message-Id: <20260818090328.81F751F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Missing mutex unlock on error paths permanently deadlocks `priv->r=
eg_mutex`.
- [High] Kconfig dependency mismatch selects the wrong DSA tag driver, brea=
king switch probe.
- [High] Inverted logic for BR_LEARNING disables hardware MAC address learn=
ing when requested to be enabled.
- [High] Array index of `-1` for `mib->field_high` accesses the `regmap` po=
inter, causing a type confusion kernel panic.
- [High] Kernel panics due to NULL pointer dereferences from missing/uninit=
ialized regmap fields.
- [High] Unprotected lockless access to `dev->phydev` of other ports causes=
 Use-After-Free.
- [Medium] Duplication of standard kernel statistics in private `ethtool -S=
` counters.
- [Medium] Swapped TX and RX histograms in RMON stats mappings.
- [Low] `an8855_get_sset_count` incorrectly returns 0 instead of -EOPNOTSUP=
P for unsupported string sets.
--

--- Patch [10]: [PATCH net-next v20 10/10] net: dsa: Add Airoha AN8855 5-Po=
rt Gigabit DSA Switch driver ---
commit 2771206895bf8d2182821a844b4664df5776fc10
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver

This commit introduces the driver for the Airoha AN8855 5-Port Gigabit
DSA switch. It adds configuration for MAC and PHY settings, ethtool
statistics, bridging, and VLAN capabilities.

> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
> @@ -24,6 +24,15 @@ config NET_DSA_LOOP
[ ... ]
> +config NET_DSA_AN8855
> +	tristate "Airoha AN8855 Ethernet switch support"
> +	depends on MFD_AIROHA_AN8855 || COMPILE_TEST
> +	depends on NET_DSA
> +	select NET_DSA_TAG_MTK

[Severity: High]
Does this config mistakenly select the MTK tagger instead of the AIROHA tag=
ger?

In an8855_get_tag_protocol(), the driver returns DSA_TAG_PROTO_AIROHA. If
NET_DSA_TAG_AIROHA is not independently selected, the required Airoha tagger
won't be compiled, which will cause the switch initialization to abort.

> diff --git a/drivers/net/dsa/an8855.c b/drivers/net/dsa/an8855.c
> --- /dev/null
> +++ b/drivers/net/dsa/an8855.c
> @@ -0,0 +1,1716 @@
[ ... ]
> +static const struct mt7530_reg_field an8855_fields[] =3D {
> +	{ MT7530_BC_FFP, REG_FIELD(AN8855_BCF, 0, 7) },
[ ... ]
> +	{ MT7530_PSC_SA_DIR, REG_FIELD_ID(AN8855_PSC, 4, 4, AN8855_NUM_PORTS, 0=
x200) },

[Severity: High]
Does this inverted logic disable hardware MAC address learning when it shou=
ld
be enabled?

The MT7530_PSC_SA_DIR field is mapped to AN8855_SA_DIS (Source Address
Disable, bit 4). When mt7530_lib_port_bridge_flags() processes the BR_LEARN=
ING
flag, it writes a 1 to this field to enable learning, which instead sets the
disable bit and turns the feature off.

[ ... ]
> +	{ MT7530_MIB_TX_PKT_SZ_512_TO_1023, REG_FIELD_ID(AN8855_PORT_MIB_TX_PKT=
_SZ_512_TO_1023, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ AN8855_MIB_TX_PKT_SZ_1024_TO_1518, REG_FIELD_ID(AN8855_PORT_MIB_RX_PK=
T_SZ_1024_TO_1518, 0, 32, AN8855_NUM_PORTS, 0x200) },
> +	{ AN8855_MIB_TX_PKT_SZ_1519_TO_MAX, REG_FIELD_ID(AN8855_PORT_MIB_RX_PKT=
_SZ_1519_TO_MAX, 0, 32, AN8855_NUM_PORTS, 0x200) },

[Severity: High]
Could the omission of several expected mapping IDs in this array lead to
kernel panics?

The array appears to omit MT7530_MIRROR_EN, MT7530_MIRROR_PORT, and
AN8855_MIB_TX_OVERSIZE_DROP. When mt7530_lib_port_mirror_add() or
an8855_get_ethtool_stats() execute, they will unconditionally read from the=
se
uninitialized pointers, resulting in a NULL pointer dereference.

[ ... ]
> +static const struct mt7530_mib_desc an8855_mib[] =3D {
> +	MIB_DESC(MT7530_MIB_TX_DROP, -1, "TxDrop"),
> +	MIB_DESC(MT7530_MIB_TX_CRC_ERR, -1, "TxCrcErr"),
> +	MIB_DESC(MT7530_MIB_TX_COLLISION, -1, "TxCollision"),

[Severity: Medium]
Does this array add standardized UAPI counters to the private ethtool
statistics?

Standard kernel subsystem rules mandate using the standard UAPI (such as
rtnl_link_stats64 or ethtool_eth_mac_stats) rather than ethtool -S for wide=
ly
standardized counters like TxDrop and TxCollision.

[ ... ]
> +static void an8855_port_fast_age(struct dsa_switch *ds, int port)
> +{
> +	struct an8855_priv *priv =3D ds->priv;
> +	int ret;
> +
> +	mutex_lock(&priv->reg_mutex);
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

[Severity: High]
Can these error paths cause a permanent deadlock on priv->reg_mutex?

If regmap_write() fails, the function returns directly without executing
mutex_unlock(&priv->reg_mutex), deadlocking future driver operations.

[ ... ]
> +static int an8855_get_sset_count(struct dsa_switch *ds, int port,
> +				 int sset)
> +{
> +	if (sset !=3D ETH_SS_STATS)
> +		return 0;
> +
> +	return ARRAY_SIZE(an8855_mib);
> +}

[Severity: Low]
Should this return -EOPNOTSUPP instead of 0 for unsupported string sets?

Standard kernel API rules require returning -EOPNOTSUPP for unsupported
ethtool sets to prevent userspace tools from misinterpreting the capability
as existing but having 0 elements.

[ ... ]
> +static void an8855_get_ethtool_stats(struct dsa_switch *ds, int port,
> +				     uint64_t *data)
> +{
> +	struct an8855_priv *priv =3D ds->priv;
> +	const struct mt7530_mib_desc *mib;
> +	struct mt7530_lib_priv *lib_priv;
> +	int i;
> +
> +	lib_priv =3D &priv->lib_priv;
> +	for (i =3D 0; i < ARRAY_SIZE(an8855_mib); i++) {
> +		mib =3D &an8855_mib[i];
> +
> +		mt7530_lib_read_port_stats(lib_priv->fields[mib->field_low],
> +					   lib_priv->fields[mib->field_high],
> +					   port, data + i);
> +	}
> +}

[Severity: High]
Will passing an array index of -1 for mib->field_high cause a type confusion
kernel panic?

Several MIB definitions pass -1 for field_high. Since the fields array
follows the regmap pointer in struct mt7530_lib_priv, an index of -1
evaluates to the address of the regmap pointer. This disguised pointer will
then be passed to regmap_fields_read(), causing a crash.

[ ... ]
> +static const struct mt7530_rmon_hist an8855_rmon_hist_info =3D {
> +	.ranges_fields =3D (unsigned int []){
> +		MT7530_MIB_TX_PKT_SZ_64,
> +		MT7530_MIB_TX_PKT_SZ_65_TO_127,
> +		MT7530_MIB_TX_PKT_SZ_128_TO_255,
> +		MT7530_MIB_TX_PKT_SZ_256_TO_511,
> +		MT7530_MIB_TX_PKT_SZ_512_TO_1023,
> +		AN8855_MIB_RX_PKT_SZ_1024_TO_1518,
> +		AN8855_MIB_RX_PKT_SZ_1519_TO_MAX,
> +	},
> +	.ranges_tx_fields =3D (unsigned int []){
> +		MT7530_MIB_RX_PKT_SZ_64,
> +		MT7530_MIB_RX_PKT_SZ_65_TO_127,
> +		MT7530_MIB_RX_PKT_SZ_128_TO_255,
> +		MT7530_MIB_RX_PKT_SZ_256_TO_511,
> +		MT7530_MIB_RX_PKT_SZ_512_TO_1023,
> +		AN8855_MIB_RX_PKT_SZ_1024_TO_1518,
> +		AN8855_MIB_RX_PKT_SZ_1519_TO_MAX,
> +	},

[Severity: Medium]
Are the TX and RX histograms swapped in these RMON stats mappings?

The ranges_fields array (intended for RX histograms) is populated with
TX_PKT_SZ register references, while ranges_tx_fields (intended for TX
histograms) is populated with RX_PKT_SZ references.

[ ... ]
> +static void an8855_phylink_mac_link_up(struct phylink_config *config,
> +				       struct phy_device *phydev, unsigned int mode,
> +				       phy_interface_t interface, int speed,
> +				       int duplex, bool tx_pause, bool rx_pause)
> +{
[ ... ]
> +	} else {
> +		reg |=3D AN8855_PMCR_FORCE_MODE | AN8855_PMCR_FORCE_LNK;
> +
> +		reg &=3D ~AN8855_PMCR_FORCE_SPEED;
> +		switch (speed) {
> +		case SPEED_10:
> +			reg |=3D AN8855_PMCR_FORCE_SPEED_10;
> +			break;
> +		case SPEED_100:
> +			reg |=3D AN8855_PMCR_FORCE_SPEED_100;
> +			break;
> +		case SPEED_1000:
> +			reg |=3D AN8855_PMCR_FORCE_SPEED_1000;
> +			break;
> +		case SPEED_2500:
> +			reg |=3D AN8855_PMCR_FORCE_SPEED_2500;
> +			break;
> +		case SPEED_5000:
> +			dev_err(priv->ds->dev, "Missing support for 5G speed. Aborting...\n");
> +			return;
> +		}

[Severity: High]
Does this error path leave priv->reg_mutex permanently locked?

Returning directly in the SPEED_5000 case skips the mutex_unlock() call,
which will deadlock any future driver operations requiring this mutex.

[ ... ]
> +static int an8855_phylink_mac_enable_tx_lpi(struct phylink_config *confi=
g,
> +					    u32 timer, bool tx_clock_stop)
> +{
[ ... ]
> +	if (timer) {
> +		dsa_switch_for_each_user_port(other_dp, ds) {
> +			struct phy_device *phydev;
> +			struct net_device *dev;
> +
> +			if (other_dp =3D=3D dp)
> +				continue;
> +
> +			dev =3D other_dp->user;
> +			if (!dev)
> +				continue;
> +
> +			phydev =3D dev->phydev;
> +			if (!phydev)
> +				continue;
> +
> +			if (timer < phydev->eee_cfg.tx_lpi_timer)
> +				timer =3D phydev->eee_cfg.tx_lpi_timer;
> +		}

[Severity: High]
Can this lockless access to another port's dev->phydev cause a
use-after-free?

Because this function runs without holding the rtnl_lock or any lock
protecting other ports, it is possible for another interface to concurrently
be brought down. If that happens, phy_disconnect() could clear and free that
phydev under rtnl_lock, resulting in this loop accessing freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082034.2032=
6-1-ansuelsmth@gmail.com?part=3D10
