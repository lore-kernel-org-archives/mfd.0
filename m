Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432053;
	b=B6GwAQLBXHYdv8RXdR/13bSuiNPSjk6u4A0+rQ8iGulqv2Or/3CBfU9ZL5w9gSjUzuUT
	 ArlkDlA+r0KrUze0jIutlLsy0lWYiaXX4SYlosMxTZKdWRrXcSRyZihmUNlpfS/FbUl3S
	 LiP8ychQsxMfHqTXQsYTJTgA1ufwE4TM89myzAZTYRJ1GXWXlyDgMS9qBNpqc1FdJJVdG
	 FhGgFyNSarIAAmN0sxNFHYuBYYBjvxf8DkknuDYGU6ldjHDWoKmeop4OeWt50IyNy1PXe
	 u9S3mSN3bMMa1r24AAVIvk7VG4YZqYxtAfn7TWcNS4hwpylJCIMjOcKjWuPYY16DvLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432053;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bfkWFTCeiK5o6U+Er4BsXh9p4xWRw1CL+hOFqwBQky0=;
	b=nh0gyJrSTPrW6sme0jCb2UkFoTPtLPFwJC4LNwB5vOi+NIjYNBHWh+zCfZ7Zny467131
	 AiErTkjatSfR5rOMqYQTJYmp4JClD/JZLJCk6HFw4Jv+K1YIca8tljy2G6DWwpNlk3YuH
	 53OTy/c24F8dkEeKgjHnOfeMbUlHXcGo8pL2+wSitIU5MEXxR8YKbajeApqPUHstnxDwM
	 qqDH6vjtlEY50rKKCZ3Bx0s2XEQzaC6+3p9IW7+e12uq/3fzsP9O13kwU4WnZRrabjLv9
	 CTrgtMHCTKdjGDMT3wd2M5m+Fkg4M8y4U3oarM/0NglHCrznao14Fvrh88OH6ek16RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zgc1ig52;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D8B606A321
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 21:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zgc1ig52
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E9E1F00A05;
	Wed, 11 Nov 2026 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794432052;
	bh=bfkWFTCeiK5o6U+Er4BsXh9p4xWRw1CL+hOFqwBQky0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zgc1ig529SnYrPRoIxGUhsoB/r6OB/8tFuMB8aAfwwJAUsww7DML+Pr/WxMb7ePkl
	 +d4t1muBFpK0i0Doh9gvehLpRBAzQRQF6tAPyytuPKxdg/e7IZaAvUW1oIxguXftUY
	 w4AgccOy2xoSdBLT0z++hQdQXpN/43Evdqli+oK6rLy84F42uY79bYGoMa8lYIX0uK
	 6ixpLD/+66sTbXBiZ7+GbAYHZUoqdwLPo9KXObUOQzfcrh5kqj9sCqvPJ9K26TJmhx
	 tDi76ox6rKhYDIGonfdw1xFqJeObyTyjKrMfuhV4PP82W5qgg+a8mAxliuHp9GsRzN
	 44tmo8tgtRCOA==
Message-ID: <sashiko-outbox-209697@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 2/7] power: supply: rk817-charger: Fix NVRAM SoC
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111205627.56652-3-macroalpha82@gmail.com>
References: <20261111205627.56652-1-macroalpha82@gmail.com>
 <20261111205627.56652-3-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:20:52 +0000
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
> The NVRAM value is stored as a value between 0 (0%) and 100000 (100%),
> but the bounds checking checks and truncates with a max of 10000,
> causing a value of 100% to get read as 10%.
>=20
> Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK81=
7")
> Suggested-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111205627.5665=
2-1-macroalpha82@gmail.com?part=3D2

