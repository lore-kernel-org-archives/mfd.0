Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBF837475D;
	Sat, 26 Sep 2026 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447125; cv=none; b=Opt6SF7druOMZ7Fjlvw91yfMCkdbCrH+336zimwDJ5WZ/P1WAShbklogjeuZHEVdnXPnmMSuJoETkZQ3eV/Og4C2VBwKtlco0liL9s3KTr13n3HN5z1yfumZ5aRdzwAfkEE9E3ozKrSxW0MTyedf+2uYaPFyNeLEeQiucRIUVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447125; c=relaxed/simple;
	bh=cSGYZ4iRzYIzkROkCJCf2K8Zt+ITJs4v4VrmhjT7HGo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PPg5a9dpzGX63gBn2teEXkGnn09Ro2TIbHcvjpzwPeKUfeN/17V+T8BcIV3fSmYZcBx4qPVjaBIzvIgRkBpB+Ncrco2NaH6OT+fWJpbJ19g2ySjAI+qLaIuqL/LFEswGzMMCjZ74awb0NfmtrR61i7aHIX6meWYk5TkcfiL7eC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/YQzjIL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/YQzjIL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB681F00893;
	Sat, 26 Sep 2026 18:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790447124;
	bh=WQv8vQl/6ZojOjKneTDgAF1wt1VjvFZr9m5igK5iNPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/YQzjILW8bkMklU9ZBnuIDDgF9k2SCpcYbgtg1oB8bIqDY0JxqdBVG+t0ktdXk9N
	 7RokQc3Ajmaa/SzBLWX0HMeG7cNROKjPfgomKN/hVVNkdZWfkWXeFqKO64qOFTVnhG
	 oyN554dDUCIdtOISu/T0C5kTAyIy0WVj9fmdcdcYziTKqCZ2WUkImrI7oHx28p2fBF
	 Nwl6mlYyQQs9bvZQZQy1fz1ZWxHVQWn3tHKxHxviP9sSEhqK+VOKBLI5Ls0Y2AmWQx
	 wV5zw8pGBjUrDZd9j/5gTzi1rQq0Tj//tY8nMahSIqT+1Y7HAm7CSR35/aqIS/7VOv
	 OmtBmWx7qDfRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 9/9] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260925182435.21207-10-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 18:25:23 +0000
Message-Id: <20260926182523.ACB681F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: dsa: NULL deref in mt7530_lib_fdb_read() due to mismatched fi=
eld check
- [Medium] net: dsa: ethtool -S stat duplication for standard uAPI counters
- [Medium] net: dsa: stale tx_lpi_timer_ports values corrupt global LPI tim=
er calculation
--

commit 6c2fcaf5228ec0a75518542784a8b035277e4900
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver

This introduces the driver for the Airoha AN8855 5-Port Gigabit DSA switch.
It supports multiple Ethernet speeds up to 2.5G and includes necessary
adjustments to the mt7530-lib to support Airoha structures.

> diff --git a/drivers/net/dsa/an8855.c b/drivers/net/dsa/an8855.c
> index 0000000000000..428d7dd85dd80
> --- /dev/null
> +++ b/drivers/net/dsa/an8855.c
[ ... ]
> +static const struct mt7530_mib_desc an8855_mib[] =3D {
> +	MIB_DESC(MT7530_MIB_TX_DROP, -1, "TxDrop"),
> +	MIB_DESC(MT7530_MIB_TX_CRC_ERR, -1, "TxCrcErr"),

[Severity: Medium]
Are these standard networking statistics meant to be duplicated as
driver-private ethtool -S strings here? Standard counters already have a
defined uAPI, and duplicating them in private strings exposes redundant
data to userspace tools.

[ ... ]
> +static void an8855_get_strings(struct dsa_switch *ds, int port,
> +			       u32 stringset, uint8_t *data)
> +{
> +	int i;
> +
> +	if (stringset !=3D ETH_SS_STATS)
> +		return;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(an8855_mib); i++)
> +		ethtool_puts(&data, an8855_mib[i].name);
> +}

[Severity: Medium]
Since the statistics mapped in an8855_mib[] overlap with standard uAPI
counters, doesn't exposing them here violate kernel networking guidelines
for ethtool -S statistics?

[ ... ]
> +static void an8855_phylink_mac_disable_tx_lpi(struct phylink_config *con=
fig)
> +{
> +	struct dsa_port *dp =3D dsa_phylink_to_port(config);
> +	struct an8855_priv *priv =3D dp->ds->priv;
> +	int port =3D dp->index;
> +	int ret;
> +
> +	mutex_lock(&priv->reg_mutex);
> +	ret =3D regmap_clear_bits(priv->regmap, AN8855_PMCR_P(port),
> +				AN8855_PMCR_FORCE_EEE1G |
> +				AN8855_PMCR_FORCE_EEE100);
> +	mutex_unlock(&priv->reg_mutex);

[Severity: Medium]
When EEE is disabled on a port here, shouldn't we also clear the software
state for the timer (priv->tx_lpi_timer_ports[port] =3D 0)?=20

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
> +		mutex_lock(&priv->reg_mutex);
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
Because an8855_phylink_mac_disable_tx_lpi() doesn't clear the port's softwa=
re
timer state, couldn't this loop evaluate stale timer values from ports where
EEE was previously disabled? Could this corrupt the global LPI timer
calculation?

> diff --git a/drivers/net/dsa/mt7530-lib.c b/drivers/net/dsa/mt7530-lib.c
> index 098dd45d3ee9f..cf474faf8ed6a 100644
> --- a/drivers/net/dsa/mt7530-lib.c
> +++ b/drivers/net/dsa/mt7530-lib.c
[ ... ]
> @@ -483,8 +497,14 @@ void mt7530_lib_fdb_read(struct mt7530_lib_priv *pri=
v, struct mt7530_fdb *fdb)
>  	fdb->mac[1] =3D val;
>  	regmap_field_read(priv->fields[MT7530_ATRD_MAC_BYTE_0], &val);
>  	fdb->mac[0] =3D val;
> -	regmap_field_read(priv->fields[MT7530_ATRD_ENT_STATUS], &val);
> -	fdb->noarp =3D val =3D=3D STATIC_ENT;
> +	if (priv->fields[MT7530_ATWD_ENT_STATUS]) {
> +		regmap_field_read(priv->fields[MT7530_ATRD_ENT_STATUS], &val);

[Severity: High]
Can this cause a NULL pointer dereference? The condition checks if the ATWD=
=20
(write) field exists, but then unconditionally dereferences the ATRD (read)=
=20
field. If a driver populates the ATWD field but omits the ATRD field,=20
wouldn't regmap_field_read() crash?

> +		fdb->noarp =3D val =3D=3D STATIC_ENT;
> +	}
> +	if (priv->fields[AN8855_ATRD_ARP]) {
> +		regmap_field_read(priv->fields[AN8855_ATRD_ARP], &val);
> +		fdb->noarp =3D !!val;
> +	}
>  }
>  EXPORT_SYMBOL_GPL(mt7530_lib_fdb_read);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925182435.2120=
7-1-ansuelsmth@gmail.com?part=3D9
