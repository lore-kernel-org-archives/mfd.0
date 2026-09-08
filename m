Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DCA34F247
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 19:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896040; cv=none; b=LtRdV4NeG0Qkv2W80znEqJN8058pH3bSvfATTUCVNgGLgOqnfmvCYT9HtaCVVHITUVJCa1Z2HV9RqUh04reGINX1m11bDID0OZhzmCjFDPjmoUEuswL6Vq3rcby8LNSk6D5vGEQz2zgRn2N6q0Nb66D9sodrwtAyZ64zFo2Hl5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896040; c=relaxed/simple;
	bh=Svvkl9G6J0BmVsirX5w6M9c/c6VACGS4Wlal4ABhVyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f0azcFjy+gnrumlrOkWRYq4xwZ442pkspzRcU2a8qei6bIbfQ4B97riBJvS5E847zJ0CzFIeCQFAZ0sBJsK4X96VVFlOXAecs2DsmJTjUAdcdiaD+WWYLoTJmast4vlBMm2lN2ssQGrcBUttwvI5DjNvHrkkMGz/6Oi10gE5e28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GVHuMzzI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GVHuMzzI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D4D1F00A3A;
	Tue,  8 Sep 2026 19:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788896039;
	bh=Dotr3HeeLWX5wELV4bjbm+PHhYlcJ5UusWoojluEanE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GVHuMzzIzAIkDW9UoCTw4z6x1v8U01VWimvcaF5gEx+mVD85Cgk1InwCp/xcIL/5J
	 HNReoy+Nv2x0beU+KWS370CXruRWcvRZaZ2z3pX1B9ndUSIx9xxCT8iTZUjawsExEn
	 dKSu1L71WyuCO80QWMe4/InB+iX80IpT9Zmcp/L8KZeKG+Uny1oNgPUVt9vE3W/dyA
	 FmnwB26zNadyN6QNb6xhsAyCUE0cCaqjJXSUPTBb/z02GpItuOkrnKEOhnRzpuDUDz
	 xfAuoVpWCcJVPmMqUaHN1JjK4VJ/DXgYDqQ/RKoZ50aTpbSakCrDSiGUWLq+WT3AGi
	 2HNhGFF06NHiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: rk8xx: Register poweroff handler in atomic phase
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eric Anderson" <ejona86@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com>
References: <20260908-veyron-shutdown-v1-1-066ecb80f5f2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 19:33:58 +0000
Message-Id: <20260908193358.E8D4D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The patch moves the power-off handler to `SYS_OFF_MODE_POWER_OFF`,=
 which executes in an atomic context (local interrupts disabled and seconda=
ry CPUs halted). The handler calls `regmap_update_bits()`, which unconditio=
nally attempts to acquire a sleepable regmap mutex, leading to a system dea=
dlock if the mutex is held by a stopped CPU.

Pre-existing issues:
- [High] The restart handler `rk808_restart()` identically calls `regmap_up=
date_bits()` from an atomic context, presenting a pre-existing deadlock ris=
k during system reboot.
--

commit 9ca348a7dffb994afa6516d011f6fbab7c173e09
Author: Eric Anderson <ejona86@gmail.com>

mfd: rk8xx: Register poweroff handler in atomic phase

This commit fixes a poweroff regression on Google Veyron devices by moving
the power-off handler registration from SYS_OFF_MODE_POWER_OFF_PREPARE to
SYS_OFF_MODE_POWER_OFF. This change causes the handler to execute with local
interrupts disabled to enable polling I/O for device power down.

> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index 3dcf6abfda74f..21182df45d1b6 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -875,7 +875,7 @@ int rk8xx_probe(struct device *dev, int variant, unsi=
gned int irq, struct regmap
>  	if (device_property_read_bool(dev, "system-power-controller") ||
>  	    device_property_read_bool(dev, "rockchip,system-power-controller"))=
 {
>  		ret =3D devm_register_sys_off_handler(dev,
> -				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
> +				    SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_HIGH,
>  				    &rk808_power_off, rk808);

[Severity: High]
Does this change introduce a deadlock risk during system shutdown?

Moving the power-off handler to SYS_OFF_MODE_POWER_OFF means it executes in=
 an
atomic context where local interrupts are disabled and secondary CPUs are h=
alted
via smp_send_stop().

However, the handler calls regmap_update_bits():

drivers/mfd/rk8xx-core.c:rk808_power_off() {
	...
	ret =3D regmap_update_bits(rk808->regmap, reg, bit, bit);
	...
}

regmap_update_bits() attempts to acquire a sleepable regmap mutex. If a
secondary CPU was stopped while holding this mutex during a background regm=
ap
operation, the primary CPU will block indefinitely with interrupts disabled,
preventing the system from shutting down.

[Severity: High]
This is a pre-existing issue, but does rk808_restart() have the same
deadlock risk during system reboot?

The restart handler is similarly registered using SYS_OFF_MODE_RESTART, whi=
ch
also executes in an atomic context with secondary CPUs halted.

Like the power-off handler, it issues a regmap_update_bits() call:

drivers/mfd/rk8xx-core.c:rk808_restart() {
	...
	ret =3D regmap_update_bits(rk808->regmap, reg, bit, bit);
	...
}

This poses the same structural deadlock risk if another CPU was stopped whi=
le
holding the sleepable regmap mutex.

>  		if (ret)
>  			return dev_err_probe(dev, ret,
>  					     "failed to register poweroff handler\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-veyron-shu=
tdown-v1-1-066ecb80f5f2@gmail.com?part=3D1
