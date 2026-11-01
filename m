Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793523620;
	b=dfLlub1S8y7lTOedOuGLoULXOemUbP83bcTY7fDqmJASAG4YMY5EEGL2wyUhRPaLja8M
	 r+PGHsBFhOJpl1RwQAXLi7r+5Y40Ctzum02W0lvqZwrA4atqa8RPTY1LpgOomvmODe2aJ
	 Ptx+zfvo4PUKIY8+FEIaBxfXYDOhXBay4vDU/NV6b2C87pDVjA8S1lhZudJUvhBwNrsK5
	 axx1kfIxxW8HfTX5E5evmMkq2/PZUk8iXvjK4XR0GjZudliFnf7wNlp+pSwrte96GWRpk
	 SljE0fYNX4wlfwuYfet7sTTL3rF3xi6iUBz9+V1GQrBh8z1aFmDmt+zMwNCD1DgdAwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793523620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SrdAfaJNCXsaOM/8zm07qHfB/ZTMHtBlofEYoezk8Js=;
	b=HgVzKS66qUWcFtUsdP9O41aF9SeOjzE10/Pgee8munsmzu9QGngBdHHZGN8BDX6BWAgQ
	 WCputnLLDwlmPThRPfNjnDE1cBvkJN1xbU7TOVZrU+FqUBqk4ykjPhNm2rU+XjHY1wZdE
	 D8nfsAhTwfGhMBcovMtgO46fFnCVkL3RKomeor/XAZaSAnGNI3Y0PwZBfRefmgezJqaL+
	 lJBbkLkcyvyKQzGTipDV1qj5wckRiYCE+H3lCbnp3JdXTQO/G+6Cuslv6xJICeR5hlp7v
	 KCVGMYvgRgcO1A1nMIwM8PgkVPDJt76yoeYSwWTeAeETNiiG7IySXlsMKlgl2CO6lnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOyx37ru;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E051606A324
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOyx37ru
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA46B1F000C1;
	Sun,  1 Nov 2026 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793523620;
	bh=SrdAfaJNCXsaOM/8zm07qHfB/ZTMHtBlofEYoezk8Js=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KOyx37ruSaBtAPHKhOHOFE07e7XUn7O8dAMNI4vSXtXadhPGa0krvNp/P8LqWqbzl
	 dxLmQIMMXSPjVup9UuhlS7ZGI0yg8lIjiMjJqiUT2WotE+JUzWg4mccv4lyD9DuQOg
	 S8bYM8SGEhWNGrMRW5n3ZgI+GMW4LpBOpKv9Q5CHUixWbSWBfx9PRezx09ezxRqMo2
	 TbFdh8m9Z9vLIU6s2otcbdgSZXDHPpfDzby0w0awV3554cxTiSkCOa4G0BwvhpQzcl
	 QhyoBX2bFIkxms5DReGdhjed2uBNWq49N4XPoOqNMMSgJ4r51t9uQF7Jvz3j87SeXa
	 b5XbkPCdERXxw==
Message-ID: <sashiko-outbox-192343@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: bq25703a: fix input current limit
 default
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261101085754.277830-1-jerrysteve1101@gmail.com>
References: <20261101085754.277830-1-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 09:00:19 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Section 8.6.6.1 "Input Current Registers" of the BQ25703A datasheet
> states that "The default current limit is 3.3 A", while the binding
> documents 3.25 A.
>=20
> Use the documented value.  It also matches BQ25703_IINDPM_DEFAULT_UA,
> which the driver falls back to when input-current-limit-microamp is
> absent, so the binding and the driver now agree.
>=20
> Fixes: 76bc2203a46e ("dt-bindings: mfd: ti,bq25703a: Add TI BQ25703A Char=
ger")
> Link: https://www.ti.com/lit/ds/symlink/bq25703a.pdf
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101085754.2778=
30-1-jerrysteve1101@gmail.com?part=3D1

