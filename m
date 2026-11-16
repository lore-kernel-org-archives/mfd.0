Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823265;
	b=MAJxC4wpQ6qLFcwxaju0R6K+8D4GP1oUAQpTV5aG0lu2qHvHzFHPkgtsspYTx6XYA7Bn
	 9kALX297/iw6asJNuoO42oNmTtCnd6mARpQfzkJpBkLRu8eH02fS0/yUlGVdomfldncfI
	 /BjLhCZSTw9/Pzvcg5lJIYIBcLrDs+btd5NwOnOYQwOraAcDjkiAk0RYQ3wDqWMiDrPXT
	 n5+IrlqP4Y03ktHkZP/2GpOfPRVJa3i6wL829xXVytdVNKoJcDpsqBY9M7zGds4bS+yNO
	 MSRLGVPvyG3pa30cRxIvVtLqeRaCKHPVWA7LZLj+vPvOSMbrgyNWF8S9DjLOXJzMfFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823265;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i4RVdHf/u3xTrcOq1B6DqfrxBl1vk9AGYFRXNYHzmqk=;
	b=NJ4zvIKzd/g8f6FKEL4SUVZ6e5ZoUS1mQOmR3Dn9Rs8A3ftN20x9kGK0ISrrNl1+hBg0
	 j9PCKyOr20vjCKuXbb29RuLxpI3c8ohd113daNNxx+FDFTv4KO1CJKm3ylRxXTKJIg5OS
	 1LyV1jA5UXbEvq2nng9lUxGks677Xj6k6Ao1sxaMOZHuCMTKWAsgg5sr/++tUprGmA41U
	 r4sB13DefmOZJL0lwA35/X8VkvonmiP0xedYMLxwTJzuBZ5u+MHDtsfQ2/cgTYAI+OW2r
	 lyiHE9C69h8KFZrqYJSN1+3T/12M32n+fOMmSgVcXn4bQy1xxg/Q62ksrUZQknQbI2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9mFxQUH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE16606A31C
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P9mFxQUH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9434A1F000C4;
	Mon, 16 Nov 2026 10:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794823264;
	bh=i4RVdHf/u3xTrcOq1B6DqfrxBl1vk9AGYFRXNYHzmqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P9mFxQUHbyW/rGpWz5pz7PJsAR8x4Q75eIvxsRErQ7AInKTHtZTBK1Tt0uYhO3ehY
	 i5nACDbh7RLf+JqMD0f3okliPXWv1I+Bmb2Fu6Y2oN/B2OSlqwZ4G9Ukgn692scoUY
	 AubTpedt/uLsyd44DyaOSlN3bUCHmHqTzGIB0Yf8HequLPEvcgduTmx3KwMrCDMyNA
	 JpsqUtXtUDD+t2uAZtJAtgYlUMk+s1KY9OY6B03OedCHXuyw5oW6oX0qGNxjf/DF2D
	 wx2Pe+N9VVMKmGu7IBPFk+UFtHJZC/4GiPOaE8dj6HhzvpVRU5dN8zHy0R3HhEYSUc
	 O9ZfRDpa80IKA==
Message-ID: <sashiko-outbox-216686@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10] mfd: loongson-se: Add multi-node support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qunqin Zhao" <zhaoqunqin@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116095307.21990-1-zhaoqunqin@163.com>
References: <20261116095307.21990-1-zhaoqunqin@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 10:01:04 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>=20
> On the Loongson platform, each node is equipped with a security engine
> device. However, due to a hardware flaw, only the device on node 0 can
> trigger interrupts. Therefore, interrupts from other nodes are forwarded
> by node 0. We need to check in the interrupt handler of node 0 whether
> this interrupt is intended for other nodes, this can be accomplished via
> shared interrupt handling.
>=20
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116095307.2199=
0-1-zhaoqunqin@163.com?part=3D1

