Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3394314BF
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510307; cv=none; b=P5XuozLbHmKK4g3XfbU7ROIfJdnrfwnuP6gs043vatmr5vLOrWit20ptDmN1pNf0UzD55heta/kXyDfbXjKbLaPw8mOIrsUCSEo3hypd2WJBtUHEli00mtD6tJZzOg8oGn65Hd/F81uERgPOhVikP/jHv7sgPOlDlDlptBZTvT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510307; c=relaxed/simple;
	bh=6jahalBMmib+j1HUMzG3hQj8eKSrR1bZl4rYHqdfBzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d1sO4ROryAziIrX2v86xs16o9bKnP29DA2O53XaK0S+bjzbTl8HpFh9A4npqBMHEaSzpcAQawz4vT6v6bxYg5kgPi0kw7lFbjYjahWEZvZhwZJun+ZFJp2FGAXMZFuX27u1oVC011ib9dXGffkBP4CooOk0hCD45RV+sD4vIaZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=la5M4EJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="la5M4EJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C89E1F000E9;
	Wed,  8 Jul 2026 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510305;
	bh=+tQypg0hUR4lEuJjNmJteA0oSNO+ignp15JogqjLbfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=la5M4EJiQhRmsgECAN9chTGWISopoBfK+iZ+dAIUeVPUZZ7g0PacFqbyk9FLolgw9
	 v3bUz8Xn477bX+ldlQhr43xV6o6AZkvvKuK/wVuvd73adL/Rya7lDMbWUxwEAtgHUb
	 Mqm9YRx49rkqbp0itzzIhmXaHejgtv+BkO806YAAjVt6mnljjkuZaGv5SJ6a+UKv6F
	 NKtbhnu5U2q/JWnw2rjRcoCV097qwWfcywlsXYQxZja+IQL2EbIWo4hZkSNz6Tv2uN
	 p7W8SF27X4Gqg7TFR+MX+3xpWHdmCSWVZRdfzs56wkCuFRuUqhbKuYJIw6uVxIen5M
	 AzM4ZYZXQiGsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/23] mfd: Unify style of dmi_system_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <d03f1a25cbceadde9b40461034262b0538ee2883.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <d03f1a25cbceadde9b40461034262b0538ee2883.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:31:45 +0000
Message-Id: <20260708113145.6C89E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown ordering in `cgbc_remove`, dropping the session=
 before child devices are removed.
- [High] Dynamic modification of static `mfd_cell` arrays and shared resour=
ce structs.
- [Low] Creating local copies of `mfd_cells` on the stack for dynamic amend=
ments.
- [Low] Passing complex pointers via match data `.driver_data`.
- [Low] Use of hard-coded `mfd_cell` IDs instead of relying on `PLATFORM_DE=
VID_AUTO`.
- [Low] Parent MFD driver initializing private resources meant strictly for=
 a specific child driver.
--

--- Patch [19]: [PATCH v2 19/23] mfd: Unify style of dmi_system_id arrays -=
--
commit 0d30ec6eab3e1567ae95f20c0dd011ea31a5ae52
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Unify style of dmi_system_id arrays

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Only the list terminators didn't match this style as they didn't use a
space.

> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> index 10bb4b414c34d..b568722cc8b76 100644
> --- a/drivers/mfd/cgbc-core.c
> +++ b/drivers/mfd/cgbc-core.c

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential incorr=
ect
teardown ordering in cgbc_remove() in this file. The parent releases the
hardware session before safely removing its child devices:

cgbc_remove() {
    ...
    cgbc_session_release(cgbc);

    mfd_remove_devices(&pdev->dev);
    ...
}

Because the core session is released before the children are removed by the
MFD core, will hardware accesses in the child drivers' (like cgbc-wdt)
.remove() callbacks fail and cause hangs or noisy errors during module remo=
val?

[Severity: Low]
This is also a pre-existing issue in this file, but does the hard-coding of
.id values for I2C children in cgbc_devs (e.g., { .name =3D "cgbc-i2c", .id=
 =3D 1 }
and .id =3D 2) violate the MFD subsystem guidelines?

The guidelines require using PLATFORM_DEVID_AUTO for automatic cell indexin=
g to
avoid naming collisions in sysfs and driver load failures.

[ ... ]
> @@ -393,7 +393,7 @@ static const struct dmi_system_id cgbc_dmi_table[] __=
initconst =3D {
>  			DMI_MATCH(DMI_BOARD_NAME, "conga-SA8"),
>  		},
>  	},
> -	{}
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(dmi, cgbc_dmi_table);
> =20
> diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark=
_i2c_gpio.c
> index 9b9c76bd067b8..87dbe1a94247e 100644
> --- a/drivers/mfd/intel_quark_i2c_gpio.c
> +++ b/drivers/mfd/intel_quark_i2c_gpio.c

[Severity: High]
This is a pre-existing issue in this file, but does intel_quark_i2c_setup()
dynamically modify shared static resources?

intel_quark_i2c_setup() {
    ...
    res[INTEL_QUARK_IORES_MEM].start =3D pci_resource_start(pdev, MFD_I2C_B=
AR);
    ...
}

Modifying global non-const static arrays (like intel_quark_mfd_cells or
intel_quark_i2c_res) during device probe could lead to global data corrupti=
on
and initialization races if multiple compatible devices are present in the
system.

[Severity: Low]
This is a pre-existing issue in this file, but does the hard-coding of
.id values in intel_quark_mfd_cells violate the MFD subsystem guidelines?

[MFD_I2C_BAR] =3D {
    .id =3D MFD_I2C_BAR,
    ...
}

The guidelines require using PLATFORM_DEVID_AUTO for automatic cell indexin=
g,
and state that if a specific device needs numbering starting from 0, the
platform_device->id field should be used instead of the mfd_cell ID.

[Severity: Low]
This is a pre-existing issue in this file, but is it appropriate for the
parent MFD driver to initialize private resources purely for a specific chi=
ld
driver?

intel_quark_register_i2c_clk() {
    ...
    i2c_clk =3D clk_register_fixed_rate(dev,
                                      INTEL_QUARK_I2C_CONTROLLER_CLK, NULL,
                                      0, INTEL_QUARK_I2C_CLK_HZ);
    ...
}

The MFD guidelines dictate that private resources like clock handles should=
 be
initialized directly in the child driver that consumes them, rather than in=
 the
parent, to avoid tight coupling.

[ ... ]
> @@ -79,7 +79,7 @@ static const struct dmi_system_id dmi_platform_info[] =
=3D {
>  		},
>  		.driver_data =3D (void *)&intel_quark_i2c_controller_fast_node,
>  	},

[Severity: Low]
This is a pre-existing issue, but is it safe to pass complex pointers via m=
atch
data here?

Subsystem guidelines warn that passing complex platform data pointers via m=
atch
tables can cause memory safety hazards, and recommend storing an enum or
integer ID instead.

> -	{}
> +	{ }
>  };
> =20
> diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
> index 9b3a877f44fbf..83d912e824014 100644
> --- a/drivers/mfd/kempld-core.c
> +++ b/drivers/mfd/kempld-core.c

[Severity: Low]
This isn't a bug introduced by this patch, but does
kempld_register_cells_generic() incorrectly create local copies of mfd_cells
on the stack for dynamic amendments?

kempld_register_cells_generic() {
    ...
    struct mfd_cell devs[KEMPLD_MAX_DEVS] =3D {};
    int i =3D 0;

    if (pld->feature_mask & KEMPLD_FEATURE_BIT_I2C)
        devs[i++].name =3D kempld_dev_names[KEMPLD_I2C];
    ...
}

The MFD guidelines state that for mfd_cells, drivers should not create local
copies for dynamic amendments, but should always use static references to
enforce immutable child device topologies.

[ ... ]
> @@ -766,7 +766,7 @@ static const struct dmi_system_id kempld_dmi_table[] =
__initconst =3D {
>  			DMI_MATCH(DMI_BOARD_NAME, "Qseven-Q7AL"),
>  		},
>  	},
> -	{}
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(dmi, kempld_dmi_table);
> =20
> diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> index 1c2fe3f912389..16f47566cf3c8 100644
> --- a/drivers/mfd/tqmx86.c
> +++ b/drivers/mfd/tqmx86.c

[Severity: High]
This isn't a bug introduced by this patch, but does tqmx86_probe() dynamica=
lly
modify shared static resources?

tqmx86_probe() {
    ...
    tqmx_gpio_resources[TQMX86_GPIO_IRQ] =3D DEFINE_RES_IRQ(gpio_irq);
    ...
}

Modifying the underlying shared static resources that belong to the mfd_cell
definitions during device probe could cause global data corruption and
initialization races if multiple compatible devices are present. The guidel=
ines
dictate defining mfd_cell arrays as static const.

[ ... ]
> @@ -338,7 +338,7 @@ static const struct dmi_system_id tqmx86_dmi_table[] =
__initconst =3D {
>  		},
>  		.callback =3D tqmx86_create_platform_device,
>  	},
> -	{}
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(dmi, tqmx86_dmi_table);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D19
