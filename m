Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F347434166B
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617373; cv=none; b=HziFLtwxlM6nQVlaBrhNKdruimcsFVghLjRmbVD4AbCu8bjBbhCLDyEg95NjDgPwzwggcVUkCI+JXtfyFiUWPQ5e/T6LP85w4L2DXNZg2WFiQeUDrr/vFBmW4Hr0XdlDuux1vWGnWLZg2FRVaDJNI2fYiQN33WfNhoq+CjqEFTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617373; c=relaxed/simple;
	bh=PoyLykgQGwylMCz4cVOwFx/4449mFyWGhivLc5eIL5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EhUjP/mPjahdjZUIqYFw8eaWkC7qdmX0nKRbsEeyy9S1/AAEitO2LryHIEzqnuu712L1lf82DoazO5PC9DibLINbKGK/e6zG8rox2KDmqRuE22CrnEXCliFPlaMPO3BAvUyNvn9dP3ZWbU6ie89IFIzh9DXcHGd/BXfWQLtR/ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUAyirTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUAyirTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B5F1F000E9;
	Thu,  9 Jul 2026 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617371;
	bh=GpCVMXzY5WANS4MVAvTfiGnBA9JdwLmMym04L/Va4/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HUAyirTTnaJD4Sati/kyjPwbW/cxNuQ8myn2QWpGT3nVQqfsO4vsTIVM7TqA6xHPr
	 sBwez8ykNmX7tJz8/F1aZfdBoNQWmqacGfyhq+ETUpta7Y//K0uR12wcgmKXbzezur
	 GueVFO+XqBbyijxeHT/Kj9GqACT5cxvxmMk0UL/N6zqyPxmAlodXTDcBbUpcyQXqbD
	 xFn5grlnhhCvDoJIuTUASv/+OspEmVXOpecFvlEJ0cqoTl0biqJcCbPHRqWtyj01Yq
	 lVNVngAH1AID0H0xVzP5saGSnPP7vgt593PLkdCmm1ZcFBnetwbqS8V3bq+97fVXwC
	 gf5t4MVUt6Z1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 19/23] mfd: Unify style of dmi_system_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <605877cac2c3cad03658e742ebd6b02f4f2ad9ea.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <605877cac2c3cad03658e742ebd6b02f4f2ad9ea.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:16:11 +0000
Message-Id: <20260709171611.A4B5F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown ordering in `cgbc_remove` leads to use-after-fr=
ee or invalid session access.
- [High] Dynamic amendment of global static data (`mfd_cell` and resources)=
 during probe prevents multi-instantiation.
- [High] Passing complex pointers via match table `driver_data`.
- [Medium] Creation of local dynamic copies of `mfd_cell` arrays on the sta=
ck.
- [Low] Missing `const` qualifier for `mfd_cell` array.
--

--- Patch [19]: [PATCH v3 19/23] mfd: Unify style of dmi_system_id arrays -=
--
commit a57b1f29e87685cdf177ac96af51385f6529a9cf
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Unify style of dmi_system_id arrays

This commit standardizes the coding style of dmi_system_id arrays across
several MFD drivers. It specifically ensures that list terminators use a
single space between the braces instead of being empty.

> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> index 10bb4b414c34d..b568722cc8b76 100644
> --- a/drivers/mfd/cgbc-core.c
> +++ b/drivers/mfd/cgbc-core.c
> @@ -393,7 +393,7 @@ static const struct dmi_system_id cgbc_dmi_table[] __=
initconst =3D {
>  			DMI_MATCH(DMI_BOARD_NAME, "conga-SA8"),
>  		},
>  	},
> -	{}
> +	{ }
>  };

[Severity: High]
This isn't a bug introduced by this patch, but there is an incorrect teardo=
wn
ordering in cgbc_remove() that can lead to a use-after-free or invalid sess=
ion
access.

The session is released before the MFD child devices are removed:

drivers/mfd/cgbc-core.c:cgbc_remove() {
	...
	cgbc_session_release(cgbc);

	mfd_remove_devices(&pdev->dev);
	...
}

When mfd_remove_devices() eventually calls i2c_del_adapter(), attached I2C
clients may initiate final I2C transfers during their teardown, accessing t=
he
invalidated session.

Does the teardown order need to be reversed here?

[Severity: Low]
This is a pre-existing issue, but the cgbc_devs array is missing the const
qualifier:

drivers/mfd/cgbc-core.c:
static struct mfd_cell cgbc_devs[] =3D {

The MFD guidelines require defining mfd_cell arrays as static const to
enforce immutability. Should this be updated?

> diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark=
_i2c_gpio.c
> index 9b9c76bd067b8..87dbe1a94247e 100644
> --- a/drivers/mfd/intel_quark_i2c_gpio.c
> +++ b/drivers/mfd/intel_quark_i2c_gpio.c
> @@ -79,7 +79,7 @@ static const struct dmi_system_id dmi_platform_info[] =
=3D {
>  		},
>  		.driver_data =3D (void *)&intel_quark_i2c_controller_fast_node,
>  	},
> -	{}
> +	{ }
>  };

[Severity: High]
This isn't a bug introduced by this patch, but complex pointers are being
passed via the match table driver_data field:

drivers/mfd/intel_quark_i2c_gpio.c:dmi_platform_info[] {
	...
		.driver_data =3D (void *)&intel_quark_i2c_controller_standard_node,
	...
}

The MFD guidelines explicitly prohibit passing dynamic platform data via the
.data field of match tables, recommending integer IDs instead. Can this cau=
se
initialization ordering races or memory safety hazards?

[Severity: High]
This is a pre-existing issue, but global static resource structures are bei=
ng
dynamically amended during probe:

drivers/mfd/intel_quark_i2c_gpio.c:intel_quark_i2c_setup() {
	...
	res[INTEL_QUARK_IORES_MEM].start =3D pci_resource_start(pdev, MFD_I2C_BAR);
	...
}

Directly modifying global static variables like intel_quark_i2c_res prevents
multi-instantiation and can cause data corruption if multiple instances are
probed. Does this need to be addressed?

> diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
> index 4c1e7a0ab0ee1..104a07dc8f16f 100644
> --- a/drivers/mfd/kempld-core.c
> +++ b/drivers/mfd/kempld-core.c
> @@ -737,7 +737,7 @@ static const struct dmi_system_id kempld_dmi_table[] =
__initconst =3D {
>  			DMI_MATCH(DMI_BOARD_NAME, "Qseven-Q7AL"),
>  		},
>  	},
> -	{}
> +	{ }
>  };

[Severity: Medium]
This isn't a bug introduced by this patch, but local dynamic copies of
mfd_cell arrays are being created on the stack:

drivers/mfd/kempld-core.c:kempld_register_cells_generic() {
	...
	struct mfd_cell devs[KEMPLD_MAX_DEVS] =3D {};
	...
}

The MFD subsystem explicitly states: "For mfd_cells, do not create local
copies for dynamic amendments; always use static references." Does this
implementation need to be changed to use static references instead?

> diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> index 1c2fe3f912389..16f47566cf3c8 100644
> --- a/drivers/mfd/tqmx86.c
> +++ b/drivers/mfd/tqmx86.c
> @@ -338,7 +338,7 @@ static const struct dmi_system_id tqmx86_dmi_table[] =
__initconst =3D {
>  		},
>  		.callback =3D tqmx86_create_platform_device,
>  	},
> -	{}
> +	{ }
>  };

[Severity: High]
This isn't a bug introduced by this patch, but global static resource
structures are being dynamically amended during probe:

drivers/mfd/tqmx86.c:tqmx86_probe() {
	...
			tqmx_gpio_resources[TQMX86_GPIO_IRQ] =3D DEFINE_RES_IRQ(gpio_irq);
	...
}

Directly modifying global static variables like tqmx_gpio_resources prevents
multi-instantiation and can cause data corruption if multiple instances are
probed. Should this be updated to avoid modifying global static data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D19
