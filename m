Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3384E39B4BB
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509864; cv=none; b=AIBxxoFZieqf48EGFxyGydPMjdy1RXRraCZ/g/alzRyRVSZ229+DhjupnX5yaIDBp/ES4kc0qBXJNumAmuL5eq7AC7pzseOqaf72O5WyAHL2tV5E/PlNlTkTafsxNzEoEae/70/CsBO18x8aZlg01eUV7p7xhgeGf7bH5oa6nTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509864; c=relaxed/simple;
	bh=ZwuXrc+1sF4eehNrHUbkMXgwiqhVdIO2+H+0F4BpCwU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HfhiKIsSm6XlfPZnEeyZiJlJRlLGPvBIINqbAkFIzdteRsPSooWQEV+kBFmEvfHxEbNA4ubkP1W74OvoocqvwqcqCDGCAfbLUy3Z0kk3+OxoQ9jQx9dX8Sz79cVaL0bMiNzqzT89CUASrVcn0em3UWRNe4ozuU/g/8N29t56qlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apu4UXj8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apu4UXj8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A1A1F00A3A;
	Wed,  8 Jul 2026 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509862;
	bh=ZwuXrc+1sF4eehNrHUbkMXgwiqhVdIO2+H+0F4BpCwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=apu4UXj8/7EseNAjjAWAUmZ3KARqkQo415yhX9ftm53at4gLj3ORKR0N+hhI7WYRU
	 Kc9asNpMjGg/mJuqiB46KJLp/blni7jyPnCsQSmq+RHdtFZ65USWKPuhzCsg7tXna2
	 ggULiw5H5BelObJj1YiR+U5JcflAXpevvuZ3Wj9pL5oXFqUQL/af/vIgC+beyPGm0N
	 IgsUYG7quLBlFfxiM6sjL7apGNJPYzN7oKX046UmxaLV+s2vq0vAQtoqHxbbJtRs42
	 5ZiqPyRifSFDff1KN2vzLjyWElVFcSIiS9M/dAtiAMjzqg/ISDwl9D4GGIguHzAC55
	 Ydyza/uwBCTgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/23] mfd: rt4831: Drop irrelevant __maybe_unused
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <0cc39229d2521b37b7bcf9b984512284df7c15ac.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <0cc39229d2521b37b7bcf9b984512284df7c15ac.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:24:22 +0000
Message-Id: <20260708112422.A0A1A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
> modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
> even if the driver is built-in. So rt4831_of_match[] is always used and t=
he
> __maybe_unused marker serves no purpose and can be dropped.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D6

