Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811429;
	b=bECm0ZtkHAgvgPjRQ7PRefd5hk6eYee47Nh4IXZ8b6DckAV8Huf3oyzWIHOXVA6jHd9b
	 vKCFZn2bIwKJ9+JtojYEre5AtFvlPgOAPBd4Tcmkp6+Ce0JA0GsIbVkaigd2cuyTmM/Y7
	 0U9QUL8nY7iOwXC8jCoeMY+RMENbGFf0lZNriwD7Olx1z+VX4+BVNQf6aGljwbPeD5Dvr
	 ta9zy8XNgBf7ASyRQQB3qRKlJsJkAvCCsYhKGLxrSJWx+6hCVKZZ4oAlA8E1VV/kD6kDm
	 MZBrikGZroPGY1m0x91iAMEofZ0/kQwbWBvJoCFVm3eqkwtD2NnYWOt7VRla4tNPcdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811429;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OpiCPc2Xo2gIGQPcTHnCYU+r3fumGYH0GjIIOdpbYzI=;
	b=vEpLrDUtdnnuEGjCNiCsKJrPdQ6fR/MrGDrAqveCF9sv8h0TTDvHHJDmFqdMXPNKVgox
	 l5FNKEUdLRmsG3og9KUgMIYc3Ik73IYWMLnjkDix8tiel91YJ+ebb7ooaoZvDHVRx+lzw
	 cR/5KIdlEzhsq1GdSZq/HkWqvGlejz2TyzCtzQvgnGZ7ZMFkVUIrtAv1dCbFqN5Qj4An6
	 T1XM6vasc5DAxHIxwm0E+GaOmZJVwmNgDnA9qUKpD5i4n8SWT4hRlCauGUFQOffyKSLYV
	 tsJYF5tIMNkYhmOjOwKcWmtRoBp5b3zlWXaGAe4+mQ9oAIOok2Jfm7HfWIod7TA6vsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJNxhj+I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84734606A31C
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJNxhj+I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44001F000C4;
	Mon, 16 Nov 2026 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811429;
	bh=OpiCPc2Xo2gIGQPcTHnCYU+r3fumGYH0GjIIOdpbYzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FJNxhj+I8qu4kql5F1Kz/QKEu+iwXTujWssacZ5Dv1Wn2cVx+aSYI4sb12TxaqHx0
	 M70NEbOj1h2+bz5X5EHuPCajYtKuDu0KTHE9IZrJqOVXxYrpoD8lAAwIlvhx9E4ufN
	 eC7NAf5BUkY9+SU+LY5q5+VBpLRNKJI3HLS3VkDAbhCySg7VXahhcltE/1i1i9ulNg
	 qRQ0ZROf2ue0iiMAVlLn1C0vUPmfbIfbVc0svWxPBFc7IvhIETIZ/T+C55e4dFNUfz
	 f4hetmQGdZFUpxVNKNcdK1LjagxmlO39NUjfW2oOrhjuLMMHY8hU+TKUWl6KWf4bk4
	 BnXY/5MeKY2uQ==
Message-ID: <sashiko-outbox-216308@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/7] regulator: pm8008: Add mode voting support for
 PM8010
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:43:48 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>=20
> Implement set_mode/get_mode/get_optimum_mode support for PM8010 LDOs
> using the mode control and status registers to allow clients to vote
> for LDO modes. Mode voting is supported for L1 and L2 alone of PM8010
> LDOs and not supported for any of the PM8008 LDOs.
>=20
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pm8010_i2c=
_support-v5-0-5626ba17c0fb@oss.qualcomm.com?part=3D3

