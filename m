Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2101A373BFE;
	Sat, 10 Oct 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648705; cv=none; b=il6jWnV9PnY8ozOr0y9m+Bg1MBc7MQp5PHEnqwXdN/xpK/H0KvyvKA6WWbIxrQEbfakK67v7W49Uh6yQjP5dq0By9ki8truPCM9eEG7WDBG0ptwYNobLKpO4Qog8HM/M9smIQ5D3dsZNhvDjPrurQw/wh8s88SxAQC6PME+0Qoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648705; c=relaxed/simple;
	bh=NbwzkmffJAv8xlQ7bu0fGCCu1ptRWqScCSZBMmbX4hE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=offa/0w5vUtC7MLWYclt8TuEaL4ZXViljtkxYipn1GnaNJe5m5rkO6ZSMHdZXcb3RWHLLLCUv8DENzxmlwoPXORd4sUcdbvv/tuMhtWBVMowheRMmTddFux/fhgYn642bCrX4nn94YUgrUxTV55yEtyp2LuH0vEadRX327UfJKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WELyDbkM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WELyDbkM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577A41F00893;
	Sat, 10 Oct 2026 16:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791648703;
	bh=Mu8UZbE7uEwECuMp+KVX/mOhDvdLcakOdVaJhklDWHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WELyDbkMl5e1OKk+hGR365Mv66yon69HuDgBifk6l0acuP3cp1irRa/rYQ8/Psw+/
	 pe3unXtQ5jjez/G8E6cakHw9iQlN3Os3L1n/HmAnU//wXd4H1e87T/lqEf+O1ppZZR
	 n4C5/k3EYPfVILtZJfMvbMeoM4cjmaZVs11IaH+Z9H+t3UT4hof67nwi9uH1yFHqKh
	 K/jmkew0p0InPVhzmRFZm8n2R9BrHKfI3Ka/FrUdlnETYg4bdOSpHdA+q7T1Fn5BHH
	 1cXrRdAZcS770ywFnWeHFWT7aKLUW0WaDdunObSHA4SggqKifKVTXGJfcxzRv2f+Bg
	 FHzi76qSqAErA==
Message-ID: <sashiko-outbox-166723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 10/10] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261009161102.38961-11-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:11:42 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] net: dsa: an8855: Port matrix is unconditionally zeroed out during=
 port_enable
- [Medium] net: dsa: an8855: Unchecked regmap_read in an8855_phylink_mac_li=
nk_up causes silent register corruption
- [Medium] net: dsa: an8855: Uninitialized stack variable read in an8855_po=
rt_fdb_dump()
- [Medium] net: dsa: an8855: an8855_phylink_mac_enable_tx_lpi() leaves stal=
e timer values on immediate LPI
- [Medium] net: dsa: an8855: missing mtu_enforcement_ingress flag allows MT=
U violation
- [Low] net: dsa: an8855: Driver duplicates standard UAPI statistics as pri=
vate ethtool strings
- [Low] net: dsa: an8855: an8855_port_enable() leaves priv->ports[port].ena=
ble true on error
--

commit d3cae945049e5b42ed716ab1ac6797e64ffa036c
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver

This patch adds support for the Airoha AN8855 5-Port Gigabit DSA switch,
including phylink MAC operations and standard switch functions. It supports
multiple port speeds, though 5G speed is currently disabled pending PCS
configuration support.

> diff --git a/drivers/net/dsa/mediatek/an8855.c b/drivers/net/dsa/mediatek=
/an8855.c
> --- /dev/null
> +++ b/drivers/net/dsa/mediatek/an8855.c
> @@ -0,0 +1,1765 @@
[ ... ]
> +static const struct mt7530_mib_desc an8855_mib[] =3D {
> +	MIB_DESC(MT7530_MIB_TX_DROP, -1, "TxDrop"),
> +	MIB_DESC(MT7530_MIB_TX_CRC_ERR, -1, "TxCrcErr"),
> +	MIB_DESC(MT7530_MIB_TX_COLLISION, -1, "TxCollision"),
> +	MIB_DESC(AN8855_MIB_TX_OVERSIZE_DROP, -1, "TxOversizeDrop"),

[Severity: Low]
Is it necessary to expose these standard hardware counters through
driver-private ethtool strings? The driver already implements the standard
.get_eth_mac_stats interface. Exposing values like TxDrop and TxCrcErr
via ethtool -S duplicates standard UAPI statistics, which goes against the
Networking Drivers guidelines for standard statistics.

[ ... ]
> +static int an8855_port_fdb_dump(struct dsa_switch *ds, int port,
> +				dsa_fdb_dump_cb_t *cb, void *data)
> +{
> +	struct an8855_priv *priv =3D ds->priv;
> +	int banks, count =3D 0;
> +	u32 rsp;
> +	int ret;
> +	int i;
> +
> +	mutex_lock(&priv->reg_mutex);
> +
> +	/* Load search port */
> +	ret =3D regmap_write(priv->regmap, AN8855_ATWD2,
> +			   FIELD_PREP(AN8855_ATWD2_PORT, BIT(port)));
> +	if (ret)
> +		goto exit;
> +	ret =3D mt7530_lib_fdb_cmd(&priv->lib_priv, MT7530_FDB_START,
> +				 AN8855_FDB_MAT_MAC_PORT, &rsp);
> +	if (ret < 0)
> +		goto exit;
> +
> +	do {
> +		/* From response get the number of banks to read, exit if 0 */
> +		banks =3D FIELD_GET(AN8855_ATC_HIT, rsp);

[Severity: Medium]
Could this read an uninitialized stack value? If mt7530_lib_fdb_cmd()
succeeds but the final regmap_field_read(..., rsp) inside it fails, the
function returns 0 without populating rsp. This would leave rsp
uninitialized here, leading to unpredictable loop behavior when parsing FDB
entries.

[ ... ]
> +static void an8855_phylink_mac_link_up(struct phylink_config *config,
> +				       struct phy_device *phydev, unsigned int mode,
> +				       phy_interface_t interface, int speed,
> +				       int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct dsa_port *dp =3D dsa_phylink_to_port(config);
> +	struct an8855_priv *priv =3D dp->ds->priv;
> +	int port =3D dp->index;
> +	u32 reg =3D 0;
> +
> +	mutex_lock(&priv->reg_mutex);
> +
> +	regmap_read(priv->regmap, AN8855_PMCR_P(port), &reg);

[Severity: Medium]
What happens if this regmap_read() fails? The return value is not checked,
so reg would remain 0. The function then sets specific bits (speed, duplex,
TX_EN, RX_EN) and writes it back, which could silently overwrite and
corrupt other configuration bits (like MAC mode or backoff settings) that
were configured in an8855_phylink_mac_config().

[ ... ]
> +static int an8855_port_enable(struct dsa_switch *ds, int port,
> +			      struct phy_device *phy)
> +{
> +	struct dsa_port *dp =3D dsa_to_port(ds, port);
> +	struct an8855_priv *priv =3D ds->priv;
> +	int ret;
> +
> +	mutex_lock(&priv->reg_mutex);
> +
> +	/* Allow the user port gets connected to the cpu port and also
> +	 * restore the port matrix if the port is the member of a certain
> +	 * bridge.
> +	 */
> +	if (dsa_port_is_user(dp)) {
> +		struct dsa_port *cpu_dp =3D dp->cpu_dp;
> +
> +		priv->ports[port].pm |=3D BIT(cpu_dp->index);
> +	}
> +	priv->ports[port].enable =3D true;
> +	ret =3D regmap_fields_write(priv->lib_priv.fields[MT7530_PCR_MATRIX],
> +				  port, 0);

[Severity: High]
Should this be passing priv->ports[port].pm instead of 0? Writing the
literal 0 disables the port's forwarding matrix in hardware, effectively
isolating the port and dropping all forwarded traffic, rather than
applying the port matrix computed just above.

[Severity: Low]
Also, if this regmap_fields_write() fails, the function jumps to the exit
label and returns an error without reverting priv->ports[port].enable back
to false. Can this desynchronize the software state from the hardware state
and cause issues in loops that check priv->ports[i].enable (such as the LPI
timer calculation)?

> +	if (ret)
> +		goto exit;
> +
> +	ret =3D regmap_set_bits(priv->regmap, AN8855_PMCR_P(port),
> +			      AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN);
> +
> +exit:
> +	mutex_unlock(&priv->reg_mutex);
> +
> +	return ret;
> +}
[ ... ]
> +static int an8855_setup(struct dsa_switch *ds)
> +{
[ ... ]
> +	/* Set min a max ageing value supported */
> +	ds->ageing_time_min =3D AN8855_L2_AGING_MS_CONSTANT;
> +	ds->ageing_time_max =3D FIELD_MAX(AN8855_AGE_CNT) *
> +			      FIELD_MAX(AN8855_AGE_UNIT) *
> +			      AN8855_L2_AGING_MS_CONSTANT;
> +
> +	/* User reported problem with WiFi roaming and
> +	 * ethernet port. Enabling assisted learning fix
> +	 * the issue.
> +	 */
> +	ds->assisted_learning_on_cpu_port =3D true;
> +
> +	return 0;
> +}

[Severity: Medium]
Does this switch require the mtu_enforcement_ingress flag to be set here?
Because mt7530_lib_port_change_mtu() configures the MTU limit globally
based on the CPU port's requested MTU, user ports configured with smaller
MTUs might accept oversized frames. Setting ds->mtu_enforcement_ingress =3D
true would let the DSA core normalize bridged port MTUs.

[ ... ]
> +static int an8855_phylink_mac_enable_tx_lpi(struct phylink_config *confi=
g,
> +					    u32 timer, bool tx_clock_stop)
> +{
[ ... ]
> +		ret =3D regmap_update_bits(priv->regmap, AN8855_CKGCR,
> +					 AN8855_LPI_TXIDLE_THD_MASK, val);
> +		mutex_unlock(&priv->reg_mutex);
> +		if (ret) {
> +			dev_err(dp->ds->dev, "failed to set global LPI timer\n");
> +			return ret;
> +		}
> +	} else {
> +		ret =3D regmap_set_bits(priv->regmap, AN8855_PMEEECR_P(port),
> +				      AN8855_LPI_MODE_EN);

[Severity: Medium]
If timer =3D=3D 0 is requested to enter LPI immediately, the software array
priv->tx_lpi_timer_ports[port] is not updated to 0. If the port previously
had a non-zero timer, won't this leave a stale value in the array? Because
the global LPI timer is derived from the maximum of all enabled ports, a
stale non-zero value here could artificially inflate the global threshold.

> +		if (ret) {
> +			dev_err(dp->ds->dev, "failed to enable LPI for port %d\n",
> +				port);
> +			return ret;
> +		}
> +	}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009161102.3896=
1-1-ansuelsmth@gmail.com?part=3D10
