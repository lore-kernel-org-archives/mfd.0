Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DA03C13E0
	for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954848; cv=none; b=K9ZSrPm6eIq/fXJ3u/BPSudmtVW1+dF6Inoe+KDCSUyhYGGPx/vOAji5XW+TD/E0JPjOkCrJF5wK8LjHQLNXHvcIKZsNDeI/YmMVgtuax1syC/es96cpmAFNxXz8F00caUvDFz+Aj27m8u4bD6Eh3TYe4JwrId9VrgjkXkQl11s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954848; c=relaxed/simple;
	bh=7y5S0ThKweBnJIFIdstxVs81WWiUsDlt//Wvk+p7bhc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvzgEUyDCOoexNNwJIBZG35vFLn2qnw4JlioebLUwuSBkVyYFmhCIw1BxwtseChNtPzS6J/7QsOt3gNa/C1qVJs6cNPZf/TRj/iwrxx9Tz0xU1Ag4p7klX+3vz9riMxCQW3hqFdZ9ci4dQga/le8RUHMiDehRcA05ID4bMrby6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDsECbtu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDsECbtu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-495590dde14so38480285e9.0
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954845; x=1787559645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=qDsECbtusvyTWlot24Qzzwczme9eY1Y5U1ginV35xJ/sqWwPnKnn4QagATeDNni4HQ
         WYNNhp1aXsEYiHimMXtwKAJ/ffnrF6u8Bkvgpc2shwyfWtniqr0D38Lt2gqo+2MJHaus
         a9je6na2hZtIP2/0a4SLlLgA8n2PH7kDbrrpMzAU54DOaGIFjvv1auN70sL01HHPJtij
         SKKRucrXYpEA4QQ0JriFW7lMxw/vR206XmrU48YQdwIQJI2kgYYZ9mem3Ug75Hr8YoVR
         4UMxWb+dXTaDBImMuxODyURQFzjdikZhan8IplytQiC9+mLJevl1WWMkGjfaBtUVgrOX
         fmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954845; x=1787559645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=A6VxdMW3/Sj9Lur+G2Ih16nZIhjQ0kysnxrXdHTnXL9nNEUHCdCM33T5wprOe9uCMG
         SLtUj4RsuAReYOHm+3ZYTnordjgqfthvN7FBytuVcWbZo5aE2zF1py8YKE/H09ykEIYB
         oWrtfuq0mzDxfnU1qpX8GOdi0RBFdwXqFT0nDZ3VCrnuAYsbYd7N0Vg2fXGyhFrBnGn0
         pPofjXP6zZ4kxh8Kmyx5cpSWH97ZesDHlLbEPzMwk+6629rIPS4pi19AbWcPv/bnP7D4
         AddVdGWk8ACH0cCc0OV32J9459+aIPjqYy2beC4WV0+xKRhk1jEgEEf9dbr+Mektk+2Z
         3sQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6H0uDvLaQxCwxH4Wt0j5e1/JxyMxYDoQiG60iUD0fXqbVy0I00CwT0wFcM97IKuiRKs0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrfcv58HEP5CaypsPEgjvXupjv4FIMrNupFC0eEOKZnmmAx7G3
	GILTxsPKMMwnZq1q60WS5nXQZLXkNf/PmTYaCK/yC9AZkKZnmcFZq7UK
X-Gm-Gg: AR+sD10+W7S+5u/W/FXzE5r9I1WlZ69USoq92QwCeZ+8uMV7vXpukNmHo7qMstLZGin
	QjDunjCWbF1reVkoR6tDxZVZNC3SOERH7jtT/1NoqK0hMF8ezNSYBB/Ov4M53LMuidkwE62D5Ff
	0mBqg/Tau1o4GQ4qipEUfcuu2wdY6xbIBW7nTxMc+xwrZcLjCKOJu1+OGUg4ZNym+8NeODR42m4
	UFP5zKbi6Vf6UWyCfam21EbFIvgTpZGC/KHH6DvezGyLDN+T7IpYE5JiD83kou/byJZN+dKt1+a
	nS4Dz0bYY4QTtXPzZK4u0H/M8eYLk0H2gFWyXEuhyLekFcVKuc3qf6NATajOSmBX1es7eOU8tOb
	9+vT4Hf4Tbj1KCmxQWCvGaZBU/kHWPqoxPiTf3uLDkyonh16MFGPSzhSXIiYBwMbSUPya/YmBBG
	fcsLd5q9XUDbyAbPDYozTHgCGo9HDuv2pnb9xVujoyfcoykIzclCA/Uj6vUQ6/AzbUUnhdbIbV3
	eaada2DLfeC4Y0Fd8L2a8p7pGujy9doYL41RY5CDxoWuEkOnIzI1Z9WrrmtB+Fu4I8E
X-Received: by 2002:a05:600c:8218:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499879357cemr398067875e9.1.1786954844530;
        Mon, 17 Aug 2026 01:20:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:43 -0700 (PDT)
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
Subject: [PATCH net-next v20 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 17 Aug 2026 10:20:22 +0200
Message-ID: <20260817082034.20326-2-ansuelsmth@gmail.com>
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.53.0

