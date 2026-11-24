Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553267;
	b=gEzl/KIbPD3n9qAb2Nk665sHw+x5Xk+usHCgsDQhF2aETjWpjb+72Vc7xqnDKaDpR8iz
	 LgITxu1av10iCRm7ewfC1YELzEQ84/G2Ib1xHlQMG30pe2avoxH3HhSoFuastYCUuUi+Q
	 TUmReFu2XD+HfTqUTVIZV18SdEHPGuOKdYh1KSvdqN1nzCVxbI8o6q9DlvIMtdnC9VuNZ
	 LtXiRvfDLUzpCG667u0pxA6BBgfw72Nypiq5hrKvHQDHfMUmeR3YLHRiKknwWgwrf+jOa
	 igMj3CyNP1A6kukS19A/DtiKjZGL7o+jt6JpE/tWVbOJianADdd1snfQsmaiUN0hP0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553267;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=cX/Tp5audNOVGhUTi+88u7YfX7Lqy3DYIOIRzLRbeyY=;
	b=xvdcZ9qdw5EZv6Ta59HVF4+D+afJfwQEdq3z5dBpSK/L09YyxUoJ88dPVmnI8YhamMrC
	 YWbuv/vfn7Z4zgV/qPEdNJAUvby2hAJ/5OK/+KO7sPOTXtplI5ADEy8kXS8hyjt8H0bRh
	 mQZY7/cki9Ko1QhYBL52GYwmoUD4IPAZEu88IYyTUa19uSxQ0Tm6rVH5FFzifdXwLgYcz
	 AOGHjjsEfS5KjeN82e4sPBKB2/4RCkp1a4OV1VnhUZgYKR9D91AgItp7kftGkGQ3LdjZ/
	 MJTdQlrPz67uB1gbQSXITjDjMlLNxWjlL13foYlKtLXu28n6X2xwl+fJ2evqnWxcSoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIWAjUgl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45233606A31E;
	Tue, 24 Nov 2026 20:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIWAjUgl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1721F00A01;
	Tue, 24 Nov 2026 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553267;
	bh=cX/Tp5audNOVGhUTi+88u7YfX7Lqy3DYIOIRzLRbeyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JIWAjUgl5n2OuNOs2aaa55AegzOK0ju9PfMi7wQkrXMbx/FHizoUEaaVYWudSI1eB
	 9648wf7r40qhxBHFzlDUBKBiqWhAlN7fZWQCzDAky3tHT3yILDXXGh/iOLsCWt++TZ
	 NjiUeFHzl/bPFHTcVAyxBmpz1gxXk0YgEfrUVQzRttZKCC6giNS3wI8aJu552eLP+8
	 +PpL4QgTqpRXpB8Yak6FXFhIgtvtz4YW7XvZ4xmaDGR2apyWL2SlaNTyUolqJkfUUE
	 W0jARJ8j8U/ZHZVTWtX2iJ5gcmW5fa259H/3x330lavLzndq9jawtYAiDu6cDXkBng
	 CqlvvEcl2D72w==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:40 -0600
Subject: [PATCH v2 7/9] arm64: dts: marvell: cn9131-cf-solidwan: Drop
 st,m41t80 reset-gpios
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
Message-Id: <20261124-dtbs-marvell-v2-7-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

The part has no reset line nor does the Linux driver handle the property,
so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
index b6aeba7d0a61..0b079e1428bf 100644
--- a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
+++ b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
@@ -252,7 +252,6 @@ carrier_rtc: rtc@68 {
 		pinctrl-names = "default";
 		interrupt-parent = <&cp1_gpio1>;
 		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&cp1_gpio1 13 GPIO_ACTIVE_LOW>;
 	};
 };
 

-- 
2.53.0

