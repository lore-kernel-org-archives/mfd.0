Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656266;
	b=tVYCw4IUTqwFWU6bq38ksrajCbzUK1jzBD28GWXLlzmolIyrKvPzT3UBomsLpt6kKB7v
	 G3MloSZBwkCBQoWr6JBo6OYSom2SUet3pdqvNVCjpF5E7biuPlFbeLi0BzgpOeOlFPpsq
	 tb7BdtURHJ6ZHHwb3izgfMyhLnxvpCKGc9hgZlF+DnYMg9QCUsQb+Ui36vDT8eurJ9/ZB
	 QJXuM79xS78BeIymPqoLkUsnVVGyzr2gt8pjQGOB3qJteSzPy00nrfQOkZtjVA6QezrTq
	 WKV5QXWjK4BwpsSzODp2XPNkDrN9Od5QD0NcOk8DWIu5bvDiCXgKRnwmC+tXjaLIx1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656266;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ObSE3ZJGUhfkRtxVmU63FjbVACj6XxFRRqFqlkv9Dmc=;
	b=Sr5KWV1aPLrWy4WObGvjb+crC7HPUcp9Vrrj6M+PijnlrrGlF/WUrI1cbC9/bFptu4Gt
	 AfqQB06I0tB36ToHpZJt4QnQR4jL5ID0r1NHDhTv/0GlOUT8tqwA9Oiyp0QqrFUjCh80g
	 8JoH9upV/fEAIrq5KfUpLcjhJGx7WCVEqLgBnIOdvXgqyRdDZeqhxpfi4mdyDF1AT3XyO
	 garz33hA0mlBmZkvRo0/+IHoqRMfzgRjz/HeukpVgDeCgs0O2wjJWywK9pag1AhHWIDj/
	 N41OoTqK+Lo2REZPjoQtsVYxZt3ngcyvOvIoxHb5hirkApybfSRnsRDE/PpxSRl8tvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kbs7jHKJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86689606A31A
	for <mfd@lists.linux.dev>; Thu, 22 Oct 2026 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kbs7jHKJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63711F000C1;
	Thu, 22 Oct 2026 08:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792656266;
	bh=ObSE3ZJGUhfkRtxVmU63FjbVACj6XxFRRqFqlkv9Dmc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kbs7jHKJX59XobewvQE1dHXuN7EEKAoSvOoMxc6fbZ71gMjkxnyd19XvjaTeMb6iF
	 AqRgq7tDERG+ZKSTcjzrHlBihfqa7YcAn734FeMLieavin0OC0BUNQv35BnZEseTB2
	 MZRhCabJMmL/fpTGD1tN3DYrOdKetghexwjShRQm2Uy5qr51oUcrdNZ4JccZZ1XRsi
	 V8taHXU8nlcpcAqFE2qX+41LkZm48jDdIjJO8dTXtHILlOtscDq6/UuRGkpBsEDA1H
	 dneQQOcT0W3X8Rt2F9+oSzAbt3XjyFvD9CbP3r6Upvma/C/qbXfXn4a58NO3e50T2y
	 3jY/iodoEgKdA==
Message-ID: <sashiko-outbox-181152@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: wm8994: Enable runtime PM before registering IRQ
 chip and children
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Szyprowski" <m.szyprowski@samsung.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261022075938.625795-1-m.szyprowski@samsung.com>
References: <CGME20261022075950eucas1p24096817dd7f79071a41320d9cf2d1c30@eucas1p2.samsung.com>
 <20261022075938.625795-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 08:04:25 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The wm8994 regmap IRQ chip is registered with runtime_pm set, so
> regmap_irq_sync_unlock() calls pm_runtime_get_sync() on the wm8994
> device whenever an interrupt is requested or its mask is changed.
> However wm8994_device_init() enables runtime PM only after
> mfd_add_devices() has returned.
>=20
> If the sound card is already waiting for the codec, it gets bound
> synchronously as soon as the wm8994-codec child registers its component,
> so the codec requests its interrupts from within mfd_add_devices(). At
> that point runtime PM is still disabled and pm_runtime_get_sync() fails
> with -EACCES, e.g. on Exynos4412 Trats2 board:
>=20
>   wm8994 4-001a: IRQ sync failed to resume: -13
>   wm8994 4-001a: IRQ sync failed to resume: -13
>   ...
>=20
> Fix this by enabling runtime PM before registering the IRQ chip and the
> child devices. Hold a usage reference while doing that, so the device
> is not runtime suspended before the probe completes, and drop it at the
> end, replacing the former pm_runtime_idle() call. Also disable runtime
> PM on the error path.
>=20
> Fixes: 7a97637988c3 ("mfd: wm8994: Flag the interrupt block as requiring =
runtime PM be enabled")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022075938.6257=
95-1-m.szyprowski@samsung.com?part=3D1

