Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B7140B373
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 22:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167287; cv=none; b=bPPMbcGRj89HVzEM1O0vRFApE8CVDY/yhjiSReFs+uzf9E3kGGqf/bC9V4b4hAbVn1EyxdEEr87qJyZPSu/LVzcSnd1mYhPmLQyazG6IJRP4VYehf6QZnOS8xfNt46MODFiWi+Dj0y6yvq3DkXCVLQa6par/elSPVCHpPXYIecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167287; c=relaxed/simple;
	bh=aHP1f++jAtQs9cpk/bh29ImW3klbKsZSHoGF19kb3q4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tii7P2gAvgLezW22HDXM/dwp763NtveoxOmbFx5nn7zUEBeiVhIwf50ji//c4+FknB0Qhtj75iDqG7WXJrACb8pEy3e0PbgK0VOO+n02sAQpNG10yZg057VWbxUvwahusvLK0CxA6DRqVHz5iCylo2O6bG+TtGD6caH8sM7NN+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjPLl1Je; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjPLl1Je"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so505065e9.0
        for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 15:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167284; x=1789772084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Tz2CwjjJhiae7LDEb+iwsLlaTftt3gAWGBis4F4zcg=;
        b=kjPLl1JeNTyiQV4NvD0rgLEr3jx/77B+O9ceyJFEIvGkXS5BXjRpmctnqUgn6+PibN
         h+J2FbhjeDmjFz7kXIOXI3RHhLr/1pbj+8X/Z+mGBoDKDPB3GGxc2+/XmiQJN187eljV
         b4x8Ve7QTpHM9sEseV8Uy5oC9PXHKMarap+yfwPngx0c7/Xz3mBG3e57ovGRH2iWVK4h
         WauyoZLIUHx4UZeslvc9z/cYuJR/LFWLpC4TvWIZBdxA/4Tet0FiINKVaDUE+RGKvODM
         tY7JPnOSgYMhk+MLSR9pzl9IPKvtHnf6blDpU9kl/IX25PdYpu+oGBL8/9ohW0NZDcPL
         pYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167284; x=1789772084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9Tz2CwjjJhiae7LDEb+iwsLlaTftt3gAWGBis4F4zcg=;
        b=ktEwqjl6Ry4cu2IcEukblti8AvaNtLxjfmQdn8PttknjB2Le/j0+5ya2rvmbCC8lU4
         mtR8QzR/J6zBkEe3sJvDDlx5EGul6Ur5VyAlLjV/icfZFCm/I5ne9ZQLwZmEs4/64Iv4
         wcYXt+SHWcpMG+7ZZqoNK1Cqp4Has7YTzAAiQQLfSH6XksuAifRkAdLHPpdZPhy4AIkV
         ULm6G+lrkL2gjRLlFc7y7PrqCJPHNMN/tWiu8VPNI83JQVGJHqv9qJAYxtZe3ze/95kt
         VsNHrVtlBUprofQAcuL/0W/T+vQlQhGe9QBRC+AIjFodWQWQM4+9uHgjpMbYA53y7bk8
         RXlA==
X-Forwarded-Encrypted: i=1; AKwUvBxM5eE0O9VcTsxbESCt/l1YR2DpJqid8oh7nS/GbPvBRbvgokBt6+n5Z19UdSHrLDqavjg=@lists.linux.dev
X-Gm-Message-State: AFuF++lTTASD+CR6M5TVaVle4cB2UIjG4HJM/SjNWzZ934+20juRakcO
	hpdvwmUUe51aK15ChOWHe0N6wnzoWkw/9VPyh2QCnra1sh7NhuFMqqlH
X-Gm-Gg: AYBFou2iRUEUbqSTw7Aebwten4HCWWh1bhWfYA5B+w0UARKc7rWsbKdv5rc1AcL/oqR
	VHeEgdx7NoFqrJ0cXIWorgbQohCt013KBgkZiq18M3TX5exdTJb+qUd8cAWEyWIlqHB0t+m2iMm
	XxgExy/1WHX1riPa2AozERvYc4fSB7FPk+5qneNnStMceU0WA/iXBtIeDOa4/O72/AMRPjE24Cp
	TIS+yN6SzQhI+7eq72u/i65Zn2riLzxHeFZie4V1gT5cqyzoVV4VuByhyE/RjAvPiu8bmTEKu+m
	knP9qrRbEOnm1ezyH4EDv+Ole4utlpnpMXMR+bVAN/3piQJ5u+majleQlokKzQkyR3yAx0v5Y4G
	wTI7mPRoiEJJOS5Kz9bNQ2swbuLRvEaF5dQwClsf7y4jIP+zasAeI8z3Xp5euVXLz+hH3A6/sUp
	+mvT/vMFSeQtZfDNDgzlNUeSrWJxUSlcSzXBcxkynjS7aMwoyG7LwexvhyB25+UltC+/fi3Denz
	7eq4MhG3OQt2aARxcFu7bTvJDIGxWKEXRidCvP7y/K1PtVRQhAh1RSl0n+lkxAP
X-Received: by 2002:a05:600c:468e:b0:49c:eb17:cf3b with SMTP id 5b1f17b1804b1-49e6cabd4b4mr2149135e9.8.1789167284161;
        Fri, 11 Sep 2026 15:54:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v21 6/9] net: dsa: tag_mtk: add Airoha variant usage of this TAG
Date: Sat, 12 Sep 2026 00:53:30 +0200
Message-ID: <20260911225414.225980-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add variant of the MTK TAG for Airoha Switch and comments about difference
between Airoha AN8855 and Mediatek tag bitmap.

Airoha AN8855 doesn't support controlling SA learning and Leaky VLAN
from tag. Although these bits are not used (and even not defined for
Leaky VLAN), it's worth to add comments for these difference to prevent
any kind of regression in the future if ever these bits will be used.

Rework the makefile, config and tag driver to better report to
external tool (like libpcap) the usage of this variant with a dedicated
"Airoha" name.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/net/dsa.h |  2 ++
 net/dsa/Kconfig   | 11 +++++++++++
 net/dsa/Makefile  |  2 +-
 net/dsa/tag_mtk.c | 36 +++++++++++++++++++++++++++++++++---
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 7507d632e7c6..c5659e9ab6d3 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -61,6 +61,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_NETC_VALUE		33
 #define DSA_TAG_PROTO_KSZ8463_VALUE		34
 #define DSA_TAG_PROTO_MT7628_VALUE		35
+#define DSA_TAG_PROTO_AIROHA_VALUE		36
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -75,6 +76,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
 	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
 	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
+	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
 	DSA_TAG_PROTO_QCA		= DSA_TAG_PROTO_QCA_VALUE,
 	DSA_TAG_PROTO_TRAILER		= DSA_TAG_PROTO_TRAILER_VALUE,
 	DSA_TAG_PROTO_8021Q		= DSA_TAG_PROTO_8021Q_VALUE,
diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index 23b4b74004ed..07ad0f13416e 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -24,6 +24,13 @@ config NET_DSA_TAG_NONE
 	  Say Y or M if you want to enable support for switches which don't tag
 	  frames over the CPU port.
 
+config NET_DSA_TAG_AIROHA
+	tristate "Tag driver for Airoha switches"
+	select NET_DSA_TAG_MTK_COMMON
+	help
+	  Say Y or M if you want to enable support for tagging frames for
+	  Airoha switches.
+
 config NET_DSA_TAG_AR9331
 	tristate "Tag driver for Atheros AR9331 SoC with built-in switch"
 	help
@@ -104,8 +111,12 @@ config NET_DSA_TAG_MT7628
 	  Say Y or M if you want to enable support for tagging frames for the
 	  switch embedded in the MT7628 SoC.
 
+config NET_DSA_TAG_MTK_COMMON
+	tristate
+
 config NET_DSA_TAG_MTK
 	tristate "Tag driver for Mediatek switches"
+	select NET_DSA_TAG_MTK_COMMON
 	help
 	  Say Y or M if you want to enable support for tagging frames for
 	  Mediatek switches.
diff --git a/net/dsa/Makefile b/net/dsa/Makefile
index d15bcf5c68f0..57739a488a6a 100644
--- a/net/dsa/Makefile
+++ b/net/dsa/Makefile
@@ -28,7 +28,7 @@ obj-$(CONFIG_NET_DSA_TAG_HELLCREEK) += tag_hellcreek.o
 obj-$(CONFIG_NET_DSA_TAG_KSZ) += tag_ksz.o
 obj-$(CONFIG_NET_DSA_TAG_LAN9303) += tag_lan9303.o
 obj-$(CONFIG_NET_DSA_TAG_MT7628) += tag_mt7628.o
-obj-$(CONFIG_NET_DSA_TAG_MTK) += tag_mtk.o
+obj-$(CONFIG_NET_DSA_TAG_MTK_COMMON) += tag_mtk.o
 obj-$(CONFIG_NET_DSA_TAG_MXL_862XX) += tag_mxl862xx.o
 obj-$(CONFIG_NET_DSA_TAG_MXL_GSW1XX) += tag_mxl-gsw1xx.o
 obj-$(CONFIG_NET_DSA_TAG_NETC) += tag_netc.o
diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index c7dc7731675e..f8087d768da6 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -11,6 +11,7 @@
 #include "tag.h"
 
 #define MTK_NAME		"mtk"
+#define AIROHA_NAME		"airoha"
 
 #define MTK_HDR_LEN		4
 #define MTK_HDR_XMIT_UNTAGGED		0
@@ -18,6 +19,9 @@
 #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
 #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
 #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
+/* AN8855 doesn't support SA_DIS and Leaky VLAN
+ * control in tag as these bits doesn't exist.
+ */
 #define MTK_HDR_XMIT_SA_DIS		BIT(6)
 
 static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
@@ -99,6 +103,7 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev)
 	return skb;
 }
 
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
 static const struct dsa_device_ops mtk_netdev_ops = {
 	.name		= MTK_NAME,
 	.proto		= DSA_TAG_PROTO_MTK,
@@ -107,8 +112,33 @@ static const struct dsa_device_ops mtk_netdev_ops = {
 	.needed_headroom = MTK_HDR_LEN,
 };
 
-MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
-MODULE_LICENSE("GPL");
+DSA_TAG_DRIVER(mtk_netdev_ops);
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_MTK, MTK_NAME);
+#endif
 
-module_dsa_tag_driver(mtk_netdev_ops);
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
+static const struct dsa_device_ops airoha_netdev_ops = {
+	.name		= AIROHA_NAME,
+	.proto		= DSA_TAG_PROTO_AIROHA,
+	.xmit		= mtk_tag_xmit,
+	.rcv		= mtk_tag_rcv,
+	.needed_headroom = MTK_HDR_LEN,
+};
+
+DSA_TAG_DRIVER(airoha_netdev_ops);
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_AIROHA, AIROHA_NAME);
+#endif
+
+static struct dsa_tag_driver *dsa_tag_driver_array[] =	{
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
+	&DSA_TAG_DRIVER_NAME(mtk_netdev_ops),
+#endif
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
+	&DSA_TAG_DRIVER_NAME(airoha_netdev_ops),
+#endif
+};
+
+module_dsa_tag_drivers(dsa_tag_driver_array);
+
+MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
+MODULE_LICENSE("GPL");
-- 
2.53.0

