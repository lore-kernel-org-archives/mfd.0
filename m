Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFBF4C8FF0
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404586; cv=none; b=sljj6TYRyHaUAhb2rNV06IPUlMn9zR7+9jwwvXIUhXfSFe1g5Wut1GT1mGtkmK2NhLnnYZFiwO2rj8KpovMSZcGhmyyssYEZIHeAZFROUoQHkh55/7Lfu5gzbYdf5NjKHn5+ZytJ58UKWpnfGSAz+6gJQgxX1LAltb4AK/UO1ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404586; c=relaxed/simple;
	bh=uckZyXVLlKGBcOMrrx1IvRPD9w3WkL3fsgBO4V5Ixp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=et3DxiH6e8JAObqiM/xAh/ddIq1xL3LIzG79OFfjtj336bAzZfvNab2RCCZD8K54lqrMDz9l1r9jSB1CgCkyQODye8hqBF1KLfvcxX0xAEzqF6PnsugGqxMHcbvOE4tfyHJdA3UXSjNywUeGRnHbpvChA7adP0mczcvlx89CM48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wc6U7EcT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wc6U7EcT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1efc90e7cso648105e9.1
        for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792404583; x=1793009383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWZSnVHau6Npi7hsSuIlFMNZUS/p2QupozYmLvTM/rg=;
        b=Wc6U7EcTQxQ0RsidbPrxqhwf54/4xlZsUNsGbXnhYmBsRXVA9MfWvbnPJBhwjdAcBj
         xim5FtEFx5FztvySPs9FXzRRdi7A2zLr1p2LlBJYckKcz2Vyoa0Y7nyJEqm7/JAbbbRw
         wc3fheDaIDCrFp3vbiDGf+a+ooIu2gzKQ0xiUOb2NmNLvXOjVBBDW7i6ucRwAh0i1O/2
         T/OemP/cCi9h8uLbEHWMzj5VQxagGDnDFdUMNyEs4LMNuLukT7ROJsO3Gr/SMIyVbVHt
         KtvoYP+S4melJEf8wBXM3fEfRLrhr+ti5S4tLr9Rx9nXWhYeHo8p7vx6nC5TddbidD6Y
         c8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792404583; x=1793009383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nWZSnVHau6Npi7hsSuIlFMNZUS/p2QupozYmLvTM/rg=;
        b=Q/V/yxhvRPwtcunJb6EUlaLvKRJnuj2bXyDWki1ECbT+cJhQE7xwBHvH883sK90GZj
         fM4l9+jlLjucBsnrDoWAPqli7qqY5DpWoqrNtIfmPq4qJ7VPTCs0htiXCS4oWtk2CHyy
         F0VpDriMuwyfCBPSSlj6vvujK5TFdYXprUx0lrHLzYIS5/9FVmamRXCJjdtq9YYLzXRb
         EnfpiSkzNIn3TzDOpCGcf2+I97vv6Nf7B/gL1oa1XgVbldGAieJPzCk6YXtv60eiQErs
         j+sBEGIVKQ2dxTzvPPYAFWn3I0dju7FEZXAOyEWlKA8FBy2FngQaPQ+nctPWKn6yqx4d
         ivrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpysTOK31Pg3hgIdCHY9XStYVnxnBcoBdGCFksM77IPREHVlx489eOOn1B7IySUkwCzEg=@lists.linux.dev
X-Gm-Message-State: AFq9FYI62nMPUeRGy/kcr3X64BaItw8rdkd5ItpWTKz9/4kYI5c+ZbLf
	bP4gUPW8jgguyNepoivNv9Sf2xe29kTeSiPip3XvVigfkNwGn5BmGv2T
X-Gm-Gg: AYBFou1t7cxoupCMuQvf+11NhXT4uAEt/F3oF5QaIyM2nSCEylaWS6pYHFIT8wLNN2a
	GDK+M3msXWPViIobMwY8c6560vdT4M+sh0t3OBSmqCljABxJGeG+MpQcRPipWkd+1TIHcp6iMOz
	6QV96QgyMG3bRCpgUdxOmIiKTOwlcgvIv19tGFg0qm89/yYe/jdU55eaQHMOANHXd4vKdd/vVu6
	hE7D7XesgxieKoag/1bjDtn6AI2Q7t3lDauhqfdB8g9I81pQ27uGmwnpvY6qtu3KIElYksDYom+
	h1QldQlj2MMObVjXlzjHcc0PMQBu3oT6fAaThXQsq0C8d+aKzWH9M6T148L2a86meQmVxdLkoXc
	0rPiyL/7rUU+VFv+A9YGFkXO5Uu4z7LdZMryN/p39dtUnJ+XQ05uofkkMs1MqDAOdt6XVu+/oeV
	8gfpr8lxGtlHOzWvJ1eU3EWeaAYEdjRY5fVQ8xVLA+gUAwwxxgTkx6qepKSRxRqRmI4FSvyEJYA
	GXFDENZYQoqhP1GEP+K7n5sVbgCOg==
X-Received: by 2002:a05:600c:3484:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1d7605e04mr153405815e9.14.1792404582625;
        Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8a81587sm510533485e9.1.2026.10.19.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:09:42 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Date: Mon, 19 Oct 2026 13:09:27 +0300
Message-ID: <20261019100930.110954-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019100930.110954-1-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
Management Unit.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backlight
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

