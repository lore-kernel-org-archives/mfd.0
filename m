Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD65476FF
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994899; cv=none; b=YcFdp51QKf5UjPTg0vfxaIEvcrUcafDr3G+PE8mBeC2pcw4eh7mu1lM7aYUxW67+KLteygzrA6UHlMLOVfItQ20f+Bl39b9NhL9HXeZD8UMaxAwLK48RPUIbozIWEDRQpHfdmmGdmT91eoaYv82fpv2qlTtLKsH6yqupbRktFZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994899; c=relaxed/simple;
	bh=kTTU1hmTaDIoNrsIksVa/15PZ89IyxIpQjl6LFlKAvw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qQopKQH1KscJN/EqpeTLLG5QRyt418xagM7KIpp9wQTaIER78OnUvHLipERniXwC1iG2w2r3FipMWFaO6CzlCj5Wdm8APotWxHyS4/Lj+voH3VwjC/rJsONW0j4NoU4eVxCasWaWqwc/Zifs7Gr59n9sBU07KL5Ss+XOXGeHNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ha0U9MGB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ha0U9MGB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9124B1F000C5;
	Wed, 14 Oct 2026 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791994897;
	bh=K+jHIdjCSlsBqX3+bV59hpkukEj4sXEjo2YI4IaZ13M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ha0U9MGBCyYHYdAxKpWLlyadirkalsmWxvrthJu1c67T5baoodC1a2uX46sDWSAwN
	 hX0Um9gwaiWxcptrEst3xf02GINeQHH1GedozMHM6ZS2T1XZodXguXByrf70WW/TQT
	 VUtpZxcAln57Z8wwLv+J3TU0k3m35u96ZR5C4+w8EO1qDyoj2pbRbHeuhYnvK6URxN
	 UrznbkL8cr1dByKdL7HOkXS1eDq03Jue2+uZfai/tz+szZxCEDxCMu1cZ5mouM/J/X
	 L+VmcPi2BzaDl5Ow42mIfamb717MNYBF9ZLkwTyuBmQ2Snfq6qEQNGS8gMdx3LQ8C4
	 bFdT4sA6m75ug==
Message-ID: <sashiko-outbox-171522@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] pinctrl: stm32: program the EXTI mux from .alloc
 instead of .activate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ju Nan" <junan76@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014160917.139241-4-junan76@163.com>
References: <20261014160917.139241-2-junan76@163.com>
 <20261014160917.139241-4-junan76@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 16:21:37 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> stm32_gpio_domain_activate() writes the EXTI interrupt multiplexer
> through a regmap obtained from the generic syscon driver. The irq core
> calls .activate from __setup_irq() with the raw desc->lock held, so this
> happens in a raw atomic section. regmap-mmio sets fast_io, and syscon
> does not ask for a raw spinlock, so the regmap is protected by a
> spinlock_t. On PREEMPT_RT that is a sleeping lock, which must not be
> taken there. lockdep reports it as soon as a GPIO interrupt is
> requested:
>=20
>  [ BUG: Invalid wait context ]
>  7.1.13 #7 Not tainted
>  -----------------------------
>  kworker/u8:1/29 is trying to lock:
>  (syscon:117:(&syscon_config)->lock){....}-{3:3}, at: regmap_lock_spinlock
>  other info that might help us debug this:
> [ ... ]
> cannot be taken, which the .activate callback had no way of doing.
>=20
> Reported-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> Closes: https://lore.kernel.org/all/20220202174430.pf37tt6lua2op3gc@pengu=
tronix.de/
> Signed-off-by: Ju Nan <junan76@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014160917.1392=
41-2-junan76@163.com?part=3D2

