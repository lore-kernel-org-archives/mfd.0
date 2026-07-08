Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75C941DEF0
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509929; cv=none; b=aiK7yTB0KJxY8CTNMDaCRAQsvKKvCbtuUtIy37rvvkf8Us+8NR6qwWWJsBqH+KOycybcPEsG6joGZp0Cy0fkVV6BS7sp+wSXp59oqVHdwsdMTwmtGdoWyuKMvYOeVUaEOvoLfTs63bGd7MW6juslvdG9YAwVjL+XSQPJ0ZV1928=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509929; c=relaxed/simple;
	bh=Uyirwt38ZwWBFPglcA+gE5dHheUgIrd30ML3+9ixRlA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ATeXOnbxpkx85+w9s6YKG/YXOrOovQADyVvCs22EQQfxPcYSHPUTeAAeQzDv/bxJa6GKxle2VKityZiHfBphpYQNohG0+khmyJa9gIC2A3owBnTVII3212qnJgX20FYd4mHgaegHOGt0nQBiR8xCmO29l1zYjxSQKA7rPZDhAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyJ6UROt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyJ6UROt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92821F00A3E;
	Wed,  8 Jul 2026 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509927;
	bh=kT/VtVY4qj4cZlOB577yPxFJkiB5rWSz89PuY6Dbeek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gyJ6UROtRuhkgehFZl3lTlDbiVRkguh6n+EXMOKQ/88KvLQRIXzcYS6UgNnG0G+Dg
	 /RUqsFTTnKav1AzFzxeTmhOAdD76hJZHGQNpxKX/CPxwprM+QsUhfj+QYsRZM+W1Hs
	 uQNoArTTbwHAlVLPqH0947gesGOug5/dEAogDsF+u4/5cJL/qCHtZ3oyx107rJCXqZ
	 dZ3CJfBS//svD4EPUGv9pzMDz5FOoBYpjxETlGmQjefZcV194Pi5Q6uumDJUlYIVI2
	 G5Ldo7iMP4+djS8SdO6ToZE/ZZVmmJoj/pB+LIJBxCyM19UWf3p18AirTUS00RrvHv
	 TQNYw4duWLOGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/23] mfd: kempld: Simplify device abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <6a306ad0f1cbecd50332fe52f8f3eb089d8df2a5.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <6a306ad0f1cbecd50332fe52f8f3eb089d8df2a5.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:25:26 +0000
Message-Id: <20260708112526.E92821F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] The local pointer `pdata` is left uninitialized in the ACPI pr=
obe path of `kempld_probe()`, leading to a critical uninitialized memory de=
reference.

Pre-existing issues:
- [High] The fallback DMI matching loop in `kempld_init()` breaks on failur=
e instead of success due to an inverted condition.
--

--- Patch [3]: [PATCH v2 03/23] mfd: kempld: Simplify device abstraction ---
commit d573a2c98e6eca131a75d3abab38caed905aae33
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: kempld: Simplify device abstraction

This commit simplifies the driver by hardcoding the platform data instead
of using the ACPI abstraction for multi-variant support. It also removes
the unused ioresource member from the kempld_platform_data struct.

> diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
> index b64729918dfd3..e60736380cfe5 100644
> --- a/drivers/mfd/kempld-core.c
> +++ b/drivers/mfd/kempld-core.c

[ ... ]

> @@ -415,11 +414,9 @@ static int kempld_probe(struct platform_device *pdev)
>  		 * No kempld_pdev device has been registered in kempld_init,
>  		 * so we seem to be probing an ACPI platform device.
>  		 */
> -		pdata =3D device_get_match_data(dev);
> -		if (!pdata)
> -			return -ENODEV;
> -
> -		ret =3D platform_device_add_data(pdev, pdata, sizeof(*pdata));
> +		ret =3D platform_device_add_data(pdev,
> +					       &kempld_platform_data_generic,
> +					       sizeof(kempld_platform_data_generic));

[Severity: Critical]
By removing the pdata assignment here, doesn't pdata remain uninitialized in
the ACPI path?

Later in kempld_probe() the driver unconditionally dereferences it:

	pld->pld_clock =3D pdata->pld_clock;

Will this cause a kernel panic due to an uninitialized stack pointer
dereference when booting on hardware using the ACPI path?

>  		if (ret)
>  			return ret;
>  	} else if (kempld_pdev =3D=3D pdev) {

[ ... ]

> @@ -787,13 +784,13 @@ static int __init kempld_init(void)
>  	if (force_device_id[0]) {
>  		for (id =3D kempld_dmi_table; id->matches[0].slot !=3D DMI_NONE; id++)
>  			if (strstr(id->ident, force_device_id))
> -				if (!kempld_create_platform_device(&kempld_platform_data_generic))
> +				if (!kempld_create_platform_device())
>  					break;
>  		if (id->matches[0].slot =3D=3D DMI_NONE)
>  			return -ENODEV;
>  	} else {
>  		for (id =3D dmi_first_match(kempld_dmi_table); id; id =3D dmi_first_ma=
tch(id+1))
> -			if (kempld_create_platform_device(&kempld_platform_data_generic))
> +			if (kempld_create_platform_device())

[Severity: High]
This is a pre-existing issue, but should this if statement have a '!' like
the force_device_id loop above it?

Since kempld_create_platform_device() returns 0 on success, this currently
breaks out of the loop on failure instead of success.

If multiple DMI entries match the hardware, a successful registration
evaluates to false causing the loop to continue. It then fails on the next
iteration with -EEXIST and overwrites the global kempld_pdev with an error
pointer, which forces the driver into the ACPI fallback path.

>  				break;
>  	}
>  	return platform_driver_register(&kempld_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D3
