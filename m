Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7CB399889
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617005; cv=none; b=kEBwXS4hEHtdivS+2m+vrSoGGYgkVvwsRGIWfntNME4u6pxm0tnK0ZnpF0V6CHgIVnxcEuEowEDBRiB4oSPor3YGXUcvx0/pFnYWjozyg3Lgut0dK4H3qlJ4tzBIU1lUOch9E2znepKFwum4a9gOP/QgNFgfUlAVO50WCha0rvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617005; c=relaxed/simple;
	bh=JHbqCwgHIjtxbqjrqpkbo+Z8UPeSlxZHAmh54tgu7A0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pmWFc/00PAisxo9Hh7TgRwz4njUvmWltog70JIIkGrldZ4pzCjNCKr4ZErLggXpF6EZDreFcQEn4axgYIpDgMZFoild1g1BWU5VHhJm78FicWWOHkCpJ4oDu9kIn5sVxZqb4DXN2aHMDqjQkYC5Rcs0G7cM21EHBvChrnkkQe10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7esfh4U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7esfh4U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B62B1F000E9;
	Thu,  9 Jul 2026 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617003;
	bh=VSBtAJrk00x+5uahP6LAKkIOQX88T6DL2cSJhExcVyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y7esfh4ULTUUGUL5ieDnNYqHKzNRNpfCZGXXOTsM46IDuafWkoEt7nojRjw5CtGGf
	 4KkIhXCpKag6Id1hYhD5gQgkALKcuzyUsWv+vxi+ZiPdW+m9Hh3hGjGmQZgx9BTkIj
	 6qz9uZmPHoIRhJ1rxhbm8OMuFLcsNy0ul2Z2fROFXtiblNR17yASbXXhxwMz1Fb+Wr
	 fc25rjgSpZFe/3ALwW8aCJ4PSofAVnwEtlL+x2dN58NdGOzw3HolJpCNPTPlLTYNZ/
	 hRewxjLMMBJkra2QS0vU/ENT8uOdkRPrTd2txZ6KXEHdTL6jt6NP0SBwjBxC5zYp5e
	 znoTY7WwVsqTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/23] mfd: bcm2835-pm: Drop unused header
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <5d3ff1a1732708946761d3356eac278b1d8e82c9.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <5d3ff1a1732708946761d3356eac278b1d8e82c9.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:10:02 +0000
Message-Id: <20260709171003.3B62B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The bcm2835-power driver lacks a .remove callback to unregister gl=
obally added PM domains, leading to a use-after-free on driver unbind.
- [High] The bcm2835-power probe error path fails to detach subdomains befo=
re attempting to remove PM domains, causing domain leaks and use-after-free.
- [High] The bcm2835_wdt driver uses a single statically allocated global w=
atchdog_device struct, which causes state corruption upon driver unbind and=
 rebind.
--

--- Patch [2]: [PATCH v3 02/23] mfd: bcm2835-pm: Drop unused header ---
commit ae742655acc85eaf6f32e19585088ea4c6c13247
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: bcm2835-pm: Drop unused header

This commit removes the unused <linux/regmap.h> include from
<linux/mfd/bcm2835-pm.h>. The header and its users do not use any symbols
provided by regmap.

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

While reviewing the files mentioned in the commit message, I noticed a few
issues in the related drivers.

[Severity: High]
This is a pre-existing issue, but does the bcm2835-power driver lack a .rem=
ove
callback to unregister globally added PM domains?

drivers/pmdomain/bcm/bcm2835-power.c:bcm2835_power_driver
    static struct platform_driver bcm2835_power_driver =3D {
        .probe          =3D bcm2835_power_probe,
        .driver =3D {
                .name =3D "bcm2835-power",
        },
    };

When unbound, the devres manager automatically frees the devm_kzalloc'd pow=
er
structure. However, because the driver lacks a .remove callback, the PM dom=
ains
registered via pm_genpd_init() and of_genpd_add_provider_onecell() are never
removed.

They remain in the global genpd lists, retaining dangling pointers to the f=
reed
power->domains array. Can this lead to a use-after-free on driver unbind?

[Severity: High]
This is a pre-existing issue, but does the bcm2835-power probe error path f=
ail
to detach subdomains before attempting to remove PM domains?

drivers/pmdomain/bcm/bcm2835-power.c:bcm2835_power_probe()
    fail:
        for (i =3D 0; i < ARRAY_SIZE(power_domain_names); i++) {
                struct generic_pm_domain *dom =3D &power->domains[i].base;
   =20
                if (dom->name)
                        pm_genpd_remove(dom);
        }
        return ret;

If devm_reset_controller_register() fails during probe, the code jumps to t=
he
fail label and loops through all domains, calling pm_genpd_remove().

Because the error path omits pm_genpd_remove_subdomain(), pm_genpd_remove()
fails and returns -EBUSY if the domain has child or parent links. The domain
removal silently fails, and the domains remain on the global list.

Does this cause a use-after-free when the probe returns an error and devres
frees the memory?

[Severity: High]
This is a pre-existing issue, but does the bcm2835_wdt driver use a single
statically allocated global watchdog_device struct?

drivers/watchdog/bcm2835_wdt.c:bcm2835_wdt_wdd
    static struct watchdog_device bcm2835_wdt_wdd =3D {
        .info =3D         &bcm2835_wdt_info,
        .ops =3D          &bcm2835_wdt_ops,
        .min_timeout =3D  1,
        .max_hw_heartbeat_ms =3D  WDOG_TICKS_TO_MSECS(PM_WDOG_TIME_SET),
        .timeout =3D      WDOG_TICKS_TO_SECS(PM_WDOG_TIME_SET),
    };

This global struct is registered during probe:

drivers/watchdog/bcm2835_wdt.c:bcm2835_wdt_probe()
        err =3D devm_watchdog_register_device(dev, &bcm2835_wdt_wdd);

If the driver is unbound and later rebound via sysfs,
devm_watchdog_register_device() is called again with the same dirty static
structure. Passing a non-zeroed structure containing stale watchdog core st=
ate
(like status flags and IDs) can lead to registration failures or memory
corruption within the watchdog core framework.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D2
