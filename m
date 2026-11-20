Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186392;
	b=lGoSmxoUgizWEMZnEkIMuzZjL9B02lA0QGZyPn8BhiN2nxyw+qDRALJXi2gWTzUsChc5
	 7P7p9h8DGklfGzkDxXn0MLnOEM8C032KV4us75dzNru+zFq07e7SqLEIGuUPwrU9c/JOs
	 R16F0mCaxaWSfxVOobSEtZuRAjcgtwuaRz8ia+oyjM/5j06HzLZn3CMJ8opcKDpEKJau9
	 TvFl42xo+4YzIFLH2XYpaXNaQ1cMKOkTkWjudbAN2l15druLREAODPpj+/tbATsc1JWFe
	 GNCVTUPCzPyAHMF90a0ZM9rsmy2sa0DPTyjZCebNrRiYBNaJtxJWkDbHr5DOhdECqAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186392;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc;
	bh=rByWdJJ+ZBeZxrDyTuD4YogNyB5OhHS8SzzLgtP4q6w=;
	b=qXtVhh3KKJ/OYNKpjKRZA8qrSXZsJND3yfRl5/nYubhIUQk7TDgI8zMvtsK6pcHeKcFb
	 P7TxH6GQMviwq+OJxGusWhrSBqvhNqfCv43CBctpCxhGaRlq9q4yAZ+aYRRTBMpOE+rXn
	 xoydNPSNCxu35p0ZBar5YrlAixVvXQP3oFSyeKJoI2J7jGChEClyHTgYGU/DYlgAEawll
	 d00RbuVouxAdc5IM2aKuSup8rE5YIOZv8FKCHKsLm125TwRfZHDGyfToMot+z++2beDLs
	 5vs8/xOS+jWR+PGgqW5AvN+HJSx80dIRMgzqmNt5AnZelr/Pf1IBSOL/dsfiJ1lSB8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Mr6JOjTp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2jPMGBXM;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ACA60A2629
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 14:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55ACA60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Mr6JOjTp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2jPMGBXM
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795186390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rByWdJJ+ZBeZxrDyTuD4YogNyB5OhHS8SzzLgtP4q6w=;
	b=Mr6JOjTpgH+EDY7DPxVZPRXidWCLxmRjxreInzdltvzij3LTzhAwkNrWqvLygsOqksMcsb
	6euvQqosfsYixFDhLv/YaANPN+V3z0g++jExA9SJKVAUWMEjiNgLzU9wtVgD35gX8R/vGD
	Erc4pDR1RwHlaxORScFb3xvMQ3n/VSDuZ6wiW1/DW6X3ya+eLg6zMevNTFUsjGKssQDq9y
	OFzOcdFhBL1LpmKF18UHE1iunw+2OP+Z8+i8QgKvz91Gz4AslIGi3DkMDvn2xCJfD7I/qT
	CI3mynIC8xkKmk6j15VOWIriVDYtodQ2plfN3n4i4y1nlPdvu+8vDVOGvdZXtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795186390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rByWdJJ+ZBeZxrDyTuD4YogNyB5OhHS8SzzLgtP4q6w=;
	b=2jPMGBXM9TNYOctH5mhJQy07DvzsAyOaPqgKio4DJC08dFcgrKvFwieAMiwBGDlJdTuxys
	/8Tht0MmsaKfJNCg==
Date: Fri, 20 Nov 2026 15:52:21 +0100
Subject: [PATCH net-next v5 4/9] dt-bindings: mfd: Add SoC-e SWIP parent
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
Message-Id: <20261120-devel-vstrassheim-soce-dsa-ml-v5-4-5de9225715e6@linutronix.de>
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

Add a binding for the SoC-e SWIP multifunction FPGA IP core.

Describe the shared MMIO address space and address translation for the
required addressed ethernet-switch child and the optional integrated
MDIO controller and MMIO-controlled MDIO multiplexer.

The parent is represented as an IP core, while the Ethernet switch is a
separate ethernet-switch@0 child with its own reg resource.

There are additional synthesis options like an integrated I2C controller
for SFPs, but these are not documented yet. The MFD representation makes
it easier to instantiate such subfunctionalities in future bindings.

Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
---
 .../devicetree/bindings/mfd/soce,swip.yaml         | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/soce,swip.yaml b/Documentation/devicetree/bindings/mfd/soce,swip.yaml
new file mode 100644
index 000000000000..69bb9eae379f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/soce,swip.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/soce,swip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SoC-e SWIP multifunction Ethernet switch FPGA IP core
+
+maintainers:
+  - Vasilij Strassheim <v.strassheim@linutronix.de>
+
+description:
+  SoC-e Switch IP (SWIP) cores integrate Ethernet switching logic, an
+  MDIO controller, and an MDIO bus multiplexer in one memory-mapped device.
+  The MDIO bus multiplexer is wired to the integrated MDIO controller.
+
+properties:
+  compatible:
+    const: soce,swip
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+  ethernet-switch@0:
+    $ref: /schemas/net/dsa/soce,swip-switch.yaml#
+    unevaluatedProperties: false
+
+  mdio-mux@202:
+    $ref: /schemas/net/mdio-mux-mmioreg.yaml#
+    unevaluatedProperties: false
+
+  mdio@204:
+    $ref: /schemas/net/soce,swip-mdio.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - ethernet-switch@0
+
+dependentRequired:
+  mdio-mux@202:
+    - mdio@204
+
+additionalProperties: false
+
+examples:
+  - |
+    ip-core@80020000 {
+        compatible = "soce,swip";
+        reg = <0x80020000 0x10000>;
+        ranges = <0x0 0x80020000 0x10000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ethernet-switch@0 {
+            compatible = "soce,swip-switch-00-04-0c-10";
+            reg = <0x0 0x10000>;
+
+            ethernet-ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                ethernet-port@0 {
+                    reg = <0>;
+                    phy-handle = <&switchphy0>;
+                    phy-mode = "rgmii-id";
+                };
+
+                ethernet-port@1 {
+                    reg = <1>;
+                    phy-handle = <&switchphy1>;
+                    phy-mode = "rgmii-id";
+                };
+
+                ethernet-port@2 {
+                    reg = <2>;
+                    ethernet = <&eth0>;
+                    phy-mode = "gmii";
+
+                    fixed-link {
+                        speed = <1000>;
+                        full-duplex;
+                    };
+                };
+            };
+        };
+
+        mdio-mux@202 {
+            compatible = "mdio-mux-mmioreg", "mdio-mux";
+            reg = <0x202 0x2>;
+            mux-mask = <0x07ff>;
+            mdio-parent-bus = <&mdio_parent>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            mdio@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                switchphy0: ethernet-phy@1 {
+                    compatible = "ethernet-phy-ieee802.3-c22";
+                    reg = <1>;
+                };
+            };
+
+            mdio@1 {
+                reg = <1>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                switchphy1: ethernet-phy@1 {
+                    compatible = "ethernet-phy-ieee802.3-c22";
+                    reg = <1>;
+                };
+            };
+        };
+
+        mdio_parent: mdio@204 {
+            compatible = "soce,swip-mdio";
+            reg = <0x204 0xc>, <0x200 0x2>;
+            reg-names = "data", "control";
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };

-- 
2.39.5

