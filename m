Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346354A3855;
	Tue,  1 Sep 2026 20:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294416; cv=none; b=foVDq5NWtWds194ncVCwNaQ0Rf4GYfgDynLmgHVjY7pKFsdKh+AOhejXuS0lzmIy4i4oNybaW7IlbvcolEB66QkBaoDO5oJBJoAqb1p0tZbRL+7nYhiCqIMSVTM+TY7UiZpMWUdx3ZbzXc9hpolViioEMI39Z8Gl2VvIAgd9ii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294416; c=relaxed/simple;
	bh=6gd7XjQKNOFj1zsei+V1YfEDfFgLEuIX/2pYUJ32aj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GNkqrZxuHJahZkuIZT3x76o8ij9bT26IhxltaQGHcl59OAiS3jExYqS/efVWLSdWrpsfp4op2qkrwELpMTgV99JztAy37ZD9zEV154gdSbXAT4AXD+jxIqjDnI/BXdLD5V+JKjo1qaujRBBajOC/4WAGRnc5pMG8K8Y0jlClsYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHG6NC3B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHG6NC3B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17901F000E9;
	Tue,  1 Sep 2026 20:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788294415;
	bh=NCo3SutYRntdCzgAE9/AcR54Pa2GXSWs6HsexpK0/7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kHG6NC3BBlL8UMdTWIjTJl4o4mtYbS4Cj3gaVatAY/QVDW/Wa1KyK/TWAJ4XJkn1K
	 Yio/3Vs4O7eItJg/61R5B9aQ6PAU0TRxLAOWzpSMMdvREtA02Dvs3aAxZI3np5adHW
	 FYc+8+gECl4Ww7kknPEMKRW3/seu/eja8InG0pN1OBDjUizaR1fUN3yCEkTJWTX12L
	 l7/bX5MRQehk9wSnRDEt0xVtFkS9fs5aJPJY24r2MDv++DioblWxB5tgTzi6mx9fBv
	 s0HMQmmwulptNY92UjjX53roTIMOsRDe8V5b7uxKY6E/i6usHGBjnhGV10klgrIfyW
	 y+ZHq9PYpfJug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/13] regulator: ab8500: Propagate mode enable read
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-6-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-6-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:26:54 +0000
Message-Id: <20260901202654.A17901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized stack variable used and hardware error ignored in `a=
b8500_regulator_get_mode`.
--

commit e3e13ae0ac9e7a8bd4d65f25709df32c5a1808c8
Author: Linus Walleij <linusw@kernel.org>

regulator: ab8500: Propagate mode enable read errors

For regulators whose enable and mode share a state field, set_mode()
first reads that field so changing the requested mode does not enable a
disabled rail. A register read error is currently treated as true and
the driver proceeds to write the new mode, potentially enabling a rail
whose state is unknown. This patch returns the read error instead of
changing the register or cached mode.

> diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
> index 05c6b9c7af0c7..e4c3502c8dbcc 100644
> --- a/drivers/regulator/ab8500.c
> +++ b/drivers/regulator/ab8500.c
[ ... ]
> @@ -490,7 +490,17 @@ static int ab8500_regulator_set_mode(struct regulato=
r_dev *rdev,
>  		goto out_unlock;
>  	}
> =20
> -	if (info->mode_mask || ab8500_regulator_is_enabled(rdev)) {
> +	if (info->mode_mask) {
> +		enabled =3D 1;
> +	} else {
> +		enabled =3D ab8500_regulator_is_enabled(rdev);
> +		if (enabled < 0) {
> +			ret =3D enabled;
> +			goto out_unlock;
> +		}
> +	}
> +
> +	if (enabled) {
>  		ret =3D abx500_mask_and_set_register_interruptible(info->dev,
>  			bank, reg, mask, val);
>  		if (ret < 0) {

[Severity: High]
This isn't a bug introduced by this patch, but is there a similar logic iss=
ue
in ab8500_regulator_get_mode() just below this?

If a hardware or bus error occurs when reading the mode register:

drivers/regulator/ab8500.c:ab8500_regulator_get_mode() {
    ...
    if (info->mode_mask) {
        ret =3D abx500_get_register_interruptible(info->dev,
        info->mode_bank, info->mode_reg, &val);
        val =3D val & info->mode_mask;
    ...
}

Does this code ignore the hardware error code in ret and proceed to read the
uninitialized stack variable val? By not checking if the read succeeded, it
appears to return either a random regulator mode or -EINVAL to the caller,
which could mask the real error and feed incorrect states to the regulator
core.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D6
