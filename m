Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97E4314BF
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510301; cv=none; b=M54PA/aFRtsmtxjvJc2++kqFm3Q5kAwbC5gzWWrtlI1ip2UJG5Dy1FYRGiXqUJ4k5k+Bjbtyz1/8AfqWSbg1OcLPnDmrgZvulK3ZjOTTB90iCrisu84fNbTEVBEAGFwjaGKKMdaXHyXJnYQSijNvYJfLyC3hKljjAHi4gYz16K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510301; c=relaxed/simple;
	bh=Brxp3gtk7Xt+VCit6waz4RTJCjRaewgysVlvJ63f/nk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X00vlSTI48tEOihe12DcliT5R1U1Vwt8BXz42M4MuxVyNy22fPgK14SyPpsT/Znpz1CqXMS26zOh1JCXTEcl4yBlwnpJINMFHYcvp88O+8IoKWnwhka6SmvSluYjSV1p2vC70sJfvk4gJWNwXYh0vkCtlcRIaxNJheCDgIW7jLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsuI1NgX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsuI1NgX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968421F00A3A;
	Wed,  8 Jul 2026 11:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510299;
	bh=4tg2xtXY4iambmn3D1dW+4+m0J6qrXq6tmMwoS5MgVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YsuI1NgXQwvLTdMxHRprXCpABmMe2t8sChgdRTom3TzeoAmWEA9LIHUQ38itE3FIz
	 ImTwDPb51o9OPtUz6QH7YGaev4EHKZHFfjSVMEH3n56GBOqK3E75qytlC9/KPIfOq8
	 by+z1d9t5P9gXuLM4AtlaBV3z4kq+UAQreTR6FZIxwZ47YW5Nc8jzVSLneTayxyPpW
	 Yv/CKLFe2FNEO6KdaOiKHMkRn5+9m3PQfWJMqdmPqCaXpwN0FMm13rOSGH6U4a+csP
	 bOIItUEsonN7e/CqaEbrcOFVLKzGbLz9+KeQ2GIovRKzA0eCxcb1an8xW8yXMUxlUQ
	 gt95jXoBtt4MA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 22/23] mfd: Unify style of pci_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <3a662f20d0cd9b18a9de0457c437d7168fb9ce49.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <3a662f20d0cd9b18a9de0457c437d7168fb9ce49.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:31:39 +0000
Message-Id: <20260708113139.968421F00A3A@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D22

