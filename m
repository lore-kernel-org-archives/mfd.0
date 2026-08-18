Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250EB3C1D41;
	Tue, 18 Aug 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043811; cv=none; b=g2rHAg31dvSBLsCVqcIE8svgGVuMfxNrTP8MHGHUhiviAd5GAuMjIhi4ymyq75CWh7GLnK/lnNaiJA+7bcZvU3fp7iBd+sD7rZFGreX3nO7V15Fpd/aZCo60WoZP8ncNlhWJLxHUo6Grbswh6OhhLYb5sNR4csQiGyLVoxOwJGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043811; c=relaxed/simple;
	bh=0qKIhQVZW5rKX6B9PXdGr60TQHbTdXb6cP0DGKkgjRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RofLuuIq+ZYBdYG0lK/ZRHa5DMnxJPfKeFzhCMzLyUL4AqknO5z5OSSK8aZOsp2zX8A3wIgDcMs4uMwvFDLgufAC/80YClFUIhL6iXFl9vdHQwjbWf63Qph1hs6NGVqnqZhY8OEp64Rc/ccX99pVnUJKDAyYoDP/Zp1C0W/v1vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxO3UTxr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxO3UTxr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB591F000E9;
	Tue, 18 Aug 2026 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043808;
	bh=bmfE2bMEUbqFNj7kpP5gdt7Evvg+mThSQ1+R6T2QIY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NxO3UTxrixmJgdBX9ZLBaDrkUW9lHxxjg41RpacBVnHAsItakFKl8ciahg98L8hGa
	 u2nK+ZHPF2Dngp/RxtryaR7b5S19HhTsklvTv1VtrPEkwER3muiIJVehcqbCM9BY2N
	 zMZ4Hvra6/AkWf5b2MXoROjpeukoNBRc9uBHaFoBEGMtsd6tUkixAlMoNBB1xdMpBM
	 G7NOcK0XDZUJH3jjP9U6EGqrJLiMQamgiyWOQA0As1pPA3oOGO5+L6rJq71zqRekgL
	 w543VcXmE6faX5z7WuQKVJwGXCUDbf20+Qw8/nIrp0lwUON0JQO4xeGDxbm8AIFvhQ
	 NaXW9cRocSS9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 09/10] net: dsa: mt7530: generalize and
 move common function to lib module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817082034.20326-11-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
 <20260817082034.20326-11-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:03:26 +0000
Message-Id: <20260818090327.4BB591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Unsafe conversion of atomic command register triggers into multipl=
e sequential Read-Modify-Write (RMW) operations.
- [High] Hardware staging registers for FDB and VLAN data will retain stale=
 or garbage bits due to the switch from full-register overwrites to field-b=
ased RMWs.
- [High] `mt7530_port_enable()` incorrectly applies `PCR_MATRIX_MASK` to an=
 unshifted port matrix value, isolating the port and dropping all traffic.
- [High] Missing `reg_fields` initialization for `ID_EN7528` leads to a NUL=
L pointer dereference during port mirroring.
- [High] mt7530_lib_port_bridge_flags() disables MAC address learning when =
it is supposed to be enabled, and vice versa.
- [High] mt7530_lib_fdb_read() swaps the last two bytes of the MAC address =
when reading FDB entries.
- [High] Unchecked regmap_field_read() failures lead to the use of uninitia=
lized stack variables, potentially leaking stack memory to userspace or cor=
rupting hardware state.
- [Medium] `mt7530_lib_mib_reset()` inadvertently disables the hardware MIB=
 counters for octets and breaks the flush sequence by writing 0 instead of =
1.
--

--- Patch [9]: [PATCH net-next v20 09/10] net: dsa: mt7530: generalize and =
move common function to lib module ---
commit 302309065c4dc5c4e0f17f164c9e39732602b582
Author: Christian Marangi <ansuelsmth@gmail.com>

net: dsa: mt7530: generalize and move common function to lib module

This commit moves common functions for the MT7530 switch into a separate
library module to prepare for Airoha support. It refactors register
accesses to use the regmap reg_field API instead of raw read/writes. A
new library struct is introduced to house the shared dependencies and
register fields.

> diff --git a/drivers/net/dsa/mt7530-lib.c b/drivers/net/dsa/mt7530-lib.c
> new file mode 100644
> index 0000000000000..01ed941efc892
> --- /dev/null
> +++ b/drivers/net/dsa/mt7530-lib.c
> @@ -0,0 +1,1106 @@
[ ... ]
> +void mt7530_lib_mib_reset(struct mt7530_lib_priv *priv)
> +{
> +	regmap_field_write(priv->fields[MT7530_CCR_MIB_ENABLE], 0);
> +	regmap_field_write(priv->fields[MT7530_CCR_RX_OCT_CNT_GOOD], 0);
> +	regmap_field_write(priv->fields[MT7530_CCR_RX_OCT_CNT_BAD], 0);
> +	regmap_field_write(priv->fields[MT7530_CCR_TX_OCT_CNT_GOOD], 0);
> +	regmap_field_write(priv->fields[MT7530_CCR_TX_OCT_CNT_BAD], 0);

[Severity: Medium]
Does this correctly clear the counters? The original code wrote a 1 to flush
and clear the counters. Writing 0 to a write-1-to-clear field might fail to
reset them.

[ ... ]
> +int mt7530_lib_fdb_cmd(struct mt7530_lib_priv *priv, enum mt7530_fdb_cmd=
 cmd,
> +		       u32 mat, u32 *rsp)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_field_write(priv->fields[MT7530_ATC_MAT], mat);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_field_write(priv->fields[MT7530_ATC_CMD], cmd);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_field_write(priv->fields[MT7530_ATC_BUSY], 1);

[Severity: High]
Can splitting the FDB command execution into multiple read-modify-writes
corrupt the MAC table operations? The previous implementation constructed t=
he
32-bit value and wrote it atomically, preventing intermediate hardware stat=
es.

[ ... ]
> +static void mt7530_lib_fdb_write(struct mt7530_lib_priv *priv, u16 vid,
> +				 u8 port_mask, const u8 *mac,
> +				 u8 aging, u8 type)
> +{
> +	regmap_field_write(priv->fields[MT7530_ATWD_CVID], vid);
> +	regmap_field_write(priv->fields[MT7530_ATWD_IVL], 1);

[Severity: High]
Could this approach leak uninitialized or stale data into the FDB table?
Writing fields individually performs a read-modify-write, preserving undefi=
ned
bits from prior operations, whereas the old code explicitly cleared
unspecified bits by writing fully initialized arrays directly.

[ ... ]
> +void mt7530_lib_fdb_read(struct mt7530_lib_priv *priv, struct mt7530_fdb=
 *fdb)
> +{
> +	u32 val;
> +
> +	regmap_field_read(priv->fields[MT7530_ATRD_CVID], &val);
> +	fdb->vid =3D val;

[Severity: High]
If regmap_field_read fails, could we end up assigning uninitialized stack
memory from val to the fdb fields? This might leak kernel stack data to
userspace during an FDB dump.

[ ... ]
> +int mt7530_lib_port_mirror_add(struct mt7530_lib_priv *priv, int port,
> +			       struct dsa_mall_mirror_tc_entry *mirror,
> +			       bool ingress, struct netlink_ext_ack *extack)
> +{
> +	int monitor_port;
> +	u32 val;
> +
> +	/* Check for existent entry */
> +	if ((ingress ? priv->mirror_rx : priv->mirror_tx) & BIT(port))
> +		return -EEXIST;
> +
> +	regmap_field_read(priv->fields[MT7530_MIRROR_EN], &val);

[Severity: High]
Is it possible for priv->fields to lack an initialization here? The
ID_EN7528 entry in mt753x_table appears to be missing its reg_fields
setup, which could lead to a NULL pointer dereference.

[Severity: High]
Could a failure in regmap_field_read leave val and monitor_port
uninitialized? Using these uninitialized values in the subsequent condition
might cause unpredictable branch behavior.

[ ... ]
> +int mt7530_lib_port_bridge_flags(struct mt7530_lib_priv *priv, int port,
> +				 struct switchdev_brport_flags flags,
> +				 struct netlink_ext_ack *extack)
> +{
> +	struct dsa_switch *ds =3D priv->ds;
> +
> +	if (flags.mask & BR_LEARNING)
> +		regmap_fields_write(priv->fields[MT7530_PSC_SA_DIR],
> +				    port, !!(flags.val & BR_LEARNING));

[Severity: High]
Does this invert the learning logic? The hardware bit SA_DIS disables
learning, so passing the boolean value of BR_LEARNING directly might
disable learning when it is supposed to be enabled, and vice versa.

[ ... ]
> +static int mt7530_vlan_cmd(struct mt7530_lib_priv *priv, enum mt7530_vla=
n_cmd cmd,
> +			   u16 vid)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_field_write(priv->fields[MT7530_VTCR_FUNC], cmd);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_field_write(priv->fields[MT7530_VTCR_VID], vid);

[Severity: High]
Will breaking this command register access into multiple read-modify-write
operations cause issues with the hardware state machine? The original code
wrote the entire VTCR register in a single atomic operation.

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

[Severity: High]
Might this leave stale or garbage bits in the VAWD1 register? The original
logic performed a full 32-bit register overwrite, explicitly clearing
unspecified bits like EG_CON. Using sequential regmap_field_write operations
performs read-modify-writes, which retains any previous unmapped bits.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d01772cfe3a2d..f313a7a7bfef1 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
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
[ ... ]
> +	{ MT7530_ATRD_ENT_STATUS, REG_FIELD(MT7530_ATRD, 2, 3), },
> +	{ MT7530_ATRD_MAC_BYTE_5, REG_FIELD(MT7530_TSRA2, 24, 31), },
> +	{ MT7530_ATRD_MAC_BYTE_4, REG_FIELD(MT7530_TSRA2, 16, 23), },

[Severity: High]
Are the bit ranges for MAC_BYTE_4 and MAC_BYTE_5 swapped here? The original
logic mapped MAC_BYTE_4 to bits 24-31 and MAC_BYTE_5 to bits 16-23 in the
TSRA2 register, causing corrupted MAC addresses on FDB read.

[ ... ]
> @@ -1373,7 +1141,7 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
>  	if (dsa_port_is_user(dp)) {
>  		struct dsa_port *cpu_dp =3D dp->cpu_dp;
> =20
> -		priv->ports[port].pm |=3D PCR_MATRIX(BIT(cpu_dp->index));
> +		priv->ports[port].pm |=3D BIT(cpu_dp->index);
>  	}
>  	priv->ports[port].enable =3D true;
>  	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
>  		   priv->ports[port].pm);

[Severity: High]
Does this effectively isolate the port by dropping all traffic? The bitmask
in pm is now constructed without the PCR_MATRIX() shift, but it is passed
directly into mt7530_rmw() where PCR_MATRIX_MASK is applied. Since the
unshifted bits fall outside the mask, this will write zero to the matrix
field.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817082034.2032=
6-1-ansuelsmth@gmail.com?part=3D9
