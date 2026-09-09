Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615A3F210B;
	Wed,  9 Sep 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946552; cv=none; b=tvy/6MPmiiPKfeAbhDaytmT4YhvkzHkbAd5+D4fhRfUk0Gz7MMcy7VM3Y5vL92Q810IyuAJ6AjorO5PqDHxOPYGHb3ZYiuVxaWQJykR9joXxVfWPS7fqNPfsmGTHnTHYEOv/2AXwoQ7cpjGDK87CfYxiUqjwK5tjqo8SQKO2S84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946552; c=relaxed/simple;
	bh=SucpaYoWOD9TD4UVYMmy+bhSqPVg6evjiU63yfN4URI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LCc/Ii8zhq7BbJ5rSk9/Qjg6YK8D15R7It/jH4fW7j7iA+4UiewbC2tfxw7q0qhXxeAa1/Q/Ph9DqCwrpNyD87Bf+fTu9LRZ4ODbxH437Aui+x0wynAYNPkQ3cN74ip9tDgm9r+Npv89OX0V2ZxHIDKt1uBhUXC5rvNGPXhYYKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dB7hbMQe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dB7hbMQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5956F1F00A3D;
	Wed,  9 Sep 2026 09:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946542;
	bh=O975CpgyySD+dQR9GK2qWA98bVfz+ipAkzlbDfyF2Ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dB7hbMQe5L9FkMYsX6tc7V9dfKxr/cd5ZkDggUe5tv6UWFHQRBaBbW21ty7Bp/vBU
	 JwSqR6mB5kenUy+KiW2HjcqGzDYuHBDwulsuOd61uHFGJpgtQ5NxBZJ+o1Qx3Jdy++
	 4dBOHF9+Z56dpEkH7oD2krd+NCPh8X/WBxTvbzZR2iIwEcWSfqF3A6FjsSoKHYvQaE
	 txZH+F/7pF4zq97vmLuj2ZjkXz9gwKYa/R3g5pT5DSjts/oggQ1TjqIQKPKP8BM3Hu
	 GZT3ucNSVfY2Ixy0iT6KMrXFL9v4XxEqqqq5F63LdMrDj1fqGymTQrN9nbMkLtrgV/
	 nGbhqtDCknFmw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] mfd: rk8xx: release the power hold GPIOs before
 powering off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaozhong Li" <yaozhonguwl@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260909092728.1859-3-yaozhonguwl@gmail.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
 <20260909092728.1859-3-yaozhonguwl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:35:41 +0000
Message-Id: <20260909093542.5956F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Acquiring 'power-hold' GPIOs after registering MFD child devices=
 can cause probe deferral thrashing.
- [Low] The commit message description violates the MFD subsystem formattin=
g rules by using a lowercase letter.
--

commit 99f9b4ec1bb40a89a22b218c05cb3242225a6bc9
Author: Yaozhong Li <yaozhonguwl@gmail.com>

mfd: rk8xx: release the power hold GPIOs before powering off

This commit adds support for "power hold" GPIO lines to the rk8xx driver. It
acquires these lines during probe and releases them with a delay before the
PMIC shutdown request is written.

> mfd: rk8xx: release the power hold GPIOs before powering off

[Severity: Low]
This isn't a functional bug, but the commit message subject violates the MFD
subsystem formatting rules. The MFD guidelines require capitalizing the
description after the subsystem prefix. Should "release" be updated to
"Release"?

> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index 3dcf6abfda74f..fd1efbb94008d 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
[ ... ]
> @@ -874,6 +894,15 @@ int rk8xx_probe(struct device *dev, int variant, uns=
igned int irq, struct regmap
> =20
>  	if (device_property_read_bool(dev, "system-power-controller") ||
>  	    device_property_read_bool(dev, "rockchip,system-power-controller"))=
 {
> +		rk808->power_hold_gpios =3D devm_gpiod_get_array_optional(dev,
> +							"power-hold", GPIOD_OUT_HIGH);
> +		if (IS_ERR(rk808->power_hold_gpios))
> +			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
> +					     "failed to get power hold GPIOs\n");
> +

[Severity: Medium]
If the GPIO provider is not yet ready, devm_gpiod_get_array_optional() will
return -EPROBE_DEFER. Because this acquisition occurs after
devm_mfd_add_devices() has already run earlier in rk8xx_probe(), won't the
resulting devres cleanup unregister all newly registered child devices (such
as regulators, RTC, and clocks) while we wait for the GPIOs?

Could the GPIO acquisition be moved earlier in the probe function, before t=
he
child devices are registered, to avoid probe deferral thrashing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909092728.1859=
-1-yaozhonguwl@gmail.com?part=3D2
