Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417250;
	b=QiOlF4jMcG1dY6a5DRRNiVDmTmakmwEZAn7lwKsSO8pS8Uv7J0ZE9nPdBFR6sGEbhSOf
	 Jxg00dv9z/UMEiE1FzK9zTjKa4dyM+vG7huSBOsr3PynShB+1jJn6bQP+Q/SceGEImOkM
	 AV7BaitTirperxoJhtj7QIqdATUkqs9hxguAjYPI0WZlPjDonCgDCQzafOxm/bMuM4sBq
	 BkywKUOMjz/StDpVuzebf8c6epaIYNkPVTB7zvg6YwAAEPFze2crntE2kd42dzJIQdzUS
	 2muwwyWAbGmgl2lLFwgX+MIvqvoYX8oIXi7ef/rIBSbjWXQbh/l68d4T9bMmvmY7IOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417250;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+Y45EqesNj3d/wqq4/nxcrQFA95KZ6qJzQ4XEWHZqNw=;
	b=Sb7YBYHoQKucamUNNP+wVc0r/y6qonTTQkZ1F8xu2fBA8UIgK+rjf+ebqeHZ4qZwGQdp
	 enxLVEr3JmENB01gtCUQnDWKuURIVzdn/umMz2MjD64FlV+2/p2g2C68d+YrUe6PedCd5
	 cpAeKATkInP35LOpE3gk+WmOGHJGPabhYAigk7CPhDriNgq8aT8SPjFQ5v1hTGYMhciM6
	 tgCwWmqnaVg6CviDgCLjd0TjCY5NUbO9A8y681W58VoqqqdgkqXoMcDHcrdo0Eucv442j
	 Sh1gKKtYF99JLYzeqLj9LlWNLLgPWWJOCRwY0n09P3QOaLygqEj7sceQMc/diy2ysuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8sa7Rth;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD6606A33A
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z8sa7Rth
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632B91F00A05;
	Wed, 11 Nov 2026 17:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417250;
	bh=+Y45EqesNj3d/wqq4/nxcrQFA95KZ6qJzQ4XEWHZqNw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z8sa7Rth3ycxDz002B8vIu++xo7MGA9ZRwpDd4G61CJ5nLI/XlLlVyo6W5F+lAoGy
	 4Sh54KFOR5+UJBT5h0yR3EPORUaVi/RYsxcTecgiGrGZ4cLeln8Re/IegKz1gFQvvs
	 Na/ZUt+9CUZRhla98a+9Sg9uV1gKeyGz3+9LC3CnFwKf9pBwwLwHNeAoxMSGDpHvUP
	 hsjkDJAwtFAm2zMRLVMRDQmPBdsTvaB/nHtf5NPU6YBS82TeOY2zFEamfTNgheyMYl
	 HZuBOxDynzQpru+M4pfoQ7oORTiigJvVZa5KBBhGpO/sKERJYJA06jdGRtUMPhNyez
	 cHJZeNIigogOA==
Message-ID: <sashiko-outbox-209392@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/7] m68k: defconfig: enable WARP_MFD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paolo Pisati" <p.pisati@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111163735.227286-4-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
 <20261111163735.227286-4-p.pisati@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:14:09 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Enable the CS-Lab Warp multifunction driver in the Amiga and multi
> defconfigs, which pata_cswarp now depends on.
>=20
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111163735.2272=
86-1-p.pisati@gmail.com?part=3D3

