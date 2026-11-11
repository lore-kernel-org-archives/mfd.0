Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432223;
	b=IvofifB7DgVYKujGYTsAhMDiF7kx7lVDAXiSPMULVLwggWegw1hMhNLP+KterAZH2xWy
	 BVY7XH8I5pbX6807VCY04ARNG0LmXZEz+WFQi0AoO1Uv7ePX0L/uX9fI8ZRC4S3pSiEAN
	 weAHY+LwWKvh7OfpJKrHcxbH2t9sH9RBIDUDXELw4rwX4Hy2hpcSPjeWR4xV6P0Ew3MIj
	 BP3kUKMQT4YnaMOTjln6EzqRc0yZrKFZMA9eMoXFZU2kM3s9Z88jeyKRJiqFETUkZvEwy
	 EiL8RXqxHtZiHKbqGc1G2nUO+uLTcb0QtKqhciWFjHu3bdHhzYJ+CNFaDy4Zb2gdLSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432223;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KzPxq3KrgqsTb5penFf8mmQRUaZdWjoK3+BsRMKP43Q=;
	b=Z4Tubi6KkLlfEkR9ZhCN68KT0UgsGAYrSUmP24JvH95E67185sS/6QszV2kcyMGXOlo7
	 BQENV3S9g1EqnKbSzhluLe4iy7SMUN5KpQ+v6iKJDqbkJKXgh18DK+lPizRwp82DKv4nE
	 uVms/kr0+YBznEmzpJefn0UXdR5Je5ejqf2PpIlHxc9BNRL0u173vahEYTQTKLFL3sO+O
	 zngehp1PPmkdDQERSI2aTWqtWS4Adx4wyuBK+EStjktzC2Rrb8/4IftVYgbEX8J8S1Mgg
	 ZJof+0hKHSJLjq9IUKBjP83zYYnThcwCJP2HIqQn7RwPBlCo794G8HN24PyXV4PpXmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPjaP6B4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26124606A321
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPjaP6B4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC151F00A05;
	Wed, 11 Nov 2026 21:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794432222;
	bh=KzPxq3KrgqsTb5penFf8mmQRUaZdWjoK3+BsRMKP43Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XPjaP6B4QeFA8GH69egkO7/hdNSlshuKLv1zuyDTUp6k1gjrRbi+owNPzijoID8vl
	 Ebj4UcluLXZ+T3t98CJVbZj2UOl+RAI93Bt0Ku6SQUjcNXJLdr3I0kCqwqyQ8gS9P2
	 Lr8ST/IUxJlJ8Y6MekUAw7nI8Czt6Wn6XsE0DPMjk11x+WdvLMhv849ffBlUEWSB2j
	 ZlShl6bAWv5zrayBFWsDqEenUoyygMmDv9jZSAq1glsHYIjcopnmsl+G/hzZwtFlMW
	 46zMKGXUMVCF9QWXc5Yr/rKljso/vc6sxDCGOpdq9cU89C2qTmLL6CTg/ugg6c7kAj
	 SJYo96s9N0Yfw==
Message-ID: <sashiko-outbox-209702@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 7/7] power: supply: rk817-charger: Clear full charge
 cal on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111205627.56652-8-macroalpha82@gmail.com>
References: <20261111205627.56652-1-macroalpha82@gmail.com>
 <20261111205627.56652-8-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:23:42 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> After suspending, the coulumb counter may be off by a bit. Set the
> cal_soc bit to 0 so that the gauge may be recalibrated again on a
> full charge.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111205627.5665=
2-1-macroalpha82@gmail.com?part=3D7

