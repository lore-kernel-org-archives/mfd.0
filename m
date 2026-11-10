Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348148;
	b=y39HgMsDuY+HPw2Ty+gIUn0TTduhjVINN6rzX/H9WtxomMZx3pDAATovtmL9zwq9P5wm
	 mDRwqC86D3N8AwG+iY4lPMYLhq8c94bulaLwYMJ3gWZyudZbAAWqMGcvpVJMmWfgDa8ta
	 9DqtuGrfYLijtaf+KNeCK2i7r0p2QnCOlRAIhqjrQvVv3Hy90ac+I8xjPFqab1H1Rrjec
	 PoTJxMRkWXqPObdOtBomaZ7xdIZ0e8wwIBMDK0d6UxkFRKtx8z8suyI9MOAfypD792qNz
	 y+F3g+iRxCscM8efN7bKKbK/sWZMPs8eUyog+8UzTT8NGtn7sCbt12a0xITNb51KExA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348148;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jCLnuti4ltWMRxQbuP1VrHH+zMSvd/R8kTp3gKU5eFk=;
	b=dJzR99fxnYzEawfho6he6h/koap3WLPl95htHPzfdJFqsf2CHUSiRife8iTy4hrWPkyj
	 hkCA6TRl+BgfrZ8weC8/zXmKnnU2PuUNHhi2QDDYfOJOUgHPTtlkr1RtnT73n78Ym1aw5
	 2C3QBlNFob1gfJoAB0s+V5u5m2Z2/QeFcNA5I7hGUKFnOx64Q+UDi/Nnf3cjhdySLQ1H2
	 S4pU2xiYe2A3DatVRSZF0mev07oKjuv3ITcnGVMexk+Ww7LkrJxJUsXXbUaxT+Z86LeZL
	 z4s6LHMddkEJwpb7wSkrNEeAZtmihP8433UrPusKG3Tm22Klu1q7ZCQEEDF/VdDmVHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUkgcjn0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04113606A321
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUkgcjn0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A613B1F0089F;
	Tue, 10 Nov 2026 22:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348147;
	bh=jCLnuti4ltWMRxQbuP1VrHH+zMSvd/R8kTp3gKU5eFk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MUkgcjn0gorhaG/Qyjf9oZGW69hXPxmDqAawL1NhFrOFR3D+u0EnHHP29EfZMp/k1
	 4w9uPwzpMzANtqX+9JoxPuo/P4IpKXbqTtO4eZpwCaZ1I+vCaR/LhF+nBe2DSZRYPx
	 V87BZCDodJnEZeIJuyGTyzZ7AFSwc+3wapjGxKr7sWWqy3by5t5K1UgjQ1lVbD7J5/
	 ibtulrO0/xCPG1ncnVuZRheJwN6h6uVjYf3kFIUgWLKMB//sbLbQzV75x3K9AR551j
	 Hlv3OJ+nFLinOgtVR57AooG/WN6PjzZ4/0uusp2ohqb9RiwleYTJMOUfTqv6PSRHMd
	 UCaXV4NAx/spw==
Message-ID: <sashiko-outbox-207808@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:02:27 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> These arrays already mostly match the most used and generally
> recommended coding style. That is:
>=20
>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
>=20
> Adapt the offenders accordingly.
>=20
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # =
max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D19

