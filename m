Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974659;
	b=xGnTHCoMjSiXjta/j909DqjeUT9mw6ri59WbN/4GPlKKuNfYsSllFRAgm8tvzp44LoqA
	 XBoSz7NY8VGQow16BbcQHwCePTaHI/VPvchLeAarJqJwkc7EYaXJEjG6ZQkaFXmdGgwHn
	 k4ymmGtTtlL3dd4QljdW1qwiWTmLKDbfgBxo1E917ndBdP7ScgzHK3uy39SFzX/kNvtws
	 6X8n/MGC7xZJII19MP/TRhUCTC6sObfC7PM2X6l97fSe+lmjDc2XWCzYCN+6ew5oSAmnr
	 dq11dPum505GP4RHHw55Oti0S/aECdHkOVGNWgOsUJXfnFSTre03nT1+ZUGnOt+AtnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974659;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l1pNRxWM8oTAU+MEGg0XHQ76ksepMWgFY89ePe/+iII=;
	b=ijquKubAOVdC+kFkgxSCCLFY+KeXedM5rp358d8giTnZyZQyGexfvhWCYG/Q7BoK/pai
	 rTc4FND+JC3gUTMfUJz6pgtUSgIQJXQKuFnAliBzT3bSRQg0w0KNHPxjyrpnLOun37U6J
	 ZNUB0/ibH3YNAEbwdLu8Itxnar4SX+7PdWlvqmJ80ronjbmixwyLN9q7+qL9Zjs774l+6
	 vUrwZKPY/xNFCO0dcYjNvAt+4C4Ta+HBWUyIUa/awzVDRg9cv1k3e6fv3abNXBfBfoyjs
	 zkmmXFCR9bTA6ESWthqqd3K5odntS7prC3mZnkZsjp3runJqXOMjI6ScNBQhKCZL1jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bMVX/ddo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D1606A32C;
	Fri,  6 Nov 2026 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bMVX/ddo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8181F0089F;
	Fri,  6 Nov 2026 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974659;
	bh=l1pNRxWM8oTAU+MEGg0XHQ76ksepMWgFY89ePe/+iII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bMVX/ddoE3gKptxhQsfe8S8OkHfWkpZk2Bi5BZAl0lS+ixYApO/m5sN6CoWdWS4T/
	 q5LYgDbpHV+wpqVUZZl4PKmAXMtNItCv0NIFiN6wQ1X2cQf/lZMJ18S9ZfDyK7l+vC
	 0ksw8eJ8cPlDpp0Rv0rmYtiqev8wZKfuG9/u6ZHlMD4wg+gZvm3n3mVO3GedWn6GCz
	 /IwVS4z0WhO0VsQpnnybbdCTc+qbmMLpykHKtUPTxnCHxPmZkTv9JbVGFp3+b04Ra7
	 NfDrK/7Hc6suOt1782wJ6nQ3LMZ6NBmpCbaVI3rww6spyb+b2Pauc1z1LLibOtw8Mw
	 JkTJMhTO0UlRw==
Message-ID: <sashiko-outbox-201564@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 8/8] net: dsa: soce: Add VLAN membership
 table support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261105-devel-vstrassheim-soce-dsa-ml-v4-8-02f3cde2afa1@linutronix.de>
References: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
 <20261105-devel-vstrassheim-soce-dsa-ml-v4-8-02f3cde2afa1@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:17:38 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] net: dsa: soce: broken VID 1 untagging in
  swip_vlan_write_entry()
--

commit 25c6cf2ff3f136587d102371c25a636e1af52a26
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

net: dsa: soce: Add VLAN membership table support

This commit adds VLAN membership table programming for SoC-e switch cores
that implement the Port VLAN synthesis option, initializing VLAN-capable
cores with PVID 1 and updating per-VID hardware membership and untagging
masks on VLAN add and delete operations.

> diff --git a/drivers/net/dsa/soce-swip.c b/drivers/net/dsa/soce-swip.c
> index 70fc2da91dd25..7cc3f4abc691d 100644
> --- a/drivers/net/dsa/soce-swip.c
> +++ b/drivers/net/dsa/soce-swip.c
[ ... ]
> @@ -179,6 +212,185 @@ static void swip_stp_disable(struct swip_dsa_local =
*local)
[ ... ]
> +static void swip_vlan_config_port(struct swip_priv *priv, int port)
> +{
> +	struct swip_dsa_local *local =3D &priv->local;
> +	void __iomem *base =3D local->vlan;
> +	u32 regval;
> +
> +	swip_vlan_select_port(local, port);
> +	writel(SWIP_VLAN_PORT_MODE_HYBRID, base + SWIP_VLAN_PORT_MODE_OFFSET);
> +	writel(SWIP_VLAN_PORT_TYPE_UNAWARE, base + SWIP_VLAN_PORT_TYPE_OFFSET);
> +	writel(FIELD_PREP(SWIP_VLAN_PORT_VLAN_PVID_MASK,
> +			  SWIP_STANDALONE_PVID),
> +	       base + SWIP_VLAN_PORT_VLAN_OFFSET);
> +	writel(0, base + SWIP_VLAN_PORT_INGR_FILTER_OFFSET);
> +	writel(SWIP_VLAN_PORT_INGR_ACCEPT_ALL,
> +	       base + SWIP_VLAN_PORT_INGR_ACCEPT_OFFSET);
> +
> +	regval =3D readl(base + SWIP_VLAN_PORT_EGR_TAG_OFFSET);
> +	regval &=3D ~SWIP_VLAN_PORT_EGR_TAG_MASK;
> +	regval |=3D FIELD_PREP(SWIP_VLAN_PORT_EGR_TAG_MASK,
> +			     SWIP_VLAN_PORT_EGR_TAG_UNTAG_PORT);
> +	writel(regval, base + SWIP_VLAN_PORT_EGR_TAG_OFFSET);
> +}
> +
> +static int swip_vlan_write_entry(struct swip_priv *priv, u16 vid)
> +{
> +	struct swip_dsa_local *local =3D &priv->local;
> +	void __iomem *base =3D local->vlan;
> +	struct dsa_port *dp;
> +	u32 standalone =3D 0;
> +	u32 cpu_ports;
> +	u32 untagged;
> +	u32 members;
> +	int ret;
> +
> +	cpu_ports =3D dsa_cpu_ports(&priv->ds);
> +	/* Bridge VLAN deletion must not remove standalone membership. */
> +	if (vid =3D=3D SWIP_STANDALONE_PVID) {
> +		dsa_switch_for_each_user_port(dp, &priv->ds) {
> +			if (!dsa_port_bridge_dev_get(dp))
> +				standalone |=3D BIT(dp->index);
> +		}
> +	}
> +	members =3D priv->vlan_members[vid] | standalone;
> +	/* CPU membership preserves VLAN delivery to the conduit. */
> +	if (members)
> +		members |=3D cpu_ports;
> +	/* Explicit VLAN configuration takes precedence over default untagging.=
 */
> +	untagged =3D standalone & ~priv->vlan_members[vid] & ~cpu_ports;

[Severity: High]
Does this clear hardware VID 1 untagging whenever a port joins a software
bridge (or adds a VID 1 VLAN upper), causing all untagged frames transmitted
out of that port to egress tagged with VID 1 on the wire?

In swip_vlan_config_port(), every port including the CPU port is configured
with SWIP_VLAN_PORT_TYPE_UNAWARE, PVID =3D SWIP_STANDALONE_PVID (1), and
SWIP_VLAN_PORT_EGR_TAG_UNTAG_PORT. When the CPU transmits an untagged frame
via sdsa_xmit(), SDSA_TAG_VLAN_BIT is not set, so the switch classifies the
frame into the CPU port's PVID (VID 1) and strips the tag on egress from a
user port only if BIT(port) is set in SWIP_VLAN_UNTAG_PORTS_OFFSET for VID =
1.

Because swip_switch_ops does not implement .port_bridge_join, joining a
Linux bridge takes the software fallback path:

  dsa_user_changeupper()
    -> dsa_port_bridge_join()
      -> dsa_switch_bridge_join() -> returns -EOPNOTSUPP
      -> dsa_port_bridge_destroy() -> sets dp->bridge =3D NULL

As a result, dp->bridge is always NULL and dsa_port_bridge_dev_get(dp) in
swip_vlan_write_entry() is always NULL for every port.

When br_add_if() -> nbp_vlan_init() -> nbp_vlan_add() adds the bridge's
default_pvid (VID 1, untagged), __vlan_vid_add() sees that the port is not
switchdev-offloaded and falls back to vlan_vid_add(dev, br->vlan_proto, 1).
Because swip_probe() sets ds->needs_standalone_vlan_filtering =3D
priv->features.port_vlan, the user port has NETIF_F_HW_VLAN_CTAG_FILTER set,
so vlan_vid_add() calls:

  dsa_user_vlan_rx_add_vid()
    -> dsa_port_vlan_add()
      -> swip_port_vlan_add()

with vid =3D 1 and flags =3D 0 (since ndo_vlan_rx_add_vid does not carry
BRIDGE_VLAN_INFO_UNTAGGED).

swip_port_vlan_add() sets BIT(port) in priv->vlan_members[1], and
swip_vlan_write_entry() then computes:

  untagged =3D standalone & ~priv->vlan_members[vid] & ~cpu_ports;

which clears BIT(port) in SWIP_VLAN_UNTAG_PORTS_OFFSET for VID 1. Once that
bit is cleared, untagged frames sent on the bridge or port are classified
into VID 1 at the CPU port and egress the user port with an 802.1Q VID 1 tag
instead of untagged.

Conversely, because dsa_port_bridge_dev_get(dp) is always NULL, deleting
VID 1 from the bridged port (for example via bridge vlan del dev swp0 vid 1)
clears BIT(port) in priv->vlan_members[1], which leaves BIT(port) set in
standalone and restores the port to both SWIP_VLAN_MEMBER_PORTS_OFFSET and
SWIP_VLAN_UNTAG_PORTS_OFFSET for VID 1.

Also, because dp->bridge is always NULL and
ds->needs_standalone_vlan_filtering is false when !priv->features.port_vlan,
can swip_port_vlan_add() or swip_port_vlan_del() ever be reached when
priv->features.port_vlan is false?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-devel-vstr=
assheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de?part=3D8
