Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C70311C15;
	Wed, 29 Jul 2026 17:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345402; cv=none; b=qW4YJ9e17aq+vZd1jyRo6nh7hHED6Zd99bgNL9yM1ERm5WwqJJj631ePg1nmlYcQ6DwCu+ql8Hafw12cRX5JMAn2WV5b8iP6h0gvTcYVQU49foO+jxcQW/H81L7/hCMB15rVDtfl0Yb49s7HWrpuFLbUS/F/ojEIT065lYbyGhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345402; c=relaxed/simple;
	bh=E58/MsWG30z4iVSYomoDVvphdg2o4vR/tybRj0vsyfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bymyXX0rerp+jL1I+6tLRXsxsx9KHA6spi9quMEeJQ4KWlB+ka7EMHOUrC0n1X2MZFVyLvKkLDaLgp7Wq967bHdryFXhF2zurZMkRmyOgpjIj+23lsf9EgByIK/kxHRd9TlItOH5WSx/1DOIgcues+oMtGk8G0SIjKEDYlNxayY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJZPIxU+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJZPIxU+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602A31F00A3A;
	Wed, 29 Jul 2026 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345399;
	bh=DBIuJbOxfxho2N6XjMutA7xS17QYdoYNKWe2802+2T4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJZPIxU+C3vzWZyqtT/p2zqf2DbZWwZvCLkrZH0qQp/N4PjxszJhM+tSKDcvefiiN
	 HMBQd0lrFtc4wvhFLUCpM9SP/v2TfpiHaIliaOinWqYfl1saKJcYP1giQi+uI2e3Ap
	 c3eabrv8NVHCIpgmPaFNsObvm4tuGMPtGckpjlaX5rGQVCCO0DGMTpM7pPoe/6B/Gr
	 +TzDwvME3dNJYh1H4p9txifc7HcFcoGtYTvOArOwXrRTEFm+QkfXyYulZB8sNbKFJK
	 HG8lqdmBGDUAzrEgpp+6zXJ7COYpgprSi4wfjxxLsA6kbNFyKtUd8jiTSbvI4K5gVW
	 joLBM678fyCzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 09/10] net: dsa: mt7530: generalize and
 move common function to lib module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260728154846.1828945-10-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:16:39 +0000
Message-Id: <20260729171639.602A31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Negative array indexing (`fields[-1]`) in `mt7530_get_ethtool_=
stats` causes an out-of-bounds read and kernel panic.
- [High] Bridge port MAC learning logic evaluates to zero, permanently enab=
ling learning.
- [High] FDB write operations store corrupted all-zero MAC addresses due to=
 incorrect right-shifting and swapped bit ranges.
- [High] Semantic mismatch in the port matrix (`pm`) cache breaks port enab=
lement and corrupts port control registers.
- [High] MIB counter `REG_FIELD_ID` definitions specify an invalid MSB of 3=
2, triggering undefined behavior in GENMASK on 32-bit platforms.
- [High] A copy-paste error omits the hardware trap configuration for the `=
:03` MAC DA, bypassing IEEE 802.1Q filtering rules.
- [High] Replacing atomic register writes with field-specific RMWs preserve=
s dirty hardware register states during VLAN 0 setup.
- [High] Unchecked regmap field reads leak uninitialized kernel stack memor=
y to userspace and break hardware isolation policies.
- [Medium] TX and RX RMON packet size histograms are incorrectly swapped, r=
eporting TX stats as RX and vice versa.
- [Medium] Multicast packet statistics are incorrectly discarded and never =
reported in `mt7530_read_port_stats64`.
- [Medium] MIB counters are not flushed during initialization because the d=
river writes `0` instead of `1` to the respective flush bits.
--

--- Patch [9]: [PATCH net-next v19 09/10] net: dsa: mt7530: generalize and =
move common function to lib module ---
commit 0ff2707d21a36354cbb42ab9fd85231c636ec13a
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: mt7530: generalize and move common function to lib module

In preparation of support of DSA Switch from Airoha, create a mt7530
library module and move there all the common function.

> diff --git a/drivers/net/dsa/mt7530-lib.c b/drivers/net/dsa/mt7530-lib.c
> new file mode 100644
> index 0000000000000..0ad5f11283e79
> --- /dev/null
> +++ b/drivers/net/dsa/mt7530-lib.c
> @@ -0,0 +1,1094 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/device.h>
> +#include <linux/if_bridge.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <net/dsa.h>
> +
> +#include "mt7530-lib.h"
> +
> +void mt7530_lib_mib_reset(struct mt7530_lib_priv *priv)
> +{
> +	regmap_field_write(priv->fields[MT7530_CCR_MIB_ENABLE], 0);
> +	regmap_field_write(priv->fields[MT7530_CCR_RX_OCT_CNT_GOOD], 0);
> +	regmap_field_write(priv->fields[MT7530_CCR_RX_OCT_CNT_BAD], 0);
> +	regmap_field_write(priv->fields[MT7530_CCR_TX_OCT_CNT_GOOD], 0);
> +	regmap_field_write(priv->fields[MT7530_CCR_TX_OCT_CNT_BAD], 0);

[Severity: Medium]
Does writing 0 here correctly trigger the flush?

The hardware typically requires these specific bits to be asserted (1) to
clear the counters, similar to the original CCR_MIB_FLUSH bitmask.

Writing 0 might leave the flush operation disabled, causing the hardware to
report leftover garbage across reboots.

[ ... ]

> +void mt7530_lib_trap_frames(struct mt7530_lib_priv *priv)
> +{
> +	/* Trap 802.1X PAE frames and BPDUs to the CPU port(s) and egress
> +	 * them with the EG_TAG attribute set to disabled (system default)
> +	 * so that any VLAN tags in the frame are not modified by the
> +	 * switch egress VLAN tag processing. This preserves VLAN tags
> +	 * for reception on VLAN sub-interfaces.
> +	 */
> +	regmap_field_write(priv->fields[MT7530_BPDU_EG_TAG],
> +			   MT7530_VLAN_EG_DISABLED);

[ ... ]

> +	/* Trap frames with :03 and :0E MAC DAs to the CPU port(s) and
> +	 * egress them with EG_TAG disabled.
> +	 */
> +	regmap_field_write(priv->fields[MT7530_R02_BPDU_FR], 1);
> +	regmap_field_write(priv->fields[MT7530_R02_EG_TAG],
> +			   MT7530_VLAN_EG_DISABLED);
> +	regmap_field_write(priv->fields[MT7530_R02_PORT_FW],
> +			   TO_CPU_FW_CPU_ONLY);

[Severity: High]
Is there a copy-paste error here?

The comment mentions trapping :03 and :0E MAC DAs, but the code modifies
MT7530_R02 instead of MT7530_R03.

This leaves the :03 frame trap unconfigured, potentially bypassing IEEE
802.1Q filtering rules.

> +	regmap_field_write(priv->fields[MT7530_R0E_BPDU_FR], 1);
> +	regmap_field_write(priv->fields[MT7530_R0E_EG_TAG],
> +			   MT7530_VLAN_EG_DISABLED);
> +	regmap_field_write(priv->fields[MT7530_R0E_PORT_FW],
> +			   TO_CPU_FW_CPU_ONLY);
> +}
> +EXPORT_SYMBOL_GPL(mt7530_lib_trap_frames);
> +
> +static void mt7530_update_port_member(struct mt7530_lib_priv *priv, int =
port,
> +				      const struct net_device *bridge_dev,
> +				      bool join) __must_hold(priv->reg_mutex)
> +{
> +	struct dsa_port *dp =3D dsa_to_port(priv->ds, port), *other_dp;
> +	struct mt7530_port *p =3D &priv->ports[port], *other_p;
> +	struct dsa_port *cpu_dp =3D dp->cpu_dp;
> +	u32 port_bitmap =3D BIT(cpu_dp->index);
> +	int other_port;
> +	bool isolated;
> +
> +	dsa_switch_for_each_user_port(other_dp, priv->ds) {
> +		other_port =3D other_dp->index;
> +		other_p =3D &priv->ports[other_port];
> +
> +		if (dp =3D=3D other_dp)
> +			continue;
> +
> +		/* Add/remove this port to/from the port matrix of the other
> +		 * ports in the same bridge. If the port is disabled, port
> +		 * matrix is kept and not being setup until the port becomes
> +		 * enabled.
> +		 */
> +		if (!dsa_port_offloads_bridge_dev(other_dp, bridge_dev))
> +			continue;
> +
> +		isolated =3D p->isolated && other_p->isolated;
> +
> +		if (join && !isolated) {
> +			other_p->pm |=3D BIT(port);
> +			port_bitmap |=3D BIT(other_port);
> +		} else {
> +			other_p->pm &=3D ~BIT(port);
> +		}
> +
> +		if (other_p->enable)
> +			regmap_fields_write(priv->fields[MT7530_PCR_MATRIX],
> +					    other_port, other_p->pm);

[Severity: High]
Could this corrupt the port control registers?

The legacy mt7530_port_enable() function (which is still present) stores
pre-shifted values in pm (e.g., PCR_MATRIX(BIT(cpu_dp->index))).

Here, pm is treated as an unshifted bitmask and passed to
regmap_fields_write(), which shifts the entire value left by 16 bits.

This will shift the pre-shifted CPU port bit completely out of bounds
(overflowing to 0) and isolate the port from the CPU.

> +	}
> +
> +	/* Add/remove the all other ports to this port matrix. For !join
> +	 * (leaving the bridge), only the CPU port will remain in the port matr=
ix
> +	 * of this port.
> +	 */
> +	p->pm =3D port_bitmap;
> +	if (priv->ports[port].enable)
> +		regmap_fields_write(priv->fields[MT7530_PCR_MATRIX],
> +				    port, port_bitmap);
> +}
> +
> +void mt7530_lib_read_port_stats(struct regmap_field *low,
> +				struct regmap_field *high,
> +				int port, uint64_t *data)
> +{
> +	u32 val;
> +
> +	regmap_fields_read(low, port, &val);
> +	*data =3D val;

[Severity: High]
What happens if the underlying MDIO bus read fails here?

The return value of regmap_fields_read() is not checked, meaning val could
remain uninitialized.

This would leak kernel stack memory to userspace via ethtool. Similarly, in
mt7530_hw_vlan_update() below, it uses uninitialized stack data to build po=
rt
masks, randomly altering VLAN memberships.

> +
> +	if (high) {
> +		regmap_fields_read(high, port, &val);
> +		*data |=3D (u64)val << 32;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mt7530_lib_read_port_stats);

[ ... ]

> +static void mt7530_lib_fdb_write(struct mt7530_lib_priv *priv, u16 vid,
> +				 u8 port_mask, const u8 *mac,
> +				 u8 aging, u8 type)
> +{
> +	regmap_field_write(priv->fields[MT7530_ATWD_CVID], vid);
> +	regmap_field_write(priv->fields[MT7530_ATWD_IVL], 1);
> +	regmap_field_write(priv->fields[MT7530_ATWD_FID], FID_BRIDGED);
> +	regmap_field_write(priv->fields[MT7530_ATWD_AGE_TIMER], aging);
> +	regmap_field_write(priv->fields[MT7530_ATWD_PORT_MAP], port_mask);
> +	/* STATIC_ENT indicate that entry is static wouldn't
> +	 * be aged out and STATIC_EMP specified as erasing an
> +	 * entry
> +	 */
> +	regmap_field_write(priv->fields[MT7530_ATWD_ENT_STATUS], type);
> +	regmap_field_write(priv->fields[MT7530_ATWD_MAC_BYTE_5],
> +			   mac[5] >> MAC_BYTE_5);

[Severity: High]
Will this result in all-zero MAC addresses being written to the FDB?

The mac array contains 8-bit u8 values. Right-shifting a u8 by MAC_BYTE_5
(which is 16) or MAC_BYTE_4 (which is 24) will always evaluate to 0.

Since regmap_field_write() automatically handles shifting values into their
proper field positions, it seems we should pass the raw mac[x] bytes without
shifting.

> +	regmap_field_write(priv->fields[MT7530_ATWD_MAC_BYTE_4],
> +			   mac[4] >> MAC_BYTE_4);
> +	regmap_field_write(priv->fields[MT7530_ATWD_MAC_BYTE_3],
> +			   mac[3] >> MAC_BYTE_3);

[ ... ]

> +int mt7530_lib_port_bridge_flags(struct mt7530_lib_priv *priv, int port,
> +				 struct switchdev_brport_flags flags,
> +				 struct netlink_ext_ack *extack)
> +{
> +	struct dsa_switch *ds =3D priv->ds;
> +
> +	if (flags.mask & BR_LEARNING)
> +		regmap_fields_write(priv->fields[MT7530_PSC_SA_DIR],
> +				    port, flags.val & BR_LEARNING);

[Severity: High]
Does this write permanently enable MAC learning?

BR_LEARNING is BIT(5) (32). The MT7530_PSC_SA_DIR field is a 1-bit field at
bit 4.

When regmap_fields_write() shifts the value by 4 and masks it with 0x10,
(32 << 4) & 0x10 evaluates to 0.

Additionally, the SA_DIR bit disables learning when set to 1, so writing 0
ensures learning can never be disabled.

> +
> +	if (flags.mask & BR_FLOOD)
> +		regmap_field_update_bits(priv->fields[MT7530_UNU_FFP],
> +					 BIT(port),
> +					 flags.val & BR_FLOOD ? BIT(port) : 0);

[ ... ]

> +static void mt7530_hw_vlan_update(struct mt7530_lib_priv *priv, u16 vid,
> +				  struct mt7530_hw_vlan_entry *entry,
> +				  mt7530_vlan_op vlan_op)
> +{
> +	u32 val;
> +
> +	/* Fetch entry */
> +	mt7530_vlan_cmd(priv, MT7530_VTCR_RD_VID, vid);
> +
> +	regmap_field_read(priv->fields[MT7530_VAWD_PORT_MEM], &val);
> +
> +	entry->old_members =3D val;
> +
> +	/* Manipulate entry */
> +	vlan_op(priv, entry);
> +
> +	/* Flush result to hardware */
> +	mt7530_vlan_cmd(priv, MT7530_VTCR_WR_VID, vid);
> +}

[ ... ]

> +int mt7530_lib_setup_vlan0(struct mt7530_lib_priv *priv)
> +{
> +	regmap_field_write(priv->fields[MT7530_VAWD_IVL_MAC], 1);
> +	regmap_field_write(priv->fields[MT7530_VAWD_EG_CON], 1);

[Severity: High]
Could this leave MT7530_VAWD1 in an inconsistent state?

The original code wrote directly to the MT7530_VAWD1 register, effectively
clearing unspecified bits like VTAG_EN.

Because VAWD1 is a data window that retains the state of the last accessed
VLAN entry, selectively modifying individual fields with read-modify-write
might leave VTAG_EN in an undefined state from a previous operation,
randomly tagging VLAN 0 frames.

> +	regmap_field_write(priv->fields[MT7530_VAWD_PORT_MEM],
> +			   MT7530_ALL_MEMBERS);
> +	regmap_field_write(priv->fields[MT7530_VAWD_FID],
> +			   FID_BRIDGED);

[ ... ]

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 5f56a423b1475..b2d3c71e24e97 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -24,10 +24,159 @@
>  #include <net/pkt_cls.h>
> =20
>  #include "mt7530.h"
> +#include "mt7530-lib.h"
> =20
>  #define MT7530_STATS_POLL_INTERVAL	(1 * HZ)
>  #define MT7530_STATS_RATE_LIMIT		(HZ / 10)
> =20
> +static const struct mt7530_reg_field mt753x_fields[] =3D {
> +	{ MT7530_BC_FFP, REG_FIELD(MT753X_MFC, 24, 31) },
> +	{ MT7530_UNM_FFP, REG_FIELD(MT753X_MFC, 16, 23) },

[ ... ]

> +	{ MT7530_ATWD_ENT_STATUS, REG_FIELD(MT7530_ATWD, 2, 3), },
> +	{ MT7530_ATWD_MAC_BYTE_5, REG_FIELD(MT7530_ATA2, 24, 31), },
> +	{ MT7530_ATWD_MAC_BYTE_4, REG_FIELD(MT7530_ATA2, 16, 23), },

[Severity: High]
Are the bit ranges for MAC_BYTE_4 and MAC_BYTE_5 swapped here?

The original definitions and typical byte ordering suggest MAC_BYTE_5 should
be bits 16-23 and MAC_BYTE_4 should be bits 24-31.

> +	{ MT7530_ATWD_MAC_BYTE_3, REG_FIELD(MT7530_ATA1, 0, 7), },
> +	{ MT7530_ATWD_MAC_BYTE_2, REG_FIELD(MT7530_ATA1, 8, 15), },
> +	{ MT7530_ATWD_MAC_BYTE_1, REG_FIELD(MT7530_ATA1, 16, 23), },

[ ... ]

> +	{ MT7530_GMACCR_MAX_RX_JUMBO, REG_FIELD(MT7530_GMACCR, 2, 5) },
> +	{ MT7530_GMACCR_MAX_RX_PKT_LEN, REG_FIELD(MT7530_GMACCR, 0, 1) },
> +
> +	{ MT7530_MIB_TX_DROP, REG_FIELD_ID(MT7530_PORT_MIB_TX_DROP, 0, 32, MT75=
30_NUM_PORTS, 0x100) },
> +	{ MT7530_MIB_TX_CRC_ERR, REG_FIELD_ID(MT7530_PORT_MIB_TX_CRC_ERR, 0, 32=
, MT7530_NUM_PORTS, 0x100) },

[Severity: High]
Does specifying 32 as the MSB here cause undefined behavior on 32-bit
platforms?

The REG_FIELD_ID macro takes inclusive bounds, so an MSB of 32 results in
GENMASK(32, 0).

On 32-bit architectures, this evaluates to a negative shift count
(~0UL << -1). Should the bound be 0, 31 instead?

> +	{ MT7530_MIB_TX_UNICAST, REG_FIELD_ID(MT7530_PORT_MIB_TX_UNICAST, 0, 32=
, MT7530_NUM_PORTS, 0x100) },
> +	{ MT7530_MIB_TX_MULTICAST, REG_FIELD_ID(MT7530_PORT_MIB_TX_MULTICAST, 0=
, 32, MT7530_NUM_PORTS, 0x100) },
> +	{ MT7530_MIB_TX_BROADCAST, REG_FIELD_ID(MT7530_PORT_MIB_TX_BROADCAST, 0=
, 32, MT7530_NUM_PORTS, 0x100) },

[ ... ]

>  static struct mt753x_pcs *pcs_to_mt753x_pcs(struct phylink_pcs *pcs)
>  {
>  	return container_of(pcs, struct mt753x_pcs, pcs);
> @@ -35,15 +184,15 @@ static struct mt753x_pcs *pcs_to_mt753x_pcs(struct p=
hylink_pcs *pcs)
> =20
>  /* String, offset, and register size in bytes if different from 4 bytes =
*/
>  static const struct mt7530_mib_desc mt7530_mib[] =3D {
> -	MIB_DESC(1, MT7530_PORT_MIB_TX_DROP, "TxDrop"),
> -	MIB_DESC(1, MT7530_PORT_MIB_TX_CRC_ERR, "TxCrcErr"),
> -	MIB_DESC(1, MT7530_PORT_MIB_TX_COLLISION, "TxCollision"),
> -	MIB_DESC(1, MT7530_PORT_MIB_RX_DROP, "RxDrop"),
> -	MIB_DESC(1, MT7530_PORT_MIB_RX_FILTERING, "RxFiltering"),
> -	MIB_DESC(1, MT7530_PORT_MIB_RX_CRC_ERR, "RxCrcErr"),
> -	MIB_DESC(1, MT7530_PORT_MIB_RX_CTRL_DROP, "RxCtrlDrop"),
> -	MIB_DESC(1, MT7530_PORT_MIB_RX_INGRESS_DROP, "RxIngressDrop"),
> -	MIB_DESC(1, MT7530_PORT_MIB_RX_ARL_DROP, "RxArlDrop"),
> +	MIB_DESC(MT7530_MIB_TX_DROP, -1, "TxDrop"),
> +	MIB_DESC(MT7530_MIB_TX_CRC_ERR, -1, "TxCrcErr"),

[ ... ]

> @@ -744,34 +796,22 @@ mt7530_get_strings(struct dsa_switch *ds, int port,=
 u32 stringset,
>  		ethtool_puts(&data, mt7530_mib[i].name);
>  }
> =20
> -static void
> -mt7530_read_port_stats(struct mt7530_priv *priv, int port,
> -		       u32 offset, u8 size, uint64_t *data)
> -{
> -	u32 val, reg =3D MT7530_PORT_MIB_COUNTER(port) + offset;
> -
> -	val =3D mt7530_read(priv, reg);
> -	*data =3D val;
> -
> -	if (size =3D=3D 2) {
> -		val =3D mt7530_read(priv, reg + 4);
> -		*data |=3D (u64)val << 32;
> -	}
> -}
> -
>  static void
>  mt7530_get_ethtool_stats(struct dsa_switch *ds, int port,
>  			 uint64_t *data)
>  {
>  	struct mt7530_priv *priv =3D ds->priv;
>  	const struct mt7530_mib_desc *mib;
> +	struct mt7530_lib_priv *lib_priv;
>  	int i;
> =20
> +	lib_priv =3D &priv->lib_priv;
>  	for (i =3D 0; i < ARRAY_SIZE(mt7530_mib); i++) {
>  		mib =3D &mt7530_mib[i];
> =20
> -		mt7530_read_port_stats(priv, port, mib->offset, mib->size,
> -				       data + i);
> +		mt7530_lib_read_port_stats(lib_priv->fields[mib->field_low],
> +					   lib_priv->fields[mib->field_high],
> +					   port, data + i);

[Severity: Critical]
Will this cause an out-of-bounds read and kernel panic?

The MIB_DESC macro initializes field_high to -1 for 32-bit single-register
counters.

In mt7530_get_ethtool_stats(), this unconditionally accesses
lib_priv->fields[-1], which evaluates to the non-NULL struct regmap pointer.

Passing this invalid regmap_field pointer to mt7530_lib_read_port_stats()
will crash when regmap_fields_read() attempts to dereference it.

>  	}
>  }
> =20

[ ... ]

> +static const struct mt7530_rmon_hist mt7530_rmon_hist_info =3D {
> +	.ranges_fields =3D (unsigned int []){
> +		MT7530_MIB_TX_PKT_SZ_64,
> +		MT7530_MIB_TX_PKT_SZ_65_TO_127,
> +		MT7530_MIB_TX_PKT_SZ_128_TO_255,
> +		MT7530_MIB_TX_PKT_SZ_256_TO_511,
> +		MT7530_MIB_TX_PKT_SZ_512_TO_1023,
> +		MT7530_MIB_TX_PKT_SZ_1024_TO_MAX,
> +	},
> +	.ranges_tx_fields =3D (unsigned int []){
> +		MT7530_MIB_RX_PKT_SZ_64,
> +		MT7530_MIB_RX_PKT_SZ_65_TO_127,
> +		MT7530_MIB_RX_PKT_SZ_128_TO_255,
> +		MT7530_MIB_RX_PKT_SZ_256_TO_511,
> +		MT7530_MIB_RX_PKT_SZ_512_TO_1023,
> +		MT7530_MIB_RX_PKT_SZ_1024_TO_MAX,
> +	},

[Severity: Medium]
Could these arrays be swapped?

The ranges_fields array is populated with TX macros, while ranges_tx_fields
uses RX macros.

When these are mapped later in mt7530_lib_get_rmon_stats(), it appears to
report TX stats as RX and vice versa.

> +	.ranges =3D mt7530_rmon_ranges,
> +	.num_ranges =3D ARRAY_SIZE(mt7530_rmon_ranges) - 1,
> +};
> +
>  static void mt7530_get_rmon_stats(struct dsa_switch *ds, int port,
>  				  struct ethtool_rmon_stats *rmon_stats,
>  				  const struct ethtool_rmon_hist_range **ranges)

[ ... ]

>  static void mt7530_read_port_stats64(struct mt7530_priv *priv, int port,
>  				     struct rtnl_link_stats64 *storage)
>  {
> +	struct mt7530_lib_priv *lib_priv =3D &priv->lib_priv;
>  	uint64_t data;
> =20
>  	/* MIB counter doesn't provide a FramesTransmittedOK but instead
> @@ -903,38 +884,40 @@ static void mt7530_read_port_stats64(struct mt7530_=
priv *priv, int port,
>  	 * To simulate a global frame counter, read Unicast and addition Multic=
ast
>  	 * and Broadcast later
>  	 */
> -	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_UNICAST, 1,
> -			       &storage->rx_packets);
> -	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_MULTICAST, 1,
> -			       &storage->multicast);
> +	mt7530_lib_read_port_stats(lib_priv->fields[MT7530_MIB_RX_UNICAST],
> +				   NULL, port, &storage->rx_packets);
> +	mt7530_lib_read_port_stats(lib_priv->fields[MT7530_MIB_RX_MULTICAST],
> +				   NULL, port, &data);
>  	storage->rx_packets +=3D storage->multicast;

[Severity: Medium]
Does this correctly track multicast packets?

The counter is read into the local variable data, but then the code adds
storage->multicast to rx_packets.

Since storage->multicast is never assigned the read value, it seems the
multicast packet count is lost.

> -	mt7530_read_port_stats(priv, port, MT7530_PORT_MIB_RX_BROADCAST, 1,
> -			       &data);
> +	mt7530_lib_read_port_stats(lib_priv->fields[MT7530_MIB_RX_BROADCAST],
> +				   NULL, port, &data);
>  	storage->rx_packets +=3D data;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728154846.1828=
945-1-ansuelsmth@gmail.com?part=3D9
