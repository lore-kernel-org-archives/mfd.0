Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D1D3CF022
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 20:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629186; cv=none; b=g2grRysGdXDj0cIXFRe2yShcIKdFTiaDjYuI24Qd0wvshJhEr0ygTP/y3aCW4tAycYg3CYa0xlW3I2FlHx1kS4b5DU+qUApJYiCiaNb6z7w4CsUNmc1PZ2oPsihjFGqh9q2N/wV2rUHVp0WZrPxtaRZ5MUrDNg83W2wuwNh0EDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629186; c=relaxed/simple;
	bh=Z3GPFTtIXUelD1/kL+jl53B7oaCT5o/N6J9wMMT+u6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFToee2jk9EzaFrKyvefOqWLyw/SKm4gbMe57cmb0MCUJaBJ3hTwMlPb7WZYJBJz3MsTaACqkeplfE8zodvM5INf8LzRrMi8a9pozoVhYOt8KuCWdWE2pblHWW+wTOok1xpdJvy6ySsgfrCxe/WHBDm5lOYvZ2lu6qXiCHGvWnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=S9bJ54BX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="S9bJ54BX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b7612475so1733085e9.3
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783629182; x=1784233982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BXSrYaUOJbvG4vQ0zkspsYCVmoDgSY1e9GfRz4gqWps=;
        b=S9bJ54BXRxbIHG8M7qDIVxNk0JsbjTSYVZhAu1CShY5tCzRObtRtg11NfW2/1yQoHb
         cmZ76qsjeYUjgk9L0cLdf4p2DR2bXsNyhYkejx8buL+gnUM/MavFoK+Wr0l5u/iwe/ZE
         v8Z+RQ2hBuQ2tPAVtY9zR96byW+5YjCMwWGHZN8D6+j+gNbrFxlxa5TAhZ4zw67yt/GI
         Y5cWWZaYRhtNfB2oxIsDiYK+D0WPj6zO6g1seF/ZJWf9yiMhjSVyLNJzWi0zoAOhiOMO
         pe2xblvAyGLQIRTcHTTfBv5AhKZV/KZf3MU4WEAR+MhZBZSlBT5iojdkMXgvhSVUEUI9
         7Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629182; x=1784233982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BXSrYaUOJbvG4vQ0zkspsYCVmoDgSY1e9GfRz4gqWps=;
        b=LijlH4ASK21bz0sGo9yWmcacHogkEcyq9bdMx5/BnAEwWhBPb5paGPEY4Zptfjgr2L
         UKcZ1hSHOI2QTJpcvotOxlL3/VSWJmUptw6xA6vpI8CQ3G4jLwGOziV7vzwY1OEPDwkT
         7u78CX63BMBfSeGPXn1fIrsMPuti6BVnEd9P/bAAo9oWmFaHsGyezpoQ6OnB/W+lu8Ix
         8t6dyuZeT1MeQLRd/Znwn396thEif8aw4p1xJGcSNwQ2m2VCEbJ1G4YsPhTAdAQl53fa
         P1BSV2DluXszOWRsSwr/HcerhDqFGkQVGLFtiq2DoPyRqRghB5JuejF0rfslNPk841Fe
         xP5g==
X-Gm-Message-State: AOJu0Yyo9X7ov6sgXOsAVIReUQRZ0QAwZTFvvNgg5M3OuaZj/O7dM4ui
	9eUWHBrm+hZXRMDi0H1hf89DzIFz9N9a7QgMkgzO36EaatMrKrX+MSug53pdR+UPMqk=
X-Gm-Gg: AfdE7clqfgXT9qNrxZTvysMCKtjSgQ+96e9snoVJBm3s+m4GvxFR2o4t6ouWbcQdccC
	BfglVpadGa4rHhMaP21R52kZUs4haUlZBJouBL0w/jFtmDnr0BHXuvClCGOPHiKme5BopuMORBx
	CDzXKHgk0l0KzY3QJKO+gfjq1JKTdMnz2d52+sRBLg84h65DfdkGmFmAWxAAQoiwCR1cYUS15TW
	y78ArQb/Bw1HYA+ZWlFG6HCH8paI7y8CpoOcKE1d2zipLRnGCH0IAa67QoO+zITOk3GfZ+QgxTW
	8s2MPQeJl6UboBFw0eXfgk22DJoJmD11HgfWUETqXtN574PY7UO/1Mk8eX6ILF8pk8+tn1fhChK
	jlht/p5De22EsYqpG62GMhmoOF1LL9jd70Bz7udTgRDlR2IEZ1LaBA3V3+LbKv9GQtmdsADe9ls
	VfehocLdIA1gcuvHn88Z94vstBKaps/fVoSRV4oChoO1DLap3KUWNsggdEVw==
X-Received: by 2002:a05:600d:4452:10b0:493:ee2d:d221 with SMTP id 5b1f17b1804b1-493f22748eemr10766375e9.31.1783629182474;
        Thu, 09 Jul 2026 13:33:02 -0700 (PDT)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb742a49sm83267725e9.12.2026.07.09.13.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:33:01 -0700 (PDT)
Date: Thu, 9 Jul 2026 22:32:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Subject: Re: [PATCH v3 03/23] mfd: kempld: Simplify device abstraction
Message-ID: <alAFPoJkhMKP13FO@monoceros>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <03fa806b7c0fa6a68d34384f694cbe83a17fba90.1783615311.git.u.kleine-koenig@baylibre.com>
 <20260709170704.2D2A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zoixihdx2dhnejiw"
Content-Disposition: inline
In-Reply-To: <20260709170704.2D2A21F000E9@smtp.kernel.org>


--zoixihdx2dhnejiw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 03/23] mfd: kempld: Simplify device abstraction
MIME-Version: 1.0

Hello,

On Thu, Jul 09, 2026 at 05:07:03PM +0000, sashiko-bot@kernel.org wrote:
> > -		ret =3D platform_device_add_data(pdev, pdata, sizeof(*pdata));
> > +		ret =3D platform_device_add_data(pdev, pdata, sizeof(pdata));
>=20
> [Severity: High]
> Does this code pass the size of the pointer instead of the size of the
> struct?
>=20
> Looking at kempld_probe(), pdata is a pointer to the static
> kempld_platform_data_generic structure. After the changes in this patch, =
the
> struct only contains a single int.
>=20
> Since sizeof(pdata) evaluates to the pointer size (typically 8 bytes), co=
uld
> this cause kmemdup() inside platform_device_add_data() to read past the e=
nd
> of the structure and trigger a KASAN global-out-of-bounds read during ACPI
> platform device probe?

This is a real issue. Will address in v4. But I wait a bit before
sending that.

Best regards
Uwe

--zoixihdx2dhnejiw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQBXgACgkQj4D7WH0S
/k4RPwgAmYVSgTTgDqfIit7NF7lQ6cM1mSeCrDBWa9q+UuB4LP3DQ5/zoTuBZjk5
S06QoOT4Agdw49etj5uFfmfYWq4zKB7NNygAkQqTwyxFUYPIzWjtOd0apVK3ijLL
2Z+p/aPPM1o0vhZFp6t106aHJlhhzrkFI88X0GDEWBnQgL2TVgzdxKiRzeXlqNxU
+iJVJBZb2IFMvwtj59wxIB7+q0RZwDJN7yTR/sGGn8Rv5bEZYbwUT2ecBouJJKNU
E1R0RJfw3N2SjPW5Rs7sYfgrgio/3Y41yimbNgHyz1rWVuyhmWHo8d9i6Wdma3Dk
ljXknnLpm1glQOjEnqc3n8F3bIsXIg==
=FjBW
-----END PGP SIGNATURE-----

--zoixihdx2dhnejiw--
