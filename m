Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92D34F7988
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 18:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188177; cv=none; b=pyPjnIBeFXQu6v1/dq7G2RbN/C2Vt2WDSLrcklFvJ9WhRJQVzJRa+//Sjr5Py3MkG7Tyzx+l58eXmMtzoR1FX92f+hwNioonwZYFY6/NlsaSDzL/xDFEqCn7XkjRacsEbuWcr04XNAXHzMDCASaP+/GOnGwDZG+KRBPP2OIdAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188177; c=relaxed/simple;
	bh=ZZeixT33K508YXS7awOOMQnGZZ8sVeeN1ZslFQ+5hXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qaig2twen2H7yFxHFeOVeHPC1bYuEEZos8mBMeLLqDhwpMli8N9NyjLbHvCWG/0fBL44Pagv4QbLYzU1nchI3mGpOjnWtycK3W6DLSNUkUoHP4ZjjXQEGTAslhOBC60qC21DHnKQHaCqNFZCTt6QhrEsxJLloCFmZqGTyZWf62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8pO3VYk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8pO3VYk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso10049775e9.3
        for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 11:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188170; x=1790792970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=;
        b=Z8pO3VYkzfrAyIxP6REGBb6ReXfBQYDf2RP/e+WKeFKFUuFqBYobfPK59o1ybb1KhK
         DfetqFeWJM/PfYG+OMKcW4p9LCZeGESovU4lBW53BgLZfBaxq0ioJB1B+TUQrsedfJhX
         Q1VSVc4DTf7Zaeho9jWbKfygt1lgmwXeLwgdLpaGKF5Ou/KLXTHaa3FKfgJtNUFBqKtT
         PMeb9EyXVmwP4Hum57T3HUfJZLjEfMLWXBIR/d6OOjdYZbdPxmK2kK6ODto5AGW3Y2UI
         K4ruK6ke4FmLEK3qQVdGCaQas80rkAKze3J34OqSwDsahX1n4iPhBcT6IwoNEXHb7DaF
         B0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188170; x=1790792970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wH2Srjp6f0lUrhziOVxnEld1W9GBJurx25pR0jmeLW4=;
        b=zMh67rD2t0ombsG3oEcVn2uquFdxZNBWNQyCX448Z93UNjyoSuQnQ5RV1PY9zP1E2d
         9g1moXVe/G1NCaRDMYV0xlV5BAKCD6Uw+FP1JGiZmDx4TyxD7f6QjzFfxJWrskeMHwXt
         +thJLDpJS0KKXkohc1MqyH+wXIOZHgq1JmhMCuT2Jx9asz+f1hl4U/vp0DH20Mp96jLM
         7GdkY5rqaTQPvvug5xR82xiAJBtf7rb6sfTjWYCozucNNgZOr6pLd0t3HAz12Bn97fXU
         +iqXZTy4E9dZaty4NeUeh6rkPV539eEzwcbeYg7yqGZpLs4fsaz2TbwSKWwhwqoRXXMj
         AT6A==
X-Forwarded-Encrypted: i=1; AKwUvBxyrMA/2hQq2xGN79sD8JndZCxVoD+nBktQqlukrh8J3lv/ujJMZ5Dq8dXwZfmI+Kow3pg=@lists.linux.dev
X-Gm-Message-State: AFuF++lzPG5anmCfziR8gJVXp0+8Pz/vUFnzmFJILZjfVaLlWozBnQrk
	at81wW6ZinTrSYDQLINnt7yT22ZzlMUdNnqXNJnwYEBaIz4LY5xEyYBo
X-Gm-Gg: AYBFou3PyPs2aSjVIn86YbPGirQmdq30AyJuKq72BU1jljbiFGLnBPOx8dcPqb7w/Xs
	Xrc3PYVtB1PTL3LWDi65EInHfhl39pF5kvek79bAllBK1mi52z2RVxm/X+pS1onm7jFXjcFaCS/
	aBHJwjUWCHPNDx5LM+PsGEQe2YnTB+DX0gL+XK81xM4SkFVzGL/c8qsZ4PugV9FKDR5Zfc6vmdc
	CeiHxEcB6/ffCzU4bxbpRZECeZn06bNSbUByfSQgDE+f4P67uRdiDRofGwWrngDp6nlvPkg9NC1
	xq0dH/vMtjnAyGToKXM9U6Ijtd4o9qWwivR/uG2Hf5/QC6q6qqkR0dFU4/dVe9bIIoyZZA2ldz3
	i+PVmGYvo4lEJgEymizYhXoO0NUr08Rp+x0DF8S0YAfjbDgq+FJlJwBKnQ8BcOcQqMyqVmBhuKw
	NoNa94nclWn4ccgByJlcLIDLsSTeaw8urKZIRu5I5OgooFuGoaF6b/O8JqYGKjoxoY4sggevKnM
	uNaCDCC4uORj0E=
X-Received: by 2002:a05:600c:6986:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49fe66f147bmr977335e9.18.1790188170160;
        Wed, 23 Sep 2026 11:29:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:29 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:49 +0300
Subject: [PATCH v12 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-3-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
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
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpt3g/FTyHawhOwr1II9qnlMn7mmWrk96SNk
 EZ2bA2g+ViJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLmPRAAjrdQfibg2736vBt7GzhvYZ/39YhoTlz
 fMPjhadLVsx2+c96wQ9hykMEoTrlNY9iofyLPfgT8uKpWMkOiYziEYU5huUIrhRDRQzHPTN6Ra7
 ZqDy+cutIilEdlQtx/pttQw+PRTINQwd+TwG+hDPz1P4ZNxxFZBqSVMUd+k4mTJGssvNaOizuU2
 IfE/Ogdq3h7i9JEBalaNlrOD8dyD2PGgws8MxaqkZa+WLqeYBmSSlKx4eIPe8B3nVrWeOSkrtGg
 1Z2SBgDa0sfQBPjt6rAJCFwl1EMY5IJL7dFC0vG1X6DtFZnYJycvA2A5auCTgMGvW6Yf/wyu7BS
 h9yqJ2Jo4CnOD43THLe2plCj9J6qQHlGK+JwuvqHNMX1iJ5PUMYucuev6FOej0FX4BYMUK6zYXv
 vFQegVqOLrbGrV0TjNvTUmS0WViLjRjbEPIpgqAwNCbmg7uX1fziiUJ5vxqYwt6W6RMiRAcPgZd
 LDSRnDQZ9dW39JWtwut+cjWhut8q0mz/aZx7FuCluvw3EHCIZUJABbU6KXAlntYT/qZWj+Wi3Hg
 vAbusgX1xYyZ1VuflFDL6dyLRAdaJ8RuSG8sJV7qPMJfArO7Gzshp1z8kA5XZ0UGyMhzoIE0icu
 iFKRrRKqn+HaFUb9LpyPt1CAQQYgQADxgyHrHUvAYJZz4Tg/u7Zo=
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

