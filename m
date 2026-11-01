Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548007;
	b=Lzz9T1Xi6Ghj8sb7ZUGhFHb/8VESiJywRw/q2yyJiuc3+v5ppLzx9CTgrIkVQIPWLEgF
	 t4aO7yj5KutItLtPx4U6WWvCDFmoMHbUjocYRlhrsDR8gZzs5eo3Ql88IQFdkpH+gt3uY
	 tj082SpDH36+XSaeI3lI3jFgz/GHtjg2La/PXyu0+1NpwAFLbU3+w4xyUpAjwfxAgD02V
	 Dyei4gSoE03fkp+ef1HzUx4YMSQbq23jPE4Gtu6+SNs4RA4hRUbS+EmI+ME18y3ywLm0o
	 t3RFlVsNK2sg/jZYE252hoOBSH5zHw6a8P42vWJ0ZlwkHqqhQmFd09t3+hD3p0Z7tXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548007;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eufZpBZR6dfy+rAo92Vtlwh/whT/yVcXWAXMH9uG1N8=;
	b=GaK/Cj2byddCPWxz5an/DV5wIdmlLfmj+h40nvM13DirxlGtpmbeoAy9UOsOgz9jRdoD
	 1sGf03xivCNCgdBVwWclZ3bHWe0X3XPj/zUeZsAixElx/vWjgeX8seomeBzdwOdfH0Xbj
	 w9+1bUdwvzIth6kd6c2IInI0012Id4TVbGYG4mgBnvA2tQ/AyIeInB+y2x0Fa39sd0LYO
	 xGMfROdGVMdHsEafaw3bXHNrS4z8M5XSnt8oMQK53TpQ6rjbjfsFr9EMD63kVGDf4yURv
	 n7NXui0ubU9VNMZgw+7oYxO6I3UNwzZmSxCJb+0M73hq8o5nB+8UJc9VgzlwMdycG1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTYEMx4D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06C606A325
	for <mfd@lists.linux.dev>; Sun,  1 Nov 2026 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTYEMx4D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B81D1F00919;
	Sun,  1 Nov 2026 15:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793548006;
	bh=eufZpBZR6dfy+rAo92Vtlwh/whT/yVcXWAXMH9uG1N8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTYEMx4DDzytI8WLEmbruFhdJYc0vWDHsgTxfDAL1vXJtSeprdnavYn0FkCS3aidD
	 9QAtUqSie9yz5VcS1MW1j47iWu7JzGaJE4CLZtts5qx4icW3T7U19SrDW4SwqDmfL/
	 gFMZ4Uet+rw/Wm8ZFMnlbk/KLaJM82xNCx2CbJJZt4zTCFVABV/KMIVpmrnOSlu4+X
	 Kfe0YjwXaC/j4E0uLyXLdIDmu7fBC3prsolV846g9XkxXGgHcS5mQX474V08Zcqnju
	 cnp8+NizvMJ3FWrAruN2Ppfk46yPHDzFFT2ApEq4vjPUmJdRNQB0F9bVLEOnYYBv4W
	 k71hyGKzqcc2w==
Message-ID: <sashiko-outbox-192482@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] mfd: rk8xx: Release the power hold GPIOs before
 powering off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261101154053.3874-3-yaozhonguwl@gmail.com>
References: <20261101154053.3874-1-yaozhonguwl@gmail.com>
 <20261101154053.3874-3-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 15:46:45 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
> lines driven by the SoC gate the PMIC's power-off path, a shutdown
> performed this way does not stick: the rails drop and immediately come
> back up, so the board restarts instead of staying off. U-Boot reports the
> result as a power-on reset.
>=20
> Take those lines as an optional GPIO array, hold them asserted while the
> system runs and release them - waiting power-hold-delay-ms - before
> writing the shutdown bit. Device trees without the property retain the
> existing behaviour.
>=20
> The array is claimed before any child device is registered, so that a
> -EPROBE_DEFER from the GPIO provider does not tear down the regulators,
> RTC and clocks that devm_mfd_add_devices() has already registered.
>=20
> On a Firefly-RK3399 the shutdown stuck when such a line went from high to
> low before the shutdown bit was written, and did not when the line was
> never driven.
>=20
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101154053.3874=
-1-yaozhonguwl@gmail.com?part=3D2

