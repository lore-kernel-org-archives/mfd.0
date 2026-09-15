Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978748CD48
	for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 12:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475914; cv=none; b=HyKcsPIpXbd9ycjpN00nqoSsvDp2J2A/CxCMn6BNdEdv2mOxbOS5ycVW7xWWUjmPeYg9BLSkyrHSQl8HhACgUx1fFIVE/d3gmmi07pHU95yyhot4d6QEdkb7BCKTzIrMamc5QvOTqr7h3ObgXLKJ/68j6QYeeQX5r30bGlIXaLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475914; c=relaxed/simple;
	bh=TtDaz1S2XoJCAkQ6yMlNi5cT9gUGaF3jEIf99JQb45s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqDppXVzIpOECFExWzs9FzPrlEgc96cXcYqtSUpQ4QXuu4VD5XFRVp8XCrDFxvc3/BhEGLqJGjtuR/s8hSjBB4YhOGCA18+SfQoTSiwgN2M2qbu+sieWLdBrhQSgcRS5cgxCzynkATJuJkwDwErBjW/R2SIE0vAgEvr5cpItWts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUc6XOxU; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUc6XOxU"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so1885505e9.2
        for <mfd@lists.linux.dev>; Tue, 15 Sep 2026 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475910; x=1790080710; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=dUc6XOxUUOAd7cu0aof3SYbH1n7KoR5elmSxVj5dQJ2AXX8WrbmKXLtkIPW1mN8qME
         25IwBIXRI/c7/zQBMAoZJZTnIW4S2gLdCQCqIje3wwr6pGMTX8QdP45o3R2pVyYXWyQ0
         CpS/j9sl3wL4SgrRlsNvZqoMmtS2ffyS72+ijRj1Wi5ufptseCb7V5YAaJBHciE0kEZu
         8lWGb/jwU6z+/QnW89wJwrvKJJ0yZ3TzWomQ1lN9dhWhohyJuW/+/8i+Auh0cOAsR0iS
         3hLBNAdhxS0JLGs5WTue1bJCaCK2KkvOBh7KLrtdBCrAwFkWHACWFgZV97kmd39KFqeP
         WvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475910; x=1790080710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=eVE2adguDIHE/nZZgXIpVvvcjkbhZRtoYuywAjUMcxdGDr3hBEQMom3NOP62gPlYrz
         HtQXn0/BPpPvQ/UN2HWd6F/nuqGG2+VTO6xjI9Ri2GW/9x9W+njWyj22W6mMpPS7ctjR
         qKdIoZyFa1WVZx+rQEShYOLKj0XctHgE1GdxLYhGAdUtS5TAx2GqOArwgs5N0LCjvAz0
         F0wlEPGFtb5IXzZwZctKXVG4ztPMXAKg3ZYJOkp8iB+6toYcZe9mrQNtAdhIuwuBBPtq
         RtrKXe/Qj9fXU2crzAwy4xkoF1jfOBAx6zv1fLtB6YBFviVW+4N1vMOUw/McBDwxiEWa
         ysXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJm7wYohZ/ChsihxWvBhE5DSI9KkKCPr+9r2KfGc0U66CFrymsUbIvtePeD78VvWDlhgg=@lists.linux.dev
X-Gm-Message-State: AFuF++k/3fiYaUonB+K+rxJ5VT4DepNC1hen+/Pt193qCttv76FmMceY
	2wVvdoQ7wQDMM73kri3ERs3OLqztKiYSn9VOfR9an7gJ1wsFeaUo4WcW
X-Gm-Gg: AYBFou2hIqK+wrE6UihEQZUXCa/wQS3y+VBoG4MB6g2WDqnLyy6E0EQJ+f2bhK4wRw9
	+6MH1jlYk6ujQK4yB09hc9J2sHIvtg7Rl92/LMkNXKeEtTxNqCGTBfL4Beoi2F+YS9Zjw8Ra1Yz
	mSXMbcHXk6yzzk9u1tXEYjpAuS8W9mY5vm9uP2q/B0fLojrhb38ay5o+t4arimBZ+ORmYW2ikvZ
	3bH/Lq8uhGajm7E2i+BHI6akx/AYv4FNAp3F7OAqKOzZKSu99WPmQdcF76yCwvGlZyhDZupszF2
	jQACZHlRVz3c4HNjjfxj/pMeYdtrhwzc4zBYcCDIJYSUH2VS/yBSv+mtuFfQqB4IhXO2Fa9MRhd
	eZdhI2DI7DwE71FV6ExNTJ03Qh+zQmCb4ToDYGVdm9eJ/SdPji0eZ4KpjZCsdwygZKdLtYjswzk
	2hkQRCuqNcC1ZbHL2/WepUYswJpSzLHwFsOnIifIFpBj1108ojk+U3DP17j1uL4AmIik0UIOQqw
	N1VxqmiPVna8zL0GlKmTatOjClIPq8j7bnbV7VCbPKcvr9oVjJHW8OsXnEBT4+y
X-Received: by 2002:a05:600c:46d1:b0:49c:e27c:6b10 with SMTP id 5b1f17b1804b1-49e82213fffmr15058835e9.3.1789475909648;
        Tue, 15 Sep 2026 05:38:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:29 -0700 (PDT)
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
Subject: [PATCH net-next v22 3/9] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue, 15 Sep 2026 14:38:00 +0200
Message-ID: <20260915123812.14747-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..48127e956c96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.53.0

