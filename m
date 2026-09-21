Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548F2484239
	for <mfd@lists.linux.dev>; Mon, 21 Sep 2026 11:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989792; cv=none; b=PlMtI5PHXzcKrqjto85nM847NRMc7pug8PPjZ8CRHLGxijzNV1pnoNJtMo9afBzgu1gtimugjuWfAwyQvdsOIEA5W569wmMK070sZFD/1ftr1AUmX0CHXZvHzPAtRi4vr4QrUpmN2223PrhfcIPI6PZjfiL44hwWqvTxP5ftz+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989792; c=relaxed/simple;
	bh=7WH8SgZEwPZe5MWEfBMd1wR0vG4U8EgQQNmMsFSu4gw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f/A1QPv6c1K3KPvrO5V7mr5bo2jdLcpteJkD3DogqEXF7iqIRjvduwBfK+7h+QxkTJ4a1B7t9QwK6X6sf9IOHBrO8xAlY81t/bHdObtpLUt37mP8Mhzcy7UaOfstqF/zBrkOLZJ4y/gEJlWKbythMK+QKXlaS86hv9wrSHYQqP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLbZWz/s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLbZWz/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFE21F000FF;
	Mon, 21 Sep 2026 11:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789989785;
	bh=7WH8SgZEwPZe5MWEfBMd1wR0vG4U8EgQQNmMsFSu4gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QLbZWz/sFMGp+2LWPNuebdVPOs3a+EaBGvNA57nCLeAx4tNur59Cwy/Bq4sOGmb7r
	 8Ioz+QDRfcrBo+rAaHQ9HxbzsZpfMDdZ0u6PV7z+DuTkU4AmomYeBF0nDuwGEe9gU2
	 da1ADMbZMTV+5tFRpyF1pXTv6ai3P909AOIkGU3r2ciBn4DvcNtLvvVweqyC+OOPkM
	 m9vjGi4YyyCB9+apWVnXLSCJWSSwu4JXb5kNQj2kDhjEmqyePu4lA48yqyNYaUtB/3
	 7qQcDfs49en1ASzZsurWwEas5SrKvqwB+HlDsOaCIjE7Q4F7JkTI7it26YoQtx49kV
	 1ITxamSmaOUbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: ab8500: fix child device leaks on probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260921110909.370945-1-lgs201920130244@gmail.com>
References: <20260921110909.370945-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 11:23:05 +0000
Message-Id: <20260921112305.7BFE21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> ab8500_probe() registers MFD child devices before completing the
> remaining device initialization.
>=20
> On AB8540, the main MFD device batch may be registered successfully
> before registration of the cut-specific batch fails. In that case,
> the probe returns without removing the child devices registered by
> the earlier mfd_add_devices() call.
>=20
> The same issue occurs when sysfs group creation fails after the MFD
> children have been registered. Since the probe returns an error, there
> is no later teardown path to unregister those devices.
>=20
> Call mfd_remove_devices() on these error paths so that MFD child
> devices successfully registered earlier in the probe are properly
> unregistered and released.
>=20
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>=20
> Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
> Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version fo=
r AB8540 cut2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921110909.3709=
45-1-lgs201920130244@gmail.com?part=3D1

