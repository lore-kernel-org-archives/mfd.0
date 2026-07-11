Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0062DB7B7;
	Sat, 11 Jul 2026 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750612; cv=none; b=EkWXFRULwsz3VdvVDrP0WYlsdJx+I3Xy3iy4srrjquJuz6xPqz00w9ymTXdlSBnrTrok9E8ioeK+XQR1T9DsK5PrBjHnCAgS2pevdcIxDuBfFvXKL9BWs04i1/ocxfpu7GXlk4vefHW+j1wlfXzVPnUZO2kG3a1lNmewTNJZzgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750612; c=relaxed/simple;
	bh=To1IEqc+id3HKvZR8etQmOzS21D2SxPxQZdxkYdine4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ow6+SLcTWe/uQUjBfYMIRtCPHDftiJoL/rfPbNLVZyiZ5V8PSLrC6H/+mtF8w/2oyXsPzqobrxkz5s1/eylqyGB/fPAvm9yloM/dbY2oTuanK8/51VUDO7kndLshvpeFrID41Skx+XDp0aE6rVd3SqfWcdTaaQUr2OQaqw4fAqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbUG+UxP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbUG+UxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C311F000E9;
	Sat, 11 Jul 2026 06:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783750611;
	bh=bbRcXIdZQ0Qdx6AX/x2KCedJWmaRmvN6j2/QCo9a5Ao=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NbUG+UxPg5Lzk6+2QVBiPqA1KI1HVH7v9P7tl635XqxisY95cDFcxyRR9Ez//G5T+
	 D6dR7dOUCDV/f8aluQYDE8EhBe5PbLCdD/VHOG3vM1rvqgLymLaQLTLyPPP/HM5Fjq
	 r0yD2EHrmWgK3CPDq8OgKWsbcjG2A/tMWqMD/aTTfAWCj3V40HeKgIdwrwMpeayPmo
	 WLusjXAo92gPF4LkXtbAXW6gcZyvlok6DlYSfDGgYuX2s6jeFB+jD+91bceG0Jo3t8
	 0nuO/gZTQ4NR1cbGopt59Vk0FXuLKN7kSz1e2eEXgtAWmaCYaixMCDRJ7j+fSNijI8
	 nzkoQ7OqLKqGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/16] regulator: twl: Expose the TWL4030's REGEN signal
 as a regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1746667e5c17e2d39fc0747d7e098b32b3d7b479.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <1746667e5c17e2d39fc0747d7e098b32b3d7b479.1783749722.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 06:16:49 +0000
Message-Id: <20260711061650.98C311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unnecessarily strict DT property enforcement causes probe failure.
--

--- Patch [2]: [PATCH 02/16] regulator: twl: Expose the TWL4030's REGEN sig=
nal as a regulator ---
commit d13717da4f5b51bb52a516562b40db8ac7694aad
Author: Grond <grond66@riseup.net>

regulator: twl: Expose the TWL4030's REGEN signal as a regulator

This commit exposes the TWL4030 REGEN signal as a regulator. This functiona=
lity
is needed on some boards where REGEN is used to drive external regulators.

> diff --git a/drivers/regulator/twl-regulator.c b/drivers/regulator/twl-re=
gulator.c
> index 5bacfcebf59aa..d883ee8abec32 100644
> --- a/drivers/regulator/twl-regulator.c
> +++ b/drivers/regulator/twl-regulator.c

[ ... ]

> @@ -615,6 +647,26 @@ static int twlreg_probe(struct platform_device *pdev)
>  	case TWL4030_REG_VINTANA2:
>  	case TWL4030_REG_VINTDIG:
>  		c->always_on =3D true;
> +		break;
> +	case TWL4030_REG_REGEN:

[ ... ]

> +		info->desc.fixed_uV =3D c->min_uV;
> +
> +		ret =3D of_property_read_u32(pdev->dev.of_node, "startup-delay-us",
> +					   &info->desc.enable_time);
> +		if (ret) {
> +			dev_err(&pdev->dev, "no valid startup delay set in DT: %d\n", ret);
> +			return ret;
> +		}

[Severity: Low]
This isn't a bug, but does this code need to fail the probe if the
startup-delay-us property is missing?

Since enable_time already defaults to 0 in the template structure, could th=
is
be treated as an optional property similar to standard fixed-regulator
behavior, rather than strictly enforcing its presence and returning an erro=
r?

> +
> +		break;
>  	default:
>  		break;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783749722.gi=
t.hns@goldelico.com?part=3D2
