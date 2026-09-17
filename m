Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312264C33E0
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641711; cv=none; b=Z2qUdOuahcXLNVf234Bqrs2yy7gWnS8U0tJrcYI/VrnenWEzR4Zd7iaIEfvPfuYkT/jXA54NMJ2OaKiXmisA2bram/60IxpKm+a8rbUnfKQfTsoc/uNGQUWpEAwMO+rWVvwwcSskRITdcc+zBEpbm5LVjYY+gsFQANdr/6uXKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641711; c=relaxed/simple;
	bh=QLR900jc96bi+QzdxIsHeofsr74EfT/jKJnEuzTO3dE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OSMukTrZNR3yrGCrI9WV+7dg2KMp2NDAXKzq46xCnC0fF2LORYQ+p42zrkeXxSCBIjM/4THNmZy9jxT0mmeiwpjE5u57H7s4FtIt3XR1EgrmB/ccUISm5UNsLixbVdE0PS84BcYO6/Uld81DAMlwYqFzxkcF8LkuUvktmVe1UC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaPN9fvg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaPN9fvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77231F000FF;
	Thu, 17 Sep 2026 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789641701;
	bh=QLR900jc96bi+QzdxIsHeofsr74EfT/jKJnEuzTO3dE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kaPN9fvgzX1UBpr8Jx1KTumqullOEJye06IwuB3w0pFx8CQnLFeI43odZ130/MOkT
	 eZybkCEO/FlP4GQJhLg3+O64Z+6rFxoDwpY3ZVwmX9LNjnNIBWtOizLNucDwxUszoI
	 8riGih2QyNC3Wb4dP24s01dHGS8pjMY2kmUnDH1sv46Mueo7nRWFNJAP2C/xyoCIvH
	 eCYC26XYOhNbcReCK1qXNo3o8mMRB+Yeq1j26t5upoJhxTqvB4I/AytCZ5vqHCJrfs
	 RMzAX62n5Hf0keOLlGe8FG/8CfjSMmO/K7+KsKM3Snm737I0X0EXCkCBsbrXSt4NGw
	 noxQoIDjfjHLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] mfd: tps65217: Check return value when masking
 interrupt sources
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?0JbQsNC80LHQsNC60LjQtdCyINCg0LDQtNC40Lkg0KDQuNC60LDRgNC0?=
 =?utf-8?b?0LjQvdC+0LLQuNGH?= <r.zhambakiev@prosoftsystems.ru>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260917103312.92624-3-r.zhambakiev@prosoftsystems.ru>
References: <20260917103312.92624-1-r.zhambakiev@prosoftsystems.ru>
 <20260917103312.92624-3-r.zhambakiev@prosoftsystems.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 10:41:41 +0000
Message-Id: <20260917104141.B77231F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>
>=20
> tps65217_irq_init() ignores the error returned by
> tps65217_set_bits() when masking all interrupt sources. A failed
> register write leaves the driver's software mask out of sync with the
> hardware and may result in spurious interrupts.
>=20
> Check the return value and propagate the error to the caller.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: 6556bdacf646fcaa ("mfd: tps65217: Add support for IRQs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Radiy Zhambakiev <r.zhambakiev@prosoftsystems.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917103312.9262=
4-1-r.zhambakiev@prosoftsystems.ru?part=3D2

