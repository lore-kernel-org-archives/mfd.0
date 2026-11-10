Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348479;
	b=Ybgaw6KxjkD1jYQCC1xK58D7PPbB/yfPp0T9fAQF5cSh+E21vbqLIu3O6wBvFQtTdhZC
	 QFwa6H5vFrC97ILWIy2PWLl/j5VLpbs6QWFO4KFlIpSzNwWolcRn1WWp3vFBG0G2wJFGm
	 aGZMyTAJlNpNoIDhBNg7JGDcCsvovP2Zcne/+rEJRWsw8v1GEtDm9iwPEkDRgMvMV/jRK
	 C1m+S3iVk/g6RGpPhjlX7s60+U7WPQde3VYFZlKiXx16/TnFuq7yKWkfbk+GRyPDmxPVh
	 kQS79uqME7+qkNTcY2xM+UZ/zelDeIReLb7MYK9MVFRykHGb0db9t2bwCBiZwemZ31Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348479;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bChTTpQ4hbAQEu1DY7hMzHjMuOKD5sgMaYwi1eAvdwI=;
	b=BPI8Rs16ZPD5HmmuXrrKoTRo76pIKopPJJiRvz4CO9xP5GTtnXdQNV8Gw1vMHeSwWXh+
	 PdLV6nj/vla/M4R4F1dnYU4YkBXxiuDWjz4onhn8Ts1CIZSOUDCFBC0ImKQGkOAifgQB/
	 wkW2l3CsQkel5g8sj28ynTSGgvFZBGtKNopJxY22uVFx62sDHvYA0/wYVmg2RopNCfIpq
	 GKEx3hbqAhoK7KB2ITBxagkhTtpVN6GPEJ/rL82L8hu3kqsfJYNZur8OtCGJam1J4m6pT
	 /AhPBY7NEU0S1W8/8y6OssyWdFEXkR+mYUtiqplhHoSLXQfZtOVX08lFNCzF0DwELuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUWDJkkl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACB260A2603
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cUWDJkkl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37A31F0089F;
	Tue, 10 Nov 2026 22:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348479;
	bh=bChTTpQ4hbAQEu1DY7hMzHjMuOKD5sgMaYwi1eAvdwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUWDJkklZQ0zVfeAPoZFASEAexepbvlPt2dJZXcLqXY0xRvT8wwUDpKgCrmGTpBdn
	 YZcH+JNF1sznF4VcJYC8m2Udu3T1dn2sGqKwDLvEh5V9THYaePpzMKAYnrD3IhclTT
	 AfpgLdvncQjd/TBoZf/Gf0MUDPbRbDp+uCYz9Wb6fuXGRr0ApqRmZpkSWBSdKQoziQ
	 /vb/CQoz2UE4IeyvKtF3yW2PlnTIuzwI77eePs+srpkFkJIvLBji41H7KmrdyZd24f
	 FpviIljjd1f3934N3elw1L+aQQrrKsnqbWOCadxsfNhmkwhIq2qQZ08u8UZJwbDfug
	 RnwhHgApTMkEQ==
Message-ID: <sashiko-outbox-207811@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/20] mfd: kempld: Simplify device abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <f751652cc2cee4addd2168e66e6d89bde275f39c.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <f751652cc2cee4addd2168e66e6d89bde275f39c.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:07:58 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The devices that are created by the driver from DMI data and also ACPI
> devices all use the same platform data. Other devices don't exist. (A
> provider of such a device would need to know about struct
> kempld_platform_data, but none of the other consumers of
> <linux/mfd/kempld.h> creates devices.)
>=20
> Simplify the driver by hardcoding this instead of using the ACPI
> abstraction for multi-variant support without real variants.
>=20
> Then apart from .gpio_base all members of `struct kempld_platform_data`
> are only used in drivers/mfd/kempld-core.c, so they can be dropped.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D3

