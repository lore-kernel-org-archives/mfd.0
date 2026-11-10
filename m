Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347955;
	b=TiZIeQBN4stTGpOGqKNmVg1Owq8v+NIspNv1qjTKNYiJ6PnSafGiLUwNkVqryEE/WDQN
	 U9Bxqc6MxCjge2mfuYIt9JbthqlmVJrhYXToydPqHLz3DHH45b8fUx21GoflwpycjKn5r
	 Or7RTbnuYCwj6/R9qmRKL52z0wL7D2MLQXwL2S3wKDPXbDNc1sZf+VGuKuuvpAa9jpwQr
	 6jQvr8Ugv9eg3/hrCVQqP2Yeneos7GtrdoQrD2XWlyCWj3j6K2f6TWhR1Pft4r65G1Mmf
	 LIim5ohRmgnK9cio+vzzpIs9K+24sDBPpxhEuX2NLlCKKvpkU8kJiOgrp70A6k2CM7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347955;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m6bgj2Ln/EIN0Q1egiurSb6k05kScQlcsFCCjjWrrjQ=;
	b=bUxw9jGGgG+8ZvRzSTwgNEu1GiHg4Cbp/kBrR42GSKdgeK/kDwIafy6ED7Ay1hj7uJKq
	 RxpQCaO3EcvJ1o1omcz3l7GAfPziTrvDkuhQyRivX0tcMDzut4AxgUxjqAkVbK0WL5OQ/
	 gUANQJ5gBhJDjm9YuRYf7HVG92JI53zq6CXlsnIRnBZFvlBBvXXQjYOBVIBAs2mO44jw4
	 Hso+y8W8M5XkdFRoEHWRbbCHZnI8KxQuWxTC0ww4BiBGtgIv6b7bQ0Fr/kb+349EpHW5B
	 aEwew4bXeEAnzkqF9tV2RW5o55+647BbaQ+GnbJRg6HMAxquGf6GknvviTN5jZU3O2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oscPZ6nZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7916606A325
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oscPZ6nZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9506B1F0092C;
	Tue, 10 Nov 2026 21:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347954;
	bh=m6bgj2Ln/EIN0Q1egiurSb6k05kScQlcsFCCjjWrrjQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oscPZ6nZFvutzTeEMq4ahjyIDTH95MK4mZe1v246RQmspj64hwPB7TUjCKMye5Umy
	 pVpnEXOcCmzFZZTfd8bgvMae4e8IcjNJ52T4FJG4q0REqBTgbWOBQgT4dPHUaLW3DW
	 61nGn5MEIXoiO5XE04TyUFPL7YLwsFIaxTJrNWoNR9PtT/ZxNO8pZrSR5v2tesudpi
	 y6in1nS0kcUwahkdUnk/CWBIXvu8AihcYcDyguquk3D82DJX89JAGpqCvz8ZTJ7Fz0
	 oxGXpro67OG63yJNjkNbxMryX1hCvxSrVviw/tiZyT9vhdk75i5p5XdiOdmKQBSea+
	 RmAkFmgtUpmBg==
Message-ID: <sashiko-outbox-207790@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/20] mfd: intel-m10-bmc-pmci: Use named
 initializers for dfl_device_id array
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <d8c4d54e73f0faf117b21c740b7145060ebd1549.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <d8c4d54e73f0faf117b21c740b7145060ebd1549.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:59:14 +0000
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
> dfl_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled array, only its representation
> in source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D11

