Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518133;
	b=2Mx11WqoSPYgRvqx5pYteJkwyNqulg10A/ipw51D8cW+XVAtOJgEafXtnZMckklgrKiX
	 vy0gRtb11rNJuA72kFTtExYtFp4l3yRbvG6KiXMBKZLsIv6jQvFHmOYY/fXWWlzgEQEHX
	 eobklciQMpHfztsNjGL9S3BiPr2JH5MIcWstl76y8Q3B7gW5TflhvGYFOTUaIjvmaOoZ+
	 vb0Ckk4tWh5PdVBQDL83P8qX1TP92nHtUh9Br7zUShiNUiZAzUgZtJLNSo8eSCHzW4rtt
	 A488AfNesJYaTWgSSOOR5pXpzeysB8mArvdLjKPUm+qOutjVerq7jIPx2zpxgGyzmyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518133;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=e+lCt/jU3tpkl0kQOf3j0dTgZugJxpV+5uXisvasOn8=;
	b=CCWubYeYkasIjPj9N0U1banktYCE5m7t4XK/PkjH4M2VXcYPEQbsh1R3+HfoACxeL+l3
	 rcj18qeN/hGW8rGGhUKbyUem97/EACa9LqQzkHg4bbXpZ2Q5680TINlw5EibpUA5UbXnu
	 Q8NofYVK0vFL6PvAfIrW6lSrqqiqYSSdHbOPIBwCNCu07J1dMMv26YTzxAFYGNGaLcl7o
	 v0zHRp5EjyqOMiw3bkzHCHs04US5BG7rukaEyk0IPjaa1hGWMdAZZEFUFjOAP0wS6GxGw
	 iiWHVzwyDjCQm98sYNt4KZOSHcYmB4L5Ga51dmy/V8y0Espd/odpN8oBTrhdRyZ4/kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A7560A2606
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0ED1F000C9;
	Tue, 20 Oct 2026 17:42:12 +0000 (UTC)
Message-ID: <sashiko-outbox-179434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v10 7/9] pinctrl: mediatek: mt6397: Add MediaTek
 MT6392
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261020173556.632798-8-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
 <20261020173556.632798-8-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:41:42 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add support for the MT6392 pinctrl device, which is very similar to
> MT6397 with a handful of different property values and its own pins
> definition.
>=20
> Update the MT6397 driver to retrieve device data from the match table and
> use it for driver init.
>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020173556.6327=
98-1-l.scorcia@gmail.com?part=3D7

