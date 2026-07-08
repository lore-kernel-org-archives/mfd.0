Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D021242A149
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509893; cv=none; b=N5WJB0H2lTzjOOgIkPJPaQIhVngR+8tj6Es2vKML6fhSj8URdCpwW3PWUDypBLEKc1fUDk7IgWB4Ai5yyStkJG8+3kyV1p76n/4Hmh5Lf1YdGFHSeZst7CmWmg7D5BHNQpQLF9Dm4MaE3K5uOMXAcnVSRpgfpz+wAsA8sB0vzX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509893; c=relaxed/simple;
	bh=7l0cdIPcV74Tv0l6OuZLAaYzxKXovOWaJ4PVcN/exDU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eMqVZjhTQmFGPJuaoxQNYo99jPq4Qg5Zp6a2cJzsZr8RG0Px626fd0jUZ19EYfYz5Due9x3b9rg9M0HsK08d0twSrb6P3X1BbcUKyb9fagCcGYhTzayn86rRiZpeHtmIPJzmhXyvDr2z7qq2jxuB7oXD6NliYc5zjeUaQVHc2zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FS7qUlOj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FS7qUlOj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEB31F000E9;
	Wed,  8 Jul 2026 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509889;
	bh=7l0cdIPcV74Tv0l6OuZLAaYzxKXovOWaJ4PVcN/exDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FS7qUlOjSgx1Ny1uzkHa/ShXrJB5xjWq+gulkFz1mwqW0hobji1JVNCH4XY/pBmqU
	 IFWBD19FvfuTRAcq+K4LJG3EO+ZgwRGeL8sxydLexr2IuS0bSRMElmSe/pqibWPrvD
	 5RdSJeSXttAjw3QMb4MNsDOjHgpqS0EC9F1E9Fdjq0ww5CFO2Yd//YMyEOfFl9UXMj
	 CFNbfr82ZdIRGxx3c8Qz1VGMu88vMya2NrY+aNYzM8DrEt385NNxXo5eQZIsm9IR7L
	 dM7cflUKS3HHzdlr4MzAYYYUJXbHw/QIfOKDsL8aSG1tWUDTr0FtU5sfZko94Agl0Q
	 WBqHEAYfnGUSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/23] mfd: Use named initializers for acpi_device_id
 arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <8c8ffcd41b59446ebac377341971d6572f79c842.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <8c8ffcd41b59446ebac377341971d6572f79c842.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:24:48 +0000
Message-Id: <20260708112449.2CEB31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> acpi_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D11

