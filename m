Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585461;
	b=TpUN3Fr8jSRdnhwwixXidzeLJCXoUQh+xRg+SJ20JqX2ZIbTy1IM4Ezprngyo3Py4vvl
	 9IyRlruckPN2HKqwi20dcrhjX9m331emJZbYhjMGwkCcS3P2pbR0rRORtal04DcfGTXmG
	 BeoZo5R2mNYpaVcQyZJ91FjfqGKILk8l18lo1VICysAq7A1Ogpk2hNI4Qq57eHRaL6nEs
	 UgUEkA443C1z4+L0/lDc+GJuCvmdBB5CQXnuRq8BnA42HBfV0fhayw/wGnDuapvgg2yfU
	 Z7r0uMM8YvX+xNZ7E8fekEf54+WwCNp7nmP0MA/e3ibXHKyi/UHmr8UgS1OYkwUoFqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585461;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VfKCDmTTu+hSdll1GYcNkUXk87MIuCmGMzrr8M0tRNs=;
	b=kB6WMOBouQ9HjjGM/3ce3uy7E46AGgWvZhaUozog6NqutqBOtzrkj8BdmYxkVHytnS1r
	 +Y5kX5nYYVagsMQwPOQEdmOWOZCdiwux2kF3t2u1EHE0ltYCh8mTonUOuL5Ay7UWFluua
	 U+wdgMlFPhF2xCEAstzGYlfIzYSZSie4WI+D5OYZBINguX9hfar/JlDYqKq4RO44b46r2
	 LXxJN4XWvJJa1lvRO80n+oK93TIoLi+4IpWN9x/M32vgjqJ2PGIb2PiF5Ei1xq1Sc8+FS
	 L7GaQaGMT/NUKZWnJmA6cIQ3XHyAQ0tNR/SyHvtDK0OdautEGn5UayWE316VZAYdzVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ck8Op7mw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E5606A319
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ck8Op7mw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACC01F000C4;
	Wed, 21 Oct 2026 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585460;
	bh=VfKCDmTTu+hSdll1GYcNkUXk87MIuCmGMzrr8M0tRNs=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Ck8Op7mwIjYJQtajoOhjuz4znKX9ViMESRyKv7WfMPUYqWm69FFi4MBQPJquYwLYB
	 9skz+4XkSkEhhVjAHbtuu+op9QjxL4nxHqBiwxqKj10DlCAnbdzKe3VHcsHK1gpe4n
	 745ZEqhUz/JhrObLb++9LdSHVympc0yGAh9YPIB3kXxQykUtEok5bUij63+A+IlHYb
	 P/vav6zZ1efxYH9x5nCMjg51NRV6cnDFqVltlz+dC/kK35ePHBB11uRxerSr3Tv+G6
	 Yu0bevUwejzuSLzoGqqeMejglQJMeeNDy5nu16A/0tMT/SXwJDlHbdpNfPtNICD3fS
	 6BM5Hmsl8KYFg==
Message-ID: <sashiko-outbox-180244@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 24/28] mfd: tps65217: Manage IRQ domain teardown via
 devres
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-24-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-24-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:24:19 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> tps65217_irq_init() creates tps->irq_domain with an unmanaged call and
> requests the parent interrupt via devm_request_threaded_irq(), while
> tps65217_remove() manually disposes mappings and removes
> tps->irq_domain.  Because tps65217_remove() executes before devres
> teardown, the IRQ domain is destroyed while tps65217_irq_thread() and
> child MFD devices are still active, allowing a concurrent interrupt to
> dereference a freed or NULL domain.  Furthermore, if probe fails after
> irq_domain_create_linear() or if tps65217_irq_init() fails, the IRQ
> domain is leaked, and if the device is probed without an interrupt
> (client->irq =3D=3D 0), tps65217_remove() unconditionally passes a NULL
> tps->irq_domain to irq_domain_remove().
>=20
> Register a devres action to tear down the IRQ domain in
> tps65217_irq_init() prior to devm_request_threaded_irq(), propagate
> errors from tps65217_irq_init() in tps65217_probe(), and drop
> tps65217_remove().
>=20
> Fixes: 40a50f8b307d ("mfd: tps65217: Fix page fault on unloading modules")
> Closes: https://sashiko.dev/#/bug/linux-7e358c08-6d75-48be-87d2-35dc037ea=
953
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D24

