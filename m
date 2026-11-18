Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990605;
	b=36yKnI7NkgV/jk3jqujdrqGhioUrNteNFpZsMflsauNz6Yks3i40w049BS+z5+hg9sno
	 uoqCOd2NcerKlcu3O2YSqG39ORj3kllOlgMM4acIXzo0BYBi89YaHfXtpRB1+YPPoX0Su
	 JfM67LnOpMaIjwODOKcolO0ItR0Wh07WtlBFVscDObJ/W+RfOyaVHRP6MMnaiU0j5SeIO
	 sYB0LEUm+O6ExXXpRsmroBj4EvQRrq8yYPyVsyOroLVyMfkRlxOcNvqRI/kc7tJuP4Of7
	 BCUJfGLeZYY9k/1WLFxi6aBrRzMpHSLKR26xpA8rzytaRcRONP8Exw7AwAxqZNK7/gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990605;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xsK/lFZXQB+cgLHcUDjn/39UGhtxIc66esdx9zu/djg=;
	b=hMzlKfH61MYM0+gH8b6PLX7fq3+48OealRybDjb3vMH4lSfI6F65pAqL6bKUrVUrIODw
	 5kdmuGHIMOKsKwNoTdgc6nedQO6h5OGasd/SSWIO1Plvo17dRCBcDR/nj9sSoB5qztdtn
	 WheIS3z0r8K0MQd7ZQNOZywm3TrQy4OlHUhlU/WpATImRFMWeASqdmwcY0s+dvb07GunM
	 /hdx120Il63RulBSj1OmrYepNb7PKKGx1UYkgBwJ9DfI37U5mRkqAz2wGUsXf/OqDhPRc
	 GBU+flxof085xdl6q8hMapvuVuVbeUDfAk+JYWGmpqnfp+2ByKWk4ui6bg2d7ukcfeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuwUS+P4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C44606A885
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cuwUS+P4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D021F000C4;
	Wed, 18 Nov 2026 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990605;
	bh=xsK/lFZXQB+cgLHcUDjn/39UGhtxIc66esdx9zu/djg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cuwUS+P4O7d/B8XFSxJmEOdliZoE+Qf3vjLce+Dpq/p2vZTDkU5zSmmzbHKuwjG0i
	 /sK2SYTMZxVRSc8mrTDdU2Jt5qDynlej7pviTtRXnbTq26lnuOCjTI3JfgvZFa3N/4
	 /hHcWxGDjhCR1/1+CxFaMa1KfRFTJgRDMO51GD6Pe6NHDUi5FLzzGQT1CzGeRDobrG
	 fAjq2ydjvTT1WzvhfG2/OUD2PKFQ6/QK4ainsaakJyKEjuMXHLUV/Ngyg+M9W6Cdz0
	 wEkKW8ue8JCP3uJ5xAjGR4U1Gc+bnAMLqi70HjwAd4epAaTbTxAo7U8Fmn1YFyN41s
	 1KQwk6JKGoqEA==
Message-ID: <sashiko-outbox-220450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 09/13] mfd: nct6694: Rename driver to nct6694-usb
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-10-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-10-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:30:04 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Rename nct6694.c to nct6694-usb.c to reflect that it implements the
> USB transport, in preparation for the core and HIF transport added in
> later patches. The module is renamed to nct6694-usb accordingly.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D9

