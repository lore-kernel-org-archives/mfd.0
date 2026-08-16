Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DC826296
	for <mfd@lists.linux.dev>; Sun, 16 Aug 2026 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786872538; cv=none; b=KlRcb+AlV/LqyWDSedQR/6l1lLbdiVXW01QfDQ+xA7BcE/EU8OD+60N9zXsbaxR150kOXCAnMkyaLen2jagaz99XG70w2x4IpH3EfLnlKbWGIT9e9GDGKB2sJqAsrUPxiwvbetFx/i+WaMzA0/E09wlSeRRNTBQ1CcFGqmy05qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786872538; c=relaxed/simple;
	bh=kqVrIrNnBQ1VjhRJi1bUCmPpz+i0aZS+hhI4pFzi9XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obWiOUHeh/9PAQNDp6UOP+I9zTCMmWDFc7B+2ha3UxdcefMuifwA28RhfgjkRKN97VGg2LWMHpnZ2tyQAT9x+BcBpgkhQ3ZEmxQf3avP11iYNB0jvhwPA+IUvYmth5IvR0InBIMZmDr/S3esnVl3L6Rg8KF2sfjlZC98foVopvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e8ur9CW+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8ur9CW+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so21692045e9.2
        for <mfd@lists.linux.dev>; Sun, 16 Aug 2026 02:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786872535; x=1787477335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBCj9oCxfJbmsdkd1qMTWlBSZYgwZL6GNNn/TptES50=;
        b=e8ur9CW+DRHksm0L/wkG0DAYb2RXhm/9fEnMW/DOsp36Nl1x1nqM50+L17X1ZkcNX5
         QZYtGmqt38/nJpSzozi0gU6TBw7JMSblFcn66P8p/f5qWOqbxZNUVVAunvzpKNgK/F2o
         KvCAr9otiAft3QgTp/ZyE5ooDVuQS6oOn3/yRblFKD2dOGS6vSlyV4oZwjQhxizr4V2e
         DOHxzGkGIsdA9R9VrH56rdVRVbp6WVTL3uPnEE2VHeGDNKCTGDlartNptFT5QNy21Kys
         Ns7JVLJzM5N+RFTNATgBRyRyW59mDiwy4z73C4kUXbHWkFnimrtBIOlNXbqvQA+FuLC5
         t5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786872535; x=1787477335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBCj9oCxfJbmsdkd1qMTWlBSZYgwZL6GNNn/TptES50=;
        b=Jv+edgUn1WqsR6UwL0MUu5EWLHME83+7mgM6AYRUYjJuJ6Q5ox6cbMNwdjRZCYp3oc
         fM0uJKj/nYO41FvJ8Dhefnpih8AosivUh9nWBUqwQvJiI7yeeQaNqK45AYVabNlZd3a4
         Wab1Gm5KZ6hIQ1a46Q5LWj2G/INkl8TRPEHOgJh1DnlqNwd8tC8YMdLnQ6NH7RzJt0oq
         6OsT2zhR5UTlDCvNGPV6myzWFTWmEVHXnMh36os6qZEFAquSS/+0caGCBYQ2y8JH1upu
         rr594SJ82C00XVd359Qg1NokgDSKSewQuKvLYJ5T4L3rSu0lnyTOY6GCB1uYhQ4b/iJX
         Pslw==
X-Forwarded-Encrypted: i=1; AHgh+Rpe32pN6saYyB7sHfHV93fYW2XVdYUkk3hyrnhYNZ0X5P0cAGLMf2smOvcls2a1z2KSDwk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1KxBE9uFLs0Ol6eaUHI4CVSFT2fDnHZCV7H4Rl7Tg4NWjBA3i
	+u+tT8XZg5PtWPXvSTos7zhZh24a5iusEyDMOHW7NKxUMt25zq0kUCdE
X-Gm-Gg: AR+sD10s7lAxaAR+Bx6xNNXqsiDzD4/KFKlcdIpPxjoZCie/9H3kHkcZdbKAWNLPL1y
	S0U5b0lqaPtspIGx8KVc+p1LgcsaT4al0BHW0w3Kg/aHw/20+tWmwteEwoCGwMKRsZaBPsHR3F8
	2MLxrQMgT7yuP1vORzx4DldhG8SG6oj1aXBzA4Tb1nv/Hoqb5SwMpp9992ybKUGE5oNJ+LIqmrs
	LgWdqGISD1pfmGlPL6x6TRxIEomoGzZM7dCzlfPnowuOc2RAnKlKcjTPCAeQDKzlkc61F1C7Ibh
	SkjYI44pGGaov7W3jjLX48iDn9AF6SS8dtjeMjz8n3Th61s6URlenBMBApgR00N+2JqU8Tbla5w
	SotPevzgFzEV1ajBzWRvotIPah3b6qt6wvJNSHaLG+YRQ7x7Ef3FkIaCalYypBWmJ0ZHZneiS6Z
	wOjB1sgsyDL7dDzPnpvspRmVTbvGIa+bCnhcKaTLoik1iK2YEo0wPObfZdITC/P3Za2LUl9B2ZI
	aHdYQVxB0ddNId3NNTrXlmqibuBWDUvU4UOgsICGA==
X-Received: by 2002:a05:600c:5613:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49987937672mr178819095e9.5.1786872535219;
        Sun, 16 Aug 2026 02:28:55 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.242])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4815f2c6115sm22604604f8f.32.2026.08.16.02.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 02:28:54 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Date: Sun, 16 Aug 2026 09:28:47 +0000
Message-ID: <20260816092847.2522994-1-egbostina@gmail.com>
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
- Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to
  'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
  twl6040-vibra driver.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v2:
- Renamed the vibra 'vddvibl_uV'/'vddvibr_uV' properties to 
  'ti,vddvibl-uV'/'ti,vddvibr-uV', the names actually read by the
  twl6040-vibra driver.

Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@gmail.com/

 .../devicetree/bindings/mfd/ti,twl6040.yaml   | 142 ++++++++++++++++++
 .../devicetree/bindings/mfd/twl6040.txt       |  67 ---------
 2 files changed, 142 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
new file mode 100644
index 000000000000..011a1a58615a
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
+      ti,vddvibl-uV:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: vddvibl default voltage if it needs to be changed
+      ti,vddvibr-uV:
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

