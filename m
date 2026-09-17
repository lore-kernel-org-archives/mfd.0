Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC30D4C6515
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641657; cv=none; b=FfCjKsg7oiGQWnEsI9vIDnk2MuoU9Nc0aypv8OTIDoX+9In555WbOJhsk4QMGnIHsAMhH8pvx1JRDfKu36GLzSjOeHno/ejWy3OtdXqoEljzPTM8yL9t8W7rlW+5WaPP6XvHq7b5kGkpke2b+NnOy9mISIsmAuXEm/LbU1ysJf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641657; c=relaxed/simple;
	bh=D2JGhTjw3p32Ei2jFT4xALigPKcg6WCOHtTxEtVV1pg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X7nRL6JmUTdtiPQHRjgzEMjWyZzcbM3WTuilb6Qd+z4r3+/e8QlrE0xeuSjZUNHF/wV9Jso7ttRnCxLZxr/A0yXoq+mjH2D9yEN+wbJIu7kl5rneZQz8CkE60NK9cQq9h1VBoZvTqLQgn1a3eI3oJAhzUKGgrAl2ZEQL4FC1SVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TbG89/UD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbG89/UD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103AA1F00898;
	Thu, 17 Sep 2026 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789641641;
	bh=D2JGhTjw3p32Ei2jFT4xALigPKcg6WCOHtTxEtVV1pg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TbG89/UDzP8RzaDw9eu+H8ohAJtt4aTP4NJ5GC8hghXRkH5XO494m1V9uCgr0Ssvy
	 ACSNpaE+Fh9ZTFnEFtzxTd7XsMgdSUgHaTeYkzTHEIJcLk6l6UB4w220oF1TWjv9bP
	 pI5/nAPbSjakMCPrjvPcOj+Pt/NvEJ5PGaGF4WbXuSymdFSUFpm7wPCmq4SUHgVhLa
	 IBfT/YFgBdvHrr2YqWgNMCoDFV2PbRDeWlhYhZrcbcfFXCNb5cY5tol3u5sFOReddZ
	 HvkrNpSdUkzzgRLc8R0LZWqh51YqiUzZ0qge6nw6IPEKKc4rjHc8YE6M5CRNiWCsCb
	 QY88aoaFVXcBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] mfd: tps65217: Fix NULL pointer dereference on
 IRQ init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260917103312.92624-2-r.zhambakiev@prosoftsystems.ru>
References: <20260917103312.92624-1-r.zhambakiev@prosoftsystems.ru>
 <20260917103312.92624-2-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 10:40:40 +0000
Message-Id: <20260917104041.103AA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
>=20
> tps65217_probe() ignores the return value of tps65217_irq_init(), so
> when the irq domain creation fails the probe still completes and the
> driver ends up bound with a NULL tps->irq_domain. Unloading the
> module then makes tps65217_remove() call irq_domain_remove() on the
> NULL pointer and oops the kernel. On top of that, irq_find_mapping()
> may fall back to the default irq domain and dispose of mappings that
> belong to other interrupt controllers.
>=20
> Check the return value and abort the probe on failure so the error
> is reported and no inconsistent state is left for removal.
>=20
> Fixes: 6556bdacf646fcaa ("mfd: tps65217: Add support for IRQs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917103312.9262=
4-1-r.zhambakiev@prosoftsystems.ru?part=3D1

