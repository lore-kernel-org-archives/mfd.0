Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A444EC648
	for <mfd@lists.linux.dev>; Fri,  9 Oct 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562288; cv=none; b=FJoTWiGUEq+Ard6vUy5dPj0DqgrOM6M/4YfUUxfhJnEs54/rFWaNubFoInvqE0bQvSF/oIbpppT1mCQTF52RlRMw0kDDJYyM6dC98upGFUep5xtBnG8WeMBS7h8WidzCd2peRRENYCSJbNdK3Atzs+bkDpBRbMTItyMnO+xpfgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562288; c=relaxed/simple;
	bh=NU4X2VJGcjl2rlOCjM4L+p3D3tqMARtIFAjlFc9hBWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJ9jT/fyMdDMpbP8VL+2YmGYoTAyOHUxmNgP2YGsurTL4Q9Y8Hzc4S3O5cGTxwT7T8mQMV1rE+m7bwFpCKeLOIPPycRUFaD2AyQIFRKDLbOUVX9Z+4mRX8GTijSwfc0RKH51NhhRQzo0FGs6U/JKJIsck+Sj2n1Ve0ynIpftOSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJzUJ2lx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJzUJ2lx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso4978436f8f.0
        for <mfd@lists.linux.dev>; Fri, 09 Oct 2026 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562283; x=1792167083; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbIAcFETs7Fo7Fiw9hweWROaB2K6gpG5L37UCuTLIIU=;
        b=gJzUJ2lxX1D9rQb0qM/+Xn23VDWG+0de18yxVn2r8EC2Zts6gBAsy7GrWv8Ljb7MOd
         hGtoA3bWUC4nbBHMFj4afdw7eW598caXAoU3cAeoJRJgWrUgDHvmDSb+a6DUwp6SYhGZ
         Nzm22Xok6nAkvJYx8wu0bt4tyOUHEv0YcLEXMmYTuPdf7RFE6OnxB+Uo2OTMmqYMHb6e
         VApTmrzQguG03DiFVDQkLPVQ5hpw1coJsAQLJJOsvSewgfz9CLwMjESNyPVOl4OQBBBB
         ZjQzZUVqNtMD5ez+2VvjH4kZLpQ/1ltWj1s8EYO9/jxByGuWr2jkF9sFfYAzLfeQ/0nt
         1sRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562283; x=1792167083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rbIAcFETs7Fo7Fiw9hweWROaB2K6gpG5L37UCuTLIIU=;
        b=kyqXYtYRPsRY8OHsG/wv7pRp6SIdW53J+uqVY/UTktuIhoN8LmnUowZPyf/sLU5z5m
         5RAseEHIDzfYQyJOhH0peMf4Z1tVWt2w8XLF76va4o6y2uDP7Z53iv7axg6YX2byUf04
         9WvkllfsWbIcIrKLXuvz0wfr/ZczK9pgj2x4rYlYnPnrFr9rTMT0hO2q7uBEMw/nWjWS
         Z9h5sfcmmc0gXbF+ng4oEq1MLsnQRhTulA13SmWoYKMCWh6PdOkXK0DIa8cuPTu/wsNy
         uNkRW0SDFcI25RiGIeOulnex8CuGzXGvBU8Qmpt8zJdG9xyJvhi/jN1cm0oGwgjuJ0tb
         gJ3A==
X-Forwarded-Encrypted: i=1; AKwUvBwgxm+vCGfKscEGcq58HcEtJ1EB+jLfEfuBEOyD45Ik3IdqIvpAI2rcQZ/nW5a85Fm7ZPQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kDGEAq2DgyIVMn6S/dhxW2nWVgnuwHQrQtfVCatJoQVzKbOJ1m
	2MAGZPuBOkr+JBgpHSOzVl0/1D9R7zZoNqTG4xZ0/jDB527PNPbF8CBR
X-Gm-Gg: AYBFou1uNBaDYshN51OWB4991iu8coHFd/WWymXVgxXofo4xlK95aegIxY2iWVrb+VF
	EwVC0tzFNXVI+SUxNrmEFKD53vd2VvgFeqkkdFOw1+aWkP1BbhpcoqAo/XeD4YCcGOsriw+1D6g
	+O/dtR2rGnG44AVntc42tUXf921a4tpZkyrA8rwPQeXWohxOsjXan+f9/AzN4/5GdIyAcDyGLMc
	JPlwBoG4e6cmI1Hc6WkI6PBYYIIO2iCANnnv6Pf2/W7NzKDCif+N7fBitxSdO+oafWDpFUL7k3l
	FhRU878OFz+3F+ah5CJrrTgktkgskAKX7zr4A4ulhtbeauEvjznVCJfB9Y2epa7lRaX8MlnVKKb
	S0HRBN1y6qNskLnUXcOoumlqmJvl1thEhawxGuSOk6aamst4tqnFEWxF69V1ObAmYEOrK/TXnaL
	PHpBj8gF7acaH2eHbye8EeeaoEcppE2gDEYtE7UJm0Q9hWudSvQS882yW3RMGjYUT/ITtaSoX6r
	OnU3+pNW7L4E2Kca6jmnoaUxtSNr2u8ye6HQeADYLDa+kBcGHbBdUrTtSl6iFyGUDUCcIXSjV7W
	0p0wcp3e4uS0UwUkIw==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4a18e4aecb2mr43266655e9.32.1791562283128;
        Fri, 09 Oct 2026 09:11:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v25 06/10] net: dsa: tag_mtk: add Airoha variant usage of this TAG
Date: Fri,  9 Oct 2026 18:10:51 +0200
Message-ID: <20261009161102.38961-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 include/net/dsa.h |  2 ++
 net/dsa/Kconfig   | 11 +++++++++++
 net/dsa/Makefile  |  2 +-
 net/dsa/tag_mtk.c | 36 +++++++++++++++++++++++++++++++++---
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6f..9824c63ad50b 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -62,6 +62,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_KSZ8463_VALUE		34
 #define DSA_TAG_PROTO_MT7628_VALUE		35
 #define DSA_TAG_PROTO_KS8995_VALUE		36
+#define DSA_TAG_PROTO_AIROHA_VALUE		37
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -76,6 +77,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
 	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
 	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
+	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
 	DSA_TAG_PROTO_QCA		= DSA_TAG_PROTO_QCA_VALUE,
 	DSA_TAG_PROTO_TRAILER		= DSA_TAG_PROTO_TRAILER_VALUE,
 	DSA_TAG_PROTO_8021Q		= DSA_TAG_PROTO_8021Q_VALUE,
diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index 4f44bf3ede23..28a249f04a43 100644
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
index 1f9cc30e9988..7ccaa528a989 100644
--- a/net/dsa/Makefile
+++ b/net/dsa/Makefile
@@ -29,7 +29,7 @@ obj-$(CONFIG_NET_DSA_TAG_KS8995) += tag_ks8995.o
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
2.55.0

