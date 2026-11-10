Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333180;
	b=rWU7rjaB/CQo8GFkTmiNQkyLUgIK0R5A0v/yQ6hCtN6uUeiA1fTCGmZwS6OzJ9JZPoDB
	 QzL0EnuJderpoGN3TnvbkQv0/CQLOSzqg1YlMFfocwQSoKKtkIeOJ4jbktrgpzzcA4lUj
	 ZBKsThDD/IAKGyS6w03LUKy1+NLvwJ5vOuoedjxkYuiSFzuOFvUGIFP2jwXl8FnqomK4j
	 Va6rso7VdE3dNmM2eg6Slqn+hL+sUQttWqMwNh3iXKa6gU4S8PUlJYc9DtSmh7i2dtmbg
	 4fJtAVzNaWR4BohGwj6WCG1semW2IW9+NtcIdS3FXSqfNLovR8A9E89CgAn6qglMqag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333180;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kJLxFeYilgi3kkNJnvbnz/10baGgOVi+bkDCyqEwU0o=;
	b=x4Rfjtju4uOvUDjybl1Jmy+FbuG36CIK80tag0CZMLx6REuNGVEoGfFeUKd9B0adSnEe
	 pDxhxRHn61xMWr+BwIKdBltW38RUfJCWReBdNtNNT+Yb+AhSL40zeowSTVkmlXSD1hW3/
	 k9ZHHUvbXGkuNM5bz40mZ+9EZAObrITgEZ5tqjngGmmvElcZ89qRPyWwnj3gj/LxQIbib
	 K3sgI2GXN8Bli1eGiVvalzh1y+Q40EM1ocUa6ztweA55+hz/1EoHnqmZybCP/qcgTRvp9
	 C3+G82Bxug1f1B/e0/ZrYa7uNS7klccCJuhns7jnMyKe0XqTZH1GFIBMTomZRtRvekA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TS8kpXox;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD05606A31C
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 17:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TS8kpXox
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3C71F0089F;
	Tue, 10 Nov 2026 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333179;
	bh=kJLxFeYilgi3kkNJnvbnz/10baGgOVi+bkDCyqEwU0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TS8kpXoxudr1VPZvw8BP8C1ScGeKqtggMQAIyt99T4OgHhrGBExfNyd3A0Sl+1ymQ
	 OrwW6Gf/jYwcmEQyuqP/VvFlEZ3eP9c6KkS/B4FwLe5OnKhoh+RhiO7oBUQ3V1KkXR
	 844O+lgsMidzB8UvMbJbkzTwXWFPMCsn+Nlc6PIbydeh3wrHwCmlL5dRj2ZdzjEbOe
	 YlD76/X0D+BgxPH7+jeIAXQ9jSJR8ImldZxvcNxRkpf0zePsX3izdYBrJekiMBuJi8
	 HV61K//5ilvrw+GxT5uhCZaiP/p3MeMwrkHu91gWa8GPappTkJ3bUNZoQE8RwL9pvI
	 KFMRDe5bBGlgA==
Message-ID: <sashiko-outbox-207528@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] pinctrl: airoha: mux a requested GPIO through the
 IOMUX
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110173941.301478-5-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
 <20261110173941.301478-5-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:52:59 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> On a SoC with an IOMUX block every pin turns into a GPIO with one mode
> value, mode 0 on the AN7589. Add that value to struct
> airoha_pinctrl_iomux and write it when gpiolib requests a pin, so no
> SoC needs a gpio function with one group per pin.
>=20
> Without an IOMUX the callback does nothing, so the existing SoCs keep
> their explicit gpio functions and their behavior.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110173941.3014=
78-1-john@phrozen.org?part=3D4

