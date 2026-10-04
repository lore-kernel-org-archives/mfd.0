Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8764D3BFAEE
	for <mfd@lists.linux.dev>; Sun,  4 Oct 2026 16:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132104; cv=none; b=WYdunMy7akXsoiJJ5l3mHKUdkUbcc7SHWRlWhD1mIm5XCvSi7RgCZUB3fMiBdVP+Q3Bdpn4WBOV2NO4E+ZIpY6JQcabBuXMK7FoEhlR6c7vCkFamrUHSe81bXCze9p0qi7I+sBFYrhfoNLf1XNKvMYq6AnmEmnIsGjDPev97Jh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132104; c=relaxed/simple;
	bh=MXHa4GE0IO9PDNWvg/1MpKMpHhSvEc5zC0RDNYOZsJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaTHcwZtpyxIeTwsb15NRra4siVOxyNUjlsMWqA6wB1ULM0GhQHY5nhEbvr1Z9gplC2e3Oj32O0g4Ik9dfpS7keC/qjealxrSaQgYCFMaBzm2dcPV0AUOPn3sZpU8xy/ZVrk7POVoDrc9J7DwkFfwnf681c2KT3fn5tBzeumTm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/CcLWJ9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/CcLWJ9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so6454235e9.0
        for <mfd@lists.linux.dev>; Sun, 04 Oct 2026 09:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132101; x=1791736901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oRhn0Uw3oG9VGKyBezr/4J0WUv4cf3LeMydSJnIiuw=;
        b=m/CcLWJ9zqWau5aKby30wExgebRKolZIWAUA/TGzfllFtqoLGZSRd4b8765WRp9uch
         6446Z8JdaPx65VJD9DNJi44ez8zApGwNKoRfzdPcYoa1IEtxjkb24Mo1xulFPQ0Wnb18
         ji40vzJiliMlnXObQy7br7PfnI7okJj2PYKRMVfEeiePVaPDTToxxvFzzmmSQYhNEz7i
         c83b4EkkPhWRWXSi8wywip74qI51yZVXDYe3H5i+MrM42XgLAtYkSIKPavVultjUCzA6
         /Ss3K7q7+jXMPl2d8wEsVFly1D7KaTh+hCMIWgAXr+Pa+sbzjGCsK1agEU/kKexxs3nZ
         hAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132101; x=1791736901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1oRhn0Uw3oG9VGKyBezr/4J0WUv4cf3LeMydSJnIiuw=;
        b=j4uSG92UqJbexPq9d/pynPHlbTR/WS8SMHqlLH82dU3fgyTKNsteSpLHsCR1V1RKRs
         cpU1yjhEFsqlFBMzchmMDpJJK9/gMZ+wfE8eq/aRXSemNAjEALmF3gPVFXWtxbUEl8Ew
         lFr6vW58Em1JYnjFSQmT5KMMVxIRlOKq5jQpgHPe5TeUKHSG8x7BIX4WZFilGgOkTl6j
         os1+xte/03sZl1KMEb0j/NyF3kwWd6dwS/xJr9RqYP8gKAs9iJ8tghvWv7XrMt0IyXdz
         ed6WnmKgIF1E/jz0qcOj/Ab4tCG115fovjj2CMSFwZtyxxXRVtxHaCSj0cImgLCI3HDk
         ns1w==
X-Forwarded-Encrypted: i=1; AKwUvBzlyp0mXkPT4LZxqkdcvxWy5OLmfGYG7hkQuTOG/GgjMCZgTOScSkN3NrK+1o9BwM1V5uc=@lists.linux.dev
X-Gm-Message-State: AFuF++lITIeWrnbhQSEL0dy1z/d1voPt/XsJWWRhoC/pSY6Vtlpbahby
	9k7vEZi/J9lCaHmwsYCl653gDxE5U6ISns094G1vcBIws3YtVW0yuw/W
X-Gm-Gg: AYBFou1saO1PgQUyg6ExyZMyT8ZchhdeOm21XPpp9UB8b6diIvPHcAgWvMRvfmaQCTt
	39xouBKpk4WorG3ieIt+lTCeyWo1sUjjNBzx2aoGbFEXfYx8GwDDanfJYWCp41X4o9pTm9q9yJa
	UzI7K4V0KUeS2JBVgwa8J7cFnZfCffeioehA2JBjQRUgYmnUT/QJN88dVJqPwncZ4V2jMC2ABEl
	uCX/hYLC/7eDuekyFGw4l2ZnSvJ0EFvtFcCJAZ3H0j/9ml12w6a2ABobCvhzlU0FfudC1zorMW9
	Rj6p87rX4EMWuv8/oboUClqN0EM0pg6byzcrd2irJbPz2hRo49CIUtaZ1UFA2hixG5xiLOsxn4b
	rqvh/4OtMY0cGsmqcCly42maeMCwGFYHDrB0dPD6Nm1G0ild3F5KsTgayihfaWYt+GvRcon3YBE
	PdE1od09T11Xzmsbl/rYC4dWCWgZb2lqEd1bRgHjAO/tLJisKhT0YD5fP52BeBDXpfOfniPGkYm
	KzGtpRzeKVuW82msRM=
X-Received: by 2002:a05:600c:6085:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a027575983mr125492155e9.7.1791132100715;
        Sun, 04 Oct 2026 09:41:40 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm18765185f8f.10.2026.10.04.09.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:41:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] dt-bindings: mfd: Document Skyworks AAT2870
Date: Sun,  4 Oct 2026 19:41:19 +0300
Message-ID: <20261004164121.193514-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164121.193514-1-clamor95@gmail.com>
References: <20261004164121.193514-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..014678616076f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/skyworks,aat2870.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AAT2870 LED Backlight Driver and Multiple LDO Lighting Management Unit
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    const: skyworks,aat2870
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to EN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Regulator providing power to the "IN" pin.
+
+  backlight:
+    $ref: /schemas/leds/backlight/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-backlight
+
+      led-max-microamp:
+        minimum: 450
+        maximum: 27900
+        default: 450
+
+      max-brightness:
+        default: 255
+
+      skyworks,channels:
+        description: layout of active channels, where each bit represents
+          one of 8 channels.
+        $ref: /schemas/types.yaml#/definitions/uint8
+        default: 0xff
+
+    required:
+      - compatible
+
+  regulators:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: skyworks,aat2870-regulator
+
+      in-ldo-supply:
+        description: Phandle to parent supply of regulators populated under
+          regulators node. They all share same parent.
+
+    patternProperties:
+      "^(ldo-(a|b|c|d))$":
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@60 {
+            compatible = "skyworks,aat2870";
+            reg = <0x60>;
+
+            enable-gpios = <&gpio 139 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_vbat>;
+
+            backlight {
+                compatible = "skyworks,aat2870-backlight";
+
+                skyworks,channels = /bits/ 8 <0xff>;
+                led-max-microamp = <27900>;
+            };
+
+            regulators {
+                compatible = "skyworks,aat2870-regulator";
+
+                in-ldo-supply = <&vdd_3v3_vbat>;
+
+                ldo-a {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <1200000>;
+                };
+
+                ldo-b {
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-always-on;
+                };
+
+                ldo-c {
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                };
+
+                ldo-d {
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <2800000>;
+                };
+            };
+        };
+    };
-- 
2.53.0

