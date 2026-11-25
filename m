Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594891;
	b=vPjTXqSf3kOMSZL5Qov0y/RHGzzHPG8gKU/owAxUUDekc2tJjdBSgx7VqwlWLdJ8rYqc
	 eeKQZNfzbn7P3iGR6bAcPE7cvP/YF9jEw+aKqZRW04xPomUoRDtVG3UC0kEXgj3TJ0Asw
	 dKkQdHpY0S1bTRqDsGTAuraZYZo6PT8yb2CLgrmEdRegWvo+fiqcL/rCGTqx1IFcBM8xS
	 Y6hbUlmv1VE9aGSgdtWxGWbPokJNTP+zyZhYRb3PYTMMIxWx3Tr+uc93TBEse4+VYUisx
	 MK5oVXnNisV0Y3Pes6KOYfu959+KPPHtlZi47ttlS7rFIitkciQoDA115ntjgtMFZhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594891;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=we+jyk811DxDB1kpmFRUhHwg7Xb3fLiUU6GkBZOAy+s=;
	b=EJLemRPDNqj1UTQKIooVZJoFK5vKLOplmL4jJy9C5aVlpdI9IQmcCMO/M5k60dK8xAei
	 8cH21uL4YjJUBnDgYGEnXOGzH2IshYVBV91JJXqpD6+uQ2fRfgD50JcO5M0tdhu58HPXy
	 fjR79tuSi7zCBUhNkBk2yp3Ca1VXvHRQH+ty0gBcKL2AsdZxTchnotibQUgsfy2uz2cpJ
	 qcxs9WRCoTyBmkHLmEs110hcwjwyiVdk41O9yJXJMdxE4mNp3Extoxn7XTxcM4EY3E3b6
	 9H843xPP0EkHOWERM/ws4Aa8ylGPw//8ZYv0r7IiLFMaEDEOk2+upPFkNU+6lIX4SqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EC2itC6N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB187606A685;
	Wed, 25 Nov 2026 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EC2itC6N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5697D1F00A03;
	Wed, 25 Nov 2026 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795594891;
	bh=we+jyk811DxDB1kpmFRUhHwg7Xb3fLiUU6GkBZOAy+s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EC2itC6N+uYhtWmmdoJjTzMhW/T7ftWmq/aIe49XkzczNT/UN7Gsv/DOXq4PDIcMM
	 yO5NFv1wKiHzBbpFNACjIyruxoe2pGg0141OX/rHfeXm+h7KUpCQUAQdXiZvoRTLSo
	 g6whcRoCvLVbzyRZf6uGvNzOjh7EqKGG36xk4abdq3EA+Qov9kz8a4eJVd1k0LXZrC
	 zF4gBEDPxOhq3SaMf/AXpEjjXEpr/76swpBtm2MtvBijUOjStB8eFxmJeePhuz5GjP
	 AlgyDEJ7XvUDU5M2yzL3ugFpdBoyH+hVW55q4Oi+IKRmKzEonqqqHseREj+pmFjInd
	 X0wVzprDdPuEw==
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
Subject: Re: [PATCH v2 9/9] arm64: dts: marvell: ac5-98dx25xx: Rework
 'behind-32bit-controller' bus
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-9-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-9-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 09:21:27 +0100
Message-Id: <179559488764.14607.13962945107658633472.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> The 'behind-32bit-controller@7f000000' node doesn't follow
> standard naming and overlaps with the 'bus@7f000000' node address. The
> reason for the 2 buses was separating the DMA capable blocks which need
> 'dma-ranges' translation, but there's no reason that needs to be a
> separate bus. Merge the nodes in 'behind-32bit-controller@7f000000' to
> the 'bus@7f000000' node. Doing this requires increasing the
> '#address-cells' and '#size-cells'.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - New patch
> ---
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi | 101 +++++++++++---------------
>  1 file changed, 44 insertions(+), 57 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
