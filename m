Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F105472F8A
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939969; cv=none; b=n0/yxdiiJPxOhBhHoqobdQFTDHQdA1xQt2Tc5BFx/SCLCkvdYGn9aTIKUYAv17wJeqOl+IsiqaquWvysJaYWE2mRUfYw6nApzKUL5sArIimwR2QeAlEYl17JocRyB/P3VBfO6LX5WqKNiFmw5Ny+2Yg6Xz6UOvb4BRUZoMC022Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939969; c=relaxed/simple;
	bh=N00r9Ey4yXq2vuhCXoBI0rJ1Ej7QnouuTCs7H4lTKOE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g6I0e8MSmO+XoWzXlfVFGUWcKoTbeGlA616qbyDEYbE6X6QORJSArMMZlP2mjSB85tAuOZVvtmAyBWxHt7nooagsFDf125TwIf3EucTdImwRpm++1pDu+6luprXWp+mcjS1sR8hr5Zgd2KkJnDhbqqsrfngZsPW0DqqNfkn/UQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTofFSP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTofFSP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13F11F00893;
	Fri,  2 Oct 2026 11:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939968;
	bh=N00r9Ey4yXq2vuhCXoBI0rJ1Ej7QnouuTCs7H4lTKOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hTofFSP0iQzIQkBpf5W7eZZoZAx8anpRlkS/ovZi6URhdc4nrphkWNWeCabQKvu9t
	 MNlFuphjJfREHBAHO0fHarY7RatP7ApV+CiT4r8rWB2TcZ2jYDusxgjxEUyjucIKHs
	 dghZ4PTGNUYH8MC1aMeYH7U9qcPlaowDQEtHThHbxkCGB3VRiPpz3Glu76G/I8xgj6
	 T+R6yfuVlihJVsF2iSEbZU8U7B+DQUnqv099XqZ4x2HxsLSnLcTsmMkJS7iC+8s3ar
	 04x0NTDw+rozfHgQpnVIb72ViiJPxJ0z5Zaafay/+g2CxCs+EMsRz0RuzVth3etk9J
	 LnipbFp6jIjvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/9] mfd: cgbc: Use real I2C bus names
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-5-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
 <20261002-cgbc-i2c-storage-devices-support-v4-5-eb42e0f1df59@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:19:27 +0000
Message-Id: <20261002111927.E13F11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The adapter names described the expected purpose of the buses ("General
> Purpose I2C adapter", "Power Management I2C adapter") on conga-sa7 board
> rather than their actual names on the Board Controller.
>=20
> Rename them to the real bus names "cgbc-i2c0" and "cgbc-ddc0", matching
> the naming used by Congatec, and update the variable names accordingly.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-cgbc-i2c-s=
torage-devices-support-v4-0-eb42e0f1df59@bootlin.com?part=3D5

