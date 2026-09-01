Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0A456E1F;
	Tue,  1 Sep 2026 20:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293376; cv=none; b=V03L6M2aFOfsH6o1acXogZjmK+9vpQXmVAeLc6OYtGMNJqIbm0PLgOx3uE5gAka3mYSZtFQQebJnFOnb7YNm+08JPai9nLrkztMT5xEzfbEQMUxwmCS34XhdpK/bmzKevgNo4U6gNhVYzOs8LMtoXRlHgq79Ot+e+Wr5zDcyUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293376; c=relaxed/simple;
	bh=r1slmlj7fve3g0AydZMTYK7cBIasHC3q5N8Gl9zaSvk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VHtCpj8Fy3VvVZdCHjfqmlKnxOPwfTSGCqrsbrEYFDGmO4gbrJiOZ+imJzFzw1wkRm5VeAZiwhZ1zmQgUgkTjA9ilmKbQxpdGJ4ZWku+htPgm1iJjVgnI8IfVp/HGVvQrNkFCXALss28yi7Fifq+wu6OZXuWCQMe2hPvy0gb6uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hw0aTuyT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hw0aTuyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90FE1F000E9;
	Tue,  1 Sep 2026 20:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293372;
	bh=r1slmlj7fve3g0AydZMTYK7cBIasHC3q5N8Gl9zaSvk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hw0aTuyTHURzDDIe8zIM/3h6kyVQZylbwFX5OqRVndhBdbshMay5k5QN0Ql/uKIv+
	 fbWj+lUN/NkzkuGRf3802Xwi8NpJw+yz/CJ1Q3PXOZ8qnEbzPfahWQ/7k7Wx3b+ceQ
	 vPs2NUoK0C8hvdJAhNNzvUmcDcDuZwWRhQNKN14ZHeYuWIoP5q1d8ZiO3AesKGlOcV
	 FwMOJ65hLqewqWR01dkWPLvvizM0/TzhHL2sSVwR45rrxWM+4O5RVevTCHvcz0n9hk
	 nok7txDKWUGrk7jnGa1Poy2BtiMT/pGGSlRNNMoEoZEorOkFN/4iI1vgP3Ad3bVrgG
	 WLfhvo4BxAb4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/13] regulator: ab8500: Fix AB8505 VANA voltage
 selectors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-1-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-1-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:09:31 +0000
Message-Id: <20260901200931.E90FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AB8505 VANA voltage table assumes selector 0 represents 1.05 V
> and all eight selectors increase linearly. Selector 0 actually
> represents 1.2 V. Selectors 1 through 6 cover 1.05 V through
> 1.175 V, and selector 7 represents 1.225 V.
>=20
> Correct the table so each selector reports and programs the documented
> voltage.
>=20
> Reference: AB8505 User Manual, DM00046744 Rev 3, p. 257
>=20
> Fixes: 8a3b1b8703fe ("regulator: ab8500: Add voltage selection for AUDIO =
and ANA on AB8505")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D1

