Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432634;
	b=nlrf77tJajLI8WUU1J3KbAQAb0u6z1Asg0NVVjt6V8ilT/Noqpde+RhoMsGllO0M+miA
	 YrBArts1EucXZx2i1cgsQ7drz8SIIuTbX1zfmYfnnKn7AA/+PZdWiQ/tiC9hjmUu3R0z9
	 LTB6jlkz7KOZbLIzSNEqC20dMT14Gq7IiQg2uSrT4mLZFi8HRDHzAB23M8uN5FnGp+Vkk
	 z/vrMNwE69UmmCywJorvRtjMYROkQqu8Y088GvGfoMXMBbFwk3v7krA8hmQ535EthvIaM
	 jXHr1nI9wamCT7q8LuOuJUjKypX/Do22BZ1cpCGXdalWOH7310sgZ/Y6ranLWPu6SLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432634;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VYhwwI8UH/HBry1AR/WihjL2nwO+kadUIsVeLyqq7Q0=;
	b=Dl5C5KILbagOpJn6oeAQ0BZ9K6TbTh5ql5y8n1Lb2qF8o4uj5JLgIYuE7dcKi8+b+zF5
	 H9PE/71NibFG5fjBEukMYkeXCS6I8l2AZ8zjgCZL4PqX/1xQyPjRT/kcSrGEv9Yx3y4vX
	 w4BeTwC1p/cn14phTvODcnamoJFwnqvc3wuj2oaaObVtJrrB0fdmGDp2zGfJxAaRc+Lyu
	 rcbQ4qPILFrmoO0DENImgEXWOxOKkHxihXsn77vDE+vDHNuG280z9gGbIYSPMTKHzVo8M
	 JXn5+JREZL6kmR8cL8g1v6rGfJAYUaS1/REvUBpFNWLCvkJ4CRCogXN55ZPJYzIf4ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTcjdIgd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D02606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTcjdIgd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AB71F00A05;
	Wed, 11 Nov 2026 21:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794432633;
	bh=VYhwwI8UH/HBry1AR/WihjL2nwO+kadUIsVeLyqq7Q0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TTcjdIgdFJWe+pkxRdYrOSVI+qspPpoReeHzcn4QHdFVWRdQHRxYl+OSCkeUoABWW
	 X/5xpmemlN3N03jXn9ze+Kkx9R/YkWkwR9W0TJBDyBvMqp2PvoMyGVJat0F7RJ1GXX
	 n+mjL+9O4mInuZYDHLJ7WOYri1lpDTyylY06gtYId9DVP1XkObjWZd8AQI1BagVV6h
	 zU/9roqcxe+JPVh7ncv6JD+UUBsMDdYseRu7cdu2yai1THfz7OXXO5pXUhUNAM1FWI
	 AbdHNz2FE5nNAvtYMPHxR/tqzP5fAv7YMpmejxBqJdvnd6kuCRID4LKHak82RcDEYR
	 P8Jw/kNvVdsPw==
Message-ID: <sashiko-outbox-209710@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 4/7] power: supply: rk817-charger: Resolve boot state
 of charge from coulomb counter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111205627.56652-5-macroalpha82@gmail.com>
References: <20261111205627.56652-1-macroalpha82@gmail.com>
 <20261111205627.56652-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:30:32 +0000
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
> The boot state of charge comes from PWRON_VOL when OFF_CNT reads three
> or more and from the coulomb counter otherwise, and both fail in the
> field.
>=20
> PWRON_VOL is sampled at the power-on instant. A power-on caused by
> plugging in a charger samples under charge current: on an RG353M it
> read above the pack's maximum design voltage while the pack was at
> 74%. An RG DS was seen holding 2.63V in the register while running.
> Either becomes a wrong percentage on every boot that reaches it.
>=20
> A negative counter was clamped to zero and reported as 0%.
>=20
> The counter itself keeps counting while the system is off: the same
> [ ... ]
>=20
> Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK81=
7")
> Co-developed-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111205627.5665=
2-1-macroalpha82@gmail.com?part=3D4

