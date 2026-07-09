Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F23A16BA
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617174; cv=none; b=EazS4EsZJLni4arSijRFw+29gxQH6HtKcimaiRRt0V7+sSRsmZlFuS+s8UHD3MgQxULMdavI8Kmi12ivm0EhX70Nh6+V2AxyVIHVTMsGIQhZBxR5p7TG67XiRlDyCSoEWRKoUPpzf9jPNkXqOtJNXR/a5RyOoTF++SoQhampBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617174; c=relaxed/simple;
	bh=TvAPjM0fWdiX4HetDuvoU+61bxxOxGeNm3pQEtxakkg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E2kgDlvRrA6S11H6L3851GsTgeoQdBOVFo77y0JbbAGCO3dA96pL1GwFp1+fGPmopQLbyT39J8ZH1daRN5dfHFmdt4eqj3nQ/H881VACOpXfbAy/CVCY/CEgSw2etgBJF5Gr2baRf5XBaNtvL5z7Iwx4kPni7TYfP2MWb0dK3wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkGOVl1H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkGOVl1H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6777C1F00A3E;
	Thu,  9 Jul 2026 17:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617173;
	bh=rLDqPI/SPDuu3gSI/1owwXfl8Xw0i6ScQiEXkTn0lE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HkGOVl1H9th+csLap8kxx0376j48SfrfbaaIfTE0O7Sk7bnH+lViFm9Mqr1XW1gay
	 B8oRjFy2QsB4YGhQlTNeM+lsU5Te4ohDAWpZvueEJ8I78YT6UVna0WpuvjfMRZwV9f
	 mZMIY1QZ9sjDVUYBkEEemoBuMfX1Ib4Dp63m5Xs1z5gpVjBDY3zTkPg04WzvLpCYhF
	 5OP08KD96ZfIWOvkV2lDrSGWCU1q9zxCoVJqPGnY6hmEa/MkMdvwb2cm8fN4SWCRh3
	 1zAWb82YPrkjtHQVMVN54nE/mDGKUvX1z9KZhNeJwDbCnTIwqrmfuq3stXLTbIk10a
	 GHCQI7vNg93HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 14/23] mfd: twl6030: Use named initializers for
 of_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <7be6ef143f760ef6ccec4d6427a471d3b4c0a71e.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <7be6ef143f760ef6ccec4d6427a471d3b4c0a71e.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:12:52 +0000
Message-Id: <20260709171253.6777C1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] free_irq() is called with NULL for dev_id, failing to free the int=
errupt handler and causing a use-after-free on device unbind.
- [High] Error path in `twl_probe()` bypasses cleanup of IRQs and dummy I2C=
 devices.
--

--- Patch [14]: [PATCH v3 14/23] mfd: twl6030: Use named initializers for o=
f_device_id ---
commit 037bf4f703042ace1a5e538197548013f6508c96
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: twl6030: Use named initializers for of_device_id

This commit updates the twl6030_of_match array to use named initializers
for the .data member. This matches the style of the .compatible member
and improves robustness for future struct changes.

> diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
> index 0ca00f618d4d4..4303fb288dd5a 100644
> --- a/drivers/mfd/twl6030-irq.c
> +++ b/drivers/mfd/twl6030-irq.c
> @@ -283,8 +283,8 @@ static const struct irq_domain_ops twl6030_irq_domain=
_ops =3D {
>  };
> =20
>  static const struct of_device_id twl6030_of_match[] __maybe_unused =3D {
> -	{.compatible =3D "ti,twl6030", &twl6030_interrupt_mapping},
> -	{.compatible =3D "ti,twl6032", &twl6032_interrupt_mapping},
> +	{ .compatible =3D "ti,twl6030", .data =3D &twl6030_interrupt_mapping },
> +	{ .compatible =3D "ti,twl6032", .data =3D &twl6032_interrupt_mapping },
>  	{ },
>  };

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing this file,
I noticed a potential issue in twl6030_exit_irq(). Does this function fail
to deregister the interrupt handler?

In twl6030_init_irq(), the IRQ is requested with twl6030_irq as the dev_id:

    status =3D request_threaded_irq(irq_num, NULL, twl6030_irq_thread,
                                  IRQF_ONESHOT, "TWL6030-PIH",
                                  twl6030_irq);

However, twl6030_exit_irq() passes NULL as the dev_id:

    free_irq(twl6030_irq->twl_irq, NULL);

Since free_irq() requires the exact cookie to find and remove the action,
passing NULL causes it to return without freeing the handler. Because
twl6030_irq is managed via devm_kzalloc(), it will be freed on unbind.
Could this lead to a use-after-free if the interrupt fires after the device
unbinds?

[Severity: High]
This is also a pre-existing issue, but in the related drivers/mfd/twl-core.c
file, does the error path in twl_probe() bypass cleanup of IRQs and dummy
devices?

If probe fails during devm_mfd_add_devices(), the code takes this path:

    if (status)
        goto free;

Jumping to the free label bypasses twl_remove(), which would normally be
called if it jumped to fail. Does this skip deregistering the PM notifiers
and dummy I2C devices?=20

Since probe failure automatically triggers devm cleanup, any active notifie=
rs
and handlers pointing to devm-allocated memory might trigger a use-after-fr=
ee
later on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D14
