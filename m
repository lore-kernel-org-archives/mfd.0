Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B03C108E
	for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 20:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540104; cv=none; b=NN+0EhKhbSxEbtwjCop2JoGmoZmvZKHIXJoBBGY+SxX+WefjwBKx7UiCAohdD2kh+oUNyFAVFgPi0EajHeCViMEwUOxiQSyfYypAjXRA13DEhej3+0xtX+37JJl/Pc1BHqJXx5QDgew3IeruxRes+2By69iapVITytqR2I5F5Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540104; c=relaxed/simple;
	bh=nf0EyPFH35tSBIK5oZ5/jJ+smy+BLU/nT0Pmxgc+7L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaJ5v2GHUXRnUE57rgDBzaorxcI89mRdX6Vj0IB1VLq/mPKEv61A8wh+V4Z8eCmlmJGaHOvazaJYrtlVv5aPz+aEIc/6GFK6Z1nStAI83dGD4s4dG+E+wD+4S0BAr9j/u2EuIv2d8S/JEdRDN1AJSKXXdryey2UPd2NJnAbBzgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cv1XK2QG; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cv1XK2QG"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so1805023f8f.1
        for <mfd@lists.linux.dev>; Sun, 27 Sep 2026 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540099; x=1791144899; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=;
        b=cv1XK2QGkVOSZOmETnfTNILgyQoFyjAxP+HOaUrRnniNuyfaSTu5aIkbEU9/fK/WAI
         jo9Rr3UEU29k36dzWeAvW+tkIL84YpONwOt1S+ud2dVUlMRK2y8zlJB13xWUfUZBuHdp
         H42Zkbm2VH9rOn7w61ZCk4u0ttz8xUBinGV32YfL41Wdbxy8QYvtP+VMGljS4s4uK4S6
         /bYw+8LFwvCIoRyUf/omW587x7ehdblxmEVJ5P3orD66B0NJ0c97Hlh7f87Q0fzvUdmo
         OmSbIKk4S1en3MhXZlPuasUXio49pVh6Mz31GxAIXSIPyL1FgpfG31au9uELbNqkZ2kk
         sdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540099; x=1791144899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTauSR6H/8NKinLJSb31gMD112liycecOTxKay+MW1Y=;
        b=0bwTbeRseModhEC8F8bGRoggIg72fs2xx9gfQgo4a5Dm2BuD6VKKDCZ93Jh5rtHEKI
         zs3bSTbU9HBjGhPfuHG2NOHFzIh+3g2ljtPnkTMj44rtMlEu9CI6S4pAPb2nBvegvhz6
         Bv2+tqdMulKgeyOG1VsdsHDf5A7L00vBP2mvFkjI7MSH7x5s2FxlS1pEPKwBviEcyUrO
         IqkQ2mf6yKi7rCfzHqz4csqzGmwWtR3O8Bxh7UoNZgqo4OoFiGwQxJG94XW74uqB9zPi
         eOq4PNepunB60rkKXNnCi3UYK2fyD4ElHCNMi7fc3CQ7C97CmhGsxXktiEJLadOiCjCr
         SCKw==
X-Forwarded-Encrypted: i=1; AKwUvBxIu78+5dgM5v6vBd2xTLZDbPM9m5EuLli2RIZuq79cLa/dpewmMYT34ICFs7ft60Kl7jM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLdWdgAVB68U7D3Xoy6DUm0GkPgi5GPM7jUypgU+Eqr6hmsI/QU
	SZDGNGTkX/0jeTKbmjUhwgSsYz8zuOKKGvItytEN2D8fzsf9A7l49Dpg
X-Gm-Gg: AYBFou2gq8fv3riUBspvPLZFQMjWKl2V+uBiIjRNawySwtJMTYWRD7NAqegjM9OHEyh
	ylWIkCxQC2jGKVqCswykEhsiTJ9bO2JCsekKb275NHXXg6y/Y4RFtsAAv3uydssHPmiryAZwG3G
	N/cBZrvEAUDyN/nNBozJTuJJ+FKMTKZDdE29CjGaxVQLhzcAsXUXWZio+fAwySJlTm7OBKutQxp
	6dpPpeHLkLfmRf6lwVk4vyRxdnkKFbuPpctIN3LyXYR35LL2GK4bkYm77Q61cDYKumkQWRDU4xT
	vszT3qs1MXL72zYIBjCACB6W89jklTTrHjcdFxUwHoHJX0bxhT8X7GgX3Y7W2Z303aq9GW11fTT
	9AewTztKN12n8awz7iZdO+j4kG74r22AP0kL78dc2W5gI772UtDc+wMiap9hXbbV3UBigZ5qwsH
	qL3QFoGf+QySBIAgsKx3deNEkGZLdVzLLuO1CN6yTVmEJDe0QujxViNKHcGBcZJIsSYHzP/r2E2
	0BYMzOl
X-Received: by 2002:a05:6000:2893:b0:487:10a9:57cb with SMTP id ffacd0b85a97d-488719756c5mr18798018f8f.49.1790540099202;
        Sun, 27 Sep 2026 13:14:59 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:58 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:41 +0300
Subject: [PATCH v13 13/13] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-13-70d8f673386c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5992;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=nf0EyPFH35tSBIK5oZ5/jJ+smy+BLU/nT0Pmxgc+7L8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj1qMOhF4nhM5GAH4C4zIE2KCnpV3p7yPYxy
 HsWLuBVq++JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJNaRAAi92rO1TFDPk6AfkbezqImo7QQMmSE6G
 xzjgXmYfqzaDzA2JJ2MEt5ITYiH4sslWTHYOvxV8iBS0oaH8J4O5H6+xcPniz3W+snQvwwuz+Yt
 lJqDvK1FyY3Hw/TjoVzVYp+dI1DBj7J9iWFfcy62abwG2+FdE4877GYT88X4gM8LqUZ6goT9y4c
 SFMG3ERQS+PZeBNqDTU3xVZlm46MD6LGvThLvfsEOu6Lr/NKGn5Q4lufzGqnegL5evrbyBrVQWy
 Ggro6IegTW6hARhscDuM5zFxFCeX44v7fJwUFLf/MWk2Q7DVUbkhxtpyyqWWYnCuswA0jilu3XW
 Gh5vHFd1V9VnC7/l9vWCi56t7nnoQpKSfnYoR2q3EeJ1pn4+kO20uIWoy/q044FLzTrLsuM/Jc2
 +oLuGv/kJ0UWvzASZhsQkA9UFeDQ5JIRbKOj2/fFHtMjGAiHztjkrdV/n/UpThoNPHsEG38+Pg/
 SkknToYjaa9dUutBVehuE35RlMFKpxXyUHlvaCqLszJ+p3hC4kj3827Hs13LMFJa+QfqkLLcrjG
 0NcahDzzscsP7c/wSY9/uiLJtg8PsXGjzck854E9fxdxsZvKWAVQQ4GWnQYzi5kVWqlj2ZX4w1c
 l/+S4y5w44rxz8Nd4u4tem251TqfpZuBDEvKzJOadl8pAcn1W8jk=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This patch adds DT nodes for the main clock and reset controllers on the
zx297520v3 board. It replaces the temporary placeholder UART clocks with
the proper clocks exported by topcrm and lspcrm.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.55.0

