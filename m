Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585245;
	b=bV3oR2gZFraKYmfUbEJhyzNIUdH61pE4I8bFUgsTKGxX28EKAz2hy/YGVVICp8NEopCC
	 UOD5ArHqUlxxCKk1c23ng3zTOX1GlRsfdqORMUNe5WYEjtLbZvdaM7iuaYGEEpAqBCwik
	 6YvKgZ/4KV8OmD4K+0GI70O+GWVJZTgJXvbDlsF90BNjiD73TTXPhJHdWrsvMmR5eZE+x
	 fznBBDXJ/gfSHNyHTw++Xg18zxIfHy4792gxHIUpPaTO0RuhxbO8SeneygPnP1SWKGOW/
	 /jH29kYKFA9+STnrXBtwI6k+Vg9ylj91ny0QjVF6QyozPOt98ioP0rsjJHdTgbIs2zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585245;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1s97unTnlmXXx2LpTCZmjhjnAh95aNJfODvJFlhUznQ=;
	b=Rddq9+SAjx6kVkLPj+C9lXlo/BCtODc4MhzqaBLtViG+8G2tgLWSH5FSmXClulyT76XA
	 YMAYFh2/Juv35NQoH6qH6BtgR+hM1SXmLmRq0CIKKyNoxaKpzfIcP2oA8uTsHX3iHPxZK
	 2fsy27jkPJghgr2WDc0Rba8x6KRDKiozt0b0C+C24ZbqDOhIRTW8z9MRozt2xZo4zpQet
	 vC2DZg9mJVG3Vhpq2N5BkrDMeRjHrDNIr4lH0EQlI0fkszd007cPbeGe6HYIeJlqcyTP7
	 2O9ZfhcMQ6LlCxiPzIELEBhSfoRik/ZkgQy2hDzJZZ80uZ65z8WIHOcJiHaXRrdcH8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K/wI6fkB";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21D606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K/wI6fkB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914AF1F000C6;
	Wed, 21 Oct 2026 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585244;
	bh=1s97unTnlmXXx2LpTCZmjhjnAh95aNJfODvJFlhUznQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=K/wI6fkBcE7Sfv0m3xb1O0dMTCGeK8Rdd6a8iekvLLJ8aVXphGSXqPAIctJFGN0u7
	 I8ZbjmcRWe5ttGIUKk7mjovtwpTg5//EIsfaf5MIY1AWqwsPBoF72I+RCeYSQhyXFC
	 2amtZ+bnBhAfLCCtnCv/GNabKY1qJ6IQZh//MmiqV43LAdsYwRRUJx1+Ooy7qIs3yg
	 seLv8qAi0toyhBWl2Vdb6MBpO6wsH5D4fcmPOZymwL64xz1YI+kIuWps0g9zsFfRB7
	 QHzXRfQjRlVtKJ+PZWgVYXIBymXorpNZ4NO3saWOhqLJmELTG72khEcaab8rhu85a1
	 FEPYWQVKURctQ==
Message-ID: <sashiko-outbox-180226@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/28] mfd: ls2kbmc: Allocate simplefb platform_data on
 the heap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-4-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-4-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:20:44 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> ls2k_bmc_probe() declares struct simplefb_platform_data on the stack and
> assigns its address to the display MFD cell.  Although mfd_add_device()
> deep-copies platform_data via platform_device_add_data() before
> ls2k_bmc_probe() returns, the shallow mfd_cell copy attached to the
> child platform device retains a stale pointer to the expired stack
> frame.
>=20
> Allocate the simplefb_platform_data structure on the heap via
> devm_kzalloc() prior to devm_mfd_add_devices() so the pointer remains
> valid for the lifetime of the child platform device.
>=20
> Closes: https://sashiko.dev/#/bug/linux-4e2dd9cb-310b-4bba-b305-ffacc7382=
85c
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D4

