Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102070;
	b=nvGZqw4SciCHh8ACJKiE0kC6DDZH97+Pm2j5Gm9Ui0j/dMk1k6gwL/LxkHrc4NIlUxRa
	 u/wdUjZSC+VUsJUlyHu8X/8zkgzIoQ2Mi/6joxKE5wccwLokHb1xqOlVbBKqfm+LxVPjI
	 Z2yNMRE6o/Cz9D7F9SDKkGoSK5ZwI9lKrYc2lyfzMFG62Dp03UV1EDDT89cYz3MM4VSM7
	 ZMFmd4YiPRycu1RNUqZd9DfPh2jgCBTwlsYmOhRcLuF5SzMSvM+VY6QCKB8gq9m2asuSr
	 iK31bkuEgZVN7Y6NhhDFleKZoQr8cAZm8x5Rbs3IKiWK/0J4Ugu0P8jhjmwpNELPKgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102070;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/z34dTonb7Uc+vBhpIqHSgpHIXV2/Dpyw11upJapoQk=;
	b=5EbfHz4eTwq9K4rH5gW+dTpe/k+ud0C5HTIr59i275EJ3kmN7VPZJYlkH8QO5llACima
	 8PEjGBriwAjwgOWsXC+mkLDGUufoLUGqlAq8sZWMxQNj4Zl7k3kQsegTyPqufDAuN2TcM
	 4JW6210DN0Ugi/ZtOfoHyqfjLC89chvetXUu97Ueyjf7WWWlOunkkyRQqCzYy916zcHHE
	 3q8q7qc5UdLBtNFRHnHTbjPFLuptG6m5FX9RwKJ00s0ew73PGX4rFxaOnEr+8SAKPBXsi
	 Rk1CLjHz1aGu/IjKjFV3s0CAsWzyapBNP4d+QSoAG8KC2zUqgcp93CUGs/BSKqVmETA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2wWLxbI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61846606A31D
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X2wWLxbI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9D11F031E0;
	Tue, 27 Oct 2026 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102070;
	bh=/z34dTonb7Uc+vBhpIqHSgpHIXV2/Dpyw11upJapoQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X2wWLxbIvsfUTf44q6E7qBEgkuu/kNvA3olbk31FDT8dgpTuxN314seBbQ6tp4nPL
	 iAvolwYz8fkpzJEJ2S41NOPRVkZZzHtvPYrAmhtaHp/S0s297JoG8OXmI1TYo4ysOV
	 ZqTFUWvqVXswUsvvXlkOPgNoi5IQCL71l2OsavnXDrq34qUklJuUSCaQtwAQo+tGOF
	 oagIYHR9wlxYfwCEt/x3VRUV2EZ1JppxMsjoe4fwXo89FqzQBPHBRDjIhw3LjiIUYE
	 OVewid0PiuAr/R1aH4pXhEJalswFBTCXGxNeuBm7Hv+lFyYLkLVYRs79bmnwvrk7ED
	 kzOl+4DBTAIKg==
Message-ID: <sashiko-outbox-186484@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] mfd: max8907: Switch to resource-managed
 versions of helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027114634.79706-4-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
 <20261027114634.79706-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:54:29 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Switch to resource-managed versions of regmap_add_irq_chip() and
> i2c_new_dummy_device(). This involves probe refactoring in order to
> remove jumps and allows to drop the .remove callback.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027114634.7970=
6-1-clamor95@gmail.com?part=3D3

