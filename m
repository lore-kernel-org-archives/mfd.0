Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347923;
	b=CkkqSDlYLmNeK09CBD5OrCAPxb5vj8wvwufAozXOGhCy+RN0MBssKkO2rYQHPo9TOBKX
	 iHO0RwAVafZLXtjdY9i1IJ+4Sv9RCjT6jnSW3BBfZceVReF87SFgLKkfVNBu4HW6FA614
	 vY5UXcQ2SGFY6oA3UZYme3CCaJ1a+myNQLyhmsb1UQsYmwXa6JOFjinOC45TaQuwqlXpy
	 jC8STo/gjE/L5K/ZBuDt7tkUbG2CL0iMnKQ9qe4qNXIdNldhx/yA0tvtoZEw68K/SMO4J
	 IbFNzHXMc2oSwDh3s2b3fhCP/wPH0zj8yhovv1jl1uVs54pgJe4BUO1tk4ozwliDe4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347923;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1f79x5Efg+c4hXBYQv7UtDNt1nypue8AgFrWrIy6dzY=;
	b=rJ+ek9rs1GX3HFC3VI0whXdAqFtr/03FWQIt1R4EbFmxvCqfZ82k2kV0QrRK7bjd8W87
	 xE3TCexfErHnjx1PG/ZHeI6V4gMS1JzedVGJcSkfgp2IDVrIkD/r2T403V3nYn108dZn/
	 14WdE/QNqCfbtTaYNZXOusmsFluy3p3QWAOAq+cm8QKwqvIF03wScBrfChkk5+NxmYgaX
	 iiW8srxt4lMJENh3VJQDPMV77DuDoq2p8MsAmMl7vF1YCDYNAMU1FnmJRIrgNsfzXEWmM
	 gTU5W+q3+3itCVfc1fzNBazbjzmxctTwPlYqMAGIia+cSc8RtTKBEjj/DDSgJoCps7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2Y0naYs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E8606A32D
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2Y0naYs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F4A1F008A1;
	Tue, 10 Nov 2026 21:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347922;
	bh=1f79x5Efg+c4hXBYQv7UtDNt1nypue8AgFrWrIy6dzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2Y0naYsHa9QEUxahyDjUrvpMQYsUpS+C+8Z6797rZ1V93P6s02rEm4Ggsw29tlTD
	 586Kh/zLQ3qFz//U1f2sOjsH73qVHBC69/dx8CeenujxOZIDWIWVNbMNiskXHzyqKV
	 HSdZxnqF714KQRXNzt0ElG28LzIRln9Qo4M4oyu6Bz8INaOcTSEcezpTQNvrvBKAv/
	 VnYcEX3v0szO475FLG3GAUKt6Bmf5Pv/c7mlrBUHE3pCK2nt0e+JH2MjnjnhVdI1rq
	 b8mYKGTx7pqT1sQL3quY/UHOeogsQCbThDV7ObgRNblT38IekTe9q+Mk85aQgDly5k
	 zaNvxszlEW3qg==
Message-ID: <sashiko-outbox-207787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/20] mfd: loongson-se: Drop unused assignment of
 acpi_device_id driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <98b0f85e2b1c5330958be64c2bca859cb0e16628.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <98b0f85e2b1c5330958be64c2bca859cb0e16628.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:58:41 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The driver explicitly set the .driver_data member of struct
> acpi_device_id to zero without relying on that value. Drop this unused
> assignment.
>=20
> This patch doesn't modify the compiled array, only its representation in
> source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D7

