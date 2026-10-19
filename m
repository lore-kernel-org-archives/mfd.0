Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BD24CCDE5
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405086; cv=none; b=coSRM2aW5e14TEfbxSd21OwavvsLrX2BjuKqXHdmu6Nn4DCOlhzZ2APE34mmTve97P6g+q92dzk7LEItumQCmr9F9vNIZtDlEdfcuzcFKgRQkxMVFFEzM4FWGOlmD5VXDkpstOFK8ehAUqVZvpeyKVygx1aBGjSmofpnP0ELJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405086; c=relaxed/simple;
	bh=7gJB4mvwa2xHWihF4Xw9dNRVCEf0fr7Lo02mk3lMyTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQ+23EXHIfY8MMLm1bqg9X08veKxUjuxUX8Ch/yzfit0AI1vpSWleqo5pn7nY0Ypy1PFUmwk6EhduL0/vVgODCZm9vKXLADMnMThK2G1KUOQKD/9+1n/eLmYjTW88GBIhHmdUkRVQfhhpHgS7fSI7B31WRuyBifWc3iOZyGO6Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfGmPgWi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfGmPgWi"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48df54150dfso1425504f8f.0
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405082; x=1793009882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vAzPMil5l1pqGNfvdWe+bW0U1JuR0wEC+RG90bs+48=;
        b=RfGmPgWiXjLhUwJR/M93N7qcFgWx3/VH3Nlu3aprIXatMNiXZaGnkII+//UvISXktB
         7PmbXbCu7HdGE81SlS39Nbu5aBEEUwfg/moklSDqPUeKu/flxVsSu//TBrvXyB5zd95v
         mDVp+KeOjeX1MIJdiFcd96n5SIMgM6XK4kj6yGj4IajqD6/0VR39usdGhyqKHUuaPZcw
         v7XsdsHnucDgfZh+8qP4siFqNM9WDrxHL9Wo2tln6zfbzau24BNC3grT3lWC/3a1+IDG
         vJn4PGBgx93rWGKUtVzs3NYrMMi0lz/HdqDXDNlg/uEutEu4syZctF1VX9efWRQ66HIE
         NQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405082; x=1793009882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vAzPMil5l1pqGNfvdWe+bW0U1JuR0wEC+RG90bs+48=;
        b=JLOip/DR5lc1Rsike7DYoabA7oVXQKt5ObTOE4h5JY0O8B4iYFVD5/E4WrxM7PtL/T
         Ng1IiBx+hZGIeVRSqcyYX2rpkGildTlvrZaRBJAtdIHCswM3+h1UcKzjLvZ5g7KxGjyY
         daGrS69z7Eu1JdsvoOv2Zn99PRpRAk5fMVAHVk2zJmYxfocWNwvpjKKhq3ZpBcWokRC1
         DRV+GKdSUor3HNH58n3dvtJq8CzPvaOWLU03qxU5ZiT/ALx/rqTg33CisWIv2Oy17mO7
         mZM1ffEFzRFRmFn4m+rPROj0NgeDLZ/yMA/Wq3mvX6nEw++0n7MJNLKywrf+XnJ7CZjo
         +lAg==
X-Forwarded-Encrypted: i=1; AKwUvBxJZuUg+LUe7d30OCkv7emIN06fwEO1HDjYy5PrNAMk3uf27Z3jDMHiMZ26BpTjilmNwj8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJoEFMJLT5X8SsTtBasNbjjeWXNXYhLG2hM2/Nn702bQnIxlheN
	Meq7QqvaovX0dZhR04JTi5oSn3s4r1K7rpYjEP4xV+lm3M0pWmd8zuM4
X-Gm-Gg: AYBFou2BFVGwg+0TRXJ5rHgD3VJPxhBHvifGccsv08LUKudvDnWrI33M416b/Uno9mn
	OlnVEC1Prxp50iO3Z9PPPdNAe5HgwGLUdYBpsShwEHF3Tz+EEtVx7k3v4hGlHSycIUAQXjsf5iU
	aaflBE7hYUKvVLQ278ItubaejQelywM3DV8fh5cgO3uUG88Wzr4YoiQTUckuZ+JyjOMFTULucvc
	X0EWf90faCw8+TSCP7OFRBogOQRbc08WGE9C8spbDiykvteUIPioH63CI1FnJLymtkk52BvCcZr
	+BZCodHnHkiD5uzXenUBkzaWgYCksXLpWMVeRNfxnKgkoW/x7XmSOKPqkW+FbT2mNlUvbwB7UBU
	g6tJ4DkaQCf7lJ8Rg169h+RlQyz510PZLxFZ1yO/IDA9D/7HPupnzArZz+4JAmUcWQBlLtb4uOJ
	Xkea+p+vWRsOR4EFqovZGSHjO0RfWza+euaMpAth9xs3DMvhHmDF5NdBfQOPdD4zAJIfZAmNYHu
	gHcaKFwZAjn6i5Mvak=
X-Received: by 2002:a5d:588c:0:b0:48d:f14a:9188 with SMTP id ffacd0b85a97d-48e07baf59emr14984533f8f.17.1792405081811;
        Mon, 19 Oct 2026 03:18:01 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm23913237f8f.32.2026.10.19.03.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:18:01 -0700 (PDT)
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
Subject: [PATCH v3 1/4] regulator: dt-bindings: maxim,max8907: Convert to DT schema
Date: Mon, 19 Oct 2026 13:17:47 +0300
Message-ID: <20261019101750.125439-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019101750.125439-1-clamor95@gmail.com>
References: <20261019101750.125439-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
to nvidia,tegra-regulators-coupling in child regulator nodes.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/max8907.txt |  69 -----
 .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
 2 files changed, 285 insertions(+), 69 deletions(-)
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
index 0000000000000..e4e1390a49b9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -0,0 +1,285 @@
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
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The input supply for SD1, SD2 and SD3.
+
+  "^in([1-9]|1[0-9]|20)-supply$":
+    $ref: /schemas/types.yaml#/definitions/phandle
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

