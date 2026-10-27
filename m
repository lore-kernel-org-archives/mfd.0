Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100775;
	b=Cyurwm2DhxqnoebhgVeJ0Kv93/+3ZmPHZmYN09dbB1RPXUwK/eyQp6edYgIkRe9ZKEx5
	 heF5IgAyqaXOo5ZTyZpmOL1slW2gUP4jmyi0AhxE/MBwBGQw287s2KR4S0G20sOHwrQJl
	 AO76sHgHdoGo1F9zvxNkzy/EHV7HR/oDqPnY4FJMaSbjaAecKDcxgASMu5dX4QacqAKZV
	 keoknSC/M76WLYVbTkuECdDYbQV5X9uTehqKbau79d2aEZOjM6aBKdFfeeueDNlmBioCg
	 Ixw1iFEASiKZmbsyGosB4eaDEUVEtJddMtO0v69zYtKiOnMByjFtkE+e9BTJxaKtxpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
	b=clbNsyyLF5wGx5SVhIa3fFFWOAj7AIUXZFOCZ9sMzR+cKB333uQ3cUbQQQ7iX3W3UoXB
	 UfsQ/uM9GDGz89V5Cir+8LJFW2PsvZ29Bme67z5i+X+kYb3EKuz6dAXSnP9GJzsjhwG3U
	 7EHq80UP4WvtINgyZU5KbMB7P5dCAROTarYMDe+i7hd504fo+voiTB8egyk9u76KKXSu1
	 v+vYfNx7zEDZMUqUrK0sHZLa98aLISaIDKJM8LR/vmGb17bhiIpe2zAjjTnHeqGmTTl9P
	 ScWaWpFhYd7cf0VZD/pYXb0orHzm0mjvMIMmpm01NfyHE/JKhuSdsoe4kZtwJx9DocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ranAqdjz;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025B60A2625
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4025B60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ranAqdjz
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c46822eefb6so525911866b.2
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100773; x=1793705573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
        b=ranAqdjzEgJXG6eARRsAQwhQz6/3ha694tDCIeir1BulglITKLgm6QHfYgvcEq9r6d
         VkHwctN8tAPzkgIYXTvWiW5e4WErsD52BOUd0vqreSOdNoYYsQvOHw8+tt/VNsi5acgv
         ps5iJHZVCd7hX9dyyZJ/SJwMzmnc29ru8cwxhpKOdiFAq2U8weKnM7ppyNoOeu7cn+mA
         V9QtBNuD5DD0igqQEoJYP8yRtpu5KEJo4uLfjN5/Jt79vcYS7PXI9+7bcYAqAqTTlrMi
         B4BJpYaN7pLMI2+uDeIH9AW3W3ZWU1w612sMY02e8xfzc1fjj9TmtsCqqODRcb0K//44
         Galw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100773; x=1793705573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bleP8syB94cG1bo4A3J3eIEtjKnK9hoV/0t42kw/sr4=;
        b=Hiqv0IySPu/XYAycKSl8ZWLM7GMtDBfkJjv8JDyhLQOEW6SbUksPfuLU/D6uPCk8g7
         ICg1DQBy3zT2PdakW90oakfXPx7umaOJRw3bz+i77Iq2l+dtVBvKC84fw4p/AAGX1CJw
         EV8pxks9wuRHzZOVv9zQ6nOqf5m6ZwUcIoUeLPs6NUgAHMDkpFKupcZnVzyAvRtLunro
         qsjt7pblBVeInmmW9KfxJc9ZdPEEGByE8p9ngVV601ze2S8ScNBekocwhvB9SHyyvGN0
         mtVAvpkwVV/QxV6qeqpxxNJZfoMtTse/EsRIgQ+rEFTqoo7HOaGiVfqxw1kvjWU9I01r
         k31g==
X-Forwarded-Encrypted: i=1; AKwUvBzp5GvMSmB6gM4CyuIVhFUp8Pjp24LuMfuKqtZMQT8um1w5d+MN+3LTiLImQ5wJZUK497I=@lists.linux.dev
X-Gm-Message-State: AFq9FYKrhc/w7ZGKjeX8vgRuc3UZPnhODtNYHX/O9wF08KQ9jNqMEWiO
	LYA4iDXoLC6t3J+XWJaODf7CqlXTHZltinLstdlelSdiuEW6WJVHrEv/
X-Gm-Gg: AYBFou1gqrkgdU1XRua9CQAfgLFZWfm7WwDs/yL5Y/kZSYB8m4mQb6VxgxltRkDgSJ0
	y89xnqqls4MLlPAlOD9rigBSaLAwY85TfRitUvwChIoZrhVqlPMTFa0ajcVol4CUt+xJLPTx8h2
	Zn+R/6bkFBTX32pKeyfO4IcYGPwosRxmrEo9sY4B+vUGcJwL5appIl5fIGLwkm7p0kzKNk+nkjy
	XRCpDpvC47xNnjqG/CDtFoYhKouYG/qvGhDbmjpAVurdo6AbJzb20BRNDp7arK0Wxxp4VhMaNjr
	pyDJ39IGFZohxjlEz3d6dqiJJmVlgFzPoWL9krKiD7H3ELkCNuH133lQwsKP/JCuVEZN2xeaHgd
	SLlqsRlhJUPxAbT9qx6w/d7SS+5wxMcI99JbP7z5R/dFJ7t9sZAM8mo62hl1MmQ1D0hF5Q7Hcuj
	zHYpglOd4HZloYUl8O6Prs0wGKupkyS2D6SEZgK3Wk9BYV4NAymrRqgZGuislMmqa6s4J/Sr5PE
	qOTCrgZkw/LMBuUC5IXD9etAevzcslH+cOZYW4Cf923UyBPIhxAXxnm5fjANQAQku+VNO8UM85n
X-Received: by 2002:a17:907:6092:b0:c31:82aa:dd4c with SMTP id a640c23a62f3a-c46bde48accmr960707066b.24.1793100773381;
        Tue, 27 Oct 2026 04:32:53 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:52 -0700 (PDT)
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
Subject: [PATCH v5 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Tue, 27 Oct 2026 13:32:27 +0200
Message-ID: <20261027113230.47538-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027113230.47538-1-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
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

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

