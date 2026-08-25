Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EAA3DFC82
	for <mfd@lists.linux.dev>; Tue, 25 Aug 2026 21:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693091; cv=none; b=cNBaB3yUTA1vY237B6Z7RpaJ7adwMk2o5UpeEBy1eIXvDJfv0xAjByH8EjWVqxAeRLuFKp0tzz1BY0J78y/SYLLk2zrR79TEd5mvt46gJ2x9CKTwn3Y+R5xdX9sLSigcUQ84zJ4V2DA8DZx+NeUpRi2ycWub3rufDylRAShxnfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693091; c=relaxed/simple;
	bh=E5Alc+/mDwMOmQLSCpdE0r7HEmxSfA7wEQRrzpumkfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fLoosFlBHaxnfT7d4naXJ7WAfHA/z3YToOVEAQVJt4ljgomvJxcvLpch4T1jxwOwAEwnzFa30kz/hKjr0eMjXMtxUXWGpX/1IlmACQ+Aqqxf22fxW42W0sbT7LG3aX/4nrKcaD0LM77i83Ioq/rWcBBuFVIk69c1P2R1DuWjWiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCliB2mA; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCliB2mA"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1670dad7a8so27741566b.3
        for <mfd@lists.linux.dev>; Tue, 25 Aug 2026 14:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693088; x=1788297888; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54y23mxK+nUslXjeRLc03HJMUkg572iXQMInlkBYXW8=;
        b=CCliB2mA9iOlwEZgt+rFGdCtIg8/V5RmsqTXpa386WiKd9T/8ewtbyHfXX9fqc4iCX
         GrkCHdsfWccXpvwkn5OUTxWd+Z6zJydScXoyCPvz69+s1tNL+U9HeWOxIRQGUHOqWI6S
         eYbGkUeDsuHeC5ym1y4O82Nb7/x/yEq6bg/71d+xt/P/vRamyAT69awN1PFanlq5hoDD
         9+T18/La9eqQtd/Tqfhq1NzFNgfLjIyWy0fVv5avZxYg7faMIXYSbXuYp7Z/5Vko/ggz
         YyIS7qiTcbxWLC/REuvHzxK5p+cZJLfM6tLsl4A/6aUhz2S5Q4h6qoHae31M6mUeoDiF
         x0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693088; x=1788297888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54y23mxK+nUslXjeRLc03HJMUkg572iXQMInlkBYXW8=;
        b=ASqWxuxmfKXhPci/FlnHNOF0rFpV4Ij05tnHlUSddlcHAvfT6cmOk7zW1xyhdG72iV
         x0PWkqerT//1ZUrNcZomTSqSfQy1JpUZH3aB8es1FC0TrrWRccCNg1V+/FybxbnrjqjC
         Si6+BQYFvELYwlvKl/WhXuImSCx+yZSW9VbZQImaGaf8A2lFgZOuT5or6sSZZs7Z/QEL
         7PMUviqv7JOXlNi0Qt5ouoHnywwrjZLzf/GSACP+xYNPld/Dh2AwSHQRGyBWjWeYufn0
         HLgsPytNUTh3DqjJmK8d5Uu6BPAWxsx2uXAhH7vI9DmN00pC8/7/phqkbva/0QZwjBpO
         Nx1A==
X-Forwarded-Encrypted: i=1; AHgh+RqcSVCDHvLRAwjNvmlNjIe+KWhZGxbf42P+O69Z+BCP+tiU2q92HWkIIos9t2G3SJrhYt8=@lists.linux.dev
X-Gm-Message-State: AFuF++kRPbKfsInvOJ2jdiGneYicGhoJuNxJcBW0bTXz1H/GKoFkhADU
	+fB/bt7m4HQiJ1vLnpQaumZ7LzqtKphIV8Akg/C5b3QAsiWrOSDfrOnm
X-Gm-Gg: AR+sD13iU59a/JYcK0cSwiuTPVtbolhTNwFbQiVL8Jmu1AW9Wq3a+kk3Hj7VnY8t+GR
	Wo/sso9Eg777vh29OKXf2hfCKleen86jc8r0zv9ZgLdoH6htuYwQt0Xg+e7b3h+vqW7R5Sl66Fz
	eke3hvHVOPa5vfWJ1LwkzEg+usPmoElrMTo4VjE69VAr3Wl+nnGulc5eL4bkwN0kn75dv7x/lgl
	OWTffG2KVdLML53lZ406S1IXeR8UZ+tepMQzPUn6i2HLrwiQa4Rk91wUYTxr2CwQYsQTR4x1sy9
	P8vdAakYFOKgCz733TXmus891duTRBOV9e45FYTp0+QrBff6NnkE+5YBHQDozN/N3ym/Cb57tgH
	m3mk9UodAhoipLOU9DU5gy7YLyg/JFzb20eHRhcfqOXyK1kWbSfVrm9lp5/VM5FjwAmgtWsqyUW
	lDYi5A9ZrbrJd2QeYBsXSrGZTwmUHDtAOVTQ7cIiTVgqZSy3i8+8JkSoUC4YPrKt3nm0WlTQ==
X-Received: by 2002:a17:906:eecb:b0:c24:82b9:361c with SMTP id a640c23a62f3a-c250c3935b3mr149671566b.17.1787693087893;
        Tue, 25 Aug 2026 14:24:47 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:24:47 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:03 +0300
Subject: [PATCH v11 04/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-4-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5921;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=E5Alc+/mDwMOmQLSCpdE0r7HEmxSfA7wEQRrzpumkfg=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggCSgDFlwAO6v+aca7cDP/I7mCJB9DfA7Arv
 191naDiv8yJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLg6g//b0A9aN1Xnffa964EHOu7z9yng9YDKmt
 EKXY2SKL848HxXgX+VfcYidDnUYFHrcr1rWbaKVgqdZjQSorMrpsrSlK7FXj8ibsp+SZ9hWPDy2
 3Un0eK5ukH6A7UQosYWIaVodr+UhuXMJDNHGtp4qmwN7Cq3BtAWeaEiWkmmgsiwdzoutoK88Qdd
 Ubc293wZKpwn03xr1No2aOjGMIuN2ckTcLaBuvmbeq6SRMl/pOcKBg5iFSNcdKRVjS55Ahu54Cr
 fYHzbZb14Vfy8iUtopbitSYhJJAhT5rqPsRSSsXpxY/cnk7+k26vKFxgL5zf3EZlnp92So7X4Ho
 9+cQ2TgU7KJXOEBA8MkoTMLQKZQduMtJU/NKijqWJ6K3ZbLBbVOtncevR2jzCicemBktXCdNzg+
 /o8TCvz7Rj3CK/1BRHhfgAl6MLs9CijyiJRUmDV8APOPPHEY1IY5gPa8AY175Na1YYMCUtwLXku
 caz8lPlDCbyao/vRpEYUo9plKGTwS9Hn6jb26d3a1b1nL/obvuUX/3IRzQ3H+dT/cv8r3KDrIFE
 AdHSjkyy7ok2RAzrEXbpJXDXjncIvph176AUPWs7/WCX2FjNlQhc2CLu+xarYDqeHpXQHi6vowJ
 cEYt3JtzrFYI7FHCPcOl3sKf22cZT75+gLFjd69COHyiE+MPSQcc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This patch adds DT nodes for the main clock and reset controllers on the
zx297520v3 board. It replaces the temporary placeholder UART clocks with
the proper clocks exported by topcrm and lspcrm.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 11: Improved the above the line commit description, removing
references to "previous patches" that won't make sense when reading it
in the kernel commit log.

Version 10: Fix issues with dt-check-style --mode=strict in newly added
code, but left issues in existing nodes alone.

Version 9:
Sort new nodes by mmio address
rename syscon-reboot to "reboot"
adjust to changes in bindings

Version 7:
Add phy nodes to topcrm
Remove syscon from matrixclk again
Adapt remove now-removed extra clk inputs from matrix
Add reset to LSP
osc26m -> clock-26m for the fixed rate clocks, likewise for 32k

Version 6:
Add syscon to matrixclk

Version 5:
Re-name from *clk to *crm
Add the syscon-reboot node here because the binding requires it
Re-add accidentally dropped uart2 IRQ
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 101 ++++++++++++++++++++++++++++++----
 1 file changed, 89 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index a16c30a164bb..ebac3cd137df 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -3,12 +3,26 @@
  * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	osc26m: clock-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	osc32k: clock-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -20,15 +34,6 @@ cpu@0 {
 		};
 	};
 
-	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
-	 * been added.
-	 */
-	uartclk: uartclk-26000000 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
-		clock-frequency = <26000000>;
-	};
-
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
@@ -75,18 +80,87 @@ uart0: serial@131000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x00131000 0x1000>;
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&topcrm ZX297520V3_UART0_WCLK>,
+				 <&topcrm ZX297520V3_UART0_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&topcrm ZX297520V3_UART0_RESET>;
+
 			status = "disabled";
 		};
 
+		topcrm: clock-controller@13b000 {
+			compatible = "zte,zx297520v3-topcrm", "syscon";
+			reg = <0x0013b000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>;
+			clock-names = "osc26m", "osc32k";
+			interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "usb-up", "usb-down",
+					  "hsic-up", "hsic-down";
+			#phy-cells = <1>;
+			#reset-cells = <1>;
+
+			reboot {
+				compatible = "syscon-reboot";
+				mask = <0x1>;
+				offset = <0x0>;
+				value = <0x1>;
+			};
+		};
+
+		matrixcrm: clock-controller@1306000 {
+			compatible = "zte,zx297520v3-matrixcrm";
+			reg = <0x01306000 0x400>;
+			#clock-cells = <1>;
+			clocks = <&osc26m>, <&osc32k>,
+				 <&topcrm ZX297520V3_AHB_PCLK>,
+				 <&topcrm ZX297520V3_MPLL>,
+				 <&topcrm ZX297520V3_MPLL_D5>,
+				 <&topcrm ZX297520V3_DPLL>,
+				 <&topcrm ZX297520V3_GPLL>,
+				 <&topcrm ZX297520V3_GPLL_D2>,
+				 <&topcrm ZX297520V3_GATED_OSC26M>;
+			clock-names = "osc26m", "osc32k", "ahb", "mpll",
+				      "mpll-d5", "dpll", "gpll", "gpll-d2",
+				      "wclk-osc26m";
+			#hwlock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		lspcrm: clock-controller@1400000 {
+			compatible = "zte,zx297520v3-lspcrm";
+			reg = <0x01400000 0x100>;
+			#clock-cells = <1>;
+			clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_PCLK>,
+				 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+				 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+			clock-names = "mpll-d5", "mpll-d4", "mpll-d6",
+				      "mpll-d8", "mpll-d12", "osc26m", "osc32k",
+				      "pclk", "tdm-wclk", "dpll-d4";
+			#reset-cells = <1>;
+			resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+		};
+
 		uart1: serial@1408000 {
 			compatible = "arm,pl011", "arm,primecell";
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x01408000 0x1000>;
 			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART1_WCLK>,
+				 <&lspcrm ZX297520V3_UART1_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART1_RESET>;
+
 			status = "disabled";
 		};
 
@@ -95,8 +169,11 @@ uart2: serial@140d000 {
 			arm,primecell-periphid = <0x0018c011>;
 			reg = <0x0140d000 0x1000>;
 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&uartclk>, <&uartclk>;
+			clocks = <&lspcrm ZX297520V3_UART2_WCLK>,
+				 <&lspcrm ZX297520V3_UART2_PCLK>;
 			clock-names = "uartclk", "apb_pclk";
+			resets = <&lspcrm ZX297520V3_UART2_RESET>;
+
 			status = "disabled";
 		};
 	};

-- 
2.54.0

