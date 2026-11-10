Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347922;
	b=w/6xN+7ttU8vssxbhoizXERJlqTygQBVXlU8SwajYp3J5dI3q2mmkEBE2W/FDfLXoRO0
	 /aH/w80VKMXp2L87p39f7m6rWexUj33QnPg54LIJH8A5JR0B7BMaIFxYXDaxKWri8I4jU
	 hQrg+LOxDHkAJE3DBNIqNebVdP9nBDc7z24eTcpIBJTCFM2NmewuRqDV4rJmJ+ZUuP09l
	 UR1jUzErj0kSCgI3U4hQFnEKlurhndQ10s24gEOjKSvX0y2BfpxAhkBWUfKiTTyxjjw8F
	 euTPPAxoCaFNh2gJQ80Mk3DVKSiqAgP9gSmojoCxwSiQaTqJGoGEy3rL1B1RhgQd3bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347922;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YTa+PALYDrPtcUydE6dvWERUwEycqNuwxw6JbZbQALw=;
	b=Rx01CXb6itRrTJ5WCW2PA8cpL5hB4EiNtgPseBehVNevyxVetWPa24+oFqOZIOq6LThY
	 291WzTfPRpKNn8qzLFORRpmERYyiHNFQg1roEfnTLRl9QVjkxVuE/hkaQAea9qz85axI2
	 bhs5ER7vT6/NiMZmxVZ0/B3ps00FLTqMaaXSNI9UoLv0S8Wj4LhK5eKdnTrspqalJ3qM0
	 vCdErd29uB4Y4HdUcpn6DiTBc8ANRmQRWeB3gl3g0KRQSsONzIYskPj2XyloseSJNE1jQ
	 gMymetgMbyw3r4rm5lNGhLXptHqLisVs6w/u594pk7wNZ5wbKlx4nTuJKIPOX6Ck6hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqR4mhcS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CE9606A325
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EqR4mhcS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBD61F0089F;
	Tue, 10 Nov 2026 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347921;
	bh=YTa+PALYDrPtcUydE6dvWERUwEycqNuwxw6JbZbQALw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EqR4mhcSGzStNVqXiwSRbTdTR+6Y2eg8RuBrGzOJlRY1yVHP6mjwydEqrJDKcCqN/
	 6wmE+WOWAYLxE1CZyotc4kf+RzQriMZhepGnhcEGqp99HGJ7GRfYvluD31y8tTwnBS
	 DLvmY4oYzvodQTkXaRiNggdw2xpFUmQbFovBO2Gl6ynQogJlbPhTEppcr3eJpyLaNa
	 OX0aSn6D3sJwE0e+bVEmTpzK8oIuFAVV0w4LIuFOJFw9eSZUNqd9cfM6VfUG+dkXIo
	 Uwu+8YiUcXB8oXruVgcJ+eNHUd2JNVmmyJxcDQQU7vhO5qMYib/SeG/LAXppmIe2Ed
	 3GWlZPtrvJ3iA==
Message-ID: <sashiko-outbox-207786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/20] mfd: Drop unused assignment of i2c_device_id
 driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <ba35aac0499a639d932c469980c54cece6f2b29f.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <ba35aac0499a639d932c469980c54cece6f2b29f.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:58:41 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The drivers explicitly set the .driver_data member of struct
> i2c_device_id to zero without relying on that value. Drop these
> unused assignments.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D8

