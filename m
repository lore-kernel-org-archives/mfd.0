Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD793A0E99
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734149; cv=none; b=lj2KLd9i9gKbzJenYQ9i8uJSq68Td0fBUey2K+bybs8sShiWx4FAQY7dDcvFXAmlWA1BgmP3GxjyfNWvlPxyiMgeOqHc2TmQSs7VEvDmpoqKzERfgKXlV4GzHiSFEmdoK2XBW+XTPoJ5SeD3mrW81VCBJ4hLsjb1Vx++wfFhof8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734149; c=relaxed/simple;
	bh=DTn/pnAwjoqAyUd80mDT7MV7oTEK5ffPq/Jme8VHnRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J0FRFFkdWDbf56etmk0w9xzKGdxdui33FYx934w2ZQ5r4f4DOI9B6/BLRKUbMssjywWUQ6PTjbLrFxieXlcx+zo7spLbkmLXJ8iN3tzPi4vQe3AIDrLPCBGWhB8N3zcAvxMwoZMN30B9AZggh8egFZLRZCdti4qMsCUScfmshy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=av6bUrCh; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="av6bUrCh"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb545db3afso1979666a34.0
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734145; x=1786338945; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jidbxiox7dX03nOKASiwvW/wC69oSzUN52btxDpp97E=;
        b=av6bUrChwOemCwTiZN7fKT1f5RBZdwaedVR5pPZG2sdO5f6sbZKzqwZKSrZea36M2e
         Ugk8uPeZNUm3bU8X1XJL2I1TUKOs6bMO9H3Fg/zr9Gj/gVfpTI+Eg+mlF/5iS0OZ8qVy
         IEJCKgtKp57yALi6WHjVxlRKXPjwbHNtKkVntDehqRuT/ZtFdtXRgrbt4zx5TyFa6b9j
         WGo8TYCWRk6wWkpdTbSfyH8nwOXa1M7afbtf5qBcHmtWf5lU7w/r9yoZFHsS1HPLLVnZ
         twmzrjw16K7QvchZoiH7ze0ioSNFSPFcxTiknvP+uEB9YWjrXHErs3o7XMpfP9DivBSZ
         p49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734145; x=1786338945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jidbxiox7dX03nOKASiwvW/wC69oSzUN52btxDpp97E=;
        b=H/GWBlnirTHDSO6/GMCIV1Tw/0SxfMWX8r2raRSOv4smUmLJPLSAAAY+GDr4mINQvY
         mB2vz4T42yHLjxsACoh8/fiIyw7EkmU7zGuKDtHEnEKyzeI5mqMIESSHHKKkUMnkIvHL
         CKoJsMxC2YgfVbCnudFwijVjJLUL92/zUwVOhMu8U8b/ytb3JjbhMx/fDBppll2Nqk/2
         GRopu1ZwNsir+Dcrz/pYwWmgBq4lSTX4lkqHEvEgzq0BpiuL3ZS2dkPvUE9HAbI0T/oR
         BMVC3JR3nvLayYSo0bFK3+urANxkP7GdDhHquPDhHl26oNpIDhrFhz6UgEE46tI/KeRj
         q3VQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOy6vPv0fyDIVs/wylLX/SPtVg1EyJLf9gxsUqhoeSd1xg1VqduuwA7GWSRad++MzNHMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuEOdSgJFaNC4cVx18fqhDyZ0+PjnjtSCgAHRxxSZnMi78aZjO
	txe3JQHtYSw3pCG7wGe6EM4zoYtkqQutkcNkxelit7GOjMhMbEqS6nR+
X-Gm-Gg: AR+sD10e1muzHiq3oS8jb1c6wEuWuAa326WAlu8zry1UhRpZcAbyRl3Yta6JaSCc0KU
	MMgYjBsYTLibL0O+dIrGr74GR7BTAXPudfpxlh+2z1/My/KF4t6p6q6eLKsB+7o6pIPz8IOhCZh
	x/yX0RJG8nZRTmZLQWg5i97pRBrlABPAivLNmuzrr/TjP17gIvm/UEgMSC7zPaKb1vFJjyPfdKM
	7V1TXa+EUrvO4v44CQhhO53RlUsnyRV5gd29qMDaQtsCeHoGbVJ3043158sCpaErOy+551yfwj1
	2CtZBvWqDde3B4OTPzHax3nImOjKDM89C+qEb6ab43BfHbPdFue6UGhTPj0GZHBGD4r18kekPUu
	6f6rkHLORkVNEwMEJ6O6v4xGe0+WK8g9YQds18MX4seWGvb8IACE19VBq3pN+4XYapCDni3ygkf
	HB4BTXXLuJxYn/D0loAn9Q3uTjVcnqOLM3PAKaQR1eGAJFu/AOkCF6iFuUCsjKi0MPOnIcYuXiF
	t7p4DTpWkQ3m5Vx5g14CH7736gTNGTnPbDGfpuf7ElgHoMIBXQ6TbDNSFSZ7CSHaug/2MUcic03
	LVnhwcOSagBBEnsCo5Fk1tk0aDjhUfkXnsBJZWRqy1dhkrxexszf9rHCzUHOJSxjb9tLKWXA3og
	563KmWXJ3veaqdEvq
X-Received: by 2002:a05:6830:411d:b0:7d9:f50f:9691 with SMTP id 46e09a7af769-7f1968c88e1mr15370101a34.0.1785734141726;
        Sun, 02 Aug 2026 22:15:41 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:23 -0600
Subject: [PATCH 13/21] dt-bindings: net: x-powers: add AC200/AC300 EPHY
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-13-0a53cd9e21cc@gmail.com>
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

AC200 and AC300 companion ICs contain compatible Fast Ethernet
link-PHY implementations which report the same PHY ID but use
different control interfaces.

Describe the forced-ID link PHY and its control-device references.
Fixed systems reference one already enabled control interface. A fixed
AC300 system may optionally provide the configuration field for its
calibration-range bit; omitting it selects the normal range. Systems which
can contain either companion reference both candidates and require a
logical two-bit NVMEM field for variant selection and AC300 calibration-
range tuning.

The link node reg value is programmed through the AC200 control
interface, while AC300 requires it to match the package-strapped
address. A control reference is required to distinguish this
integration from other PHYs which report the same ID. Also describe
the optional xMII receive-clock inversion required by some integrations.

Describe the three fixed-function package LED outputs using standard
PHY LED children. Their functions are link/activity, 100 Mbps speed
and duplex, and their polarity is shared. Omitting the container
retains the vendor fallback with all outputs active-low; an explicit
container enables only the outputs it describes and may select the
shared polarity.

Allow a PHY with a routed interrupt to be marked as a wakeup source
for magic-packet and link-change Wake-on-LAN.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../bindings/net/x-powers,acx00-ephy.yaml          | 217 +++++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml
new file mode 100644
index 000000000000..3e01f6b44006
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy.yaml
@@ -0,0 +1,217 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,acx00-ephy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 and AC300 Ethernet PHY
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 and AC300 contain compatible Fast Ethernet link-PHY
+  implementations which report the same PHY ID, but use different control
+  interfaces. Systems with a fixed companion IC describe one control
+  interface, which must already be enabled. A fixed AC300 system may provide
+  an NVMEM configuration field to select its calibration range; omitting the
+  field selects the normal range. Systems that can contain either companion IC
+  describe both control interfaces and require the field to select the
+  matching one before the PHY identification registers are accessible. In
+  that dual-control topology, the AC200 I2C controller and AC300 control
+  device may use status "fail-needs-probe" so the selected one can be enabled
+  dynamically. The PHY node's reg value is programmed through the AC200
+  control interface. For AC300, it must match the address selected by the
+  package straps.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: ethernet-phy-id0044.1400
+  required:
+    - compatible
+  anyOf:
+    - required:
+        - x-powers,ac200-control
+    - required:
+        - x-powers,ac300-control
+
+properties:
+  compatible:
+    const: ethernet-phy-id0044.1400
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Logical SoC SID field whose bit 0 selects the AC300 control interface in
+      a dual-control topology and whose bit 1 selects its low-calibration
+      tuning sequence.
+
+  nvmem-cell-names:
+    description:
+      In a dual-control topology the configuration field uses bit 0 to select
+      AC200 (zero) or AC300 (one). Bit 1 selects the AC300 vendor sequence for
+      a low-level calibration value in both dual and fixed AC300 topologies.
+    const: configuration
+
+  x-powers,ac200-control:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AC200 Ethernet PHY control function
+
+  x-powers,ac300-control:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AC300 MDIO Ethernet PHY control device
+
+  x-powers,xmii-rx-clock-inverted:
+    type: boolean
+    description:
+      Invert the xMII receive clock inside the PHY. This is required by some
+      SoC integrations, including the Allwinner H6 AC200 connection.
+
+  wakeup-source:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicates that the PHY interrupt is routed to a wake-capable interrupt
+      controller and may be used for magic-packet or link-change Wake-on-LAN.
+
+  leds:
+    type: object
+    description: |
+      Package LED outputs. Output 0 indicates link and flashes for transmit or
+      receive activity, output 1 indicates a 100 Mbps link, and output 2
+      indicates full duplex and flashes on a half-duplex collision. The
+      polarity setting is shared by all outputs, so active-high or active-low
+      declarations on different children must agree. Without an leds
+      container, all three outputs are enabled active-low to match the vendor
+      initialization. An explicit container replaces that fallback: only
+      outputs described by available child nodes are enabled, with active-low
+      used when no child specifies a polarity.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^led@[0-2]$':
+        type: object
+        $ref: /schemas/leds/common.yaml#
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+          inactive-high-impedance: false
+
+        required:
+          - reg
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+oneOf:
+  - properties:
+      nvmem-cells: false
+      nvmem-cell-names: false
+      x-powers,ac300-control: false
+    required:
+      - x-powers,ac200-control
+  - properties:
+      x-powers,ac200-control: false
+    required:
+      - x-powers,ac300-control
+  - required:
+      - nvmem-cells
+      - nvmem-cell-names
+      - x-powers,ac200-control
+      - x-powers,ac300-control
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+  - if:
+      required:
+        - x-powers,ac300-control
+    then:
+      properties:
+        reg:
+          maximum: 7
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <0>;
+            nvmem-cells = <&ephy_config>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac300-control = <&ac300_ephy_ctl>;
+
+            leds {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    active-low;
+                    default-state = "keep";
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_YELLOW>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <1>;
+                    active-low;
+                    default-state = "keep";
+                };
+            };
+        };
+    };
+
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <0>;
+            x-powers,ac200-control = <&ac200_ephy_ctl>;
+        };
+    };
+
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@0 {
+            compatible = "ethernet-phy-id0044.1400";
+            reg = <0>;
+            nvmem-cells = <&ephy_config>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac200-control = <&ac200_ephy_ctl>;
+            x-powers,ac300-control = <&ac300_ephy_ctl>;
+        };
+    };
+...

-- 
2.53.0

