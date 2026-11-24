Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553259;
	b=WwGbLBUJlBy1NbQQEt/JqrrTzkwO5X1PJEgb6UyfmP3LwNRkkbqI+BHrqKlqAuLA90GB
	 ANw/XLRcJnC7pdJc0XCbsEr/rw2NpyKUYBhodvqPdxIrwTnHXzPTCqXJ8et3zZOWevPsT
	 OwMlOTAgDp3CaaMugEBhKIgwV4+bjly8nSK6Jl/EbV3ozqFnekicFa5t2h1a/1Q9wkmQu
	 lGq3bG8kum5d5MW8n9PLDPS3Fi0I0tRL8Cfe7CFgMngFgOHTpV8oNrrs8cn9ddEBJAftD
	 2qaa48EqUziQb2qngRK2OnqNBtylvds5eTLrm5+77s52B/SDz2fMYoHPFMzTowIv83A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553259;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=L3RtAPo/Q0xISDGnqeW4o+tIddktllbaP7tLujNfIoM=;
	b=PA+b+YfQsCuhCYyIPgGoqi0MnIyCfJIYMr5+Tuhs66acWA+zyah0aFgFubEMZTinVLUE
	 pmBv1UmJUNgZTtyqTfwQaMZssUPV5ZuWIIZTadfCmMe1JIIJ2cRcGwQwgXbAV3CTO/koX
	 nOC/bWlv4J6HwsUaPSC/VdCL/HGgDQ3w6i59iwxzm12Ui7GtFnYhM4/mRF6ETrYsO3vRj
	 4uY83OPMb6mjBLXQAdfcoCNJBflSHEZ6o35dSVfL8UEjN2qUvFMtKrBiyMqhS5omSa540
	 PybGl10fL3t5NBBxIymdLoSNiWnhOrR4p1Ux1C8xCtuXfCs5kG9vX0hDQlYQFcjLyfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Pwt49z/C";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC7C606A32D;
	Tue, 24 Nov 2026 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pwt49z/C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF281F01564;
	Tue, 24 Nov 2026 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553258;
	bh=L3RtAPo/Q0xISDGnqeW4o+tIddktllbaP7tLujNfIoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Pwt49z/CAv3zxSsaIuFf0W5kP0eMaZhif6TjoTwPUnucefNvA4fNdwEmZsLPLJw5H
	 5Sn3Pjw5geaLSOSamgFYiAb4U6fVmBAcz7Vwq6SdA9Tq+6vUT3iEPHnQE1AbFwNfC5
	 XidJ2OzG2Ay351V47tlHAOXesY5jtLgPuAw/L/+DBSKktX83VSIoaVyR+w52I17SkI
	 8++8l6KGIKXPN4aVlb9FEhCIgSVxKUxc7OhSlodcYtS0+rqEAQHlGryL5CSoRMH2mx
	 sxZrSfHDQtFZvYy6/jvoxHzMeHLQ4BF8esPhMQk0npzyzoHAT34X+Ykr8Mbg/dNCrU
	 kMlXUB3AfbHvw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:37 -0600
Subject: [PATCH v2 4/9] arm64: dts: marvell: armada-8040: Fix node names
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
Message-Id: <20261124-dtbs-marvell-v2-4-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Fix various node names to use standard names.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Fix behind-32bit-controller@7f000000 in separate commit
---
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 90ae93274a16..f9695b25da79 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -324,7 +324,7 @@ cp0_led1_pins: led1-pins {
 		marvell,function = "gpio";
 	};
 
-	cp0_copper_eth_phy_reset: copper-eth-phy-reset {
+	cp0_copper_eth_phy_reset: copper-eth-phy-reset-pins {
 		marvell,pins = "mpp43";
 		marvell,function = "gpio";
 	};
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
index def25d51c4bf..4a0c477d65ed 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -165,7 +165,7 @@ cpu_active: cpu-active {
 		};
 	};
 	cooling-maps {
-		fan-map {
+		map-fan {
 			trip = <&cpu_active>;
 			cooling-device = <&chassis_fan_group0 64 THERMAL_NO_LIMIT>,
 					<&chassis_fan_group1 64 THERMAL_NO_LIMIT>;
@@ -191,19 +191,19 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0x0>;
 		spi-max-frequency = <20000000>;
-		partition@u-boot {
+		partition@0 {
 			label = "u-boot";
 			reg = <0x00000000 0x001f0000>;
 		};
-		partition@u-boot-env {
+		partition@1f0000 {
 			label = "u-boot-env";
 			reg = <0x001f0000 0x00010000>;
 		};
-		partition@ubi1 {
+		partition@200000 {
 			label = "ubi1";
 			reg = <0x00200000 0x03f00000>;
 		};
-		partition@ubi2 {
+		partition@4100000 {
 			label = "ubi2";
 			reg = <0x04100000 0x03f00000>;
 		};

-- 
2.53.0

