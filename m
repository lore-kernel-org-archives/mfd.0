Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553260;
	b=YxxkVEPv62zrhiYI8WT5eYk5/nt3Fh2Z0QcS0E/VNSfp9Fk4IpQ/1CdQtIaCo05kLxVU
	 3clOZTxIaKbmynJngxM+sqnFKvTTLe1DLbkqk4V9zIWSV7LoRZNGC4b1Eg4RVJpW0gHhi
	 tH+MwgUBsdTGbSE1OJoHTJULDgYzAKU1Eeq2LNIM0SdhML6kgi4sv8RZAInwrmlG09T58
	 QvfJ+hOb6KdWMJpzXoi5htqT1JCsCtKImKn0MFfc9Q/QzP6JFjIs70WGNwfpEO+E53Ypt
	 5a+Oy+mPsJDG1LhhaeA8yGHbZxZ+CK1MBiD0BR89VS1kgxQbYKmL5/X/sWXWI3rUPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553260;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=CuMg05a98HcJAkKkDl2QaTqHQIdMFGxRksNhla9SB8E=;
	b=bb1Yl3ulm4gwG9gISy4++zEqJtiZ+OSR6vezcaM8NbcobaS+KLfiRoKibTVhsOJ2z47A
	 72DmY4vSZ1iGdJPpw3hgFJNarw7oeoOdX3nbJs6vmwOf2pA0oPQjzytI51UZ7GxscL5Rl
	 Tq17iLaeRthwNacARfGaI9bAey5w+60ztNvZgLp/Svk75FJqqJdFzOlm6Fgnv4R0bD8/B
	 59M/mxbDT/f9G/9aQPKMqwjgzP3wxcVvLqmfkh1YtQZFtLjtyFqj1fz4pL5o9w4jyBNrk
	 Lj8Kn8TSvhBEXA/TZuOC/i2ZRGSkvkmrzLe7iBEqF0hOwwK/JnFVj9ej9ICcYsi0GzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNU3gMqO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3799606A33A;
	Tue, 24 Nov 2026 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNU3gMqO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6811F00A3C;
	Tue, 24 Nov 2026 20:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553260;
	bh=CuMg05a98HcJAkKkDl2QaTqHQIdMFGxRksNhla9SB8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lNU3gMqObQuk8TM7A8W9Rc8yaIsKKJ+Z0Y/yfFvghzBJOAZRaOUh8uHwPJ9r3XLg6
	 rr1PFpcnWihTp1M7xLILD2BYHW15tw4u7wUdN5WrZlhhvb9YgOwpIdA/s3PH2LWMk9
	 IDR3b1EgM9POYUf090Z15syvEzGfzdJ2eZS5Vju5lSXc9sE8QPZOXMAF5efr114mO7
	 WsrxkBf88BImcfdDfsEr/XsiIy+KA8KS32LZDAhjYxnD7Z25HKdchcTgPovribQ5Cn
	 wYNOiyrDqfxVw3Ln5boLERtUU8P8j447gBr1fHo3Dbnewv0+XLubMTgYrIiIbxiuuQ
	 JjaMJGv+gwyXg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:38 -0600
Subject: [PATCH v2 5/9] arm64: dts: marvell: Fix w25q32 compatible strings
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
Message-Id: <20261124-dtbs-marvell-v2-5-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

The w25q32 SPI NOR Flash is a Winbond, not ST, part and is missing the
"jedec,spi-nor" fallback.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index f9695b25da79..ee3cb89ead0b 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -590,7 +590,7 @@ &cp1_spi1 {
 	status = "okay";
 
 	flash@0 {
-		compatible = "st,w25q32";
+		compatible = "winbond,w25q32", "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
 	};
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index f2d278d171eb..1c36763178a9 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -361,7 +361,7 @@ &cp1_spi1 {
 	status = "okay";
 
 	flash@0 {
-		compatible = "st,w25q32";
+		compatible = "winbond,w25q32", "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
 	};

-- 
2.53.0

