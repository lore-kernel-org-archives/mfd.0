Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7590436494F
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187589; cv=none; b=D0hlIx77PeNhF++tA7kFwj697d6+1ml556SEYvAsUstD5ox9A0bCa8S3ek1NeGz9TgNI8i5zkR77qadR1Y17G3YBNKC1sQM19scDv5zBGAG7/fslJ7UaZbak31Z5s1hvUdtOswTZq4IdgUcG5SVUygccoxVwO+kklEyV6qwk55g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187589; c=relaxed/simple;
	bh=3wtKqciQeOHcSakXZnMHLLISP+Cf8Obt+lYhptG6Gfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVQVcKL6ybTamkT0x63+mS+NfoF4S7z6yyOrhupFpzKQW7D+jWS4YPQxXBcGtJP93PS/FYdQAAGewwkUcs93A5aN9A7dIq8n8OJfZHYwSJZ6Z56mH7/MBSVupgg0XRaFWSLI95XF0ZmBh517Kysr6san5NnG0LSc4efP9IC5ev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eq/L3F2E; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eq/L3F2E"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8612812170so388518a12.2
        for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 07:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187588; x=1788792388; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8fnpAA71PpA4geiQW/S84jidbVYovY7D0FubXhURV0=;
        b=Eq/L3F2EwUx+MKOd8qPUP2H5BS+jjXDuWTnoigTs37xrusZNiOZlU0fR7aSnCWNhAQ
         sZbCuyvWkTC92OZ9svRiLp4uRQtixERsrtU6SOKBslqJut4uQ1J56UCz9tgYAsZ024yX
         Gc19jaxdKQ1aUX29vaZYTmCLj0b3QA8MI1eoqURolaM4DqBM13sWwu5aoqgo9jMb6TFA
         XbgpM8mbz8nZi5CgacmkpXNk2plt2k8cWuTM+t3/CMjNIOmM/lXV7C220ehLbMhM4syz
         M+vA+iBvazo1kho10y2oTcRIJuaQLONiMBUHoj6qthCpwNegfkaCQoX5Ck7uAHfMg4Bc
         9Kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187588; x=1788792388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8fnpAA71PpA4geiQW/S84jidbVYovY7D0FubXhURV0=;
        b=T6n59EYD7+o+52knTxpLo5AeqH60MrxG77zeUoIFl9JEKZwQO32cjqPq9OlMFeMo7f
         t4PLHPy33WkjkTeHNJ9rU69OyENaNopukaLuwa/YK/hus0KqTEoFq2aoW4Sv1k5TKUxZ
         CnSSQV99zcQOLiLN5liGXy2dgrp+NN+2oCMb9v6EVTUmt1aBXrPnuBkHhO23G0juVBlD
         sGb3VzUhOMh7YX6qN+VXgmtOtSbS6Zvf4YGLTfyv+9Xqyr8E06l7vtxppTZdbP06uWsf
         v+ETQPsj8kuWCvYx9p5/CbVhrwGFDTpZm3U87S+jtsVhr0i/riqJvAaU8Wrob42bkZNO
         h6tQ==
X-Gm-Message-State: AFuF++llbwOFCnWlHwib4LSCol4fTeqmTxnAT+n4xr+bSpkV5QETnGAN
	PHw+67u4ABM9HstGlFQ9Z22V2f9OZjr1zeV6yRwPZrCYGjOtchVLXRmL
X-Gm-Gg: AYBFou2KfpXWLG5cbm7/gyRtF+YUZlwXH2diLjWf/6eB4cpavMd4tjc9+PLoWYfGc6w
	RxYvLlUVdC1sbthe000l7+ctV4oUXLtZhDYK/EPo8iq//mWhMx6KhmYceDCHi07Fp/VPp84uIbM
	mT179H58rECg1rsIMaCThW7MEnTWyxBUYw3evgjl8XL1SnWkpDKQ5u8b3YXVWmCgUNvHZ2t5191
	xtyGTJlQbY9EHsrU4MFzO4cYOSlacrR5iv+vPGRxJD19P+goXgVyfIVJdB/Y1vudz0CWLgXFlrt
	3Quz4Jupd9BoSUb7mSvHDYgbRJfbYV8GE0Qlj2FTKyKCXepG3PyofOY4mjav5DlEwjuGEV05SvY
	6STZi9EJRHEb49MjGkZD5bBlEyK4X5Waz8/5Q0r+XxJXRpjTgxyYUp/298Sp4PQ4QmthjBQXqR6
	ReNsOEViBo0xzz/+1S+PJGHGnWwYz+ar9D65M0CFdu/bCbKoplxasQXkbJPTzfs6nLMWF2O3Q=
X-Received: by 2002:a17:90a:ec85:b0:398:bad2:c0f with SMTP id 98e67ed59e1d1-398bad20e7bmr12372505a91.5.1788187587501;
        Mon, 31 Aug 2026 07:46:27 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5009:b339:5edc:6eb2:1ff7:f053])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm43217279c88.0.2026.08.31.07.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:46:26 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Mon, 31 Aug 2026 20:15:35 +0530
Subject: [PATCH v3 2/2] dt-bindings: mfd: ti,keystone-devctrl: Convert to
 DT schema
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ti-keystone-devctrl-v3-2-0614fceba0f1@gmail.com>
References: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
In-Reply-To: <20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788187552; l=4030;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=3wtKqciQeOHcSakXZnMHLLISP+Cf8Obt+lYhptG6Gfw=;
 b=v4RdH5dbhuk9pP0rKYU9cicQ5Fllo/lac5Te5KW3tVVt/p0onHxeydqFkXSfhebx8aILFsc/Y
 ZB4HqXMtPa3AkHP7BDPKIX467EW/bn1Q+iBNPz1UA3+Sl7VtCWLo2+q
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema.

During the conversion, the following updates were made:
- Add "simple-mfd" to compatibles matching existing dts usage.
- Add required bus properties #address-cells, #size-cells, and ranges
  which were missing in text binding.
- Document child nodes gpio, interrupt-controller, and reset-controller.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 84 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 2 files changed, 84 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..dd73b62357ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,keystone-devctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Keystone Device State Control
+
+maintainers:
+  - Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
+
+description:
+  The Keystone II devices have a set of registers that are used to control the
+  status of its peripherals. This node is intended to allow access to this
+  functionality.
+
+properties:
+  compatible:
+    items:
+      - const: ti,keystone-devctrl
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
+  ranges: true
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP GPIO controller
+
+  "^interrupt-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP to ARM interrupt controller
+
+  "^reset-controller@[0-9a-f]+$":
+    type: object
+    description: Keystone reset controller
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    device-state-control@2620000 {
+        compatible = "ti,keystone-devctrl", "syscon", "simple-mfd";
+        reg = <0x02620000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x02620000 0x1000>;
+
+        interrupt-controller@2a0 {
+            compatible = "ti,keystone-irq";
+            reg = <0x2a0 0x4>;
+            interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            ti,syscon-dev = <&devctrl 0x2a0>;
+        };
+
+        reset-controller@328 {
+            compatible = "ti,keystone-reset";
+            reg = <0x328 0x10>;
+            ti,syscon-pll = <&pllctrl 0xe4>;
+            ti,syscon-dev = <&devctrl 0x328>;
+            ti,wdt-list = <0>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
deleted file mode 100644
index 71a1f5963936..000000000000
--- a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-* Device tree bindings for Texas Instruments keystone device state control
-
-The Keystone II devices have a set of registers that are used to control
-the status of its peripherals. This node is intended to allow access to
-this functionality.
-
-Required properties:
-
-- compatible:		"ti,keystone-devctrl", "syscon"
-
-- reg:			contains offset/length value for device state control
-			registers space.
-
-Example:
-
-devctrl: device-state-control@02620000 {
-	compatible = "ti,keystone-devctrl", "syscon";
-	reg = <0x02620000 0x1000>;
-};

-- 
2.55.0

