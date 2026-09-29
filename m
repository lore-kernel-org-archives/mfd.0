Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424F03783B0;
	Tue, 29 Sep 2026 19:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711557; cv=none; b=Fs/Q8KMCWVx7RsZqYaknzRCDtZEep95xn1riWSf16HRLXT0Y9SbmqibgOIfEgTSNWhNYrolymkJoDH3CuwwLOoKzvB9CvmtWKGdPeJ1E15Cx2/BEUkqH3xDhoPZBKtoMgegBcuOBQsn6FDTm0cuVrvcRD3dC7bSGm1400ZP4TH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711557; c=relaxed/simple;
	bh=g+7ui2Q9UP8ja05yd38toFEMoBRxe0bucLcMk2pl0is=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=myUHyhv2DIcy/AdwB15XvhQlynS22tYUY96utcjB+WF8DPD74sUpzSoxFoRaDVKMWcanRnXdpHKRtxe4W73ucGBQpO/otjXUJ+esOGT4x+BduSc2K3AXVvUUdoaN39bEVLzOoDgnN/NkiK52O+NJEPpuDehaWsyt/E0/FUz7Uck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nl1K7ed+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nl1K7ed+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B2A1F000FF;
	Tue, 29 Sep 2026 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711556;
	bh=kPj5LiusumA2fjkC1T0I/e6rYOMVV7kaRkPE4n2oWOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nl1K7ed+0phBhAUFOk1vBVOr9bW9pA29+zzMwjEznHbFDhm0NHLmCcvA2rlepe21H
	 Dn2UfKqAZeoskuRkfU2UyMN6ejBNwHJQ7WkZGu6ZPgW1rJ+RNepSAngYtEpv1c/KEv
	 /keohWA8YfpsIafIdyeMNzkEAAcHuMujIZLvKzy2nSOVI1dZN9d9kcMdZsgfCIK8TN
	 h2u9E79k8gPsf+vOXEOjd+VHS+fcW/JHDT14dg1OrubiZO77vTYSuz9GqvwgypOLxM
	 XlhRP1wiKu0li1zMFgrXgMliGkpbLshlTCKAfi6rr+btm7wJF0LTawitTC68wozUdY
	 OccBKnX96B4hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 09/10] net: dsa: mt7530: generalize and
 move common function to lib module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260928194511.41878-10-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
 <20260928194511.41878-10-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:52:35 +0000
Message-Id: <20260929195235.D0B2A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: dsa: mt7530: spurious command/trigger execution via sequentia=
l RMW on command registers
- [High] net: dsa: mt7530: stale hardware state leaks into VLAN table entri=
es
- [High] net: dsa: mt7530: potential data loss and severe MDIO overhead in =
FDB writes
--

commit 01f4c0abd9feaaa7a4bc2c096b85e94c4360593d
Author: Christian Marangi <ansuelsmth@gmail.com>
net: dsa: mt7530: generalize and move common function to lib module

This commit moves common MT7530 switch functions into a new library module=
=20
and converts them to use the regmap field API. The refactoring aims to=20
prepare for Airoha switch support while maintaining existing logic.

> diff --git a/drivers/net/dsa/mediatek/mt7530-lib.c b/drivers/net/dsa/medi=
atek/mt7530-lib.c
> new file mode 100644
> index 0000000000000..098dd45d3ee9f
> --- /dev/null
> +++ b/drivers/net/dsa/mediatek/mt7530-lib.c
> @@ -0,0 +1,1128 @@
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
> +	regmap_field_write(priv->fields[MT7530_CCR_RX_OCT_CNT_GOOD], 1);
> +	regmap_field_write(priv->fields[MT7530_CCR_RX_OCT_CNT_BAD], 1);
> +	regmap_field_write(priv->fields[MT7530_CCR_TX_OCT_CNT_GOOD], 1);
> +	regmap_field_write(priv->fields[MT7530_CCR_TX_OCT_CNT_BAD], 1);
> +	regmap_field_write(priv->fields[MT7530_CCR_MIB_ENABLE], 1);
> +}

[Severity: High]
Could this sequence trigger multiple spurious flushes? Since=20
regmap_field_write() performs a read-modify-write (RMW), each sequential=20
write to this register might repeatedly write back flush trigger bits befor=
e=20
the operation completes. The original implementation avoided this by writin=
g=20
the entire register atomically with a single regmap_write().

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
Can these sequential RMW operations on the Address Table Command register=20
lead to premature or spurious FDB command executions?=20

If the BUSY bit happens to be already set (e.g., from a previous command=20
timeout, which the code polls for and can occur), the very first=20
regmap_field_write() might read BUSY=3D1, modify the MAT field, and write i=
t=20
back with BUSY=3D1 still set. This would trigger the hardware immediately=20
with incomplete command fields. Previously, this was handled safely by=20
constructing the payload and BUSY bit in a local variable and issuing a=20
single atomic regmap_write().

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
> +	regmap_field_write(priv->fields[MT7530_ATWD_FID], FID_BRIDGED);
> +	regmap_field_write(priv->fields[MT7530_ATWD_AGE_TIMER], aging);
> +	regmap_field_write(priv->fields[MT7530_ATWD_PORT_MAP], port_mask);
> +	/* STATIC_ENT indicate that entry is static wouldn't
> +	 * be aged out and STATIC_EMP specified as erasing an
> +	 * entry
> +	 */
> +	regmap_field_write(priv->fields[MT7530_ATWD_ENT_STATUS], type);
> +	regmap_field_write(priv->fields[MT7530_ATWD_MAC_BYTE_5], mac[5]);
> +	regmap_field_write(priv->fields[MT7530_ATWD_MAC_BYTE_4], mac[4]);
> +	regmap_field_write(priv->fields[MT7530_ATWD_MAC_BYTE_3], mac[3]);
> +	regmap_field_write(priv->fields[MT7530_ATWD_MAC_BYTE_2], mac[2]);
> +	regmap_field_write(priv->fields[MT7530_ATWD_MAC_BYTE_1], mac[1]);
> +	regmap_field_write(priv->fields[MT7530_ATWD_MAC_BYTE_0], mac[0]);
> +}

[Severity: High]
Will these sequential updates to the FDB payload registers cause data loss?=
=20

These are write-only command payload buffers. Reading them (which=20
regmap_field_write() does internally during the read-modify-write cycle)=20
typically returns 0. If it returns 0, the RMW operation would overwrite and=
=20
destroy the fields set by the preceding calls within the same register.

Additionally, since caching is disabled in the regmap configuration, this=20
sequence generates 24 individual MDIO transactions per FDB update. Could th=
is=20
create severe performance overhead in the FDB hot path compared to the=20
original bulk regmap_write()?

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
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_field_write(priv->fields[MT7530_VTCR_BUSY], 1);

[Severity: High]
Similar to mt7530_lib_fdb_cmd(), could these sequential RMWs on the VLAN Ta=
ble=20
Command register risk spurious VLAN command executions if the BUSY bit is=20
already 1 when the first field is updated?

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

[Severity: High]
Does this sequence leak uninitialized or stale bits into the VLAN table ent=
ry?=20

This register (MT7530_VAWD1) is populated by the hardware after executing a=
=20
read command (MT7530_VTCR_RD_VID). For newly initialized VLANs, the hardwar=
e=20
might return garbage or leftover state.

Because the regmap_field_write() RMW sequence modifies only specific bits=20
without clearing the entire register first, these unspecified bits are=20
preserved and written back. The original code used a bulk regmap_write()=20
to deterministically zero out unspecified fields.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928194511.4187=
8-1-ansuelsmth@gmail.com?part=3D9
