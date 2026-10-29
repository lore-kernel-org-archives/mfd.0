Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268753;
	b=OSO9W2eVEcwjDuKuxAtq3ild73IPJqJ2uMpzGkkNlGsZBOzJxwbmgxvFupiLLEguTRM/
	 9BQQysxLHpzXm7MjqTAFjWw5YuE1ltqSC5TFq8OQAUVo5DVJS/cvDIBwYrwF+bGgSjoWJ
	 ReCpPfh4K3EgdgPnvEFTU4ru1pWA7Ehl6n/3GHEvMRBkejqP9POSapFEjyp39isd3Aq5N
	 GUrCXslOArQf4Kws5v8BqQNSLcnn07IlkK5YcjDAEh22dtYJLUuMdbL2/6Ku+/yEVCH9y
	 b9UG6i6/f10c7mR2btCFVTd9ieXenXokneMC5k8h0kpVO64dEsOAkv8RCxJjXM3g/XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268753;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QYcvzUZRnBc7zNQmxnxWT1AJJ1vDV5WJHB3fJ3jge2E=;
	b=rvt4aVMOaFL0JJM8UK7cElcUCtgrlsTwhBW9GuZuc7qAGJOaMW1X9f4LzAixg28di/3L
	 4RN+ltBom1AvwfwHVZYtdb/PIV72IhD4c0Ap6myO3AhCyZr40taLwiBJ0tNGot2i0zpZN
	 VYQBru6qZwdSDLkn9tXy02K8+jr418Eo55GPFnZCWI49vkho5ysX/xFylL6iY67nly9hi
	 3mCMfAflKjRJlr/Nkiwsn+Lm4h4LqAi5iPgbKsB11twZsc06fdoImRE4Yr4sP4jTTfvkS
	 3FfkiaoeCuRMtGG7aDJLmU+yniZjAvWBBuCZSc7NAxZzLFmNlKGkXzTGl+8NCtpomZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3hxrERB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCB8606A31D
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3hxrERB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3411B1F031E5;
	Thu, 29 Oct 2026 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793268752;
	bh=QYcvzUZRnBc7zNQmxnxWT1AJJ1vDV5WJHB3fJ3jge2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V3hxrERBNW76m0U5h4zNYtCq/xNI1YcXK+EthsUjjVrpFuQd3GI/yOF/gonJf+wIP
	 a7Mmx+8Wg/XwEIb14R3D6qaogLa4E8eFd9bMff02AZUz/e6OPeA7lDwjxZQclYBEE0
	 0Ba56TOlDt+cui5Wt4DbadoNLrPwN+CxNqha4UrWSlnDsI+E0A+jZE5xmc6tBEgGIz
	 NwoZ6QQVcKBMFPs3yb6EKvI/Uo32TiLxZnCMBd/vFoxrjQV7H0eTV465eO7ABL/ISU
	 m365ZnyIAUGCWG2l60NAhN6plfasssq5+Kp5UWe+94BKSVJLL9LX4KZd2LhSn5kCOd
	 nZn+S4pwVuurA==
Message-ID: <sashiko-outbox-189103@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] Input: rk805-pwrkey - enable the wakeup interrupt
 during system suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakob Unterwurzacher" <jakobunt@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
 <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-1-cb12621c1fb4@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 10:12:31 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
>=20
> The driver marks the device as wakeup capable, but never enables the
> power key interrupt as a wakeup interrupt. As a consequence, the PMIC
> interrupt line is masked during system suspend and the power key cannot
> wake up the system, e.g. from suspend-to-ram on RK3588 with an RK806.
>=20
> Enable the interrupt as wakeup interrupt in the suspend callback if the
> device may wake up the system, and disable it again on resume.
>=20
> This is done in the regular suspend phase on purpose, rather than with
> dev_pm_set_wake_irq(), which arms the wakeup in the noirq phase: there,
> enabling it updates the PMIC's interrupt registers through regmap-irq,
> which fails when the PMIC is connected via SPI:
>=20
>   spi_master spi2: Failed to power device: -13
>   rk8xx-spi spi2.0: Failed to sync masks in 7a
>=20
> Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC=
")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-dev-tiger-=
v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de?part=3D1

