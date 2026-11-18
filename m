Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020130;
	b=uQpBelg+58/Ph7YEnBbLfzm1mBLM0aP5GTq08IXwme+C0U2q0jUFwTP4VT+NYKICaQU7
	 efDBCJdv8xnh1EDCDHHf5Q4Nmg+IiBtnH71sfP8VGeJLfaH6KCopJtghM7BEDeNdnebbJ
	 YoPLsHz4kbpIDdrR8tSX/guCAYb6c/FxLpaSatYD99EGh9pyq1iDTow2TsnbzrH0y5Na3
	 0N+Rus0m5azXcQILfhhpg5QG3brtl4XilXMEFAThjUtbamBbOaVw3mbM5mARud70Ji+Lk
	 YWAZURVhmx+X21MQ/9JU6AQ1zrroGr1jdGYZb1WrbR/B/larLYtpMJ1/KcU8Xmf9eUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020130;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=042uXsdut5WBSake+MUWofHXzabhsYwXO7DNSt563L8=;
	b=EWOQ9wfs0BH4/bsqEU5J46wydpUiY9KdH1+syGWPEGlM2VPtcFvmTPE9mmWE4YL5U6xN
	 SmRyAo6Y7diY/wCf17jpxB7uRq9z9BO6G5sSWxDp4D9Ru+y4wJU1Zz5MDAnS+e27S6SdH
	 M28nlXJ/LZ5sLJYCL7sRFuPHzdFDkySWdj+OouMw38zESmiPw0eRcbfxdHMpZgL0D9jBI
	 +8H4Y6chRVskdCSRlpx23dPrBiHzJKSxDXeIEcsnc0mOBgkRNAnpHB5zHxv18bQNkRntG
	 e4GTyx93QaUtSIkhz4ef0nWZgDRS5DdiSkmfwWUdlU/tCIC/zqpLJ86hLUzQymFXA2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YxV4i9kN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20034606A339
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 16:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YxV4i9kN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C096A1F000C5;
	Wed, 18 Nov 2026 16:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795020130;
	bh=042uXsdut5WBSake+MUWofHXzabhsYwXO7DNSt563L8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YxV4i9kN3BhPEGa5BcEHJEX7adiEKaQPRMRwkYTLt2/B2ykTQtx5jG9DbOzKSpg3t
	 1OqaMKZFwZp7Mb6FOtmJv6os/nCAdeORJcDCJoTJBxTi5pfqz6UtS7Su/qhvzDEcOC
	 RYjqz9hVWF4/CYJi0SnzFA/JxeAzldW5z/t1E9ZvmL0BR8zo45Mw01JKAkcunHpxRn
	 LYAt/ii0gdjdHTS7XIB0Zmr4PXeOPu3PLI6eWa/Up2ItomgFiRItqJ3er1vVpyHr5B
	 /LM1kvBfz7MSS+TIqbTsIyzH0eqQ0jxfSEWtjs3W4Z8iPPomSs8Qwt3JoxYdSrklsS
	 BmyPVVCfkHTdQ==
Message-ID: <sashiko-outbox-221532@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: mfd: Document support for Airoha
 AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261117164132.47167-4-ansuelsmth@gmail.com>
References: <20261117164132.47167-1-ansuelsmth@gmail.com>
 <20261117164132.47167-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 16:42:09 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
>=20
> It does also support i2c and timers but those are not currently
> supported/used.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117164132.4716=
7-1-ansuelsmth@gmail.com?part=3D3

