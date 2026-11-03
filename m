Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699448;
	b=tnbtOfLKKiRad+fnyZEh9byrEqix5Myl40OjWXq+cvFHrLWNSsjc3080avJuZaqC6uXA
	 c5/AVJ39wl/wELV6eHQLwl4Fe6ayVypQwcuNeC31QtDxsdPUTR2OsTnJe5BO5s1uaiUTP
	 iYzYoFdQAY8EDCnIncgmYg/lOwq0Z4xFKNXa4pVjwQuJ5+Hj2+5VQFuJ23GG98eTNI551
	 xv14YN1CxLa/SbI3lqEwaUhPRb0QZ54g9t6PBFvOtxcfrEfPRCto7DRLDxSInqhnZ03lZ
	 QJsbMxTzxMMhq9FXWEijHTeL70UhpiRf9xPnasFMRcVdq9AYpzoaz2WZbpqdZbrZNDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699448;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2K4hdKlSd3BjZ6bRjsjybyPlcBHNOtwukkIWHYaLAtU=;
	b=EwsUOJmT3If0A4pSGjJgJZv+FQpgnn2VoguunLMrK8W00yPtYxWM6NeKp+hynrLHJ9QE
	 u8l+z6IKTnWazvzc2dVYvejbHTRprRy+9zTOEsoaLCGV7hgsg0O7SB7d2nhAZVzIoUeUe
	 JTo6QHlTLZwHyOIQp+dr+XrrWUCsHTxjWibSggVMO4y4TW9/GywyxsXshbqqZGjmQsyHl
	 VnXs9TERhtPctz5aXqWc/gIvlv6uH+RbJfK+WQKjxNzTvEXF3MBYnD9hNjCEAJB4SYegP
	 COUYvsC2bZsgN+8Ts2BFiGUHWsKI35HVRuCRNKJ76AifUeIiJ7lgLxEmoNZDEDkdWKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K/KgEdGX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC418606A32E
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K/KgEdGX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B071F000C1;
	Tue,  3 Nov 2026 09:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699447;
	bh=2K4hdKlSd3BjZ6bRjsjybyPlcBHNOtwukkIWHYaLAtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K/KgEdGXLAmtvOQlnsZUmWHH5gJU/YZiO41xEchJP4nd8SiwWvVmrPBp2aqglgAsI
	 TreF0Wbexl4M49qU5ht+R7XS89RKTNhWrEMtJ1Uk6Cu1nmtDOm0dUOVn+nbNG2yJfG
	 1aIY2mXvpj+RbYX056aS7/ev4IQiEJ9yhOQ4nWV2VhwpR76/I8i7AHyDpnPzWOPR5B
	 w8jAVM9NlfxZsdgusZJiGVZxCNW+k00e9ii4OPHSkBBchBKOgk6eg1IN7G6aiwIc3v
	 p+nnumQ16eeJMBk105JQXPAbeEnMlMtoaqEHe4ZXI3+2DbKtUqkmk0WlJGtoPTKP1J
	 7vmldPy6bMFNg==
Message-ID: <sashiko-outbox-194972@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: cgbc: release the platform device if driver
 registration fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261103094625.1289569-1-vulab@iscas.ac.cn>
References: <20261103094625.1289569-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 09:50:46 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: cgbc: uncapitalized commit subject description after prefix
--

commit fb6090445f4233ec5f4266c765d119b2bafd41e7
Author: Wentao Liang <vulab@iscas.ac.cn>

mfd: cgbc: release the platform device if driver registration fails

This commit updates cgbc_init() in drivers/mfd/cgbc-core.c to unregister
cgbc_pdev if platform_driver_register() fails.

>     mfd: cgbc: release the platform device if driver registration fails
>    =20
>     cgbc_init() registers the "cgbc" platform device before registering
>     the platform driver.  If platform_driver_register() fails, module
>     initialisation fails and cgbc_exit() is never called, so the platform
>     device stays registered and its memory and resources are leaked.
>    =20
>     Unregister the platform device before returning the error.
>    =20
>     Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
>     Cc: stable@vger.kernel.org
>     Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
>     Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

[Severity: Low]
This isn't a bug in the cgbc_init() changes in drivers/mfd/cgbc-core.c,
but the MFD subsystem convention is to capitalize the commit subject
description after the prefix ("mfd: <driver>: <Capitalized description>").
Could the subject line be updated to:

  mfd: cgbc: Release the platform device if driver registration fails

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103094625.1289=
569-1-vulab@iscas.ac.cn?part=3D1
