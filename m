Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428482;
	b=yefVE73t/7vitrlvTeyoolJqqONaOBV6LzeXE3RlxyOP7lym0c1TGB+7TlHuyiq/0SeB
	 Q27iuIe/aaZkk9fg/D0JJpj5ZREgEHYVH9dGcsl7wT7D9rJKjCBIeLDhYUrcLfjQyuUuA
	 c1wLlDtfy+EX3SHEYIznAgPKFYdgyjPzB0aOIou3Q5k6mPcIaAVtKDEg6w3IGqxVTcCRy
	 IpPBtfHyLPrICzf3wPWrIizG1fAoB3Zhhi9TGLfZYycJQauljwC08Wa6zgG8+IhwsnNr4
	 8I8iCre/ry5xZX66iYHg4CHupl+g5keYkGGF60IQfPhOvN7jCrJI4kFflxTI77oOZoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428482;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0crR4pyOPhPLK/3BhlOzNwHk1B5zteem+/T4wAfjteI=;
	b=Qnyu/2tq1Kamy2C2o+SXxCB4DP9Raxp5Hr1HH49oLmE9ivlXKMIr++G5maIXxzGqhCpZ
	 oWdsv9PivyN+TqjrJJWP4kRhYXdilocFPN04d4UZzRhvHxDmGpO4yCn8Lkt+JasrVQLF8
	 9jw+cYw5IBnlDtDFyIJSYD7CBMvLA2KsX9/YNKnWsWHPXpI//EoHSZKttngKFg9Tb2JY4
	 qaMA/cHDRfx0EwjshX8SmY3VkhOuVzeEuVkRAAnlspYczbMh1tV0RdhkSb9ZuCv9EyBra
	 kPW3Ino+4c2a2p03rCODcpEDQL36I1zZiNTu6xUaQ4JNpHtj3Ty6DA7XTi5fLMaEu6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ar6NJjix;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB8E606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ar6NJjix
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E8A1F00A06;
	Wed, 11 Nov 2026 20:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428481;
	bh=0crR4pyOPhPLK/3BhlOzNwHk1B5zteem+/T4wAfjteI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ar6NJjixumzCETR919+0yDTyzU1kLE/idLpTwbP+9VSIfo4ME0cnkTBiXK5mmuANR
	 2VVRRfCdrNsVCGyAL4PhXmV+FW8dgLgXAlO37NbFAImIrhtQr6+0SMGCunR89ax/Aa
	 jpvo4kteCpJuEICxKPZna2YygaxVRKhumQL7YOUXWTlSHgGIYP53eWiXxIPWY21zIg
	 5AY6PZ0qIzrxGOHEZcj3esyfd2eXMtZKxJj2X3QIN5eW/kCER7I1H0Th8HPl3lRO0R
	 G7LjrlSokNRHZDbn1XM0709O8dygwN9MhWxD3B9TmXLB7gk7I0+APpn48nHdJKQ8aM
	 ZOOlG2fX8w+xg==
Message-ID: <sashiko-outbox-209638@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/12] arm64: dts: hisilicon: Correct DMA node names
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-9-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-9-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:21:21 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Use the dma-controller node name required by the K3 DMA binding.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D9

