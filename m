Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186390;
	b=pV4udELUclLgJtC4O6SmC3glt60CCUfnnyijbVEeqgTdOGnPji1xCnY/f5thSmNSGD5Y
	 SUjwSytCtJPIwmTfVHkMaYL2uCbbITmulXKvFniCIGe8XY/a8Txa/5Y2lQjtrbBdS/+R2
	 Zb8OpXr3XGSZCTdr997V9UfDaJqGv3Qn54LO3wuCZe5sZa3Y5KaW4obj9EsaFOg/yOudi
	 wYA75s/yBwincrvMfH4Pb66jEkYgDDZski/I05DBN5ceCcSIJekSzDF6pdohSWaeo5qC+
	 OqAT3jt1oO/1MvSRqFKnCCJ0t/Q1eDFpYJkTQ+Qn6WMX5qJjx3z5sJDFp1ZBrDsmH8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186390;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc;
	bh=ayCS7YjxC0rYRgHPPNliFHTX6NulF62RGdEjDbL3Cig=;
	b=bhUCjNd77U20X1/qU04dz4Rov70+jw6yAFNlsYCAzrSEpiC2R3Uo6r3ryBIV1JJXP0oV
	 uueQshayDpds0GZNwT//Eu+M6UiRUTotHSfmeZoyncHvMv4yd7QmJBg/ZkbM/8wx5615v
	 Y0KRkVmxGrEL/hovKcOT61Q1ztU48wg6IIp3JdpqbdJJcXrhBv1Eym+cBcO6SGZuxdx+6
	 GRSUJWYFKO45Vy1sw0Yx+I5Se2YxfpUH1+o31hP1lq7o9PN21NbSeOKJFE/QsMyfMpcyS
	 SfE596OUq+PLH+1tU4WGOlFVc/X9cfrc8EtthzzCtuZVjO2cxyLzaCEf84tQ+kv1CYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bimSdIGQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vgVP7nNy;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2251606A326
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 14:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2251606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bimSdIGQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vgVP7nNy
From: Vasilij Strassheim <v.strassheim@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795186388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ayCS7YjxC0rYRgHPPNliFHTX6NulF62RGdEjDbL3Cig=;
	b=bimSdIGQEQ6NBL/3ftfQ05g2R0HjE8rDLy4W1V1idtdQez9BkeZnMjNPA6kFT81Mw6mxyW
	tYDuNurY636BOcnR7xv/PEoeLnD0flObseDkJTGf2ltLSOPdcN46lU7kK0kvOV9oA3kLT2
	55ObQxbJ0RvlVzAF9fo7KB281ac9Y2gbvzd3hM68j6rSE/P8l3BC/s4TuKn9C0KsMQ68Sn
	RngFcPCEIkE0PGhIAMJBXv3WhBJtIFe1xPE5jtvpal36Oo8jLzSzcuanAJG5PLd6fwaaaE
	8dkcMrledwpUydeZbNLerakPFfZPqMhM/RK+n62x+Wcoo3xxz7fl9YGd+bj1OA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795186388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ayCS7YjxC0rYRgHPPNliFHTX6NulF62RGdEjDbL3Cig=;
	b=vgVP7nNyUvRY8qLfj4UVGxxsOGroXhaYb8HNLtcwWbob1pMzwRtG90gjn2jaSUoUqWp+BJ
	RftAf0w6IQNko3Ag==
Date: Fri, 20 Nov 2026 15:52:19 +0100
Subject: [PATCH net-next v5 2/9] dt-bindings: net: Add SoC-e SWIP MDIO
 controller
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
Message-Id: <20261120-devel-vstrassheim-soce-dsa-ml-v5-2-5de9225715e6@linutronix.de>
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

Add a binding for the MDIO controller integrated into SoC-e SWIP
Ethernet switch IP cores.

The binding describes the transaction data registers and the lower
16-bit half of the control register shared with the external MDIO bus
selector. A sibling generic MMIO MDIO mux uses the upper half to select
the external bus.

Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>
---
 .../devicetree/bindings/net/soce,swip-mdio.yaml    | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/soce,swip-mdio.yaml b/Documentation/devicetree/bindings/net/soce,swip-mdio.yaml
new file mode 100644
index 000000000000..7a0b8bd3ab71
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/soce,swip-mdio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/soce,swip-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SoC-e SWIP FPGA MDIO controller
+
+maintainers:
+  - Vasilij Strassheim <v.strassheim@linutronix.de>
+
+description:
+  MDIO controller integrated into the SoC-e Switch IP (SWIP) FPGA core.
+  External MDIO buses are selected through a sibling MMIO MDIO mux.
+
+$ref: mdio.yaml#
+
+properties:
+  compatible:
+    const: soce,swip-mdio
+
+  reg:
+    items:
+      - description: MDIO parameter, write data, and read data registers
+      - description: Lower 16-bit half of the MDIO transaction control register
+
+  reg-names:
+    items:
+      - const: data
+      - const: control
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio@204 {
+        compatible = "soce,swip-mdio";
+        reg = <0x204 0xc>, <0x200 0x2>;
+        reg-names = "data", "control";
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };

-- 
2.39.5

