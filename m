Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369108;
	b=zF57ZYrhi5AccujNERlStbts7ZQwyESbl1kDDHSkmP7tNfqgm5kv2pRH0urw2f5p8GZ4
	 tI5MVRyATgj8IWTYBiXXPASHf4cM+rn9bp/M7FoojetSdGD1oSXju+dWjnA8PK+oDsS/q
	 P9FvqtoZvNJi9mJR7FPpfM9mW1Zv1Zp8cPxlRys7Lrtc+qV91sBRxv64NfUM5DYPDapSC
	 6kWgJUr+JSeEd6FTSgfVyxBWY2dwBeVh/nh75IaGIH1nNWC5CIRYXz8oX0POh7I2qLPeL
	 xuRFWQlx9NSDkBETxpGPcOzl/5BSiplQngZJBmlA/DZjhK+Ttssc+DgX9R/jNZ1zeXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369108;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6PrbC7vM/I9UpxWCcGt6P3S8zwzSBAdSaCFG1xlqVUg=;
	b=wHiNNOIQwz/4SUXxbDdk8WCB2WSKFfVULZtN6O2d7hoW48xY8CriwTTy4VKoxGOI8KF1
	 7QxS1AvpndIEpkPclwhfDvRcWhNVX8ZR9k5DRIKsXcJR416qPePa71eYBXTzCTCaVHp30
	 URhvK8LRam8xYrXPAn9F9kwo7rbONPmo6VZGWUEMrpRu0XG5Y5m8J10311cD0sxsT4oPB
	 U9kXZqoki7bGTC9/vuk0al+5Ci5/77p+zSPU75FluScLH5WBahr8QFIhCUdVvK1XsVKtE
	 +IvDDSCmuVBC/ppaTAf3GqCtb2HsIINqZtIB40LsRTqry1tJWI1GgbYa6o/9E5KcOtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=izXzb23J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB555606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 14:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=izXzb23J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C801F000C1;
	Fri, 30 Oct 2026 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793369107;
	bh=6PrbC7vM/I9UpxWCcGt6P3S8zwzSBAdSaCFG1xlqVUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=izXzb23J21bUnXz84Yp1XW78yBc8KHMDX6kuf6ftArIbyD8TV9tCRnvvuCinw4Zn0
	 FDlnc8qs9FsLuoc1vgvxL++weusD8SlEKPZodluKSqz9C7q7Db5CPUb3AQGpV7EYlp
	 iPE8siXdkveW51vzh9c9kN9OxvdA9FxkTsrgcNUx7EEjx3VTp09pRYEbOB6BZNGYGr
	 XrvK5AoP8i6k66ugFWGWf1N5JZBU+zb9l0y7tPS7SRl2UG08dyLp/+KcYV4g2tfnpE
	 ZR2fqcTefjK6leaXfTpERAnmoehkiMx+B+DTaOkIVxJjZV7ZnbAA4cKFME7Plt1qTZ
	 gShwXEP0Q7Y9A==
Message-ID: <sashiko-outbox-191088@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] mfd: Constify mfd_cell arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 14:05:06 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
>=20
> Acked-by: Chen-Yu Tsai <wens@kernel.org> # ac100 & axp20x
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Acked-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com> # c=
gbc-core
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030140240.2117=
86-3-krzysztof.kozlowski@oss.qualcomm.com?part=3D1

