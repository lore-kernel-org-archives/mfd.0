Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AB43033D8
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509965; cv=none; b=fPvv8f6gFmi+o6uGnG4I5w0Sxn6/imnBynYx9aTxGmD7JKQukGC84USuU3kSg5kIsJ2l63MN0RCUS0UKpvXy5Gpe14g/Y5eyzvQ7Y9BoomRozDVAm0O09n4VRlsUDNBxCTEU8Y8lJJo5vTor2jh7DtOgQiFU2dyXePdHRsdOWlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509965; c=relaxed/simple;
	bh=fL5YnMfjy1p/HfpKptOuy/RvnXcLU0LbLMOXEkYmpXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=brW4eACvl29LhgZLP8h8h1NtDSEivAb441DT2DlJKe9XLRilvHRsJsybvNjSpSPWY2b+hBHMd/mBug0f5/oUau3skm0FNU+7TGR/3bfOzTOXWxmX1PMth/FiXHybGntUGmyK6Jy6zDUjYSWKxBI/wvce0bi569O1LPuNFknKYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVlLyHx/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVlLyHx/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ECE1F00A3A;
	Wed,  8 Jul 2026 11:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509964;
	bh=541mfMQb9ufaaVMP74M5dnY3afRNQ8l2mSXBNJbts1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fVlLyHx/TivLqwdmM78rYQsZe55EfD8scZJCAKbn3OQtjoiIEnTPrLNEJzWHbNXha
	 hGsoPJHyEUtuB7oRF9Td/Ap+2l/xmx9REyTH3GE5pF2rFAzMMghVn4R+dc3zHc6Hxb
	 jc0r0j44/3ItczaY0P5slM/k8YLrtSrAxzC3FoukR9nATluvopOPMm1/g74QbjZpvt
	 6usErj8S1f92dT0ztUOOWL5LtRpLRlD0CfYPvGUaZ4og1pQBusH1DnfXM3tf/InktC
	 WANATtHeLDYFwwASS8vkBxf+uKFrx7WV2T+Zl12T76e7qVCU+BCIPsMOhmxoYfCCex
	 H1mZDeptUXbSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 23/23] mfd: Unify style of spi_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <13f1c0ae1697c6e3a342250e25fabdbf1499d642.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <13f1c0ae1697c6e3a342250e25fabdbf1499d642.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:26:04 +0000
Message-Id: <20260708112604.69ECE1F00A3A@smtp.kernel.org>
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
t.u.kleine-koenig@baylibre.com?part=3D23

