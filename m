Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592934;
	b=5o0oBN1WnhKo2e7Iv2+F50ezqwRRupxapfvc4wDmJXOu2vygGTn7T0Jdxz3adM1xlJmb
	 I/GNot7w8gWs1kcTpjcg/V5WobcmqaBbzxCvWgj24/er7B7JBF+JNRdDF6cuhNsOhoCJq
	 MuOOKKpPvzRbffKSRZq9sE5ra2HCNCNesaAhx1bu3lcrISAObEleoDPgU67CDbbPkllKE
	 1tsxpp/Jmz9E6BfUrbq0Vr1OvRu1WYS2tU3UcXt11nkMlyE47hqT91YjdupFZh2LNWxXj
	 j3JSdYHdE4ekyfMaVwRv+EQnYcFKOua/UU3XK1Eg5e4+nySx5yQBTmdN6UUGWwaIrGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592934;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pJV1ukp2CGDyr0636q2FXYQvFiU70D7x6r9RFpVFe9w=;
	b=rHYn3GOzmzk9xjjqRICt/gmvepw7x9If1nQxgQQ7Gpd/Zxk/QqWmvECUn/eQCfhtFmgL
	 tIWVvctfxsrar/sP5WqhC7PNPiBUf47W5jkAb71GwRO1fL/G61gJwGY7wUU8PHEXJg7Ee
	 FANZOmFuZvk3YgZmcff+ApXao0AlTMFJv3Xk9kLQJ76Ig5psaAiRAu2oxA3d/0FD7zXUl
	 WUGfyxHtOz7BToY/ZOAvQXeuy/UH73lHVE2koJFEPCh+iTtgQvb3YvSbyHqe56HetYBO+
	 MmEBNUYNwAMoDNOS+ZFeGEYjYVRRzoTCk1Ee3QGS67WImUbKk/hUl9WG22iEl4wEF6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yk4nFxtJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F2606A882
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 18:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yk4nFxtJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64D01F000C4;
	Fri, 13 Nov 2026 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592934;
	bh=pJV1ukp2CGDyr0636q2FXYQvFiU70D7x6r9RFpVFe9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yk4nFxtJ0ef/+rxeSAsbyGreS2dsmpXT5Rth3XnSBcLirrrWpW71YFyN1vJxG7ovu
	 HunxnpnExlUI43GJoGOrNuWdfb7GRzUjPZQ1OMrHBjb1k+NXPKdQW7ghYbO41szXb0
	 UoPMWJJ+aod5ZskysJKPY9rxXNg9jsK3kRJ7LVhKuUGSBupr7hHpWt+VJLL3FgM0xf
	 bfd/mIFQF/Hudit/4qz7Bw/UNz2rSsrWj8wW1IDRM5hPNHrm4vkE63MEpe3n/9jfij
	 RgWOZM0l/VeghHAW2tKnjrMUjUtjcpCtHD6SPfky0bBGnCYH4dbS6/kfYNMBGDhQeo
	 cPmA0To4GNcsA==
Message-ID: <sashiko-outbox-213369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] mfd: stm32-timers: Use
 dmaengine_desc_set_callback()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0Ok1VTFRJRlVOQ1RJT04gREVW?=
 =?utf-8?b?SUNFUyAoTUZEKQ==?= <mfd@lists.linux.dev>
Cc: lee@kernel.org
In-Reply-To: <20261113175712.4189110-1-Frank.Li@oss.nxp.com>
References: <20261113175712.4189110-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 18:02:13 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Frank Li <Frank.Li@nxp.com>
>=20
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with a call to the
> dmaengine_desc_set_callback() helper.
>=20
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113175712.4189=
110-1-Frank.Li@oss.nxp.com?part=3D1

