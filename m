Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D8B30D405;
	Sun, 30 Aug 2026 22:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130279; cv=none; b=U2BAAIxf5Qu/7NrjLmS5L3OWsW9U6TxkjOYEJO0xx4cKsmSr9gc+Rcl6bm128SbF4KVwQwzuFYsU0NAc+ljKzgsgboxs9m6wuOjNI3UCbk/0ry5yxJROfJZjBggsr8ak2Rd2vyYAReRqGBOBFipTVtNCenn2aaZbPJsLUI+7LnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130279; c=relaxed/simple;
	bh=Cjhn/s+qUYzNQMOOkGag7cXMLmaINL57Y1JyLBd7/X0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YeOouoGWBiENIX0KFcfFaffL6X4q1nDa7z3GNUs+wtWNjAc9v9o+2usFovTkWVCJZk4XP73nOBSVOHhQEYsQdyZmMiMF4h9Kw2ezvnWix4nmtfe7OKiiV1nw6JWUFXag4P6/I8ANIzUiLEvJsylvS+0y6ri26LcWjRtB8Ae6jBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6M9i1ch; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6M9i1ch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A281F000E9;
	Sun, 30 Aug 2026 22:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130278;
	bh=Cjhn/s+qUYzNQMOOkGag7cXMLmaINL57Y1JyLBd7/X0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L6M9i1chbHMz7jBuDWUmD1qfGT2+EdcAqZI8mnzZne3UtQu15M6p4oAERiFqexsek
	 uVcyfoE75OtAaM+EJSP1cEBrIwyWG1T449AY28k7qTf0sibffbom6aLMNY8Cdhkkxb
	 4biFK029neYUvtqiXo7/LJqmCs8IdcQeuAk4kXURqdnFsiOpLJcPwyepffY/qsnzjU
	 9L/TFgZG/l6Tnkj4grqgP4sXOkAzgh1Q2oZ9zVw8V5/aZpur7svW/sqSGaeN1FO4Ic
	 96p58wVaIvdO4ajL/EEpByboWxMFFRXlB6MDXGKH+BmTnZbau/4OmV8XksMZXLS9lr
	 AURKtuTZDB2FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/13] regulator: ab8500: Handle AB8505 VINTCORE
 selector 7
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-3-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-3-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:51:17 +0000
Message-Id: <20260830225117.B3A281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AB8505 VINTCORE table exposes only selectors 0 through 6. The
> hardware also accepts selector 7 and maps it to 1.35 V, just like
> selector 6. Omitting it can make an OTP-programmed selector 7 appear
> invalid to the regulator core.
>=20
> Give AB8505 its own eight-entry selector table while leaving the
> AB8500 table unchanged.
>=20
> Reference: AB8505 User Manual, DM00046744 Rev 3, p. 223
>=20
> Fixes: 547f384f33db ("regulator: ab8500: add support for ab8505")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D3

