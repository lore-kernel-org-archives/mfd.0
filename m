Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440345;
	b=TFMKWbfqxY8s2BHGd1aDb61PpiOoY1h0VyQef7ZfKxwkB7/wP7iA1R5iisrPgBdRHZO1
	 DWt+cWhiBuhjy6AruyIM0EyaYtiWaN1a7Pv8Qz/4kiD8tSrx+vCJlRiAlJYbeil98ENCY
	 0l6dgOgXY2PjOxVd+ibVHPEeTrP2FdKDz+oF292yedQAHOdrlFWe4/imcF4uxYmO7wm9Q
	 c4eSCyUNjPxPWmdqysPULiDhOKMiBiWBifmPL3oQZJSviAWIezwegayTvAcr/cmiDnpf7
	 QxkuEJJYV2OvmqnLj8d1R9ZLshYRR3Ug4049ajIkGj88yQsMiOeXPNir2wXnxA4wbjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440345;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer;
	bh=URu20HOx1V3fAUrNtBnQmt6dwNehMVtt7uCyxpQHTs8=;
	b=kfoIGvuLY6aAHpQL/y2yu1dZOGFSqkJVZrOKkAUob2nkT0O3xw1lDtsLaicydJ12YLcj
	 iBoLh/TknsaRSrUEtJr8Zr/Aw7zqRBJ+St0afOG4K3YPS1h1W4+LVVHmZea0mmgLCqzL6
	 uvQj2K9yc+aZytPzMVIJ8ggZckM+RuC78HRowpHEET429KtLjnfVyNNtQInBi3Bjj66Do
	 W175Nx1vbbF+qCphFYCSXh5jnIdoCXJYXces3sKZ5IPsBAzSLX5C1x3F1BOYLf44K7mQN
	 IuA/vmS+MaGV6ri2C3x/+ynxejaIcKAf9FAyNOjNkasQMJSITow8ibW2QO6W/P86lEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=FrJFc6zm;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4461E606A699
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 13:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4461E606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=FrJFc6zm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795440345; x=1826976345;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=1pCgMcYWlFbwmXsksCggSw+46t6101lOBZsvJTMzEqg=;
  b=FrJFc6zmfccsAwm6Z0/zuCzKxSFhKjIlQCwHRMHEtT0YtErSm0FSXPQa
   6sunLyGAw4opCFv7mhUnAMgdSVVzyVSJtB8ZhX5GGZSNfR6S+T40f5+yp
   v+4NU9AvTJUGvzMUB7AC/yark3MArekyCmb61kgHkTFcn//gE+49x5Umq
   +89MVfd0QgMnutnJcnvFl+9Ticb+yHu6mK/r6WtJlf/Haw1HjuTHdhX1X
   1kHTYpEsC6YtOvnOdsu2EKKEZx0hrENa1sfKnzdTCyLznxhhjWueYMfdO
   kVJKR6w5EWEtyVBieG1YkYAXZeAxRHHN6HUsJPMQ/S/o2WET9CAsiojJw
   g==;
X-CSE-ConnectionGUID: T6AumBlzTmK0NbiqQp75MA==
X-CSE-MsgGUID: YaDYm93xRu25eqKQpwNSHA==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="67154010"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Nov 2026 06:25:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Nov 2026 06:25:44 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 06:25:42 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Mon, 23 Nov 2026 14:25:06 +0100
Subject: [PATCH 2/4] dt-bindings: mfd: Add the Microchip LAN9645x switch
 family
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
Content-Transfer-Encoding: 8bit
Message-ID: <20261123-mfd-ocelot-add-lan9645x-support-v1-2-567d811fe1de@microchip.com>
References: <20261123-mfd-ocelot-add-lan9645x-support-v1-0-567d811fe1de@microchip.com>
In-Reply-To: <20261123-mfd-ocelot-add-lan9645x-support-v1-0-567d811fe1de@microchip.com>
To: Colin Foster <colin.foster@in-advantage.com>, Lee Jones <lee@kernel.org>,
	<UNGLinuxDriver@microchip.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>
CC: <mfd@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

The LAN9645x switch is controlled externally over SPI the same way as
the VSC7512 described by mscc,ocelot.yaml, but the two families share
no child devices. Add a schema of its own for the LAN9645x.

The microchip,lan96455s compatible, the smallest SKU of the family, is
the fallback of the compatibles of the other SKUs, as in the switch
binding. The children are the microchip,lan96455f-pinctrl pin
controller, microchip,lan966x-miim MDIO buses and the switch.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
The $ref in this binding is to net/dsa/microchip,lan96455s-switch.yaml,
and the MAINTAINERS entry extended here is MICROCHIP LAN9645X ETHERNET
SWITCH DRIVER, both added by the LAN9645x DSA series in net-next and
expected in v7.5-rc1.
---
 .../bindings/mfd/microchip,lan96455s.yaml          | 132 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/microchip,lan96455s.yaml b/Documentation/devicetree/bindings/mfd/microchip,lan96455s.yaml
new file mode 100644
index 000000000000..82f7c6290004
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/microchip,lan96455s.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/microchip,lan96455s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN9645x Externally-Controlled Ethernet Switch
+
+maintainers:
+  - Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
+
+description: |
+  The LAN9645x is a family of ethernet switch chips without an internal CPU.
+  The chips are controlled externally over SPI. Besides the switch, they
+  contain a pin controller and MDIO controllers.
+
+properties:
+  compatible:
+    oneOf:
+      - const: microchip,lan96455s
+      - items:
+          - enum:
+              - microchip,lan96455f
+              - microchip,lan96457f
+              - microchip,lan96459f
+              - microchip,lan96457s
+              - microchip,lan96459s
+          - const: microchip,lan96455s
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^pinctrl@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/pinctrl/mscc,ocelot-pinctrl.yaml
+    properties:
+      compatible:
+        contains:
+          const: microchip,lan96455f-pinctrl
+
+  "^mdio@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/net/mscc,miim.yaml
+    properties:
+      compatible:
+        const: microchip,lan966x-miim
+
+  "^ethernet-switch@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/net/dsa/microchip,lan96455s-switch.yaml
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@0 {
+            compatible = "microchip,lan96455s";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            spi-max-frequency = <28000000>;
+
+            ethernet-switch@4000 {
+                compatible = "microchip,lan96455s-switch";
+                reg = <0x4000 0x244>, <0x8000 0x4c>, <0xc000 0x1f0>,
+                      <0x10000 0x134>, <0x14000 0x2c8>, <0x18000 0x1910>,
+                      <0x1c000 0x468>, <0x20000 0x1480>, <0x24000 0x468>,
+                      <0x28000 0x468>, <0x2c000 0x12d4>, <0x30000 0xe4>,
+                      <0x38000 0xb8>, <0x3c000 0xb8>, <0x40000 0xb8>,
+                      <0x44000 0xb8>, <0x48000 0xb8>, <0x4c000 0xb8>,
+                      <0x50000 0xb8>, <0x54000 0xb8>, <0x58000 0xb8>,
+                      <0x100000 0xa000>, <0x120000 0x1998>, <0x140000 0x7468>;
+                reg-names = "gcb", "qs", "ptp", "chip_top", "tas", "rew", "vcap0",
+                            "mep", "vcap1", "vcap2", "sys", "hsio", "dev0", "dev1",
+                            "dev2", "dev3", "dev4", "dev5", "dev6", "dev7", "dev8",
+                            "qsys", "afi", "ana";
+
+                ethernet-ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    ethernet-port@0 {
+                        reg = <0>;
+                        phy-handle = <&cuphy0>;
+                        phy-mode = "gmii";
+                    };
+                };
+            };
+
+            gpio_lan9645x: pinctrl@4028 {
+                compatible = "microchip,lan96455f-pinctrl";
+                reg = <0x4028 0x68>;
+                #gpio-cells = <2>;
+                gpio-controller;
+                gpio-ranges = <&gpio_lan9645x 0 0 51>;
+            };
+
+            mdio@40bc {
+                compatible = "microchip,lan966x-miim";
+                reg = <0x40bc 0x24>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                cuphy0: ethernet-phy@1 {
+                    reg = <1>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 97308edec53d..b254f8c92b0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18331,6 +18331,7 @@ M:	Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
 M:	UNGLinuxDriver@microchip.com
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/microchip,lan96455s.yaml
 F:	Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
 F:	drivers/net/dsa/microchip/lan9645x/*
 F:	include/linux/dsa/lan9645x.h

-- 
2.52.0

