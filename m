Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515456;
	b=dSaPZuneyQuWvBRz+NAZJC1FUK4Ob6+2txbfOo39PKRkuztoxZHTvi8zqs9LEdXB8VN5
	 itiJzywJjDxGsHyCvJASH/OSGp10FS4UDaE5FPoLikcCmylf5Sz8sa21m07TRQmaNsiaJ
	 jVA4KAeN/fLz8p37opapLnO42y8WGa0/QO5ewCQGsbi8tfWar0DVtk9hXEihcT49Tsndt
	 s8ReRRS0wUVDGfWKzqLPsozPGt/MA+OKYPVvxVsL4C0/4X9vrt3bO9is8kNkzF+r4RlGL
	 m2ZjAyPyQJcu6361hoaXqXHtV/sTTwdv/qc2TxmxqEU4+QK3IeWigeY4ONJuPyrC8mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515456;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b6AnnrGlfC8Em4pZFgyYpEDXi7oWX8N0dCzmnOEUgSs=;
	b=30Rxx4w0mknEeECtrtF51iQTN0XdtKGAP6FqcQMr2iQ2ghWavDHBBt9HHFvLEM4Ql0Nw
	 AoB6XIJNXOT2xCwpQ9gl6EigK+nYYfy053CRgrNdG+wDOt3f8aDf5Ctmt5oDuV5sk+9+A
	 kx82GzcB8bIREEnZl8vLsM6pf/MMcZHIkjqug0cceMcBbeM+epru+5olttLuhiejYD1Ja
	 MB7Q6sKJNp3ZTDCT4T93yAI/3zizAcdKdpM8ID0GRNisRknWikCY7J7trcSdu3OfiZ0J7
	 gNGwac9rIDW3QiQEimg6/X0PNWRWwWD9udNMEYmccny78F5s8PD6LNMKXpWJnP4NYiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqWLSi3U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59F606A31C
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqWLSi3U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8CA1F000C4;
	Thu, 12 Nov 2026 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515456;
	bh=b6AnnrGlfC8Em4pZFgyYpEDXi7oWX8N0dCzmnOEUgSs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqWLSi3UjdqGxjcnBr5P3XrYy+t8mEo+ct5XFKTOw8pkJ3VWtTB588FeKVpCy9bmy
	 O0StrnwcQxNtT6ID4O8oS4WeH0hJxdbA8kLHtyt4E+0Rf8Oq4/w6QsP4pOwpfWPsEo
	 1m8U9EzMCRCEHZO9FWJYdSQvCXRO3KM8SQmq0eP+JDW6bLHHX2zudjjOozlCRQyBbE
	 7nGu6iXmOsyc7wP3xKFNwpReKxN0DSTTfheF48NutLC39co+AreyPc+kEVBAx6dNPq
	 uGbAVSMMmz0c4e9Kq9s9/fwBjiZOlTjrqQcsM9tUAMbq2/OprjOW/q0AoTYczW/Rse
	 nShS8Y1GDO66A==
Message-ID: <sashiko-outbox-211794@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add MSM8996 SAW3 syscon
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <20261112-dtbs-qcom-v1-2-1978370c7cad@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 20:30:55 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> 'syscon' nodes are required to have specific compatibles. Add
> "qcom,msm8996-saw3" compatible to the MSM8996 SAW3 syscon block.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-dtbs-qcom-=
v1-0-1978370c7cad@kernel.org?part=3D2

