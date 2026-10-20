Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518164;
	b=NwkIt6pBI8axzDqIwB/z7dv6InBHWrFe/Ezx0w4//UpfPNGqmHLrMVTe2u0+W5TiuyLO
	 LyVdgg0piC5fYkmb8J2ZPeKmLux7ENnAdOS96nn9FdCJWxIYZhYE+Vpjtq5S+XWVCvC0f
	 W6rIUoeNd8TGxqkhcPrGrhumCZwZcCGawlZwI3fCOIIincurAt/pbx504NCxIH5EeMO3X
	 3n0hsojmtsaOTGogGOo8GCIYbTGXh4nl3IcegaLkk8rkHTsoAgpg0rpcFpvEANZtjtIEX
	 OPMztJ0kygutA581FbAuvA8fx6OoTU6pAjt/48D/+wCPQy9BR9+HgMyrBh5TCctNpOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518164;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IxtxgHZVwcHDCVhWE0kABKSPqKm2bUhACdNglMe9LCg=;
	b=kdNoWt3IhuE4Z6NbUttCC2vuJx/lX2zM9FWHkiCGnv5m57R8DnCsWQbUxC7w7QS53Ede
	 VbNQJYGtA//SDZoSxMBTGa+TBP/HFT4diZui5w8FUDL1NeMr0hCBRCW7nr8tJNI/s6G7U
	 I5sg82EQ8dkgoy1Sg0EU6i9eyABJocm+luH6sOOR0MeAlyTK1xgDewbUyDNJgKYMDvGL5
	 U9/Jt6Wy42lniG37gwmoZs3qCuz19jJiBxV+pUcNa2PYF9PpxGp3CCLiF1kAb6cpGzFzi
	 VYKO1GTo/ZxOEJND+IRAkPmUPHRhjo4E/IisMBtesX1r/vsjScP8Ewd5iTmnzhefKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FE3606A31A
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706221F000CC;
	Tue, 20 Oct 2026 17:42:43 +0000 (UTC)
Message-ID: <sashiko-outbox-179435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v10 2/9] dt-bindings: input: mtk-pmic-keys: Add
 MT6392 PMIC keys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261020173556.632798-3-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
 <20261020173556.632798-3-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:42:13 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Fabien Parent <parent.f@gmail.com>
>=20
> Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.
>=20
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020173556.6327=
98-1-l.scorcia@gmail.com?part=3D2

