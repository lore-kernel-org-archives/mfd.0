Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1047E35975
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612049; cv=none; b=MH9KYcwwWEPeX259VinLPrdQui8pH38B+MlWL0sv5stmR3UJEUujbhE4DSEKMEuLA9s8Y0ryuNJA2cmx3Ge3bPlHt+ZGhg9LSSLHqEA5/DsmzLXZFS5DJ45xGdhvYgWKoRy+X+rY+XtqzBhf6sydrDcIMQ9RdXC+WKbwMw20qMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612049; c=relaxed/simple;
	bh=EA7L7caIXI2XAV/oDH4j4Pgo/dJQkGiWu8U2J5PGXRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3xjz2rVLlXWPLCCgID8wmmHrCVJZwpxEMzB9kqML0cpqr7EcpaMw/TMEmMT+/nVYBOEtOLK+Ssw2itHIEizXPA6DO2chVzfE0s6PQ+Hft1X+xSnsvMho2CY+ZI+nVAlgLCtE2KJpoYxVl9AuiJRC4F2zrj74alDQzvPy9GhbFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kEh7G2k0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kEh7G2k0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ed9d8c5cso4874625e9.1
        for <mfd@lists.linux.dev>; Thu, 09 Jul 2026 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783612046; x=1784216846; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EA7L7caIXI2XAV/oDH4j4Pgo/dJQkGiWu8U2J5PGXRM=;
        b=kEh7G2k0zx6BuxgNgvQ2mU3a0QJUAioyXKclgmAbO7TgtzNbQQ9NCXStIuccTYvJzn
         utKWiHY6HmNjBJxjz9lLHXi2NVENibRm/CvJlMk3id+EM+PUo6eVC6pCST4vivFJ4xRq
         Tmp3cBEZroBPzOeq4oeTT2xb2mttAC0+834pTdlKYZc5UpUqyMLVxTCpB7ABomg+Ial5
         csBg/Z3bPAQ8GOl7k5WDHAQzchZMI4B8UBi09c4bpnrEkJtYW6Azq/tc6GADAggE7oD9
         ET0yGeFcQinDdykvAywpEFFv7MjvVjenFOAZ8/zt6DHcrwJUKQYHIy+p/A2HWg4ACdxV
         graQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612046; x=1784216846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EA7L7caIXI2XAV/oDH4j4Pgo/dJQkGiWu8U2J5PGXRM=;
        b=fTHb93HdEdoyeACaqW96zx0eRNfzngHtv4nxcXcUrAwJ6VXuCYMED/Ft8bqVYQB46n
         YAK6UQoEWEYMtra0hPFxugewaCWa/4zJ/x+aoq5mSGFgRNIFBaE/ZucsN1inF8aD5ABc
         FOkSaLyBzQikhap7I7+9Qk9wFBsOZY7ijGC2SWnaxzAAPiel7k1U+sgcpMH/qQ5y6Ud/
         NPrE+TCMY+NV0fCpMKIgRPLUQN8ZYW5aEWCffkXHEb2awGi9LIjfoFuhucxGkf/49rjf
         8avLA/8ltYU2eEzSQmlxsAkNbStpmGTQo8E8T7uDNJXeYH2niSngH1+KwKJESzG/SzZs
         2l3w==
X-Gm-Message-State: AOJu0YyY9cPUTfSZZ0VdkLox1QEMysKzgESkH8HoDbX9Nd1YxD7UkDH/
	p6LWUR8syc1J/+JqyGiLK6cCiAlXFZCINI1noOj+aL/ejE6LpPGfqz4oMchKK984MRI=
X-Gm-Gg: AfdE7cmniCg8cFL/NUb9/3A31RvCRNcuGKswGQ4G4KpcRBlGps5Z3IY4OXiVVZMn3bp
	sGgL5iyHFkOhTN/Hss5RljjKf6kComxMB8Pw0pCVyQ3nwqQjaLty06U06OzhHlpLRYRlIuv3s/m
	uh+hEBF+BknHlYaae3pCdOmp1i4ADa0eUCA0j7/AJ2gkZctXqieiaszZtTCkvvEYBdh0aVMHiMc
	R2SXbk8fPd/GnPU5QOKSA4O3IbB/v1WtA7M8yLtkfpanN90fbEtwQQZB7YLEWQ70zoUUoqzEaAV
	bvvwmrkg93ZBOew4g3vUTOtxRvg4uN8fhHUv1eg8r/30gDOb1QRfCtovW64PyzsnZZY2k1t99GO
	w6HvfvfLaYEbn67xGHU33MdJ0hz8dB4J9T8uJTdvfvGWSzrNXe/NW8ITCftOYwHBmIzA8qmBEcn
	omAoaE9ra2xHshTij+cp2bi+qJ+ZgXmd/DqrGfCn/X2NHA6TdpFY5AGjxwA3It8NrqbANojij8j
	WM9
X-Received: by 2002:a05:600c:3e88:b0:493:efcd:b809 with SMTP id 5b1f17b1804b1-493efcdb895mr16436325e9.6.1783612046460;
        Thu, 09 Jul 2026 08:47:26 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6ccaf1sm124528725e9.2.2026.07.09.08.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:47:25 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:47:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Subject: Re: [PATCH v2 15/23] mfd: Use PCI_DEVICE* macros to initialize
 pci_device_id arrays
Message-ID: <ak_CNIdQ1QvF5TKM@monoceros>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <afa9a60627dcc211c8d975c6a90708d421ead8e5.1783507945.git.u.kleine-koenig@baylibre.com>
 <20260708112723.080911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2nh437hk5opgvhwa"
Content-Disposition: inline
In-Reply-To: <20260708112723.080911F000E9@smtp.kernel.org>


--2nh437hk5opgvhwa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 15/23] mfd: Use PCI_DEVICE* macros to initialize
 pci_device_id arrays
MIME-Version: 1.0

On Wed, Jul 08, 2026 at 11:27:22AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Non-standard commit message prefix omitting the driver name.
> --
>=20
> --- Patch [15]: [PATCH v2 15/23] mfd: Use PCI_DEVICE* macros to initializ=
e pci_device_id arrays ---
> commit 01daeb728dc1ab5baf28174c28473f068ecb03ae
> Author: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@baylibre.co=
m>
>=20
> mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
>=20
> pci_device_id entries are usually initialized using these PCI_DEVICE*
> macros. Adapt to this more usual style.
>=20
> > mfd: Use PCI_DEVICE* macros to initialize pci_device_id arrays
>=20
> [Severity: Low]
> This isn't a bug, but does this commit message subject violate the MFD
> subsystem guidelines? The guidelines require the prefix to follow the for=
mat
> "mfd: <Driver>: <Capitalized description>". The driver name appears to be
> missing from the subject line.

The patch adapts two drivers. I guess mentioning both in the shortlog
isn't the right thing to do?

Best regards
Uwe

--2nh437hk5opgvhwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpPwocACgkQj4D7WH0S
/k6+Zgf/e2P3Jm49aEWhJ3uv95ltjPYkZ+KJNBdK6Y9AVMqXklrF9ZwuMcVKFl+t
A+QvKKSQZFV28xhELbE2W45eFDeCNRN9fwqyPzjIXRTWsLHODclxYFlrczsj3vkh
5eIEZmmyiMxKk6scUpYFYQEODV/H79yEOuSKo0P1rRDCkHONCn2N+WmHVJvjhGUY
Y3tENhB1MP/n5Nw6HfLRg/BfLqQxz9zcl3reovvJha1dX1a27SDpb8citLmu4uIA
1fYLArHPSeBMAHZpZocMncfVRQsYc4Q38IynIggoQDggAcvJ2toNV5hhyRRR9zPr
vNeMHyvlQpg4VNes4oXJjgTwjmWTMA==
=3WMp
-----END PGP SIGNATURE-----

--2nh437hk5opgvhwa--
