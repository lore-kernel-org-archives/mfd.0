Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069581FBC8C
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510061; cv=none; b=GN4nAbJSvv191GlxtNyqK4I3AE5e9Bhgjeo8fFkMtxZJvStKZnXyi20tS8NdwXGe9xu0zNRhPIxeZbHDL3kWruEP9ttfxk8jQ16ilIB5Urgw2AR5hQKv8J4HCvfV842lpXan7FZU/Dho5IJUg+vMFjfzlLertH5BFkNZsK3AC0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510061; c=relaxed/simple;
	bh=5M1s1d7mJelgcM2GytbbNducx975LH3AMsD6HmabNto=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P44lxx0Hhgi0p/wPxYGf/JvadNJOgSXBV1ye1/K3O3diZlgRqxdxZWHbNBb3uRbaNx7zr2r+MngHkY9vrk82ZsHpYAOyb6ZaNf2oaaOOIDasaOhLcxbxUm1vbgwNB9VBEJsN8gWVC2LhqHcMqXZwXUPWidO44M01gyq3YtObjog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRKIVkiv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRKIVkiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C951F00AC4;
	Wed,  8 Jul 2026 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510059;
	bh=MpeJPxxHuCgv6FwG+D0aTt4fr27/+IOQckCAAMjRg68=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JRKIVkivAsfHJdTG4CCm16IOjC7KFXtbTL2snwFvTPGvwnpETQyIklYoYeNQqMr53
	 u6h0OEPin8HIeJcDAM2krOC9ngIePgAQxzLhtqJnCB/E0PAHOjkH+DvKKiGXObiqBY
	 7NwErQvvB1OMviPjlQKEzFG4UTqHnbEBRtsIZPWKBKofebBNLH+nigbX30Z4Co6wVF
	 7dp5pud9XCLauzHmjX7vnS1XEZAJPn7eEqcwQPYkSfpbIdw6/P56rlNkvZtfSZFbpg
	 S3etZghZ3soxwuTCGFVNIei2Y5LvOICO/8NRiYJou4AKPbFbLgwCtgZV/gMZnYulge
	 qRj0SwG1aLVhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/23] mfd: bcm2835-pm: Drop unused header
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <d31a5092ef0e9f1ef9f53979f2c5b22a83e9f697.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <d31a5092ef0e9f1ef9f53979f2c5b22a83e9f697.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:27:39 +0000
Message-Id: <20260708112739.82C951F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The bcm2835_init_power_domain function ignores the return value of=
 pm_genpd_init(), which causes a NULL pointer dereference kernel panic duri=
ng error unwinding if the initialization fails.
- [Medium] The bcm2835_power_probe error path leaks generic PM domains beca=
use pm_genpd_remove fails for domains that have subdomains attached.
- [Low] Driver-specific header placed in the global MFD include directory a=
nd used to pass non-shared raw MMIO resources between parent and children v=
ia a custom structure.
- [Low] Hard-coded device ID used instead of PLATFORM_DEVID_AUTO when calli=
ng devm_mfd_add_devices().
--

--- Patch [2]: [PATCH v2 02/23] mfd: bcm2835-pm: Drop unused header ---
commit 7a2e01f06af404772de056dd430681d5c2f3c409
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: bcm2835-pm: Drop unused header

This patch removes the linux/regmap.h include from linux/mfd/bcm2835-pm.h.
The header isn't used by the file itself or any of its users.

> diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-p=
m.h
> index f70a810c55f7d..12bb6bc2c07f4 100644
> --- a/include/linux/mfd/bcm2835-pm.h
> +++ b/include/linux/mfd/bcm2835-pm.h
> @@ -3,8 +3,6 @@
>  #ifndef BCM2835_MFD_PM_H
>  #define BCM2835_MFD_PM_H
> =20
> -#include <linux/regmap.h>
> -
>  struct bcm2835_pm {
>  	struct device *dev;
>  	void __iomem *base;

[Severity: Low]
This is a pre-existing issue, but does this custom structure violate the MFD
subsystem guidelines?

According to MFD rules, child drivers should retrieve parent data via stand=
ard
APIs and use a regmap, rather than sharing non-shared raw MMIO resources
through a bespoke structure in the global MFD include directory.

For example, bcm2835_pm_get_pdata() maps asb and rpivid_asb in the parent
even though they are exclusively consumed by the power domain child. Also,
the watchdog child accesses pm->base directly in bcm2835_wdt_probe().


[Severity: High]
This is a pre-existing issue, but could ignoring the return value of
pm_genpd_init() lead to a NULL pointer dereference kernel panic?

If pm_genpd_init() fails (e.g. due to -ENOMEM), it returns an error and the
domain's list_head remains zero-initialized:

drivers/pmdomain/bcm/bcm2835-power.c:bcm2835_init_power_domain() {
	...
	/* XXX: on/off at boot? */
	pm_genpd_init(&dom->base, NULL, true);

	power->pd_xlate.domains[pd_xlate_index] =3D &dom->base;
	return 0;
}

If a subsequent probe step fails, the error path calls pm_genpd_remove()
for any domain with a name:

drivers/pmdomain/bcm/bcm2835-power.c:bcm2835_power_probe() {
	...
fail:
	for (i =3D 0; i < ARRAY_SIZE(power_domain_names); i++) {
		struct generic_pm_domain *dom =3D &power->domains[i].base;

		if (dom->name)
			pm_genpd_remove(dom);
	}
	return ret;
}

Since dom->name was already assigned before the failed pm_genpd_init() call,
pm_genpd_remove() will invoke list_del() on the zero-initialized list_head,
which causes a NULL pointer dereference in __list_del_entry_valid().


[Severity: Medium]
This is a pre-existing issue, but does bcm2835_power_probe() leak generic PM
domains on its error path?

When devm_reset_controller_register() fails, the code iterates forwards over
the power_domain_names array:

drivers/pmdomain/bcm/bcm2835-power.c:bcm2835_power_probe() {
	...
fail:
	for (i =3D 0; i < ARRAY_SIZE(power_domain_names); i++) {
		struct generic_pm_domain *dom =3D &power->domains[i].base;

		if (dom->name)
			pm_genpd_remove(dom);
	}
	return ret;
}

Will this forward iteration cause pm_genpd_remove() to fail and leak parent
domains?=20

If a domain has subdomains attached, pm_genpd_remove() returns -EBUSY. Since
parent domains appear earlier in the array than their subdomains, this error
path attempts to remove the parent first, causing the removal to fail.


[Severity: Low]
This is a pre-existing issue, but are hard-coded device IDs used incorrectly
here?

In drivers/mfd/bcm2835-pm.c:

drivers/mfd/bcm2835-pm.c:bcm2835_pm_probe() {
	...
	ret =3D devm_mfd_add_devices(dev, -1,
				   bcm2835_pm_devs, ARRAY_SIZE(bcm2835_pm_devs),
				   NULL, 0, NULL);
	...
}

Should devm_mfd_add_devices() use PLATFORM_DEVID_AUTO instead of -1?=20

Using -1 (PLATFORM_DEVID_NONE) can lead to sysfs naming collisions and driv=
er
load failures if multiple instances of the MFD parent are registered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D2
