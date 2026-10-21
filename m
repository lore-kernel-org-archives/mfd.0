Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585213;
	b=e1Cmd8y/4uqnRZ46isZVcJIbiAc7TjaB70mpBQR1+E0/ke4Yml6sarPMijd+DWMmfVuu
	 aTgfCqckb8ZPbnRlb+QYSMJIj1eG61Cx0ig8plcD914tro7uFnxtKSTGwcqY4YOWEzy1y
	 sDjcrEmvJOPM517EaAaJXB1T4jaZ6aVEDQDHhc7RLuh4o2nNgrrVilNIZ9OcMjqIXAkIr
	 1/luHat7UPXgQY+5yPD5vpPCIMcZAX++tZTkr6UbB/WbVIw2zNCPzqkV8d7vyzH1qKQRU
	 mVJyuMxbUKd2B/Z1OXF1wYtB7Zs24jHpxjdjeWSV+/Ywh7W5jdaKXtErKYvxS4zOKnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585213;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0vhRuS1DwJ9hEjeo5AWaNjhCq9wm/IGGmCtMujPGjKE=;
	b=IDZcT+baV50z/BQ5PQlotF5YNcZ6UIQqEMbfr57TvXo4O/xrcDiAxMzWYQceqRHOzR3M
	 IPQEqQqE+Op9S2WUKs7aKBHJMd/vZfrGMOIuzUArnTxjTVRnScbqNQpdJ8m6TQOCIoC8Q
	 O8meWP+6pryJXMMzNdaJqdBZvs8U8tu54J37qKfUPhoXIJ9fHqC3dmm8NETB9B5hXEah/
	 WHHBJcSODyGS4fFnPzVj7HwwzzPaNeUEfQKwpZwOn2F3BNTUWhG5aTpkbgiXEpBxFggU7
	 KsDFiJ8BC8bQAjaktLS/BMgdACBhx3Dc7hVi/yf1oebbBMFDVft/E8fKNpFOGRrzFAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PSJmP/Vt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A8606A327
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PSJmP/Vt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5650A1F000C6;
	Wed, 21 Oct 2026 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585212;
	bh=0vhRuS1DwJ9hEjeo5AWaNjhCq9wm/IGGmCtMujPGjKE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=PSJmP/VtmanvhXlZSQsbIh0tVK3Th1MEp0VfxEjyXc0VtM6oZXgORXdA9LWbYuNZa
	 cMjZasr7j0GPLCrhx9ZrSOGpmzOkjUM27d3vnkSQYpg0FuRNNvTmxKVRQlPLDgpbGL
	 1Bal+You3dg5QGXizv9Ph5ilwCuEs54CHltpvybq5zP9pLwZ8VrQtB7VMy1qN0PjwT
	 OZ/3sZzTnl+onfijpgNh11Qm+g3AW9ztRWqNVii7R/BNViy8+tWS1i5UXhKbA5SwIG
	 nDm9jnW5jnC16zRFruQJ6dgPeJoD4B1WF6F5NiuHmfFYAsAwr5P6ElkrMfYa8D/B6Y
	 4JSiXmrL4ujXQ==
Message-ID: <sashiko-outbox-180222@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/28] mfd: cgbc: Zero-initialise version buffer in
 cgbc_get_version()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-9-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-9-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:20:11 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> If the Board Controller returns a short response to the firmware
> revision query in cgbc_get_version(), cgbc_command() can succeed
> without populating all bytes of the stack-allocated data buffer.
> Those uninitialised stack bytes are then copied into cgbc->version
> and exposed to userspace via the cgbc_version sysfs attribute.
>=20
> Zero-initialise the data buffer on the stack to prevent leaking
> uninitialised kernel stack memory.
>=20
> Fixes: 6f1067cfbee7 ("mfd: Add Congatec Board Controller driver")
> Closes: https://sashiko.dev/#/bug/linux-8c473713-527e-4619-8404-689f28c76=
54d
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D9

