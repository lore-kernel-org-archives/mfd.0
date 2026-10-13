Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F3048F006
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912934; cv=none; b=orXxBLdeJUH9nQhgOUSpz4a2kya2pSdSvleGgRSUBjv0dKPxEoaIp5jksHr5wxpAxYs2tH9Pzv/zN7LKy4qMNel9XO+kA8XAd+5LZ/Sw35VMg26fhyTvJrKlJ4iV2eO/3aJ/WJHAAVVvNewHrIBOu255ndJAL93mPF8etM691wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912934; c=relaxed/simple;
	bh=0ir6EEm9FNQCLp9OUbkjQzJH24SRp6mnaINdn/CT2yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeZjKHpiI9BOtAzO5z4PAcNc6sOofKh0wznTbE5ywbFHCAJsMOztP5bHWji6K0gVaR9g2q/BJ/oF+sFis23qu++DrTKhTAGbR4UtaKXFP6gKwZjXNpmqnApzd/YFtR99D/aPvGWTnM+Y3XhCbA/ZjZ6F6Bo8saWySBe78TkBfic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrvc0RmI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrvc0RmI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso23227835e9.1
        for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 10:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912931; x=1792517731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=Xrvc0RmIlyROBgQk0UXICIZCFpHELl+QlI93rzOM5ridHxQ5ntqfYxHKVsa6PeRluE
         IvbKsJQt/Z1CzXcqI+VUb3hDv3SaGT3eqy9XCtjZxxW80rC4rgHS4648InDqcoCbLvsb
         WTSXKJZxY1EmfQvNw2nzAlravE34jymU1I2rt7Gy1Xj1SOdmVeGLqAqGaYs9djHB6K9c
         cJslrlK2C6UQFivLXgTLhAtiwXXZ5A0cTDcaE8z4yYv3GChK5KISxPtPU6oI5YVYlJ/W
         e2dvDwgCFHXb5uXtbgrRFgcVdBWavz4s6M8JyfSRzbtRubDrdm79jJoagRht1RIL6tbN
         laSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912931; x=1792517731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y460qay5LS+R/33REWXsFlmhxRCfcVfcAqdFzdNEv44=;
        b=qG67CL5p+/K14jYf+L4IxQPx6kSZslDCs1/ngOJFfN0++PoTERlDyyOjf4mGgHY/uU
         EBHyb4gdY2OfxDkgLjgraz94XshIq2C/ehXEJuDZCGRSslNLtBDBgFaXcmkKH/IPruxp
         E3y8v7iyE1CyUQTYzXu9gMV3/pPtAAwVqBUHwt525qv7TsRagP3aeiuVdsFGuDkFruxs
         i+wmGJIo5PBJYFA/uLnnzfq/TBvlbyG5rbZFAOAWDlUHuu66iEcnyZ5Du1+m7uhMzXKI
         BKYb7DGTkb1ldrziAde99HyBzgP7oyOUOFQg96H5dItHvxhrQynQIn/AbzPmMkGp3qC5
         Osnw==
X-Forwarded-Encrypted: i=1; AKwUvBz8uS8Upx9juTTjtlfi82ROE0xxJXhL34uLBpqs8+SlA+nNVRLXliP9XpXIcoE/MuU6iHM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLSoAdmCVKLzQDadwgt6r72H4Gyu9JoIssl7BA8amfIOuSGcOrN
	JjrO3aTgqkSAisrSE3KHc3Q9OGtIITs/subqcaruI1fx5B+U4wTvF4wt
X-Gm-Gg: AYBFou2oK7EStqv4cVKAUSID5fhXsi/Ojs/Zebl+t+L2KG1CSNS3EqgW664rhJ9JvE1
	WABi5RlOsW2WO4M9Y8m4d69a2SZ03We6XHaIx9YA6rXnlXm+2nl0g1XLX0qvhI/Zfa6M2wGLdsR
	ckicNY7bCk9GPtRlRyTZrsSct19e9YEtehe4vfwBtOgh9uTjFLESDPwVO8xwl3mydihHM5dyKiE
	E9WRBLahACS1f7lAGjI5S7xkYxq9MvUPi3am/314u5gtz6PhXvleL0It40U4LBi41/Q13VGp3S9
	xiF+4tzSE03H5UPECHWADx3o9mv7sBGwcsE9Vq/orLliTElahi9V8B3PSbrvvBvDZJ4Twi9yyP9
	07cXHTVRABaJV7DT14MPbhIHD3gmcnymbjAWs2LN62pp1I2CM1NJOLa1kgwg+31N4IqcbfMCzVJ
	J9rQByoQ9fuMrkLZT3h6vzc9t2CBIW/K4HMq/8UK+lQufQmQCIibbJ3MaN2bKgJP6XPZW4XDaNh
	lmEXIjJjgZKFTjvM0kjSH0lAKF6kQ==
X-Received: by 2002:a05:600c:64c8:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a18e4c41b0mr240687655e9.21.1791912930626;
        Tue, 13 Oct 2026 10:35:30 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca51465sm284127195e9.4.2026.10.13.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:35:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v11 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Tue, 13 Oct 2026 20:34:57 +0300
Message-ID: <20261013173504.451391-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013173504.451391-1-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 0000000000000..60b6375864aaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.53.0

