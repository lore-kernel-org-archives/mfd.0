Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909758;
	b=fY8/vF7IQhZ5bNUGq5B/8ofiqDioL5X4Dc8TjG7S8eBsXcNLij1J8W9TPd0qUDTIkmib
	 ep1drkWimJFC3J5SdukFYFYGirbglwTbQXDJjA7F/g5JjenZEIyfdB/3anpgigMTpBt2s
	 NMWj55Q4yzkF0mgzN36EPBgD3i5fyx83jJvQQVi7n2L2q9e1rS61Yx8OrQF/sekuonfEz
	 SXUQM3lsG6TFEvrnAR5YRft984JeWKS7ehn5mc6ADz/SR1/z6Bi+0vbALsKDAfaLmBd8v
	 g9n6KWuOb6M/vN11T8X/x7c11WxxjoYGJF8MRQ8/eLx4zMaX9xasDENzZkOqPsZywSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=biJ8XcsVp733Y5XKhb/XwuiyVwdRY3DBMiaFqw5fHSQ=;
	b=QOO5f6WFh1XIeupWg4YC1CVHqiobIbReAu81VJwk6ozhZ7Yf0VKR7okOcRYHNZ2bS2or
	 MIFqc3JnoJoEOUQWuvRUdaKo9IhofxIbha1CLl+Sgwbab2hgQS0bviMOlgmis6+Tg4YAk
	 K+0nUDphJEbyV28Oplia1FBzmtNCte/MVyxTRSpxz95azvBrUI9Dsryr7sCWJYgYhToVF
	 GAjJiUeV3evM3t/AYPvjhfoW4gtcaufxUWhTDWAYJv/JW6/ZWAIug69QN4YBoaMG+eINp
	 +m/RIr9nadSHNw3Rr605LARWNEb6ASsCoYFPYyiHUGYD5cayP17xFbX14NsFM+Ah+9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oESGPwJV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAB8606A31C
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oESGPwJV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD471F000C4;
	Tue, 17 Nov 2026 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794909758;
	bh=biJ8XcsVp733Y5XKhb/XwuiyVwdRY3DBMiaFqw5fHSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oESGPwJVOqQwE8bQmNZnCc/KxMAZwSXGB7wZcRAU88kMAMiWzuXVLuwxjOpOGAFmG
	 an1CsBbyI1kixa39jys6ND15WahAbISnunYUUjgIbBZDUOrAbx3q7g+KuWVXnmhxzW
	 8bgq/qeeDVKRiBbADESrtqaCMhz8DQ5nIjGbOzEMOU5svTT7bClOj7zgLeYGSST8Jm
	 eeCmjGohOgHRE0j6zG1id1gazAuWuN06Dd/KRwaT82e/dHjQRaMy4a/VIqp9QH2Moh
	 AsedvAEIHYWRJKLobPtA7JDWwpcrhzQVHy2bac8AH1+U5iEmQBny53HQt+mAgdVIQP
	 pLfcYJiGIjjuw==
Message-ID: <sashiko-outbox-218564@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/10] i2c: cgbc: Use real I2C bus names
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-3-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261117-cgbc-i2c-storage-devices-support-v6-3-bb070ad3e9aa@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:02:37 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The adapter names described the expected purpose of the buses ("General
> Purpose I2C adapter", "Power Management I2C adapter") on conga-sa7 board
> rather than their actual names on the Board Controller.
>=20
> Rename them to the real bus names "cgbc-i2c0" and "cgbc-ddc0", matching
> the naming used by Congatec.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 6894f640b8f3 ("i2c: Congatec Board Controller i2c bus driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-cgbc-i2c-s=
torage-devices-support-v6-0-bb070ad3e9aa@bootlin.com?part=3D3

