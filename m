Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591520;
	b=J399U+pkxnQM2DZrhjd4USszoBs+qn/lumnjIlr1n5fB0XFnR9SBkShLmsWEIqLUR8UT
	 yuJyRMGUd6b7/eykyNUbTxB9tpIuezdLJKpSTQ6+e42hyGsZX2aDs4wDSD8t99IGvHLLr
	 AbLrW0PiT6E94wmsW8UT+Lv1Svk0d14mmoHvFUhKLiUlNxD2SUZsHRPrEHXGPEsYdOaGu
	 3da7oaT0tXw+ThFKJ5U5+FTrIAdYQB4txh12Tvje/7CZH7f2MZjsTu53OIlH6z/sWxf5T
	 gl/NXVE8U++dZynJto3/Bi0KHTu/SLGAH9hREgu1kBBAwN2FzOPGFlwblrU/DZHSRsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591520;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=zpfZ+FMD2+J+dqvfXJBq85BWZ+lYU4FkFWwGXvTX/U4=;
	b=K0Bc6fxYVqR1mE3WqRJamJ54pi+gcIh4o4hLYhTDOjCdv6QSHxXfWp6OJ6Hn9T0fNseq
	 8gALXwGusVvA96Y5+3lMvON9bTgLUygK5alB0b0KZKWvN+AL2j60OwzyYVuplkm0vWHWh
	 6TkrFT2U6G+43EbQSNiamk80P8JUQWfx76rzayjNXpW9c/gQ2NGUX/URkem5qc6hH7v4v
	 H/ILHr6RhoMDorrJoMccpFJPOuBJHAWE6h7CAyRhUe48X6OvRcOBYb5JQyB6+7m7bIuyn
	 J/3QRgyVWP51HBb7BzdNNU2FiBRf7L3FAuTOSY1RFzFxQCpMY20FceNWMQozAzDTM3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fL6n4Vxu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938A9606A31E;
	Wed, 25 Nov 2026 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fL6n4Vxu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4A61F000C0;
	Wed, 25 Nov 2026 07:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591520;
	bh=zpfZ+FMD2+J+dqvfXJBq85BWZ+lYU4FkFWwGXvTX/U4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fL6n4VxutKJSfH7EDJ4J2f0g4edaoUtaM0ZWnnQ0IKBx97/HUVLYR1tWtleYKrQpy
	 +MXxznIsqeQpiE9stpH8Wr2tBpw6xHMqzCnUHOfd+s9PXU+3AElpnL0t9VLsv74A3E
	 rUYFOD88yFICYPSpwp/gaDHUYGqA2HrYuz6FPimptmb8cTO91YhIcewmlxr29sBTxf
	 j/X3A4tuL3CPtHioXqH4gdUuXITtB5zPxuVUG56cuFgzaOQ/nOYZvN0obZqn2K8zQs
	 CElzxTU5sINwO/5berbHClULavbe1+gWicYkyvfMZ5wIQwa7mQfbbzuGVQ5agOaVCC
	 cpXgfC5wPZ3hg==
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
Subject: Re: [PATCH v2 4/9] arm64: dts: marvell: armada-8040: Fix node
 names
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-4-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-4-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 08:25:17 +0100
Message-Id: <179559151714.9063.13867081335073416775.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> Fix various node names to use standard names.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Fix behind-32bit-controller@7f000000 in separate commit
> ---
>  arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts |  2 +-
>  arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
