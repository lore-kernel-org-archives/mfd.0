Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51645D5CC;
	Tue,  1 Sep 2026 20:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292962; cv=none; b=hK/KpZSrb8XJ5gFIuor0unjcFAoheBNH/XKkSEhcimV6wRp2iX4kduQr5mVYi5wr2FwjoUcI/JoXkUk/a7V3+yITgf8M787rdkRzsosG0arSHGOtMPGVjWVc13HbG5sPCDk1F0bcInwTVfWG4o6CEDt9Bc/0E9hjPaPqpj2QcWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292962; c=relaxed/simple;
	bh=rpeTvdPlZO9dqhn0uk+N1KElDzAuPj6t4AXgavpIc8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8/Hq+l4si/ZaehCK/IY8FvvjHelS5B0Mi7foAkAB2HxfYF5ZhkRH0Qp+RSueSbZ5WC/X3GccP0fMJUHHER2e4BCf7qUChArprEJ8BIYFjBLBQCZeYnrSVM1EMrqibl1Ik9bV2Y0tufA9lM7lsJzMwfSry2pxGsmcrxvciaSNwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPLF7yF/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPLF7yF/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7921F00A3A;
	Tue,  1 Sep 2026 20:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788292953;
	bh=kta5nfSdTnZ3X7Z63KlJeM0AM5lAxqOqTye/xsYsi0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MPLF7yF/nYoxWrOHNjWPwLM7dsA6hydqi8dClf1TT6qnbp2smiOjsyouMDgExwldy
	 CxBGHQ7vfuoyBCRhNe+H8F1d7lm/OKDLOTQr9W9tRkrs9zGTSwQWKH85dYQdS8FMsS
	 CaV9NUtPEUldwlhPOTJmOC7JWketm8eFabXG2CLGW4u/B72GZU4YySbkF8m0R5DLak
	 kscTS7pPnLfy30l9P6ukB/VbcTkuMSoLRFbqijY1CkBCB43w91Adz2kqvmNqPz29px
	 K4AehyUG+gN/Uc9KmljRlLMrVZ0KpoxbeqYcdY/WWCSmri1+lQVqOVfzkcg/Xfd4fO
	 l8nlxefeIn7rA==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 01 Sep 2026 22:02:13 +0200
Subject: [PATCH v2 08/13] dt-bindings: mfd: ab8500: Add regulators
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ux500-dts-snowball-regulator-v2-8-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3

The buck converters were not initially added to the device tree or
drivers as they are mostly always-on, but their outputs supply devices
which need to reference the correct regulator.

Describe the six AB8500 buck converters when the regulator node uses
"stericsson,ab8500-regulator". Describe the AB8505 converters under
their native VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM names when
the node uses "stericsson,ab8505-regulator".

Keeping the two namespaces conditional on the regulator compatible
avoids representing the distinct AB8505 VSAFE and VSMPSC rails with the
AB8500 SMPS3 and VAPE node names.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/mfd/stericsson,ab8500.yaml | 122 +++++++++++++++++++--
 1 file changed, 114 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
index 0fdfbfdfe88a..29e2faa992c9 100644
--- a/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
+++ b/Documentation/devicetree/bindings/mfd/stericsson,ab8500.yaml
@@ -324,6 +324,8 @@ properties:
 
   regulator:
     description: Node describing the AB8500 internal regulators.
+      LDO means low-dropout regulator. SMPS means switched-mode power
+      supply; the SMPS regulators described here are buck converters.
     type: object
 
     properties:
@@ -439,16 +441,117 @@ properties:
         $ref: /schemas/regulator/regulator.yaml#
         unevaluatedProperties: false
 
+    allOf:
+      - if:
+          properties:
+            compatible:
+              const: stericsson,ab8500-regulator
+        then:
+          properties:
+            ab8500_buck_smps1:
+              description: Analog buck converter for the VSMPS1 1.2V I/O
+                and memory supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_smps2:
+              description: Analog buck converter for the VSMPS2 1.8V I/O
+                and memory supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_smps3:
+              description: Analog buck converter for VSMPS3, which supplies
+                the VSAFE power domain.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_arm:
+              description: Analog buck converter for the VARM processor
+                supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_ape:
+              description: Analog buck converter for the VAPE application
+                processor supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8500_buck_mod:
+              description: Analog buck converter for the VMOD modem supply.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+      - if:
+          properties:
+            compatible:
+              const: stericsson,ab8505-regulator
+        then:
+          properties:
+            ab8505_buck_smpsa:
+              description: Analog buck converter for the VSMPSA 1.2V I/O
+                and memory supply. The selector range depends on OTP
+                configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_smpsb:
+              description: Analog buck converter for the VSMPSB 1.8V I/O
+                and memory supply. The selector range depends on OTP
+                configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_safe:
+              description: Analog buck converter for the VSAFE permanent
+                logic and DDR supply. The selector range depends on OTP
+                configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_arm:
+              description: Analog buck converter for the VARM processor
+                supply, with a 0.6V to 1.39375V selector range.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_smpsc:
+              description: Analog buck converter for the VSMPSC multimedia
+                and graphics supply. The selector range depends on OTP
+                configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
+            ab8505_buck_smpsm:
+              description: Analog buck converter for the VSMPSM modem
+                supply. The selector range depends on OTP configuration.
+              type: object
+              $ref: /schemas/regulator/regulator.yaml#
+              unevaluatedProperties: false
+
     required:
       - compatible
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
   regulator-external:
-    description: Node describing the AB8500 external regulators. This
-      concerns the autonomous regulators VSMPS1, VSMPS2 and VSMPS3
-      that are normally controlled by external electronics but also
-      sometimes need to be explicitly controlled by software.
+    description: Node describing AB8500 control interfaces for external
+      regulators. AB8500 controls these external devices through the
+      ExtSupply1Ena, ExtSupply2Ena and ExtSupply3Ena signals and associated
+      low-power-mode signals. They are distinct from the VSMPS1, VSMPS2 and
+      VSMPS3 buck converters integrated into AB8500.
     type: object
 
     properties:
@@ -456,19 +559,22 @@ properties:
         const: stericsson,ab8500-ext-regulator
 
       ab8500_ext1:
-        description: The voltage for the VSMPS1 external regulator
+        description: External regulator controlled through ExtSupply1Ena and
+          ExtSupply12LPn
         type: object
         $ref: /schemas/regulator/regulator.yaml#
         unevaluatedProperties: false
 
       ab8500_ext2:
-        description: The voltage for the VSMPS2 external regulator
+        description: External regulator controlled through ExtSupply2Ena and
+          ExtSupply12LPn
         type: object
         $ref: /schemas/regulator/regulator.yaml#
         unevaluatedProperties: false
 
       ab8500_ext3:
-        description: The voltage for the VSMPS3 external regulator
+        description: External regulator controlled through ExtSupply3Ena and
+          ExtSupply3LPn
         type: object
         $ref: /schemas/regulator/regulator.yaml#
         unevaluatedProperties: false

-- 
2.55.0

