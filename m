Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95B13932FF
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 05:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734156; cv=none; b=X06F2m5OPa7Zo61DmeRHMYsQcn+xP1Wu/WrYJ1JaJHm6V57quJAumqznLoCVPMNwA/2LUV6LLcu4kpcVeLXq7JPfTAWsE06v4gwO4FSZDsbJqSYyYEmGPvWLGdGvLYn3JNfSFIzBosbKf1REAvIz/09QY4D94oSI4CbLuJzXNIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734156; c=relaxed/simple;
	bh=6ziM+f30xkSte3zlDzpBhj7lMZ8ieILh8cGDDWCvnhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LA97v0XalKhoHc311EP1WH97fEILkF78k7h9oq6YDvM6f7ZDOQReMGvyrKkFO/fcxyMH1eGDzYrUKO68v/vCKv48Hekqon9/PZiXqB5i64gmML+jplpJi3dDS19JPgrz4nGuCR7Xa7zdI9xtT+RMx4GQccaAe4t6iBgfsftXhyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPHjWEgi; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPHjWEgi"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-497d3e4460aso3200694b6e.1
        for <mfd@lists.linux.dev>; Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734151; x=1786338951; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9FeknYPclzv16XYXDkTzfHxoN/DCYzLCAYv6oC+ejo=;
        b=VPHjWEgiiLRJYJE2xhv3ovGySiPueX8vJt2KNfKMi7iHnvep++xlNRLsTHH1TWFOjK
         b6sgdHxUttTEl7oU/PajYc4YCrVFeoQdOLOBOBDQsZCc5Ir7w17sUbuosHB27jkdimoc
         Upqsl/oanKcHBGUKqsS7NN5F3hvjfR6/LoOxBOCOi7Bw1u60ZBPYRXhdCvOmJytd9D5w
         ixxEkUbEeflkNWDaAR1rTClUuUAtA6qWBllD4mUaVmAbV7i1YcXVlUZT7tl2UmMAWL/6
         kRJU7gdrdbeHTWA3VYq1RrKsRZGSKGAW63OOOAEKjYNheiD7r/2zHblsa/mUB+VM01Zv
         1exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734151; x=1786338951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9FeknYPclzv16XYXDkTzfHxoN/DCYzLCAYv6oC+ejo=;
        b=jerjrHWvMKyjv5BXgUn8sUvQSMo1f/QvSTh+hgv5JAH7DAKwQ4iPoupE2o/Pi458GE
         8rbSP8DJIpAcUdOXBwB7XHVHi2ND8B4ksAtmosTrPvjMIZSN6426uI7hJDywYQyEdHfI
         pkjkO5mnnWpEj2mwF0gaLOaN0n+DMwITt9cdHMMBTnJ6NPKrqyDtYAMhor6uyANEFcQL
         zqo82mLQj/zOATHo984T8L89Jh+0dR04MmzcwCnWuKS2lfiFWLe5DB5aiQ9KvxZQTyWi
         LV87eU8QZWUdCzyUXAV+9OhVI1ZIx7GtXiqpYc/cCAt0xT9yxeRxJrG01ZVh86lreEo5
         cv+w==
X-Forwarded-Encrypted: i=1; AHgh+RrfNLVeTkxTXqtY9sv06Lif7xCgfV4m08qWptk1/FFdwDtdQJGf/lCzPQgTHuRyKFZj+ME=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIVHMlTYyM9iIxOkLDhV/GZA8Gv9xZ8KBYzP5ZFO5lWVujOo7h
	9PBFPdUuANV7//fqQ/G9mY37+tR17pDNPFfA7dLImuJxXIXZkbb45MOZ
X-Gm-Gg: AR+sD12RKhVM8Rei7hJlDrqfQAquGDY0erk5EYh3UfsaZZJZBM3QhqjpvDksJSHuil+
	ysUGeoyCn5qPQX6IoYVliUPbnDZQl9UTT3yyf9I0/Sz46rVwRG+Z04kEzRioud/TSFLLtXLvleP
	YohaHgheahDRAW7BuhwM8fYetKRsuZWIAWJOHZPUTNTCaPzKjRPpLZtllziNSRmE1FLYRJB6Bmq
	lDfVvRucqWg8bYAMldhB0sCS4M/A6dxCKnNk+dEei83upQbyQLRIsHOTLFbZVVTfPtVRxw8EoFq
	FpylxrGl6hkAPK+lFr0V3130dZGoDzC3udBkvp0rmk+BucFJiyUOH3GdsXNhDb4eN0IFsJhXP8D
	/VdYzqEvdEMXD9fKXrv6o3JKDotumr8/2Fg2ykWFRERAQJ+NsCUgIdgxaGP9wYG27ynpxK0INPm
	Ru7nHfZkx6xatbMHbbVeNB6TT7J7v7uYV/lwp/50ZLrDrxlIsIAESkAlC4Pr2MiIVq4ml2EPKoo
	cq85ednkZ9Mgsgk92rh9BQqELQHyZrJgTMXVDIWV8pqJEsrB9/KxEAybun+IQQzaWfVdccsLqfC
	CG53uN8fAy1WIj6x7z7AF97JKjF/cw7obMgMNMhqiOKpC4xsqcd+C52/k3P09Oq0p/hKV5Nb+dv
	A/kkO88Cl7dlyLbJX
X-Received: by 2002:a05:6808:1797:b0:495:f697:92d9 with SMTP id 5614622812f47-4ae3188b02dmr15246163b6e.7.1785734151556;
        Sun, 02 Aug 2026 22:15:51 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:29 -0600
Subject: [PATCH 19/21] arm64: dts: allwinner: h6: add AC200 EPHY resources
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-19-0a53cd9e21cc@gmail.com>
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

Add the H6 I2C3 controller and pinmux, the PWM-derived 24 MHz AC200
clock, SID calibration cells, RMII pinmux, and the AC200 MFD and EPHY
control nodes.

Describe the co-packaged AC200 INTB output on PB20. Keep both reusable
AC200 nodes disabled so boards must explicitly enable the parent and its
EPHY control function when the companion is present.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 73 ++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 72ce1a75647b..55e6e185a4e5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -17,6 +17,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	ac200_pwm_clk: ac200-clock {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_pin>;
+		pwms = <&pwm 1 42 0>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -314,6 +324,15 @@ ths_calibration: thermal-sensor-calibration@14 {
 			cpu_speed_grade: cpu-speed-grade@1c {
 				reg = <0x1c 0x4>;
 			};
+
+			ephy_calibration: ethernet-phy-calibration@2c,0 {
+				reg = <0x2c 1>;
+				bits = <0 4>;
+			};
+
+			ac200_bandgap: bandgap@30 {
+				reg = <0x30 2>;
+			};
 		};
 
 		timer@3009000 {
@@ -368,6 +387,13 @@ ext_rgmii_pins: rgmii-pins {
 				drive-strength = <40>;
 			};
 
+			ext_rmii_pins: rmii-pins {
+				pins = "PA0", "PA1", "PA2", "PA3", "PA4",
+				       "PA5", "PA6", "PA7", "PA8", "PA9";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			hdmi_pins: hdmi-pins {
 				pins = "PH8", "PH9", "PH10";
 				function = "hdmi";
@@ -388,6 +414,12 @@ i2c2_pins: i2c2-pins {
 				function = "i2c2";
 			};
 
+			i2c3_pins: i2c3-pins {
+				pins = "PB17", "PB18";
+				function = "i2c3";
+				bias-pull-up;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2", "PF3",
 				       "PF4", "PF5";
@@ -414,6 +446,11 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			pwm1_pin: pwm1-pin {
+				pins = "PB19";
+				function = "pwm1";
+			};
+
 			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
 				pins = "PC0", "PC2", "PC3";
@@ -626,6 +663,42 @@ i2c2: i2c@5002800 {
 			#size-cells = <0>;
 		};
 
+		i2c3: i2c@5002c00 {
+			compatible = "allwinner,sun50i-h6-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x05002c00 0x400>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2C3>;
+			resets = <&ccu RST_BUS_I2C3>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c3_pins>;
+			clock-frequency = <400000>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ac200: mixed-signal@10 {
+				compatible = "x-powers,ac200";
+				reg = <0x10>;
+				clocks = <&ac200_pwm_clk>;
+				interrupt-parent = <&pio>;
+				interrupts = <1 20 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				nvmem-cells = <&ac200_bandgap>;
+				nvmem-cell-names = "bandgap";
+				status = "disabled";
+
+				ac200_ephy_ctl: ethernet-phy-control {
+					compatible = "x-powers,ac200-ephy-ctl";
+					nvmem-cells = <&ephy_calibration>;
+					nvmem-cell-names = "calibration";
+					phy-mode = "rmii";
+					status = "disabled";
+				};
+			};
+		};
+
 		spi0: spi@5010000 {
 			compatible = "allwinner,sun50i-h6-spi",
 				     "allwinner,sun8i-h3-spi";

-- 
2.53.0

