Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591371;
	b=dla8m7hUvOuEmfPrtyUdeHKdyXe/ZzGavD5WPM08RMkND5dKAJzbrYE77fvZwspckaQt
	 MyzIN81FuaSsWsF7otE+4S2iKPZ/jle9wZ0kcLS6BlBY4tUW8G6tOIVogulAZqXFn1B9o
	 uFvrW65DryGMNvpEULyAiIZ/Zm8wQRLov2RWheD0C2OxrOhVUrMQ2T8HAe3y8P9OUdLn6
	 Fewk0xjZ4/zQmg01fPLr+cST1J5gZkErKbvGrskdAcoBJ50/Iv4rTn/3cp/TDIrlOO5ls
	 OoaGB6zJdV563iQRNJLgI6i6UcuxspQvH0ABIHpkVIOicw/jUegrE6TTv00J15sxKWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591371;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=fGGMmpzYvSRCJOjYoy+gZDvztGrcb3fgwkLyHKES3d0=;
	b=Rr62HLKoQO606Fe6gf+klYdpSBJvAJRswucZny6C9bGxjq/7csFjuUteH+d24M3XMudR
	 ug6LNmXotxXfbB1L2HV5ygmVRN3Lh94QN77FBK6qi+reeMC8YYT7aiM79l8ViVeDf0Pqj
	 i8xjTZsfmBNsTGK8F3yTN/ap32Oks8OMN0sy84n3uxe5MMEF4RjDyS0Ny+hG7d7RvnyAE
	 Aavy2wCjsflpahA+Rvfs+qJqSUd90IfLra0q0bceGtP7AfqQ8qiR/+RSnA8dmp8a3zptk
	 VGdk/qn1zMZKEOK/Aj01IE0c6b6Xp/3fXBhgpXNubiUoR0Xpudyxsk86wLRUaY85ZYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emj47kG+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8F606A327;
	Wed, 25 Nov 2026 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emj47kG+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFDA1F000CF;
	Wed, 25 Nov 2026 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591370;
	bh=fGGMmpzYvSRCJOjYoy+gZDvztGrcb3fgwkLyHKES3d0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=emj47kG+cOG02+gYOfZgF4FkoTPRC11y2I9vFAo7h5/UZVhX+m2RfvUk0uhStGPod
	 KztRuNNwtJAtArxVbE+W7yTK40LhtV4YGh3U/f7CUbsdqriXGJ6Vt8QTPdArkQ39fi
	 6tOSdz367cSzb9DYywX/56XoTLug50BvvjMELt23nToLlvxXFUtYJKoQ/4Nq6cIA8m
	 LUhvCGXH+r6tyXvuDgWZT2ETcjKv1hxJisn1s45yLvKwnZG5nMO5TVGeP9SjwN5sfB
	 HfgL+IoXQ7R9Ge9XOvIxXc9MRKkQE9Qe4QJN9RU/LJPuUZ5/TL5tev8hxQojArTkyl
	 fzyYLK3hDUk4A==
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
Subject: Re: [PATCH v2 3/9] arm64: dts: marvell: Drop SPI max frequency
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-3-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-3-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 08:22:47 +0100
Message-Id: <179559136716.9063.4751486198367684170.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> Remove spi-max-frequency from the CP0 SPI controller node on the
> CN9130 SolidRun SOM. The property belongs on SPI devices, and the
> flash child already has its own maximum frequency. Plus, pretty
> sure 1.8GHz is not a possible SPI bus frequency.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
