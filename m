Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3470547A0C2
	for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638854; cv=none; b=U7SM4VepdSsZxl2ZwTuW/5MqYaS7dN0huEU9HAiAj4q3IMFZmr9hVczb9iM73D8j34EjAQqT9N37JM+mh9PNLMZlvhInI09jBl981E0+SxzsMPtuNrVVFlqcDZFs4AG8BVayELAXW2QH7ekSzR+GL65wsYs1y9PFBLK2xJyShNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638854; c=relaxed/simple;
	bh=KybE467r2v1MOUcmEkc88VExWxzUR2AW6N1gN81j3ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XP7Boxcw3zMorY+MRMMX0GQUoS2Rc2ddFrneGZDjQEADByWWETEk/jb91wm7AKGW5eMS9Ishigz5NjhMxRFC/SlaAoFeRP8DxIxUgt3IVz24mMeJmpRJTV4bAi/GT/6Ilpliw+1vMeYMUF3xPFf1Jusy0Pxf5z0uwYltKR9vvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVU9/u2h; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVU9/u2h"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d319b84213so249675ad.1
        for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786638852; x=1787243652; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GVD1+XSIWN9etxd7MSlZkNE6f3T+ZdQMW52j2/SNBUI=;
        b=HVU9/u2hREqJHGab6Q7hq5N4bI0jwaVe3G92YRBrnmXvn3+UvB/voClmJpunbbch1E
         Ers+ZsX4cqO8xqCSl73upr8KJhJJHIL8aVZ17oiBBZzOopQFStDbN7Hj70pDiFIRJu0H
         w5ATCE0YbZ5XqWabWhlqtAcUfhkd6k6ypnbj3ThhnPMR0IfU+UP2A6DSFflHQwK8dZTY
         +QvG41z2mk+7tY65Tta7qKcfndJb2L44GLmRHmw+7rdk3CzEilYx0+XmCnfjQ/suvzUj
         OGMQIjxsz+Ip3uJW+i5I/5Wph8y1MrnwE4XYvrY8NueIlGbmK9vK0S1wbsGrGnv77nyI
         yWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638852; x=1787243652;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GVD1+XSIWN9etxd7MSlZkNE6f3T+ZdQMW52j2/SNBUI=;
        b=aP+bol635iiF3cpjFwCrF5bvn3IV+3KFjhk/Cf4RZORiQ4oQ49mB714PyiIa4GvsRF
         cjjYYDwikehw4pbJGn6P7/bB5VO9RC5zfiaQf13VbZAZ/5fNfJ9+UbfpNXVx+L/70gD+
         iOpy/kKFxL0yu5RiebThCWs/zih2jdVMZWrMwjt2vn2gB9yOFI9RZucDGow3+S6XL0dT
         AzeAfdwgH7Jc49W5gWzQiPxFNpwrLQOQNF4SBbIBpscftFCMpvjG4D9NNljNM+TrIsbo
         JRjr5sqEXyU3tWxqo3+pi0d6et01GmsyLFlV1PEsLtzrNyaJ0l/efXUbWJYLB2UaP6QW
         bHcg==
X-Gm-Message-State: AOJu0YxIcOczWBaXzwltC3xNwYmL8mhSoMH0Io7Oa+HX+jyfuI4AzBgk
	Mr5PmiwdESEzt7oPyXcJknoxJxast3nXsKWgPEEWm81MNHXysbYZPPDE
X-Gm-Gg: AR+sD13q16TrzsDC64zmK+AOW/t0fIRKW+pIeG5jGBHp4LTUQV82kpIpshrSTNNFJCe
	SQUHGae9GV5so/HoQ+Iq9Voqyrt1gjr9Xq5BULWLKzMmkaOi7QP9yupJUAZhe/wPZjBaDarGbZC
	sOzsp4Kqc7p3Uwz0HwiMNAYmpMcCpnVDPd9/rAvziGi4EsMIbpJrUOgUjMvK6lN1q9kA3W9ashr
	pxkG48Ypv7SjMazbDaC4CUkM7HuTiJzsjspYWX2oyvAY5cacF/N82+tvcdwoefr7/L8oDe+9Oup
	wltqckFSXZXPFDOn+Rnk82lDqpadJ5IYQAEDLRPko5yq0iUtwE6XYnohcLY08S1+wqlcdIMKeaf
	KT+7qd90N55SXNBjT0CWdfPVycvGIOvlHOu6axMJDu2BEtMRUsg3QQhQvxfmZMpBJOYJDLeGh/I
	XL6ow2sAT2CzHlq4/IGeJ0N94H0ekN1hxjdgZbgvLQxorqDBNbAYy2mathXP+Xss4sdbeZiOcU
X-Received: by 2002:a17:903:35d0:b0:2cf:ca85:57e2 with SMTP id d9443c01a7336-2d389344e5cmr49852345ad.1.1786638852267;
        Thu, 13 Aug 2026 09:34:12 -0700 (PDT)
Received: from [10.219.45.252] ([2409:40c2:5044:2bd6:f356:6376:2cfa:e7ff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d8casm10603376eec.3.2026.08.13.09.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:34:11 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Thu, 13 Aug 2026 22:03:53 +0530
Subject: [PATCH] dt-bindings: mfd: ti,keystone-devctrl: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSw5AMBRG4a3IHbuJ1iPYihiI/rghJW0jROxdY
 /gNznnIwwk8tclDDqd42W2EShMal8HOYDHRpDNdZbXKOQivuH3YLdjgHIPbuELRaKUn5KWhWB4
 Ok1z/tevf9wM0GVnYZQAAAA==
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786638844; l=5070;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=KybE467r2v1MOUcmEkc88VExWxzUR2AW6N1gN81j3ao=;
 b=uDBoLTKL/WyJNfH2ctuGPsUGLJgENsF6FPrEqhaeh3EVjeih0qRhPPZ9BLHHdSeLwO8XVzQpJ
 yw33URF9Ri6AR0aQAA/99mZtQCIl2Hnx5XuvSix7b9sb+0Fb/T2gwlh
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert the Texas Instruments Keystone Device State Control binding from
legacy text format to DT schema.

During the conversion, the following updates were made:
- Added "simple-mfd" to the allowed compatible strings.
- Enforced child bus properties (#address-cells, #size-cells, and ranges)
  to be required only when the "simple-mfd" compatible is present.
- Added patternProperties definitions to validate standard child nodes
- Updated the examples to demonstrate simple-mfd parent usage and updated
  node names to conform with standard Devicetree specifications.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Note:
Running dt_binding_check on patch will yield a warning for
'ti,keystone-reset' in the example block. The YAML conversion patch
for that child node is already in progress here:
https://lore.kernel.org/linux-devicetree/20260813-ti-keystone-reset-v1-1-189389503324@gmail.com/
---
 .../bindings/mfd/ti,keystone-devctrl.yaml          | 105 +++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           |  19 ----
 2 files changed, 105 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
new file mode 100644
index 000000000000..33a72c290fb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,keystone-devctrl.yaml
@@ -0,0 +1,105 @@
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
+    minItems: 2
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
+  "^keystone_dsp_gpio@[0-9a-f]+$":
+    type: object
+    description: Keystone DSP GPIO controller
+
+  "^keystone_irq@[0-9a-f]+$":
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
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: simple-mfd
+    then:
+      required:
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+    else:
+      properties:
+        "#address-cells": false
+        "#size-cells": false
+        ranges: false
+
+additionalProperties: false
+
+examples:
+  - |
+    device-state-control@2620000 {
+        compatible = "ti,keystone-devctrl", "syscon";
+        reg = <0x02620000 0x1000>;
+    };
+
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
+        keystone_irq@2a0 {
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

---
base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

