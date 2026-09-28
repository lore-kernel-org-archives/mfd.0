Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943DE4F4CF7
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 19:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624759; cv=none; b=K6LTgoVKP5+BWdMUmZJku0aWnn9BhAKsJ+GGcsSfOPjc01u3WVqDNoJ41nt0Q0cf1bbIz29aRW/luEQyEv7ZJwNAjel3RyVmhh0ZHSuPZXy8f9EGJf5zf4A+Fvf7Q03Jnv3E9fv8D6nFJ5TeyDA6gXNYPcs2tM0almZhLxQxll0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624759; c=relaxed/simple;
	bh=eGGtJucMub/H5IDPYhp85xFBOadbNNPXVb/tk0RokT4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k992nCIl/Sv6YGbEqWFR5atATNLPwWiaMzF1xQBYAHUBx2x/40dgO8VqSxJIUZr6QWsLEceL0g8RmuGxEpbv7d9/A8QY4kAZOvZ2zryX7xCaUU+NBKFqriLCjnhLa6oSj6GMtvAVBr3KW7BdFPNxnhvBW7v4D6cSulghYQkTExM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNaVFq3Y; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNaVFq3Y"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so2588385f8f.0
        for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 12:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624755; x=1791229555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=aNaVFq3YDaX0PLDuIvLn/7koR+YzrNdkmwQ9E4QS2T8eQ1DIZ1DH3Fbr7aqPTpLIJs
         hZ2OqEnOZYTkK09mTPaPQprpxcde5aB9MsaOfpGkdIuSBQ73nvFUrHMcAE4bQfvaeZrx
         W2J1L/QBFZSbTRBkpaNPFkbGDZXeNG2gLe4OPX/0lbHUlxV6Hf31gx/NTVj3Vno7q4gc
         Zs2w7YWq07/paeyF2YVAKfCBRr6Cl4uvo6gtgYt+eERKFwWuoaToOJIPFq6haf3mhiUI
         YjUmvKCyoUGWL64zQAPuzNJ70TyzaE8fN/9zA0ybNNHq90QOxagCs+ZurKbmvH26Bd5Z
         jZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624755; x=1791229555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=Dd/Z8NbZY0cmabS8pEBsfcogULnLjwvCGzF+aOIiFVMtn2/LqBxaFSlqFAP/+DxgYq
         0MgOqtZz35JSVQk9rJ9tU+NrhksRBZAs8PiQnRttIzaV1LA6ZnKgUkFV+brrQcMaZZUT
         6kKUA5vLOuFe16aRo3gM3sX3GbigcidzDaooIpZXOUHamC81/OJ7+ybxh/L488c1d+NB
         S9WeO/TvOTIqsv/EXK7xJqSsJ08LkWEXacLmIi+GWC5X2yuv/3h5q/Z7eoyXs5jK3EEj
         JvRAp1zSPHPpqAWcHGk3N2WJIpOhtFYk8EsFM3NYuVoB5zZcVblZndN1mYs1/8DclVSc
         2cfg==
X-Forwarded-Encrypted: i=1; AKwUvBz1o5eKhTlIO+igmkRHyL3VEi9MNQoWm0xD4UIkUezotqY3xb13HxGuTTXG7ObKce1/LMk=@lists.linux.dev
X-Gm-Message-State: AFq9FYKdO81Mah8axwpWi8TMZGoy4zPjMyAdV9bbmAosF3ttWlj74dGw
	F/Z1T8ki7f91fXhomniiYZtbTPCvtf3jG5mq3w4+0wrtYTcv2yWRf0Rs
X-Gm-Gg: AYBFou3Dd+HdBcCSbKMVrqOa9yqGTPZBXgaszLS7nZwebWElC7XTeRILBmkO/RnIq8W
	jqfDM9riUqNOga4Z12tVEe2N6mDEl9XaYDSRBAMMDczDOvjz/SYK2ocOnoGGyF7BtuIMqYerqQn
	RxNiyp2C8QtHBSK+J3024qriq8cDRxD4iIu0fN/xkSXROkQybRSbAr3Mk11LeaUYygUZAd0byrJ
	AWuqFo0DjWUqK5QxTHZxGlIrPnIvtBSylwoKbahyzB4TaKpLEE2A5GYMvveemUNdvswtsYSFVM8
	lcSYTWKI5mTh0voCD23H8+L4zjQhAT3OQTV4pcWl9wb8kzy4XhmxnUKFRUu1/e+33+1/41H6Fd5
	4KKarlYZTYs0ZOHkGRfZgSxJ1N8BLtk2dsRHby9gSTGAiHuJSE8M0bDoT+dwdQ39BScYTboQt29
	4/le23coa+sv75MXPjhO9xvLNqc8U8iNM8+pXoH1C4aA4veKbeJ6A4/om3XXVv6UQz4/5HnoZJ0
	xhSjB54jjVVELlyAI2PdZepAi4fSBoOqQghzOl9u0BAh7sR/h8Qp3JPbSWFfWMS
X-Received: by 2002:a5d:5f49:0:b0:48a:f1fb:e165 with SMTP id ffacd0b85a97d-48af1fbe9demr313504f8f.21.1790624754940;
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:54 -0700 (PDT)
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v24 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 28 Sep 2026 21:45:00 +0200
Message-ID: <20260928194511.41878-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
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
2.55.0

