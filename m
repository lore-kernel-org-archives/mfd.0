Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F2937F337
	for <mfd@lists.linux.dev>; Sat, 15 Aug 2026 08:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782899; cv=none; b=apcsZW5hdTuxpZRqH06lGSfimrW3RixdoH9dONmQMUWwV/7TMd/GZUPVmqP6AZ7DaY3Aceqpntn+Q5u2vmzJfbVQvCVzXLcZZdrG9mbJoDFb1HqZickf6SlBoRNOzkwEX6dXU/IyHGtcVs0yj4gOCS9kSFJjXYaryWIzJ9YRDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782899; c=relaxed/simple;
	bh=m6g2XUJeHF1PIlSodfI1hjH2eJL9yELjoJ2ytDpo5Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mYqJBqyq0bBd72SP2KY2DtmK/wvZVbdBbb24VWmrAghrZitv1RMvzctiXUAGNrtniPdY7AofQAsDP9nLnKK3B7NZc+cRTufotS8uFk/BO0njp/qA3L8qOWqJ+hl/9qQV6ldHLJxbhXr/ZQI4rhA+yqv6PFPAGHHXb34siqZ8myo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8UtdMLA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8UtdMLA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-472326ca506so1212326f8f.2
        for <mfd@lists.linux.dev>; Sat, 15 Aug 2026 01:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786782896; x=1787387696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzGpX7JiK+m5ce9c9KT1xWR6DUie8OR3CMeaDAX9MSE=;
        b=E8UtdMLAj/xWQL7Cyi7NOng/vLgrZCOLXW2OvCwRluqM3x6dbuhIUJde0DxjEV8B9d
         VgvEL9fnhWAu0FmVWoJIL7gi93/cw2leaABgTNFcHg0Jf1OOOp9JxDJvr0vpAovMJfxr
         Ma2j0Xrs3+SqOtwRnM5mzfzXOq+q/2D2IkU3jAi6Z9SEFEwbEmy+kvhSvCavukA/ApD1
         uU7rnhpEHcriRHh6SvT7RlQa5zfN/XKR5HuLkcUvpWMXHgtGF43mJGHdW/YAGwj5Y+7P
         T2f3JVFcc8lOC2k6SgWfVSVtVluTJCpkJPUrzxaAbChUU6eEtvIuttNV7VfmZkxwzQu7
         ksvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786782896; x=1787387696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzGpX7JiK+m5ce9c9KT1xWR6DUie8OR3CMeaDAX9MSE=;
        b=T+FAE0A5zqUHBKxa0sDajxOUuNsKplACcG2tUYxd1aryPdVJBaOWsnz0Q5pB+91c89
         jOZY+cCVAHKoQ5U3NDw5yDXevMXDVwgNlEkWoYWq3gGUfvX7h8wGDcaZKAZZcicsCraj
         ERwzvUo4eKC4Dt/CpZU+ngUX9WgpI4dH98xYFjdQbaTqxsry4Y8fjPBhKomuGceJ7PGZ
         vP3akVQWF2dmbTYSIeJQ0sCX2J2W76/TPrXRVrVymCWJovQ2TnqM1OAOJqtQNxxFUR1s
         o/JubPvsD08/aBHA/7ndTDvD2dXjbDRBkso5wb36OV9fTugFv4SVe+tBogrCiK9stCih
         D+gw==
X-Forwarded-Encrypted: i=1; AHgh+RpqjzDU3cbI0HrIAJM5o+4KtzxOo1L/JeKG0UnhpDPMZ/LBiC3Hl91UwKmm2ExRy7BZj2A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWk1OtzpeBVUU7R11f92esrV3fkzQDIDHC392Qpdy7pfh4CWU9
	aXhpih19yZ6ASb4d4mXcwyWIx9rIl0PrxhPSvYSdWsT17Qet4kINrYlm
X-Gm-Gg: AR+sD126Rc67U4JwIXiParXH8z1RjngbQPLfTcMkrC/NRoC7Z5CMN9XaHNror7VjaeK
	SOEj6hflI4RYjfLxKGsSz392Gf370bdA1bYYdYyvdZq+nwXRPe+0xmdY9B9E9imVX34GPWrztEY
	DCnUr46fFj/eUqHEZ98PJS+Spjrbw2teGL/jutjNZufS8CJwymZAplMbhdVW1uKY+uz4hCP4bUt
	V+jTjXCKKVOho8rzS+Rn1n/U2iZbLh3tSTM/q00Sgs+z/eEhD3l4Lvlk/IzZ0869aSsBHUag2Oe
	6YX8hxdHP7qFxZP2i/t8zjoed2htEjeROUqyy0YuN1r9M3KNtCUPPxdAR43SF8gBK9IHtoofVsU
	wPY0cPiewmDEmkP2CXiFpLN+ZebNjRZS4IIuIQ+3clqP0YCy5AqQl8RWnA7t0Uf/JyS9xuyPZcA
	Gd63nHOT/0n4MDZ2NnaHBCbJXdu+Wz/0G8iaw/6taUEE4EUsns8WoNv6tyAVC34rjbME/sHPZm2
	s7DmxL4CoNsQj2tRfjWZZsTYVcPHKk=
X-Received: by 2002:a5d:5303:0:b0:47f:8802:c182 with SMTP id ffacd0b85a97d-481607a3329mr13321970f8f.29.1786782895668;
        Sat, 15 Aug 2026 01:34:55 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.242])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4815f2005b0sm16295848f8f.8.2026.08.15.01.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 01:34:55 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Eduard Bostina <egbostina@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	Rob Herring <robh@kernel.org>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Date: Sat, 15 Aug 2026 08:34:51 +0000
Message-ID: <20260815083451.2147129-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
schema.

During the conversion, the following updates were made:
- Changed 'twl6040,audpwron-gpio' to 'ti,audpwron-gpio', which was
  misnamed in the old txt binding.
- Made 'gpio-controller', '#gpio-cells', and 'ti,audpwron-gpio' optional
  because modern platforms do not require them.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/mfd/ti,twl6040.yaml   | 142 ++++++++++++++++++
 .../devicetree/bindings/mfd/twl6040.txt       |  67 ---------
 2 files changed, 142 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
new file mode 100644
index 000000000000..a93835aa9153
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,twl6040.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TWL6040 family audio codec
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  The TWL6040s are 8-channel high quality low-power audio codecs providing
+  audio, vibra and GPO functionality on OMAP4+ platforms. They are connected
+  to the host processor via i2c for commands, McPDM for audio data and
+  commands.
+
+properties:
+  compatible:
+    enum:
+      - ti,twl6040
+      - ti,twl6041
+
+  reg:
+    const: 0x4b
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 1
+
+  "#clock-cells":
+    const: 0
+
+  ti,audpwron-gpio:
+    maxItems: 1
+    description: Power on GPIO line for the twl6040
+
+  vio-supply:
+    description: Regulator for the twl6040 VIO supply
+
+  v2v1-supply:
+    description: Regulator for the twl6040 V2V1 supply
+
+  enable-active-high:
+    type: boolean
+    description: To power on the twl6040 during boot.
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - clk32k
+        - mclk
+
+  vddvibl-supply:
+    description: Regulator for the left vibra motor
+
+  vddvibr-supply:
+    description: Regulator for the right vibra motor
+
+  vibra:
+    type: object
+    additionalProperties: false
+    properties:
+      ti,vibldrv-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for left driver
+      ti,vibrdrv-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for right driver
+      ti,viblmotor-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for left motor
+      ti,vibrmotor-res:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Resistance parameter for right motor
+      vddvibl_uV:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: vddvibl default voltage if it needs to be changed
+      vddvibr_uV:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: vddvibr default voltage if it needs to be changed
+
+    required:
+      - ti,vibldrv-res
+      - ti,vibrdrv-res
+      - ti,viblmotor-res
+      - ti,vibrmotor-res
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#clock-cells"
+  - vio-supply
+  - v2v1-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        audio-codec@4b {
+            compatible = "ti,twl6040";
+            reg = <0x4b>;
+            interrupts = <0 119 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-parent = <&gic>;
+            gpio-controller;
+            #gpio-cells = <1>;
+            #clock-cells = <0>;
+            ti,audpwron-gpio = <&gpio4 31 0>;
+
+            vio-supply = <&v1v8>;
+            v2v1-supply = <&v2v1>;
+            enable-active-high;
+
+            /* regulators for vibra motor */
+            vddvibl-supply = <&vbat>;
+            vddvibr-supply = <&vbat>;
+
+            vibra {
+                ti,vibldrv-res = <8>;
+                ti,vibrdrv-res = <3>;
+                ti,viblmotor-res = <10>;
+                ti,vibrmotor-res = <10>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/twl6040.txt b/Documentation/devicetree/bindings/mfd/twl6040.txt
deleted file mode 100644
index dfd8683ede0c..000000000000
--- a/Documentation/devicetree/bindings/mfd/twl6040.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-Texas Instruments TWL6040 family
-
-The TWL6040s are 8-channel high quality low-power audio codecs providing audio,
-vibra and GPO functionality on OMAP4+ platforms.
-They are connected to the host processor via i2c for commands, McPDM for audio
-data and commands.
-
-Required properties:
-- compatible : "ti,twl6040" for twl6040, "ti,twl6041" for twl6041
-- reg: must be 0x4b for i2c address
-- interrupts: twl6040 has one interrupt line connecteded to the main SoC
-- gpio-controller:
-- #gpio-cells = <1>: twl6040 provides GPO lines.
-- #clock-cells = <0>; twl6040 is a provider of pdmclk which is used by McPDM
-- twl6040,audpwron-gpio: Power on GPIO line for the twl6040
-
-- vio-supply: Regulator for the twl6040 VIO supply
-- v2v1-supply: Regulator for the twl6040 V2V1 supply
-
-Optional properties, nodes:
-- enable-active-high: To power on the twl6040 during boot.
-- clocks: phandle to the clk32k and/or to mclk clock provider
-- clock-names: Must be "clk32k" for the 32K clock and "mclk" for the MCLK.
-
-Vibra functionality
-Required properties:
-- vddvibl-supply: Regulator for the left vibra motor
-- vddvibr-supply: Regulator for the right vibra motor
-- vibra { }: Configuration section for vibra parameters containing the following
-	     properties:
-- ti,vibldrv-res: Resistance parameter for left driver
-- ti,vibrdrv-res: Resistance parameter for right driver
-- ti,viblmotor-res: Resistance parameter for left motor
-- ti,viblmotor-res: Resistance parameter for right motor
-
-Optional properties within vibra { } section:
-- vddvibl_uV: If the vddvibl default voltage need to be changed
-- vddvibr_uV: If the vddvibr default voltage need to be changed
-
-Example:
-&i2c1 {
-	twl6040: twl@4b {
-		compatible = "ti,twl6040";
-
-		interrupts = <0 119 4>;
-		interrupt-parent = <&gic>;
-		twl6040,audpwron-gpio = <&gpio4 31 0>;
-
-		vio-supply = <&v1v8>;
-		v2v1-supply = <&v2v1>;
-		enable-active-high;
-
-		/* regulators for vibra motor */
-		vddvibl-supply = <&vbat>;
-		vddvibr-supply = <&vbat>;
-
-		vibra {
-			/* Vibra driver, motor resistance parameters */
-			ti,vibldrv-res = <8>;
-			ti,vibrdrv-res = <3>;
-			ti,viblmotor-res = <10>;
-			ti,vibrmotor-res = <10>;
-		};
-	};
-};
-
-/include/ "twl6040.dtsi"
-- 
2.43.0

