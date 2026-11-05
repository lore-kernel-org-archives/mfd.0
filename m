Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875858;
	b=cQSdKhxAORnCF3yngU1TZBN2z5zzPDT+TLfsKNhXpVGoQVx1RG93fNLKKqQDEP5jN1F5
	 +Sz2ESaVtK7vH/DaLrf2mzND18bnnhTzDRZK0J1A/Ljp+ry5DVc+MngnBA8ljkbz/jciW
	 Z1xiLvizIjiw9ul5gwabvZt/BoBJ4C4AjJauO7R7F+DyTtgVtzq/Y4iRgo4WjEbxd/9r6
	 Aw3DADaEYS5VOL04JwXY/tH4BRQNHm9WzKgbEnAWGm+GEPxlxpfsFDUaK2lzwwRSRbnGP
	 7XIFMRcIYNxzgNs4C26mPwW3G5S+YetC+aEUd7AYMAqcqYwi4w6M/E5PjcbizSWS2pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875858;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7egQVtlUUdEKGweFF4ANSyy66IgAS8DrO1NMA1le/j4=;
	b=Iqu+VMFaT0YQRPQYY29Ir3P5GgSNF1krOKpLNNjddq4WskOBTBe55J3oNG69x3dfY76E
	 vJ/Y6JNJZp1kMutD04htib6fEMDI2xEFW6IOz1TkGH84ogfD3HQJWMKRcSVo7tWoFu9nR
	 sX8/xVisTn8BTbPallyPMhN2DhmWi2lG7ylbvLSIUsLYjU9f/5BDIGVT3QMrH6U9bMPmq
	 SkFhfCww8hicXTWHaMHi5R+S0FOG5AXntr5PxmAUhpQWTpIUWDCBnAorggokHlmJsjeIM
	 zYjccLtwoFrIbJ7vYzJtCaUnVwf/3o2gk18SzFJy4GRC395oVrCnskcIGYrmVXeX+7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfebwO+L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC054606A31B
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 10:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfebwO+L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7009D1F000C1;
	Thu,  5 Nov 2026 10:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793875857;
	bh=7egQVtlUUdEKGweFF4ANSyy66IgAS8DrO1NMA1le/j4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XfebwO+Lyq2l21Khr/DcUIu7vfYpSYLUsPwvMLesrIgYqqpsKfzmGu9WLdOYRgwyJ
	 arDbgfvYT7ab4u8B212eN2puUswHkRrZRxVFTS1cVl3eymuomyIYQO5aU7W3Akr0Mw
	 n3iAnwCO3z03dCpdohs1vF6EiZk72Udx7MuN2oyoUXfepccqzcu3cSa8eVSVToV+fZ
	 0gFrK6Qkgj19gD3Dxtw9CUZV4hV+9BemF8oxs7eOEInzPqf+Aq2ZZ73/myAM7qsEnw
	 oS5eyoSfnmod2L6RchTt7MTm41WdhJTUKJqq0vLt1g4/ELr3FyDuDVKxZQmDH7Y89j
	 ImW1cLcGjIvlA==
Message-ID: <sashiko-outbox-198886@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105104837.1105227-1-l.scorcia@gmail.com>
References: <20261105104837.1105227-1-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:50:56 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Use the MFD_CELL_* macros to describe sub-devices. No functional changes.
>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105104837.1105=
227-1-l.scorcia@gmail.com?part=3D1

