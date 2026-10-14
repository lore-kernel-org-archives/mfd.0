Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC1D279DC3;
	Wed, 14 Oct 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980651; cv=none; b=TrE5aLk/GaAkpkO1dMKjzHk2SgJA9RNRSP7dMbdII3PzfxLfMOndRT34Zs0fycpm85Sk4VdWAeiwgsfCS159Ppugef+Taoj0g7k8qDFUAQxsruh7lk0jPQwCZayxBIn998DuvqSCDC3vNnxaS6vukUsjjFEuedDUpWP3zbN2Y9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980651; c=relaxed/simple;
	bh=iuhnFvpXmSStk4WIfsw1ZhnhinEtQYHMPUJUK/BhrBw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Pt7moqTa8AgsQwabTFmUJbeBAE7/7gDSYIipWFFixuk8O4EmmhhO/Z8L7jlgTG+3Q5wiaHtOfI6M81uiYM8z7eePw7Kc5h/WO96RF7VBjI4SnWOqh8MOB/FehEEGXu0FZ8yxSwQmtsPHvFhGpEQq+z0Y+xd0xgRfn/lqRFGq5jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Be9AUy0L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Be9AUy0L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6898F1F000FF;
	Wed, 14 Oct 2026 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791980649;
	bh=0skEsuwux4oy1NtR4MHMDO00WsyN3gO8GMnDq4lVCbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Be9AUy0L7rcHZfg7aUxxGlIiQ8SHOUG4RfKCAC8XJKUH2lak8pFAuUNzrh0MOv3M5
	 HXZj4gbPeTRkmMUqjfygi4aEUryiEcW41xsWDW+G6iowV1yxvALD7HC3Up9LmTqKmk
	 xcVNbw5U1jtkvX7AQY2RKQrJaC24QnjNxmf5qzGdFzaDm114UHuAsO+eulPNs+WrYF
	 smoGKS+q+qZ0AMQ8yOKOMckriZ+COx/tZUue+Aj0I6Tj4BPnaV0cS5qbZPA3lYsN97
	 eH9hz5kD0J/ljc0ZJUCHzYqt5SP0Hrw+DlfmfUqg6glW431+OGKbrFK7/xSozdZSIT
	 xJiPe9zW00cjg==
Message-ID: <sashiko-outbox-171273@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3 RESEND] mfd: max8907: Remove platform_data based
 probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261014121544.138958-3-clamor95@gmail.com>
References: <20261014121544.138958-1-clamor95@gmail.com>
 <20261014121544.138958-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:24:09 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] regulator: max8907: NULL pointer dereference if optional DT nodes =
are omitted
--

commit 71b1062244be38a96a85d244d04303ea12b325fe
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: max8907: Remove platform_data based probing

This patch removes legacy platform_data based probing for the max8907
driver, converting it to be strictly device tree based.

> diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/ma=
x8907-regulator.c
> index e59aa7a3ee546..907ed3fca5e97 100644
> --- a/drivers/regulator/max8907-regulator.c
> +++ b/drivers/regulator/max8907-regulator.c
[ ... ]
> @@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_d=
evice *pdev)
>  		struct regulator_dev *rdev;
> =20
>  		config.dev =3D pdev->dev.parent;
> -		if (pdata)
> -			idata =3D pdata->init_data[i];
> -		else
> -			idata =3D match_init_data(i);
> +
> +		idata =3D match_init_data(i);
> +

[Severity: High]
Will this cause a NULL pointer dereference if optional regulator nodes are
omitted from the device tree?

Since the patch removes the platform_data fallback, the driver now relies
entirely on match_init_data(i). If a system omits the nodes for
MAX8907_BBAT, MAX8907_SDBY, or MAX8907_VRTC, match_init_data() will return
NULL.

Looking at max8907_regulator_probe() just below this change, idata is
unconditionally dereferenced for these specific regulators:

drivers/regulator/max8907-regulator.c:max8907_regulator_probe() {
        ...
        switch (pmic->desc[i].id) {
        ...
        case MAX8907_BBAT:
        case MAX8907_SDBY:
        case MAX8907_VRTC:
                idata->supply_regulator =3D mbatt_rail_name;
                break;
        }
        ...
}

Could we add a NULL check for idata before dereferencing it here?

>  		config.init_data =3D idata;
>  		config.driver_data =3D pmic;
>  		config.regmap =3D max8907->regmap_gen;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014121544.1389=
58-1-clamor95@gmail.com?part=3D2
