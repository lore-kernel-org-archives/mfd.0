Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553270;
	b=xPG2T+Vl2CuTxnbWVUCKjMZibtazSUVEzb8rFjAnixcrQl5zat4Emzo50RSwjmVAOpkt
	 ho+3z/gdLeR5F8xZpeKrMNAeCrH0XdMj4/TjzY0meVybFKOyK0U/h8SrMe5uMJwOelUmJ
	 5DMokKh0mMf2dq3gu2nkZ8L7gh+K2pXtOLJryYEIchOPcGGM1GsGAZqHbvcGnhEpcEgOZ
	 IQZHF61xhHmaPd3wqepRdxGY+fh6XIZCXAJewbDCWnRGfNjdSLG1ShD+WYeeYbeJdNRqi
	 JAKiXafaV1Ci3evW9sXqUaGd7LHgm/uRIXOQ/uGChC08gPo19eMUdgGqGn9O8anG/kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553270;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=Mvm2B4aA/p4I2wK+YBoHM5JvjypAI+iz8BH1ZFQP+gk=;
	b=VK8l8xVcfCGNJk1mgKiI4qoXDESF7CSwlbs4mnicK2RrdlHIpUFciy3tji38nTjOgppW
	 VNYCfFjA+yy8M+/79sama8M0vc1gbVsmnk5rih60hqV0s0eHQ6TrHp24XAvg0ELbISZoX
	 trgZyp1wPaqR8yLQI2ELFJkimlfodngyy+LAw99O6c7E4+OAtNbaRAIi6OyUHozbJS7Cy
	 eVliibEkb85lVNu1JpT8RPHLRQTxqIMsZW1TsHaMSXREYiKRxAL8FVr/4UKfIYwXLBn2Y
	 rM6eFGG/B4urbEtPuMQh0GJdQpRZqOJmkmEDXWRzwVeyXNGSO/VEmGpse7KJtEJEAwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBEYYEus;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5476606A32C;
	Tue, 24 Nov 2026 20:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LBEYYEus
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4D31F000F2;
	Tue, 24 Nov 2026 20:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553269;
	bh=Mvm2B4aA/p4I2wK+YBoHM5JvjypAI+iz8BH1ZFQP+gk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LBEYYEusI0eGswHz62x3zy7t23eZcqwxp1riyC1v6vuseyAM6ueps2nM12eLzqy1n
	 88d8asmSTk4NwNUvIZIUvIY7zjyzT3Wpi3m7x8iQ1qGOSFtdDIs5KTudFWinnqXAwI
	 qh6V9wfRMPrBgCmEcc3Pp/rRoYWuYT09u5D518aY/Hg8dN5ZNkNFk2ct5t3WK9zDSf
	 7nvoJtyvE0gHxEGYFEi8n/G6krD+8hCPLGSBf2/uTQNLAId3EGeiC/BIOVSRhv57oh
	 HPGR4vRUojKahJMD8JA3r5/2y6fA8jsCJpM5ubh5EWF4br6QBv7fQ8wjhjfqm6VMUV
	 reT9tDXUKwJ+w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:41 -0600
Subject: [PATCH v2 8/9] arm64: dts: marvell: armada-3720-gl-mv1000: Add
 switch fixed-link
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
Message-Id: <20261124-dtbs-marvell-v2-8-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

As the switch port 0 has an 'ethernet' phandle, 'phy-mode' and one of
'fixed-link', 'phy-handle' or 'managed' are required by the DSA schema.
The expressobin has appears to have a similar configuration, so copy it
and use 'fixed-link'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
index a881a3326dba..93af902f4f6f 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
@@ -161,6 +161,12 @@ ethernet-port@0 {
 				reg = <0>;
 				label = "cpu";
 				ethernet = <&eth0>;
+				phy-mode = "rgmii-id";
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
 			};
 
 			ethernet-port@1 {

-- 
2.53.0

