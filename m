Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792518293;
	b=gvqqBaEVkGu6YqCR48gBMuu5Fi3Zx93z4ExvYjr11frPZOiwyenS3Wk4NFFVUpmJNNBP
	 NrCSE9UBgQmf1FyDk6YAWU3g00pMIc1jS25X2eyXFAs04nMfw1k3/v6cHEmKFwxErfHpH
	 FbX3r+VdgdKoka8Vbap842iFmQAZcWYvEp5qmWah4EpAiv13UGBQaJh0NtR4EUPjdDxBH
	 EJWXMN0Qw0dQMm47elDuZl+p7qGDeuJ0oQwe5ZpyXfSF0XIpYbv8VVEQ8E1BBmwFFC6mx
	 TjZVVIcj+5pyUbMCWztIyCexl3FvhovI4RHjb/GEPFM6x884mNRUmFESPOzDhlE++Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792518293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gbdxaVeEJ/4XHQ/33XM4N2HNTKTTCvaqEHL/qghmKww=;
	b=1ORqASi27NX5gFbgKdxzDiVTWAXo9+PWiNYnfv1s8H7B96QFNYhGkOpoE4FhvidCIaKK
	 vE9ksmeTlxq22ZVh5GHyVi3e/KvvUt74w9uDEGhzvHjcC/WBrLV6IBgl7YGpUltCyg/Lx
	 JLNfQnWpOU5x1y1Nqva+e+7WzpaU2xgdCt7SRqf/pbNIYg9yGw6OreopCYs+Wo/Byn6ol
	 J/sa3rl6TNZSUr48nQ3jDEyd0HSdSpMfBYAT1dyX4Pom4lVVM9U2LkQjpjyIKIlYZpbPv
	 YONFIk8uNHtp9eGuU2tGpNFwADfy9qZbDYNV3ChcC11GCsazG12JWMy2r33Yrpu+ERg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4OODdLK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9C606A319
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 17:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4OODdLK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A22B1F000CA;
	Tue, 20 Oct 2026 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792518292;
	bh=gbdxaVeEJ/4XHQ/33XM4N2HNTKTTCvaqEHL/qghmKww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f4OODdLKbOVBEG5Y3xvPJ7JtjtS+Y9KyNtuxEPoYu+t7M3q9UVBhZ3fMn4riqCxl1
	 LFnIgux3KsDSRrMGELEGVRXwQ7YXVrQG8P2h1wvTIW8PcK/U1mSCIW4XyCFfKgtJDu
	 kps03+4P4JY+gEkKMCaLBMVNP3R/4ZTYYIrC9otN6mJ1aubkKnoKJfp4Q5YUWsUNlo
	 PfNtVzgmlHkSPzl3kGn2YjmGRSYxPfVGuBh7Ut2NG17TeUm1kVNl5hOCrMYSc+xhey
	 DxO2lNbyPp6Om49yjUSj+geHPnhKzd4DpkO7rG7v8R1VR0IqlX75WoLS0bfp94aGeu
	 6qO2/cLa7bOJQ==
Message-ID: <sashiko-outbox-179441@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392
 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261020173556.632798-2-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
 <20261020173556.632798-2-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 17:44:51 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Describe the MT6392 PMIC and its RTC and regulator devices. This device
> is mostly based on MT6323 with some similarities to MT6397 and is usually
> found on boards using the MT8516/MT8167 SoC.
>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020173556.6327=
98-1-l.scorcia@gmail.com?part=3D1

