Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348000;
	b=TVX5gxXpWejQkuRQknJqXhmz/YKZPR1gOAvTJqL+dFGnLUsQnErpPbDuWZgG6p+O3PqT
	 1P1EBH+MJhjbtfvlejcWgpNwHJsxI+dddYPnL+CzZpfy5FoZX07mxzryiLwNPau7Yvi8q
	 V/kOi19FdtOBgRZsNRta/qN7ItAb/DZHX9+XIFGyTeMqkcyhec/3zv/o5wFO5wxDWA0y+
	 BSAyZrklD5bPWS8AyK3HmrW7oP12eEp2E52Dehbe9QNWxFREmGfdV0Uxp9ctzSBYd5Znp
	 yJMmtw+wR38uu7ZMoQvkjzmqCM36HQ5Pqtupuw2tnaVC7nBd+02DbH7igiZ9W3jlcPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348000;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eU9EVmrouEM5G45uOzc2+LgCjte73+nQtZnS0LwYw9Y=;
	b=rXJoXCyZsDJPL05DCSWDnCPNOSJdHr9hlM6pjq1psWZBUO2S23evjUooPXW2BL6BkaOC
	 p6RUirhxnzOoIhkQyoXTRAIEofVYCE4CuzlPsGPwoqbaw0ambWr/aIlrOuAFmT5YlNM5w
	 c1MeWcj1hZMf7UvrcQFZk3+ZDsz5js9XU67LBxpLDmkETvhtXnmENnZbyn3Ri8w6rx+67
	 ut1o2dHd5CDdv7oy/TgmGbUok/2LOP3XY6OuOQoFQ9ZDI7Guc6Woy2OJrG3OIvrGCnHsy
	 +61n92H8F/zvFV2TKdch2brHZV5rwBc0HEocVK1XJwTn/lz3+jqoSGqFRSCymEA9Kag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=erSQsefb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA1A606A326
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=erSQsefb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5A01F0089F;
	Tue, 10 Nov 2026 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347999;
	bh=eU9EVmrouEM5G45uOzc2+LgCjte73+nQtZnS0LwYw9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=erSQsefblUEHJPdA8x3jDG8sXOXldAbSsNPQ8NUGLBpD33PHPs2Ztw2Nvt3BaHx4f
	 mjVYNSJC46SyaEbKn+991a9DOQ4fpYrzoxZPqZJnswZ+jEbHgPYZTK6xqsgVu/qIWd
	 67MMBKownxu7SsRY+3DHluVTZZTzj2XuEknj8C9i8BCj/rHoySgYZU2AkvtbfJRqqU
	 nDcCOCp2kgJ1HKYW1UtuorNYSXawQrHfK5IrrN5otXLsTVyTPmquVqwtix5njf0EA3
	 j2SDuvFOWF/DgiiCJCdx/HQbugHt/KEYOM7KBx3rRSIDF2vgoDecwe9/asNXxH+ivF
	 0EVhfyTKEaKNw==
Message-ID: <sashiko-outbox-207796@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/20] mfd: Use named initializers for
 platform_device_id array
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:59:59 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> platform_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Also drop a tailing comma after a list terminator to match the common
> style for these device-id arrays.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D15

