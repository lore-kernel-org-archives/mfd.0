Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389421;
	b=yIEwsYH0UOdf5oP9M6PJyi+SOdjRj6AXKuYS45xEGTrNjDW+ZnI90Wd5xqA0Etog3Fd0
	 o+lKwxOTyiiCVbwjY5KyW2yUZciLuIbHmpuRuuQv4IN0XU31eJR6kidfL2kyxEfOjdKi+
	 CKJ3R6UyoI06Yrr+iagPFMKrdfQwnteIh57d5sdm9dEy5Srw/sqHvZ7wJhmw0ydhnB0FC
	 +4QsH2t7qO4QEfbYZGTFMmaU7kjP/CJ03Qcf2wd4y9xMLhK80ccUTxwb68G1GfqQmPXGN
	 NLL7il65RnTDgab+mzEr36jOlu+jwcJ1uDdoIrAAFHpSQ0GerFjp4pUeZob5gUDu6ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8+ptz4g6/LlfBCXyV/bHsOFX7dT+x2twzdeYM1zeVdE=;
	b=E17BRGWyW28+CizMmMtQrRGhvvitrjSKGmLKBrCS3Oe7PJL44W/j7xbQ43JGqnlo3uDG
	 v9S1cWUce6m11UZClCghqyxBcCAEqOiB2F/SOSr6e0gZQdbSTKxIhmpYghkzrZIaDyGwG
	 sF9n+z0gRZYSh15nK8y1DSNDyPIY4KLjm3CQuU50GvSRv1qeljqNNHIBEKBbkIxs+QwOr
	 XMrXvmXVa+S7Owuzrz0IFp0AiyBD5QTJHjcgHPZCeNebZk3dxKwGvWsOXtYYIasiztUaH
	 FRMYEiePcz8f5OM0aN2wclOqYsGKHOoPeAJ8S3oM5dosdbSmXItzLEdAHOZMtUD1YQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZhtK1G+f;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035860A260A
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 09:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F035860A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZhtK1G+f
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa5103so769032f8f.2
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 01:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794389418; x=1794994218; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+ptz4g6/LlfBCXyV/bHsOFX7dT+x2twzdeYM1zeVdE=;
        b=ZhtK1G+fye9zLyQGU35jPNsl2LmZwZfjcINZ6ZirBJky0Pes+oaPVMace+3MKrVnIT
         e7iV72uqNTz4A9SrFvmwLMzb+RTqDgfhKV7laQNwMFA622NhUgHTgzPyOLtfcrC4rxvO
         /bekBqSfrNdrjFPFOai13/4xL0283AblsezE42AvFHilEczAguT+/jP745kM8zPf6KNG
         c/iKmdyucvARXvGNQDbv5YRXN6t5PDxWrqX1rpRrKTeoQ3ii4Ut/ibwo6N3T0gaKWn2c
         K8IOgmoNpd4JVihAdU/N0LnKvo76xrv47As4GpMs3idRrTFXrRDmV2C+7TWYR2bnWofP
         6yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389418; x=1794994218;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+ptz4g6/LlfBCXyV/bHsOFX7dT+x2twzdeYM1zeVdE=;
        b=KBtNruzZg0LNsjrOutjWDfl6jqUOOAwKTb7PUpJsjDjf3z385NdN7aRPvH3oUeJd6/
         zmZFCTRc+cE2f2biFrhJyIhwxDqoManjM+7DN/1rUUiCNsGL0IGK2ty3ogjbqTE9HqrF
         HzuyLQfwGWDKPGZypJI8QtdRYzRjpacZeR2BtZwTauwAR/P/Q8dc0LCVsvNq8swBqW2v
         pPQyOCFNm4lVgPYxNl6trh0/K7eRyKcQNMDvf7iRHwyux2nEUax8SCNUbbI+LflpaJSu
         GQBTPZVj35StqXW8pziGZaIXiYwCuBu8gsdVOJakxhE0a6KV8M99/AHHBlvZ/HjAC/QY
         8Inw==
X-Forwarded-Encrypted: i=1; AL+hErEElCEvZyVlManoC1q2EwdVXf6WwQSv+8kKUEeZOdSpw3bSNTD2wNRNVqHGhyUUUuHSGr4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8BWUGcZV1poCex+9hkJFWg68XqP+pfwgUi/sszgYl00B61gZzL
	/QPuwBWk3+QTfRZMHtu+UxHaEHhjmaoifmUA/qpzn/q2Vu9Uhll698HrJQun+elhyZM=
X-Gm-Gg: AYBFou1D56vawfbkSQixDlU2yUnUW+H54Ptou7oMjWgEXO63rae7N1P6Ix8nlKpwcZh
	vurcmemelrMn9OBagVp80+Jc6HbAvkHg1GdHl04tpDkYN5yjHeayPQYpyIiDb4BuNoNNxtz5Pno
	vMbPJja++dnT1yiDC2YGinnxUX7tkvui62kSKT73eeqKfqVIYygHEVaEK7Krsa0Yx+L/PZuJCqb
	2ib+SbCutl21psR4Wr1v6XtiPOOHs8iNbNJPFjsHh3e/aOfBS0h+w5CNG8OClDZZq/YHElC6TEk
	ytOTzSufdT8P0UXasZNEEGsZi1TTMnx+ax1qJgpI2gcvsov8rYbPDTRPFKAqZBKtosN3n01j8YU
	emPmv/2PQTaeplo+YeLMQ8sctKNM7rrokbefJkZm/mwrfGHOfm4TdJv9ic1luzr61TDzWsDcc2V
	xLUgmYzu3VAbbPJ+LdffZTcDgrsGCyuJNEKpcOhhru7qeGsKGhsBLrSykfnFrA9nFTfRYuV1Esv
	jtwyuSpOJw/8BWuHLog0QpV1PTSR3IOrF33VGcADVOzCcCQbse4WWkpBCPo02oq087SBUwQ/JDl
	22R0AmOJfU32T5NN8gY6jQLM9qeRKrmoC7NeZDO555KOqN5J3shiVwmJXM2SpOlKE7BYnhu3SpW
	yQz1W2sm9nJFbvg==
X-Received: by 2002:a05:600c:34d0:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ba0938a143mr31163075e9.13.1794389417741;
        Wed, 11 Nov 2026 01:30:17 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba0204e22csm118293045e9.12.2026.11.11.01.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:30:16 -0800 (PST)
Date: Wed, 11 Nov 2026 10:30:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, mfd@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
Message-ID: <avQzDfZ_p4zx6kzm@monoceros>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u2nb6egeav4wcudh"
Content-Disposition: inline
In-Reply-To: <6b2500112538be613480d472090e5ff6d86339bd.1794347059.git.u.kleine-koenig@baylibre.com>


--u2nb6egeav4wcudh
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/20] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
MIME-Version: 1.0

[dropping Ray Jui and Scott Branden from Cc:; their addresses don't
exist any more, adding Stanimir instead]

Hello,

On Tue, Nov 10, 2026 at 10:54:26PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
> replaced by a local variable.
>=20
> With that change enum bcm2835_soc is only used in the mfd core driver and
> so the definition can move there.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

While going through my list of open patches I noticed that I got a
review comment about this patch in v2 by Stanimir Varbanov[1]. He said
in July:

> The original idea was to re-use bcm2835_pm::soc field in bcm2835-power.c
> pmdomain driver where we implicitly decide which DOMAIN_GRAFX_V3D
> register to use (see commit d4aa5960025a "pmdomain: bcm: bcm2835-power:
> Prepare to support BCM2712"). So, instead of !power->asb the intention
> is to use bcm2835_pm::soc =3D=3D BCM2835_PM_SOC_BCM2712.
>=20
> Please drop this patch from the series. I'll post a patch soon.

As of next-20261110 drivers/mfd/bcm2835-pm.c is still the only user of
enum bcm2835_soc and
https://lore.kernel.org/all/?q=3Ddfn%3Adrivers%2Fpmdomain%2Fbcm%2Fbcm2835-p=
ower.c+soc+d%3A2026-07-10..
suggests that "soon" didn't happen yet. I think it's ok to assume this
request has expired.

Best regards
Uwe

[1] https://lore.kernel.org/b3d228fd-6138-4195-b63c-65b28691e18b@suse.de

--u2nb6egeav4wcudh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0NaQACgkQj4D7WH0S
/k5zEAf+L6c0cqcA+uxO/ogoK7h3f6yigs9+UEtO1Ai54fBtuS/s+FLlwa7NwJ8K
g3g9rUTaGYGRPYFd/E24kwuUH+EL0qhh3KSyBBUIVd+9Pi4ReYtuYOXnHKC7GugT
oEmwQNUnxlHponzyxasPadyxdICI6hQp7IisvXeU2qYe4VYkjc/LUH+uyv8Qa+1T
pXv5ACDnKaGHmnHpvdu57iiYQHlWuEmaPdI/M4yCT2sydfsr/fje7ZLtfyk+OB/e
vxOa7DDoeqzYQ/Hgyw/6+Hzwyq/UW07mTh4KBRfe7k9XGdFTB1Zouh6/dLY3v/Dv
uD6Fv9YMwpZbKUrn3e8+CRvUwarNcw==
=qqdY
-----END PGP SIGNATURE-----

--u2nb6egeav4wcudh--
