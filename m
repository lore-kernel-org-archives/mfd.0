Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF2038F624
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734141; cv=none; b=sNOMip9YKwFaA/lHzq/woV1nu+or8QYun+F45F8vyXQj8bzc/BunWAs4rYBmqtSqO7NheCtPQks8u8cv7PxubkPVTcTThs52o8CUVgwEF1qUXufuifH/QJ4wDKVVTRjCn16a7cTm2pMG4gd832G58Yn2rUmByQ9mhjPiOfhHho0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734141; c=relaxed/simple;
	bh=zKmrq4Io78YBlcSoFkA6zgzyWtU0hC2kx2tv6Vt1nvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLgcKGP2IgwbHu3dq7vwLLPvRK9ZYUNplh0XPoNqkj1lP6nCd9ne8lyIY7qLcPeIgPcvYPAh7cMs1lbRHVDRMyW9G6Kb/RDyXum6eigpsN/eHZUefeteXIyZ2xCuAFMIFsdj/ptHa26hbldfb85XjchG/g3bpsfNJ0xEIbRWZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd1xCJL7; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd1xCJL7"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso2864790a34.0
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734129; x=1786338929; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gb4LPnphqc1DtduXOsyl640sXOpfiOxS2LbjD6EtoY4=;
        b=Zd1xCJL7pDGyVFg8h05T4NXUxBp5bH9d6iKOJHgmej5t8kYMJo9i5D2nMZXQflKvC6
         hlwZ8J1BeXMVElDf/GQXExptEqY88DSmu1OdmpgPu45t12e4ijo5O081N/u/v5/UlJ06
         2ZxIBfDQa9nkPaOJ1927Zv29EJxFJgR9OlsvaGqTxKgE/+aZfLMEbnee8rPl9ia2AXIK
         /TqUBJ+IAE/aILsPTWQwT+Ynu8tSNSvvEXzdGvUtA/yEICFSjLIHNqLSazADy/iEwk0Q
         Hjt8pYHzkvqqyoEUV+u30BWE+vifti4VI2WRsXy/XeUL1GW4YJq/oETOK3WyEpNgxSP4
         GxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734129; x=1786338929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gb4LPnphqc1DtduXOsyl640sXOpfiOxS2LbjD6EtoY4=;
        b=g20gA+6MjgMPLUgs/dLsxHE8oqqYsf6SiaQ+ZV3F7vNQHeL2k8zY2U8v0xyqrKlSc2
         MoZ0roTWdaHiZpkvC3pAiK+zAf7qlTFfVnu2QWHdLwnpQuOcfjqlUiA2XyrNDbAKIpf2
         U6q0H5EL0lrxkaKQyr2Jya5d/HnqkNd44xcX2Zczs4Npn1cI6ZmhscqSrxYkvTeUDEag
         KsvcyMBa3TXUNE7tlloLmXU9oiVItQriEWQ/D1kC8/7Phs/u0pr0WG4xvbrjkPIffae5
         qxt6OYoH99TUPenzlBLDtP2Ui+bfjWpN2zPc2Vi+Akez/kDkt2lg1yzK0OP8o/gUTHgT
         jwUg==
X-Forwarded-Encrypted: i=1; AHgh+RoQmL9kuCpnQY1EQurLneA4t/GA72IgDg5BVUQHeUo2Xle3JPpjGfBFjNn+olNVNDhDkEw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZeZpEV8si5x+owDpIRnTw/7P3RITRmveNJyahPrjH+SDzoUaj
	MGxiett1S+lRTwT6NK9NaqxxHUjkyekRFgzd9yZXgFv4nHR4J53ILlmF
X-Gm-Gg: AR+sD10TcwYSj9XocNrF70ak1XNwyvcSHsR78tOKBBrrFYuJHFiTDBv7fOMYLGKwpt+
	mo7ZBZljGb1+0sLidaXBwOWvVmOzq2boVQyRVdVeLO7uiGrNsirfwUjAVkyO02xZeq0XxqE8JyX
	xTlAIiLoXtDYgPKrD5O+DWE8mmFn9brbuLhvZ+5kKT0WPObqjzTs1Bi0XMXwzEYe3gXDnsuTScK
	0pGVBDdMOM2Anq99wOxBqWC8jsNGyU55aiL/aMy7Q4nBF4wAFWY4MBpp7dNV9fcMFjrq5Im6ub1
	+RJJIPExvjEIClZQUELv4UORAvFQ2qrWeOdTcG3i3cYwyYs0vQiyeUFZMhbnuV2vdVakKaFp9Cl
	9YPNUFS3MpjVY8Q5Dia9gh4CAqFbpGg5U681hTT5o6e7rZ7G19rQo5e7LkD2lOVcue+9iVor78L
	mztzR5TvuKepp97hYILpLF5EEU0BGw8TzOepCqfaBcQCMwSTgFernDeUy79KZT4bjYIcxIzzeKm
	gcAHQUqx2r9nnAK0G0AD+3TCRb46EWDzOIH3WyJfUgL5SOpI8jjtRzYD1g8kaMfX6L63A79hKWQ
	YvCVV1BPmnoEa7hb9omyKIKR7+vnKp6c1uhrhWlcX0ZgfRBj1b1xv4DCF9WB51FnzAXRzsP11W8
	1rUMY7XJlDznR2feSnibkaLt3CQ==
X-Received: by 2002:a05:6830:7086:10b0:7db:a297:9e62 with SMTP id 46e09a7af769-7f1892c8017mr4283606a34.8.1785734124209;
        Sun, 02 Aug 2026 22:15:24 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:13 -0600
Subject: [PATCH 03/21] arm64: dts: allwinner: h616: add EMAC1 controller
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-3-0a53cd9e21cc@gmail.com>
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

From: Richard Genoud <richard.genoud@bootlin.com>

The H616 has a secondary EMAC controller that supports only RMII at
10/100 Mbps. It connects through PA0-PA9 to an EPHY in a companion
AC200 or AC300 package.

Add the EMAC1 controller and RMII pin group. Leave the controller
disabled for boards to enable when the companion Ethernet hardware
is present.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 90fe56a1d3cd..6879f27c2b2b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -432,6 +432,14 @@ pwm5_pin: pwm5-pin {
 				function = "pwm5";
 			};
 
+			/omit-if-no-ref/
+			rmii_emac1_pins: rmii-emac1-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+					"PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac1";
+				drive-strength = <40>;
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC4";
@@ -789,6 +797,28 @@ mdio0: mdio {
 			};
 		};
 
+		emac1: ethernet@5030000 {
+			compatible = "allwinner,sun50i-h616-emac1";
+			reg = <0x05030000 0x10000>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&ccu CLK_BUS_EMAC1>;
+			clock-names = "stmmaceth";
+			resets = <&ccu RST_BUS_EMAC1>;
+			reset-names = "stmmaceth";
+			syscon = <&syscon>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&rmii_emac1_pins>;
+			phy-mode = "rmii";
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		gpadc: adc@5070000 {
 			compatible = "allwinner,sun50i-h616-gpadc",
 				     "allwinner,sun20i-d1-gpadc";

-- 
2.53.0

