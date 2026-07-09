Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C2A39F190
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616938; cv=none; b=apTYZs7kwqzPoBEexcrRWPoziv0Cw7ly/K4mBm5xOXzHlrOtNBYUeoTOoVRwEpwzs9727U2QUoW+qVIJFReEIKzahBzIQ1XoMJS2MXlMmF6W4ieKIw8e0m5VkmmO9PmGOd9rVciD8kzhmNkCQK724nPCqxlTKz21mOsRnzuugMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616938; c=relaxed/simple;
	bh=KfWQgbbBbT5HpMAfk19Saq19Yw/u8lTQStLkJkUStvE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KBVTxQFkr6RFxuKfGOEa1t6ps76XQ3Tc6+SRC0AR16SNkbuA0pLaOdOFSUc8SRNaTf9RT20x9LT6zmXDw+eN+0lKWDJpcGcv5GubFMt2fWD+ToPBZxtSdNldqdFw6vQOgG3AfusYEDdDCJVo4VM2qDVEULIpFiABCzulx79k3rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPoG4UPa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPoG4UPa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946DC1F000E9;
	Thu,  9 Jul 2026 17:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616936;
	bh=cT9+4txEBYYI4DPTwsUPV0oli/Laf6yeB6dBEm4RPrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DPoG4UPahBdkhqRxRGZUe7NbUX8iv7eHCITgQuNY+H0v95Ymcu8IdKKx+odQQJ777
	 Sx9cDmnDdEc5EOOh4Ywz9LLVWo+dl3eWhwitvREYE8Ok6o4xlXvZg8ja5SklZ1vgbU
	 DnyrcM9/UpZvt4mrFkqhTwk+qeFe0W3akuv7wT0AP2++FFlu9X/UsbMDBp2TGzu9Cs
	 CF1jac6isgehT5kJuIXN/FIYqZ6syrHGdK/msVYv2QFw5Hu7zz9GEKmn9EIJ58CmLO
	 Tu891jh6Rf0MCfIbmBNJFKSo26lsBCodr7mWqIMOyUmRX0GafYJh/oPSTofw+pWjR6
	 6+607MPawQA8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/23] mfd: Drop unused assignment of
 platform_device_id driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <8f219a01ab8fb705f3da3b2bff4b1228d657b3c0.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <8f219a01ab8fb705f3da3b2bff4b1228d657b3c0.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:08:56 +0000
Message-Id: <20260709170856.946DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The MT6397 MFD driver passes platform data for child devices (mfd_=
cell arrays) via the .data field of the of_device_id match table.
- [High] The MT6397 MFD core driver lacks a remove hook and misses PM notif=
ier unregistration on the probe error path, leading to leaked IRQ domains a=
nd dangling PM notifiers on driver unbind.
- [High] The `cros_ec_dev` probe function ignores failures when registering=
 child devices and does not unwind previously registered devices.
--

--- Patch [9]: [PATCH v3 09/23] mfd: Drop unused assignment of platform_dev=
ice_id driver data ---
commit 0aa4f9ddecd19744c7b914d2f9aa92f00f5a9d61
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Drop unused assignment of platform_device_id driver data

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index e253c753beb6d..a933cb936da6a 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }

[Severity: High]
This isn't a bug introduced by this patch, but while looking at this file,
I noticed that ec_device_probe() does not unwind previously registered
devices on failure.

If mfd_add_hotplug_devices() fails for subdevices like
cros_ec_sensorhub_cells, it logs an error but proceeds to return 0
without propagating the error or calling mfd_remove_devices():

drivers/mfd/cros_ec_dev.c:ec_device_probe() {
    ...
		retval =3D mfd_add_hotplug_devices(ec->dev,
				cros_ec_sensorhub_cells,
				ARRAY_SIZE(cros_ec_sensorhub_cells));
		if (retval)
			dev_err(ec->dev, "failed to add %s subdevice: %d\n",
				cros_ec_sensorhub_cells->name, retval);
    ...
}

Does this lead to partially initialized MFD devices, and should the probe
sequence be aborted and unwound instead?

> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME, 0 },
> +	{ DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index ea1d039477e30..7987583afc600 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -429,7 +429,7 @@ static const struct of_device_id mt6397_of_match[] =
=3D {

[Severity: High]
This is a pre-existing issue, but I noticed the mt6397_of_match
table passes platform data pointers directly through the .data field:

drivers/mfd/mt6397-core.c:
static const struct of_device_id mt6397_of_match[] =3D {
	{
		.compatible =3D "mediatek,mt6323",
		.data =3D &mt6323_core,
	},

Could passing pointers to mfd_cell arrays through match data tables cause
memory safety hazards or initialization ordering issues?

>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397", 0 },
> +	{ "mt6397" },
>  	{ },
>  };

[Severity: High]
This is a pre-existing issue, but it seems the MT6397 MFD core driver lacks=
 a
remove hook and misses PM notifier unregistration on the probe error path.

If devm_mfd_add_devices() fails during mt6397_probe(), the PM notifier
registered earlier in mt6397_irq_init() is never unregistered:

drivers/mfd/mt6397-core.c:mt6397_probe() {
    ...
	ret =3D devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
				   pmic_core->cells, pmic_core->cell_size,
				   NULL, 0, pmic->irq_domain);
	if (ret) {
		irq_domain_remove(pmic->irq_domain);
		dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
	}

	return ret;
}

Additionally, the mt6397_driver platform_driver struct does not provide a
.remove callback.  If the driver is unbound via sysfs, the devres-managed
pmic structure is freed, leaving a dangling pointer in the global PM
notifier list.

Can this trigger a use-after-free on the next system suspend or resume when
the PM core dereferences the freed pm_nb pointer?

>  MODULE_DEVICE_TABLE(platform, mt6397_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D9
