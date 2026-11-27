Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752020;
	b=n8VrMx4DkrzBukOk0FhsSXZkTRJ8nFTsfEdaru/6QdYx1cc7u+H6eGoA4Y2txULRnidl
	 jBBHAxKWYp+zZMo5e6KI183QcH54vaPC0Gb7BuqEpJI3c1se20oOBkDYJJkGxZ6bnteMy
	 s5vTYAx/5bh6OHnYTNqp4EClKxMDJ3Uzocta9m1WR3KNIsKT+QcW88x0wsGmamEGcV5fP
	 Iff/PQ1QnX2ZZFOTOUvFRzkHBXkz4soqam9Yi+sDcNtJuDTZW43e/1xIIwdjNyVHQUx8u
	 uVSaAissPDA68R5WJ7PNEho+fFEh4I9LHHBBdoeOqLF+77LJKSuhSZqCySpaRkPIx8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752020;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gr7Hz++tDiStjPaoVXiYk/6tcC1sczwYodYZLOuz0LA=;
	b=TM6TZBCO0qxKYIeKD2xS+03evqVqVLXCpKgJZLzGuA4vdIY4+SFFF8On3qL2ZXmTTkmX
	 rv6zF/RiGyLzDm5REwU3QaJ1OAc7oG8GZsLPY4epPqx1311Pgd9HuNKkoZnPWahI9dUZB
	 95u2WezCSW2D7X2R7So0eguRzCumzt+3LxpkwevHGq7qGIPYxHWaSuOJkuXrQ2Yoe/mYM
	 pDUFjGKZBpIx+KuHm+gHGp+DGr2HlSaFh4Ncs+boK70jx/RJNWla8TRlp4Dd4+AGAUhK4
	 DqLKtFlmoCmfwCfCsBAC2+YhSq6C0+3qluzrNiI9vQQgqgV3Y2vm7lEQPBuDok1XYaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojUE9hzi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B479606A321
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 04:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojUE9hzi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8621F000C1;
	Fri, 27 Nov 2026 04:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795752019;
	bh=gr7Hz++tDiStjPaoVXiYk/6tcC1sczwYodYZLOuz0LA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ojUE9hziTRjXHQpIFyQ/+6o7ieOga8GDn1H9+WEpdaOIABtOm8akAj6IZuoyN5IvH
	 aHsr32aXc/ddZarVpFjMaMTaLHFWbyhzJSRzEKweYgw/hNnTO+2bhz4v0IaRkOWjkq
	 JWmelWFczq4dSEOtUvTLHDVBqFwcZg1CNEswYD4hBdCCV04+mnsD/+yS2OFzNCGOrx
	 0pnp4lPiXEWIhVmrnFGRZnp3A0it0e0c4dF1yON0JMpQudY4NdbUoWTGGi+Ucb/SUW
	 Mkwx/JAdE2XFTHHnTqknOwd2YrSBj3CQ0d+FmTSlMYP+6b2m/h3Q+Q5iWkjj1D+9bN
	 lgp1/zdfzYIig==
Message-ID: <sashiko-outbox-236570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] mfd: gateworks-gsc: Propagate I2C read errors
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261127115402117TMtE2xcPXch0CpM9te7-L@zte.com.cn>
References: <20261127115402117TMtE2xcPXch0CpM9te7-L@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 04:00:19 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> gsc_read() retries the SMBus read, but reports success and returns the
> low byte of a negative errno if it ultimately fails. The MFD probe can
> record an incorrect firmware version or CRC, and the hwmon driver can
> convert the error byte into a sensor reading.
>=20
> Return the error from gsc_read() before writing the output value. Have
> gsc_probe() check the version and both CRC reads and return the original
> error before registering the IRQ and child devices.
>=20
> Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127115402117TM=
tE2xcPXch0CpM9te7-L@zte.com.cn?part=3D1
