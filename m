Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D509A45C719
	for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752537; cv=none; b=r1u0Fscjl5xBC81F0qpvz7WCWw0kdhtdo+/v4Uw+kKZan6QqgFm5GCMZrsaVUsbkzHZxxcdzJK4VfxBQ9nX69e+Uhm9+pkYKPtp2QeQhqY3cL5Psl3SFs5bLVmDUoTtvUqwCiucERiKcOaULE+thiQmwIznk+/DTNJ3AwfljGDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752537; c=relaxed/simple;
	bh=ownnF2eA8yjuB5F7r+YjnScn5LX/aUHmRE+jgVipf6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PlPaZQA1OL6Sia+5zkyR3fpW5Ck+IAJ2V3J5ATyaEw/z3Dhxry2Pep6UVnMxAnVk1keSRf62bR9QuJq16W3t5YYZrgSLZhSiCBbgQ9/ehP0DU5bFZ+8QDnAfmoWVegBeQNnPuUg7GD0TJO/r3xMX3KMc3fRAqjLgmYyHrqfZy8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQd1mAdZ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQd1mAdZ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso23058315e9.2
        for <mfd@lists.linux.dev>; Wed, 30 Sep 2026 00:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752525; x=1791357325; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bshOoGO6/a2WohdGzsO4t4N/wsEAXwivylUfNFmKjAo=;
        b=NQd1mAdZ1L50Cudm8JPY8wqenaOt7x6RibjF0R+81/L9uFCF8WGiiWmyvBkqgV/iFX
         d8K/fB3Wm+Pv9zClnn1Mkvs+SiF+1IP9KcpVEQ1yV4CKL74YiIm3te/Me/GjdPNpPZD5
         gbPhK9JGoddERdBMBs0en8IWVOYQcdQ0OG/bku6iS/hP2giDdb+hQF3ExDRtSSCahUpk
         mUWtJtytzUw5s1TfoOpScplG7PJQQRRnPoyggB1VJpFSsMWsvCiMcjpKTomcERkaQcMC
         CqSZGYVA018sCUYSUyIp4qFa+OCohdD0eluyPhH3vYWxhUhGGBelzIceq/5kGhq7flTo
         JCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752525; x=1791357325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bshOoGO6/a2WohdGzsO4t4N/wsEAXwivylUfNFmKjAo=;
        b=zcf5sIbwPk/nTfnu2zFROJ2kYpl+y2KZXo4TFk0Ry9qIAWYMxuz3vcNOuReL7HUgAB
         Tb1pkNZq4IJuIFfbPsymrzz9TnOrGUf1zNN2e9L04DH4O0pEYHIxfWmNKfUux7zNDupV
         4++P84bYR1JItyAX8Tt06/iSonCZHaSpbk7gbBuUXGTg6EdRyH2PH1LWEIQclJ9BUt74
         N/JBPIpqQAxjCUIxfN71xaY4nQlN1PpvRSdxFZh7Je7I4hEsegdb99PipPUqRf+WRNW1
         Ya3Cf+q30vHjsnWAWN8/OERjesyCFz3HYgZ6wFBWXNKQ9lDqx0vbYeZu8XpQtPSchEJc
         /S9w==
X-Forwarded-Encrypted: i=1; AKwUvBzEEFyAnXFxoNBAp6NpMfmiJztWfPH0+YNpXCcbYP3eeaPuD5oQi+kGuOx6u3zqY9jRog4=@lists.linux.dev
X-Gm-Message-State: AFuF++k8xeNiGq11FwTtoNLEj1CBgEVjxPjkGVvzgN7AhaQKIIhE0ijn
	rG8Hx3pcGVvMpLzXBJHU1IyKHQPnkN2rNRrkaTL2ebKR858QHYVvhD8Q
X-Gm-Gg: AYBFou1XIVCBRgG4jz6xaI0Zg4D3Z+S+Za0PAgmeEnJe/kHIJDxj+jTEfZtuslvWupI
	j90L/jUeFbkoo42goCrhfwHK5WuozCoZYX89MEUfq7xpYqL2RueZ5cFi5HrFP989ST52mF8mYM1
	GlNfXHGzClFmHB1M2SBdXwx38CjFzT0/YJ0Haiye3TCp4PWXD2WIG9KcT3DQ1Uk7+6vaxO7oybJ
	KmYocRklJHOh77aAs5AwgagdwNCMgPv1Jod1d7x4/+m6yE9um2ljdaI3tChMZPzsiTUt6jJJfiX
	aXWfEfiaDhPs0kmyh4pZQAWDEBhNbgfp9QLc6kkWEztNpSx4EX5BoNzNMeRkjQ1oHcIns8FEhyu
	taucKVbs+9XUNzMDMdK+JkwBShvB8LZstw8IJQpsTnL46e1PCBRwmJ3BRJLe4OiSPh/kOmcO+lA
	6eTG89JRjuM/wHryWF98Gn/FTNRPVA1mKsi3hoEYYJvMEHTYb6S61kOTP+ozOs86FRqpAkizKvq
	9hMLzLQD70OyVqqb2TE3S2HNIZa9X0=
X-Received: by 2002:a05:600c:1c29:b0:49e:6c11:c4fc with SMTP id 5b1f17b1804b1-4a01aff0d75mr5571755e9.7.1790752525426;
        Wed, 30 Sep 2026 00:15:25 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:24 -0700 (PDT)
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
Subject: [PATCH v1 1/3] dt-bindings: mfd: Document Skyworks AAT2870
Date: Wed, 30 Sep 2026 10:15:11 +0300
Message-ID: <20260930071513.54697-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930071513.54697-1-clamor95@gmail.com>
References: <20260930071513.54697-1-clamor95@gmail.com>
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
index 0000000000000..6dfcd1fa399ca
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
+        minimum: 450000
+        maximum: 27900000
+        default: 450000
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
+                led-max-microamp = <27900000>;
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

