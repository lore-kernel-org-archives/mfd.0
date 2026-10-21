Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585244;
	b=B2mzXltM6gYfoFEN9d5Oc0h7xphu1z2UCASFK1zAMAo85p4utS58ZonXNIvjLDNPPGVQ
	 4C8XjK17DCqN7OZiGu1jUVpWVQWikPETZtiJjya3BKy28ergm3JMR7jFHGCiBuEAI8H3p
	 wzGmUVW5Xf0CMlmt3zh/MhuJB96yneUZ6TigJmFMzu1OJptLjEYXrRMpLtev0vBzPATUz
	 zUA1K5bt1tmQ3k6Jc+RV+3GDLj5dpeOmgUZtYr67mN9+7HeO1t3EDaLXjrARq9hzL/mS3
	 mqNd5febwvoGAcY2IcajkcduO0CQeQIPS6sb+9MfnpLDtaYJP9Ozr3m0vSUZCnF44+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585244;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GkJvgYPnTzagtgOpzbjrKY1EVuVqEEL3/YZXAqqnhxo=;
	b=v6ub+0uFwTFLDFOPRtK0ZbbSMpXLfGEaHGwfcsTjpZontBjTddZMqNgG1tmrd1zsG23z
	 QN0Ufs9oZEgNfTOjvJexLz4ptJrwgxOUQEmB2VBWkHBOwV7+DlLoIXVXyLCcJNVJxoJpe
	 keJzBjI2teakJRzLlUwLcA70yeO+N9IUbuQaXcjWI15NCVPMQOTIPFQZjXxhf4JtPncaa
	 BMrLOO26zz5XfHQGVEaAhZUaSKHMfjOhSzzBIrsQMADU2KuFyOvTgU0EcnoX6yFRXDi4p
	 te58L2D6XVoNe++MbQyYQq2xug1AY/aNCm2FdfNGwzUkQweVuer/Ts/iUSZVBKVnsXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=axjd77KY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DF6606A31F
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=axjd77KY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F461F000C4;
	Wed, 21 Oct 2026 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585244;
	bh=GkJvgYPnTzagtgOpzbjrKY1EVuVqEEL3/YZXAqqnhxo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=axjd77KYXTDj9Pfg2QOtkV8lJ+CEk8E7C4cyJfeaScbRyuVHEbBA7/djd/3FGNz57
	 /rXbB36ZX2qERbR34+z+ZLjEQOOUN5dJx6dm9/lKnblagvLA6jjfo+8zaSl2WQEk96
	 sq+VVrvx3EPSxmP+FPxiABwTmoFQUV88hy9B9WAAArf9h7VGsOZFgX2rhVzI2bLTgC
	 Z116vBQVJte7POcDUdCERdWPu8dj2RSBDbEFjMiiRMVJ+ymuBdXOWDuQdS0rCDhfVH
	 FQQeKnset17qyx/WDP/CrMYuIAtyq52N3Ls411yh0M5qd7OvD1BoDaiMNrSV9EWvNI
	 J0GJJ079T1C7w==
Message-ID: <sashiko-outbox-180225@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/28] mfd: bd96801: Allocate watchdog IRQ resource on
 the heap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-5-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-5-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:20:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> bd96801_i2c_probe() declares struct resource wdg_irq on the stack and
> assigns its address to ddata->cells[WDG_CELL].resources.  Although
> mfd_add_device() deep-copies the resource table via
> platform_device_add_resources() before bd96801_i2c_probe() returns, the
> shared cell template and the shallow MFD cell copy attached to the child
> platform device retain a stale pointer to the expired stack frame.
>=20
> Allocate wdg_irq on the heap via devm_kzalloc() alongside regulator_res
> so the stored pointer remains valid for the lifetime of the device.
>=20
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D5

