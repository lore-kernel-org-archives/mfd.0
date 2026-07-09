Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0008D39AD2A
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617116; cv=none; b=pK15lc8Knxck3yZ3CaE/dn5a4KtRswh0p6iAIQzm/zkE+7MA0kEzgJLEqSf1zzfGawbn3sPnLZ/s/onAa8vKAbaj1IANR7kX2BpwrilsT92bfKZ3qxCfBBNcO55V0uef67mkXZKCZ2KONEFcupZXlYikOJaT9dLNcRB+ifh6jK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617116; c=relaxed/simple;
	bh=yEObGtyW17lKsJmt/Vzm42NtzJctnrWPtLyMykhlCFM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HX2uv0nFgxgXucxk1cjgLFey4JbLS2exVv7tf0dbbLVHIcSs1Oh2E8yndlTfLsZtH54n09tOa/4SUWYhQro1YQjYnzczE49sIE1FHZoHDdYzHxNnRSOVB10ESD2wqHgaN3zma4Ddbuo+mkuRCIVsUonMS5kaSL2NMQjAdsWKGUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DO2ciH7T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DO2ciH7T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9F21F000E9;
	Thu,  9 Jul 2026 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617114;
	bh=Exlhlfg1R+/unc/m4N0lEkXRqSJHKC1YeS1btOgvj84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DO2ciH7TPDjAPKD2vE1CKK5+qcBP4VAc7SCWv2LBnfKJtWbl5OekXjblEGJtyljP8
	 aE6Q0DwHoCWYKwsAsyumnJDH7geuzji/2wdip7c2Z6sNp4Q+Rf9sQUSOQ14B8pdvxo
	 tYQj8jkcsrsZb0iQv+WgiZu1Q8Na5Jv+z4tEhtUneXswn93X4uQujJksmCtJbUGpgM
	 +O5qKDmfr+1wjlgeK7I+UlqzR4BrVBA4OBqAnT6zNefbSiLfWxa99yZSwjqordo+a8
	 8bPfHKNpvDKAzP6OkKVQhS4yfumZDEnQxT/Fwy5nPUx57fCdm+24Z7vd92rLQf0OZV
	 oeeZc/RYkyNnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/23] mfd: lp87565: Explicitly set driver data for
 the generic dt compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <67f459e39590ebe562964d59c4af63c62792f237.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <67f459e39590ebe562964d59c4af63c62792f237.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:11:54 +0000
Message-Id: <20260709171154.6D9F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `lp87565_id_table` lacks `.driver_data` initialization for the=
 I2C match `"lp87565-q1"`, causing it to default to 0 (`LP87565_DEVICE_TYPE=
_UNKNOWN`). This results in incorrect regulator hardware configuration when=
 probed via I2C without Device Tree.
--

--- Patch [4]: [PATCH v3 04/23] mfd: lp87565: Explicitly set driver data fo=
r the generic dt compatible ---
commit f107d6a5ee2edf7a6184a1ce8ff288cc9e3dcea7
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

    mfd: lp87565: Explicitly set driver data for the generic dt compatible
   =20
    The driver relies on .data being (void *)LP87565_DEVICE_TYPE_UNKNOWN
    (i.e. NULL) for the generic device tree compatible. Make this explicit.

> diff --git a/drivers/mfd/lp87565.c b/drivers/mfd/lp87565.c
> index b78ae79df5fa6..efea1ba82811a 100644
> --- a/drivers/mfd/lp87565.c
> +++ b/drivers/mfd/lp87565.c
> @@ -26,7 +26,10 @@ static const struct mfd_cell lp87565_cells[] =3D {
>  };
> =20
>  static const struct of_device_id of_lp87565_match_table[] =3D {
> -	{ .compatible =3D "ti,lp87565", },
> +	{
> +		.compatible =3D "ti,lp87565",
> +		.data =3D (void *)LP87565_DEVICE_TYPE_UNKNOWN,
> +	},

[Severity: High]
This is a pre-existing issue, but since we are updating the match data here,
does the I2C device ID table also need fixing?

Looking at lp87565_id_table:

drivers/mfd/lp87565.c:
static const struct i2c_device_id lp87565_id_table[] =3D {
	{ "lp87565-q1" },
	{ }
};

The I2C table lacks the .driver_data mapping for the Q1 variant. When the
device is instantiated via I2C matching (e.g., via sysfs new_device or lega=
cy
board files), i2c_get_match_data() will fall back to this table and return 0
(LP87565_DEVICE_TYPE_UNKNOWN).

Can this misconfigure the dual-phase bucks (BUCK10 and BUCK23) in the Q1
variant as four independent single-phase bucks (BUCK0-BUCK3)?

If consumers attempt to control these independently, could it lead to phase
conflicts and physical hardware damage?

>  	{
>  		.compatible =3D "ti,lp87524-q1",
>  		.data =3D (void *)LP87565_DEVICE_TYPE_LP87524_Q1,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D4
