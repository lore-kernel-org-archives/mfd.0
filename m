Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD56840B6D4
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167280; cv=none; b=tY8bVVxi+kqj+dPIgU9Pbi5fkDncns8jm8g3pLxFnMAPijJ1Gxb5BDFhLXEaMF2KnXMWIh4AXR0hurFjTwzUXN2bdM4hZeCGaVmEO1zxXX8Fw0KEpH2hmLWxecUtIsxCzIc5DuIgrEhjh1xvj+bUNWMwRFDqcTZfo/0JFExUrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167280; c=relaxed/simple;
	bh=TtDaz1S2XoJCAkQ6yMlNi5cT9gUGaF3jEIf99JQb45s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E59EAETpdfbztJBF2CaiVlplVJiAcoyAmxloZCjzbT5rwlD3jT9y9Ldegrfa8BChzcF/RH4p9PEfp5dFgS8JuQeH4WC6A1HtuHnUpPf6QSSeQXPjs6ZAnq9cdMNmzHPC2cPUv56qTHwkX8GbfWXUxbcnOk1zWw1b+R5JDtGcf58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uwds/557; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwds/557"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so13900045e9.2
        for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 15:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167277; x=1789772077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=Uwds/557x/4nd/CuC6H1zT81REV5DHBqxlkmU2tdZeZlyBEbeRovfBzgC/jb3e4O8m
         Bab+oj2l/XRZH4WxCYa/hkbyrSkVSR1qyNnBpmbeg1LWporufhPiCMNlJTqdW+Dcc0Yu
         7KV1xKZRQKHywbsKHJT3XifX8XAAHm2gv9EcoCV+PmQdS73Gp3dP55csXPg/Y21kHtYc
         PRXu+8bFrIDYcbX6xNTI/E1sX5BhjO71pDs2lSNcqM4FaZf7mpETkHF3DyDrUjqguLR/
         BISaO8oY9rNEjoU92xfNcsdO1XWmYh5oMQKYF/lML6vDO1yRYBlnl2EOUXT5HcWV5ZCj
         oHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167277; x=1789772077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=gcIge0HJ//dhbFFQp0BzmrEcj47to2gvoHn6e5biXRmj5I5BgeagJaw1WK9wEUzaCf
         +cjGe39dQcOXQuM8O7SvDU4KEkiQuv2HAgX97nOWFohNZp+w0ztElNjReQz9otQr1cTt
         LsTd2u/EPQgrApjANFYrLSPNSkjyNM5K84QGxij2fN3I6ZxatMteLt8nddr/O5GAWbhr
         5Ll/awy+p1Ef155yEz27/fTb2/DR1i/OOpjEpsd/85FLiROwv51DXZok8zunaSN6vM24
         69PT3/STBLcsVnKYx3PwOxavzqnpHYpMKwNrJ79WTTc1JlYQFKPoo7ehEYuV4wqWdlCj
         xoWw==
X-Forwarded-Encrypted: i=1; AKwUvBxSKpC4BKSoycEzyCfj6LJIvRpApOQpBcUYBzY4VWCImxt7vKJXQTvg7X9J182367RYJow=@lists.linux.dev
X-Gm-Message-State: AFuF++klCB1kcd510gi0XMRqYwcCNNScg37R8SQ9FWJCu5m/5L8ajiSk
	Anfhz52veXpZH3ZEglOWbuLSAx+mxJiU246cQWRBDnEChmGT9BeXP4Kg
X-Gm-Gg: AYBFou2QUA7fLZTrObM/p03OIzy63TpVa81M7c0OBeGVUi+aV7A2Fjjh+eis+RiEkjs
	oZ0mFz59FFWS36rseJFpfC8qKH4XDoYJ6DY7t1/EKfyl3sK4jI7kcWEXYBYF+0WBCVutNeAH5t/
	kxN6rxllkHrsa9q4E68AzgRw5hDDmzm5R7xLHvQDD9ySZESDHzRwJ0ZzE6CePc5fxSazbpysHa0
	TgfyV/YZO5Zqme7+ZL4DBx+qwDnspP5D2N+MaCXBaD+AELkiPCSA8WvAV59TgKiVGEEPzMj8tun
	DlReMn+Rw2SzjOxS/AzzkpGZjfdr1RYaYbAHsf4km5jmC8iP7lomtLW3xseVqriMRrkB0qfk8YE
	TCEecNJawU+29VF3WF7YwVuUuhx3Ifh/I79LLTsunhkxpeSAazobufim1sILyGajtmP3KgPMlvw
	AVOxbjvWMrDpXnQYf9JDz0PIsD0hGwH3ByJp5WIn48RmnPqbQ4KnLKoyu9I5zdHeut8nPrUStP4
	9AWUU5NeGiqrNwAFycFc0tViXuur/4XteMINcVVEaGepeQGKzVYgLIBSoNfOVH2i/oi1YndsA==
X-Received: by 2002:a05:600d:864d:10b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49e61983764mr53966765e9.2.1789167276867;
        Fri, 11 Sep 2026 15:54:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:36 -0700 (PDT)
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
Subject: [PATCH net-next v21 3/9] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Sat, 12 Sep 2026 00:53:27 +0200
Message-ID: <20260911225414.225980-4-ansuelsmth@gmail.com>
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

