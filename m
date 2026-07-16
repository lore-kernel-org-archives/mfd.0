Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804A6435502;
	Thu, 16 Jul 2026 17:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222851; cv=none; b=pK0QuZ64F/dXX76x0PnOYmG92yUn4WWWjWQeDmYq6kyDJKd6OKf+YW9ZpY1tqv69FKXNLYZ5FiHoOB9h6PrMhcRCmmGqX0cUthjkCQo2E7qqgfruAGWdCfIW6mu4/qWLpWPTgB1kPxS+3TaSaFzhfd7ruVG6nwfFKEDkrgFVA1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222851; c=relaxed/simple;
	bh=j7qvQakrGWl2fs05CtftfQ8dyTWOe9EfAiWtFcbZTJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C+qcoV2ggVyqwKlkP1Y6oeL2RS+7+cYu5uMZSe7CSE6L+KkJMC/1hJY5VhTYrejckWf9C5hNySWuBgcCZbKw84xHM0IxUef+9PAof/i4kp6mWbYQWOyKURV7PqXN7ehzsMbQM2nTazn/TJkzD/YsEXRMonoTi19oZrCbkQeny50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKc1qDR7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKc1qDR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089081F000E9;
	Thu, 16 Jul 2026 17:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784222850;
	bh=tUsGVY4sN7rq2HiE8e9Ky+9qe2yG8lx04jcATYODPS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YKc1qDR7bEQiWHFnucoqsvya+4yxjU6aRzKe52/4VFsDb7gLa4ZnDcCoJSybr6gpB
	 8DR6hz92kHsCYuhdRu8j52R2xbT3nXgPZIwFtd+M4X05bkZmohzi6YKsEsjTNcjb6P
	 aaR4M58IHzudBlxb2+8NWWIp1bsonNNsabYIrvjL4/+tTi5U4o34T3voJf5Mwi03QK
	 dFlzrUpm2vZ2P9CZoj5lc5MxAON/OemcWtb6YF7LbBTCk6/m3TJ/ivqG1oW52CiTAW
	 C50C/metl2mSr1eOKV2qU8clzc8yXwJg30DiodTcb3eh3IpUM3Asdq6IvKUJMIin63
	 SvjQnES3JXsuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add MT6589 PWARP and MT6320
 PMIC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akari Tsuyukusa" <akkun11.open@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260716171733.300885-4-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
 <20260716171733.300885-4-akkun11.open@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 17:27:29 +0000
Message-Id: <20260716172730.089081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect capability flag used for MT6320 PMIC: `PWRAP_DEW_DIO_E=
N` is used instead of `PWRAP_SLV_CAP_DUALIO`, silently disabling Dual I/O m=
ode.
--

--- Patch [3]: [PATCH 3/3] soc: mediatek: pwrap: add MT6589 PWARP and MT632=
0 PMIC support ---
commit 69d3d2c2fbeaf34ea620f48758fb711a4ca760f9
Author: Akari Tsuyukusa <akkun11.open@gmail.com>

soc: mediatek: pwrap: add MT6589 PWARP and MT6320 PMIC support

This commit adds support for the MediaTek MT6589 PWRAP and MT6320 PMIC.
It also refactors the existing MT8135 bridge register definitions to use
a generic prefix.

> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/=
mtk-pmic-wrap.c
> index 0bcd858263755..3a5b007d60f58 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c

[ ... ]

> @@ -2186,6 +2341,14 @@ static const struct pwrap_slv_regops pwrap_regops3=
2 =3D {
>  	.regmap =3D &pwrap_regmap_config32,
>  };
> =20
> +static const struct pwrap_slv_type pmic_mt6320 =3D {
> +	.dew_regs =3D mt6320_regs,
> +	.type =3D PMIC_MT6320,
> +	.regops =3D &pwrap_regops16,
> +	.caps =3D PWRAP_SLV_CAP_SPI | PWRAP_DEW_DIO_EN |

[Severity: Medium]
Does using PWRAP_DEW_DIO_EN here instead of PWRAP_SLV_CAP_DUALIO accidental=
ly
disable Dual I/O mode?

PWRAP_DEW_DIO_EN is an enumeration value for a register index that evaluates
to 1 (since PWRAP_DEW_BASE is 0). PWRAP_SLV_CAP_SPI is BIT(0), which also
equals 1. Bitwise ORing them together results in a bitmask that completely
omits the intended Dual I/O capability, as PWRAP_SLV_CAP_DUALIO is BIT(1).

This causes HAS_CAP(wrp->slave->caps, PWRAP_SLV_CAP_DUALIO) to evaluate to
false during pwrap_init(), skipping pwrap_init_dual_io() and leaving the
PMIC wrapper in single I/O SPI mode.

> +		PWRAP_SLV_CAP_SECURITY,
> +};
> +
>  static const struct pwrap_slv_type pmic_mt6323 =3D {
>  	.dew_regs =3D mt6323_regs,
>  	.type =3D PMIC_MT6323,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716171733.3008=
85-1-akkun11.open@gmail.com?part=3D3
