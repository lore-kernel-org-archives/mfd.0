Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501046;
	b=wfzS+GfOQDMIi+9YVmn8udBpCfS9oE8YjlH3aGoZsND+VlNIcOjYrB1qp2lBB1JsPnu4
	 n0b46ksXHXTN9e9pPBdZtSiquGpJCLUjm1J3VWQhTMAaf/lJbc2ywxoY8wTmra5NGaRdS
	 75i837OTcw6Y499JsE9608GN/bPe2/CXUyBEKG3R1HvkEap4euSwObxcL16rp8km7jaIO
	 mw8hoxfLPRchfJsuUk9fUmSZmBnmQNt2psZxPxAalROFHnwHHZotRGHGuQwxiuFyFXMIx
	 jQ3GgjzhV0gImzNRNcngsNwxsvvTOtSI23oBQEcEpaZiFj/it9DRVVCzBZTu5zbkT9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501046;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bVOxM09iehINspk/eFv0QFRvl8GGlg3Gos9sm5TcwW8=;
	b=h7Sj+SXCs8ZAKK8weoIPp5up060qx08w3u02M63uqU+VDQyWpW63dRRe01FwK3y7HD3A
	 oaaHxX6Cw3vddE6teUGngA4eJShRacLuMKk0vDWmZ5ZfEg6WTbK/hzXXSkH7LWUqof43W
	 yK+ZYDpdlzx+Be9Ye12dZeUYxSDB6wrBQxNUZKp20qcNwr1+Rz0dEf5A+lCht7zGAnJai
	 O1gg9x4hdTlG/BreTcr3FTyixNDvNfiSVVTjq2t1YeO+nEzGB2XxZTHMSHeB43pqu+XN8
	 14EZ9fJ0Rr1eLCDiY+QoORoEtOER8pFb4GM2cm3tax6K8YuyfPaTyHBHusWcLFlTh0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OoB04BxZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B532606A31E
	for <mfd@lists.linux.dev>; Tue, 24 Nov 2026 06:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OoB04BxZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E71B1F000E6;
	Tue, 24 Nov 2026 06:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795501045;
	bh=bVOxM09iehINspk/eFv0QFRvl8GGlg3Gos9sm5TcwW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OoB04BxZw9D+0kV7yWgTN5ybXeEYPWw9eQV7YPeGwNtZne+ZDPp/fhM+fXbA+fm2e
	 wLXI28jFFtBmak61zsAmvLlSKvnuZjgI2fRHfHTf9HszqPiWKquc0P2lfB+OLXtf7g
	 93nnZ7ZarwRPDnYtJf2AU+VBqZzoDF8Qw49zW7RMyu94USppAOB/yfj58uiw13NO7t
	 lwJN7wYXMaYZghibn+j/DKgf4Ppb6s7IYTTfr+rPtA9ATN1kuR5dBuT80akxFflpGz
	 JLvLjm3r8wUyLxl1YSpukC8AE9TaDUSI9PSoMobbj5WFt3skomUIthOqChGjwauIaP
	 6HD3nI+obJE5w==
Message-ID: <sashiko-outbox-230584@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: max77759: Set zero DMA mask
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261124-max77759-dma-mask-v2-1-19a5db3c7a28@linaro.org>
References: <20261124-max77759-dma-mask-v2-1-19a5db3c7a28@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 06:17:25 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> During probe of the DT-backed MFD child devices,
> platform_dma_configure() calls of_dma_configure() with force_dma=3Dtrue.
> Since the parent I2C client device leaves dma_mask as NULL, both
> DT-backed children trigger warnings in the kernel log:
>=20
>     platform max77759-gpio.0.auto: DMA mask not set
>     platform max77759-nvmem.2.auto: DMA mask not set
>=20
> MAX77759 and its child devices only communicate via I2C/regmap and do
> not perform DMA themselves (any I2C DMA uses the host controller
> device). Clear coherent_dma_mask and point dma_mask at it before
> registering the MFD children, so mfd_add_device() propagates a non-NULL
> zero DMA mask to all sub-devices.
>=20
> Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-max77759-d=
ma-mask-v2-1-19a5db3c7a28@linaro.org?part=3D1
