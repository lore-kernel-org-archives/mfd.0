Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553257;
	b=3NjVadzkALTXZNS3AA6HPLgdnQKoGdiyxviH14iSo5YscXbK6SZZLJHPl3YwQiQ8nYpt
	 Noohib2/sGk4habyk4YTNrQy/kOKO0qylt29dba1VOVHlt+ROQ8MS19KzpK14EF6hJ+T0
	 38RzzDIZhBF1mcagUz57Qd9PDGlNHMai8y0tkUlA5r1FaCHZic1Uobv/Dmmj0J8ak743M
	 NyF2aVihPJsae6qbxpsCRujUY/6Ye6f76fYG0neobFtn83/LdoBTKPWINI0lMdmghFnlG
	 TyPno31Sb7sflLWA5jaW/B1v+iv3y0a5z4DNABt+4QsyazS3LeCJcgUzPOTbu2cauBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553257;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=qPjiFEL/KvMKPxsB3qj3BGsroSuozksKUttzqOJzzek=;
	b=D3XM9k2MekvMmjO8jG5uiVKgAjiWToENiCUPcEiQQplnJIxzjdn1DMxh4SnmJeQQ/nEu
	 HphrJX3ZUjU495cDDgCKEW9KiIU5o9abgYvE7s80elaw6tz+nlA0A1BoWwqDFNl23aCz3
	 p5Lu3dobo+ttHhzr9MKn4sCPoBx+R3YlsnTpc2HcNc86boRwpCcxBiBsA2VkFwIQwZtYQ
	 YAE9NDccHXd9YMk3t2D+A8S2LpmcMDuosnSRSCdLSmgwqZUYg02S60H7jsG9X79of4kGG
	 UtUy0tKgw4qxr55Ow59wYF4VY4lc2PY9pJD9SBdT/MDODK4mrhEqATWb3naTxMJTqRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amJVoekf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82392606A33F;
	Tue, 24 Nov 2026 20:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=amJVoekf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945EF1F000D4;
	Tue, 24 Nov 2026 20:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553256;
	bh=qPjiFEL/KvMKPxsB3qj3BGsroSuozksKUttzqOJzzek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=amJVoekfOtgDvlPsAoePhzXqrNMlqOe55eVd2FBvi/Zo9R1AtMChkEHnv6ruAaGo8
	 xTdIPzmjDeXBYqFkJG5hoD5UmF5B94xcC9aiZ+6sIkmRIZczYd3tRd6pbWzDa44mL7
	 8ePloa4dDxiKPv0FGwTbFLMvzq+8tEof1XLCi7JUsYCt0AbBBcssokQv9oLCCt3P34
	 FisYeFU44Kv/lBS0Nh+ggEXv9SjqvTlZ1HTwu2vFVdAE9CGr/fM1gqVJGHXHnjFim5
	 B85af6+2vC4ab97/j9BBcgQHmbcFkQUlJqNZQq/0+qnEyufHnNzlqG4t8mEHMViPaz
	 iaYmOCiDV82iA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:36 -0600
Subject: [PATCH v2 3/9] arm64: dts: marvell: Drop SPI max frequency
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
Message-Id: <20261124-dtbs-marvell-v2-3-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Remove spi-max-frequency from the CP0 SPI controller node on the
CN9130 SolidRun SOM. The property belongs on SPI devices, and the
flash child already has its own maximum frequency. Plus, pretty
sure 1.8GHz is not a possible SPI bus frequency.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
index f95202decfce..7200f72b934f 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
@@ -106,8 +106,6 @@ &cp0_spi1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&cp0_spi1_pins>;
-	/* max speed limited by a mux */
-	spi-max-frequency = <1800000000>;
 
 	flash@0 {
 		compatible = "jedec,spi-nor";

-- 
2.53.0

