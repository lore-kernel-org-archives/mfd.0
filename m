Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553255;
	b=18p5C6blRwnW8f8c40dTnqe5Z6ghprM6W2c7CQCmtuuZNWx45fTco9rBoNvWNcRmhv1F
	 i3c3nKpV6zqtm2pFALV9TIyckdsQlO4tTbe8jOLf+BkkqNLjmamJcvKWA/HTOKYhNaICA
	 lk4HP//80HQT8EUtHiFkr7JFWZTFMpV5b89DR5XZvwBgX9qf+6qTvw5Zx5p3IOE8l9tSe
	 g/v0T1sSm8ExF2KxS2jPNqENcM8+AsO3LBTLB/f77/hqH2N/knMExmASRuOgsuZxnymwc
	 +fgI7JXlaldO2X5vHsfEC5x2lNpNtGK6iaBHbvUNIXXjVDErNoWN3SxrUL+rsIwPWCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553255;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=TGvJrzvCh1u0+GAaV49qFLIoqLbmbUrKt8bVmtDQlCE=;
	b=xA1as0er5RBUiFMPo9uqsFdZd1lRVwdVkfOV1cqmREbfnAZ9EdSOEMm5JM3kG5f/Or/c
	 Yqdw8wb+E9avWPBGVTg6GL6nXHMJe1KRtkwkBydolbqg1Dq7Oayfmf2NhLGokOOd+Nh+G
	 ZKdhBVilwdraV2FSloYHO8EGU9tWbtQXM4msBINkZw+h7mAAQiwqChonOcv14+8539f+n
	 9MpiXv+52b9X85wkGKUOPWULELOcG5KK5gzbSNBJkn+qMhx8UCYaULZAwDkLVc3QMWRWL
	 bCj6LENFqf4OKuf04O/0EXGc2h5nD1+fnneI7T+Bwu8Q+LVsrXjj5E0B94qgsdJLSlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GFYGq/YA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226D2606A339;
	Tue, 24 Nov 2026 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFYGq/YA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6313F1F00A01;
	Tue, 24 Nov 2026 20:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553254;
	bh=TGvJrzvCh1u0+GAaV49qFLIoqLbmbUrKt8bVmtDQlCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GFYGq/YAizb7UeGqMtk8Xyq7JkWWqA5fW9TI3aHJMgQanOyHIhKqfiUpbDpF2SqpF
	 /Om4xUokzC4uF81OtXb/unyAi8aYFmxFEihetk5B5QIHTkm/waeYz9ReA3hxlbLQoa
	 COoSBL/sYCNOO4xWqh/d3JNU4c32iGJeobcmafHd9obwcNh1Tl7VmMMXYG8gfVxKDi
	 DX787oIrCtAVoffPCMnzuyiBqtt0uSpjzd7PQ2tR2JMtiL6RvhZrQpBzHyNytIUvI2
	 E9kMDCuvK6rcMsFfLWbvaAraFmN1ky/8A75hD00WlW4OWYIxvQbwI/Yz9zI2qXG3tJ
	 J8pOILYjIgugw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:35 -0600
Subject: [PATCH v2 2/9] arm64: dts: marvell: Add AP806/CP110 syscon
 compatibles
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
Message-Id: <20261124-dtbs-marvell-v2-2-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Add specific compatibles for the AP806 and CP110 system-controller
syscon blocks that host pinctrl, GPIO, clock and thermal child nodes.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Update compatibles to avoid old legacy ones
---
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 6 ++++--
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
index 40e146982921..ce9821d73aaf 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
@@ -267,7 +267,8 @@ ap_sdhci0: mmc@6e0000 {
 			};
 
 			ap_syscon0: system-controller@6f4000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "marvell,ap806-syscon",
+					     "syscon", "simple-mfd";
 				reg = <0x6f4000 0x2000>;
 
 				ap_pinctrl: pinctrl {
@@ -293,7 +294,8 @@ ap_gpio: gpio@1040 {
 			};
 
 			ap_syscon1: system-controller@6f8000 {
-				compatible = "syscon", "simple-mfd";
+				compatible = "marvell,ap806-syscon",
+					     "syscon", "simple-mfd";
 				reg = <0x6f8000 0x1000>;
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
index 39599171d51b..6f05614b0641 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
@@ -225,7 +225,8 @@ CP11X_LABEL(rtc): rtc@284000 {
 		};
 
 		CP11X_LABEL(syscon0): system-controller@440000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "marvell,cp110-syscon",
+				     "syscon", "simple-mfd";
 			reg = <0x440000 0x2000>;
 
 			CP11X_LABEL(clk): clock {
@@ -277,7 +278,8 @@ CP11X_LABEL(gpio2): gpio@140 {
 		};
 
 		CP11X_LABEL(syscon1): system-controller@400000 {
-			compatible = "syscon", "simple-mfd";
+			compatible = "marvell,cp110-syscon",
+				     "syscon", "simple-mfd";
 			reg = <0x400000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.53.0

