Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336079;
	b=sX9K4WGOu/TLWWsxgBcKYTeFEEFElg2c52gnr+fQuydaZCeOhstnwqzeU7az154tyoG3
	 SqENYR4xTWYzYC5qYZlk9pGiR/F6FfEORnkAKOC89IDwjjVSatn3X8G4eYIwjVVmUgn5M
	 H59m2qqewl1Fj7cRxH/5KXtuP5QkJrr8KmajO+uNMA0gRhHH5gyoik61rACjvhWA6JWbd
	 chzQsYq5RRrkkIy+a9yH7Bm1PKtsqDmtRrVXs0FVz/+aqDYNVuc3S0V0knbFAeUBqaje8
	 7p3McVmCxE2bwfW4N2DT/hUkoOpYXZ63uOxdErjTIl91gKiotxn+GbtOjx1WFriXlUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336079;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SgqjaioKlVh2Fmu3aGv1PXQxPe8l9zzNjUKnKZMDy+U=;
	b=3fUNMjD+9BnkjnA/rO9JN/n+XXF4/cymY6apPkiVIASZpaEPyZpyF95hRipj7gjSBiCF
	 ddMAxJs7E7zCEACW8MuUikV+4wx5ABoPQQ0yLK0OjQ2B1pNKziCAIFSs9JnslMOsANpiq
	 aurKQ24ttDw4ymZo+U0JQpZnVhiouCXjZ1cLRzBtnvC0x5IfSNaNdrZKz2s15idsEnlgW
	 nUWUH4/mrxNl57QhM1+GBvYg4yTL7dxX24CQskUDpBfvAt3dS8FPe4JQZLVH3gJ6k2c1b
	 sAqbq9/TshKaLWgbiER+lahQmpE9wkXQvUMMLS/jJP3a62PnHoqQGn2laXiJY3yiXjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3++V3i4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0707C606A31A;
	Fri, 30 Oct 2026 04:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R3++V3i4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481CF1F000C1;
	Fri, 30 Oct 2026 04:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336078;
	bh=SgqjaioKlVh2Fmu3aGv1PXQxPe8l9zzNjUKnKZMDy+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R3++V3i4LoO2hDwSb2opU99BJ+/YHvpksSYiDYmQECTFpa8pFfDVqajZ3IimUkjrV
	 Zoz9g/wCn4h3v5SvG3cIS5ObpeP96pod1bCxorM7Q7RJUVM2ZfCduc5Px8vdNvaKkF
	 qH9c8i6TjLDFKiO9iOoMlThO90pGvvAqZEnBlvj752X9/vQzwwbxNmetFTeVwP1Oyq
	 soibd1I+8IBeke6gd/j5xKGPKwKYKn+cV9kth+AkynwRpiDJmhDJTlwiMHZm0cHUBs
	 CeQHeR/0VyNwLxYbBJqMllyZKFlyu32aacwemR9Kynsf0h22Fo2ivZS+xzDv3G+b6I
	 DaYWZwUQFnaCw==
Message-ID: <sashiko-outbox-190515@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v22 9/9] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260915123812.14747-10-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
 <20260915123812.14747-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:37 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: dsa: global mutex held during prolonged usleep in FDB dump
- [Medium] net: dsa: duplication of standard network stats in ethtool -S
- [Medium] net: dsa: TOCTOU race in global LPI timer update
- [Low] net: dsa: build failure due to missing NET_DSA_MT7530_LIB select
--

commit fa68dc35bd25774dad4403daf011bd3b273453f6
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver

This commit adds support for the Airoha AN8855 5-Port Gigabit Ethernet swit=
ch.
It implements switch setup, link configuration, FDB management, and statist=
ics
reading using functions exported by the mt7530-lib.

> diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
> index 2af28cb41252c..161331535061e 100644
> --- a/drivers/net/dsa/Kconfig
> +++ b/drivers/net/dsa/Kconfig
[ ... ]
> @@ -24,6 +24,15 @@ config NET_DSA_LOOP
>  	  This enables support for a fake mock-up switch chip which
>  	  exercises the DSA APIs.
> =20
> +config NET_DSA_AN8855
> +	tristate "Airoha AN8855 Ethernet switch support"
> +	depends on MFD_AIROHA_AN8855 || COMPILE_TEST
> +	depends on NET_DSA
> +	select NET_DSA_TAG_AIROHA

[Severity: Low]
Will this driver fail to link if CONFIG_NET_DSA_AN8855 is enabled but
CONFIG_NET_DSA_MT7530_LIB is not? The an8855 driver relies on functions
exported by mt7530-lib.c, so it seems this configuration should explicitly
select NET_DSA_MT7530_LIB to prevent build failures.

> +	help
> +	  This enables support for the Ethernet switch inside the
> +	  Airoha AN8855 chip.
> +
>  source "drivers/net/dsa/hirschmann/Kconfig"
> =20
> diff --git a/drivers/net/dsa/an8855.c b/drivers/net/dsa/an8855.c
> new file mode 100644
> index 0000000000000..e3cd4bd80c6aa
> --- /dev/null
> +++ b/drivers/net/dsa/an8855.c
[ ... ]
> +static const struct mt7530_mib_desc an8855_mib[] =3D {
> +	MIB_DESC(MT7530_MIB_TX_DROP, -1, "TxDrop"),
> +	MIB_DESC(MT7530_MIB_TX_CRC_ERR, -1, "TxCrcErr"),
> +	MIB_DESC(MT7530_MIB_TX_COLLISION, -1, "TxCollision"),
> +	MIB_DESC(AN8855_MIB_TX_OVERSIZE_DROP, -1, "TxOversizeDrop"),

[Severity: Medium]
Are these counters duplicating statistics that already have standard network
representations? The networking subsystem guidelines prohibit exposing
standard counters like TxDrop, TxCrcErr, and TxCollision through the
driver-private ethtool -S interface, especially since they are already
supported via standard mechanisms.

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
[ ... ]
> +	do {
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
Does this sequence severely degrade performance by forcing an artificial
sleep while holding the main driver mutex? Since the loop inside
an8855_port_fdb_dump() can process up to 2048 entries, holding
priv->reg_mutex while sleeping for 1-1.5ms per entry could stall all
other control operations on the switch for over 2 seconds.

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
> +		mutex_unlock(&priv->reg_mutex);
> +
> +		timer /=3D AN8855_TX_LPI_UNIT;
> +		if (FIELD_FIT(AN8855_LPI_TXIDLE_THD_MASK, timer))
> +			val =3D FIELD_PREP(AN8855_LPI_TXIDLE_THD_MASK, timer);
> +		else
> +			val =3D AN8855_LPI_TXIDLE_THD_MASK;
> +
> +		ret =3D regmap_update_bits(priv->regmap, AN8855_CKGCR,
> +					 AN8855_LPI_TXIDLE_THD_MASK, val);

[Severity: Medium]
Can this sequence lead to a race condition where the global LPI timer is
updated to a stale value? By releasing priv->reg_mutex before calling
regmap_update_bits() on the shared AN8855_CKGCR register, two concurrent
updates from different ports might interleave and write an older timer
value over a newer one.

> +		if (ret) {
> +			dev_err(dp->ds->dev, "failed to set global LPI timer\n");
> +			return ret;
> +		}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123812.1474=
7-1-ansuelsmth@gmail.com?part=3D9
