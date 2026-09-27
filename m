Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6C93BD241
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540048; cv=none; b=jC/lTtBQXol4Sl0OpjGE4qDMdPqQeWJSNHb4gu68vyUGc+924mi3F1FUJGMrketFaQo8C4y5QKKvCdTwD5+9IQcZFwo4ZcD5HA063IjtisuiBV1M0Mke8jkwQfnKRQpNESaFM7iB6uMwVClewVgK8Fyc4o4q0j67queEsQQ/ns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540048; c=relaxed/simple;
	bh=ZZeixT33K508YXS7awOOMQnGZZ8sVeeN1ZslFQ+5hXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvssT2sOsk9FE7VF/66ozwhuM82Gpann3TI7mfkK9TiZBxKTilgICEyX6OxMrEMdeV2V+teFn4IFpkK/sk7DNIvmiF1YxZMHkW3y+gG3b9TQKlF9OCVYgJqRbLieUVF1qrHEQca/0VFrnkwnzYVxyBbWyHNZJ/ZRo4APFy9Hj0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P363yc0I; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P363yc0I"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so1586900f8f.1
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 13:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540045; x=1791144845; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=;
        b=P363yc0IQc8ft6z+Wp5I9p6l+zDaBxxOG5ZNCy7jWPwP8bL0RWsu9CBQBwUJiYSN7/
         t2LJ7aeq89SIOvhVfnq/QdtfAQ6/xMXiF0PV84v12sayELITfNbyVnXoi5hibbCxFYXd
         HmRumK2k6wf7suStacw+1E6v9AygcmwBnpFNt9Blkb9b30HZLVQL25oCAWG11rbqbVbT
         RHAcib0kBPRr0zHOWTaYR7YobR5uJeyn7abgKeWQIcC1eDsFtcgNfgUtyB1hX3xPRb6O
         i+e6daxlrbt6DlI6go8rmhY+yD0hl3WGymlMgr8wEW1/ngNl+H/UsgZRvMdBaLE2ppvP
         SrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540045; x=1791144845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=;
        b=OzfzUFswhdH+2OmKAYc4aVktHe+gbptFFo/kEaGWRHArD23TdS4orEHV/BFvarz5Kn
         tI3+FTiJ7GNBFCfx+Tsn/+mdWqQd+JXByTfbMphZGstl4TJ3KUWifVllW72uMd9YcY0Z
         FWDmxyWS3pH9HSOV7SFKvyU7ghgLv57akSovzsHyAk56dstP3KnU/Br+pFp7P+TOpgVu
         JAxTdg15biUjqHu0qdtvrZescYpognftuw/9vaEt/y0YdftgTqlwsUNAGNs+aZSqKsji
         Dydsbs280zUEIziSrQrjTpgeZNEbeV+imhOzGJFcsXXHf4XRhBX2op0zhE0oeVl7p4G8
         bbcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOWyTWfzPIXxdSebcZMUDNKQmUM2D640foD7UPZ+uZ3vQxo3Odtj7khurDe78NLsrBQsA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLHh3C3cS4UhgVldLcM4lB+3in7AT50/yHKNpb3jkzDkVxv3Tjs
	pO5TQxAbGj7uhM+2HtK8rH3tUaWbt0f+bUUBB1uiaMiT4UoPEuJhHwMI
X-Gm-Gg: AYBFou1cj95BR6Bl4VHvef2naUm6zCfrJmcJ0GrcEa/xRIRTJ8AVbBHuw8KQXrrYppM
	suyoNQznVkXHSWey22ELCXC/V2KSQtsZQ336NWxSO5AzHX3EReNrUPsJH3jp4nS7dJ0ZJzA2jlZ
	vKpeaaTHoDRVz/OsLsgFVOL4T1ZAUb1Z6aG071p1e0V8ynT7ZNbvQoKfnUe1FkAXP5nWrepIx+c
	21GRtMb8WCA8cBukYBplqoChOO4QixDxe+lfiCXR0WY11PhihBIzbkh2lenm7fUt031oavBUbcy
	7FNJbS74oECM5s9TPlhXNxxQ8OLNdWl2HStSOjs+faNGezEb6WZryhJSJV52LulS2+XVVoIrWJ4
	3nDLx5N7M2aQqOCS/6h1m9lMjyPbK+ZTvXOzBRZKGYIZLzxq6e9E+tSoh2myDXGDCc18XmMxoMZ
	hlIHXjWiPI8X4WgaLuNPTD4Wm/cpIr4xBknGBRxN8kKfxzw/baYHB8XpghMOwOCVoVy+09pZNFK
	nI/QNu5
X-Received: by 2002:a5d:5f85:0:b0:488:7fc7:dffc with SMTP id ffacd0b85a97d-4887fc7e08cmr15202866f8f.37.1790540044710;
        Sun, 27 Sep 2026 13:14:04 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:04 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:31 +0300
Subject: [PATCH v13 03/13] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-3-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8565;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ZZeixT33K508YXS7awOOMQnGZZ8sVeeN1ZslFQ+5hXQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj0K8mUgU2bzwvm2T/RYD5FiNOdgNSnkX6RY
 zLZRgeCl/SJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLrfBAAhSWuZVPlcLvMFtuK41yduFLCRQtYszS
 KqbLZfyWXdxDVUeVO+bnrlH1VHW7DXu/paWi8sIaidLr5nWxLlV4THXq+G+/XGN5/XVh/JBg/FK
 J59KVfzWOLPGDoGdNeChYiGxuuCQ/1ZQ6UlGCS/TDoImrWuhE6qUckydKCxp5/M8ibZhRUtr9im
 EmQIGiYXuayKSQAelLIhVKNcdDxYujKYJFBX7TilwSYBqpgu7dBbuhi0G7Fp4o/y3WZTL3MNTyY
 GnIrOj861fvz+cdUX7YYbsSKVpTul+gW2Y77iY4RliUWbLdfQsFhzSNeVrvLjPkaM8XSFZ1gw3P
 TaPw3DD7q7jq5YNqY2IRIWmmLUjvIT8phHEBJOkIKxXvtWiP0NqRRGsnGyciTD6AeITtSgNUgJ2
 MhgheMK4SGZdA02k62xWyA44McS4M8sjWdZlvObWz9Qswdn2Q/n3EIzJYUkb6bd2nUmBxJOproj
 4RgZ2gpIJwi5tG/tTn9yNQ9+6wa53eRqDpQ+ogU47Odl0wuA+i88w2q2Wb82wf9xvrOS4cRZT0s
 70olM5cbOwix8t2X18uW9hpU+Eu72QH+0BDKE3EqpxWq3uttO6kR6R4oid1kT+HGWM0no5YQXJ5
 3nOcNTQ+gLYPy9f5R8EnK28+VtRzQXIt1RKeiTYSgMhi4YkLOveg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The clock controller of the zx297520v3 Low Speed Peripherals is
relatively clean. One register per device with gates, muxes and resets
and for some devices a divider. There are even bits in the matrix
controller to control propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
device list is complete. There are, however, a few more registers that
are likely extra dividers for TDM and I2S devices.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Patch changelog:

v11, v12: unchanged

v10:
Fix order of clock-cells and reset-cells in the example to satisfy
dt-check-style --strict.

v8:

*) Start clock indices at 0
*) A minor grammar fix in the second paragraph of the binding prose

v5:
Rename from lspclk to lspcrm
Remove matrixcrm from example

v4: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  37 ++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  19 ++++
 4 files changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
new file mode 100644
index 000000000000..b0a176ffda12
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-lspcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC LSP clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This clock and reset controller controls low speed peripherals on the board.
+  This is a relatively isolated subsystem containing UART, I2C, I2S and SPI
+  devices. The controller is responsible for bringing the devices out of reset
+  and enabling their clocks as needed.
+
+  The controller receives its clock signals from the matrix controller, and
+  these signals need to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. Resets are defined in
+  the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-lspcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main PLL divided by 5 output from matrixcrm (124.8 MHz)
+      - description: Main PLL divided by 4 output from matrixcrm (156 MHz)
+      - description: Main PLL divided by 6 output from matrixcrm (104 MHz)
+      - description: Main PLL divided by 8 output from matrixcrm (78 MHz)
+      - description: Main PLL divided by 12 output from matrixcrm (52 MHz)
+      - description: Main oscillator output from matrixcrm (26 MHz)
+      - description: Timer oscillator output from matrixcrm (32 kHz)
+      - description: LSP pclk output from matrixcrm (26 MHz)
+      - description: TDM wclk mux output from matrixcrm
+      - description: DPLL divided by 4 output from matrixcrm (122.88 MHz)
+
+  clock-names:
+    items:
+      - const: mpll-d5
+      - const: mpll-d4
+      - const: mpll-d6
+      - const: mpll-d8
+      - const: mpll-d12
+      - const: osc26m
+      - const: osc32k
+      - const: pclk
+      - const: tdm-wclk
+      - const: dpll-d4
+
+  resets:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1400000 {
+        compatible = "zte,zx297520v3-lspcrm";
+        reg = <0x01400000 0x100>;
+        #clock-cells = <1>;
+        clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_PCLK>,
+                 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12",
+                      "osc26m", "osc32k", "pclk", "tdm-wclk", "dpll-d4";
+        #reset-cells = <1>;
+        resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f367b5126c2..06dbf9305518 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3922,6 +3922,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index d98bc38635b0..a63283d5df5c 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -114,4 +114,41 @@
 #define ZX297520V3_LTE_MODEM_WCLK		42
 #define ZX297520V3_LTE_MODEM_PCLK		43
 
+#define ZX297520V3_TIMER_L1_WCLK		0
+#define ZX297520V3_TIMER_L1_PCLK		1
+#define ZX297520V3_WDT_L2_WCLK			2
+#define ZX297520V3_WDT_L2_PCLK			3
+#define ZX297520V3_WDT_L3_WCLK			4
+#define ZX297520V3_WDT_L3_PCLK			5
+#define ZX297520V3_PWM_WCLK			6
+#define ZX297520V3_PWM_PCLK			7
+#define ZX297520V3_I2S0_WCLK			8
+#define ZX297520V3_I2S0_PCLK			9
+#define ZX297520V3_I2S1_WCLK			10
+#define ZX297520V3_I2S1_PCLK			11
+#define ZX297520V3_QSPI_WCLK			12
+#define ZX297520V3_QSPI_PCLK			13
+#define ZX297520V3_UART1_WCLK			14
+#define ZX297520V3_UART1_PCLK			15
+#define ZX297520V3_I2C1_WCLK			16
+#define ZX297520V3_I2C1_PCLK			17
+#define ZX297520V3_SPI0_WCLK			18
+#define ZX297520V3_SPI0_PCLK			19
+#define ZX297520V3_TIMER_LB_WCLK		20
+#define ZX297520V3_TIMER_LB_PCLK		21
+#define ZX297520V3_TIMER_LC_WCLK		22
+#define ZX297520V3_TIMER_LC_PCLK		23
+#define ZX297520V3_UART2_WCLK			24
+#define ZX297520V3_UART2_PCLK			25
+#define ZX297520V3_WDT_LE_WCLK			26
+#define ZX297520V3_WDT_LE_PCLK			27
+#define ZX297520V3_TIMER_LF_WCLK		28
+#define ZX297520V3_TIMER_LF_PCLK		29
+#define ZX297520V3_SPI1_WCLK			30
+#define ZX297520V3_SPI1_PCLK			31
+#define ZX297520V3_TIMER_L11_WCLK		32
+#define ZX297520V3_TIMER_L11_PCLK		33
+#define ZX297520V3_TDM_WCLK			34
+#define ZX297520V3_TDM_PCLK			35
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 54e5b24f859a..b21d5901a7b9 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -40,4 +40,23 @@
 #define ZX297520V3_VOU_RESET			10
 #define ZX297520V3_LSP_RESET			11
 
+#define ZX297520V3_TIMER_L1_RESET		0
+#define ZX297520V3_WDT_L2_RESET			1
+#define ZX297520V3_WDT_L3_RESET			2
+#define ZX297520V3_PWM_RESET			3
+#define ZX297520V3_I2S0_RESET			4
+#define ZX297520V3_I2S1_RESET			5
+#define ZX297520V3_QSPI_RESET			6
+#define ZX297520V3_UART1_RESET			7
+#define ZX297520V3_I2C1_RESET			8
+#define ZX297520V3_SPI0_RESET			9
+#define ZX297520V3_TIMER_LB_RESET		10
+#define ZX297520V3_TIMER_LC_RESET		11
+#define ZX297520V3_UART2_RESET			12
+#define ZX297520V3_WDT_LE_RESET			13
+#define ZX297520V3_TIMER_LF_RESET		14
+#define ZX297520V3_SPI1_RESET			15
+#define ZX297520V3_TIMER_L11_RESET		16
+#define ZX297520V3_TDM_RESET			17
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.55.0

