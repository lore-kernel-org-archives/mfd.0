Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733120;
	b=ixpt2pPQKG/nnkv22737IYYcdZL3Nxcbp4+j1jAPx9aZcZ4Q6iFamwqYKS/Lc5wH7S9V
	 3qBZaKXCuXAysMcFBmUtA81DD8+CmpjvjGlSFS9vFPWKWwQ4tJ8pz/VYWbqCH03MvfFeO
	 bPlA3r71EpajqtbQCyGLQkWzBpMIF8+KAIV8/X99Mv9NACWeJXRkw1ac7Kb7sro8xneEX
	 JNyPfFz3awbFVpTBSYcqJkygbIK1M+4WPRVFxJcv2VIX+9RoQ3zfv+AMkxy/U25UO74Mf
	 1teYiOOkB0n/DnbTSJV9LpOopTJN/y3kCE30EMX+Tg8cxSu8gEOHGP/GvfhBuUQZwnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
	b=Pns72k65nQR8359W5AMC9paPc4ocrWQsitpghQM/I/G/WUj5cBvV+Bn6icOCevCI9qTR
	 Zi4wznpAC4P7Iczcj8tV3hw7IP2PLWE/FIp9nL0O8Kjw6cmXZMaaCvRhGV6KyKFG6xy44
	 Q2jB8cL6aR6W7GrCA6+qkDDCZqrUjrPkWkspJ6O0BFdgGNuksM0noL6mbKr4jp+3Tbz1w
	 sR9Oo9ZtSI/vg3UNvC4b7l3DwZXDhysjG7NfJxsLLTO2f609YnKYFANSbF1m0vZmz0RQx
	 rI8/ocedd1ItPmmpMqAXFa3emFy6tOtRP0BQcLm5R3fEUYp24RotIwKbcQfviBndcoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfLHSGG2;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA2E606A335
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 08:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA2E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfLHSGG2
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4682977f9aso386050266b.1
        for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733119; x=1795337919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=XfLHSGG2nsFP5MIFTs3xJUxMDgm8XBTB9XMUol/aIMiU/A5WL7x9hsjsgmz7j/V7Lt
         r218zYnJetZCqirTRlpDzGTph83SXH/B2N4BuEZlVdKzj3GY6LM0Bsc7riRtBAjgjMej
         Lv3JQf06Y6Ynn+c9y8G5/W6Ie+WbQBbhPzC1VXCXq/2w/Ot8yoYK/9grz3BRyCUtm/QV
         yg182CkvYzLIsZ4z/1305g4QSswQx4HEFXPaMnwDYxWYIMQFdSz2VemifGvdlpeYCRzx
         +R4vb1fTKDZiSkF5qZfUJfj3QEw1TYzdl0UgVA9RKrAcwbeTzNnHP7PMnfWDdm6laKsu
         Namw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733119; x=1795337919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o49Az/X7nnRMbCTvuIgrTpIjxf+w39CY1NNO3CjBfDA=;
        b=UGH7FLIuo+BQzbEQPFNFP5IcwazXyqsioi/xpfNBpiz5LwZBmNMRtU62v1/vuD4CIL
         WcD/QZIV8FMGVMatrosG8udRaPL1W9785Hq4rRUFIP2GDdn4gEATkxnZgOX/6ZHkM2F5
         88Yra+/ZPlgiVXH5xXR2wQSbPTMGuCKiknHCxwQ7/Jdqrkdh2uVpUPZ3flvfYy3muBg7
         fmE/3+DwIqPdxUCEaNLcAGtcqcn6oBDnxNE58qur/k7koYUlYqo0GXd98odRQwZCDAHT
         eGBVNwqEO8PzqDNEDcCZgFnxFCVZv9wb4W48AfUyVjVsV9idES81f8J56u98cCFpUWr2
         BVnQ==
X-Forwarded-Encrypted: i=1; AL+hErHiUDG87p+6IMCURsEvJccDQyOus3X+ruVW5jj3qx3pQZLX0N8W06ree3giKRmFoLahJH4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Sew2GqtIApbOXOkw5iAFHEDhGXiqTqHrRYSYUHToIOC3LthOu
	/BTXcayWSGy5AMbwauPFT5SpIGwxa/6uZ2h8eW0af7AW2zv1sJanuHoB
X-Gm-Gg: AYBFou0+afO1NLux7YGPA/5Bss/5hPuQZhpmQXTYbNYKOLvI5uPjxUUbJpS5CwnEHNW
	J/ArpO9ZmjAZM8ar1rCoLTlOczud0zOGbvrFeSe+vSmcPtlSivvSn7CDl/BAm5EZsChXXUTutRd
	hI1o3rARAbf3zGo7865GzKxypQ1O3lAlKVG1psaqf/UToFAEGeXgvNv5L/443zQ0nTPvvtZYrLd
	8oNBUWJZYs02NzX66wUqnwrgdEEVAiVOsRjkV8Frt1Ey3Tk0W23/lvzl0urvQFfms0GjDNBvU7U
	Lj92TMZJ4xWKjoVjkhJzk26QqZlJJMgo+npQAL+YiKVvUjOLhtqoYYnV+WayxuKiyHrFySvr42C
	+oF5fCrUfaql3Xmre8Xd1x2qs9ZNhLiKhHdsNTNGprQX73mtmMmrohPBIUo5UfpS38RKocIuSkH
	3XzulPmlQm3+4vMxmf9/EzUj045xSEAr/5DtWMyL0voD+Bsjd+Jfg++6hNq4jWySPuHpbDVQsBq
	5jNhXAHib5xFuL/J5XVu4Bh5BihT7j1/t3kxCtbQsKYN1Jm/Aoz85EB6uEG09eSgk8iPidvqefF
	XLB6VCGBxah5wugq5LgYnWVa/hzf+DQgumYR8yS2S3MgZ23guLK4pENyhqjwjPQBgno90Uznoyg
	vzaCE9VlLbg==
X-Received: by 2002:a17:907:9448:b0:c41:8e21:4d58 with SMTP id a640c23a62f3a-c5096199393mr579973966b.5.1794733118390;
        Sun, 15 Nov 2026 00:58:38 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 1/4] dt-bindings: leds: Document Skyworks AAT2870
Date: Sun, 15 Nov 2026 10:58:22 +0200
Message-ID: <20261115085826.89641-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115085826.89641-1-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
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

