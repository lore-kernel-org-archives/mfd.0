Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348027;
	b=JVTAQ3/IXVJXFIs0vxkHcEhuxUfDW5z2CIPSsOsMS0hVGUJkoWQhsDglJqrwHX4WfrZh
	 rh6t6qVtuhUNR96XxBUzkG6Aam4mRcN2aa9EZqjVFXv50EFByJkZMdvnSrHpwAUsRZsmO
	 IvtOQjkaMc8QMR0USXWvsuEsohoSgbVMQpFz7DSv0HmjIfEqx3IYNrA9wxIDLvpJe0r/T
	 2jyKJv/6Y+Hsuh8zvxrVjKY1Gi8gfza+zEjmTeDoS3cHN9sUatZ9ZiHcKEZ4lOl1NTDsH
	 bBhNU4cAybbROX11J753ALFomMEMUMHj9O4b7aqx4EyJv9qByNHgktqidsd7V9dt2cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348027;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WO4rHX5GxtlR+76J50mM7x4W1DhGepF6zF92YbP1z14=;
	b=FF11Q7CXoPqFGc7CpTe/WGqHf54mldxOkmSnZTq73QfCip/7Gn4Dovse6u94tb3AZiNa
	 lKG4hoSb4d35n7XezYZrr7hh2judRSKusb8vRxUEEB+mDYucBOzbwqg22zW8XIRbrsCSm
	 uT2QqvtlvXkDJJxeAX7V+uMiyCSCQ96B+RxVChYYhaMPJCarIM3ituY7IqkTlw2NhK6jX
	 YmrrCJ70rT90+TmovUQ/fAdS2nxZniA0Pji5ZFkGcChYtGwwRIhS2C70dlS3ooxwKm9wY
	 jvCOKsqtjm7oBDZD3Dbo4KJ77QG3YyUc1Uu0auX9dnqPdRdCtY5aryIik3YIMondBUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m7/vQd0Z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472B8606A31C
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m7/vQd0Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C341F0089F;
	Tue, 10 Nov 2026 22:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348027;
	bh=WO4rHX5GxtlR+76J50mM7x4W1DhGepF6zF92YbP1z14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m7/vQd0ZTB5kvDOWx2nBmtv2nw05/ovfAeLscexB8wbcnF64tTw8y6MCTmJC3T9Sk
	 gx8IHN6pdRIXzwg09QLonNfbkEWplcVfsaiXzHtkxD4zTznVgfAZxYtKyQVfs3CX7/
	 JlzIfr+x40X3iVyId3nnFEnVW1EejGGzmTsYJyXYlY+8I+PsSAhClM4vzHT/LNF4Fc
	 YMKdirMP2H5aWkBEBRTkw3nGBQRkbIDHxKSFyK0ZpooDOcNJmtLSyHEvwnTLwGU6fZ
	 k0P7vDS28ZTqxSIzv5rXXWnYLtMKIzURSpqQHmZVDwZ6tShjd+n+9PkT2kDzqVjkpY
	 e6aW7xjXOk42w==
Message-ID: <sashiko-outbox-207799@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 16/20] mfd: Unify style of acpi_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <7e0cc26f7a3a662024c5383d68611353881f5f6e.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <7e0cc26f7a3a662024c5383d68611353881f5f6e.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:00:26 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

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
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D16

