Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186397;
	b=N44RW+/tM0svqCJz1FkrLGAz3YkUetTb+QbBJSCRMCwq3+nOuxprN6H11u5KjxyWHfhX
	 APFjVN2zKC8d1LmcA1pGp6Hx0UoymmHyLY/MA3TMYTnGefvKhOPaAvW91RdLRudEYK3iy
	 jeaYFNT+KxBf9oEm/O1WvW67iuf5xOrdlkVD9+dihRCc+Dm4JZB9/46NDeT0NTBrc17d7
	 Adm4dEjryRwKJciTaa5ps42+WfCWiqTit5YB9RvIqYgZFu8VYE6IQ5Ixs26OkzPysbCXh
	 bUNkVWHevqMU4YiOq74YT2nacgZpjjNLgccm5A5YS5or4I2YhT+mj/0aRhI30goTWow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186397;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc;
	bh=tDuWcD/foci238Y9qoUbdSJhApRAoo0hCBRl78htX+g=;
	b=zvCKI1Jx81/TPjXnpBBM7/PHmpOGtwJ6/cQ3iN+uy33TPzcy1DyPLNeKR0LO/hxzMVT3
	 EFPZQo9TNQ/3v4g3xAsJgjIJ2sf0Riib3FDGAreuTw7ukS9YXCq0RcWn+kGgRAHNf3VPJ
	 9+BvP6h1DWaO3J4srF4KMMi40zyiTj03zxEFr5bYVfhAZN7bknLiCb9+X03B3FqIC2jlm
	 G1wehNcPjfbcr5aOEJ8eOo1UA6BKQbuMrIn7fBaPBi0rU6LWnPWFZEw8G+H8O80g/i3eZ
	 6nngsHo7YzNXmszZWP5GuCG03mLHf6UnwCBTJpJrRi+wd3mkcgGcP/OtBmNIaGUfTLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fzp+XcfO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EzEHAUoU;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3F560A382D
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 14:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3F560A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=fzp+XcfO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EzEHAUoU
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795186394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDuWcD/foci238Y9qoUbdSJhApRAoo0hCBRl78htX+g=;
	b=fzp+XcfOD4Ivv8V2GhnOb778dwNx7/z+Artlc76wW0fvQ0hlBJ2zHZKK9V4jle+q1DCEYX
	ilVnmK5OY7yFHamNYW82LseB9VJOsER6Iv3/W8ZKZlHbl6JtqA6FcNYP2uHNt7+K3TrjDt
	+sOPi/r4855sSxVJMrokNotmKg5eD4WvmXlLnOePFji2Smlvp6NV4/FIUK751/yl3+fv/1
	sgJUzeWqy7ZQNp1bhVCY/U6GJEKeW6FyEErqfvv3gXQEsYkh6/h2779vJs4ru1g7JNVUv+
	lItHNyMG3SepHI/UJxro6U8Jgdyc6YzjsvfCMsnFx5i5mlaubQof2SAto+D5hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795186394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tDuWcD/foci238Y9qoUbdSJhApRAoo0hCBRl78htX+g=;
	b=EzEHAUoUOxcNkzferrGCpbxhu/O6b6CByy7Z+y7fk+zzfi2eL57J/S2ew/yMva6ZzYVdls
	sXcbZAhvNj8KrHBQ==
Date: Fri, 20 Nov 2026 15:52:26 +0100
Subject: [PATCH net-next v5 9/9] net: dsa: soce: Add VLAN membership table
 support
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-devel-vstrassheim-soce-dsa-ml-v5-9-5de9225715e6@linutronix.de>
References: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
In-Reply-To: <20261120-devel-vstrassheim-soce-dsa-ml-v5-0-5de9225715e6@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
 Lee Jones <lee@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Vasilij Strassheim <v.strassheim@linutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, mfd@lists.linux.dev, 
 Martin Kaistra <martin.kaistra@linutronix.de>, 
 Benedikt Spranger <b.spranger@linutronix.de>

Program VLAN membership tables on switch cores that implement the Port
VLAN synthesis option.

Initialize VLAN-capable cores in VLAN-unaware mode with PVID 1 and
configure ports to untag PVID frames on egress. For VLAN add and delete
operations, update per-VID membership masks and include CPU ports in
active entries. Preserve standalone VLAN 1 membership independently of
explicit VLAN RX-filter registrations.

Keep ingress filtering disabled. Bridge VLAN filtering is not offloaded.

Without Port VLAN synthesis, VLAN information is lost when frames enter
the switch through the CPU port and is not preserved in the SDSA header.
Reject direct VLAN uppers on such cores and warn that VLAN-aware
bridging is unsupported. Plain software bridge port joins remain
allowed.

Serialize multi-register VLAN operations with a per-switch feature
mutex. Clear the membership shadow after a successful hardware reset
during setup. On programming failure, restore the software shadow and
attempt a best-effort restore of the previous hardware entry. Log
rollback failures and return the original error.

Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
---
 drivers/net/dsa/soce-swip.c | 334 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/dsa/soce-swip.h |   4 +
 2 files changed, 338 insertions(+)

diff --git a/drivers/net/dsa/soce-swip.c b/drivers/net/dsa/soce-swip.c
index 11c570ec98bc..624c7fbfd73f 100644
--- a/drivers/net/dsa/soce-swip.c
+++ b/drivers/net/dsa/soce-swip.c
@@ -28,6 +28,7 @@
 #define SWIP_LIC_FEATURES_NUM_PORTS_MASK	GENMASK(31, 27)
 #define SWIP_IMPL_FEATURES0_OFFSET		0x000c
 #define SWIP_IMPL_FEATURES0_NUM_PORTS_MASK	GENMASK(31, 27)
+#define SWIP_IMPL_FEATURES0_PORT_VLAN		BIT(9)
 #define SWIP_IMPL_FEATURES0_STP			BIT(20)
 #define SWIP_IMPL_FEATURES0_DSA			BIT(23)
 #define SWIP_MIN_NUM_PORTS			3
@@ -52,6 +53,34 @@
 #define SWIP_STP_CTRL_OFFSET			0x0000
 #define SWIP_STP_CTRL_ENABLE			BIT(0)
 
+#define SWIP_VLAN_BASE_OFFSET			0x0d00
+#define SWIP_VLAN_SIZE				0x0044
+#define SWIP_VLAN_CTRL_OFFSET			0x0000
+#define SWIP_VLAN_CTRL_ENABLE			BIT(0)
+#define SWIP_VLAN_RESET_OFFSET			0x0004
+#define SWIP_VLAN_RESET_CMD			BIT(0)
+#define SWIP_VLAN_PORT_SEL_OFFSET		0x0010
+#define SWIP_VLAN_PORT_SEL_PORT_MASK		GENMASK(7, 0)
+#define SWIP_VLAN_PORT_MODE_OFFSET		0x0014
+#define SWIP_VLAN_PORT_MODE_HYBRID		0x2
+#define SWIP_VLAN_PORT_TYPE_OFFSET		0x0018
+#define SWIP_VLAN_PORT_TYPE_UNAWARE		0x0
+#define SWIP_VLAN_PORT_VLAN_OFFSET		0x001c
+#define SWIP_VLAN_PORT_VLAN_PVID_MASK		GENMASK(11, 0)
+#define SWIP_VLAN_PORT_INGR_FILTER_OFFSET	0x0020
+#define SWIP_VLAN_PORT_INGR_ACCEPT_OFFSET	0x0024
+#define SWIP_VLAN_PORT_INGR_ACCEPT_ALL		0x0
+#define SWIP_VLAN_PORT_EGR_TAG_OFFSET		0x0028
+#define SWIP_VLAN_PORT_EGR_TAG_MASK		GENMASK(1, 0)
+#define SWIP_VLAN_PORT_EGR_TAG_UNTAG_PVID	0x0
+#define SWIP_VLAN_VID_SEL_OFFSET		0x002c
+#define SWIP_VLAN_VID_SEL_VID_MASK		GENMASK(11, 0)
+#define SWIP_VLAN_MEMBER_CTRL_OFFSET		0x0030
+#define SWIP_VLAN_MEMBER_CTRL_WRITE		BIT(0)
+#define SWIP_VLAN_MEMBER_PORTS_OFFSET		0x0034
+#define SWIP_VLAN_CMD_TIMEOUT_US		1000
+#define SWIP_STANDALONE_PVID			1
+
 static void __iomem *swip_ioremap(struct device *dev,
 				  const struct resource *window,
 				  resource_size_t offset, resource_size_t size,
@@ -97,6 +126,7 @@ static int swip_identify(struct device *dev, void __iomem *base,
 				     "invalid port counts\n");
 
 	priv->features.num_ports = implemented_ports;
+	priv->features.port_vlan = regval & SWIP_IMPL_FEATURES0_PORT_VLAN;
 	priv->features.stp = regval & SWIP_IMPL_FEATURES0_STP;
 
 	return 0;
@@ -179,6 +209,174 @@ static void swip_stp_disable(struct swip_dsa_local *local)
 	writel(regval, base + SWIP_STP_CTRL_OFFSET);
 }
 
+static void swip_vlan_set_enabled(struct swip_dsa_local *local, bool enabled)
+{
+	void __iomem *base = local->vlan;
+	u32 regval;
+
+	regval = readl(base + SWIP_VLAN_CTRL_OFFSET);
+	if (enabled)
+		regval |= SWIP_VLAN_CTRL_ENABLE;
+	else
+		regval &= ~SWIP_VLAN_CTRL_ENABLE;
+	writel(regval, base + SWIP_VLAN_CTRL_OFFSET);
+}
+
+static int swip_vlan_reset(struct swip_dsa_local *local)
+{
+	void __iomem *base = local->vlan;
+	u32 regval;
+
+	writel(SWIP_VLAN_RESET_CMD, base + SWIP_VLAN_RESET_OFFSET);
+
+	return readl_poll_timeout(base + SWIP_VLAN_RESET_OFFSET,
+				  regval, !(regval & SWIP_VLAN_RESET_CMD), 10,
+				  SWIP_VLAN_CMD_TIMEOUT_US);
+}
+
+static int swip_vlan_wait_for_write(struct swip_dsa_local *local)
+{
+	void __iomem *base = local->vlan;
+	u32 regval;
+
+	return readl_poll_timeout(base + SWIP_VLAN_MEMBER_CTRL_OFFSET, regval,
+				  !(regval & SWIP_VLAN_MEMBER_CTRL_WRITE), 10,
+				  SWIP_VLAN_CMD_TIMEOUT_US);
+}
+
+static void swip_vlan_select_port(struct swip_dsa_local *local, int port)
+{
+	writel(FIELD_PREP(SWIP_VLAN_PORT_SEL_PORT_MASK, port),
+	       local->vlan + SWIP_VLAN_PORT_SEL_OFFSET);
+}
+
+static void swip_vlan_select_vid(struct swip_dsa_local *local, u16 vid)
+{
+	writel(FIELD_PREP(SWIP_VLAN_VID_SEL_VID_MASK, vid),
+	       local->vlan + SWIP_VLAN_VID_SEL_OFFSET);
+}
+
+static void swip_vlan_config_port(struct swip_priv *priv, int port)
+{
+	struct swip_dsa_local *local = &priv->local;
+	void __iomem *base = local->vlan;
+	u32 regval;
+
+	/*
+	 * VLAN-unaware ports classify ingress traffic to PVID 1 without consuming
+	 * existing in-band VLAN headers.
+	 */
+	swip_vlan_select_port(local, port);
+	writel(SWIP_VLAN_PORT_MODE_HYBRID, base + SWIP_VLAN_PORT_MODE_OFFSET);
+	writel(SWIP_VLAN_PORT_TYPE_UNAWARE, base + SWIP_VLAN_PORT_TYPE_OFFSET);
+	writel(FIELD_PREP(SWIP_VLAN_PORT_VLAN_PVID_MASK,
+			  SWIP_STANDALONE_PVID),
+	       base + SWIP_VLAN_PORT_VLAN_OFFSET);
+	writel(0, base + SWIP_VLAN_PORT_INGR_FILTER_OFFSET);
+	writel(SWIP_VLAN_PORT_INGR_ACCEPT_ALL,
+	       base + SWIP_VLAN_PORT_INGR_ACCEPT_OFFSET);
+
+	regval = readl(base + SWIP_VLAN_PORT_EGR_TAG_OFFSET);
+	regval &= ~SWIP_VLAN_PORT_EGR_TAG_MASK;
+	regval |= FIELD_PREP(SWIP_VLAN_PORT_EGR_TAG_MASK,
+			     SWIP_VLAN_PORT_EGR_TAG_UNTAG_PVID);
+	writel(regval, base + SWIP_VLAN_PORT_EGR_TAG_OFFSET);
+}
+
+static int swip_vlan_write_entry(struct swip_priv *priv, u16 vid)
+{
+	struct swip_dsa_local *local = &priv->local;
+	void __iomem *base = local->vlan;
+	struct dsa_port *dp;
+	u32 standalone = 0;
+	u32 cpu_ports;
+	u32 members;
+	int ret;
+
+	cpu_ports = dsa_cpu_ports(&priv->ds);
+	/*
+	 * DSA treats software-bridged ports as standalone. Keep their default
+	 * PVID membership independently of VLAN RX-filter registrations.
+	 */
+	if (vid == SWIP_STANDALONE_PVID) {
+		dsa_switch_for_each_user_port(dp, &priv->ds) {
+			if (!dsa_port_bridge_dev_get(dp))
+				standalone |= BIT(dp->index);
+		}
+	}
+	members = priv->vlan_members[vid] | standalone;
+	/* CPU membership preserves VLAN delivery to the conduit. */
+	if (members)
+		members |= cpu_ports;
+
+	/* A timed-out command may still be using the shared VID selector. */
+	ret = swip_vlan_wait_for_write(local);
+	if (ret)
+		return ret;
+
+	swip_vlan_select_vid(local, vid);
+	writel(members, base + SWIP_VLAN_MEMBER_PORTS_OFFSET);
+	writel(SWIP_VLAN_MEMBER_CTRL_WRITE,
+	       base + SWIP_VLAN_MEMBER_CTRL_OFFSET);
+
+	return swip_vlan_wait_for_write(local);
+}
+
+static int swip_vlan_setup(struct dsa_switch *ds)
+{
+	struct swip_priv *priv = ds->priv;
+	struct swip_dsa_local *local;
+	struct dsa_port *dp;
+	int ret;
+
+	local = &priv->local;
+
+	if (!priv->features.port_vlan)
+		return 0;
+
+	ret = swip_vlan_reset(local);
+	if (ret) {
+		dev_err(ds->dev, "failed to reset VLAN configuration: %d\n",
+			ret);
+		return ret;
+	}
+
+	memset(priv->vlan_members, 0,
+	       sizeof(*priv->vlan_members) * VLAN_N_VID);
+
+	ret = swip_vlan_write_entry(priv, SWIP_STANDALONE_PVID);
+	if (ret) {
+		dev_err(ds->dev, "failed to set up standalone VLAN: %d\n",
+			ret);
+		return ret;
+	}
+
+	dsa_switch_for_each_available_port(dp, ds)
+		swip_vlan_config_port(priv, dp->index);
+
+	swip_vlan_set_enabled(local, true);
+
+	return 0;
+}
+
+static void swip_vlan_teardown(struct swip_priv *priv)
+{
+	struct swip_dsa_local *local = &priv->local;
+	int ret;
+
+	if (!priv->features.port_vlan)
+		return;
+
+	scoped_guard(mutex, &priv->feature_lock) {
+		ret = swip_vlan_reset(local);
+		if (ret)
+			dev_warn(priv->ds.dev,
+				 "failed to reset VLAN configuration during teardown: %d\n",
+				 ret);
+		swip_vlan_set_enabled(local, false);
+	}
+}
+
 static void swip_port_select(struct swip_dsa_local *local, int port)
 {
 	writel(FIELD_PREP(SWIP_PORTS_SELECTOR_PORT_MASK, port),
@@ -222,10 +420,15 @@ static int swip_setup(struct dsa_switch *ds)
 {
 	struct swip_priv *priv = ds->priv;
 	struct dsa_port *dp;
+	int ret;
 
 	dsa_switch_for_each_user_port(dp, ds)
 		swip_port_set_enabled(&priv->local, dp->index, false);
 
+	ret = swip_vlan_setup(ds);
+	if (ret)
+		return ret;
+
 	/* Unconfigured hardware STP blocks frame forwarding. */
 	if (priv->features.stp)
 		swip_stp_disable(&priv->local);
@@ -243,6 +446,7 @@ static void swip_teardown(struct dsa_switch *ds)
 	local = &priv->local;
 
 	swip_disable_tagging(local);
+	swip_vlan_teardown(priv);
 }
 
 static enum dsa_tag_protocol swip_get_tag_protocol(struct dsa_switch *ds,
@@ -252,6 +456,111 @@ static enum dsa_tag_protocol swip_get_tag_protocol(struct dsa_switch *ds,
 	return DSA_TAG_PROTO_SDSA;
 }
 
+static int swip_port_vlan_add(struct dsa_switch *ds, int port,
+			      const struct switchdev_obj_port_vlan *vlan,
+			      struct netlink_ext_ack *extack)
+{
+	struct swip_priv *priv = ds->priv;
+	u32 port_mask = BIT(port);
+	int rollback_ret;
+	u32 old_members;
+	u32 *members;
+	int ret;
+
+	members = priv->vlan_members;
+
+	if (!vlan->vid)
+		return 0;
+
+	if (!priv->features.port_vlan) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Port VLAN support is not implemented in the switch core");
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &priv->feature_lock) {
+		old_members = members[vlan->vid];
+
+		members[vlan->vid] |= port_mask;
+
+		ret = swip_vlan_write_entry(priv, vlan->vid);
+		if (ret) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "failed to update VLAN hardware tables");
+			dev_err(ds->dev,
+				"failed to add VLAN %u on port %d: %d\n",
+				vlan->vid, port, ret);
+			members[vlan->vid] = old_members;
+			/* Best-effort: restore the previous hardware entry. */
+			rollback_ret = swip_vlan_write_entry(priv, vlan->vid);
+			if (rollback_ret)
+				dev_err(ds->dev,
+					"failed to restore VLAN %u on port %d: %d\n",
+					vlan->vid, port, rollback_ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int swip_port_vlan_del(struct dsa_switch *ds, int port,
+			      const struct switchdev_obj_port_vlan *vlan)
+{
+	struct swip_priv *priv = ds->priv;
+	u32 port_mask = BIT(port);
+	int rollback_ret;
+	u32 old_members;
+	u32 *members;
+	int ret;
+
+	members = priv->vlan_members;
+
+	if (!vlan->vid)
+		return 0;
+
+	if (!priv->features.port_vlan)
+		return -EOPNOTSUPP;
+
+	scoped_guard(mutex, &priv->feature_lock) {
+		old_members = members[vlan->vid];
+		members[vlan->vid] &= ~port_mask;
+		ret = swip_vlan_write_entry(priv, vlan->vid);
+		if (ret) {
+			dev_err(ds->dev,
+				"failed to delete VLAN %u from port %d: %d\n",
+				vlan->vid, port, ret);
+			members[vlan->vid] = old_members;
+			/* Best-effort: restore the previous hardware entry. */
+			rollback_ret = swip_vlan_write_entry(priv, vlan->vid);
+			if (rollback_ret)
+				dev_err(ds->dev,
+					"failed to restore VLAN %u on port %d: %d\n",
+					vlan->vid, port, rollback_ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int
+swip_port_prechangeupper(struct dsa_switch *ds, int port,
+			 struct netdev_notifier_changeupper_info *info)
+{
+	struct swip_priv *priv = ds->priv;
+	struct netlink_ext_ack *extack;
+
+	if (!info->linking || !is_vlan_dev(info->upper_dev) ||
+	    priv->features.port_vlan)
+		return 0;
+
+	extack = netdev_notifier_info_to_extack(&info->info);
+	NL_SET_ERR_MSG_MOD(extack,
+			   "VLAN uppers require Port VLAN support in the switch core");
+	return -EOPNOTSUPP;
+}
+
 static const struct dsa_switch_ops swip_switch_ops = {
 	.get_tag_protocol	= swip_get_tag_protocol,
 	.setup			= swip_setup,
@@ -259,6 +568,9 @@ static const struct dsa_switch_ops swip_switch_ops = {
 	.phylink_get_caps	= swip_phylink_get_caps,
 	.port_enable		= swip_port_enable,
 	.port_disable		= swip_port_disable,
+	.port_vlan_add		= swip_port_vlan_add,
+	.port_vlan_del		= swip_port_vlan_del,
+	.port_prechangeupper	= swip_port_prechangeupper,
 };
 
 static int swip_probe(struct platform_device *pdev)
@@ -306,10 +618,32 @@ static int swip_probe(struct platform_device *pdev)
 		if (IS_ERR(local->stp))
 			return PTR_ERR(local->stp);
 	}
+	ret = devm_mutex_init(dev, &priv->feature_lock);
+	if (ret)
+		return ret;
+
+	if (priv->features.port_vlan) {
+		local->vlan = swip_ioremap(dev, res, SWIP_VLAN_BASE_OFFSET,
+					   SWIP_VLAN_SIZE, "vlan");
+		if (IS_ERR(local->vlan))
+			return PTR_ERR(local->vlan);
+
+		priv->vlan_members =
+			devm_kcalloc(dev, VLAN_N_VID,
+				     sizeof(*priv->vlan_members), GFP_KERNEL);
+		if (!priv->vlan_members)
+			return -ENOMEM;
+
+	} else {
+		dev_warn(dev,
+			 "No Port VLAN: tagged CPU ingress loses VLAN IDs. VLAN-aware bridge unsupported\n");
+	}
 
 	ds->ops = &swip_switch_ops;
 	ds->num_ports = priv->features.num_ports;
 
+	ds->needs_standalone_vlan_filtering = priv->features.port_vlan;
+
 	dev_set_drvdata(dev, priv);
 
 	ret = dsa_register_switch(ds);
diff --git a/drivers/net/dsa/soce-swip.h b/drivers/net/dsa/soce-swip.h
index d3a523ad6694..034a05ce8dc5 100644
--- a/drivers/net/dsa/soce-swip.h
+++ b/drivers/net/dsa/soce-swip.h
@@ -17,18 +17,22 @@
 
 struct swip_features {
 	u32 num_ports;
+	bool port_vlan;
 	bool stp;
 };
 
 struct swip_dsa_local {
 	void __iomem *dsa;
 	void __iomem *ports;
+	void __iomem *vlan;
 	void __iomem *stp;
 };
 
 struct swip_priv {
 	struct swip_dsa_local local;
 	struct swip_features features;
+	struct mutex feature_lock; /* Serializes multi-register feature updates */
+	u32 *vlan_members;
 	struct dsa_switch ds;
 };
 

-- 
2.39.5

