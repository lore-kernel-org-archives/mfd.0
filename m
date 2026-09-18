Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC51C3DD521
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765374; cv=none; b=B8G6+UDwR/Ym2k6V0r75I4aHLPezBy45ijkg+7cDtHCO0JbvPoNWAds5sCbTx1PCwvCkyWBCLyFxcTv/G4vUL5DyNBBW4/hy+XU8NCwzZu/pMUrEuVNF272VEqj/5PujbEFGaqglyV9Asxobz0jiUtMYXkFDFpYVLAtLCPSXHkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765374; c=relaxed/simple;
	bh=7VFJeJ4QrNJQ+InqE+bbZQH2NYeGdB0Jrv+prGbC5A4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3H9UBaugoQ7f6SA3bXUgu14vmm7HN9yh/Km7Z0l/pp6WunpttbWwxdgtHbDSlIyUFiV22r3uejGKzAPZjBx0f43I8a0vb413dER9HMWuNhW1Z/j8vX/Gj/dOwBHHh1TPnqHNjfV4RV/SnTo8iI6QLd4qewtbNNESjr2hESu+Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tObWqtuJ; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tObWqtuJ"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1e1b51234so142319a12.3
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 14:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789765372; x=1790370172; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geikbrKsDXcFqc56hsKasFpB/gHezUrUiLv7oPljlwY=;
        b=tObWqtuJc4qR+GUk5MmNcDwyEKkD6/4nOvZNN3y+zHHIqjGdakSLfzG+NhQvdRPSr2
         Q0lNaLBmS5gKtBaK9nQmE4dUCBb0fEWyd4ipaAgudvzoq7goYDeq+HCf8Do2STzhQkOs
         vARQaoHr6tg2RKgRixEgozfy+JgHsbzZc4T2vQhE8WdbpDaEaG3tJqBv8Dm+V7sp1UZ9
         IGwCyNU8SajxCcOieYJjIcV3/2Gg/M4v2b1sJKBIok/Z0W9zTwGxh/POJ3GDLoJ4WA64
         +sqmdS1MQa7ymwwZmkTSnbmjD/ADb7EJ5HCB7kGWvXJAwcQgn33QI7D0iN2Vm3NaNKe7
         rpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789765372; x=1790370172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=geikbrKsDXcFqc56hsKasFpB/gHezUrUiLv7oPljlwY=;
        b=c8aJBn9k5F8WZp224XABC4a+fgf6bIJClXQF2FGqil2A1TgCFtbLPvO52ceoT9QbQJ
         D4sQcEqFnyVAxzUVH0CaNck08n8vfG+GIAlgwznoapmonh1lkiWsrszNlfS8gHOMNesI
         sO0mABI/lNEAtPcblR10MoT2fbke+A13xZlj3CdAEdgpKTsfvOOMZUZrEpQwBtJdveG6
         ohtOTj49Zs58Ohm9kL0fcZ4ZuuxHMQXxPpWidv9QjmqhGLSDz+FqwbtG/2ZWFfpmxVpz
         3iUr5rTyE/2JxkbovBv4lLDowobn4F9to9rlh7nbDJmnfE/yn62LtKPtuYE4iXUpoffx
         9WDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzw7Ajgi4FH8U7HIqECBDUK9fJtFwHix8RjKNn0KeEYeCBLWZA4Qr9KhTEKI8IcJxOpvT4=@lists.linux.dev
X-Gm-Message-State: AFuF++msaYw/W2jaEvSnfnk14T2GIVXOit04a3VhdgicUt4CbsyP1PBU
	hkkVopf4utWza2nBEHxDgFd7nT4FDPhKHX58R1hHg1z3NwlVneomBxEb
X-Gm-Gg: AYBFou1b6mboAJTPC782fxj5188nL3Gm7U54PLjZ44sR3Yw6Byd1Q4VWvDc/UdvZfHP
	gUVUrnXXV1m003BBgThefnWKm4bGND+j6YocQg/GgXeP5XI81sQhGrTUF1ezgD4AJbYFDbVW01B
	kHEUFklB9MPgY6cyvsYa3TTa+2JLFm8uJlEIw5VWLvOu2kKwd43fvdGLVp5hhP2L0f4/PiHnIpW
	5o6PCpd20ISHeuQyNC7pqlF/f74dyzBNgRXXdKJJyqbfzW1mz8belMV82mii2OIpMgGvtTlIqD9
	0lrFXrY8hZZMC3ks5S6uUoRIwDVOYx1jhRVLY4wmfjRVRefLlR2WZVRUY6g4BVGDfLMhT6i+8LR
	euPlbvJRIy8AENFSrjWno+StsqrKq0ESaQzkUf11yNleRc2aojjFXIwdkkJo6QhN89E+6zFBHXq
	q8q9csw+L8Wj4nSNCoeOYgi/uoJSexy7n36HCq81wbMOKWBgDiUJHEMkhl3ezi+jMZONnb5AJ7R
	Go5zBmF
X-Received: by 2002:a17:90b:5303:b0:39e:56a2:b81 with SMTP id 98e67ed59e1d1-39e598b5a15mr6134359a91.3.1789765372243;
        Fri, 18 Sep 2026 14:02:52 -0700 (PDT)
Received: from [10.198.60.252] ([2409:40c2:5404:cbbd:a461:609f:eccf:23f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55ab3a3sm1396904c88.5.2026.09.18.14.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:02:51 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sat, 19 Sep 2026 02:31:25 +0530
Subject: [PATCH v3 4/4] regulator: dt-bindings: ti,tps6586x: Convert to DT
 schema
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-ti-tps6586x-v3-4-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
In-Reply-To: <20260919-ti-tps6586x-v3-0-63dd240f4684@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789765290; l=10424;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=7VFJeJ4QrNJQ+InqE+bbZQH2NYeGdB0Jrv+prGbC5A4=;
 b=kn13BB5y4Wt5AneZVvAv+A4peK674VBv3FPrC+PiZ9CNnmVuQAgL+oAcMRI7xDwBKRmRPQ6Bn
 vV+4FfWx+iaDtVqFcZte9dejveVcH1QnwC5q2dy1CLPAS1CdfkDMOLC
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Convert Texas Instruments tps6586x regulator binding from text to DT
schema. Reference to nvidia,tegra-regulators-coupling in child regulator
nodes.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++++++++
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
 2 files changed, 196 insertions(+), 135 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
new file mode 100644
index 000000000000..1f7c7b35066f
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/ti,tps6586x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS6586x family of regulators
+
+maintainers:
+  - Thierry Reding <thierry.reding@avionic-design.de>
+
+properties:
+  compatible:
+    const: ti,tps6586x
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  sys-supply:
+    description: The input supply for SYS.
+
+  ti,system-power-controller:
+    type: boolean
+    description:
+      Whether or not this PMIC is controlling the system power.
+
+  regulators:
+    type: object
+    additionalProperties: false
+    description:
+      list of regulators provided by this controller, LDO5 and LDO_RTC is
+      supplied by SYS regulator internally and driver take care of making
+      proper parent child relationship.
+
+    properties:
+      sys:
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+    patternProperties:
+      "^ldo([0-9]|_rtc)$":
+        type: object
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+        unevaluatedProperties: false
+
+      "^sm[0-2]$":
+        type: object
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+        unevaluatedProperties: false
+
+patternProperties:
+  "^vin-sm[0-2]-supply$":
+    description: The input supply for the corresponding SM (SM0, SM1, or SM2).
+
+  "^vinldo(01|23|4|678|9)-supply$":
+    description: The input supply for the corresponding LDO or group of LDOs.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+  - "#gpio-cells"
+  - gpio-controller
+  - sys-supply
+  - vin-sm0-supply
+  - vin-sm1-supply
+  - vin-sm2-supply
+  - vinldo01-supply
+  - vinldo23-supply
+  - vinldo4-supply
+  - vinldo678-supply
+  - vinldo9-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@34 {
+          compatible = "ti,tps6586x";
+          reg = <0x34>;
+          interrupts = <0 88 0x4>;
+
+          #gpio-cells = <2>;
+          gpio-controller;
+
+          ti,system-power-controller;
+
+          sys-supply = <&vdd_5v0_sys>;
+          vin-sm0-supply = <&sys_reg>;
+          vin-sm1-supply = <&sys_reg>;
+          vin-sm2-supply = <&sys_reg>;
+          vinldo01-supply = <&sm2_reg>;
+          vinldo23-supply = <&sm2_reg>;
+          vinldo4-supply = <&sm2_reg>;
+          vinldo678-supply = <&sm2_reg>;
+          vinldo9-supply = <&sm2_reg>;
+
+          regulators {
+              sys {
+                  regulator-name = "vdd_sys";
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm0 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm1 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              sm2 {
+                  regulator-min-microvolt = <3000000>;
+                  regulator-max-microvolt = <4550000>;
+                  regulator-boot-on;
+                  regulator-always-on;
+              };
+
+              ldo0 {
+                  regulator-name = "PCIE CLK";
+                  regulator-min-microvolt = <3300000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo1 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+              };
+
+              ldo2 {
+                  regulator-min-microvolt = < 725000>;
+                  regulator-max-microvolt = <1500000>;
+              };
+
+              ldo3 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo4 {
+                  regulator-min-microvolt = <1700000>;
+                  regulator-max-microvolt = <2475000>;
+              };
+
+              ldo5 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo6 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo7 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo8 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+
+              ldo9 {
+                  regulator-min-microvolt = <1250000>;
+                  regulator-max-microvolt = <3300000>;
+              };
+          };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/tps6586x.txt b/Documentation/devicetree/bindings/regulator/tps6586x.txt
deleted file mode 100644
index 8b40cac24d93..000000000000
--- a/Documentation/devicetree/bindings/regulator/tps6586x.txt
+++ /dev/null
@@ -1,135 +0,0 @@
-TPS6586x family of regulators
-
-Required properties:
-- compatible: "ti,tps6586x"
-- reg: I2C slave address
-- interrupts: the interrupt outputs of the controller
-- #gpio-cells: number of cells to describe a GPIO
-- gpio-controller: mark the device as a GPIO controller
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name (or the deprecated
-  regulator-compatible property if present), with valid values listed below.
-  The content of each sub-node is defined by the standard binding for
-  regulators; see regulator.txt.
-  sys, sm[0-2], ldo[0-9] and ldo_rtc
-- sys-supply: The input supply for SYS.
-- vin-sm0-supply: The input supply for the SM0.
-- vin-sm1-supply: The input supply for the SM1.
-- vin-sm2-supply: The input supply for the SM2.
-- vinldo01-supply: The input supply for the LDO1 and LDO2
-- vinldo23-supply: The input supply for the LDO2 and LDO3
-- vinldo4-supply: The input supply for the LDO4
-- vinldo678-supply: The input supply for the LDO6, LDO7 and LDO8
-- vinldo9-supply: The input supply for the LDO9
-
-Optional properties:
-- ti,system-power-controller: Telling whether or not this pmic is controlling
-  the system power.
-
-Each regulator is defined using the standard binding for regulators.
-
-Note: LDO5 and LDO_RTC is supplied by SYS regulator internally and driver
-      take care of making proper parent child relationship.
-
-Example:
-
-	pmu: tps6586x@34 {
-		compatible = "ti,tps6586x";
-		reg = <0x34>;
-		interrupts = <0 88 0x4>;
-
-		#gpio-cells = <2>;
-		gpio-controller;
-
-		ti,system-power-controller;
-
-		sys-supply = <&some_reg>;
-		vin-sm0-supply = <&some_reg>;
-		vin-sm1-supply = <&some_reg>;
-		vin-sm2-supply = <&some_reg>;
-		vinldo01-supply = <...>;
-		vinldo23-supply = <...>;
-		vinldo4-supply = <...>;
-		vinldo678-supply = <...>;
-		vinldo9-supply = <...>;
-
-		regulators {
-			sys_reg: sys {
-				regulator-name = "vdd_sys";
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm0_reg: sm0 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm1_reg: sm1 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sm2_reg: sm2 {
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <4550000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo0_reg: ldo0 {
-				regulator-name = "PCIE CLK";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo1_reg: ldo1 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-			};
-
-			ldo2_reg: ldo2 {
-				regulator-min-microvolt = < 725000>;
-				regulator-max-microvolt = <1500000>;
-			};
-
-			ldo3_reg: ldo3 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo4_reg: ldo4 {
-				regulator-min-microvolt = <1700000>;
-				regulator-max-microvolt = <2475000>;
-			};
-
-			ldo5_reg: ldo5 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo6_reg: ldo6 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo7_reg: ldo7 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo8_reg: ldo8 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo9_reg: ldo9 {
-				regulator-min-microvolt = <1250000>;
-				regulator-max-microvolt = <3300000>;
-			};
-		};
-	};

-- 
2.55.0

