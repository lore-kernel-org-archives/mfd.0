Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90933C3437
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509928; cv=none; b=Za4/berYjLqKmU/ZNu0FLNK4q8bo3EuZMs8tmMtZstfsVRuj709KggEQ/b2PnpYGMEYP3XYlXbCzbrY2L+Dj6cpdk5nD3Qk++R7ZUheVfCQhrpuPUQkEydyYOyvDWXnvE0ZvZZ9yCW2U7PbCJUjxfAOvgsjTkq9ff6ZDCnnGF7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509928; c=relaxed/simple;
	bh=2opxawMQcBSeTSi1pA6ccAFIFbPYqCZPoi4sQ7wrzUI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rsNLoAeHHVfivfEo0VKn2yA8rV1QMEoZTjzicAq6/XynmK95EHoaoAxWrTea+TQ1pF+7E4PchjHCeHUGuuO78XmeaGKmkdVlhVlSQMldygtR0XpHevKDNQB4ZT9lh/YLNdq/dTfrvT2r8YIxLWV/Hzv/65k2SxqdUipTKSnleVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIDoif79; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIDoif79"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACE11F00A3A;
	Wed,  8 Jul 2026 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783509926;
	bh=OTLI1FGIaI5nTzfrV3LidnNntJJDaEz5V2lhhtCwgDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eIDoif79kcIGFvAZqIgSkUBDX2Mbtgv3NPJrcV4Bb6nL7IwZjZpMixUjd+PKJar7E
	 SlXNiqvWcGxIWK4+9fKIdBXnhUfFbWuKuLdy+sMkMR+PgW9/xruY9LWik6SW4sQUfM
	 AoJX/glPDGBsJxMtcWiMgLdgl0YWiuQVnN0uDpnFLq9Ie3Im0JQKcbQk98REOf38Tc
	 75wnYykYA8nkUbEBnwMGCWvfV4aNEaMAomkKtefJWcsy8tO0wzIZhnomeRfbbwk8aP
	 YrTfK9WZ1y0p+0uL4zyZTemygbuObB0RqJfYmSsxxVBG5q1XaDPikwOLuz7gRvGmrl
	 7q3iFuvtUfm7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/23] mfd: Drop unused assignment of
 platform_device_id driver data
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <6cdb070a4e773c2c8b84bd2c2dd3628545d7e7bd.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <6cdb070a4e773c2c8b84bd2c2dd3628545d7e7bd.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:25:25 +0000
Message-Id: <20260708112526.3ACE11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Global PM notifier registered in irq init is never unregistered, l=
eading to a use-after-free on probe failure or module unload.
- [Medium] The driver incorrectly passes platform data containing `mfd_cell=
` arrays directly via the `.data` field of the `of_device_id` match table.
- [Medium] The driver fails to unwind and remove registered child devices w=
hen a subsequent child device fails to register during the probe sequence.
--

--- Patch [9]: [PATCH v2 09/23] mfd: Drop unused assignment of platform_dev=
ice_id driver data ---
commit 3723bdf6f78114270ad724f7a7a9017e2dfaa8b5
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Drop unused assignment of platform_device_id driver data

The drivers explicitly set the driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments. This patch doesn't modify the compiled arrays, only
their representation in source form benefits.

> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index e253c753beb6d..a933cb936da6a 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME, 0 },
> +	{ DRV_NAME },

[Severity: Medium]
This is a pre-existing issue, but does this driver fail to unwind and
remove registered child devices when a subsequent child device fails to
register during the probe sequence?

In ec_device_probe(), the code iterates through multiple=20
mfd_add_hotplug_devices() calls and logs an error without failing the
probe or unwinding:

drivers/mfd/cros_ec_dev.c:ec_device_probe() {
    ...
    retval =3D mfd_add_hotplug_devices(ec->dev,
                cros_subdevices[i].mfd_cells,
                cros_subdevices[i].num_cells);
    if (retval)
        dev_err(ec->dev,
                "failed to add %s subdevice: %d\n",
                cros_subdevices[i].mfd_cells->name,
                retval);
    ...
}

Should the error path call mfd_remove_devices() and fail the probe?

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index ea1d039477e30..7987583afc600 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -429,7 +429,7 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);

[Severity: Medium]
This is a pre-existing issue, but does the driver incorrectly pass platform
data containing mfd_cell arrays directly via the data field of the
of_device_id match table?

The match table populates the data field with pointers to struct chip_data:

drivers/mfd/mt6397-core.c:mt6397_of_match[] =3D {
    {
        .compatible =3D "mediatek,mt6323",
        .data =3D &mt6323_core,
    },
    ...
};

And mt6397_probe() retrieves it and passes its mfd_cell arrays directly
to devm_mfd_add_devices():

drivers/mfd/mt6397-core.c:mt6397_probe() {
    ...
    ret =3D devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
                               pmic_core->cells, pmic_core->cell_size,
                               NULL, 0, pmic->irq_domain);
    ...
}

Should this driver store an ID enum in the match table data field and
select the static const mfd_cell array during probe instead?

[Severity: High]
This is a pre-existing issue, but does the global PM notifier registered
in mt6397_irq_init() ever get unregistered?

If devm_mfd_add_devices() fails in mt6397_probe() or if the driver is
unbound via sysfs, devm_kzalloc frees pmic, which includes pm_nb:

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

Since mt6397_irq_init() calls register_pm_notifier(&chip->pm_nb), returning
an error frees the memory while the PM notifier chain retains a pointer
to the freed pm_nb structure.=20

Can this lead to a use-after-free during a subsequent system suspend?

> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397", 0 },
> +	{ "mt6397" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D9
