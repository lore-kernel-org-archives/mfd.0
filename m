Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02453C1F26
	for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954859; cv=none; b=DudDkLV6t5XII/X4SehoWRqCiyOjl2YZQD82YQpsjZc1DFMH1/m4HmZkDxI6qcWVJUXtQmdA/0a1Hl0TabzEz6GGtJdlWSUOb1Vn+xd3P2hSO8YtuT5F9jvS/EDQ528tCb/2jJNGd3WZn+ofanFi3TwW8uF1IwT0G2U2lcA56eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954859; c=relaxed/simple;
	bh=092z8nSVlijhxHSoKIlRJ16ECvURE72HxCMAnX2npH0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrQ60FrZy8LhHK0Vy1N3vJBG1b4DDevmzy0815torZMMD019xKz9Agzq5PkrLIChHMs6JN3kSOirhIiJ0jWWXmMLsu56bdv9FhgGDe/hm9bjMPGO3S9hQDRrBw5MM/5UB86j+cDWaGeFv81QEXyJYYTJtzVPbimho3nSudNYUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXhAn9Pe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXhAn9Pe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495437bb891so28560355e9.1
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 01:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954856; x=1787559656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e+Mvy67q6/dC+Gf4rHVcYavXLL8OqK8NuZ1lfl7xWvo=;
        b=sXhAn9PeEU4I67Sis5wjHb++XsxHVGOhKuXiIWKG2nSobxudx+Q+VKx+3cwSaz9squ
         gLBuf/3pqP2WAdBB60ur5z6PCXEbbge75+y6pFg/srYyuc2bCXZp3NB6CQcbHTaKe7uM
         5R/5ORrKjcTptlUjqXktaeCBSQWpKCZvzt6y9D/mY8aiGoUsxWXyniSe1RuXy9+6jCcC
         y2UnmR55ZyVA9auFibBf7bNpRnSgfKPrbhYOMzXPgUO4q+RKeHeFpMIk6a/CTDoi8T6g
         9OnZ4BN076dbzpf65anC01pPN025/vtSuqbtQ+Hk5xQFuJnh2i1C9t4DAyF1g9k4adhO
         l07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954856; x=1787559656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e+Mvy67q6/dC+Gf4rHVcYavXLL8OqK8NuZ1lfl7xWvo=;
        b=a26aLJgC5o03b+Zht/5OquA7GFL2u1cuxWC5OTEmLXa+eCxSbO3zaM6+IvPgJhPMDA
         gOJqaVU0L8JXhjF/YRJ+AOdXc5YIewg5sLrTxuux/3V+6SkzfM2+sLjrubYQgQ6tipAM
         /2CUH/GemEE9bJ00DXbh2DdgWobc0tXmvmO2BrtKYslxxgKTCPKuZWXK0Pq0SGkPlC5R
         jgMLtrt53cGTJMbfvNuO7J3Oi//nA9OlyCMzE9J6UGg3miDr95k6rt+6sB7h9+UQL1Zj
         8QsoWlsV5Z1AHfFcaWnkGCKeBhCIKmVKakbAdIW1fCtpX0aXFZDv6Bg4ahNgWz1siMbj
         WRaA==
X-Forwarded-Encrypted: i=1; AHgh+RrDyBrPDSfqbRncuh8uWvJ067uS7Ybes/cE5zpAdfd2dgeauVblfCO4AZth4dZxIz97MUE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHN5/67yz5CBTZxsaPxldINyA9XbMUNApmll+HTEfHYmIQp6xj
	8QgldcNvn9xGLvUUS5wzDWw3WnvXUikeN5cpB4XM5+6UhJVr0EO7GyZ8
X-Gm-Gg: AR+sD10aPPTsmBWcW9Ka2uLqaKt/5066lC0LM2R5ryfyh/t0J7sQThCKavy8zCNdz9m
	SbHiVBdLo1bGdE4uyHA2GJcUrrCDLHhogALF/ASfd9Pjr5sX+HJqbrDTGTQlytIyZbpxR+nFYCt
	RnpL2HFHwhr+vBa0KxKjtatcSqRwHpx7z84WM5XcAZenrs+Hpd5gLbRHzw/ii/JCi0e7P5Z2q1b
	JpeSGbMj94AtwK8k2hgd/xP+4nDPvB8WY9RKIkvXXxWzkNZIWfPu5vCPR3/b9rw/aroOq8pqhdB
	gk/sJVd04nPaM2cV4ORvoCqyUCwJxaZchuJnAfcc+js1WF1R9zBzK3bM5nnx5v1STQeTB6ByK27
	oh0qFWB1LKW8V6nOJ0Tb7JMQ4vnygOHlvyPHY3GSwd27q9vFriMWLMg/4l0Mzb3l1eEStieD2Ry
	QSM4m2Z7c3NcBKO58F7H2qpoU75r8+iuu/kg3ZoAtPo1dZbqTf4i6RTchsmT/hi8vG6MrqDA2za
	kvYc0TdofM/4Gs8pN33Ysx6KgVfBiTRZ6ScaRhmRQyyHIOM/kIZedXB
X-Received: by 2002:a05:600c:6749:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-4999a2ef9b6mr62184645e9.2.1786954855688;
        Mon, 17 Aug 2026 01:20:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:55 -0700 (PDT)
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
Subject: [PATCH net-next v20 06/10] net: dsa: tag_mtk: add Airoha variant usage of this TAG
Date: Mon, 17 Aug 2026 10:20:28 +0200
Message-ID: <20260817082034.20326-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
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
index 6f7f5c17b532..396c1e520852 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -60,6 +60,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_MXL862_VALUE		32
 #define DSA_TAG_PROTO_NETC_VALUE		33
 #define DSA_TAG_PROTO_KSZ8463_VALUE		34
+#define DSA_TAG_PROTO_AIROHA_VALUE		35
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -74,6 +75,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
 	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
 	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
+	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
 	DSA_TAG_PROTO_QCA		= DSA_TAG_PROTO_QCA_VALUE,
 	DSA_TAG_PROTO_TRAILER		= DSA_TAG_PROTO_TRAILER_VALUE,
 	DSA_TAG_PROTO_8021Q		= DSA_TAG_PROTO_8021Q_VALUE,
diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index d5e725b90d78..510055d7b1f3 100644
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
@@ -98,8 +105,12 @@ config NET_DSA_TAG_EDSA
 	  Say Y or M if you want to enable support for tagging frames for the
 	  Marvell switches which use EtherType DSA headers.
 
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
index b8c2667cd14a..fb8c359d6ef9 100644
--- a/net/dsa/Makefile
+++ b/net/dsa/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_NET_DSA_TAG_GSWIP) += tag_gswip.o
 obj-$(CONFIG_NET_DSA_TAG_HELLCREEK) += tag_hellcreek.o
 obj-$(CONFIG_NET_DSA_TAG_KSZ) += tag_ksz.o
 obj-$(CONFIG_NET_DSA_TAG_LAN9303) += tag_lan9303.o
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

