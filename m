Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591303;
	b=L0rqCSfnF4fjPiKkRZnlkYjvmPhOZzIT4O7iyU+b956rOOYtObRM35fVR9ucFAm40fUT
	 Ho9c988uhBDj2f0u0ES9gQ3KDc4NGAjESoJpm9IiCYBcJzY2XMM2YV7OHXa/PJ6Aqy46V
	 rserZCtQe4WDwloPl8/me1BnwFJNzTdcv09NXDI8FPXHCBECxbhdnalYEscPqm97co06D
	 iPmWRD0FoG7QJFdMMCbJ+OxSH5Yc8p0LvxwwPq4xXalnufmSYcvdY7RI4ahZugUt48NX8
	 6IIAsbtUsOJF1glqANnHyFbKqmFUt6ClBeYGE8y52VuinJbIRTK/rmcvjzASUM+jV3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591303;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=y7iu/ep1a65WrbASb13lQq8sxkeDKAqMwd/fkbVhul8=;
	b=ki0vqvb+qzcEujUpxvjqrmtM7+tvTmPgOpr1c3gwO0IncPYthm2ZjjK7JD6dV1xTusjL
	 4p8D9EzlaMLpAwK7CldIRgQPmzcgpUsAnkvVOw+0NZQLduNsvaON3wtigRdZWls1q4ng7
	 FhePWh89/JKlg0Bx5DnJnhK2WrS5wNFqQ11AJeNvL1vKMFj3uyBURkt6rC8XunISmYlv8
	 idVu0CbkbcUd19DYsqOAArt7Yx9w9Il5vN7HlQWaa6PWOmCimyzzHHCJMXBdYw0wsYySJ
	 JICuBF+DcM0vI1O3O+GfJfPrk4pBAx0A3mh89pOiAoiSrcICFKfTMDzQYoHaiUjZ9Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzQSEVcc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C795606A326;
	Wed, 25 Nov 2026 07:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IzQSEVcc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008541F00AE3;
	Wed, 25 Nov 2026 07:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591302;
	bh=y7iu/ep1a65WrbASb13lQq8sxkeDKAqMwd/fkbVhul8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IzQSEVccBTFtOV5CVdMu6avznbK1ZNELFKlz7DtIEp+wcnTEb2K7tJHe8Gc2vHx8z
	 k81yz59N58s17BAOkeZ7KAF0m3Cn6XnI1sDSYX5hrG7MTqNzUOcuwQCFKOGlFl6YU6
	 Sij9E7Pq5berwcQp6wz+JDBM3zq6rMsUSolOQlQDdsP/4Bb8+TRx4OARNPuZcA81NI
	 80uNEGN8/K7ljiT9An6fRTvPvawLEiSP3PGqvSJEGJgVPIusF+YJTiinwQBD10tzH5
	 j6QOHbikVuUZeeT9iwGFgISRFL215mjAvEOI1GKBZaaW8cLaJekdMuSJROvsEq0Jk5
	 oCHO1+DAzNXsw==
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
Subject: Re: [PATCH v2 2/9] arm64: dts: marvell: Add AP806/CP110 syscon
 compatibles
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-2-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-2-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 08:21:39 +0100
Message-Id: <179559129960.9063.13932232293411846925.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> Add specific compatibles for the AP806 and CP110 system-controller
> syscon blocks that host pinctrl, GPIO, clock and thermal child nodes.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Update compatibles to avoid old legacy ones
> ---
>  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 6 ++++--
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
