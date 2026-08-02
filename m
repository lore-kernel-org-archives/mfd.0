Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDF5331EAB;
	Sun,  2 Aug 2026 20:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785704392; cv=none; b=pxtHCDIj7F4IvtSxgglIi+YJYV8xyQsji6myiS3a0mYu2ll1j39ujO5eV8dtwVeK+nhStH1E2RykXoQSTxb7qy6osxdqRelXI7GFdszS0NmqQwsXNDXxooPanV58R7hOrtL11sUnxavt8tVOn7HkkfYYKlKtFfujDgA2bgZswiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785704392; c=relaxed/simple;
	bh=MbNveYMXAE1kFxkVAcDa32pmxq/otyheIiM/0itfcL8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nwp+VV9OWVkwBfY4aFNLK00q9D3vFqQgMLqhl0RCoRlFDo7+ek3Fn4GxKrk9OLQRzR/60XzH8q3Obzct4kMrV7vVAGUI2UN8R0JXk34EgCYABKLJdvNvoV8nlb+HliufJhJsE8Jf0cNTQ7WsVFW6rRNRtoUnZuyh/B/8oVJLt/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECh1i8bO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECh1i8bO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700C31F000E9;
	Sun,  2 Aug 2026 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785704390;
	bh=URKIU16FAdHpElxDdHeCMUSD0zEM11YN1XPg0zHL12s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ECh1i8bOaOgYvGrJ2OBKehMT4eslK4QBp0iSaaSje+zBCdicFecw9u72YgoE4yPRp
	 ikIQuDp+B4wWKFFNT38x5AiNmA2bkmd2a2iOYxehx3ebaXFtMqq/TbWpKgPHvzhNdc
	 94MXJRtg3NjUs/MTvJsazAvVavvTk0nQ+9rzD34Ki498rX/s8otxm3fjNiVw4P/aWS
	 wWYdrwpigqQ49MUgnkz39IDIOeZzBHu4GBGAvs7UXdYQDQiseo/R65hH4/9Tp6wUmE
	 +fbL+RemlxxPjinQiYi3bFkNikoJb59PUY9BNW3TYACcwGJsiqPzJEN34KjAVhQ9j1
	 Qg7mKX3HhEkaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, mfd@lists.linux.dev, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260802-zx29clk-v9-8-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-8-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 20:59:48 +0000
Message-Id: <20260802205949.700C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Using `const` struct variables to initialize fields of a static arr=
ay causes a build failure.
--

--- Patch [8]: [PATCH v9 08/12] clk: zte: Introduce a driver for zx297520v3=
 top clocks ---
commit 0a378a36878d451d9e58d093344b7ead86ae6042
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
clk: zte: Introduce a driver for zx297520v3 top clocks

This commit introduces a new clock driver for the ZTE zx297520v3 SoC's
top and matrix controllers. It adds definitions for PLLs, fixed dividers,
muxes, and gates used by core devices on the board.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> new file mode 100644
> index 0000000000000..f9915582f261a
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> +/* Used for gates where we don't know the parent input(s). Assume genera=
l oscillator */
> +static const struct zx_parent_desc clk_unknown =3D PARENT_FW("osc26m");
> +
> +/* For clocks that are known to use the ungated osc26m input */
> +static const struct zx_parent_desc clk_main[] =3D {
> +	PARENT_FW("osc26m"),
> +};
[ ... ]
> +static const struct zx_clock zx297520v3_top_clocks[] =3D {
[ ... ]
> +	/* osc26m division for clk_outX */
> +	[ZX_CLK_OSC26M_D2]         =3D FIXED_DIV("osc26m-d2", clk_main[0], 2),

[Severity: Low]
Does this code cause a compiler error about initializer elements not being
constant?

In C, const qualified struct variables and array elements like clk_main[0]
are not considered constant expressions. Since zx297520v3_top_clocks has st=
atic
storage duration, using them here might result in a build failure.

[ ... ]
> +	/*
> +	 * How does this RTC work? I don't know, the ZTE kernel does not talk t=
o it. The actual RTC
> +	 * is on the I2C-connected PMIC.
> +	 */
> +	[ZX_CLK_RTC_WCLK]         =3D GATE("rtc-wclk", clk_unknown, 0x54, 1, 0),

[Severity: Low]
Is this initialization also affected by the same "initializer element is
not constant" compiler error when using clk_unknown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D8
