Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186391;
	b=K6Re4PHnlmk2DYxDpP44ZFOo3B8+9BtJxt1GLyZhkfwBru2DpGm2YMKcEyu7qEOUG6x4
	 qoAYZ/yzN9bcQ7OKWBVvPMxwqQtoXbVTWAGaWVr1f408Y49SS0FFmHUZ9nlDOsLKdAR/w
	 Nln7B+j3PuicffHp6rokUbavNqOGFY5dR6oZnm3vn/cvQCx7GfikdO+TKw/l1DUzbWI6k
	 3CRjROT7SsNDBvrPhlAtIorgcDdJ+z9bsOqCjqesJFGzqc1vfumU+PVyMHEp4xxEq54jC
	 2I4pSjcdlTFOR7mG4BZUzico6t/7UwVw09ki9MTnNYcf+Z4KM2w56I4b18I5LE3MHqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186391;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc;
	bh=94inkeJy4LjwOcfHpl+KRLrbPNahiIQcWA/vLQy/r54=;
	b=k0NzHOpzv2nm/6FOU8PdBNsMZVxdidFKngKLOM4Yzo6uBYlWWmRAvYDqyIX8vb7FLmzj
	 xGfzqSFgBialqgZJJu7fL9f0iCZY2TozTYcuoodgC4Ua5hLM5PDuQuz3Ih4KrfwJY5rn0
	 K6neckcjr3CjmRij64HrFGwHU0tUZEozsSexx3F51R/x9FaYyVZrkvQ9ueGVZQ0kbrAB6
	 H1X5401sqBaap2hX9CDZV5KvUXCwzhV+dQq+6NWr7yJcySosET4srMnTjO9oBS1djJ6mI
	 8gmP9BPldjUyNduM6QbVcz6OHPeeo7gS9Cp8V7d4WbpA3BIRsjaZ7S5mUIc6fBkNlmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FZgWNMAf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bBjihSmI;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206660A260D
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 14:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9206660A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=FZgWNMAf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bBjihSmI
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795186389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94inkeJy4LjwOcfHpl+KRLrbPNahiIQcWA/vLQy/r54=;
	b=FZgWNMAfgWq3oMpmXEhLs4WDG+AyR3hm2+5rObOlHKsFU9YXmFHawa/ZieqpyU6WkFfWPO
	c1dqxN/dJrU0LHKi5HJDxIs5zTQErepCEK8sYEgKAIdqZ47dVuX6gRwx0/NfC1rytBsSlj
	RTjKmQ8WFaz2yYmCAj7Vw+cNvrvynnOZDskp+baOBky2XuVyGSzsFg499PQVBbWS6oDWZ5
	e82zoiXl8Pfw99b0ExsEhJfPHB6vHKCs990i5xVpUvzU0OoFdD7/0JOT7dtAu1ekpYd1AK
	ybCpRaPt6hfTgX85kxFmE0FO0ZAEYVqDzH+Aignaf6WiY1Nav1RTKO7Y1PA0qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795186389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94inkeJy4LjwOcfHpl+KRLrbPNahiIQcWA/vLQy/r54=;
	b=bBjihSmISCdyeDrGL2Q8OW4NUiNfBsuOGzgFR6tV1xvKxeJhT87Boer2BHQm9bt60NDJ4f
	+txTFdpa1TVdVMBA==
Date: Fri, 20 Nov 2026 15:52:20 +0100
Subject: [PATCH net-next v5 3/9] dt-bindings: net: dsa: Add SoC-e SWIP
 switch function
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
Message-Id: <20261120-devel-vstrassheim-soce-dsa-ml-v5-3-5de9225715e6@linutronix.de>
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

Add a binding for the Ethernet switch function integrated into SoC-e
SWIP cores as an addressed MFD child.

Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
---
 .../bindings/net/dsa/soce,swip-switch.yaml         | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/soce,swip-switch.yaml b/Documentation/devicetree/bindings/net/dsa/soce,swip-switch.yaml
new file mode 100644
index 000000000000..55232c0f3675
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/soce,swip-switch.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/soce,swip-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SoC-e SWIP FPGA Ethernet switch function
+
+maintainers:
+  - Vasilij Strassheim <v.strassheim@linutronix.de>
+
+description:
+  Ethernet switch function of the SoC-e Switch IP (SWIP) FPGA core. The port
+  count and presence of VLAN and STP register blocks depend on the FPGA
+  synthesis configuration.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: soce,swip-switch-00-04-0c-10
+    description:
+      This compatible identifies the register layout; its suffix gives
+      the offsets of the core version and feature identification
+      registers (0x00, 0x04, 0x0c, and 0x10). Port counts and optional
+      features depend on the FPGA synthesis configuration and are
+      detected at runtime using this register layout.
+
+  reg:
+    description:
+      Register window of the IP core. Switch register blocks are located at
+      offsets defined by the compatible. The MDIO controller and bus
+      multiplexer occupy separate subregions described by sibling nodes.
+    maxItems: 1
+
+  ethernet-ports:
+    type: object
+    patternProperties:
+      '^ethernet-port@[0-9a-f]+$':
+        type: object
+
+        properties:
+          reg:
+            maximum: 30
+            description: Switch port index, from 0 through 30.
+
+          phy-mode:
+            enum:
+              - mii
+              - gmii
+              - rmii
+              - rgmii
+              - rgmii-id
+              - rgmii-rxid
+              - rgmii-txid
+
+        required:
+          - reg
+          - phy-mode
+
+required:
+  - compatible
+  - reg
+  - ethernet-ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch@0 {
+        compatible = "soce,swip-switch-00-04-0c-10";
+        reg = <0x0 0x10000>;
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ethernet-port@0 {
+                reg = <0>;
+                phy-handle = <&switchphy0>;
+                phy-mode = "rgmii-id";
+            };
+
+            ethernet-port@1 {
+                reg = <1>;
+                phy-handle = <&switchphy1>;
+                phy-mode = "rgmii-id";
+            };
+
+            ethernet-port@2 {
+                reg = <2>;
+                ethernet = <&eth0>;
+                phy-mode = "gmii";
+
+                fixed-link {
+                    speed = <1000>;
+                    full-duplex;
+                };
+            };
+        };
+    };

-- 
2.39.5

