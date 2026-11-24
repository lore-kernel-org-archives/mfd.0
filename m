Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553272;
	b=QIhoma/NuueNdI0slzfpDW2WwEIrN7OmdhEcI4MTQXs7xvredPksQ30HCJkJu1xEptGQ
	 emvK1qYniR3SIpwM8PAsVL7vR3yst/R48V1uYeH4V2EZBQD4KPOsXtPMZaUquCkx4vgob
	 nx7xXIMCwtVnn5rLniRAGPrAV3AzaaoeW6J/5j0wEWv60119uVRm1KkvfL0eLVlD5mDoZ
	 HhtlKS8LNlwz3Rvde88bYo27n21GJFDMlrEGQZ94RW2nBBSlruD5ge9Mr1yRmfpd0SKut
	 QSxpjsgQa1RwZfh9NWigBkxQgw40MzGIndXoaDsTIo8Em05iKx1NzhOtAPW2oGocT/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553272;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=72w/uy+f5wWGqnSM2pK+VaVIFbQMfx9mKsgX5oNVoEs=;
	b=5eZ0zEFBWluFZBxCHkgADJ72qbvl85njxYUYDR67WhxtszVce85hoXidATgw75AOyYBI
	 gWsG9QGlNKl7wxwabJfC+wl6IqmZ1QDRUhLJwIHxHwiIencrJp0aO3EeQuQUWgd+WpaN5
	 6bHOW1iMww0kDhkKrOaaqUrFr3VrwM5mlf3nXzaGtZk4qz1MrL0GngppC+6VA7CYjBpIJ
	 7oCERP056vmU1NgobUcCRKnNNhHV0kNLlqXJSu/6n/cRHyMSjXObDNGjaHRjq8oVvz9OM
	 ZpWzu7QKpl+RBU79ySOBx2iAmGDdPhBkjtkHSS2T7dTGMREu2rTQhXMInHCDXeUmgaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyrsCgOj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087A5606A333;
	Tue, 24 Nov 2026 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyrsCgOj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B601F000D1;
	Tue, 24 Nov 2026 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553271;
	bh=72w/uy+f5wWGqnSM2pK+VaVIFbQMfx9mKsgX5oNVoEs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dyrsCgOjmuEKWyjNNGk3LuLWLYWbDf6F0GSPWima2dkrHzNmxhnrTCh0zMlI0D79h
	 j5RuiiJDjxUqBbZs5Xzohl4GI8kAyV0O2AJ+N8ztR2QpgGwyVRcxL7bV1PIsBL8Luu
	 r2UrtfEZ2BAwIvVO3sKaaJP1dY01M1h0rcZB5v3baUJrn1bdN7zRKgLBn9TiwC9H9s
	 jFoIGlZs7TtPrfTIhcemvmYJYGwgyHJ3TLxv3j/0epfqHcexFyYc+rrqHjy6xwrL8a
	 tlvibwVgVXirGb4ttTgMSIfAavEV0jHdv1AzN/nGktyKiUWm6a3aqgZCmaLD3SnR1n
	 K5AN8iB4CoOgw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:42 -0600
Subject: [PATCH v2 9/9] arm64: dts: marvell: ac5-98dx25xx: Rework
 'behind-32bit-controller' bus
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dtbs-marvell-v2-9-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

The 'behind-32bit-controller@7f000000' node doesn't follow
standard naming and overlaps with the 'bus@7f000000' node address. The
reason for the 2 buses was separating the DMA capable blocks which need
'dma-ranges' translation, but there's no reason that needs to be a
separate bus. Merge the nodes in 'behind-32bit-controller@7f000000' to
the 'bus@7f000000' node. Doing this requires increasing the
'#address-cells' and '#size-cells'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - New patch
---
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 101 +++++++++++---------------
 1 file changed, 44 insertions(+), 57 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
index 4878773883c9..13aa557c8571 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
@@ -79,16 +79,17 @@ soc {
 		ranges;
 
 		bus@7f000000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
 			compatible = "simple-bus";
 			/* 16M internal register @ 0x7f00_0000 */
-			ranges = <0x0 0x0 0x7f000000 0x1000000>;
+			ranges = <0x0 0x0 0x0 0x7f000000 0x0 0x1000000>;
+			dma-ranges = <0x0 0x0 0x2 0x0 0x1 0x0>;
 			dma-coherent;
 
 			uart0: serial@12000 {
 				compatible = "snps,dw-apb-uart";
-				reg = <0x12000 0x100>;
+				reg = <0x0 0x12000 0x0 0x100>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 				reg-io-width = <1>;
@@ -98,7 +99,7 @@ uart0: serial@12000 {
 
 			uart1: serial@12100 {
 				compatible = "snps,dw-apb-uart";
-				reg = <0x12100 0x100>;
+				reg = <0x0 0x12100 0x0 0x100>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 				reg-io-width = <1>;
@@ -108,7 +109,7 @@ uart1: serial@12100 {
 
 			uart2: serial@12200 {
 				compatible = "snps,dw-apb-uart";
-				reg = <0x12200 0x100>;
+				reg = <0x0 0x12200 0x0 0x100>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 				reg-io-width = <1>;
@@ -118,7 +119,7 @@ uart2: serial@12200 {
 
 			uart3: serial@12300 {
 				compatible = "snps,dw-apb-uart";
-				reg = <0x12300 0x100>;
+				reg = <0x0 0x12300 0x0 0x100>;
 				reg-shift = <2>;
 				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				reg-io-width = <1>;
@@ -126,17 +127,9 @@ uart3: serial@12300 {
 				status = "disabled";
 			};
 
-			mdio: mdio@22004 {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				compatible = "marvell,orion-mdio";
-				reg = <0x22004 0x4>;
-				clocks = <&cnm_clock>;
-			};
-
 			i2c0: i2c@11000 {
 				compatible = "marvell,mv78230-i2c";
-				reg = <0x11000 0x20>;
+				reg = <0x0 0x11000 0x0 0x20>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -155,7 +148,7 @@ i2c0: i2c@11000 {
 
 			i2c1: i2c@11100 {
 				compatible = "marvell,mv78230-i2c";
-				reg = <0x11100 0x20>;
+				reg = <0x0 0x11100 0x0 0x20>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -174,7 +167,7 @@ i2c1: i2c@11100 {
 
 			gpio0: gpio@18100 {
 				compatible = "marvell,orion-gpio";
-				reg = <0x18100 0x40>;
+				reg = <0x0 0x18100 0x0 0x40>;
 				ngpios = <32>;
 				gpio-controller;
 				#gpio-cells = <2>;
@@ -189,7 +182,7 @@ gpio0: gpio@18100 {
 			};
 
 			gpio1: gpio@18140 {
-				reg = <0x18140 0x40>;
+				reg = <0x0 0x18140 0x0 0x40>;
 				compatible = "marvell,orion-gpio";
 				ngpios = <14>;
 				gpio-controller;
@@ -201,44 +194,6 @@ gpio1: gpio@18140 {
 				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			};
-		};
-
-		mmc_dma: bus@80500000 {
-				compatible = "simple-bus";
-				ranges;
-				#address-cells = <0x2>;
-				#size-cells = <0x2>;
-				reg = <0x0 0x80500000 0x0 0x100000>;
-				dma-ranges = <0x0 0x0 0x2 0x0 0x0 0x80000000>;
-				dma-coherent;
-
-				sdhci: mmc@805c0000 {
-					compatible = "marvell,ac5-sdhci",
-						     "marvell,armada-ap806-sdhci";
-					reg = <0x0 0x805c0000 0x0 0x1000>;
-					interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
-					clocks = <&emmc_clock>, <&cnm_clock>;
-					clock-names = "core", "axi";
-					bus-width = <8>;
-					non-removable;
-					mmc-ddr-1_8v;
-					mmc-hs200-1_8v;
-					mmc-hs400-1_8v;
-				};
-		};
-
-		/*
-		 * Dedicated section for devices behind 32bit controllers so we
-		 * can configure specific DMA mapping for them
-		 */
-		behind-32bit-controller@7f000000 {
-			compatible = "simple-bus";
-			#address-cells = <0x2>;
-			#size-cells = <0x2>;
-			ranges = <0x0 0x0 0x0 0x7f000000 0x0 0x1000000>;
-			/* Host phy ram starts at 0x200M */
-			dma-ranges = <0x0 0x0 0x2 0x0 0x1 0x0>;
-			dma-coherent;
 
 			eth0: ethernet@20000 {
 				compatible = "marvell,armada-ac5-neta";
@@ -249,6 +204,14 @@ eth0: ethernet@20000 {
 				status = "disabled";
 			};
 
+			mdio: mdio@22004 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "marvell,orion-mdio";
+				reg = <0x0 0x22004 0x0 0x4>;
+				clocks = <&cnm_clock>;
+			};
+
 			eth1: ethernet@24000 {
 				compatible = "marvell,armada-ac5-neta";
 				reg = <0x0 0x24000 0x0 0x4000>;
@@ -273,6 +236,30 @@ usb1: usb@a0000 {
 			};
 		};
 
+		mmc_dma: bus@80500000 {
+				compatible = "simple-bus";
+				ranges;
+				#address-cells = <0x2>;
+				#size-cells = <0x2>;
+				reg = <0x0 0x80500000 0x0 0x100000>;
+				dma-ranges = <0x0 0x0 0x2 0x0 0x0 0x80000000>;
+				dma-coherent;
+
+				sdhci: mmc@805c0000 {
+					compatible = "marvell,ac5-sdhci",
+						     "marvell,armada-ap806-sdhci";
+					reg = <0x0 0x805c0000 0x0 0x1000>;
+					interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&emmc_clock>, <&cnm_clock>;
+					clock-names = "core", "axi";
+					bus-width = <8>;
+					non-removable;
+					mmc-ddr-1_8v;
+					mmc-hs200-1_8v;
+					mmc-hs400-1_8v;
+				};
+		};
+
 		pinctrl0: pinctrl@80020100 {
 			compatible = "marvell,ac5-pinctrl";
 			reg = <0 0x80020100 0 0x20>;

-- 
2.53.0

