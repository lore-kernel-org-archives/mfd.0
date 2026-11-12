Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515375;
	b=NDVHrf6DYtjLjOIb7si3t+wy034lDL5zNiIiEuk6/AaaDGOo4nITCzTEwGFuKV4+WVuV
	 fqzH6GZ0/AbGmJeceHjxvQZ0ErGkCx7+I7WGE/EZqG9TCzZx7HiZooo4rmlkpek2HyDBq
	 e5Mh0saRSvS0nEV/3JXUm1580htLevZMz56W9a4FWughDFv5Zl4qcxy7yHwmsJt1U/B5E
	 UvyNVQ7M8Jqr1j5AC9vfYEbEEbBU/BN+tCnpxrfonCt6or01OfNFcGiFY9aenceJPUmi2
	 vhOl1YOUqNju3Ov5cd3EN1PvmORehvHyJ+y2q7YbrC7pF6PWEFa0becyB5eNeYOzNjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515375;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wVv+1zaFblC+QwYL8lNmgNi7aNM7OlkPdvxsqqA3DOQ=;
	b=JxHPpEDAc7h0jcLLm9QLcZpAReSNjpCCj77YV+Q85Am+CVduUSbLa8j1th952mEa5pRT
	 TjOg50z8iPIxjIJwBVeH2S7/SPWYJ7Tr8KdaFMhUxhTzhbFNfjlvVB9SmVWHa19poDJFL
	 7cSK9LdyTtWF/dP/T5Wd6+3AzBm/MXvtgUDlVnsDSZbuWFWHBl121kDgku7hZjFxGbkG6
	 DPdCzTilB8XmKZGGircc5XaFB4leXVVUOQe0ZP3bUW/bZ8kpYqIGJdEADKbz7L+Nvcq6p
	 mXqpCPPhWwYoPlsvlEjzdAVgg5mHp5qFGGDQp1F25uQ6J6CLJjYZC/ovMRMjTzl7H5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KRM0Oo/O";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEE7606A31C
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 20:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KRM0Oo/O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46C11F000C4;
	Thu, 12 Nov 2026 20:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515375;
	bh=wVv+1zaFblC+QwYL8lNmgNi7aNM7OlkPdvxsqqA3DOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KRM0Oo/OIDbu96F8eHgYOAcNEE8/svBjw8ki3J+0Zf0X46WR/hhsIm2bl7UT1TPAF
	 paEYzKwqlJXdADfZjlAwnKFrDZGZc4zzooGORpzWJLIGdCUb7g6U28ohM53vQfZ05t
	 /QY+LCZwn75bdjb6S4ICCbMftrZ2VmgCifCZgz0FxEtAOYuBOuU6JBXr3OeKrUKF8G
	 bSks73J6sc2Y8SjbfCaceIBhsJRx0qZP7CWAZ+FWjhtU3oeKSbJgBBL5Hu7gWtE2YN
	 E5LLxIExJB/kuaguRp4SFUOCO5n1lvQ0zhgfGYUdDJypdDS6YZ/kJHzG2wFFkXOmKm
	 8Q4iSiRQ8EqeQ==
Message-ID: <sashiko-outbox-211793@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add MSM8996 SAW3
 registers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112-dtbs-qcom-v1-1-1978370c7cad@kernel.org>
References: <20261112-dtbs-qcom-v1-0-1978370c7cad@kernel.org>
 <20261112-dtbs-qcom-v1-1-1978370c7cad@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 20:29:34 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add a compatible for the MSM8996 SAW3 register bank referenced
> through qcom,saw-reg properties. The name is based on the label in .dts
> files.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-dtbs-qcom-=
v1-0-1978370c7cad@kernel.org?part=3D1

