Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510255;
	b=oiFuj5XOqkkZ8gZEReermftcamtEZA4/Uo1MXTLE4fcybEI2qAV+8r9a6Xw2799EfubY
	 RY4fdBw2G/pqPnI/sHAUnp38l7KdGTHJPIe+bWdzL4Z8l/Bi2GbppupZxNCFIxZIUmRF7
	 +wsjCNNtv7sZrX6ouhZ6fxLgYgyIZIidqOBJbS6yTLDL5Ejpj9CoSYRWdAm+v7asimn2/
	 9Ob/LJU1gTM6rDjvK5B9xbgOpy0GdiVKf3nu5x4D16WZF4s3h1GfHJFqyXdE73f/Mv/AD
	 falumi6QQEP7rncieyEFSYW4i+8qOlCVcIbp6u0BoKOccHI53bqpRf+h68b3ra2D/PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510255;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LUlkGv5DheAjsuQGXN06+FbYzE2WcIZB3VZj2Aev71M=;
	b=zgelEx7NbdTNh7Q55lVb/HuopbyEjD0CqGYbdSWG7NmQDdntqU0utav83EAIh2y5zp4R
	 TY9EArkt/aMtjIEZLU6II+OM1mvlffq39+AGc0g0XFG2yhd8NY6VnGPjMsIFfkeAhrxUp
	 Nvh1ws+ORIbzJ/v48DIzsfU+E3+98jjRQ0iT+2AvfAaVXsiER01dfiSjXms3AnDJw6dzj
	 aa+hqwwzCiYNFSUuzeRZjyVskqlADuf3IUldJNsCvwi+q25zfEP3niw/h6juJcX7MliW7
	 /Q7QewyVIJlcd2UOt2ip3RjGstmi+i6E9CDIBIsfmWNbCFYbCsVohro/DWSvuu6rwAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIKwOExz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CA1606A323
	for <mfd@lists.linux.dev>; Thu, 12 Nov 2026 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QIKwOExz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990D31F000C5;
	Thu, 12 Nov 2026 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510254;
	bh=LUlkGv5DheAjsuQGXN06+FbYzE2WcIZB3VZj2Aev71M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QIKwOExzVdyro21ZuyKWuHpUDrM/4uVGQO8yZ0Mou3daTmWOUQvYSgfH21dCsVOFg
	 kqOew6qLhlZxLUg7xWOXNwH/u+m/NMPXeofB7V6ZhTfQhLRzpCciKd0Oyx86xWquGd
	 cV8enpiWDxIKU78OrhuRkmCJoeMbspL7A7v85B4kRQB5zbDee8Sj5WJEvfcMqIC08b
	 qrBkMNvli7jnxUSjLULdiOQuyPva4LisDcBO+E/XF1n3Ghn004lqNA6u1ct84WhPrP
	 wgLYInCHDhDWd0fdIgW4Vlp38BU3LrelKD31tngmZ9WeUhdf93yUYlKiukTU4Tl7pT
	 0KeE60cqdMfBg==
Message-ID: <sashiko-outbox-211734@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] pinctrl: airoha: mux a requested GPIO through
 the IOMUX
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Crispin" <john@phrozen.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261112185941.1316112-5-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-5-john@phrozen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 19:04:14 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> On a SoC with an IOMUX block every pin turns into a GPIO with one mode
> value, mode 0 on the AN7589. Add that value to struct
> airoha_pinctrl_iomux and write it when gpiolib requests a pin, so no
> SoC needs a gpio function with one group per pin.
>=20
> Without an IOMUX the callback does nothing, so the existing SoCs keep
> their explicit gpio functions and their behavior.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112185941.1316=
112-1-john@phrozen.org?part=3D4

