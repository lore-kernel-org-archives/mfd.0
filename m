Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236462;
	b=O6KINoBQIJtKqKQLbfXLtWf65oa3JyK638UxfjZDzuDxtf+uDCfHHkwMJHt0ENSQ/8yZ
	 1LrvdcQkFxzKaDCL1qDgjSKcvisULdcCyfik/CABFgmZZEFPdyY7oMxb0ELLQpmHBQ9Sl
	 UhFIWW0u3VsJHavTLfTZ2uKQ/IT2zAuvSJtfrk/biKGnb+aOw+5V5ko9sGbyxLM8ivVjK
	 WHrR2i/XTuEkYvXqN182okA6Xm0f2y5RB8FYLh6om/CEFPZNc609WPuS/vhVbXJrK/rpK
	 SIrrnBrWwNHzMNEJJT70QqFT77gH8gvXdqGCEOuoxnVvHYAximXm/q2eEw5pwCXiQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236462;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G5sMiueBNMLzt5kCsJ56VvDqaKYZgx6JlprFeY6ylDQ=;
	b=tXgxORXqOl8ADhQHjfzxwW+fQ4RnT53bq2QXEFxyKv8dicUDva6EAKwIqsjeIKb89k2M
	 PyEIddFBxavrYG3D+Oz1pqNjdFhOdH7tz92XOKw+XAczXtg5Dcz5tAt6Ey1sRtMChrjaD
	 Tzsfogmr+fxwph8+HYAfNjZn3LfobxzaRk0bcqVukExw54gnwF79j2hOQKoO74LwztRY6
	 RAyqYjyoZGvP68fvp9AERMpqv6ynT77dXiOZ55fu1Gvzi61CZTTbUPqJd7DT0wgFftpfC
	 S8sAlKpB+vnwAL177MQIeinkOKoUv60Vau3nWhmDPwf35+qkLF9+5hNWsLQtJ7qETxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dChbObtm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B30606A332
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dChbObtm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004591F008A3;
	Mon,  9 Nov 2026 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236462;
	bh=G5sMiueBNMLzt5kCsJ56VvDqaKYZgx6JlprFeY6ylDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dChbObtmuZA17qERN/oCAYjohp2+npOb+9/SvlwU1FIzZqfWFY3r3UNUGK0xIkgC4
	 CgTKO84EhhVgLKOjGLLBdjpcCN8xOZiXKkj1yzqc+KB/usqFWCqFNuwQ2uqCBBOkTp
	 yDx0N3t3u2tKcT1POC7FcaLWSvzvG65Qf796kDxUcipljuoPLancna8+kdIjQZy4is
	 ATsZYt308ml5jGkrsoxY0N4GM/1Fys+K2cOyVtjHZIe8ZdzVGSvfNgtVxUjy7K0KD/
	 QihgiB1iz75/EfWzotZK7AAQmbDddWyMNXVj5v8aQft5/61wBSgoXsUQbZZDoz6sp6
	 KIz89dgrbMsuQ==
Message-ID: <sashiko-outbox-205140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 1/7] power: supply: rk817-charger: correct spelling
 of coulomb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261109145833.1363319-2-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
 <20261109145833.1363319-2-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 15:01:01 +0000
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
> Correct the spelling of the word "coulomb" throughout the driver.
>=20
> Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK81=
7")
> Suggested-by: Jacob Cook <jacobmcook1984@gmail.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109145833.1363=
319-1-macroalpha82@gmail.com?part=3D1

