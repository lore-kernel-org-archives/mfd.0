Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553264;
	b=2ANLP9Fev+BqRq2fo2B1Zxi5f/rq62HKaZxHuBEK8LjFKOAimaakUcagKCxhXGzCDJoh
	 4Xxmp/e0ouJ3kIReUzhhhLm0DX6XztScI/qGdqcvfRgwLtGHZT3vegHLRPWgvHpb6fS+Z
	 MbkihNY/zgOuj4PKf9FIpuWskqC1+H5x8o1hbup0Q4DNCzjH/ZA7cFAOORNphlHegroBq
	 mJ3ludR7MeS52pHN11+tyGB3U7Aj3lEadEpzdOFr4VO1Mxxnp895yodXAloOWvWDlymcu
	 PA7s2lJJprbBcN6lnsg41PEMRj2NdA7BWQ8vZTAnxaa8Z/suAp894K6UgDkqolT9X1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553264;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=UeJIGxY5ErXXyutQODurGJuOPaEIwFDPftosdrDquo4=;
	b=wwlWCajZAXqIP32sI8eEcND7OsETATvPCImJR6mtghw+iHOmXPj5inkcuLx2RLDMeXgt
	 VRkXYZblygqKmUQ51FVkb8n3jpHlDeWTaUBszIWFikm/Ixj693EhIcWeRUta2aVFtqLtM
	 6hzCv+gXz8iKBf4aD/2EOoAXP/lRkAxePJgPp9hq9vx85FrAx9g2AXGdv4xn7jJy4uAd/
	 Is0hq6wzmLgLou7eVorsaMd41vROlKOILK1iVuIDL9bPRL8UXWZzhglpWj2TDbRrs1L0c
	 O2eqFdlZJxIGuLPs8vhqKtIRsyvVgWP93JogyjviAwcAKdzimYG52Gj/O1ktFj1Eh+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WEe0daB/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CDA606A32A;
	Tue, 24 Nov 2026 20:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WEe0daB/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6131F00A01;
	Tue, 24 Nov 2026 20:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553263;
	bh=UeJIGxY5ErXXyutQODurGJuOPaEIwFDPftosdrDquo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=WEe0daB/3R0JiuxIoukVFaaAG3VnTRm7a6RbKcBhGEhdVnEBpKNkO9LywNKHqD/o4
	 1r/4ZgSBkV1j/dZrXFJta4FaE5k7RlMFIKYBpeVfQ/igglg2yCB657bl2CVk1587C8
	 SlTaUBwJWnYU1D4lbXCRW26QHLSHaj5yRhzTaMqwfm6sPhSvQIL97N38ESu+I7hSti
	 fT6RZZbmSDKGrMSTOhbhezci98chYgn2I+KjATqKFoFZAGXE11csN+AXAyxh7MzuPh
	 6/137YMV95lkT6tfbPit4hscIBXcofMO/t0fvw0s9mr0PWtToKN0TGtr2/qioVOfFh
	 7qien2kXb2VEA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:39 -0600
Subject: [PATCH v2 6/9] arm64: dts: marvell: Drop unused USB 'phy-names'
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
Message-Id: <20261124-dtbs-marvell-v2-6-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

'phy-names' is not valid without a corresponding 'phys' property, so
drop them when 'phys' is not present.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts          | 2 --
 arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts b/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
index a7b6dfba8af5..5823b25e5faf 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
+++ b/arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
@@ -28,11 +28,9 @@ &cp0_comphy2 0
 &cp0_usb3_0 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy0>;
-	phy-names = "usb";
 };
 
 &cp0_usb3_1 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy1>;
-	phy-names = "usb";
 };
diff --git a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi b/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
index 71c225221617..a68c958fbb30 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
@@ -89,15 +89,15 @@ &cp0_spi1 {
 &cp0_usb3_0 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy0>;
-	phy-names = "usb";
 	/delete-property/ phys;
+	/delete-property/ phy-names;
 };
 
 &cp0_usb3_1 {
 	status = "okay";
 	usb-phy = <&cp0_usb3_0_phy1>;
-	phy-names = "usb";
 	/delete-property/ phys;
+	/delete-property/ phy-names;
 };
 
 &cp1_usb3_1 {

-- 
2.53.0

