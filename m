Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16D33CEA7
	for <mfd@lists.linux.dev>; Sun,  2 Aug 2026 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702864; cv=none; b=ix7qoYP6lsZ/4QSzHF7I7pvcy616qpR5+PB9ueARezo2ppgCXfFHmDOOKKWjn/wXFAWsO9/I9aJkB3K9iZabBTbruqvQlEpW7Ez1W1nlQEQ3I9oYjXBzdfQh3JQwhJK5vqtbcqHjt7q1iLLyjT78XIwLOt+gbVMwrfZZ3svmVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702864; c=relaxed/simple;
	bh=6HbUp1XgLP1S/xWdAagL3LDdqylYbn+bB8kLn4o2B5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxxeEFBJx6raRAEnEjQqEKJw/GHjmilvWfGpZJjhT5s8I+U1uWB5RJile5j5xDhXQpPV9aVC8cpGD3Ofx9T50+4G5gzagM7roNXkzvEW/0ey/vlCbLKlpysAmkUVhBlbu5Ze9RV//aaNQAIGKly0SDJLs795I/2ipCzyZ01BtkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxBJhN/E; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxBJhN/E"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980dc26022so7449745e9.1
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702860; x=1786307660; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwH7KHPpvKiIQMk1SGFUiLTv7fu0OKWz3bX9AA+//8g=;
        b=sxBJhN/EJ77ae9NkFTmWcr36g4QEp5vUCchzP/TgjKczKEMUDfBrLDCfz5SEGzINf4
         h6OiQv7/T6lEZE6eG4iQq2K9v8HC37N5p9YRo95eJXB+RZKMOOowmaY2fqXSH+s2i9ub
         xr/7/z63vW4z9VwmVTYMumqrpJWQ260PmFKyDCrdXq17rxM2MlRD22qZ9Dvr1Cdx+bym
         3A9eErKhvRYz99767UxX3sha1+5bIRFgUNJ5SQiycHTqOcHjECJ02IlW4zoYBiwew2Cj
         VyF7RY4lDe/GkP0ueUuX2Af6EvCzg/KocYWiXyjr4dNvAWrTPTReMKprdlChlyv/5T4u
         qOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702860; x=1786307660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwH7KHPpvKiIQMk1SGFUiLTv7fu0OKWz3bX9AA+//8g=;
        b=jSeaUaXXBeR6ZG9ZbXcTU4hJy1wNg+THHBtsiD4A+/r2loXFvQcPgTNv+2N1iHqrGA
         gktQWRy0LNSP+j2lhI5JNtsgmueHy+/sBqfI+/NmD/pWODAxSQqYoJUNXnbOtY69qbVQ
         wM3lr2OXFfec4l69ON0eQQcMsdYgvBb1Y/y7fBMFh474iugF3dlgSgV5Fvygy9GfyjkQ
         pPow2ja8aKYgE/Xj4nTCqIHBgsL352FyfX1Z+vIuKAqLaM8e2AfNBxZ/brVnQ5lpEr64
         c1Tp2Nk5l9bM55rqd3bENi5xtC4PowwtuqdWEFDRNyTynX2cBsz0QxPQcMvM2MQrEpUN
         L/mw==
X-Forwarded-Encrypted: i=1; AHgh+RrS0nQ4u5Nsxge6V2PZtz1+7pgvW7vIKfZHS4OAleBIYzRCrH4zbdid8Vj69gyUfzVz8cY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPrblZ9pJ/RR0/2fCPS06iNEG2w+mR1zNBEKVU+8Y+HAB/SqyR
	IpXZKz5GibXGxXSscZ528fn8zwFufQEyF8+Or/kiDLSN1Vr8jAaZh3hA
X-Gm-Gg: AR+sD109zxFVObT6nd4McO08Ua86c7VYcUMHnQ1aJCf/k4m7cibKH82NprFeADo58Cb
	17n6WwvEcXYRBl5uzsZxTYcvMv3kNSol/ojq8i14S64WOtuT6SW790Ig6LGhEdUM33Ipl6G0Ayc
	TmbREZ5gfXIp6Q/U0nidRucqqB7zdVElDunadqfTpZNl34NmR7znF8Tx4yudlEKcSZZ+CWSRgRH
	lKNJFhgYZi1tA9zF4nNwhRT69nQZJEX7P0QqmJTrAMaMHPZ4/uZktk1eSwmHzP9KAQ3U1ApoUXH
	4hio0xF5BgS9Z/nu+O12kn1Lfh6DatkqGRRu9b2aqwHbnh4QoXHwE7thr+O+Wg+GP/A6amYXVFF
	uucA/HUc3KXHJIsekUF3ecIK4GFf1X45NgmAWO8MIxcB4QigJsnW6yj8hZniDBiVTaOMO4nIElc
	diU7fKWeFwF4mnCe888ZNUt9NZrqtCXIpMe0UZD9f2KFZc1Xn63biaO08wUDUCDf2XR74zHoo16
	w==
X-Received: by 2002:a05:600c:4f84:b0:496:bbcb:b0bb with SMTP id 5b1f17b1804b1-4980c674e31mr159929705e9.18.1785702859402;
        Sun, 02 Aug 2026 13:34:19 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:17 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:35 +0300
Subject: [PATCH v9 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-3-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8435;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=6HbUp1XgLP1S/xWdAagL3LDdqylYbn+bB8kLn4o2B5U=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6myPOKV9BdAp2AJFp8+U6w4U7O88rt/6eLFC
 2H9CsbTcRiJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJluhAAooDSN8cfmZ6bpdIA7Eqa9WvqbqcOJoO
 xx5T08W5nwqhDCr9od4f4uvJODVFxNnXvfopExi19dP+Do8X0Nn7YGH+tg77QJDapdjUB5InQaZ
 ywnlChXN2I7TIYKpvrsEcwoKD19UXXXJhDiKHJ7Eemvft4AzAJw1I5e6cQOtzdHL1Jbj+Q3Iwr1
 RH23G7wj1et03101pnXVljuIgw9Zve0Q5feqtkuu/8o8jfeELfy3tC7PwMixReF4I/8x5mDWgdW
 e3V8eeyjCblTDYM3H/zcTHu3UwsSAT19Y2c99X2PgFanF1tFPr57lGl5Ynj38BDzZ9nbqeEspus
 rPqdSP+FLh04JcDiaOvB6ywR7UVSi10W5n1SOUlt1DV4rTyPjZnXOnHe1n3jQ0QUyj2CywW1b95
 wf2SiId1Eqraw529WcrbYUUWcO4+Dl3TPzQvNYH1j08yB+9eZhzTlFI2aI0bCrBynNWlU4aXa2x
 UALarQ75iXwXu1aph4p7WftLbdwBcws0ztfs5jKj1DfMEqqco19FHqKMhUvKuN/we8ju1Mlj5Gd
 BTD/b0rEIfh1dTWpzYk9py2FM233/CKVKwio+ow8GJPOAzUau0PD4exCvV3yJZmzmlRsliRPGYt
 3/r+mzoyLNYogzrjU5gxSWVDG0p0F9sUQ5YPWYioDuCwRRQdP41g=
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
index 000000000000..cfad0e0372f4
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
+        resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9a919e60254a..e01ef014c110 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3910,6 +3910,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index a8477e9b2a14..8824740468a3 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -104,4 +104,41 @@
 #define ZX297520V3_SRAM0_PCLK			38
 #define ZX297520V3_GSM_CFG_PCLK			39
 
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
index d79fa601afa6..303fbef12a42 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -39,4 +39,23 @@
 #define ZX297520V3_VOU_RESET			9
 #define ZX297520V3_LSP_RESET			10
 
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

