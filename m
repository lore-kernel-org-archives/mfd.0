Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351542;
	b=Pid8gzNMAhK2s3QcAnc09Ogyw7WRpMblxW3zn18jnzOk5CKrP+x185VkJql+WSG5ZVhC
	 DUx4n+W28y4wDXj1K2RjihPpCbFq4FcWkiJLJanW7p4jhy/gy5LnUZbXHpnlLAZ2KM+F1
	 N7O2xu6OvnRVm+HNLYRrbSwDtAVBOSlAcCUH9t/dxlSWWqq+ZAReTWPsAuvV717Ua1Pox
	 1lY8bmIVDYV79FCJ//+TmGkhoFV7t54FwTNblHIvTHm0eeG/4OQ3iFL49FSfgOZRULTsN
	 lvdNbH4LE0sue9WjNP7ECEdsOGrze5vgVzxYtSywdbOYU3kEHagvo33WW18xC3n1CrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351542;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VYyh7yjOSROypNLFayAGJQxYM4laq5PoII2pl7ZxMeg=;
	b=GLBLy+es/y41MoxWwl/zGR/jwkGro4HJ4+RtmBG/Z+9348e4SSpk3tE/FaRY9IKTe6WC
	 laoF8tUUu3Tr2ZdiwTbVo98iR1nN6V1PqKPmfKvZnuZ+CHpwg4hdae85mwut5dz+8orwM
	 sOm7sEPVgD6R35LdZuBlmucBD5P9Z8qpEHLjn0l0Z1KoGIUxdHV8VdI3/0ZxGRG9ulML6
	 7EtJ2WiuST6BHTqcFEDVy8diiztaShwFBV7cy37s/lAWhzUf7pwEOT3W5hZbuSngr3KbS
	 XlKwV4/T7qw5yl92KESV7yCP8OYjHzy1Rki9lfxp0CGJ5yp/1k8c5kh+vtP2LKgveNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJQodTaA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61B3606A31C
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jJQodTaA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073871F0093C;
	Tue, 10 Nov 2026 22:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794351541;
	bh=VYyh7yjOSROypNLFayAGJQxYM4laq5PoII2pl7ZxMeg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jJQodTaAAM9AuZmQ3kuf4/K8Rpp1aiVecI22/FmeKYED9jfl7qSox6Oed7jDSHING
	 gq+o16a/ex1YwSL7ORYpcFHfNtpU+TqhbWzOh9ZbPv5fZ9eZsR97R7K89LHalFtQtB
	 AIQpaIrBRb9j6CzCxuik9CCyubTW6KYn9Aem1sfS1W9kTg38Pme+cNKgfbDODkCKOD
	 uxDXUfW1L5MQ5TqSbjZJzGP3ZKf9fdmk0AgGsOQ+jRsifYL7VYmKuUblCXNyG8LF6x
	 aYlk3NX+stB1IaRbwtDxRZeY0PWVttwcvSs5peU5SO9N5cCLfmvYcFTnfU9Y/Kg4Iq
	 HXMmYxm7lF1Yg==
Message-ID: <sashiko-outbox-207854@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for
 domain creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Grisdale" <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
References: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:59:00 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> mt6397_irq_init() currently creates its IRQ domain with a fixed number
> of interrupts (MT6397_IRQ_NR). However, not every PMIC supported by this
> driver has the same number of interrupts as the MT6397. The MT6328 has
> 47 interrupts, so its interrupts above MT6397_IRQ_NR (32) are currently
> unusable.
>=20
> Correct this by passing the PMIC's actual interrupt count to
> irq_domain_create_linear() based on the chip ID. Define the missing
> interrupt count for MT6328, as the other supported PMICs already have
> it defined.
>=20
> Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-mt6397-irq=
-num-fix-v2-1-9d5853a00437@protonmail.ch?part=3D1

