Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432042;
	b=XhnQUxxEYeOLZ6IwXRIjWZoEmlz0Ri+nwWp4H/WQkMG84dKNwsLY98RbvvgsEArJc7ZL
	 aOyx0cn1dpa6yeDPCZr3qtjTmn8ogBJq8ShPPvmRcqZTF8NZqCI5vx/CSAVyg6yyIitM8
	 Q6qCc4K7bAapKupT/hkz5ZtwoeA8UFLYSlAiZgjK6WmuHrEi91Bn4P2FI2xKO0rWlax9u
	 PK25E0dphQCmrnJV4bZfiOWC1Qt8ugvPOhpnej6dFp3/u4PqFNc8uMvwOFueRpUDi8l5l
	 KrFpB7OA+wZhcpey51jftypbLyJgnDEjK4rHKM3h2+hIk+xMbsNDqg5wF0RwRRDYp0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432042;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rwkwlOBwVS8z4G9GjSK5oW8nZZc9ccEpxttpeaHCRdA=;
	b=K3G+gCsL+GZSKYMeHiXwj5+W+Tq8NK4L/nLOH+5m6g9wPs1uFDuEscA3yihy5V9FoF4r
	 sSJExrzBQHzqbiEs+p1qKuidbpVl8A6m/YwIjZBB9uJspngVQmf4zy+teYVfJgxx5ktVn
	 GRJllvhEUwS5DjaMLR6VvJ9AlLQMOeZ5KxZwFoHw844E5wZ8cvr8awPDv6HEGad/ZRy0b
	 KMjvZC281wk4Ld05hMdpnfecmBwJbn4l5hU36dYRgPiE0wNFXfvPSPVnBDzLxR0O0YkNY
	 nCLxr7/aQBO+g0tPNuCemEE0yxz5HlY3ATC353iWrsgxHxzR4qVDdd0aq1izzZk+xxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPHVAd9Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71188606A326
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 21:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPHVAd9Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36951F00A05;
	Wed, 11 Nov 2026 21:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794432042;
	bh=rwkwlOBwVS8z4G9GjSK5oW8nZZc9ccEpxttpeaHCRdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPHVAd9YmU7b9ub2hL5hoHQfyWfSMQURGZkdJK9Mr4gkjJ/k9fHRnubQJWRGYtXBX
	 GQ2uniPy5/4ei+APuWf/IeIh7cQOAlxiYMhUekRDvqJ3szILl0JZvUwqrNOKUPuECi
	 OofK5PY6UrmZXa68q01lWOYTosRCwFcV6F/Lq1QmLEs5SMLAZACC8TeZI3GnT/6dbF
	 0Mnvlj7qINcKJ0zodrtlSZDphctf9Dm6gFVKTUAQwMn/Z3mFPZRTmo8GsuwsktqY0m
	 0zBmrXZnrKVg6MWKDw3JmOA0fRfZSuw91LtsksDOZeglzUSDFx0hple+XpoWjuj5tU
	 ov8EtPYFeRPCw==
Message-ID: <sashiko-outbox-209696@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 3/7] power: supply: rk817-charger: simplify
 re-initializing coulomb counter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111205627.56652-4-macroalpha82@gmail.com>
References: <20261111205627.56652-1-macroalpha82@gmail.com>
 <20261111205627.56652-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:20:41 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> There are multiple places we re-initialize the coulomb counter. Create
> a function to do this to make the code easier to read.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111205627.5665=
2-1-macroalpha82@gmail.com?part=3D3

