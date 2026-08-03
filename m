Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA1838E8B2
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734137; cv=none; b=Z31sBhMcabDUHF2vMfwdJnc46yiIR11wf8VMYHDQkgSezEiqlVYzB3skANrMVBJBvspC4BhpXWo/WRyHNuClvmXNWPZCP6mHOC2T3qNwol5rYwj65qJ5otWjGWxZUwKKzRsF7K6Wrrdiv4m/9TuVgL/1i7Pmwf+YZ19qmFJLSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734137; c=relaxed/simple;
	bh=6OQnGRpMnyrb+bp+bGTn43xoUYsbGDK19SjrvuCzOUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3eLlJzFzg+Ch3zlU8k9Lfa5bejtnPp33aIjbQYQVuVy6utdCjFL9oYQraVGe1ECy/+FR9013tiwTFt1ugnj4w7oU0DeTMHC7512aq6FaRoNcWPKckswQ5efo+G7MEF3pP3qSmxio+SsPUIW5nk7tQowQ/Ci2FZ+0ge5zsIeKDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WuZslsfX; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WuZslsfX"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6128bd9b3so1335076a34.1
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734132; x=1786338932; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ws0LFhZuUjZTnhwPoD3ztO16rIL3gtosandi83LBFNY=;
        b=WuZslsfXI4IkD1It7KD8ELwzrH7eC320X2pb+4Gt4DWrpWarSaXAXR+m2wXTmACOi5
         lmiWSDJu/9mJj7Jq50qhOBdR6WuXScfXBqoEiF9+XhtAbth0zC0MIOrYQBJuR7fmV6rG
         ObyXoaCT7c8oFEOFWuBdZvGZjPRTrKVe/RjLacYazWTHdqWcNePMd+JcD6gYY2p4iQUJ
         Wdq6v1g0700yQiiZzE0i2Vb4mnc/y3skPXfhYKmvMpsb4i+tluGRQqBzDMWhxhJmgZ5G
         W0YPWqHNkA2soe3mTHN8bxfpw+7aAkzcVH5YEJfY8tptFWFJNthkUiWAajK8Z8VVsP0x
         qMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734132; x=1786338932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ws0LFhZuUjZTnhwPoD3ztO16rIL3gtosandi83LBFNY=;
        b=prN82N3WiE7JbCn88PXyZaCx/BjWqR79BRiwUvgtHG9WG9g0o7HhhJlznGNu34rNNc
         rQ9I+kKNaGk8eC8KfCmDDqzETltnQ/jShC+y32YbuvIYf1CC/Apo8ACJnIykfd0WwBeu
         5kNv43U3NdrMCcAHmwusKSQK60yyelbPwfrsu2xFUP7js0LZvHUbQD5sAGew3gZLBE13
         Lz1uHj8ZZhLEspXzCDJqf3EEMT1kiR4LsGgXbOmiIEooufvNOBN2O9/GA+UR0R3LRXKv
         qd/E+mHIiY20e57t/Y08LckT0Epzd0V5IfuWVx1ynlPujDTVlguHi7sc9Vp3P7YPrdR3
         ZDIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRiJ/67Crtn+itYM5IYbo7bICbOqHiMbHzpf96YvWwRRzPQ/ifUqkPY5J+n2r5aZ2O1+4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8rc3+fiIeeyEqWyxQrX7tZ6Iw6SpNvVTdTETxA2p936lEaUAu
	q11xcXUJoZAWukywtQHzJlmFMpDJahRs00PzbK4QO767qkKeMIoaf4HW
X-Gm-Gg: AR+sD11hEgqxr1thCR00FVaH7qj39NyPAahZluJntGBLQ+eQkAHi5R6abiP9U8U+g74
	vvLFdlcN93AOubhcZo6k5sy4fReRUMoKKv0eTP86sOfGYaD7uq2L24il48f6PXuFFabix+f7btj
	Flqe7iOLyrrPTeDlfsWfH8BnrToT3CpeZ+u29tFmpOs4TS74J66AzV+ABCF7Hs81tkQQ9ZzyAT4
	jFFcJQ7x6lG/gx8NFOY98ejUy6MPSUfj8iUxS2eU8q+ANgdfefGRFq1NdiNtkc1X63qq1ivAP8Q
	gkki9TM5CuREAU5XexEoHQuqLaGciZvlxnQa9/ZIF7W3jcQIZQl+/NZveHOB7aZf57YNElEbGRn
	tsOVH6HcV408msmsWGDE76XQwY0sYRDA55MUf1nQ7rnU88aU3aXCkUvk77gJMtrGO6ajw5EdADv
	xQjTXjhqWTfdP5B+USIkR+d/6FYjuXQLuqd69DUmB+YzfBqAHBJ/hALZzKoXevaN0x3IvTm8sds
	LYnZhobX+8Ndfx58u4ylpv4pP8Vo60mc2dKAVPXx1ZmXOy/0//VFy/jq4LUcDgr0qZxZ7tWnujL
	ARkCTkrmCQk5mOXM95y9z01xbWWKvbR5aR0+9tr8sZ8TwO8i+zDXZph8fZY7joAwUGv09oQcVcx
	WVk/SXx+vyvCBTEXJ
X-Received: by 2002:a05:6830:6737:b0:7dc:df37:844b with SMTP id 46e09a7af769-7f196baee6fmr14985696a34.4.1785734132204;
        Sun, 02 Aug 2026 22:15:32 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:18 -0600
Subject: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device, its input clock, required function supplies,
the optional SID bandgap calibration cell used by the vendor initialization
sequence, and its optional Ethernet PHY control child. Document the 24 and
27 MHz rates encoded by the public EPHY clock selector.

Also describe the optional open-drain, level-triggered INTB output and the
nested interrupt controller which exposes the TV encoder, Ethernet PHY and
RTC sources. Define the interrupt source numbers for child consumers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 118 +++++++++++++++++++++
 include/dt-bindings/mfd/x-powers,ac200.h           |  13 +++
 2 files changed, 131 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..017629cca73c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+  interrupts:
+    maxItems: 1
+    description:
+      The INTB pin, which is a shared open-drain, level-triggered output for
+      the TV encoder, Ethernet PHY and RTC interrupt sources.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description:
+      The interrupt number, as defined in
+      include/dt-bindings/mfd/x-powers,ac200.h.
+
+  ac-ldoin-supply:
+    description: 3.3 V supply for the audio-codec LDO input
+
+  ephy-vcc-supply:
+    description: 3.3 V supply for the Ethernet PHY analog front end
+
+  rtc-vcc-supply:
+    description: 3.3 V supply for the RTC
+
+  tv-vcc-supply:
+    description: 3.3 V supply for the TV encoder DAC
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Optional SoC SID cell containing the AC200 bandgap calibration value.
+      The trim is used by the TV encoder; the public AC200 datasheet does not
+      document the corresponding register fields.
+
+  nvmem-cell-names:
+    const: bandgap
+
+  ethernet-phy-control:
+    $ref: /schemas/net/x-powers,ac200-ephy-ctl.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ac-ldoin-supply
+  - ephy-vcc-supply
+  - rtc-vcc-supply
+  - tv-vcc-supply
+
+dependencies:
+  interrupts: [ interrupt-controller ]
+  interrupt-controller: [ '#interrupt-cells', interrupts ]
+  '#interrupt-cells': [ interrupt-controller ]
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            ac-ldoin-supply = <&reg_3v3>;
+            ephy-vcc-supply = <&reg_3v3>;
+            rtc-vcc-supply = <&reg_3v3>;
+            tv-vcc-supply = <&reg_3v3>;
+            interrupt-parent = <&pio>;
+            interrupts = <1 20 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+            nvmem-cells = <&ac200_bandgap>;
+            nvmem-cell-names = "bandgap";
+
+            ethernet-phy-control {
+                compatible = "x-powers,ac200-ephy-ctl";
+                nvmem-cells = <&ephy_calibration>;
+                nvmem-cell-names = "calibration";
+                phy-mode = "rmii";
+            };
+        };
+    };
+...
diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bindings/mfd/x-powers,ac200.h
new file mode 100644
index 000000000000..cc59e2ab4912
--- /dev/null
+++ b/include/dt-bindings/mfd/x-powers,ac200.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Interrupt numbers of the X-Powers AC200 interrupt controller.
+ */
+
+#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
+#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
+
+#define AC200_IRQ_TVE			0
+#define AC200_IRQ_EPHY			1
+#define AC200_IRQ_RTC			2
+
+#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */

-- 
2.53.0

