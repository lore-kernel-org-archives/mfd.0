Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8C63ACA41;
	Mon, 10 Aug 2026 07:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346103; cv=none; b=BsBzJCdYakZRmMeWuW9UWFCLr9Z+1Z7lw6ofXKu1H1CYZj80KUHk0m46Jd8uYTp6fZoFnQRWxj/b1QhcF20wnSz6+31JTuMOxYHdFwNy5yC8FGLf2VZnXe5xGk5McJX9U4zPGpWNKDTFvc2Y6G3jH0qYT50UNEPII3ZWyhx/iCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346103; c=relaxed/simple;
	bh=XyNo79Hm8JaM9tWOmtNsMIyMh601CG/YNu1FgXfsJ6U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QJU6swCikPiYqUgoXK4oL2wA8r1sTcfg5yogjedbfaspbikWbWskgzc9AEzAdkieZ1PUh4sk3U8MduI+o26w3Z/qB+7OdguTAHhoHGwfnKVDn7NBokPVtnTpI0SgHqe/YZi+S6dcMTPmGKLGzmI7Rn+Dm6/s4G4KsrlSkwlep+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XL/p6vkx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XL/p6vkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFA01F000E9;
	Mon, 10 Aug 2026 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346101;
	bh=OvZj6l0Ng7cZ0DmKBloJuS9guPd5/AykBMn1umdNDG0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XL/p6vkxUYnBWw4/iQvauZBceEPLr3GAIqDJor/ZL84TCqngN1P3L2SBwrIX+x98F
	 M7FBPZQcY2MPOSEHbA4xAHwlYSCyAh1GY6w2GDIZvkza8a6qh8uNKSrdMpZug0c4/E
	 YHuDxycBIL0CXyHt2Vror5K0SaN0cKjfdFhDi7nKn6RMYkU12rjyyfLaKqC36ohbAM
	 L1MkmkjaNGmcYuOzK3sQ98037msoRHTNRUS/f9Ry+IzDcwYfckgBroiK/KRjOj67pm
	 4zTqcUzhQgYB79faiPxpQYmsZbbgXog2cxj0E/MO5wbbAMwEypjtGl+Xh+uR+pSAtU
	 qaotYZpk4ieIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 08/12] clk: zte: Introduce a driver for zx297520v3
 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: lee@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, devicetree@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260810-zx29clk-v10-8-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-8-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:15:00 +0000
Message-Id: <20260810071501.0BFA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] `ahb-wclk` is assigned the wrong parent mux, breaking the clock =
topology.
- [Low] The driver fails to compile because it uses `const` variables to in=
itialize static array elements, which violates the C standard for constant =
expressions.
--

--- Patch [8]: [PATCH v10 08/12] clk: zte: Introduce a driver for zx297520v=
3 top clocks ---
commit e0f9a1aafed8640102d7aca0bbb0d89079e89c5f
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 top clocks

This commit introduces a new clock driver for the ZTE zx297520v3 SoC.
It supports basic clocks, including PLLs, the AHB bus, timers, and the
USB controller.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> new file mode 100644
> index 0000000000000..504075590e6d2
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> +static const struct zx_clock zx297520v3_top_clocks[] =3D {
[ ... ]
> +	/* osc26m division for clk_outX */
> +	[ZX_CLK_OSC26M_D2]         =3D FIXED_DIV("osc26m-d2", clk_main[0], 2),

[Severity: Low]
Will this cause a compiler error?

In standard C, variables qualified with const are not considered constant
expressions. Using clk_main array elements here to initialize elements of a
static array will likely trigger an initializer element is not constant err=
or.

[ ... ]
> +	[ZX_CLK_WDT_T18_DIV]       =3D DIV("wdt-t18-div", PARENT_ID(ZX_CLK_WDT_=
T18_MUX),
> +					 0x48, 8, 4),
> +	[ZX_CLK_USIM1_DIV]         =3D DIV("usim1-div", clk_unknown,
> +					 0x48, 12, 1),

[Severity: Low]
Is this another place where a const variable (clk_unknown) will trigger a
compiler error when used as a static array initializer?

[ ... ]
> +	/*
> +	 * AHB clock gates: Disabling these cuts off the A53 from register acce=
ss into 0x130000/
> +	 * 0x140000, including the topcrm region, so it can't be re-enabled. Ma=
rk them critical for
> +	 * that reason.
> +	 *
> +	 * Gating this off does not stop the M0 rproc, nor does it stop M0 from=
 accessing topcrm. It
> +	 * does however gate off M0 from the AXI interconnect, so it can't read=
 RAM, Matrix, etc. So
> +	 * these bits here merely gate the bus, not the actual devices.
> +	 */
> +	[ZX_CLK_AHB_PCLK]          =3D GATE("ahb-pclk", PARENT_ID(ZX_CLK_AHB_MU=
X), 0x54, 12,
> +					  CLK_IS_CRITICAL),
> +	[ZX_CLK_AHB_WCLK]          =3D GATE("ahb-wclk", PARENT_ID(ZX_CLK_M0_MUX=
), 0x54, 13,
> +					  CLK_IS_CRITICAL),

[Severity: Medium]
Does ahb-wclk have the wrong parent mux assigned here?

It is currently assigned ZX_CLK_M0_MUX instead of ZX_CLK_AHB_MUX. The comme=
nts
state that changing the AHB mux affects USB network speeds, which implies
that ZX_CLK_AHB_MUX is the actual hardware parent.

[ ... ]
> +	/*
> +	 * How does this RTC work? I don't know, the ZTE kernel does not talk t=
o it. The actual RTC
> +	 * is on the I2C-connected PMIC.
> +	 */
> +	[ZX_CLK_RTC_WCLK]         =3D GATE("rtc-wclk", clk_unknown, 0x54, 1, 0),

[Severity: Low]
Will this face the same static array initializer error as the other usages
of clk_unknown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D8
