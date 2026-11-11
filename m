Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428557;
	b=oH3UpNAeDQLvd/Dh1FXEZ/huST1fccy1Q5AF8J2WFdBYDEm6OY6H7MulRJMnfveSx/xu
	 jOgAMRhYufnq9Mgkh0A/vbzHUI+YAIVXRxYcKDWZxnqaUI+sp0YuEpcglLC+9bhuk5cCc
	 4YGj3Tz90uxWwB2neYmzRDpQm/7ALGp/oUGasHYR0viLAI7fsd3Lc5F9y4r1aU45FpZQq
	 x9yCd82ODwvd28LEAjQaZ8ZtVE6umMu13rXki+o2FeH2eF+qOXJMiNJwtRZXP0/paIHND
	 xirRW1y2HZTohX+uP3yJXdyrUg1jx6qoREpVTCS2Ypg0hrRALdWodWOGX1OLLprIKLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428557;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2EfZJF4OnYOe0Wq5LImMhsoOyFlI7Bde1ZwWA7GgQ7A=;
	b=zQl6f9ImoXFD8Iqcx5r7chOIBpbwCPnK6zDkvwKOX/i2K6k3zPWovHNZ9v8DCQ0uAerN
	 IZ74nJ0M6DwHqUoFHhibx58OeLYAWP4PM8dlNPfc6eKKiSJLJWsD9/G+XmTer4rJgoQuX
	 KPUn8pwiFSXX1J3Quu95RV3IEYp3xmGzjmRu/4LHru6u2gSZeIKCfQ2ek/Qf7iHoIj1Ag
	 WLpg7l8TMZ1vItoUgW6+iy/JyoLJgNbtAXuzGlVqlRNrpJ/1TJpqS1KnSHX7CTWLoOPY5
	 Wboj1ZGjKCC56FLIc1QkeowR8XN9SqyfXd0AyVS6vN2ZjuDkLzBw5fF80I2G0rdaiZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIDDbTe1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E877606A321
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OIDDbTe1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97851F00A05;
	Wed, 11 Nov 2026 20:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428557;
	bh=2EfZJF4OnYOe0Wq5LImMhsoOyFlI7Bde1ZwWA7GgQ7A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OIDDbTe1ZA6q1ee/0iLIZYWgp74l4SlAKVk2ofr7DF8Ky8roLVuzDoXON49CuVfQi
	 zfdknY914iZkOwJ+czB2ZL0hwSQv1/dId7x5nDfjZEzTHfsDM0cNFj0Z8Q25biQGYh
	 zL1KAb8fobxRifN1aQmXdKqiIlVGwdHRLru8GQlXDt6WiDpn+2J/753lTjBWOaDL4X
	 FfhhrBSdt5GbdU+Jpmol12CQfyHR+o+xU9ThSGOZatLTaj+v/qg60BALjlaH12ZayW
	 AA8j+L+RiplZhgTGnAeocJpWjdilhpgKKKfkeEcEtWzvRuaAujgOgIjvcgby7Nth1m
	 CnN2lQfym09kw==
Message-ID: <sashiko-outbox-209645@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/12] arm64: dts: hisilicon: Add specific syscon
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-3-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-3-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:22:36 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add specific compatibles for HiSilicon syscon nodes HiKey reboot mode,
> Hi6220 media NOC ADE, HIP06/HIP07 SerDes, and DSA CPLD syscon.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D3

