Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510173;
	b=x97od1Wdatwt82gL5PQSR6f50hicEyshhGbD3Gmp5PBLpPTsdjwD0am2zo2QhsEuIfXn
	 74sNVLPfjls6jzr1+Souj8QOKN5xJ98KGloAzR35J/QHkGriL20ssujZzVtCutzgx/qX4
	 krz8JKBufQ8uBatccNIm/2dEjDhbl01TJvTXItqMXOOSQuTtAp6xEWpa1osvSIVKXQwVT
	 8itmDhv2KHFuyMuemtD35W+80Q3hqSc4j2n48ErZD4V49FXZF5bjMblZZpSgJpMIe+Rq5
	 H6sPSW2UtT6I6PnqiH5Yl85KzooDWJbLgQ0hxTtr5LD09F9Y1pyclBl90ygpnYDCDzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510173;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IJpMJF9acm128HSPVcRO5ltVYsfukesc+TqZTSt6g4A=;
	b=2FXL5X1D0HDo1taYyzXgBLKpAM9WGxh+kWLMGJQfIJJU/6sabCOISqdMhYY9QWSNG764
	 nIkZ/NsZc1HUcEMsc+WG5Q3K+PsMIqj4kzA//40U2natxAc6mpF176mnS3N9xP40fNajH
	 LONPMEihgPIKVAkXQH0fiO4S8AUUY4W/ox6Y4goYhrthWD5bfQP9r0D/VNXOrypntyHed
	 i9m1mGc28Q5nDrYsxaZiKtP+9WzdKuUCmWNPYfACRpUi5lm3KxQXRXkY3KNyyNiawqV8S
	 uKqMDxr6CMTqvtA5FB0/DYjJhAB5H2XITTpy8f5ZTCZc3J9SlX/Pvb7d6IZ+98mFA+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQCebuxi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C406606A32A
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 19:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQCebuxi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6941F000C4;
	Thu, 12 Nov 2026 19:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510172;
	bh=IJpMJF9acm128HSPVcRO5ltVYsfukesc+TqZTSt6g4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LQCebuxiFjDoT+Ir18voBuLRq2CRn4iFvtwuRhFeDanJILbqXC2WMOhgT20pBG88u
	 o4Moq6xxsQrx3oyd9jijjv7DnN8rwxcc/kTgZ6WLN0YDNV6IN5zEMM7lXOKLgzXLYE
	 qLPhlBnwTjFi40ew9L5UKrl+lwuiMPIBNffYw68B4uqhzcwSXpPfiyTv+K46Jo3HfD
	 IQPvShaC51zkI5Uedowwm9kh+3B3DznSw+9+fbKHKDZQslqHApUGBKmQ3pCMUetjTH
	 u/MoqmrDNnYwNtEucn0GlZgqGQ7Fxt5L63edvRRB03RlVOGNr9T/4yhvaPHDdAr/g/
	 f3mlDJU/nlM4w==
Message-ID: <sashiko-outbox-211730@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] pinctrl: airoha: move the GPIO register offsets
 to the common header
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112185941.1316112-7-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-7-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:02:52 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The GPIO register offsets are private to pinctrl-airoha.c, which builds
> the shared 64 pin register table from them. A SoC with more GPIO banks
> needs its own table, built from the same offsets and its own for the
> extra banks.
>=20
> Move the offsets to airoha-common.h so the SoC drivers can use them.
>=20
> No functional change.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112185941.1316=
112-1-john@phrozen.org?part=3D6

