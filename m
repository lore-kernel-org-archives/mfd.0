Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B1D39E6FC;
	Wed, 12 Aug 2026 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786570821; cv=none; b=h7XCdzoNjO8JoKwlLiCb/R84r6yQjqitodwYXYx8lIdzdPeqQ+y5+1Sfe/MF5i5av3ZnCYPNjUTqcawxzM/Y/AiSoTjXO7yb06l8LsGWaC+dynKeuBsW0zO6PrXQyy2+i8XE7INKQ9XkoGmzt05fYi4HBYectxPybLgC+vwur0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786570821; c=relaxed/simple;
	bh=7safwrTLZBhdpm4zy8kWY7aQwIvmdjhVeeQJJPEkD5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LXlwCLXtzncTOvz7Zgtd4C+rxS6+dDDP9H10nh7+YXivKX1urAPVp1dQ3OIhbAzYsV9MG5Sru/neWX4Hh+ip3M+hFHQ13rxtasZlhqz9QVuE0qqsbAAzH0La+Mvcw6ZYCZUt6zm0nLPKQzpNuRXf1wakXB++Y1+X6ROTryUEqfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GD4CPNOl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GD4CPNOl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF921F000E9;
	Wed, 12 Aug 2026 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786570820;
	bh=vzSUSQ7VCPEoFCK+hQh5M+Kl3uYmM5oZw43o0x1puyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GD4CPNOldRlKs9HFlxt2Ro4efnNwCz2ANviOd8H6hofco8Q3uYHx9P0Xf+VUfOkq6
	 uRGsTYF0DxRFsbYBep3XaI9pT7f37z/7Id9qg0JJUq8eVeEbjb+IkSYi8C4hvjeRlh
	 TAsvExOI18I9aw8Ar/tv/eUBa+4biPj03IDuuY2Hke4+1vnpqLqe1PagWEGPP5eof+
	 JtWG20FGvrDdtoGiXdh3hNTOh9gqLhfiAYbPP8AKbe9knmiqyBOnuYEczyODJMh4mA
	 jtD6bn6pYctRPED7fC1b5UqVXoHJSTWIgfEQtPjfETLcT24yyXbLBYRtFy65/98YhK
	 plOaPClU/+SQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 21:40:19 +0000
Message-Id: <20260812214019.CDF921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The corresponding regulator driver lacks support for `AXP318_ID`, =
causing the `axp20x-regulator` child device probe to fail.
- [Medium] The newly added `axp318_cells` array uses a hard-coded cell ID o=
f 1 instead of using `PLATFORM_DEVID_AUTO`.
--

--- Patch [4]: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W P=
MIC ---
commit 5a33005ba66225f7df0e6747b0fcb9263e977f13
Author: Andre Przywara <andre.przywara@arm.com>

mfd: axp20x: Add support for AXP318W PMIC

This commit introduces MFD core and I2C support for the X-Powers AXP318W
PMIC. It defines regmap properties, interrupt maps, and adds the regulator
child device.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 84839d4aa1ca5..ea00c0cdce58c 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c

[ ... ]

> @@ -1061,6 +1129,10 @@ static const struct mfd_cell axp313a_cells[] =3D {
>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
> =20
> +static const struct mfd_cell axp318_cells[] =3D {
> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),

[Severity: Medium]
Should this cell use PLATFORM_DEVID_AUTO instead of a hard-coded ID of 1?

Hard-coding cell IDs or mapping them to fixed instance numbers can lead to
device naming collisions in sysfs and driver load failures if multiple PMICs
defining the same cell name exist on the same board.

[Severity: High]
Will this child device successfully probe, or are the regulator driver
changes missing from this patch series?

When the MFD core registers the "axp20x-regulator" cell, the regulator driv=
er's
axp20x_regulator_probe() is invoked. It checks the axp20x->variant, but sin=
ce
AXP318_ID is not handled in the regulator driver:

drivers/regulator/axp20x-regulator.c:axp20x_regulator_probe() {
    ...
    switch (axp20x->variant) {
    ...
    default:
        dev_err(&pdev->dev, "Unsupported AXP variant: %d\n",
            axp20x->variant);
        return -EINVAL;
    }
}

It appears this will fall through to the default case, print an error,
and return -EINVAL unconditionally.

> +};
> +
>  static const struct mfd_cell axp717_cells[] =3D {
>  	MFD_CELL_NAME("axp20x-regulator"),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-axp318-reg=
ulator-v6-0-d6b84b55c000@baylibre.com?part=3D4
