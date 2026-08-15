Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41D629AB02
	for <mfd@lists.linux.dev>; Sat, 15 Aug 2026 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786782724; cv=none; b=cK1voeDVHU1M5zc1WdZAxDSeZVjkChNytGihYN7/wxFMsBbR49kurE9UutkBaF25vFK6LzgTFj2/3NV6JHHQBCATjqsy8zhg/aJIib9Jd0l92Nhm0gAKTmCHFzWiSifYa4oJRRhwX9Wx25e+0OOWF5thLyOMhVsLxtM2dJfYIB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786782724; c=relaxed/simple;
	bh=ig0Czw6EoJk1SeXGouZnD93LG49YWVcmjNh23KhFKG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bRdbGRI2mLMydFhh97CSWqQXFM2TxI3CgoRDwCcNSBFFeb+Kt6/1ImomIjwu+1E9oFZ+TzD+s2WjJNbBoaLQDdskr2qMjWN1K+MBZ9Iv/wfCRxWrwXOGWTse9R+QNCnsacAridhajbcd31T+tXyQRpBO3Xg0wX82gvML8akoEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCPmIauS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCPmIauS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so17472455e9.1
        for <mfd@lists.linux.dev>; Sat, 15 Aug 2026 01:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786782721; x=1787387521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JmXRmBb374yuyQNwVRXydj5Wcgj3TvsFot0DLbSW/P4=;
        b=DCPmIauSTSKpyS4a8hsjQduFXmZ75gJlhWdQnUNb99RYBrAJc3ZKxAEaGHlqMTirJC
         32q4NGwwB4qxpQyyPB0kReG3oPDoOrShgkI/O+Je8rf3liSbqkRjOgJKG4LLLb9TKKUu
         8j9p51OOdkzJBxl6XqdqgqSx611t1qAEytFseFnnmwIy+0Cmb9fUQ+8rAkaHomx1g4QQ
         IE41/pRDxGkYn6oOikb1V7pUUhPgvP/Xz2hk0QeRx5ElnuOK5J9E9eLR5bFkTpoF+yFj
         XqPJ4WDm7GPZIJIjAXse7AWjpSfTcTVo7UawwVfoj0CkujivjTbPdC8apZ7NWRLLyl3q
         p0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786782721; x=1787387521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmXRmBb374yuyQNwVRXydj5Wcgj3TvsFot0DLbSW/P4=;
        b=dCivK2Arz9WyY4QfUKVHQLD3Qpcw5RXtsW/oYI6Te2Wk35herEDN7VoycdoCNSA//X
         oVRTX+PFcekxY8R01nMryZNbUnoCCknd4tpmQT7/6mAlTaFLJ90cvob7ENIoMZUJRcxf
         4HMe+qBP13ppL0JCg9Htx/mG8kEESdJwLipOohAQyOz2ERmV5K1zi5NW4TSu0lfVlfwp
         7cjZzkwjeYQ5en+S6x3kCO5MADbQqgRhaUUX0t1aOgUJX2HHOHoYFGYzgY5G2XST0Yli
         MYVOmDtrr25qti7LzeFcjOXF3YPI0URvHSR/ICPLjK5GHdAtYohKxOSLE53wG9rFDLbg
         G9Ng==
X-Forwarded-Encrypted: i=1; AHgh+RqH6cbXzCDKhLg4vLUo4cyfgQl5+cB+M3oUaHLIXyCHEM1qgnlI9DlBSDqqe/P1GeDpuMM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzA555+RAnuT1OBoqbKENNtdWZuVox0Zp65e91DsifZY2++DqZv
	+QKW75BzWs4tmmeNUoNJ2hKZnAAEnJ1zizH+POw9NBowtnfeYa71exiW
X-Gm-Gg: AR+sD10N/86Q7sQy1ReImNbAWHzA5nwhfXJvzlQmLRYIsIhNy6QZ9Eb2Y2fzqfWNNbK
	Yy+As6R+dvQJ+fpiouZaazkyNOPxOTxdmdEQK37aFSSE/1TTRy8eccgTbvecjyUGfSqkMkkFfN8
	HP99vwQit/qhd3ur1a0Bk57KtdXNHb3yfedgZDeAIgWpP1QxfPFYt8DW2kG7bI2uRWQZnq7cIIP
	dEooYCOMymOrQze+9SPhOvxUdTj8xYPGRSW0X4QR2chOGzRcv1iuZhdZs7ngRWA35WZ15IFCXAy
	ELyHNSURqR7qxj6yYIxKjFLDjw5A3/CVtagsRKpGT7Lxz+TE1QZW50eQTPZibvhTyDbqlf4f6tB
	TZoilNbH9v5JGELk6HJ7YoqIeUZkkWJfZwucglZj9sjciiHkI4wxKrmwbE9evP/FpxdnVGcJ4AP
	VS3dEMtZUBbR/HblnVUiHpss4mI5CDVlY8tZog8Y1SQPsfGAK/5lM3AoZUpTS7qS9fSpQ9NrZT2
	sZ3Aqkq8PW0zdZtlPx0GNN8bCXGQ5c=
X-Received: by 2002:a05:600c:5643:b0:499:77ba:4b6 with SMTP id 5b1f17b1804b1-49987ad988emr113620185e9.9.1786782720567;
        Sat, 15 Aug 2026 01:32:00 -0700 (PDT)
Received: from localhost.localdomain ([82.137.32.242])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49988b1d33asm126774485e9.10.2026.08.15.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 01:32:00 -0700 (PDT)
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
Subject: [PATCH] dt-bindings: mfd: Convert TPS61050 to DT schema
Date: Sat, 15 Aug 2026 08:31:45 +0000
Message-ID: <20260815083145.2145984-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Texas Instruments TPS61050/TPS61052 boost converters bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 .../devicetree/bindings/mfd/ti,tps61050.yaml  | 92 +++++++++++++++++++
 .../devicetree/bindings/mfd/tps6105x.txt      | 62 -------------
 2 files changed, 92 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps61050.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/tps6105x.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps61050.yaml b/Documentation/devicetree/bindings/mfd/ti,tps61050.yaml
new file mode 100644
index 000000000000..974ef78d6e26
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,tps61050.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,tps61050.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPS61050/TPS61052 Boost Converter
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+description:
+  The TP61050/TPS61052 is a high-power "white LED driver". The device
+  provides LED, GPIO and regulator functionalities.
+
+properties:
+  compatible:
+    enum:
+      - ti,tps61050
+      - ti,tps61052
+
+  reg:
+    maxItems: 1
+
+  regulator:
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    description: Puts the chip in regulator mode.
+    unevaluatedProperties: false
+
+  led:
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    description: Puts the chip in LED mode.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - not:
+      required:
+        - regulator
+        - led
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps61052@33 {
+            compatible = "ti,tps61052";
+            reg = <0x33>;
+        };
+    };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps61052@33 {
+            compatible = "ti,tps61052";
+            reg = <0x33>;
+
+            regulator {
+                regulator-min-microvolt = <5000000>;
+                regulator-max-microvolt = <5000000>;
+                regulator-always-on;
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps61052@33 {
+            compatible = "ti,tps61052";
+            reg = <0x33>;
+
+            led {
+                color = <LED_COLOR_ID_WHITE>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
deleted file mode 100644
index dc448a9d5b4d..000000000000
--- a/Documentation/devicetree/bindings/mfd/tps6105x.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-* Device tree bindings for TI TPS61050/61052 Boost Converters
-
-The TP61050/TPS61052 is a high-power "white LED driver". The
-device provides LED, GPIO and regulator functionalities.
-
-Required properties:
-- compatible:		"ti,tps61050" or "ti,tps61052"
-- reg:			Specifies the I2C slave address
-
-Optional sub-node:
-
-This subnode selects the chip's operational mode.
-There can be at most one single available subnode.
-
-- regulator: presence of this sub-node puts the chip in regulator mode.
-	see ../regulator/regulator.yaml
-
-- led: presence of this sub-node puts the chip in led mode.
-	Optional properties:
-	- function : see ../leds/common.txt
-	- color    : see ../leds/common.txt
-	- label    : see ../leds/common.txt
-			(deprecated)
-
-Example (GPIO operation only):
-
-i2c0 {
-	tps61052@33 {
-		compatible = "ti,tps61052";
-		reg = <0x33>;
-	};
-};
-
-Example (GPIO + regulator operation):
-
-i2c0 {
-	tps61052@33 {
-		compatible = "ti,tps61052";
-		reg = <0x33>;
-
-		regulator {
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
-	};
-};
-
-Example (GPIO + led operation):
-
-#include <dt-bindings/leds/common.h>
-
-i2c0 {
-	tps61052@33 {
-		compatible = "ti,tps61052";
-		reg = <0x33>;
-
-		led {
-			color = <LED_COLOR_ID_WHITE>;
-		};
-	};
-};
-- 
2.43.0

