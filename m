Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553253;
	b=hna4w2m+Ynu2XfFk2S8w0Y2mzH4izLB9NU0GGzMSAgvu0sK0KNa9lgmrfcBvBPTfr2dK
	 KWsSxHRvCk/BRndRJ3DJt7PEZ4QZUEeTkqAg5GVcW9j5C9ES5+U3+qvHSKo9Xg8qdg5hh
	 JlnCOdwRzxSKUYcESpeG+fkSMBAq01GjgOr8iVgSyYGqCJsQNQf/nwZBo8GX1NzNqHx4B
	 dkylKJ3LZ14P0PLH05qYNiyYSczYg87wrS6Sgqh0qdx0Veq26Y4ekphKmkfcUvgsD/m/H
	 VO4tb1F52ZBNVC5HcdS5/+zgaByF8dp1waur/3LSNgRH+HsuGAObgktAVdZK2DgR26A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553253;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=/IFgNsJGkeuNU4ObYMEQqv131/wZU3KxT8YGF0h9LuA=;
	b=XMipTFj6HBftMsIdGTc0hLZLTp3YCQIzjxErDK898MNhPjdQ+QDkayUoVw9QXkBzUc18
	 zxQEh4FuHeyrN/cIigCxTwZyaWMElObU2lElCYn+WdyDJcOr5FVk5hQIR7/F9uozidSPR
	 UQsZSzrQ+nNObRP/I+Dx1pPlvvuFuwx9yCOaLBWRKeztAQ6r8t3GaJwLvltsBNXYXTR1F
	 xrN8jPYGvW8UCqsZ+suWVciAtgyDw9PtGTCcv+9/k3zrdZ+Q+S8qNJLXKb1CFKqRn7ldL
	 aTn9jzsGzDxu+ntypBcMPc5f5VXwkIIXPj6IpKWT8N8JqkJOeUAYo4ZevkCIpg+GHgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QiwE5SX1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEDC606A331;
	Tue, 24 Nov 2026 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QiwE5SX1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853461F000D2;
	Tue, 24 Nov 2026 20:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553252;
	bh=/IFgNsJGkeuNU4ObYMEQqv131/wZU3KxT8YGF0h9LuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QiwE5SX1Yi0ed8cX6cU0GTbqWuvhoGVj91Io6qHSQrGP0bHS/FS6/KnpRgDr+6jOg
	 CkCAiTh1nbh/OJX52+VtVjvMxExjai9F9AIzHXKwPaSAdCVoFnrALKEMqkHPHQ0CLR
	 IViwEwIIV/+FqrSK4q+UdXJpNVPkrsobbA+SOTO+wUm/XlJ3MIOYKHoZpmUpBETTXZ
	 zxb06E0JSSbHH4EnpYlWQkkDDsdycDM3BayAEpUTg3uYeiuiBWQ+skmSdC/Y442pEr
	 rSCKWCFiLRRQhUkAAV13NJpaBR3VnxWJfLoZnzah6Y2Odl12PmPkShyUrtQ0JtFMAh
	 ItDwI12WBfbXA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:34 -0600
Subject: [PATCH v2 1/9] dt-bindings: mfd: Add Marvell AP806/CP110 system
 controller schema
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
Message-Id: <20261124-dtbs-marvell-v2-1-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

The Marvell AP806 and CP110 lack specific compatibles. Add a dedicated
schema for the Marvell AP806 and CP110 system controllers and their
child devices.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Update compatibles to avoid old legacy ones
---
 .../mfd/marvell,ap806-cp110-system-controller.yaml | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml
new file mode 100644
index 000000000000..20110a033415
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/marvell,ap806-cp110-system-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell AP806 and CP110 system controller
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Gregory Clement <gregory.clement@bootlin.com>
+  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - marvell,ap806-syscon
+          - marvell,cp110-syscon
+      - const: syscon
+      - const: simple-mfd
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
+  clock:
+    oneOf:
+      - $ref: /schemas/clock/marvell,ap80x-clock.yaml#
+      - $ref: /schemas/clock/marvell,cp110-clock.yaml#
+
+  pinctrl:
+    oneOf:
+      - $ref: /schemas/pinctrl/marvell,ap806-pinctrl.yaml#
+      - $ref: /schemas/pinctrl/marvell,armada-7k-pinctrl.yaml#
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    $ref: /schemas/gpio/gpio-mvebu.yaml#
+
+  "^clock-cpu(@[0-9a-f]+)?$":
+    $ref: /schemas/clock/marvell,ap80x-clock.yaml#
+
+  "^thermal-sensor@[0-9a-f]+$":
+    $ref: /schemas/thermal/marvell,armada-ap806-thermal.yaml#
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: syscon-common.yaml#
+
+unevaluatedProperties: false

-- 
2.53.0

