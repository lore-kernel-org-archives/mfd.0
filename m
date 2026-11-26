Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689404;
	b=LCpQDsURPwKnhnZFmk5+bIl/R9XSUIknyrJjDIl/EYH8M5DgYAy3glBtY0R4vIZdWGuP
	 wDbt1ZqG2K2KnG4em+MaPMpQRtDPfqax/qO/UfkRJ42and6TqDD0CckugiZmebWlJz9Ts
	 fomwMuqoDWNoU8obYlh4VXwpkOplBNtyXhol3IFWGRIH1QLxAUQHY5vN9nqa6xup9ER/Q
	 hpGBapBXX7a37aoHJbaNGPBovBcX3OkTVV5dSY5pFiF/9KXP42q9C8PndM3yxpcxC1ybu
	 Z3dR4L42roMBQttJEyMOIm7sOvb8vWRVWSDkSoJlTUhZHCrW9nnsN1PKP1Oppv8loeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689404;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GDPoLjm6OL6RD+CBv6OfUC4Of5NCg/gOAuENKNmcZ2w=;
	b=fJ6CYFmZOHND0D8qUqwSOFCAFLStMLyhUFIS0djDIo2FRKiaNeopRJBhqOajZ+c7+gZ2
	 IbMWq7lzdugMNg7DTrNVKU9oq8mME8x2HYrp9LQVBIP+qxHeIsOotgL1XrFWKJzd1SuJM
	 hILs+yrcj4qiaRMow9nOLkm2re7l+8CRHJafc8/eIS/kDIwC2mTfTta7ULYkKJCfB4QnU
	 5hufrNmr2MraVqSQ71FBt2dkqrKcrsxbAJH1QAm3LPPep5p6i3LigakFK5+ht6B/Clk1j
	 H89B8K6UuNKDbwotcCGsuFOs+gtk2km+XX9G0vXZtEXDspQWP3S/lJEWZkbKNmlZGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7K4FT7H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C13D606A31C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7K4FT7H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F2B1F000CF;
	Thu, 26 Nov 2026 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795689403;
	bh=GDPoLjm6OL6RD+CBv6OfUC4Of5NCg/gOAuENKNmcZ2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k7K4FT7H+PKksXRQtrXZ85o45fI1TsP/LvzqtZrZeWZHtfHiQUQGrWXrCzvyeTssz
	 pX5BL2E4g+kacVMKNHx7xsJqkHyTXvqEqr0qZkm2vjgYuBsitzvsGMqfekS2kd8T0B
	 9Gil5pX++Rd4YU+k6/rDOGzeJGOqjNO00g0rI6wJxXTkHrSrEMg8OJ4AvAOgjigZCM
	 XtNH3xQB41tVoRMXl1Qtqd+lfHtA3eKxjzHPlnTogmMmsYOasnOXmlGI6AhfOQ2OQD
	 VPhp0t0Mj/hUiPd1C60m02DYhotDfL5VHwsG99tWy5JBgZC/y5NVW5Jm8ElmNNF+JL
	 4Ob33DFQX3vxg==
Message-ID: <sashiko-outbox-235299@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: max77759: Use REGCACHE_FLAT_S regmap caches
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QW5kcsOpIERyYXN6aWs=?= <andre.draszik@linaro.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261126-max77759-regcache-flat-s-v1-1-edfb4b93685f@linaro.org>
References: <20261126-max77759-regcache-flat-s-v1-1-edfb4b93685f@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:36:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Reading /sys/kernel/debug/regmap/1-0066-charger/registers triggers a
> regmap warning and prints fake zero values for unreadable register
> addresses:
>=20
>     max77759 1-0066: using zero-initialized flat cache, this may cause
>     unexpected behavior
>=20
> The top, maxq, and charger regmaps use REGCACHE_FLAT with
> .num_reg_defaults_raw, so regcache_hw_init() populates only readable,
> non-volatile registers and leaves unreadable register gaps (such as
> 0x00-0xaf in the charger regmap) invalid in the cache bitmap. When
> debugfs checks regmap_printable() across the unreadable gaps,
> regmap_cached() calls regcache_flat_read(), which warns on unset
> validity bits yet still returns 0; _regmap_read() then serves the
> uninitialized 0 from the cache before checking regmap_readable().
>=20
> Switch all three regmap configs to REGCACHE_FLAT_S so regcache_read()
> returns -ENOENT for unpopulated addresses, allowing debugfs to skip
> unreadable gaps and stray reads to fail with -EIO. Also drop
> .num_reg_defaults_raw so cacheable entries are populated from hardware
> on demand instead of triggering eager probe-time I2C reads across all
> registers (including the 33-byte AP_DATAOUT command buffer).
>=20
> Fixes: bb71e40db1b7 ("mfd: max77759: Add Maxim MAX77759 core driver")
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-max77759-r=
egcache-flat-s-v1-1-edfb4b93685f@linaro.org?part=3D1
