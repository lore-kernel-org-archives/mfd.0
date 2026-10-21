Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585287;
	b=vbDhyS0Cidf/Kt2A4Cgo3HDbato7Sz9IvBLUn6GEij5+gT57nAlWcHFVON5Vkec2YW2s
	 oApikVa1IJJbkAIc5hkCe/9j0G4zfgwciQxwRZGm68NB1wCG9KXBGf66EIXMbED8Gu32Y
	 bdCp1Wvm93l1hJah8UYhciLOKHwEKG2jYYFLiQCRl/I63ThOTsPWj6GHtHrp1FEXObUvM
	 I+ILhIpEiZM+xJmPS/Tx/uQWgrECasVn1ic9SYzQnO8kEsyS5MpwzaUrqgFRjV1iNghPU
	 yr7g0i8K7xLMcRtBgbIXCjo/qmWE6jmzhlYeZ+rvmPK1hJnkVSsQ1Y1cVUZBdZ8rznQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585287;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N2oBfHOJIKAxlVgsU2kxkff214OwNf4PXdRLdzPwDac=;
	b=BMPeRnn9jhHwHtKjYnzu5xiwiDmVxd1RRnfV+R+B7IrlhiNIHLHmFE1AwQ1Pu+qmQZ4z
	 UyYXLokS5fnhQW4BzAIP2AyHP6oLmG7+JrqLU/9B84vuEiYHqCJgdKUVNpR+KYPlqZGDj
	 jNkR4IGgT7ifwAsA8kYDeZqVPEnGYYvhbqYy7UbY6dqagx1bJ/IxCQah94HwzA70v6O7G
	 fwSpKgJwirIVyOPM5A/+b1vxtVlbPvJPXoRB4uIrEmETukSDqHLaNu8MYhxY5rsc0/uxz
	 Y0g76bx+coIBTVmjW2LUoOQuZEP8y1AhxW40dQUcPkTvyA7oQQ8FwRv5YQt2cycSPrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TqcEYE8H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39532606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TqcEYE8H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E5B1F000C4;
	Wed, 21 Oct 2026 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585286;
	bh=N2oBfHOJIKAxlVgsU2kxkff214OwNf4PXdRLdzPwDac=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=TqcEYE8HrzipP9UkRsaAvRU3VYte39eECaJMhGmcw7BGN/wDGfsmY3dXcD7IHp4hA
	 gFKtatbrYk7imW/b5AnQCTRz3Z8XRtREvVjZ8aZZGNru7RTJwsDE/ym/VyhpC5CMwk
	 k3DNHmPAOurc4qRya56tQG3A+ejE1JGOEhunRjYRPhKxmiCetXZORKW3zW/RjM3rd+
	 anLl1vAqIOD66kYaxAIfFvh4ek83Vuhj7YZOI0T2kbHfdyAmas56xrn/p1N8MxrdsS
	 qPwVjBpN1RoFfxv3HxInWXgUL7LiM9uBZoMIg0e9LM1PqhFwAGJ8iOzdZY01nXPC87
	 GLyTW7JnOIB0Q==
Message-ID: <sashiko-outbox-180229@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/28] mfd: ls2kbmc: Cancel reset work on teardown via
 devm_work_autocancel()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-3-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-3-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:21:26 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> ls2k_bmc_init() initialises bmc_reset_work with INIT_WORK() and
> immediately requests the PCIe and GPIO interrupts via devm_request_irq().
> If an interrupt fires and schedules bmc_reset_work before a subsequent
> step in ls2k_bmc_probe() fails, or when the device is unbound, devres
> frees ddata whilst bmc_reset_work remains queued, leading to a
> use-after-free in ls2k_bmc_events_fn().
>=20
> Initialise bmc_reset_work with devm_work_autocancel() before requesting
> the interrupts so that devres cancels any pending work after the
> interrupts are freed and before ddata is released.
>=20
> Fixes: d952bba3fbb5 ("mfd: ls2kbmc: Add Loongson-2K BMC reset function su=
pport")
> Closes: https://sashiko.dev/#/bug/linux-3089d131-9fcf-4753-b183-eebe0a6e0=
20e
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D3

