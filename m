Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446166;
	b=edN8kcnc3MFfLjPDjZlMyWEEoGbX82lTjqlbQkBMmKcXHr96N4Ykb9dD8mqDCUVzijeB
	 a0ykqfoJTjkDNW14Ka1Dr00H0ZcC8yl3V0/TRDI9i/ogCCbhXyW6NTqPo8tsxhg/z7C+Y
	 koyyr4MMOsyCpBujkaxZf4kWJaxEheqIbJA3vD4Iedr1xb7ORWS0EnPK+7jsq6HAVjCW9
	 k5XDBX4sUvjLa/ScL+U7GsLW0I1IsHjRQRxvCUA1Hz49kbq7zzq5vbJRG+k8Rp2edxp+W
	 OjCJ416iZXRymc8JukCSF0j8rzDI8OLOzsgND5/HutaB61l0TfRCD4qpLzMCW5YcY4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jZk2vXbxzjtX67c5jJifbTQJPrSiWJsANuJuPhZHRHs=;
	b=vyjdlbj2f7lC2V5Z2dJRHu0CC9II4P2UTnmU5/y2ST9AjpeLlsRFX2aDalvxkB1VYYg1
	 TDHwoxr/L3u6oWkUbXGFVzWzRg+yaDq/B3jNwCtNtM2d3IXxra5F+gnZ7OMg7huuYfSFG
	 31pmFVVKHu4v81KYt7sDcLn4yGJ677onkY5dgpZkUMivgFEk3GXbzcPJfRsVF21pjeDpv
	 aO5JE5OuC5v3rrgtfoK2jlsFbFcdf2e/TEXy70gSnrNf+8R8dEnCUTpcK4BLlkjY3AWJT
	 MDMsGeE8xcGK+E3E8zn0On/76M9VpxvvzUSoseND41lvk+oOgc3GKnF0UW60e09m/fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NoDQb/SW";
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5272606A332
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 15:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5272606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoDQb/SW
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5127c7abd5so541773666b.3
        for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 07:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446164; x=1796050964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZk2vXbxzjtX67c5jJifbTQJPrSiWJsANuJuPhZHRHs=;
        b=NoDQb/SW1P2nQUjt3TsTgcqY47j31jFc0OuOQ2yvz/Xx66n4gilpzSk+vuCdyzjRNl
         /uAefv8Ia4DgkBdsayMxHBD476TdM0SvPFudW5nGr2LtefE49f/Wbd/tBcxkQJMcIc+T
         NZUXZo9WlLFagiF13qGnE9m/C+gAeRrZPFzAyy7cKcY79Pvy3ArTJNn0998BZ6r85TEL
         IlNLdr7+QOiSr0O5+QXWAIlENa4Prs4Nn+az8m7AYNgHY0OLJMz7KLvMelk4hBR6nGc8
         UWc7kX9bNYcB4sDZgz43L2kh5VYYmqVszpgSBd6jHUhyCoo3E5N6jFc1nTFRDeNnkjy7
         FN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446164; x=1796050964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZk2vXbxzjtX67c5jJifbTQJPrSiWJsANuJuPhZHRHs=;
        b=Fesge4tH3FTeFZkPHlB0pNmB7dRZt7xTxCgBS5Ole9u9duqJnlXApgJoUeIDJLfaup
         Z1Fvz2C6xdzZHdLWTGfrt/QavL6tu3klAKdfxPiNOTFhHJMNd05ewQoNXiZ6ASRrTmPG
         SI6apYHoohO+1XPSeO/Q/u1D7dImMlKdCZb5N+eyU+ci1VFzl/psNT6YwfFCwc+Vvsok
         Y5cV+Ms4V+kqJ/jz+bKUzNLGPLqvsy7l3Dtd3c5xRdI5WH2J/DdnCCHIDxNtVOJ+Q+jC
         j8b8ZvembAQEZqWcpK7DeA6WeFuqwRq/qBr0k5yqLJDxiLCOFGkbgY+1pXoVg25yYac7
         eZwQ==
X-Forwarded-Encrypted: i=1; AL+hErGZon2bMj0fTnS4D5D4hY4j4KHbn9mkedp4q9f/TtZPBOZbnSn7W9sVV+oJQLy+dS962rU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+kQjMVfWmKZSw8sFuVJjWB5AYVDahJGge5PQ+l18FKfcFw6nsX
	zvxnfTPI/hJdNYD/liXstfcIT7v9Y2j1+okrbOZiAtdMvDApkz2mF1ke
X-Gm-Gg: AZFdTZcUalHRnovoVACC4wd4xSTmRYOztxf0isV+qAXwfNRKt+NjWm9okpA1w8Ol4D9
	MMs53DkbgqvBMAmvkjiKSgqnut1D7O69dXS2ExBxZV7meylBnAogwRPACswRz/nHh6J3GFFNIBm
	7ENfD5SVqJ5Esv7PDwdFmgt1JGzviSMtu2BT0BetEFx8erKMzwqHMB8MCzCsX8DWQwKtwwb/rBt
	/5tt0p8A6fgUXwP4dEfYjNo4UN4pXtpec8D9YvFiKiPdKDcTZI3j1h3FFa+mSgtayMBZow0nvc2
	qSrswNPWY4gEulG270DEzYjNhtOB8UISUiS2HY0QnjehvhszooQg1u58plNrnmzT7lmhzFsVpM/
	CxYYXTrKkjWpzmth8dXvJXZrGe+1k4TUNnI4bSsRIpsP2xWqDcCN03UiEF58ELE4CCxEz0uY/ll
	2FiRGdX7sHXh1xkKXbqSAAS/OuYGnr1l2avx5rA1ym4/Ay2U0jYQWlimTCZyJ6Ed45A8HZ/gFfI
	6ONPt7CLARgg9BwEmFNWfQewr1UDuvLTB6V88cc5pDh3xux+w9EHq9AJ/w4HXJNJG3qu8BfW8MU
	ODbZtPV07AdGv3MGRrvudngtcbNKZduWIiDUsa1b/9Hp1Jz78KXCKWBbaq0uBXVPjPLPRt/TOr3
	yNdX9H2Ulvg==
X-Received: by 2002:a17:907:3e15:b0:c51:249f:7331 with SMTP id a640c23a62f3a-c513a3aacc8mr999504466b.1.1795446163935;
        Mon, 23 Nov 2026 07:02:43 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 1/5] regulator: dt-bindings: maxim,max8907: Convert to DT schema
Date: Mon, 23 Nov 2026 17:02:20 +0200
Message-ID: <20261123150224.199601-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
to nvidia,tegra-regulators-coupling in child regulator nodes.

Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 283 ++++++++++++++++++
 2 files changed, 283 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml

diff --git a/Documentation/devicetree/bindings/regulator/max8907.txt b/Documentation/devicetree/bindings/regulator/max8907.txt
deleted file mode 100644
index 371eccd1cd689..0000000000000
--- a/Documentation/devicetree/bindings/regulator/max8907.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-MAX8907 regulator
-
-Required properties:
-- compatible: "maxim,max8907"
-- reg: I2C slave address
-- interrupts: The interrupt output of the controller
-- mbatt-supply: The input supply for MBATT, BBAT, SDBY, VRTC.
-- in-v1-supply: The input supply for SD1.
-- in-v2-supply: The input supply for SD2.
-- in-v3-supply: The input supply for SD3.
-- in1-supply: The input supply for LDO1.
-...
-- in20-supply: The input supply for LDO20.
-- regulators: A node that houses a sub-node for each regulator within the
-  device. Each sub-node is identified using the node's name (or the deprecated
-  regulator-compatible property if present), with valid values listed below.
-  The content of each sub-node is defined by the standard binding for
-  regulators; see regulator.txt.
-
-Optional properties:
-- maxim,system-power-controller: Boolean property indicating that the PMIC
-  controls the overall system power.
-
-The valid names for regulators are:
-
-  sd1, sd2, sd3, ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10,
-  ldo11, ldo12, ldo13, ldo14, ldo15, ldo16, ldo17, ldo18, ldo19, ldo20, out5v,
-  out33v, bbat, sdby, vrtc.
-
-Example:
-
-		max8907@3c {
-			compatible = "maxim,max8907";
-			reg = <0x3c>;
-			interrupts = <0 86 0x4>;
-
-			maxim,system-power-controller;
-
-			mbatt-supply = <&some_reg>;
-			in-v1-supply = <&mbatt_reg>;
-			...
-			in1-supply = <&mbatt_reg>;
-			...
-
-			regulators {
-				mbatt_reg: mbatt {
-					regulator-name = "vbat_pmu";
-					regulator-min-microvolt = <5000000>;
-					regulator-max-microvolt = <5000000>;
-					regulator-always-on;
-				};
-
-				sd1 {
-					regulator-name = "nvvdd_sv1,vdd_cpu_pmu";
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1000000>;
-					regulator-always-on;
-				};
-
-				sd2 {
-					regulator-name = "nvvdd_sv2,vdd_core";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
-				};
-...
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
new file mode 100644
index 0000000000000..6cf8e93867e1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -0,0 +1,283 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX8907 PMIC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: maxim,max8907
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  maxim,system-power-controller:
+    type: boolean
+    deprecated: true
+    description:
+      Telling whether or not this PMIC is controlling the system power.
+
+  system-power-controller: true
+
+  mbatt-supply:
+    description:
+      The input supply for MBATT, BBAT, SDBY, VRTC.
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "^(sd[1-3]|ldo([1-9]|1[0-9]|20)|bbat|mbatt|out(5v|33v)|sdby|vrtc)$":
+        allOf:
+          - $ref: /schemas/regulator/regulator.yaml#
+          - $ref: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
+        unevaluatedProperties: false
+
+patternProperties:
+  "^in-v[1-3]-supply$":
+    description:
+      The input supply for SD1, SD2 and SD3.
+
+  "^in([1-9]|1[0-9]|20)-supply$":
+    description:
+      The input supply for LDO1 - LDO20.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@3c {
+            compatible = "maxim,max8907";
+            reg = <0x3c>;
+            interrupts = <0 86 0x4>;
+
+            system-power-controller;
+
+            mbatt-supply = <&vdd_5v0_sys>;
+            in-v1-supply = <&vdd_3v3_vbat>;
+            in-v2-supply = <&vdd_3v3_vbat>;
+            in-v3-supply = <&vdd_3v3_vbat>;
+            in1-supply = <&vdd_3v3_vbat>;
+            in2-supply = <&vdd_1v8_vio>;
+            in3-supply = <&vdd_3v3_vbat>;
+            in4-supply = <&vdd_3v3_vbat>;
+            in5-supply = <&vdd_3v3_vbat>;
+            in6-supply = <&vdd_3v3_vbat>;
+            in7-supply = <&vdd_3v3_vbat>;
+            in8-supply = <&vdd_3v3_vbat>;
+            in9-supply = <&vdd_3v3_vbat>;
+            in10-supply = <&vdd_3v3_vbat>;
+            in11-supply = <&vdd_3v3_vbat>;
+            in12-supply = <&vdd_3v3_vbat>;
+            in13-supply = <&vdd_3v3_vbat>;
+            in14-supply = <&vdd_3v3_vbat>;
+            in15-supply = <&vdd_3v3_vbat>;
+            in16-supply = <&vdd_3v3_vbat>;
+            in17-supply = <&vdd_1v8_vio>;
+            in18-supply = <&vdd_3v3_vbat>;
+            in19-supply = <&vdd_3v3_vbat>;
+            in20-supply = <&vdd_3v3_vbat>;
+
+            regulators {
+                vdd_3v3_vbat: mbatt {
+                    regulator-name = "v_powerrail";
+                    regulator-always-on;
+                };
+
+                sd1 {
+                    regulator-name = "vcc_1v2_ddrio";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vdd_core: sd2 {
+                    regulator-name = "vdd_core";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vdd_1v8_vio: sd3 {
+                    regulator-name = "vcc_1v8_io";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                ldo1 {
+                    regulator-name = "vcc_3v3_ddr";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                ldo2 {
+                    regulator-name = "vcc_1v1_pll";
+                    regulator-min-microvolt = <1100000>;
+                    regulator-max-microvolt = <1100000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                iovcc_1v8_lcd: ldo3 {
+                    regulator-name = "vcc_1v8_lcd";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+
+                avdd_3v3_usb: ldo4 {
+                    regulator-name = "avdd_3v3_usb";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vcore_emmc: ldo5 {
+                    regulator-name = "vcc_2v8_emmc";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                vcc_hdmi_pll: ldo6 {
+                    regulator-name = "vcc_hdmi_pll";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                vcc_3v0_sensor: ldo7 {
+                    regulator-name = "vcc_3v0_sensor";
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3000000>;
+                    regulator-boot-on;
+                };
+
+                vcc_1v8_sensor: ldo8 {
+                    regulator-name = "vcc_1v8_sensor";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+
+                ldo9 {
+                    regulator-name = "vcc_3v3_fuse";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+
+                vcc_3v1_touch: ldo10 {
+                    regulator-name = "vcc_3v1_touch";
+                    regulator-min-microvolt = <3100000>;
+                    regulator-max-microvolt = <3100000>;
+                    regulator-boot-on;
+                };
+
+                vdd_3v3_hdmi: ldo11 {
+                    regulator-name = "vdd_3v3_hdmi";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                };
+
+                vdd_usd: ldo12 {
+                    regulator-name = "vcc_2v8_sdio";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                vcc_3v0_motor: ldo13 {
+                    regulator-name = "vcc_3v0_motor";
+                    regulator-min-microvolt = <3000000>;
+                    regulator-max-microvolt = <3000000>;
+                };
+
+                vcc_2v8_lcd: ldo14 {
+                    regulator-name = "vcc_2v8_lcd";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                vcc_3v3_temp: ldo15 {
+                    regulator-name = "vcc_3v3_temp";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                /* LDO16 is not used */
+
+                avdd_dsi_csi: ldo17 {
+                    regulator-name = "vcc_1v2_mipi";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo18 {
+                    regulator-name = "vcc_1v8_vi";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                };
+
+                vcc_1v8_touch: ldo19 {
+                    regulator-name = "vcc_1v8_touch";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                };
+
+                /* LDO20 is not used */
+
+                out5v {
+                    regulator-name = "usb0_vbus_reg";
+                    regulator-min-microvolt = <5000000>;
+                    regulator-max-microvolt = <5000000>;
+                };
+
+                /* OUT33V is not used */
+
+                bbat {
+                    regulator-name = "vcc_bbat";
+                };
+
+                vdd_rtc: sdby {
+                    regulator-name = "vcc_rtc";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                vrtc {
+                    regulator-name = "vrtc";
+                };
+            };
+        };
+    };
+...
-- 
2.53.0

