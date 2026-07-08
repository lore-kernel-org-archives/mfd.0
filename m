Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F93CB2E0
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510100; cv=none; b=iyQo1vdaGay7gM347FwWzLVVZDD6X3Ye60ujbOu5q1sskIikWDLEU0gxvqVM3bwsGZa1YaCJ0cxG0glyU1zOgNxeAmHJ9ehB1KVlLwNVhCweq5SS3JcwjghODb0ot290hN3erOmyD0CKAiJJDHNWEwKSNlS9QZVZA88zTpbVKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510100; c=relaxed/simple;
	bh=c5wp973SILZXYfNrCmheS9si/h9leONgD9GD/VPI9pE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pn1y87lBfzH9PlnD509nPEzVPHcvzGWfFjn9HK6y4voe+t6ZqiwRAYJk3XVVf1xgdzUvxPIj00ICbNADXHo/8K7xZubNhBVu/CxqR/uAad38k3KoFUmuabIvWUM66E//LpnTr7rwBdDtxKM+vB45doqJj2atBUg6BiKWSNRWTNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpMnfxPW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpMnfxPW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF091F000E9;
	Wed,  8 Jul 2026 11:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510099;
	bh=QRM9qLCCwxkp0lP8eAatmOuGr/3wYWtOWyymeqMTmTc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IpMnfxPWzm8l3eLFjCXIcSU01Z/xmiS3i7khvGY3Mlrh1cLwjyC4dfDp3ptzU9sX2
	 HutvsHyK0GlBzONa7aYd/j0S648exgxhJtiebCWJFhsYmrUcjfBPJOMs3B0gCbSWqg
	 Hcb7DtLw9/GsSQ4UIVIxlMZ+Wx/6WTef5q0rFiYwyc30b99KrWOQ6O3zSv9EEuzmRk
	 qGQmuFWQlx0mfCkGL5eoJwSzrZZPtfGgLqFwLaZgr4g+F1YfbzUC3ycUbQmISiQSx5
	 oyu0IiWss8ps55qMGVFP7tj8nDxrEnus//uXcEQrxW0aLMAj3snRhKjXufRFKzRgG8
	 oMsKqD+oz2tmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/23] mfd: Unify style of acpi_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <ac8389353ee128d3841cf91c27ef84a8cfa3b5ca.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:28:18 +0000
Message-Id: <20260708112818.ACF091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Update the various acpi_device_id arrays to conform to the most used and
> generally recommended coding style. That is:
>=20
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>=20
> Adapt the few offenders accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D18

