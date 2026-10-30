Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341444;
	b=Etg1WE58UXGGdxKLCd0FE2ZF1unXEfVCvS65Wjm++mwa0dxxL4uNhfxcuSM3rbgylcoG
	 6HWQKOiYD3BN5QHwvi7gpeVZwsp0Rlx4TqRAWhiRHxMs8Xm07g0W4xeJPP1+KskEBe2ge
	 e9BgMnwXefJ6cwOAgFcsNPGFMrEburCODOR9BksFMh2vVlMvGxlYfkZxaxGycDG17sRaT
	 3q10Sw8i9DHJMyryWpJL6b3TEn7JocH0mD+3grW8MXpIryPHDQ4E87ueavYlZP7VHJx5M
	 4Na7bqVwFZBiKUxQkYzqeqVh1PUAkxvL2Mur/QG9IrzmIPSsoZYraWZq528q/thkbmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341444;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9DAO4WVwAr+PBqyMYVXFHYiiZ3xGUsXiBeR0swob9hE=;
	b=zA/X4w3f+MtXlo0TD0iLBsHJBZfGy9QLemhuvuLriTZkFkkkMxRQ1fM3IY++elLgJL3a
	 sydiZHuJx3V+jnKIiJhmY74g6BVTH3OON5b3ZgvsXjgZQhPZgd/RtohcdNBZaPquX+n2Y
	 /WKtUmPV1af0xBX//6zHqS6z3r/YQQW5ORYAOqAVcshwYwi3HDJmJjZ6m+dEP9UZsoU17
	 zIK6hjRPDTvFjNSaopMu+Cnqa2ppdN7sf+G/j/6i4Zyf1nBi24DO7pNu1BWkm2+xksMZb
	 jJMJKk/PEbcB/rnUlMoHVuOIeIx0TLgQNVPrj/l7VS/r42q2lfZvRwnX5E+vJHxIAww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Og3OM4nH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D353C606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Og3OM4nH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C4A1F000C1;
	Fri, 30 Oct 2026 06:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341443;
	bh=9DAO4WVwAr+PBqyMYVXFHYiiZ3xGUsXiBeR0swob9hE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Og3OM4nH09R4zSKlmR4nk7jhu5QjfZWbF+NcXakPWw4ayhohyFqV4JyBVIx2t0hPh
	 uHMQm95/jI7zSufX755PUX253Egsoy93tVzKLD9lwfSnA61tbzA1hCJN/Cq9OZewTZ
	 Oax/gIeasSKrAtYL0WRVdxKZg/xFNgoEvK/tWgpjJ7Lee+hXpYl5oKnsG31vfh6FJK
	 ZFDxbbNQqGDNlftew3ADWPYpNzdtXcS2+ej3Nt2MBMQ3wDwUg0sorRkDucV5lcc5z0
	 P8Kb28fWMXLH8VmUB1ixmWnLcPly1Xed4GXXAqS+NWKS27f+tZWfdzcdUYRYDRXCuS
	 iHVB8/kOEekbQ==
Message-ID: <sashiko-outbox-190594@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261030-pm8010_i2c_support-v3-1-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-1-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:24:02 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> The PM8010 can communicate over both SPMI and I2C, based on whether
> GPIO1 is pulled high or low respectively. Since the qcom,pm8010
> compatible is already taken in the SPMI PMIC bindings and that set of
> properties is heavily tailored towards SPMI, introduce a secondary
> compatible to handle the I2C case.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-pm8010_i2c=
_support-v3-0-995ed1ec7a72@oss.qualcomm.com?part=3D1

