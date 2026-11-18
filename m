Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020129;
	b=hGed4H48X33SWsuWIYm4IOHxt/yt+WGPB4T3dBDCPU7rPuziNX22K3diVDSL09tiVOfN
	 FHQiEYVA0Fv187zAxendeezSdVz8vx6LQhgicDIvOXHFsCuzjog3yv4t+nTvDezOLVxxQ
	 qDsfmbJfvUzollREOvEaWi1YKae2F7hLZjBSR3ZRIp7UwIusbIY7PVOlDt+gyY0WK8qlV
	 Y6d+D4cINCTSQYpBb96QqvyZOnJtaL3bzuGG3x5hVbi8FYs/1LHfZV2itfVhB1DT08doI
	 yuFQNS1L04oHyVksPhzAXmkceqHgH5nls/9Y8W8GjefGVsNc1e2ofpAnlzfsIu0E1Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020129;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vxYtualHeO3gv4GebykBTwP0zlbQllse11HjT8de1eA=;
	b=JT9ymqduh1Fkcxdo7QgWbylh7X2gyd2bGN6uNCUeJcAKPG8H2u5A7NECBLJDKb3fM1Vu
	 5/xO2JtLM5cZNuSXvKK3zY0wLpshS5VfMzHrntmVeThq0H7CeyzhEJQxo6acq+pSyzc9L
	 VJlGJk3117ahyWs7E3vt4lNsciIbobmifr5ksqTfBZ5nHoHblKSFxLMkjNHhmzNGRH4/P
	 HrV329diYrtjK0L/gZ+1KykjqpqYSXaqBJjc8crfWyw3iyVFNSiEA37aObl6p4+2JJjHd
	 GKbpEx6CkdRWODTP+lVsGkYwsanHT4vR8N0oYTpOhCOpKDnLjdLg/VMgtRLJnZe+jKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9TJC0bT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEF9606A33B
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9TJC0bT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DE91F000C5;
	Wed, 18 Nov 2026 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795020128;
	bh=vxYtualHeO3gv4GebykBTwP0zlbQllse11HjT8de1eA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g9TJC0bTpciXnrSqIW/3zblwo728ojt2iDMPDtbmo4cWepippQGWZy/rkoNDDq5gO
	 rha0nNf3ilw0w7L/Selj6REINIYtuGadTz3E+uGg6jyPn045wHqG4PaJ7Ormbe9v+9
	 XRvEzXxjIwUkDrPA8cU3veyhS4Vc3gOIr3pNSKUVKcPvjDvo9T2DOraKXx6k0vC8XQ
	 y0LIXfRUKZNApgV7GDd8pFmKPwGlmihrAPZN1Vz0+woBKeX65EEvB/da4x9iKiViRZ
	 +0Lmek5PDLK5BGnF1LbptXSviFT6HEPh4c1rRqqMFuDwL6bPTpgyzxpWsmPYASDBbc
	 U8TpvVkbzGG0w==
Message-ID: <sashiko-outbox-221530@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: net: dsa: Document support for
 Airoha AN8855 DSA Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261117164132.47167-2-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
 <20261117164132.47167-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 16:42:07 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document support for Airoha AN8855 5-port Gigabit Switch.
>=20
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configuring the PHY page.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117164132.4716=
7-1-ansuelsmth@gmail.com?part=3D1

