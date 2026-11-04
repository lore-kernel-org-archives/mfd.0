Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795848;
	b=LaSAAojQulBFmEr2SrtAjcCF2UnfId+J+vRycuScX5O6K44+gkf0KiDGiihr8h2j5VC+
	 ezvBK8XvBrXdB702j0vO3QG+mWCg6HkoFcfCfbDwp3N+t1Wod/ENl0cFV1+xGDnFOobRJ
	 iA7NEFfJ0Zot9uuv+6UopzWiqusDL/eYWEiS4dhjqzHxLuZ3ITU/UYJOR600qnaLiCJbs
	 wF/YAplA2tZbbHbCHS2UwrbyoaIpfJYBjJCXiomIgpIit3qOv9ger2LbfSYQkThNg4JPE
	 Ok++K4QXlVmDvmj/VqE/A2Iudx7oX+MiuG9RefUIYrmB/Ns5CU5Chfo22VjC87M55vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
	b=h2OwktEIGqG9xFSCEgWWb0R599Xdm7IkMYLaDalbOl2fmjHf2MPRrsE8L6cuJ0VPaHyJ
	 KpvTxyn9LQn2ZwWPVCoqmJaFCytUOaWVZjEvtwds8h11TKoDXL5Mog20kgJhmkbe4NBWv
	 L1Uo9e/EeGUIApI5gHrWg/oHbF28kV/zF5FikUcngiz8U/6KRqeZCuEzAtxoShry7Ge1z
	 D50ODy8gujCUryQgGMPbdkfqlZq+ammDkdOmiJPXm0U4EZUBT56mcJkgoSOLo5eaSWojD
	 Vxv5GWtuCvakbT5Jxi9l0lriXFlXj8saXjQIa55VoX0Yut5rZL6MfLiM9c5nZv+RkFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwLfRRwN;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1F9606A339
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 12:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE1F9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hwLfRRwN
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20edd106so449676f8f.1
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 04:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793795846; x=1794400646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=hwLfRRwN1g3ntAMUDIBHgkXgYrTIOgvFxmuvwZySUksUaGwEYkCnGq/GwdvyOisoH3
         CJqJR/AYB3mgc/QovGgY27I6rpZCW88VVBF/FBLQdmcHeHjQskd4bydVOA/u5L8Cyi0q
         hVBbL2TgsbMAExWTOxLUgI24M0QVmi2D430E0L0XK3tnZlpsDyTSDK+p0f6Hgy31NbKA
         y6J9z4NDeeaHf2Mdexn3KGwnasFFbouAkD2TTBTgQvjy8xTNrgtOecAOu4xmubNUwANy
         e1SPYWY12ipufOMxzCAHhdWfbAcO5Wdw2GV/YGmMVG9AdYOTfUJ3AyoqwjhcDMGhGAtC
         K8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795846; x=1794400646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=crzWen7aTPA+DMkgvjWHOk4y+Nc0aHlgwn1FPqJGuCx0jQuqnMgH4A3f9Ny/lLxaDq
         Pw5y7aRmaay/2n7gNpAAZ+Y2caGv451Yc3YP8d9PkSiDHZqNhM9wO7PiMZh6cp73aw7v
         eh/jbIDDFK+W+4zHLeDfsqJqezsYq/oMp/1/k8ZdEUVOpVKpeTWUeeLSMs5/cCbESIvR
         9Gr8ChboA2PXRuHRjLA1mBIoQlV7APE/xmSDrVAJf5SAYtESD+bul4P1DlSR+rPZhAg2
         uZB4QZ5N72CeZ0uCuwZKG0lUIbjeimwF2b6l5jiBrm1N9AaFevedRq7JXivk1fkUKJCD
         Enhw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ++B1j7D6Dqor5U1rVRlJ34MelYppqMuJRY6SatCkodqm5FvROFE70oVckaR2cSz5vpA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9JK/44QTckJzYkA7g7C3TrR5S4vzVmPs/a+WkBGmR5sRv6zhQA
	9e5/bIfdqPQMUzETPTqOMpwc85jQhaTl2a8qF8kpPAmQjlov3hy4/A6v
X-Gm-Gg: AYBFou10Tk2/KGwxn5LvMWE9wqJG1e8M45+JITJ12L/Mv89aO8a8hGu3n/NDa++0u6k
	86Qi7JbcjSsDCHOFgXC1UynnRdxUYzlvibvkckHgUmwQFJAcWjIJOeCdxzaXOA37XLDcfTrKJHK
	hJGosSrICJEfYsgF6WDH0VYC6qFxS86t6Umf+21WNkeU0SU52NlzA9gsW/Ztkl9ujhUXmdkgxfG
	6kXRTe3AjLKBILeV7bqSmnSQxhvA6bv3H+1rB3qpHDixKQ51uY2rF+tBvNeZhkPllS/nR23hZjp
	xSM5gau6TGFrIcdlx5cKGp99xgHv4AQ0cH2IQQ/zxv6Cd/3mDse5HzxYMdr5pN9D/qqiIA12C3q
	66Ww1h5xUTP+2L/Z5frAWbZkzoRfvtBdMjXEQ9nOaimc6oomZ1M1L7pEsJYZDdKg/n2p+u5ByeN
	aAcJ+TV3Nzrr/0l0n6554gRuPrFllvO5nMnbMVRcd7JrOAoMxPzG21zdt7F52MdbmYXbCukDhbv
	lwbPYYcaxJITP1cQxiLDuY28tPWocT28oj2BVAYJ0X5Zepcg0nJtxiM0T7LcUA6OrzfG4kfBSXp
	XiQveFVqasnAKx2i8OfaYlgHC1uyl+ulAAje+KXL4/oFZK6sew==
X-Received: by 2002:a05:6000:22c4:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-48fbf3c185bmr4984588f8f.21.1793795846185;
        Wed, 04 Nov 2026 04:37:26 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm3386155f8f.43.2026.11.04.04.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:37:24 -0800 (PST)
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
Subject: [PATCH v6 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Wed,  4 Nov 2026 14:37:11 +0200
Message-ID: <20261104123714.234634-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104123714.234634-1-clamor95@gmail.com>
References: <20261104123714.234634-1-clamor95@gmail.com>
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
index 0000000000000..3f3f3058af52d
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
+        default: 27900
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

