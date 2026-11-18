Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028711;
	b=4TTfJcNPDwlupSaJrMyzjx4HcmHOTsyhDXh9vhudmTCocXZ4sO0v3cSYCOiK9V1gEPf9
	 g2oEVBQu4uHoCtBl6u2ev68QeWJ/JHDSNPf6FYo6ARZwqnTzyIHlaQKBm4cFVg11KVR44
	 eLihtZ9NKmPyVRX46CH9uQDBei9EgSQcXejSRVWn3sEXQ6SDMryYgJJDhBQ5YHyi/4j41
	 UsF6QAiVv3wUWIBiiuY/0kbLBWg71ZUMNciULP3PoDfVlxqzFAQhPjCTf3zK6aNJLtgJG
	 AEvfaAs791cDzLPjZmRVyFryjMcZNQbPgjG/CEYnz3/F0OuAOUjAtJTPBTuQXNysD3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028711;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=FxeoPm60QVZSm59ulzAY58PXfMyI5k+SSmZhx0UOq5Q=;
	b=uj6+dg7fdCAWJp1H44RxglGSMFN32IBTTaOXtZRGCcsRY8gxi1qyCTumNx7NrG6ZT00I
	 oxfX6+C0v+wcRKsVAvwr3OevGQXHVA6h5ZprGf1DsXnYe7MmxnK6iqRLmxY2kJS8lxsiu
	 ybVC2aXubS4CMQqCBObZwf9IAWhEt2k745aOu+MoNw75wL0woEPoOISaP+2H2AZKdbqMd
	 C2Pedvb52Nq/NFdv1f8dSzgcNkBrI+LoGCXLC8d+bR0ShpK0D+CZZAZyobPGhDSekVIaz
	 F/ULhEnHHtmlRC8/Xq6WWrB+1a6Fx9mNnRn79pjzongFEWChF7ZTu0zNDaGHE/VbqyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2dBeig7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158FF606A32F;
	Wed, 18 Nov 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A2dBeig7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB51C1F000C4;
	Wed, 18 Nov 2026 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028710;
	bh=FxeoPm60QVZSm59ulzAY58PXfMyI5k+SSmZhx0UOq5Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A2dBeig7h0YkWh6HUDt7R8Ja2BFbPmhxxju3lJ+ceYWprjBaAgEGWWCkd5FyuB/k5
	 ieIMepElfSib/pFL+BfgCcBytc2MPGX3Vr0LWzopFuMBE1RB3KBQFPlRKkrqjMu+US
	 WU9657uNXpAaEjeECZF2WwOm7C0xstCxfIPqmh20VM8U5S0ScvNkvGiNgAb+pKseUv
	 yv6TCSgGoV8tPQ4DG2664zqWwtMmiuX59hNLSNxBuB6mauOVegXO1L+6ju1kd0a0fY
	 GGI8LztAXJ1y98doEboXFvqy7QDp5kH/YkTKLC4nc7rRa/5fN+tfSQc3DvSBALxHCx
	 HnyECVzAtfSoQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261108-zx29clk-v14-1-48694e5a9d10@gmail.com>
References: <20261108-zx29clk-v14-1-48694e5a9d10@gmail.com>
Subject: Re: (subset) [PATCH v14] mfd: zx297520v3: Add a clock and reset
 MFD driver
Message-Id: <179502870951.74035.5648389534512059774.b4-ty@b4>
Date: Wed, 18 Nov 2026 19:05:09 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sun, 08 Nov 2026 23:42:28 +0300, Stefan Dösinger wrote:
> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clock child will be driven by the already committed
> clk/zte/clk-zx297520v3 driver and the reset part by a separate reset
> driver.

Applied, thanks!

[1/1] mfd: zx297520v3: Add a clock and reset MFD driver
      commit: f0cf38211337b303ce5b86a474d44a1f5ed77176

--
Lee Jones [李琼斯]

