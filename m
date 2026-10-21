Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580306;
	b=gl+lShjAhUvTX4CJMYSzy/xaeYEvB4FObBLDU8W5OZO3WgXk14uOqjdiKbX5xVA8kgE+
	 gvoDeNY1zp9h2w8FdnRZ+qEYrCEjOpSnrZtmUF4jd4h57MJrcN4ucacQpnjb7Agn/jGLh
	 qwg2qk0U5dExKjL1/5a+bcXzxScVgpDORy+nJGE8nlXCRf9XoL+yjIifCGarQDdyIfYe8
	 3aI1k4qXcshyAu8HVMiHDllEqZKKESKoEql9xrTyM84vkjt3JmQgxL5Bsq+uyqzrgfdgK
	 ZlRVHRyx2olAdoIWvDODjFqbVnaeKca9ZbUd+F+YkxAo/WJKlXLu17zL6KlNALGNQFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580306;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eiL9h2ZJLDyrtVYk9RxU7EGuhHZsEwXw6VjtyqgDREs=;
	b=S7nbs/7+10wnVn66O88wt/6FQGDVTMZ3LEMdw00laLML3dMv5W3pglVeUXr79SqEDsZu
	 /DO62pcoTke1h58R7Q5WDeztxAZi4bYundDhIjqCNsyp6uEYEWvA5CdC13uakelsWoHTL
	 bDAapyO64BxexAi4/j4zrAtpjhDfAJcwCegY1McpeqkNYieRqmrPYYTIq+mfL8xDiXNm0
	 biue/jRZhlkkCRokGBPajQdZDb1zQy2WCwZaqxoyYL2oZyXCsm3ncECUiRIMLWA8Y4/+r
	 W1TvytZeF3uQ4lP6j5KH2ltZ+hhETAuCgRfFTD1bve5BUWohuiOcV2YH+BlnI0vHUgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=doFg3JsP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6C8606A320
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=doFg3JsP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF101F000C9;
	Wed, 21 Oct 2026 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580306;
	bh=eiL9h2ZJLDyrtVYk9RxU7EGuhHZsEwXw6VjtyqgDREs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=doFg3JsPzR+vlYWZIDwyP9sPJg+WnUztRGdiwyYDeux2jiShvH8kI+3+oO/VGukq7
	 tKdD92oIdgSN8Z4vPZs5mFgz7WKZrjgRLElQHhYvpzGj5bLjsbs+HRA3RjRgDzaAq+
	 IEBqn8leHVNNQp3a2tmZTmuQZwr9vUgbr4N5NkNM/21lPxXA4z4RsWADWg4L1x3H9F
	 UDqA1Xep0ALoS7HpCA8MVXMC51s+rJ3w31ZLeCal/idzoMKOZWb4sEoBvzn3GoP/qX
	 x3C7hS1k4UXU3kis56pS0WnEgAzHte+7/5tOEDSRvZN626eQMobmA2PU8XWf0i2BKy
	 Xmv8/MmEl0uig==
Message-ID: <sashiko-outbox-180134@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261021105109.199886-2-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
 <20261021105109.199886-2-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:58:25 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Describe the MT6392 PMIC and its RTC and regulator devices. This device
> is mostly based on MT6323 with some similarities to MT6397 and is usually
> found on boards using the MT8516/MT8167 SoC.
>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021105109.1998=
86-1-l.scorcia@gmail.com?part=3D1

