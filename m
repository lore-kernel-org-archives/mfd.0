Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0B53E1228
	for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 10:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960949; cv=none; b=opqSctkFZnEk9OnSdI19XpKv5/Tv11HQpbiNgrAs5eHkPWSDWE+JfdCFRHhK9Yox9MGvp5284c+imJFMxM9S5vSGHypji6capbN0XB87SSW7QMhYkREwionjUQju3tJdvBnlTP/s0o5pHC9+gth6l0WRXt0BZBrCmpesygvT9pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960949; c=relaxed/simple;
	bh=Q2h113tVKecw0OrZU44B+Jd0YxaZaCLGYBCZpmNBfUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dYBrXER/e8hf0+LOiNM2AClhRVXoRGzUlqJIch6OFI30xcggObZJ38DlxbypNFnynXPZ2r/ugkxZSi9nWfMZJQ3jwJusFaOjTf8ktJ52cN+OD6pTS0diw9vgPE0cGvgZGlsMv8g8YgU20Z5/JeJEe5Llj5vdkG34pWNHJWa8kbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEKqZ/3Q; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEKqZ/3Q"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4980dc26022so31962355e9.1
        for <mfd@lists.linux.dev>; Mon, 17 Aug 2026 03:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786960933; x=1787565733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqJEqlY84oD9PFP/pbIju8kV6td9uIw0KsaaeOaBMEE=;
        b=sEKqZ/3QAgkdtRCS7+5lUasA0d2V4g0xhIC5GXXinfEhONwyOlo+/gXZUYdu1f6a+9
         4w4x+tPdZRyeGb5kLYFoH5JeljSceHyxPB+EFxyMaK/kMyeoBfSx52p25SOn4rcpOJS6
         A4CvhmrtvY2WpvGhwJ+fBFdUkXOCGBTC3oyAiqf5Dde4SD2IwvdVp1S1ryr1qDmBMZ7h
         mQt0yDe9U/VFiMFl43UOBkuGwNj5Vkd9VMF8r/zD7yrx3qjiDHD8OzAJb6tH7Rf81dPI
         N/IvhA4909gjfssaaRfz3BGSV3LcM5Tq3IkSqfty+X1ijn5lPyLeFa/XI+ZMwW4LhJtg
         6KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960933; x=1787565733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqJEqlY84oD9PFP/pbIju8kV6td9uIw0KsaaeOaBMEE=;
        b=d2g87OwlHqBHRbY2BLFKJU2zuCF1yOHrS/TZDTllYvAgOGezITtY1n2Vw8REXQQpMi
         orseEvPFlobo0BTnGriR9o/r2XC5F0tQzZ3+RFmgv9372K9im1sQ4K/jdV51lJLGT4oe
         b9OMtZZgf9El3ZZfVDxEFDkc4lzPfQpY4ahJ0TID8PnW4yxGvE34VEaZurdOUnJgSgav
         t+Q0xg8hS2IAH9q+16WLInhknXBJ4f1adQVZ+An2XgdXgOIY2+vNeOgVxXglPyUkzfje
         IBMwGWFBRpBAn6ul4FIT2w84QSKD1due227kT13jq+usdwW9Ono4EpGshlHomDT/3JOh
         goHw==
X-Forwarded-Encrypted: i=1; AHgh+RrN6BMNxwdct7tbMHRbGUEQDe5r1nk2L05HB7y3VVriRxcHLqo2OkNVBK15eG1yT+KB8wI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw9GzhTXr/BR2Zf4gBBd5dzrYwjmU8SGJVN0OAHbAa2OtJ0tG1
	XZQ1gH8di7i88OEpkJxKA1soc8Tj0UdE322oTLdGEwuT9tvxhFqQK3lm
X-Gm-Gg: AR+sD11cT2VpDq0f00n7dEKvz0y6koLVrcEdTWKPXlWv/5RDL7vuJTaOiJPFdL/yhTl
	99TqJOL7m/ivW84qYZHBV9EfQHrIozrN777Qrv9MSDymJt/ColB3CXCYSEBtLQ6kTihQfF7bL3Z
	EmZcUiBZ29Mvhe2bKErCU7+cHWWEWMZAZqQfBg7r5XEDIRuERGxrRWOJATQC6tg+aDjht0vQuJX
	SF3Ob2tcz5+hoOPQcGH3uHafzQR8XXJweU+Jh2vLK5199XrGNSCy/gajqWsAcjsKwF21xOca5b2
	ToQoiOcpPVNrQXBccTeGZmh0DPEk4wpBlQxPclV/fTFWO+Sodyb/69vDXcTRkcGG3F4CFVgrGQ8
	iCTYliynm3LmY7zBbQ3A9+48KG7tLUPwPlXJp2ecxLkuQjFdQQZ/e7xbH9vQklDdUwxN9+MO7AR
	IYu72gWZTT2lGtp06X6ggk83uR8o5rM2K1wPaxaPINx4ATgULQsNdqOi0y18+MEGeyPWu4Inyht
	QfyA/5HSainujR52RodvzuF+0+vUj0=
X-Received: by 2002:a05:600c:4713:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49993b395f5mr174213035e9.15.1786960932454;
        Mon, 17 Aug 2026 03:02:12 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.242])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999610ed6dsm170661445e9.8.2026.08.17.03.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:02:11 -0700 (PDT)
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
Subject: [PATCH v3] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Date: Mon, 17 Aug 2026 10:02:07 +0000
Message-ID: <20260817100207.2970303-1-egbostina@gmail.com>
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
- Required 'vddvibl-supply' and 'vddvibr-supply' when the 'vibra' child
  node is present, since the twl6040-vibra driver unconditionally
  requests both.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Changes in v3:
- Required 'vddvibl-supply' and 'vddvibr-supply' when the 'vibra' child
  node is present, since the twl6040-vibra driver requests both
  unconditionally.

Link to v2: https://lore.kernel.org/all/20260816092847.2522994-1-egbostina@gmail.com/
Link to v1: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@gmail.com/

 .../devicetree/bindings/mfd/ti,twl6040.yaml   | 151 ++++++++++++++++++
 .../devicetree/bindings/mfd/twl6040.txt       |  67 --------
 2 files changed, 151 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl6040.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
new file mode 100644
index 000000000000..0d4e620d25a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
@@ -0,0 +1,151 @@
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
+allOf:
+  - if:
+      required:
+        - vibra
+    then:
+      required:
+        - vddvibl-supply
+        - vddvibr-supply
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

