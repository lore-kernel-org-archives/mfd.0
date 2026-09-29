Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D64735C19B;
	Tue, 29 Sep 2026 19:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711558; cv=none; b=FZo5PD7tVIhy4h875wMm7oAplHSSlIJhsN+O8MifCWqTg9jjruhveTl5Q4m12UU8Id14PkKGQCQwYLMnnR9XoogNmc6MKz/jjg+6ZtQPDsUPaVl7FQp+yDLDrVnRrxI8T27SjFZ3ncYLS6/nu0OG8MtEc4LiTsBlejRBsQmQAY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711558; c=relaxed/simple;
	bh=ruQblag6gEYoIm/LU55aNTHK1L0g0rvt1l4KssjqHLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D0G+jtbcEnD/RMEChpgOQR3n/XiS8zqHPrD89ApxbXeIfWT1xls2KKfI1fM1J1sJK8+DynwnZ1FZK4EnV9TGYxe50pnQNsI9c1HZUTZvwYm957ZA93NINGASBnQgsThyEhhOE516BwDiHXqEtIACwaiMMNq2nkTf6ftf81G6s9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hE/kib3j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hE/kib3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2901F00893;
	Tue, 29 Sep 2026 19:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711557;
	bh=lAkjUA3vYheYuAFsBtkHGz/lRl2DbbJs9u0nN9N9ItY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hE/kib3jlXJ5PrpiDn0qc/NzWTtxFeleJvIqR5IC922QoY7wdrAt91ojRdjtNGJUO
	 7cybvV7ZZoaqgsG50py+nYtgAtRtZIaq7V/yrID29wSNDRdpQkEzX5g2pZrClUbPVJ
	 RpImxy0OQKVIMeQ9VJlP7svRWfxDc0LSxir8HF6uEMCQUK/JVNOHkhQLKV/iC0ln86
	 YacK4Wjwd3F0vq07L1oTq2NALMO9IUbw/2xzgRyJ1E1VgFySuwGaCZNKVYVb+P7pg3
	 LWwdj7BEp1ebxi/En0WEExzvSx2NYISBAN17j9LXn7JN7lVw0fn+ds8AJOfoWKVP/7
	 DVnipT4iQGc8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 10/10] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260928194511.41878-11-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
 <20260928194511.41878-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:52:36 +0000
Message-Id: <20260929195236.AA2901F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] net: dsa: an8855: Unconditional sleep in FDB dump loop causes seve=
re latency
- [High] net: dsa: an8855: Missing port matrix hardware synchronization in =
port_enable
- [Medium] net: dsa: an8855: Failure to enable TX LPI mode when timer is no=
n-zero
- [Medium] net: dsa: an8855: FDB dump incorrectly reports static entries as=
 dynamic
- [Medium] net: dsa: an8855: Incorrect jumbo frame size encoding breaks MTU=
 configuration
- [Low] net: dsa: an8855: Duplication of standard MAC statistics in ethtool=
 -S
--

commit 162cbb2c5557815ac251de80602fb068741ed063
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
   =20
Add Airoha AN8855 5-Port Gigabit DSA switch. Switch can support 10M, 100M,
1Gb, 2.5G and 5G Ethernet Speed but 5G is currently error out as it's not
currently supported as requires additional configuration for the PCS.

> diff --git a/drivers/net/dsa/mediatek/an8855.c b/drivers/net/dsa/mediatek=
/an8855.c
> index 0000000000000..b4b02b7cb6eb8 100644
> --- /dev/null
> +++ b/drivers/net/dsa/mediatek/an8855.c
> @@ -0,0 +1,1741 @@
[ ... ]
> +static const struct mt7530_mib_desc an8855_mib[] =3D {
> +	MIB_DESC(MT7530_MIB_TX_DROP, -1, "TxDrop"),
> +	MIB_DESC(MT7530_MIB_TX_CRC_ERR, -1, "TxCrcErr"),
> +	MIB_DESC(MT7530_MIB_TX_COLLISION, -1, "TxCollision"),
> +	MIB_DESC(AN8855_MIB_TX_OVERSIZE_DROP, -1, "TxOversizeDrop"),

[Severity: Low]
Is it necessary to include these standard statistics in the private ethtool=
=20
strings?=20

The networking core guidelines recommend avoiding duplication in ethtool -S=
=20
for counters that already have a standard uAPI (e.g., exposed via=20
rtnl_link_stats64 or get_eth_mac_stats).

[ ... ]
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

[Severity: High]
Does this loop introduce too much latency?=20

Since the loop processes up to 2048 records and sleeps unconditionally for=
=20
1000-1500us on every valid bank entry while holding priv->reg_mutex, a full=
=20
FDB dump could block all ATU/VLAN and port configurations for more than 2=20
seconds.=20

Can this be refactored to poll hardware readiness instead of relying on a=20
hardcoded sleep?

[ ... ]
> +static int an8855_port_enable(struct dsa_switch *ds, int port,
> +			      struct phy_device *phy)
> +{
> +	struct an8855_priv *priv =3D ds->priv;
> +	int ret;
> +
> +	mutex_lock(&priv->reg_mutex);
> +	priv->ports[port].enable =3D true;
> +	ret =3D regmap_set_bits(priv->regmap, AN8855_PMCR_P(port),
> +			      AN8855_PMCR_TX_EN | AN8855_PMCR_RX_EN);
> +	mutex_unlock(&priv->reg_mutex);
> +
> +	return ret;
> +}

[Severity: High]
Can a port added to a bridge while administratively down become permanently=
=20
isolated when brought up?=20

When a port is disabled, mt7530_update_port_member() defers writing the=20
updated pm matrix to the hardware. Here in an8855_port_enable(), the port=20
is enabled but the synchronized priv->ports[port].pm matrix is not written=
=20
to AN8855_PORTMATRIX, which leaves the port disconnected.

[ ... ]
> +static int an8855_phylink_mac_enable_tx_lpi(struct phylink_config *confi=
g,
> +					    u32 timer, bool tx_clock_stop)
> +{
[ ... ]
> +	if (timer) {
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
> +		if (ret) {
> +			dev_err(dp->ds->dev, "failed to enable LPI for port %d\n",
> +				port);
> +			return ret;
> +		}
> +	}
> +
> +	mutex_lock(&priv->reg_mutex);
> +	ret =3D regmap_set_bits(priv->regmap, AN8855_PMCR_P(port),
> +			      AN8855_PMCR_FORCE_EEE1G |
> +			      AN8855_PMCR_FORCE_EEE100);
> +	mutex_unlock(&priv->reg_mutex);

[Severity: Medium]
Will TX LPI mode fail to enable if a custom idle timer is passed?=20

When timer !=3D 0, the branch updates the global threshold in AN8855_CKGCR=
=20
but completely skips setting the AN8855_LPI_MODE_EN bit for the port via=20
AN8855_PMEEECR_P.=20

Since the disable path clears this bit, failing to set it here means the=20
power-saving mode won't actually be enabled.

> diff --git a/drivers/net/dsa/mediatek/an8855.h b/drivers/net/dsa/mediatek=
/an8855.h
> index 0000000000000..85003e5684509 100644
> --- /dev/null
> +++ b/drivers/net/dsa/mediatek/an8855.h
> @@ -0,0 +1,755 @@
[ ... ]
> +#define   AN8855_MAX_RX_JUMBO_12K	FIELD_PREP_CONST(AN8855_MAX_RX_JUMBO, =
0xa)
> +#define   AN8855_MAX_RX_JUMBO_15K	FIELD_PREP_CONST(AN8855_MAX_RX_JUMBO, =
0xb)
> +#define   AN8855_MAX_RX_JUMBO_16K	FIELD_PREP_CONST(AN8855_MAX_RX_JUMBO, =
0xc)

[Severity: Medium]
Is it possible that jumbo frame MTU configuration will break for frames=20
>=3D 12K?=20

The shared MT7530 library computes the jumbo size encoding using a linear=20
division: DIV_ROUND_UP(length, 1024). For a 15K frame, this produces 0xF.=20

However, the AN8855 hardware uses a custom non-linear encoding where 15K=20
is 0xB. Passing 0xF will program an invalid or undefined value to the=20
hardware, causing reception of jumbo frames to fail.

> diff --git a/drivers/net/dsa/mediatek/mt7530-lib.c b/drivers/net/dsa/medi=
atek/mt7530-lib.c
> index 098dd45d3ee9f..4325768033325 100644
> --- a/drivers/net/dsa/mediatek/mt7530-lib.c
> +++ b/drivers/net/dsa/mediatek/mt7530-lib.c
> @@ -483,8 +497,14 @@ void mt7530_lib_fdb_read(struct mt7530_lib_priv *pri=
v, struct mt7530_fdb *fdb)
>  	fdb->mac[1] =3D val;
>  	regmap_field_read(priv->fields[MT7530_ATRD_MAC_BYTE_0], &val);
>  	fdb->mac[0] =3D val;
> -	regmap_field_read(priv->fields[MT7530_ATRD_ENT_STATUS], &val);
> -	fdb->noarp =3D val =3D=3D STATIC_ENT;
> +	if (priv->fields[MT7530_ATRD_ENT_STATUS]) {
> +		regmap_field_read(priv->fields[MT7530_ATRD_ENT_STATUS], &val);
> +		fdb->noarp =3D val =3D=3D STATIC_ENT;
> +	}
> +	if (priv->fields[AN8855_ATRD_ARP]) {
> +		regmap_field_read(priv->fields[AN8855_ATRD_ARP], &val);
> +		fdb->noarp =3D !!val;
> +	}
>  }

[Severity: Medium]
Will this incorrectly report static entries as dynamic during an FDB dump?

The read path evaluates fdb->noarp from the AN8855_ATRD_ARP field. However,=
=20
when writing a static entry, the type is set via AN8855_ATWD_TYPE (0 for=20
static) and no ARP field is manipulated.=20

Because this reads an unrelated ARP field instead of the TYPE field,=20
an8855_port_fdb_dump() will falsely compute and report the static flag to=20
the bridge.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928194511.4187=
8-1-ansuelsmth@gmail.com?part=3D10
