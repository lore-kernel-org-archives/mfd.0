Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD89369D7C
	for <mfd@lists.linux.dev>; Sun,  9 Aug 2026 21:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786310951; cv=none; b=X8lDt0Gn9ZfVhj1pccuooBGpPKTs8AXfzfbKE0cGAgwvgUCNba4NDgwxr5Rv6W/4HCRfwE7GTOurSKqGF2DCA8P6cXp8wYjgube1eUnOkN5XV6EoA44KOn58ri7HULK4FCHemoQxanPqRpqbiqAmagKcoA2yy1tm2ab6vnC54TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786310951; c=relaxed/simple;
	bh=BFYF0j+WhY5MI5AfK691WBELYamx1T4rBwuqj1NPXUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ab4Q/Y/jhE8ddyVhNoPN35odaQd6xrFktthqN3xIKERSZTCmsc7YBKP66ZVdIfik9NL70nKpqX7rklz5JSDfZIEaUU8Q5sib+a16TDVquie1mZnNfN3PeNnDTD+ClAGWO/kc8ffpjzORxZNxYtGu0L4NELogoaQakwE66FmlPf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qj7GggCI; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qj7GggCI"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so664512f8f.1
        for <mfd@lists.linux.dev>; Sun, 09 Aug 2026 14:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786310947; x=1786915747; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cj3cctoGQ3zOY1kY4F0uUYv841ImLbvdfRVhfy7KKdw=;
        b=qj7GggCI9VSVyP1kruhLfF1LXQ+myvoPNG7vS7SWGJlm9nvFEj8tfiqGXIGC5z9Fxp
         afXtmi5xy2nXEAdj7tjkvAEpBCwmMi+mFw21w2Q3hRRqQTyxuUks0dltM3lXINehVkwV
         6hc4+xmuX0K0Pq/xnGXzqnnvD8xvvPgJB5HzWo1kt2K3VsmB2juDU3RhIOGhhnMSbc/U
         y+iJfT9BKgpcB5VQpO0Z+f+7S5R1ogvY6cFn3VpDNyUd2d9/a/hccml38i0kbO1Lx6WE
         1cc69YstEo5VJrC0TRfOsDFuaIluh9x6YRK+b4ON3TbnNFgJfMkEnmmmoGr3LWnssSYy
         QTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786310947; x=1786915747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj3cctoGQ3zOY1kY4F0uUYv841ImLbvdfRVhfy7KKdw=;
        b=QNVQXI9kc7n38ojNRY8kjSQHfEirhJOb6pV7wJrtibzkWUXlFpOCdBBljAIVM5dr10
         03fjtIWRYYgTdqDzOxMI7+b0mnq/dByp+XmP88IrrN6NGI4WIh7oiDdwFPRto7P1pMaR
         x5xu3GtGAYGAdjJpPuQJBcmobwX+NbhqHWxI+hPkCv7KcWIZOEcpnyHajtRx0mscwpAK
         KPVLwtbWfm3mE3CwoARP8s9jQf24L/ODwy6icBWBIW6/uY23ZMYcmNqJWiLssE/CBItd
         nZG4fyYp72Xij8ex2IarK2p4o5E9HQT3yiquzaWMCFb07ft8hNN0wB+Tj+QKqvHgA2bs
         0QoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOyrRD8BwjL+5abe5LVyuEiDymnIkSBTROfdtBdCz6UgNkY6sudvW0UqVptZ6+iL2XcA8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIwiWRZPN9ZC3wXEONzhUktpLgv006X9SeFqNRWWfJrrqHM97z
	/dlHMzceW3KQJZQ7YNskKRqqBz3c8+VHiwXEm3TFwWQJz1Ao9KCha4VU
X-Gm-Gg: AR+sD11YEiBaFNrcATEmN1raosl+wFV5/uDRKhI+D5rJ1yMvJVBxQlRbZRGqwZsLf9N
	xpSQVAp06qIdjMBVEJKTKb9QRGPoCb6O/4uSD7OxVxgEtUDUnG+motvSies/z1OAZcdClTKRv6z
	jDT7NgmHDp4NG7DgAu83+nX0Z5P4Ie5QZASxxUopj0SJX6EGL6p8CrpZdlDoFLzcXPxjxq/PHn3
	DIVE4UpNxPUToB1sQf2T5ocMcUEKk9Rel/omy81ZCyefIYcIVcSpMESXGTdjCgyObilSwwk9+L3
	K1eEhcdGOso733SyW/YBiemXLwMu0onIGAg850fWbIhiGC1vqWxhGORTYBVISXvFJoszBo40xua
	I12BCcKSMzg+TQ4uxnjQLs93KVPsZc2D1Pfc30ILU0SlBsWABkGpMtWUk1jtNSuXohPKu+ql8kK
	KD1hW0v+VITdKiByyryMCSHnujGiJwIt3hnYdjNJ2wPyfTY1Dnj45YtBIrPMzbvqcEyXfqK/A=
X-Received: by 2002:a5d:5f45:0:b0:47f:97bf:d891 with SMTP id ffacd0b85a97d-47fec50970cmr56842750f8f.1.1786310946498;
        Sun, 09 Aug 2026 14:29:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm28987451f8f.18.2026.08.09.14.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 14:29:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 10 Aug 2026 00:28:22 +0300
Subject: [PATCH v10 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-zx29clk-v10-3-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
In-Reply-To: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8538;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=BFYF0j+WhY5MI5AfK691WBELYamx1T4rBwuqj1NPXUM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqePEOCmdnn3jBuidQdznQ+K8tbHOSZQPrVkXLp
 lK+5RCDeTGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCanjxDhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKfFw/+Nmb4QGxR4kWnPz1/gyEGsHfL3u66ed7
 VFrST5buSyozgiLSE3RQA5V036egaXcXFx8mhkujonYGu80+ZHXM6/YoA+x4sdOMSLK3QmpQrMg
 rRv+b7hf/CyeKyoAOCoM+N24NcjcO+tv8amJ7+7nfAR7vur1GHzMVQVoDrpML21rMSaxYlbV0KZ
 eIHfNcM9iDAF+XvzCm1lkppZ15mkdHJgbCYb5i5tJdHTpZnSHig5d6nMy06VxZY9mkIf+9OfEuG
 gwlg6np3lUM3ly1cHb5upH+l23KPBpT4/f+9aNslZqYkCDeT3QBd6vHYkNGyH03Vxkpg2YzfLH8
 5m7cGO97zwdivM5cX5WWHKYPPmVJm5PtEyt1d1rkaqQMm+mtqqEa25d5lBCrcw4mAihJCxvx5m1
 c6mKcP4ZYa3Epr44bA4a6vsJIZ9ybB8DqV1m+i3G4nBVG1ETAJauNIFQS2j1UUv3M7fndqhi7cQ
 R+UqLdIuxMXf4VnNW7xLtGZ3jxKquxqMRfd/Eo4yOaCQc3XvJ1K8bNwns7tiLB1RCY8dOPaz3W2
 JmokqB8i1MiDkEvRn+H639g8cG/K215fyPl/2PCGPup2h30EyLwT0KA/vKTORpsYlNjS6ytEyVT
 hVkxqSf5qUlgKoljgomvtZA0c96njwJmC/AHaaKbTnVrI29cQaFs=
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
index 4b852dbcde74..61dbe959acf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3904,6 +3904,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index a5e5d5f17c87..0e8c73671139 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -105,4 +105,41 @@
 #define ZX297520V3_SRAM0_PCLK			39
 #define ZX297520V3_GSM_CFG_PCLK			40
 
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
2.54.0

