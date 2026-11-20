Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212131;
	b=X9lC0W2d5hGFC9ZgUtCb9Bd0J+Nr/QZ3EbGDdnfpU8ygAGlozPoaeW97XA04CtvdmTuH
	 IhbyLHxbtjFckY2cWH6SmabfKbavbLxhKOnK5H2v8AQBcTj+arKE/zUNkORA+sVSVMOBh
	 MpbdFCP9MPtuHfBXfiyeuXtxWhsyIdUGEJnPKuEwURJE8kO4hV9s6Sz99lTRbMXmFEgSm
	 PI0oMB1poUG5kuHzx5ZTJU93smkrPswubUrd7v3QscLiRvBmkvvrC/adVCu3AIzHvVqyD
	 xOrGp7SdywXPPEj79jEcZAfbu5Foa2K+m5rmJInNrFmHujSqxE2C5EeS7phrrNv+7eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212131;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Yejfk8k+tbdKxDBhaMfBIctZQ35hR8OQpZV6rI52QBU=;
	b=Uy7DBtrcjJYnnuXapE6d02OWmEkYSEqX5Y1flO2BP6E0/l2oNUVhmYB4Rx9FfeJzHTnn
	 ak+xgWQSexzNGKH0zQWnyHabwVnK2x9peb5lzM5U9JDeTgDf57ld+cV9Y0MuwVt1ulq9I
	 fuolqXXPeEa252yWTLvMmTek1Kx2GKDshr43M7ot5fBs19Dn10VnAmfYjU2T7Xy7EuZc9
	 rnjq+nVI0Kgl8jfFaeE0Fg14uTsXRjSS8V4mH5pFSWfMJ3NIEWQOLEBOLoHmORGIuPYHn
	 Tl33eSv3m0Z5b6QghokaLT92IN3tlWMABWI0bmzFnq5aaldwO2IAOSOerwlie1cr0ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLSezYVr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F4606A6AA
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 22:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLSezYVr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D0E1F000C0;
	Fri, 20 Nov 2026 22:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795212130;
	bh=Yejfk8k+tbdKxDBhaMfBIctZQ35hR8OQpZV6rI52QBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PLSezYVrUJXQswp6/LTdTw2sR8gNdum2JcFtml1RtOS3d8knQNxzx1THJooMPUY7L
	 1uiGdxoT0knnDPdcK7y4AT1GT2JJMwGGlPaQ9AOfCckYIJImfi4czv++jVjvVYB+ti
	 DUgaoB36zakDKbX4TtW8K5y+XbcEMBQSzN15knCAwlVAoChOStoXIe0izwk02pt0jk
	 Gcd4gE3PY1IXbSMXSSPWAUCOjY4MjC8fbmSt5MwaKBRNRGaif6da3+U6p4htAH9e5X
	 UzGUuwFd1LoA0vGK0V9GUp/rvZ43Mr1YCdrX+J4G5yd6hzYo0cxgM+GsA7lTam9Amr
	 aH/uRLJK+PGsQ==
Message-ID: <sashiko-outbox-226216@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: syscon: Give each syscon its own lockdep class
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120-syscon-lockdep-v1-1-aed779a004b8@gmail.com>
References: <20261120-syscon-lockdep-v1-1-aed779a004b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 22:02:09 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] mfd: syscon: undeclared identifier in syscon_lock() context
  annotations
--

commit a05c15e1f84840a481c30788a689c7e2574c1c6f
Author: Arun Iyengar <aiyengar1990@gmail.com>

mfd: syscon: Give each syscon its own lockdep class

This commit gives each syscon regmap its own spinlock and dynamic lockdep
class key so that lockdep does not conflate unrelated syscon instances.

> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 3ff4e024542bf..34f278dfd2a84 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
[ ... ]
> @@ -29,8 +31,29 @@ struct syscon {
>  	struct regmap *regmap;
>  	struct reset_control *reset;
>  	struct list_head list;
> +	spinlock_t lock;
> +	unsigned long lock_flags;
> +	struct lock_class_key lock_key;
>  };
> =20
> +static void syscon_lock(void *arg)
> +__acquires(&syscon->lock)
> +{
> +	struct syscon *syscon =3D arg;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&syscon->lock, flags);
> +	syscon->lock_flags =3D flags;
> +}
> +
> +static void syscon_unlock(void *arg)
> +__releases(&syscon->lock)
> +{
> +	struct syscon *syscon =3D arg;
> +
> +	spin_unlock_irqrestore(&syscon->lock, syscon->lock_flags);
> +}

[Severity: Low]
Does &syscon->lock in the __acquires() and __releases() attributes fail to
compile when WARN_CONTEXT_ANALYSIS is enabled?

When CONFIG_WARN_CONTEXT_ANALYSIS_ALL=3Dy, __acquires() and __releases()
expand to Clang capability attributes whose arguments are evaluated in
parameter scope before the function body.  Because syscon is a local
variable rather than a parameter, syscon is undeclared at the attribute
site; the annotations need to reference arg instead (for example,
&((struct syscon *)arg)->lock).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-syscon-loc=
kdep-v1-1-aed779a004b8@gmail.com?part=3D1
