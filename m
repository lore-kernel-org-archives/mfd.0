Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585289;
	b=goU+iq1sL3ojlqkod9foCIhYAXjlx8J+gnnCRasfrDASiGXkjSybo7ndJ4AAQJ2eu6I0
	 Qd/8SXCbs2vznR6yjRdt0uKUG1mmJNQiXvUucmPOXgfdKdTjy6mMRM5ptPRe0YV5EB7E7
	 qKdnPMTY70crTZdOjalSCErzaOSpwlQhaHC/TXTnU8Vf9MpveVwFhBc2d/Zs9jQMyYaNa
	 twqIXEOst4qbU0p/tcJMOLCaTiwfhGvusxFWc+IowdNfMniOgtpgyphF8jf0iu5iI3iJv
	 HCwJcCJVV5ZU+2FkIkWgWDrvGQzWKth+ytVMbf0LrL0n5nntm0bPA7mXQ07x3wQ87Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585289;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JuceC8CmEVGY75F4iKsf2IYJFgIgMBtoA+A2rIydFfk=;
	b=2FP0qq3bnp++xjLtY5nwPhM51se1xeH/Flnl/Xmx2uaBQHtjLLlR0okVYkDvpsHEW44y
	 Arlh5tH9c/QA7JTMKwLnStBlMBKdhUOkJix/aj7VUhAojs5+A46rd56E0syVClYMqU/Jk
	 IZyMfvQ1ZZmx5Nta0QF4azXlh0OGiis1SEGSQBbX+AyIqI2iT+WV/2iILeEaLQnFC8YxN
	 fwGtxLuT7qEsleuhlPJICP/gb4UZYfOMC92h0fYuH1rtPw2aqHSEm86rB0BsxOUuUAu5S
	 bcBBTOs+I9zAbepym27O3egKU4GnK7er4pGkOEV1xIQ2xy+Nh2X16iABZ2TMAkocPaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fRkofxEn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921BC606A31D
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fRkofxEn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EAF1F000C4;
	Wed, 21 Oct 2026 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585289;
	bh=JuceC8CmEVGY75F4iKsf2IYJFgIgMBtoA+A2rIydFfk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=fRkofxEnBH11M+tJ9aDRJFGvKNncQdyPUWa8igtQHIXo/N5Yk5HhaubPhV+JR7dRn
	 VlfnRxqq12hGKZgAbiBgewmfmHlczB7gCeCnuHclWTDk0GzHA+4Jgdo3M9OIbk0PaD
	 WHXo0dCHHs1eYBoQJWsHGj3+wOG3TLI2t4sMUlBc3nLJBOUcsMebFaXO0zoIbTN7dq
	 r4A6MLFajAOWfSrOhnmFFF12LJpc4fCASpE23imiD8KWTYsMN/nC7A+i5j55IAVcyQ
	 1Od6LPkkhM2OcZV5QAd6He9zmWgBpa3i4ZOBItekjTnsY8T3F8pErfVWe0uCLrOe9w
	 FKHoFPMoJAQpg==
Message-ID: <sashiko-outbox-180231@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/28] mfd: loongson-se: Zero-initialise controller
 command structures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-16-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-16-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:21:28 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> loongson_se_init() and loongson_se_init_engine() declare struct
> loongson_se_controller_cmd on the stack without zero-initialising it
> and only populate a subset of its fields before
> loongson_se_send_controller_cmd() writes all eight 32-bit words to the
> controller MMIO registers.  Zero-initialise the stack command structures
> so that unused words do not leak residual kernel stack contents to the
> hardware.
>=20
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip =
controller")
> Closes: https://sashiko.dev/#/bug/linux-b81dca3d-6812-43b6-9ad9-912727674=
154
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D16

