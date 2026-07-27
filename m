Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B788725B0BE;
	Mon, 27 Jul 2026 19:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181296; cv=none; b=OxPWje/B35r/FAXBf3ONSb5e8QGVF/fMEkq8Q43/f6mFw1DFyg7XRkwcwULvwyy+9dofsnTY92xDRf/+6KV1F17o4+1z0lCo46LjPiR7DKhBOMatrVWT0+0uX06KH/MnUO1Us+8Ll7tGeJcE3wTzWfKw1HTYr5tX++GWkOAC7hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181296; c=relaxed/simple;
	bh=VYS7e0squFLmdhH1o1lCcd9sBcIgf3F3pTxhg3qPOHo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cjFpSJcN8dZLonyJV4uyK3j9LSpSqoRnGG37SzG0T5pZ1eMqgUd+QbenrEw1lTY36UwUeJjkFnz8B5asZ75FFijONd8GnKZU8xZVU2ZQZl7bPk5UGNip5ggRBhOpgEM9h+2Pw8EPk+TviCdvRmK/Jy0NPQBfHseb+aoIqgbiJFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsfBC8WK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsfBC8WK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFDD1F000E9;
	Mon, 27 Jul 2026 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785181295;
	bh=NXZ01KRGPMGOj00getszVzMdpSsaQmnkNWAK37M3n/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KsfBC8WKwAvkkFn307EM+YTnBJ6P+q+7aCNFiaalNL7KOP+jsQSbvTbRP9Ca6DE1h
	 2QoSJaw6r0L6CCLIbtd66vpbz7BzUp4oinbTEgBVsV3oVtJw9Amn8XbDJCNj1Xekf3
	 34BqQOHy5JPpwgGH8w+DFByeYYb8KHYn3UsSJhHf9MEXxSh+XC5IVSctDex588K7h1
	 2Sn4jpAYmzcnth0F65JJHUdqPK6h2TX+7XlDMp27/g3ktNZJ3zyxOKDz83CPBLLO4S
	 48DbVj7BYG8b9S6AaMHIjdt8BT19eL8XuS7OgHTdjwv5e4pJbdde/OnqZtuokQ3UX0
	 U/FglnuaT2ivQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 09/12] clk: zte: Introduce a driver for zx297520v3
 matrix clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, lee@kernel.org
In-Reply-To: <20260727-zx29clk-v8-9-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-9-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 19:41:34 +0000
Message-Id: <20260727194134.EFFDD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The use of `clk_main[0]` to initialize fields in static global arra=
ys is invalid C and causes a compilation error.
--

--- Patch [9]: [PATCH v8 09/12] clk: zte: Introduce a driver for zx297520v3=
 matrix clocks ---
commit 895d095e9e21d84eaefefb2e2881a4f8193ef450
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 matrix clocks

This commit introduces a new clock driver for the zx297520v3 matrix clock
controller, which manages high-speed devices such as CPU, DMA, RAM, SDIO,
and Ethernet. It registers multiplexers, fixed dividers, and gates within
the controller.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index 4444c2eb13825..9299449097b4a 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> @@ -542,6 +542,340 @@ static const struct zx_clk_data zx297520v3_topclk_d=
ata =3D {
[ ... ]
> +static const struct zx_gate_desc zx297520v3_matrix_gates[] =3D {
[ ... ]
> +	/* Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in=
 topclk+0x138, which
> +	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't rea=
lly tell the
> +	 * difference between matrix+0x28 and top+0x138. The clock (matrix+0x24=
) can be disabled
> +	 * and enabled from the Cortex M0 and it will nicely stop and restart t=
he A53, retaining
> +	 * all state.
> +	 */
> +	GATE(ZX297520V3_CPU_WCLK,          "cpu-wclk",       "cpu-mux",        =
0x24,  1,
> +	     CLK_IS_CRITICAL),
> +	GATE(ZX297520V3_CPU_PCLK,          "cpu-pclk",       clk_main[0],      =
0x24,  2,
> +	     CLK_IS_CRITICAL),

[Severity: Low]
Does this cause a compilation error? In C, static array initializers must
use constant expressions. Accessing an array element like clk_main[0] requi=
res
reading memory, which is not considered a constant expression by the compil=
er,
and will likely result in an initializer element is not constant build erro=
r.

This pattern also appears in several other GATE definitions further down in
the zx297520v3_matrix_gates array.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D9
