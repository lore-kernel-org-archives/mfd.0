Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594841;
	b=jlDosGWjRrXf77QkcNbN9nE4Y9EEunyVn46RRypWrMIc0Qq2dhp7srxze067nW0tQU6I
	 vKXKMQFIYr4t8i7fWeOt5qqpTGkO408w7upGqUdqlMzf06YZLZiXKI7a0AD3yu/j2cy5K
	 1XTCpm7ce9+WtQdm2TYcQPjRu8FXlkkvakJa9PzVjQfJknmtkRKEpNv6VWFRiDVujdLr7
	 aN/4amgPFjDAr1TCsrIZCue8meRcXshXr3Jo/od5tqjs9Z2e89J2CxqmmLWWL0FEBZfPH
	 VRDWgzaFzCNwwx8Co+ASGjMsFedfC/8tTdAOQJmKG/xvLQVik1kZxLbhhdHDgxPdYCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594841;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=TbMTB348xWz+N7BbP6X3tZI2pVAnoZ6zbQ8KwiGJyoc=;
	b=JtacdsmB6ay3ECJ4vZsWS5lAqdjHLKGY2fVrpBQ9msAQzBFRAzUMsqwzXtvUq1/Qw1Ef
	 qgtROgeeiStaY//MO/wKvp4HkNlJKz6CgqogHnL2HbeRvvun5xFbh6GhpRRwty6gqiUEX
	 f9KfkgYWkfhkjYqT6i5XS/XGCrw4yfuXCvnobLwgQQ8b147gkrUyuhvbLXZDFZZHtv6SE
	 sjUypVCEk7IbweFwu+uj3RikYri/+p8PWZzOd/XX5nD7V+tdzKZTXY5LtOkWKupCkuAD/
	 OHGJNPFpH0vR0O0KwzKvq42x0kQbZMvlCgpS5b40bNjk3r9Sl86/Uvq+DRPGE1RL60A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijeBnl1V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885FE606A31E;
	Wed, 25 Nov 2026 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijeBnl1V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400E51F000C0;
	Wed, 25 Nov 2026 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594841;
	bh=TbMTB348xWz+N7BbP6X3tZI2pVAnoZ6zbQ8KwiGJyoc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ijeBnl1VtRddbwWSzQrBgGhO/wZRm0/afwpx/KLKdU3byYivRyLH+40NmEyQh1Gy4
	 VaUJnxx9OKQsd4hnELD7kOe56d84SJ+WLhoS6MHPV0opMmn1QxLTqEeFZB7+ZMH1Ly
	 LqhkT54rfaDcUyKneqwwFGdpaaJ3qM0yDLwVX+4X14WBBUvc3sigEqhAQK3lh+GDAe
	 nhD/Vdum5lq7P89Tbkjiaf+LD/+/lt83tOBatJMnuyYW5yzNpWh9Gy06c/6Wyjr6vt
	 pBnxn5rkuPnauV7u0qJ+2NI94pn1Wzevj7xilsxis7QYNQmVGjr192N/wUZz5A760/
	 pJX3XTormA9Rg==
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
Subject: Re: [PATCH v2 6/9] arm64: dts: marvell: Drop unused USB
 'phy-names'
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-6-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-6-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 09:20:37 +0100
Message-Id: <179559483742.14607.887628007861007504.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> 'phy-names' is not valid without a corresponding 'phys' property, so
> drop them when 'phys' is not present.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/cn9130-crb-A.dts          | 2 --
>  arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
