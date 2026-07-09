Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CD7399360
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617044; cv=none; b=nXwkPs6dWRd9LcAEnZoMMrbcDbeQQE4OgSZTWz6XRwnmRqhzNDwwo+CacW/JD/JOmUvF0YQy6kmhhENvzZivseRtAtpuuuXTbdvT5w3PUBYf3A5Oy+PzSewyL6DZI6/QuiMJcHsJEv+IKKxb+5LA7szWABoZBX3oUsdxhifaJkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617044; c=relaxed/simple;
	bh=T2BA4g3Va1cR2VnqRO56D0raE/2bb2nrm5VKSzFFOKY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p8IsJOaCdjPfb3j6xltnf83/pspwu0KH2e5CIBAAvqApGlRx9In2GVpnle5x10SfXL6W9n67lgDQANm3wiZG1K7YEHjUx8KmpI+b6w9zTnoZuzdR44O/y2Mv4dJ6cRGPOSNgnsAN5+PMe810ZYvEMsASYGqMVVCfJa+KERdU4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFpzDvrH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFpzDvrH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6DC1F000E9;
	Thu,  9 Jul 2026 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617042;
	bh=Xeu9FnEYyVCy0w5rM2NRzpuEoYYR2562Gi4CiI3UJvM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KFpzDvrH8wwAalirsTkVwAFCODx+UtmIl5s45FkwULVYUIeQd8HlXJm+vCdN8WeDQ
	 pdcmyvDagYkbI2LUSdswj2SQ70wytLacROnU6i48TLJsS49n+bDnu8HdAJxDJ3zHIo
	 xVhFeqe9WmQ/S1Ps+QpIPszt0+tZAhOU/UboVjD/5wQcdQa1DOq1DVxajcgyL0J9W1
	 wi5sFOrl4wkU+pt0UKHbYg42iT4KdjPjDios//rvZVsQT/8jAgZpJ53xJGgIPcUtSp
	 yH/FHOWilX+lrxQRj/Vc8fNH35b9Lj8orxHszftKOp4tRAkJlV8ZBZgjFOwuVObN03
	 VYOqX0fuX6wMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 22/23] mfd: Unify style of pci_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <92a18ff85964ceb1992f964d1325f9d10f1ee1e3.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <92a18ff85964ceb1992f964d1325f9d10f1ee1e3.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:10:42 +0000
Message-Id: <20260709171042.8C6DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>=20
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>=20
> Adapt the offenders accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D22

