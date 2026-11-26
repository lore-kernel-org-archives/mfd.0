Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709021;
	b=UYXdkAenCMfXUvDpCfaYH0gmYqt7vdDxoSQYi7Nd8FPFGGJYPbDer1hqTOUp7O5ICXzD
	 x65BWus0S3+gZOicovXUWSML+cbDOX3eLKnUg+PRJyYahDk5sryMaCdvw+Obp61NlsqkK
	 YYJjqkTEd6boZIurUm9P7ajcE4G+Ch6M8AiZFlGsb5SJbMtPQvruVd4CB6k7p2YjtTcU3
	 3WHj0jI4Q7R9JkzcVuX5T0vEFuqCoSW05sTrwkufI4Cg4VZWRUlXsdKWCB4zY9pEf/qGR
	 FbfMVLdU/CmJCZrlOoUml//XnVedmjqY8z764eIjlujqqzbRCZxoEyZH01ktUEJi88g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709021;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=B+txrsHu7j5o8pwxnuB1v5aLJXC6NoKWxlmhHwf5Bn8=;
	b=qz7Knb3qZeIGHhWS7AGq/441YKiCBySyWqqscRftHsyaAEfN/YO3paRPc9QzJwaVJrY0
	 BLKyZXJmRQEk8VJOm3+tHdJ251KONvYNHop+tmUqG3l9gxjhPgDhwcKTGRgUTdOBdsLgY
	 F7h7USEwK6+G85ih1c2M5p2eNNDNvmlgfxGyZdw5FJxIUG1C7FFqsj/4eDGwCeFY3DmQR
	 SK5AW1kQAbMfhuI61sM/9bISq64RJ4GvDfIW+rayRNp8Zwe8cols+Eamv80A6f+aEq+Tt
	 5qvGOeB7n5kZZQFfFgIPTBQy/7J6bznEoVA/JdBejZ91RtOR7gdYwdKVAf1rMAdWwAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oPtEPTlc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB20606A31C;
	Thu, 26 Nov 2026 16:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oPtEPTlc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE721F000D0;
	Thu, 26 Nov 2026 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709020;
	bh=B+txrsHu7j5o8pwxnuB1v5aLJXC6NoKWxlmhHwf5Bn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oPtEPTlcwPf7nqMnUfGRSfpJxwuCkYMrBHuE0gXStHym0mAE2+fNxXVcwRMJJWN++
	 z/eEU7BkmIEM8JBPm5/rGPq/4XcdSXLNM72bCiTjwE+R1v1TuJcZQfFUluRmFeH8el
	 hYD1/syJ7A4jPiYt9Qhf7WydePLs+d1PtX5OIdo8h5swwxzupl+YENXjhAav1oKZfr
	 Jsxz7tKpjBX81xluDB8HZdVtSU01fyMhm06eIYvyAuOEfKmS95z+mE2fUL2NTckIQh
	 rrn49sJ/G75WeYYYjLKn1vA8fg0ErLLAu6iMNQ3nlyUC5Iyw0AdTQLAdivuvEERqfE
	 /jHA5nSpv8jsg==
Date: Thu, 26 Nov 2026 16:03:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v6 1/5] regulator: dt-bindings: maxim,max8907: Convert to
 DT schema
Message-ID: <9a9cac1b-edaa-429e-a5b5-46adba2841ab@sirena.org.uk>
References: <20261123150224.199601-1-clamor95@gmail.com>
 <20261123150224.199601-2-clamor95@gmail.com>
 <CAPVz0n1GzY5BJLUZrdCgJHrkZ+45Kix7VP05EJeiY5FVycwKBA@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="OUa812RZuwcsCrVy"
Content-Disposition: inline
In-Reply-To: <CAPVz0n1GzY5BJLUZrdCgJHrkZ+45Kix7VP05EJeiY5FVycwKBA@mail.gmail.com>
X-Cookie: Sank heaven for leetle curls.


--OUa812RZuwcsCrVy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2026 at 05:52:22PM +0200, Svyatoslav Ryhel wrote:

> This patch is prerequisite for MAX8907 LED patch. Since Lee is quite
> strict to what he picks maybe you can pick this, LED and ADC[1] device
> tree patches?

Please send a coherent series that can actually be applied, it's too
much work to pick random patches out of independent serieses.  In
general you should try to avoid dependencies on in flight serieses, it
makes everything much harder to manage.

--OUa812RZuwcsCrVy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIWFcACgkQJNaLcl1U
h9Dgkgf+KyYu4Nw0RrogrtuvjrfJKiV6tmbXPydYOR53+bO9NDamJpDFdLpqHr1r
+TepBul1oTrOzCxWhdapf1J2R0/sNEOLOAuVoUIOTJYsmCgvDMDCWlLUtxEVmE7q
bpyQoQ034TuYZltCkqOKqnOoMw6r+MwDMFkphah95HJm3n6ghuveZCLFMDjbDkgI
G/Mz+nRgixILpRXByjcwDpBqtiBTYLIp+EXJIS47DGNt5kKOgbbVIqmopGcHeIMR
6wMrQvdvP/qJug/q6jkMTq8HWnU9/+pEmZf61YavEqgDro5Eg/W+9XfpuyTCz+Er
9edyAcAIDLcV509wLeaQOyhj8gB0rw==
=w84m
-----END PGP SIGNATURE-----

--OUa812RZuwcsCrVy--
