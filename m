Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE2E52FE39
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914991; cv=none; b=GY7iCqVhWmvZL8WVhQkYaF9+SkGRrX7zHetVjS9FNbPAQnriG/L4wedDVEQXtD44obnr+MCYNYAnEX5sCreyr53PMzrR66mh8l3Ca2PG45nN5i/GK1qyiJlVZjb/FIxGWMsATvXB8I7OaOKp6KYFUMRcAoPJizz5NGflOBur9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914991; c=relaxed/simple;
	bh=c8FdsNzX/r+VvGI8eA88a3FNv7vM9GF+GuD03DVxxgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GRAgoZtIdJlXR48DZCIeyKEkGkpQW8MN7d7AYeAaQx1F4tLR8RepLSTFCyzBi6f618FD4/n+kjcGf42mWCCkRAlG8nEqQBH3eH434fKb5kT03udsvIn3tCi1ihCee40g49pukxZSR3bXU+7Q46VvxPVAyWchu5j6yZY+xptoZrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUBiCh7f; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUBiCh7f"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso3576576f8f.1
        for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914987; x=1792519787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tz+S9WWYS0rGAJFtNukpledNMiYQuQWNPssN/kQCQUY=;
        b=NUBiCh7fz0+qYa2L56RkZcZEpqr0bg1Iaf/9YURdjQPMQphbZKWvzJErZ9IcOKpmyL
         0JyQT/hCXK/girk5h45E1ICcAIRxVNSPwzIzQO+pEDVnxreX9hcA0XQeCwkVJScHQMoU
         TLjmk8r4doBEUTYSLbxCN0jBKjrX4PR1aFhi9jUhqdN689XWN558MN+leYsrlWNH6FZ+
         k8guRC0h2v+srsx4jG8qJo1uA7faE0zEEZfCfJfaRQFqbv66yr4XKfOjRMSt0SJDTmP0
         dAPp6o88/j1v0t/QM6YNb4JuNBnUGpuLzEaZLmjbyGdf7mImRyREKI6mqTWko1SAv8xb
         ODCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914987; x=1792519787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tz+S9WWYS0rGAJFtNukpledNMiYQuQWNPssN/kQCQUY=;
        b=HXDTtK7Zol2EbxOk4DVez9ofrgMOvjzWtaruGcxA8AP3yhCdGVL90IqQ4FcqfI5WZq
         2eNF2xF5AMOCmBhFy8ChMzRDpUkzOJG32wkZxAKcjh8tjrterm9j3V4QMo8qOGrmZb9X
         NrQjqPBAH4IUENBp9zrFkIqmjsISVnm3fRrlac2/xr4jLUu6ufI8a42g1Ghn7gCpTzag
         o38/tqEaoOmAaywAjNO1h1LXbmho9GH4Nwl3Xy2LR3tr96JQKf11gUFf7oztXQ9OU06r
         yac9cCHTZLoZJMZ2IMJLoaKzueKS+qMa85whw+KDxcXkCw/q3t5oLYmTTEXnIFawVcXz
         kCnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYt146DaQaO/2Lo8s4mmZGbyTOFdDP0F3vf2XyfGgpmLfqaQAku/gJ7yT0ctveLDm86no=@lists.linux.dev
X-Gm-Message-State: AFq9FYKtZ9CXFGInt5RqaRbaJVkCAOpH6R7/+UKV4uE7vkXfjDK9xa/s
	b55jOfvSHFYXQLCEnhvf9WLRH6j0s8xZF3Ft9LuF1NBjGiyqdprH4f2u
X-Gm-Gg: AYBFou16lLxUvP82Uy+qSGvsO2lEBUV64CEjt+N8wxpykgf/Gik9GGn+zQGlMpGTIjc
	sQX0pEfja4F5Jkm5dzXFCR2G4hO6owIZgbqLunihc5qsTOPBWtGYElM27GWYK6R7IQCAJ77SEsb
	U9WIVGRjaLFDWCAC0feR1UjE3FrxZBpXdKmSwrCuzeKTqVK11RIdlvHqj86bYu29Cw1u28vrD6p
	Bv7AbJa9Yx7HW/RIjLGdscZEiyIdPIos9oKyH/34V2OI1hylOKxOA+Svo7pokTFXsJhXVWqmYaO
	eHm3uD4tmn5xUEVJPinzmUGFSzkI12srKpJ7RnrjeaXZ26wug+l+5B/KgX/ivO8qSnZkZITn34v
	J9DONjQOjVYyJqhDX7QRV8II+OziGNgv/g7Mr+5oI5ZH5z8geEsAzQUv3d0kx8X44cpqeFxGfV9
	li5zOWCGzzLTZrq7S2qjOQhcTgr5TSqkmOPTnBWpqGhXPDBTyqyfk+PuVCbBzq5RcXsFLhnpgRw
	x0xxM2PnuOlUyDnL5I=
X-Received: by 2002:a5d:6a0e:0:b0:48c:6566:9ec5 with SMTP id ffacd0b85a97d-48dbacdeef4mr20658640f8f.16.1791914986751;
        Tue, 13 Oct 2026 11:09:46 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6854498f8f.14.2026.10.13.11.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:09:46 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Date: Tue, 13 Oct 2026 21:09:30 +0300
Message-ID: <20261013180933.487013-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013180933.487013-1-clamor95@gmail.com>
References: <20261013180933.487013-1-clamor95@gmail.com>
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
 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
new file mode 100644
index 0000000000000..0b4b8be9015bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
@@ -0,0 +1,124 @@
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
+      "^ldo-(a|b|c|d)$":
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

