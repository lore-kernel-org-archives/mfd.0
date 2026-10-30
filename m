Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341546;
	b=PaO85Qg0zsBUPjxdmzuXkjhi7BiuVJSM7P+65sVVkZg9qF0wTZZyKB0UQ8lAsK/ysQgD
	 jtg9sXGkuX5rEHDfpeCBX/w7trywFjhP6vebKuh8Yv0rBu12Uz1AFft36DsYA6muUyKs2
	 U2q5/pBznxpc0BZrT8GVi1SvlPVD9olOh9XL+78foiVTWl95fuM2oogpr9XxammHGiP2N
	 Pz0V6d80GN1w5IO87CSsoYaKS/BKdlTCA9whr39LZKIihLY8S9ypiM051Z4dvbeZbNaJ+
	 gHIul1gPa59NdvXqvuQf8s9N3Ri+/2jmwGIoHPfsN9nMGOQylzmr9NQqBpwDT5/04QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341546;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oeFbFCh/kFo2zGGRXUOc9VK2ACAjuedkw2HSJijoomI=;
	b=Ut4XhA2/aa084FQKbdZRMelvZ1lcvX9BB7oD+PH/RrWD41tG0PnFG0Qo4RmkOuk/DbVF
	 s7U5eam42v/3dFaz1wEF/yzkzlOBlwFkNOfVGEQZ1YsTP758KJs/n3gH0+3TNM4tOCTY2
	 24+LfCHGqY6k61aqM1MM8hSOSez1PVGElyWU+nUAMggmY/TAP4RKS3qtiq/m2ds+bMj8v
	 OVp3ODPjKFFzwc7lo3za94Yu//2f9Gq07xq0MA5UwLkh6ShNNdpW7Z8auV49nQGt9TH5R
	 f5ZnxWsNwo0Lln4dqh2o43JEfkI68UQvTPsqNfM06ig0aVcHxYdf+9s5ze8XNHwhJ/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0tjx1vN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5EF606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0tjx1vN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB301F000C1;
	Fri, 30 Oct 2026 06:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341545;
	bh=oeFbFCh/kFo2zGGRXUOc9VK2ACAjuedkw2HSJijoomI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y0tjx1vNSwPKZ+QbDsVgQJjHr3k7wWFMPAiKk5P+GNjn+TBPYOt73EU4h4gBH5SCq
	 HDsIMSDHEQctKiflr96MSyzGTCu/POgHMfsk+zIjO60NIkIsjNvfI+qtwecpbmOg27
	 OwX4c/LmgEEKj7Nb9JL2D/gniTtAx4J1uYUgQ6Q9tFjzcd2nK2CFrirqSbiRCz/PA2
	 7keqXgCcMZgv3pGGIwe2xw3vv4YFvHC1ugUR80ghSjSVIg50QPAxBerFfgLs4QmEuN
	 ZVc33JIvWXBC0KGpLXJ7Ax5QDCE6gEGVAW2LMmhNfk/rnwdzu9fQbbsP6wrxOb5rK8
	 wyVbuTImh27dQ==
Message-ID: <sashiko-outbox-190596@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] mfd: qcom-pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261030-pm8010_i2c_support-v3-5-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-5-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:25:45 +0000
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
> PM8010 is effectively the next generation of PM8008. The device is
> generally designed to serve the exact same function - power camera
> sensors and the associated supporting hardware.
>=20
> PM8010 supports both I2C and SPMI communications. The latter case is
> already handled, since it reuses the same peripherals as other PMICs.
> The I2C front-end is more less the same to the one of PM8008.
>=20
> Plumb in the necessary changes to support it.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-pm8010_i2c=
_support-v3-0-995ed1ec7a72@oss.qualcomm.com?part=3D5

