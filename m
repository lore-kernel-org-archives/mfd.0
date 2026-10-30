Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379632;
	b=FWNy2kKz2VBySzfJTnV08wnIqMAxlpZciLngAWWyi015qdvFdMHXzg0xPKamk35a+lLB
	 Wv9I9MhoAAONgJ6mMlCXnmeBXAIo9lLc+amFOUS3Fj+9UeRcd3KsJLSOVTV5sxhgjarIt
	 KLFQmuo6DkPQ2j5JkmjF2qBK2lZoZDU/lRczdSiWMcXZraxy8FSmHUEZa5i3+3qqFntym
	 n9jALkJ5m7t/oaH+bewqM6D7bPkBgkVjJbTcE3LHMBVcgMP0oD/ZxYJ4sAudt+0KRe9/Q
	 pnHUGu14GFjl1UBU0kE96iuAO8veo2z3jMnu/gqWZAL4gO0En6BtUF5A7FfT2XZHpDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379632;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5pXrr86pQS8mCryPR/z43TbYG8VM99IXAGLBhi78yM4=;
	b=YFdCpiFFuWgsKuPA1gLxHLiDSGHbZwmL9MdfILEeZnO9kALfzTh+gPD1KxyzQ/XccEWG
	 uFPY3LjDtzkscN1qkpgFyfDh9HhLBmSxUhT35fXv/QA0cHxhcczd3+9V+iqvMEtC+qflM
	 o5TBqbccwqWEXGnMffPy6zrGYl92g2LKiz18RKzGfKs2cJrDWRQYFt9EBeBxGrw3gcqB7
	 B+Xn8r3kxWuwLNNApNEcGxwZ6KnBRvkOTI0lN3z7qD47IuZPvh0EmxEHo9NmOSGNOiPlR
	 YfdLAu88crpUK/5txqLJFTfpfAUm3pX1LJCeDnccHdvNzyhunNByw3wM+hotUt8v25w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiqxogUt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA18606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IiqxogUt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0621F000C1;
	Fri, 30 Oct 2026 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379632;
	bh=5pXrr86pQS8mCryPR/z43TbYG8VM99IXAGLBhi78yM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IiqxogUtPftI7SEwwFG6q5SEqzyzudAEcWjGDSrmh/ok/TUCfsePbiIiX6y8OBLcx
	 7XLVY4pmnHKwFkQvAMX6548dS8Hs76LzJMp2PPieJqLEysN9lco42rKq56Ws3p23+f
	 vNVycr0lY9bl/OXdiMw/CFWoBwMvuBK4KaeckLOKQYdXX33PKcXnGlCqJ+wS2MM1n5
	 /TVMJYJcVQqDQROPH0/5KZEkwvIiBVJn2frcrIfwkgaTkV7bsA4pOLvgIBBN6f1VYL
	 OzegAsc5YiQw01ZyyQF8QvWOQkx0W9aXy08BWZucxUN4dupEQVWXsYLk+D1AqB2Qil
	 4Z4tCHveZblKg==
Message-ID: <sashiko-outbox-191297@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] mfd: stmfx: Fix potential IRQ action leaks on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <fb75e2706d7608956b5198c674fedd2f9cae7d55.1793377422.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
 <fb75e2706d7608956b5198c674fedd2f9cae7d55.1793377422.git.liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:00:31 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The remove callback disposes IRQ mappings before device-managed MFD
> children are removed. Their later free_irq() calls cannot find the IRQ
> descriptors, potentially leaking interrupt actions. Remove the children
> explicitly before tearing down the IRQ domain.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core dr=
iver")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI:gpt-6-astra
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793377422.mf=
d.git.liguangshuo@mail.sdu.edu.cn?part=3D5

