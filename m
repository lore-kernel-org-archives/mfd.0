Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0083033E1;
	Sun, 30 Aug 2026 22:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129879; cv=none; b=m2QNUiPXc/KDppTSuZ4BcqQqcPJCl0ptkm3sqiXgiEzNvOaGDW5Z64QB2Ga8SFLYWXjLT5AwvwBnyg0eo65a5sPHWtcfBwkojx2bRT1nPzOS51T/WPpJgCYoSHX3qrt4zisJ2oEuRAqad4o/ap+YNfh9ty0FmYI6emTiVAC9rwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129879; c=relaxed/simple;
	bh=JryOiEbDzjGkpKQsJhdc2Og6jbsvxynfrtweT+M+zlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RN+P5HX5nUE2HsNEJX+5RINrKbDaKjOac/s43X+j3xDhrQT+EUM7R4nwUsnM8NzLC+qUNk8S9bpCsetFloxJigWxVuqLqYfnEDuo3JHq9JIY9E81ItG//+KgrnNUOc/lvckzo6aeBd6mVtoMK0LfCzNh2Nk7qSaYVU7G/SLC6es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3xmmZxY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3xmmZxY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918091F000E9;
	Sun, 30 Aug 2026 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788129877;
	bh=lqUJ7yXibnDWhTxCkUtu5G3bEUrxwvcFaHTvLIYE0lo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=e3xmmZxY0ZVRhg20EiHHgX9URHnvDUqAhbYCy7YwTJb38nnld7xakMP/qRUrR1r6p
	 Oky3m2wB2BYqwhHWPbhDRdEYTlboDTwx/NcWpfrI8JLnYlC6fB0AP3RR8+TbBezufY
	 +eiNeMw8/3i0ppvaJkAna1m4kqJEFuPuooPEFt7KFnYNJ47yagiMJm0qFXw8NKnIIp
	 khRJL1L3SZlPNnpmVzyJaRvvrHC4XEwZM/S8VtbIp/V6Dd7rNxKc64hFpqunLeRdFH
	 WtD+Jc3LOY3SVHeK91LPGVsoT6uWwZpRmhuhb7Y6SfBOTnxZ8faobGBA3rAgYWYK3l
	 S8QNgbQsnJu1g==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 00:43:42 +0200
Subject: [PATCH 13/13] ARM: dts: ux500: Fix up regulator assignments
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ux500-dts-snowball-regulator-v1-13-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Several Ux500 device trees use DB8500 power-domain regulator nodes for
supplies which actually come from buck converters in the AB8500 or
AB8505 PMIC.

Assign AB8500 consumers to VSMPS2 and VAPE and AB8505 consumers to the
native VSMPSB and VSMPSC nodes. Use the common 1.8 V I/O label throughout
the reusable HREF board descriptions shared by both PMIC variants.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ab8500.dtsi              |  4 ++--
 arch/arm/boot/dts/st/ste-ab8505.dtsi              |  4 ++--
 arch/arm/boot/dts/st/ste-href-stuib.dtsi          |  8 ++++----
 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi  | 14 +++++++-------
 arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi  | 10 +++++-----
 arch/arm/boot/dts/st/ste-href.dtsi                |  2 +-
 arch/arm/boot/dts/st/ste-snowball.dts             | 10 +++++-----
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts |  4 ++--
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts |  2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts   |  4 ++--
 arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts |  4 ++--
 11 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-ab8500.dtsi b/arch/arm/boot/dts/st/ste-ab8500.dtsi
index fc9b613547f4..b3df86c33ff5 100644
--- a/arch/arm/boot/dts/st/ste-ab8500.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8500.dtsi
@@ -228,8 +228,8 @@ ab8500_usb: phy {
 							  "USB_ADP_PROBE_PLUG",
 							  "USB_ADP_PROBE_UNPLUG";
 					vddulpivio18-supply = <&ab8500_ldo_intcore_reg>;
-					v-ape-supply = <&db8500_vape_reg>;
-					musb_1v8-supply = <&db8500_vsmps2_reg>;
+					v-ape-supply = <&ab8500_buck_vape>;
+					musb_1v8-supply = <&ab8500_buck_vsmps2>;
 					clocks = <&prcmu_clk PRCMU_SYSCLK>;
 					clock-names = "sysclk";
 					#phy-cells = <0>;
diff --git a/arch/arm/boot/dts/st/ste-ab8505.dtsi b/arch/arm/boot/dts/st/ste-ab8505.dtsi
index eb25a3f366a4..bace009cc0af 100644
--- a/arch/arm/boot/dts/st/ste-ab8505.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8505.dtsi
@@ -196,8 +196,8 @@ ab8500_usb: phy {
 							  "USB_ADP_PROBE_PLUG",
 							  "USB_ADP_PROBE_UNPLUG";
 					vddulpivio18-supply = <&ab8500_ldo_intcore_reg>;
-					v-ape-supply = <&db8500_vape_reg>;
-					musb_1v8-supply = <&db8500_vsmps2_reg>;
+					v-ape-supply = <&ab8505_buck_vsmpsc>;
+					musb_1v8-supply = <&ab8505_buck_vsmpsb>;
 					clocks = <&prcmu_clk PRCMU_SYSCLK>;
 					clock-names = "sysclk";
 					#phy-cells = <0>;
diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index 79c2be36acae..729e7e1fbfa7 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -35,8 +35,8 @@ stmpe1601: port-expander@40 {
 				reg = <0x40>;
 				interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
 				interrupt-parent = <&gpio6>;
-				vcc-supply = <&db8500_vsmps2_reg>;
-				vio-supply = <&db8500_vsmps2_reg>;
+				vcc-supply = <&buck_vio18>;
+				vio-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&stmpe_stuib_mode>;
 
@@ -80,7 +80,7 @@ lis331dl@1c {
 				st,drdy-int-pin = <1>;
 				reg = <0x1c>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&accel_stuib_mode>;
 				interrupt-parent = <&gpio2>;
@@ -92,7 +92,7 @@ ak8974@f {
 				compatible = "asahi-kasei,ak8974";
 				reg = <0x0f>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&magneto_stuib_mode>;
 				interrupt-parent = <&gpio1>;
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
index 7448135e25f6..391e69769941 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi
@@ -90,7 +90,7 @@ accelerometer@18 {
 				drive-open-drain;
 				reg = <0x18>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&accel_tvk_mode>;
 				/*
@@ -113,7 +113,7 @@ magnetometer@1e {
 				compatible = "st,lsm303dlh-magn";
 				reg = <0x1e>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 				/*
 				 * These interrupts cannot be used: the other component
 				 * ST-Micro L3D4200D gyro that is connected to the same lines
@@ -132,7 +132,7 @@ accelerometer@1c {
 				st,drdy-int-pin = <1>;
 				reg = <0x1c>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&accel_tvk_mode>;
 				interrupt-parent = <&gpio2>;
@@ -148,7 +148,7 @@ magnetometer@f {
 				compatible = "asahi-kasei,ak8974";
 				reg = <0x0f>;
 				avdd-supply = <&ab8500_ldo_aux1_reg>;
-				dvdd-supply = <&db8500_vsmps2_reg>;
+				dvdd-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&gyro_magn_tvk_mode>;
 				/*
@@ -169,7 +169,7 @@ gyroscope@68 {
 				st,drdy-int-pin = <2>;
 				reg = <0x68>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&gyro_magn_tvk_mode>;
 				interrupts-extended =
@@ -181,7 +181,7 @@ pressure@5c {
 				compatible = "st,lps001wp-press";
 				reg = <0x5c>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 			};
 		};
 		i2c@80110000 {
@@ -192,7 +192,7 @@ synaptics@4b {
 				#size-cells = <0>;
 				reg = <0x4b>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vio-supply = <&db8500_vsmps2_reg>;
+				vio-supply = <&buck_vio18>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&synaptics_tvk_mode>;
 				interrupt-parent = <&gpio2>;
diff --git a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
index 00ce9d79f540..c5acb60c15c9 100644
--- a/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-tvk1281618-r3.dtsi
@@ -83,7 +83,7 @@ accelerometer@19 {
 				st,drdy-int-pin = <1>;
 				reg = <0x19>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 				interrupt-parent = <&gpio2>;
 				interrupts = <18 IRQ_TYPE_EDGE_RISING>,
 					     <19 IRQ_TYPE_EDGE_RISING>;
@@ -97,7 +97,7 @@ magnetometer@1e {
 				compatible = "st,lsm303dlm-magn";
 				reg = <0x1e>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 				// This interrupt is not properly working with the driver
 				// interrupt-parent = <&gpio1>;
 				// interrupts = <0 IRQ_TYPE_EDGE_RISING>;
@@ -109,14 +109,14 @@ gyroscope@68 {
 				compatible = "st,l3g4200d-gyro";
 				reg = <0x68>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 			};
 			pressure@5c {
 				/* Barometer/pressure sensor */
 				compatible = "st,lps001wp-press";
 				reg = <0x5c>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&buck_vio18>;
 			};
 		};
 
@@ -139,7 +139,7 @@ touchscreen@0 {
 				interrupt-parent = <&gpio2>;
 				interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
 				vcpin-supply = <&ab8500_ldo_aux1_reg>;
-				vdd-supply = <&db8500_vsmps2_reg>;
+				vdd-supply = <&buck_vio18>;
 				reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
 				touchscreen-size-x = <480>;
 				touchscreen-size-y = <854>;
diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index a85d87665610..3150e1d2f656 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -196,7 +196,7 @@ mmc@80005000 {
 			non-removable;
 			no-sdio;
 			no-sd;
-			vmmc-supply = <&db8500_vsmps2_reg>;
+			vmmc-supply = <&buck_vio18>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&mc2_a_1_default>;
 			pinctrl-1 = <&mc2_a_1_sleep>;
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 14ed1079ff6c..1607bfbd9f56 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -208,7 +208,7 @@ ethernet@0 {
 				interrupts = <12 IRQ_TYPE_EDGE_RISING>;
 				interrupt-parent = <&gpio4>;
 				vdd33a-supply = <&en_3v3_reg>;
-				vddvario-supply = <&db8500_vape_reg>;
+				vddvario-supply = <&ab8500_buck_vsmps2>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&eth_snowball_mode>;
 
@@ -354,7 +354,7 @@ lsm303dlh@18 {
 				st,drdy-int-pin = <1>;
 				reg = <0x18>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&ab8500_buck_vsmps2>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&accel_snowball_mode>;
 				interrupt-parent = <&gpio5>;
@@ -366,7 +366,7 @@ lsm303dlh@1e {
 				compatible = "st,lsm303dlh-magn";
 				reg = <0x1e>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&ab8500_buck_vsmps2>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&magneto_snowball_mode>;
 				interrupt-parent = <&gpio5>;
@@ -378,7 +378,7 @@ l3g4200d@68 {
 				st,drdy-int-pin = <2>;
 				reg = <0x68>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&ab8500_buck_vsmps2>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&gyro_snowball_mode>;
 				interrupt-parent = <&gpio5>;
@@ -390,7 +390,7 @@ lsp001wm@5c {
 				compatible = "st,lps001wp-press";
 				reg = <0x5c>;
 				vdd-supply = <&ab8500_ldo_aux1_reg>;
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&ab8500_buck_vsmps2>;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
index 9f58a3c2d06d..bda5d1f76215 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts
@@ -451,7 +451,7 @@ mmc@80005000 {
 			no-sdio;
 			no-sd;
 			vmmc-supply = <&ldo_3v3_reg>;
-			vqmmc-supply = <&db8500_vsmps2_reg>;
+			vqmmc-supply = <&ab8500_buck_vsmps2>;
 			pinctrl-names = "default", "sleep";
 			/*
 			 * This muxing excludes the feedback clock on GPIO130
@@ -503,7 +503,7 @@ gnss {
 				/* GPS_ON_OFF on GPIO86 */
 				enable-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
 				/* GPS_1V8 (VSMPS2) */
-				vddio-supply = <&db8500_vsmps2_reg>;
+				vddio-supply = <&ab8500_buck_vsmps2>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&bcm4751_codina_default>;
 			};
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
index 18fb7263058e..d270f3782f00 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts
@@ -512,7 +512,7 @@ gnss {
 				/* GPS_ON_OFF on GPIO96 */
 				sirf,onoff-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
 				/* GPS_1V8 (VSMPS2) */
-				vcc-supply = <&db8500_vsmps2_reg>;
+				vcc-supply = <&ab8500_buck_vsmps2>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&gsd4t_janice_default>;
 				/* According to /etc/sirfgps.conf */
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
index c34d43a2b750..b06f7145514f 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts
@@ -323,8 +323,8 @@ gnss {
 				reset-gpios = <&gpio0 21 GPIO_ACTIVE_LOW>;
 				/* GPS_ON_OFF on GPIO86 */
 				sirf,onoff-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
-				/* GPS_1V8 (VSMPS2) */
-				vcc-supply = <&db8500_vsmps2_reg>;
+				/* GPS_1V8 (VSMPSB) */
+				vcc-supply = <&ab8505_buck_vsmpsb>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&g05ta03_kyle_default>;
 				/* According to /etc/sirfgps.conf */
diff --git a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
index 7bf4287f6e13..59de7ecbfeb7 100644
--- a/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
+++ b/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts
@@ -303,8 +303,8 @@ gnss {
 				reset-gpios = <&gpio6 17 GPIO_ACTIVE_LOW>;
 				/* GPS_ON_OFF on GPIO86 */
 				sirf,onoff-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
-				/* GPS_1V8 (VSMPS2) */
-				vcc-supply = <&db8500_vsmps2_reg>;
+				/* GPS_1V8 (VSMPSB) */
+				vcc-supply = <&ab8505_buck_vsmpsb>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&g05ta03_skomer_default>;
 				/* According to /etc/sirfgps.conf */

-- 
2.55.0

